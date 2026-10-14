#!/usr/bin/env python3
"""One-shot original/panel profiling, with explicit PMU permission diagnostics."""

import argparse
import hashlib
import json
import os
from pathlib import Path
import platform
import shutil
import statistics
import subprocess
import sys

HERE = Path(__file__).resolve().parent


def save_json(path, value):
    path.write_text(json.dumps(value, indent=2) + "\n")


def amd_config():
    # Core-scoped Zen 3 events; do not substitute Intel LLC/TLB semantics.
    groups = {
        "dc_access": [
            "ls_dc_accesses",
            "ls_dispatch.ld_dispatch",
            "ls_dispatch.store_dispatch",
            "ls_mab_alloc.loads",
        ],
        "l2": ["l2_cache_accesses_from_dc_misses", "l2_cache_misses_from_dc_misses"],
        "demand_fills": [
            "ls_dmnd_fills_from_sys.lcl_l2",
            "ls_dmnd_fills_from_sys.int_cache",
            "ls_dmnd_fills_from_sys.mem_io_local",
            "ls_dc_accesses",
        ],
        "all_fills": [
            "ls_any_fills_from_sys.lcl_l2",
            "ls_any_fills_from_sys.int_cache",
            "ls_any_fills_from_sys.mem_io_local",
            "ls_dc_accesses",
        ],
        "dtlb": ["ls_dc_accesses", "l1_dtlb_misses", "ls_tablewalker.dside"],
        "dtlb_4k": [
            "ls_l1_d_tlb_miss.tlb_reload_4k_l2_hit",
            "ls_l1_d_tlb_miss.tlb_reload_4k_l2_miss",
            "ls_dc_accesses",
        ],
        "dtlb_2m": [
            "ls_l1_d_tlb_miss.tlb_reload_2m_l2_hit",
            "ls_l1_d_tlb_miss.tlb_reload_2m_l2_miss",
            "ls_dc_accesses",
        ],
    }
    metrics = {}

    def metric(name, group, numerator, denominator, factor=1):
        metrics[name] = dict(
            group=group, numerator=numerator, denominator=denominator, factor=factor
        )

    metric("ipc", "dc_access", ["instructions"], ["cycles"])
    metric(
        "l2_dc_request_miss_percent_including_prefetch",
        "l2",
        ["l2_cache_misses_from_dc_misses"],
        ["l2_cache_accesses_from_dc_misses"],
        100,
    )
    for kind, prefix in [
        ("demand", "ls_dmnd_fills_from_sys"),
        ("all", "ls_any_fills_from_sys"),
    ]:
        group = kind + "_fills"
        metric(
            kind + "_memory_io_fills_per_1000_dc_accesses",
            group,
            [prefix + ".mem_io_local"],
            ["ls_dc_accesses"],
            1000,
        )
        metric(
            kind + "_memory_io_share_of_local_fills_percent",
            group,
            [prefix + ".mem_io_local"],
            [prefix + ".lcl_l2", prefix + ".int_cache", prefix + ".mem_io_local"],
            100,
        )
    metric(
        "l1_dtlb_misses_per_1000_dc_accesses",
        "dtlb",
        ["l1_dtlb_misses"],
        ["ls_dc_accesses"],
        1000,
    )
    metric(
        "dside_pagewalks_per_1000_dc_accesses",
        "dtlb",
        ["ls_tablewalker.dside"],
        ["ls_dc_accesses"],
        1000,
    )
    for page in ["4k", "2m"]:
        metric(
            "dtlb_" + page + "_l2_misses_per_1000_dc_accesses",
            "dtlb_" + page,
            ["ls_l1_d_tlb_miss.tlb_reload_" + page + "_l2_miss"],
            ["ls_dc_accesses"],
            1000,
        )
    return dict(
        groups=groups,
        metrics=metrics,
        note="Zen 3 core events. DC accesses/dispatched operations include speculative activity. Fill ratios are normalized event rates, not retired-load miss probabilities. int_cache includes L3 or other L2 in the CCX; mem_io_local includes DRAM or IO. Core fill events do not measure total system DRAM bandwidth. L2 requests include prefetch. AMD shared-L3 PMU and IMC are not assumed available.",
    )


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument(
        "--input", type=Path, required=True, help="existing reproduce.py output"
    )
    p.add_argument("--output", type=Path, default=Path("metrics-results"))
    p.add_argument("--cpu", type=int, default=min(os.sched_getaffinity(0)))
    p.add_argument("--sizes", type=int, nargs="+", default=[2048, 4096])
    p.add_argument("--rounds", type=int, default=3)
    p.add_argument("--iterations", type=int, default=3)
    p.add_argument("--timeout", type=int, default=300)
    p.add_argument("--memory", choices=["auto", "skip"], default="auto")
    args = p.parse_args()
    if args.cpu not in os.sched_getaffinity(0):
        p.error("requested CPU is not in process affinity")
    if args.rounds < 1 or args.iterations < 1:
        p.error("rounds and iterations must be positive")
    root, out = args.input.resolve(), args.output.resolve()
    if out.exists() and any(out.iterdir()):
        p.error("output must be new or empty; preserve existing measurements")
    out.mkdir(parents=True, exist_ok=True)
    for size in args.sizes:
        d = root / f"{size}x{size}x{size}"
        for relative in [
            "A.npy",
            "B.npy",
            "01_original/module.vmfb",
            "02_panel_pack/module.vmfb",
        ]:
            if not (d / relative).is_file():
                p.error(f"missing artifact: {d / relative}")
    save_json(
        out / "artifact-metadata.json",
        {
            "source_metadata": json.loads((root / "metadata.json").read_text()),
            "module_sha256": {
                f"{size}/{variant}": hashlib.sha256(
                    (
                        root / f"{size}x{size}x{size}" / variant / "module.vmfb"
                    ).read_bytes()
                ).hexdigest()
                for size in args.sizes
                for variant in ["01_original", "02_panel_pack"]
            },
        },
    )
    commands = []

    def capture(label, command):
        commands.append(command)
        proc = subprocess.run(
            command, capture_output=True, text=True, timeout=args.timeout
        )
        (out / (label + ".txt")).write_text(proc.stdout + proc.stderr)
        return proc

    status = dict(core_pmu="pending", memory="pending", timing="pending")
    hardware = dict(
        platform=platform.platform(),
        affinity=sorted(os.sched_getaffinity(0)),
        cpu=args.cpu,
        python=sys.version,
    )
    for path in [
        "/proc/cpuinfo",
        "/proc/self/status",
        "/proc/sys/kernel/perf_event_paranoid",
        "/sys/kernel/mm/transparent_hugepage/enabled",
        f"/sys/devices/system/cpu/cpu{args.cpu}/topology/thread_siblings_list",
        f"/sys/devices/system/cpu/cpu{args.cpu}/cpufreq/scaling_governor",
    ]:
        if Path(path).exists():
            hardware[path] = Path(path).read_text()
    save_json(out / "hardware.json", hardware)
    capture("lscpu", ["lscpu"])
    pmu_args = []
    available = False
    if shutil.which("perf"):
        capture("perf-version", ["perf", "--version"])
        events = capture("perf-events", ["perf", "list", "--details"]).stdout
        pmu = (
            "cpu_core"
            if Path("/sys/bus/event_source/devices/cpu_core").exists()
            else "cpu"
        )
        pmu_args = ["--pmu", pmu]
        if "AuthenticAMD" in hardware.get("/proc/cpuinfo", ""):
            config = amd_config()
            missing = [
                e
                for group in config["groups"].values()
                for e in group
                if e not in events
            ]
            if missing:
                raise RuntimeError(
                    f"Zen 3 event set unavailable on this AMD CPU: {missing}; no raw encoding guessed"
                )
            cfg = out / "event-config.json"
            save_json(cfg, config)
            pmu_args += ["--event-config", str(cfg)]
        probe = capture(
            "perf-preflight",
            [
                "taskset",
                "-c",
                str(args.cpu),
                "perf",
                "stat",
                "-e",
                "{cycles:u,instructions:u}",
                "--",
                "sleep",
                "0.1",
            ],
        )
        available = probe.returncode == 0
        if not available:
            status["core_pmu"] = (
                "blocked: perf preflight failed; see perf-preflight.txt (no counters fabricated)"
            )
    else:
        status["core_pmu"] = "unavailable: install Linux perf first"

    def run(label, script, extra):
        command = [sys.executable, "-u", str(HERE / script), *extra]
        commands.append(command)
        print("Running:", " ".join(command), flush=True)
        with (out / (label + ".log")).open("w") as log:
            proc = subprocess.Popen(
                command, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True
            )
            for line in proc.stdout:
                print(line, end="", flush=True)
                log.write(line)
                log.flush()
            if proc.wait():
                raise RuntimeError(f"{label} failed; inspect {label}.log")

    common = [
        "--input",
        str(root),
        "--cpu",
        str(args.cpu),
        "--rounds",
        str(args.rounds),
        "--iterations",
        str(args.iterations),
    ]
    try:
        if available:
            run(
                "pmu",
                "profile_perf.py",
                common
                + [
                    "--sizes",
                    *map(str, args.sizes),
                    "--output",
                    str(out / "pmu"),
                    "--timeout",
                    str(args.timeout),
                    *pmu_args,
                ],
            )
            status["core_pmu"] = "complete"
        # Separate timing windows avoid comparing wall times across different PMU groups.
        timing = []
        cases = [(s, v) for s in args.sizes for v in ["01_original", "02_panel_pack"]]
        for rnd in range(args.rounds):
            for size, variant in cases if rnd % 2 == 0 else cases[::-1]:
                d = root / f"{size}x{size}x{size}"
                target = out / f"timing-{size}-{variant}-{rnd}.json"
                proc = capture(
                    f"timing-{size}-{variant}-{rnd}",
                    [
                        sys.executable,
                        str(HERE / "perf_worker.py"),
                        "--module",
                        str(d / variant / "module.vmfb"),
                        "--a",
                        str(d / "A.npy"),
                        "--b",
                        str(d / "B.npy"),
                        "--cpu",
                        str(args.cpu),
                        "--iterations",
                        str(args.iterations),
                        "--output",
                        str(target),
                    ],
                )
                if proc.returncode:
                    raise RuntimeError(proc.stderr)
                row = dict(
                    size=size,
                    variant=variant,
                    round=rnd,
                    **json.loads(target.read_text()),
                )
                timing.append(row)
                save_json(out / "timing-records.json", timing)
                print(
                    f"timing {rnd + 1}/{args.rounds}: {size} {variant} {row['ms_per_gemm']:.2f} ms",
                    flush=True,
                )
        summary = []
        for s, v in cases:
            values = [
                r["ms_per_gemm"] for r in timing if r["size"] == s and r["variant"] == v
            ]
            summary.append(
                dict(
                    size=s,
                    variant=v,
                    median_ms=statistics.median(values),
                    min_ms=min(values),
                    max_ms=max(values),
                )
            )
        save_json(out / "timing-summary.json", summary)
        status["timing"] = "complete"
        if args.memory == "skip":
            status["memory"] = "skipped by request"
        elif (
            available
            and list(
                Path("/sys/bus/event_source/devices").glob("uncore_imc_free_running_*")
            )
            and args.sizes == [2048, 4096]
        ):
            try:
                run(
                    "memory",
                    "profile_memory.py",
                    common + ["--output", str(out / "memory")],
                )
                status["memory"] = "complete"
            except RuntimeError as exc:
                status["memory"] = str(exc)
        else:
            status["memory"] = (
                "unavailable: supported Intel IMC free-running PMU not exposed, or core perf blocked; no DRAM bandwidth inferred"
            )
    except Exception as exc:
        status["error"] = str(exc)
        raise
    finally:
        save_json(out / "commands.json", commands)
        save_json(out / "status.json", status)
    print(json.dumps(status, indent=2), flush=True)
    print("Results:", out, flush=True)


if __name__ == "__main__":
    main()
