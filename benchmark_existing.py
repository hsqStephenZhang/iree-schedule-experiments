#!/usr/bin/env python3
"""Rerun native benchmarks on previously compiled four-version artifacts."""

import argparse
import hashlib
import json
import os
from pathlib import Path
import statistics
import subprocess
from host_platform import pin_cpu
from reproduce import VARIANTS
from iree.runtime.benchmark import benchmark_exe


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--input", type=Path, required=True, help="previous reproduce.py output"
    )
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--pin-cpu", type=int)
    parser.add_argument("--repetitions", type=int, default=12)
    parser.add_argument("--min-time", default="3x")
    args = parser.parse_args()
    if args.repetitions < 1:
        parser.error("--repetitions must be positive")
    try:
        args.pin_cpu = pin_cpu(args.pin_cpu)
    except ValueError as exc:
        parser.error(str(exc))
    source = args.input.resolve()
    output = args.output.resolve()
    output.mkdir(parents=True, exist_ok=True)
    metadata = json.loads((source / "metadata.json").read_text())
    metadata["source_logical_cpu"] = metadata.get("logical_cpu")
    metadata["logical_cpu"] = args.pin_cpu
    metadata["affinity_pinned"] = args.pin_cpu is not None
    metadata = dict(
        metadata,
        rounds=args.repetitions,
        minimum_time=args.min_time,
        order="cyclic rotations; reverse base order every four rounds",
        compiled_modules="reused without recompilation",
    )
    metadata["module_sha256"] = {
        f"{size}/{variant}": hashlib.sha256(
            (source / f"{size}x{size}x{size}" / variant / "module.vmfb").read_bytes()
        ).hexdigest()
        for size in metadata["sizes"]
        for variant in VARIANTS
    }
    (output / "metadata.json").write_text(json.dumps(metadata, indent=2))
    previous = json.loads((source / "results.json").read_text())["results"]
    results = []
    for size in metadata["sizes"]:
        d = source / f"{size}x{size}x{size}"
        dest = output / f"{size}x{size}x{size}"
        rows = {
            r["variant"]: dict(r, times_ms=[]) for r in previous if r["size"] == size
        }
        for rnd in range(args.repetitions):
            base = VARIANTS if (rnd // 4) % 2 == 0 else VARIANTS[::-1]
            shift = rnd % 4
            order = base[shift:] + base[:shift]
            for variant in order:
                v = dest / variant
                v.mkdir(parents=True, exist_ok=True)
                report = v / f"benchmark-{rnd}.json"
                command = [
                    benchmark_exe(),
                    f"--module={d}/{variant}/module.vmfb",
                    "--function=gemm",
                    "--device=local-sync",
                    f"--input=@{d}/A.npy",
                    f"--input=@{d}/B.npy",
                    f"--benchmark_min_time={args.min_time}",
                    "--benchmark_repetitions=1",
                    f"--benchmark_out={report}",
                    "--benchmark_out_format=json",
                ]
                p = subprocess.run(command, capture_output=True, text=True, check=True)
                (v / f"benchmark-{rnd}.log").write_text(p.stdout + p.stderr)
                (v / f"benchmark-{rnd}.command.json").write_text(
                    json.dumps(command, indent=2)
                )
                records = [
                    r
                    for r in json.loads(report.read_text())["benchmarks"]
                    if r.get("run_type", "iteration") == "iteration"
                ]
                if len(records) != 1 or records[0].get("error_occurred"):
                    raise RuntimeError(records)
                r = records[0]
                rows[variant]["times_ms"].append(
                    r["real_time"]
                    * {"ns": 1e-6, "us": 1e-3, "ms": 1, "s": 1e3}[r["time_unit"]]
                )
            print(f"{size}: round {rnd + 1}/{args.repetitions}", flush=True)
        baseline = statistics.median(rows[VARIANTS[0]]["times_ms"])
        for row in rows.values():
            row["median_ms"] = statistics.median(row["times_ms"])
            row["speedup_vs_original"] = baseline / row["median_ms"]
            row["gflops"] = 2 * size**3 / (row["median_ms"] * 1e6)
            print(
                f"{size} {row['variant']}: {row['median_ms']:.3f} ms, "
                f"{row['speedup_vs_original']:.3f}x",
                flush=True,
            )
        results.extend(rows.values())
        (output / "results.json").write_text(
            json.dumps({"metadata": metadata, "results": results}, indent=2)
        )


if __name__ == "__main__":
    main()
