#!/usr/bin/env python3
"""Collect warmed GEMM timing and available Linux PMU events on the current host."""

import argparse
import hashlib
import json
from pathlib import Path
import platform
import re
import shutil
import statistics
import subprocess
import sys

from host_platform import hardware_info, native_pmu, pin_cpu
from pmu_profiles import select_profile
from profile_perf import parse_counts

HERE = Path(__file__).resolve().parent
VARIANTS = [
    "01_original",
    "02_panel_pack",
    "03_panel_pack_kernel",
    "04_full_pack_kernel",
]


def save_json(path, value):
    path.write_text(json.dumps(value, indent=2) + "\n")


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument(
        "--input", type=Path, required=True, help="existing reproduce.py output"
    )
    p.add_argument("--output", type=Path, default=Path("metrics-results"))
    p.add_argument(
        "--pin-cpu",
        "--cpu",
        dest="cpu",
        type=int,
        help="logical CPU; automatic on Linux, unpinned on macOS",
    )
    p.add_argument(
        "--sizes", type=int, nargs="+", help="default: sizes from input metadata"
    )
    p.add_argument("--variants", nargs="+", choices=VARIANTS, default=VARIANTS[:2])
    p.add_argument("--rounds", type=int, default=3)
    p.add_argument("--iterations", type=int, default=3)
    p.add_argument("--timeout", type=int, default=300)
    p.add_argument("--backend", choices=["auto", "perf", "timing"], default="auto")
    p.add_argument("--memory", choices=["auto", "skip"], default="auto")
    args = p.parse_args()
    if args.rounds < 1 or args.iterations < 1:
        p.error("rounds and iterations must be positive")
    try:
        args.cpu = pin_cpu(args.cpu)
    except ValueError as exc:
        p.error(str(exc))
    root, out = args.input.resolve(), args.output.resolve()
    source_metadata = json.loads((root / "metadata.json").read_text())
    args.sizes = args.sizes or source_metadata["sizes"]
    if out.exists() and any(out.iterdir()):
        p.error("output must be new or empty; preserve existing measurements")
    for size in args.sizes:
        d = root / f"{size}x{size}x{size}"
        for relative in [
            "A.npy",
            "B.npy",
            *(v + "/module.vmfb" for v in args.variants),
        ]:
            if not (d / relative).is_file():
                p.error(f"missing artifact: {d / relative}")
    out.mkdir(parents=True, exist_ok=True)
    cases = [(s, v) for s in args.sizes for v in args.variants]
    save_json(
        out / "artifact-metadata.json",
        dict(
            source_metadata=source_metadata,
            module_sha256={
                f"{s}/{v}": hashlib.sha256(
                    (root / f"{s}x{s}x{s}" / v / "module.vmfb").read_bytes()
                ).hexdigest()
                for s, v in cases
            },
        ),
    )
    hardware = hardware_info(args.cpu)
    hardware["python"] = sys.version
    save_json(out / "hardware.json", hardware)
    cpu_args = ["--cpu", str(args.cpu)] if args.cpu is not None else []
    commands = []
    status = dict(
        core_pmu="pending",
        memory="pending",
        timing="pending",
        backend_requested=args.backend,
    )

    def capture(label, command):
        commands.append(command)
        proc = subprocess.run(
            command, capture_output=True, text=True, timeout=args.timeout
        )
        (out / (label + ".txt")).write_text(proc.stdout + proc.stderr)
        return proc

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
        *cpu_args,
        "--rounds",
        str(args.rounds),
        "--iterations",
        str(args.iterations),
        "--sizes",
        *map(str, args.sizes),
        "--variants",
        *args.variants,
    ]
    available = False
    try:
        if args.backend == "timing":
            status["core_pmu"] = "skipped: timing backend requested"
        elif platform.system() != "Linux":
            status["core_pmu"] = (
                "unavailable: Linux perf backend does not run on this platform; collecting timing only"
            )
        elif not shutil.which("perf"):
            status["core_pmu"] = (
                "unavailable: install Linux perf to collect hardware events; collecting timing only"
            )
        else:
            capture("perf-version", ["perf", "--version"])
            listing = capture("perf-events", ["perf", "list", "--details"]).stdout
            events = set(re.findall(r"^  ([\w.]+)(?:\s|$)", listing, re.M))
            config = select_profile(hardware.get("/proc/cpuinfo", ""), events)
            pmu = native_pmu(args.cpu)
            if pmu is None:
                config = select_profile("", set())
            status["pmu"] = pmu or "generic hardware aliases"
            probe = capture(
                "perf-preflight",
                [
                    "perf",
                    "stat",
                    "-e",
                    "{cycles:u,instructions:u}",
                    "--",
                    "sleep",
                    "0.1",
                ],
            )
            if probe.returncode:
                status["core_pmu"] = (
                    "blocked: perf preflight failed; see perf-preflight.txt; no counters fabricated"
                )
            else:
                # Advertising an event does not guarantee its group can be scheduled.
                for group, selected in list(config["groups"].items()):
                    report = out / f"probe-{group}.csv"
                    event_group = (
                        "{"
                        + ",".join(
                            f"{pmu}/{e}/u" if pmu else f"{e}:u"
                            for e in ["cycles", "instructions", *selected]
                        )
                        + "}"
                    )
                    probe = capture(
                        f"probe-{group}",
                        [
                            "perf",
                            "stat",
                            "-x",
                            ";",
                            "-o",
                            str(report),
                            "-e",
                            event_group,
                            "--",
                            "sleep",
                            "0.1",
                        ],
                    )
                    try:
                        if probe.returncode:
                            raise RuntimeError(probe.stderr)
                        counts = parse_counts(report)
                        if not counts:
                            raise RuntimeError("empty counter report")
                    except (RuntimeError, ValueError) as exc:
                        config["unavailable_groups"][group] = dict(
                            reason=str(exc), events=selected
                        )
                        del config["groups"][group]
                config["metrics"] = {
                    k: v
                    for k, v in config["metrics"].items()
                    if v["group"] in config["groups"]
                }
                available = bool(config["groups"])
                status["core_pmu"] = (
                    "pending"
                    if available
                    else "unavailable: no counter groups passed preflight"
                )
            save_json(out / "event-config.json", config)
            if available:
                try:
                    run(
                        "pmu",
                        "profile_perf.py",
                        common
                        + [
                            "--output",
                            str(out / "pmu"),
                            "--timeout",
                            str(args.timeout),
                            "--pmu",
                            pmu or "",
                            "--event-config",
                            str(out / "event-config.json"),
                        ],
                    )
                    status["core_pmu"] = "complete"
                except RuntimeError as exc:
                    status["core_pmu"] = str(exc)
                status["unavailable_groups"] = config["unavailable_groups"]

        # Always produce independent timings, including on macOS or blocked containers.
        records = []
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
                        *cpu_args,
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
                records.append(row)
                save_json(out / "timing-records.json", records)
                print(
                    f"timing {rnd + 1}/{args.rounds}: {size} {variant} {row['ms_per_gemm']:.2f} ms",
                    flush=True,
                )
        summary = []
        for s, v in cases:
            values = [
                r["ms_per_gemm"]
                for r in records
                if r["size"] == s and r["variant"] == v
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
        if args.memory == "skip" or args.backend == "timing":
            status["memory"] = "skipped by request"
        elif available and list(
            Path("/sys/bus/event_source/devices").glob("uncore_imc_free_running_*")
        ):
            try:
                run(
                    "memory",
                    "profile_memory.py",
                    common
                    + ["--output", str(out / "memory"), "--timeout", str(args.timeout)],
                )
                status["memory"] = "complete"
            except RuntimeError as exc:
                status["memory"] = str(exc)
        else:
            status["memory"] = (
                "unavailable: supported Intel IMC PMU not exposed or perf unavailable; no DRAM bandwidth inferred"
            )
        if args.backend == "perf" and status["core_pmu"] != "complete":
            raise RuntimeError(
                "Explicit perf backend could not complete; timings and diagnostics are saved"
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
