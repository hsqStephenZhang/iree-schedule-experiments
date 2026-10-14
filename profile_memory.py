#!/usr/bin/env python3
"""Read Intel IMC DRAM traffic in controlled GEMM windows (system-wide)."""

import argparse
import csv
import json
import os
from pathlib import Path
import statistics
import subprocess
import sys


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--input", type=Path, required=True)
    p.add_argument("--output", type=Path, required=True)
    p.add_argument("--cpu", type=int, default=0)
    p.add_argument("--rounds", type=int, default=3)
    p.add_argument("--iterations", type=int, default=3)
    args = p.parse_args()
    source = args.input.resolve()
    output = args.output.resolve()
    output.mkdir(parents=True, exist_ok=True)
    devices = sorted(
        Path("/sys/bus/event_source/devices").glob("uncore_imc_free_running_*")
    )
    events = [
        f"{device.name}/{direction}/"
        for device in devices
        for direction in ["data_read", "data_write"]
    ]
    if not events:
        raise RuntimeError("Intel IMC free-running counters unavailable")
    worker = Path(__file__).resolve().with_name("perf_worker.py")
    cases = [(s, v) for s in [2048, 4096] for v in ["01_original", "02_panel_pack"]]
    sequence = (
        [(4096, "01_original", 2.0)]
        + [
            (s, v, 0.0)
            for rnd in range(args.rounds)
            for s, v in (cases if rnd % 2 == 0 else cases[::-1])
        ]
        + [(4096, "01_original", 2.0)]
    )
    records = []
    for index, (size, variant, idle) in enumerate(sequence):
        dest = output / f"{index:02d}-{size}-{variant}"
        dest.mkdir(exist_ok=True)
        d = source / f"{size}x{size}x{size}"
        ctl_r, ctl_w = os.pipe()
        ack_r, ack_w = os.pipe()
        command = [
            "perf",
            "stat",
            "-a",
            "-C",
            str(args.cpu),
            "-D",
            "-1",
            "--control",
            f"fd:{ctl_r},{ack_w}",
            "-x",
            ";",
            "-o",
            str(dest / "counts.csv"),
            "-e",
            ",".join(events),
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
            "--idle-seconds",
            str(idle),
            "--control-fd",
            str(ctl_w),
            "--ack-fd",
            str(ack_r),
            "--output",
            str(dest / "timing.json"),
        ]
        try:
            proc = subprocess.run(
                command,
                pass_fds=(ctl_r, ctl_w, ack_r, ack_w),
                capture_output=True,
                text=True,
                timeout=120,
            )
        finally:
            for fd in [ctl_r, ctl_w, ack_r, ack_w]:
                os.close(fd)
        (dest / "command.json").write_text(json.dumps(command, indent=2) + "\n")
        (dest / "perf.log").write_text(proc.stdout + proc.stderr)
        if proc.returncode:
            raise RuntimeError(proc.stderr)
        traffic = {"data_read": 0.0, "data_write": 0.0}
        for row in csv.reader(
            (dest / "counts.csv").read_text().splitlines(), delimiter=";"
        ):
            if len(row) < 5 or row[0].startswith("#"):
                continue
            if "<" in row[0] or row[1] != "MiB" or float(row[4]) < 99:
                raise RuntimeError(f"counter unsupported or scaled unexpectedly: {row}")
            direction = "data_read" if "/data_read/" in row[2] else "data_write"
            traffic[direction] += float(row[0])
        timing = json.loads((dest / "timing.json").read_text())
        seconds = timing["elapsed_ns"] / 1e9
        record = {
            "size": size,
            "variant": variant,
            "idle": bool(idle),
            "timing": timing,
            "read_mib": traffic["data_read"],
            "write_mib": traffic["data_write"],
            "read_mib_per_second": traffic["data_read"] / seconds,
            "write_mib_per_second": traffic["data_write"] / seconds,
        }
        records.append(record)
        (output / "records.json").write_text(json.dumps(records, indent=2) + "\n")
        print(
            index,
            size,
            variant,
            "idle" if idle else "gemm",
            f"{traffic['data_read']:.2f} MiB read, {traffic['data_write']:.2f} MiB write",
            flush=True,
        )
    background = {
        d: statistics.median([r[f"{d}_mib_per_second"] for r in records if r["idle"]])
        for d in ["read", "write"]
    }
    summary = []
    for size, variant in cases:
        rows = [
            r
            for r in records
            if not r["idle"] and r["size"] == size and r["variant"] == variant
        ]
        row = {"size": size, "variant": variant}
        for direction in ["read", "write"]:
            raw = [r[f"{direction}_mib"] / args.iterations for r in rows]
            adjusted = [
                max(
                    0,
                    r[f"{direction}_mib"]
                    - background[direction] * r["timing"]["elapsed_ns"] / 1e9,
                )
                / args.iterations
                for r in rows
            ]
            row[f"{direction}_mib_per_gemm"] = statistics.median(raw)
            row[f"{direction}_mib_per_gemm_background_adjusted"] = statistics.median(
                adjusted
            )
        row["ms_per_gemm"] = statistics.median(
            [r["timing"]["ms_per_gemm"] for r in rows]
        )
        summary.append(row)
    (output / "summary.json").write_text(
        json.dumps(
            {
                "scope": "system-wide IMC traffic during warm GEMM windows; includes background OS activity",
                "background_mib_per_second": background,
                "events": events,
                "rounds": args.rounds,
                "iterations": args.iterations,
                "summary": summary,
            },
            indent=2,
        )
        + "\n"
    )
    print(json.dumps(summary, indent=2), flush=True)


if __name__ == "__main__":
    main()
