#!/usr/bin/env python3
"""Profile original/panel GEMM with grouped user-space PMU counters without multiplexing."""

import argparse
import csv
import hashlib
import json
import os
import re
from pathlib import Path
import statistics
import subprocess
import sys
from host_platform import native_pmu, perf_event_group, pin_cpu
from pmu_profiles import select_profile


def parse_counts(path):
    result = {}
    for row in csv.reader(path.read_text().splitlines(), delimiter=";"):
        if len(row) < 5 or row[0].startswith("#"):
            continue
        if "<" in row[0]:
            raise RuntimeError(f"counter not measured: {row}")
        name = re.sub(
            r"^[^/]+/(.+)/u$", lambda match: match.group(1), row[2]
        ).removesuffix(":u")
        running = float(row[4])
        if running < 99.0:
            raise RuntimeError(f"counter multiplexed ({running}%): {row}")
        result[name] = {
            "count": float(row[0]),
            "runtime_ns": float(row[3]),
            "running_percent": running,
        }
    return result


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument(
        "--input",
        type=Path,
        required=True,
        help="reproduce.py artifacts with A.npy/B.npy and VMFBs",
    )
    p.add_argument("--output", type=Path, required=True)
    p.add_argument("--sizes", type=int, nargs="+", default=[2048, 4096])
    p.add_argument("--pin-cpu", "--cpu", dest="cpu", type=int)
    p.add_argument("--variants", nargs="+", default=["01_original", "02_panel_pack"])
    p.add_argument("--rounds", type=int, default=3)
    p.add_argument("--iterations", type=int, default=3)
    p.add_argument("--pmu", default=None)
    p.add_argument(
        "--event-config", type=Path, help="JSON groups and ratio definitions"
    )
    p.add_argument("--timeout", type=int, default=300)
    args = p.parse_args()
    if args.rounds < 1 or args.iterations < 1:
        p.error("rounds and iterations must be positive")
    args.cpu = pin_cpu(args.cpu)
    if args.pmu is None:
        args.pmu = native_pmu(args.cpu) or ""
    descriptions = subprocess.check_output(["perf", "list", "--details"], text=True)
    cpuinfo = Path("/proc/cpuinfo")
    config = (
        json.loads(args.event_config.read_text())
        if args.event_config
        else select_profile(
            cpuinfo.read_text() if cpuinfo.exists() else "",
            set(re.findall(r"^  ([\w.]+)(?:\s|$)", descriptions, re.M)),
        )
    )
    groups = config["groups"]
    root = args.input.resolve()
    output = args.output.resolve()
    output.mkdir(parents=True, exist_ok=True)
    worker = Path(__file__).resolve().with_name("perf_worker.py")
    cases = [(size, v) for size in args.sizes for v in args.variants]
    metadata = {
        "perf": subprocess.check_output(["perf", "--version"], text=True).strip(),
        "pmu": args.pmu,
        "logical_cpu": args.cpu,
        "rounds": args.rounds,
        "iterations": args.iterations,
        "source_metadata": json.loads((root / "metadata.json").read_text()),
        "event_groups": groups,
        "scope": "user-space counters enabled after inputs uploaded and one warmup, disabled after GEMM calls; local-sync; no input transfer or output readback",
        "note": "DTLB events count speculative demand activity; division by retired loads/stores is a normalized event rate, not an exact probability. Stall cycle events overlap and must not be summed.",
        "module_sha256": {
            f"{s}/{v}": hashlib.sha256(
                (root / f"{s}x{s}x{s}" / v / "module.vmfb").read_bytes()
            ).hexdigest()
            for s, v in cases
        },
    }
    selected = {event for events in groups.values() for event in events}
    definitions = {}
    for event in selected:
        for match in re.finditer(
            r"^  " + re.escape(event) + r"\n", descriptions, flags=re.M
        ):
            block = descriptions[match.start() :]
            end = re.search(r"^  \S", block[3:], flags=re.M)
            if end:
                block = block[: end.start() + 3]
            if args.pmu in block:
                definitions[event] = block.strip()
                break
    if config:
        metadata["note"] = config.get(
            "note", "See event definitions for counter semantics."
        )
        metadata["metric_definitions"] = config["metrics"]
    metadata["event_definitions_from_perf_list"] = definitions
    for name, path in [
        ("governor", f"/sys/devices/system/cpu/cpu{args.cpu}/cpufreq/scaling_governor"),
        ("transparent_hugepage", "/sys/kernel/mm/transparent_hugepage/enabled"),
    ]:
        if Path(path).exists():
            metadata[name] = Path(path).read_text().strip()
    (output / "metadata.json").write_text(json.dumps(metadata, indent=2) + "\n")
    records = []
    for rnd in range(args.rounds):
        for group, events in groups.items():
            for size, variant in cases if rnd % 2 == 0 else cases[::-1]:
                d = root / f"{size}x{size}x{size}"
                dest = output / f"{size}x{size}x{size}" / variant / group
                dest.mkdir(parents=True, exist_ok=True)
                report = dest / f"round-{rnd}.csv"
                timing = dest / f"round-{rnd}-timing.json"
                ctl_r, ctl_w = os.pipe()
                ack_r, ack_w = os.pipe()
                selected = ["cycles", "instructions", *events]
                event_group = perf_event_group(args.pmu, selected)
                command = [
                    "perf",
                    "stat",
                    "-D",
                    "-1",
                    "--control",
                    f"fd:{ctl_r},{ack_w}",
                    "-x",
                    ";",
                    "-o",
                    str(report),
                    "-e",
                    event_group,
                    "--",
                    sys.executable,
                    str(worker),
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
                    "--control-fd",
                    str(ctl_w),
                    "--ack-fd",
                    str(ack_r),
                    "--output",
                    str(timing),
                ]
                try:
                    proc = subprocess.run(
                        command,
                        pass_fds=(ctl_r, ctl_w, ack_r, ack_w),
                        capture_output=True,
                        text=True,
                        timeout=args.timeout,
                    )
                finally:
                    for fd in [ctl_r, ctl_w, ack_r, ack_w]:
                        os.close(fd)
                (dest / f"round-{rnd}.log").write_text(proc.stdout + proc.stderr)
                (dest / f"round-{rnd}-command.json").write_text(
                    json.dumps(command, indent=2) + "\n"
                )
                if proc.returncode:
                    raise RuntimeError(f"{dest}: {proc.stderr}")
                counts = parse_counts(report)
                times = json.loads(timing.read_text())
                row = {
                    "size": size,
                    "variant": variant,
                    "group": group,
                    "round": rnd,
                    "counts": counts,
                    "timing": times,
                }
                records.append(row)
                (output / "records.json").write_text(
                    json.dumps(records, indent=2) + "\n"
                )
                print(
                    f"{rnd + 1}/{args.rounds} {group} {size} {variant}: {times['ms_per_gemm']:.2f} ms; counters running 100%",
                    flush=True,
                )
    summary = []
    for size, variant in cases:
        rows = [r for r in records if r["size"] == size and r["variant"] == variant]
        by_group = {g: [r for r in rows if r["group"] == g] for g in groups}
        result = {
            "size": size,
            "variant": variant,
            "metrics": {},
            "event_counts_per_gemm": {},
        }
        for event in {
            "cycles",
            "instructions",
            *(e for es in groups.values() for e in es),
        }:
            values = [
                r["counts"][event]["count"] / args.iterations
                for r in rows
                if event in r["counts"]
            ]
            result["event_counts_per_gemm"][event] = {
                "median": statistics.median(values),
                "min": min(values),
                "max": max(values),
            }
        metrics = {}
        for name, spec in config["metrics"].items():

            def compute(c, spec=spec):
                numerator = sum(c[e]["count"] for e in spec["numerator"])
                denominator = sum(c[e]["count"] for e in spec["denominator"])
                return (
                    spec.get("factor", 1) * numerator / denominator
                    if denominator
                    else 0.0
                )

            metrics[name] = (spec["group"], compute)
        for name, (group, fn) in metrics.items():
            values = [fn(r["counts"]) for r in by_group[group]]
            result["metrics"][name] = {
                "median": statistics.median(values),
                "min": min(values),
                "max": max(values),
            }
        values = [r["timing"]["ms_per_gemm"] for r in rows]
        result["ms_per_gemm"] = {
            "median": statistics.median(values),
            "min": min(values),
            "max": max(values),
        }
        summary.append(result)
    (output / "summary.json").write_text(json.dumps(summary, indent=2) + "\n")
    print(json.dumps(summary, indent=2), flush=True)


if __name__ == "__main__":
    main()
