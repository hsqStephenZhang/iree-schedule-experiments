#!/usr/bin/env python3
"""Detached-friendly smoke + full experiment launcher with persistent status files."""

import argparse
from datetime import datetime, timezone
import json
import os
from pathlib import Path
import socket
import subprocess
import sys


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--output", type=Path, required=True)
    p.add_argument("--sizes", type=int, nargs="+", default=[2048, 4096])
    p.add_argument("--rounds", type=int, default=10)
    p.add_argument("--iterations", type=int, default=3)
    p.add_argument("--pin-cpu", type=int)
    p.add_argument("--target-cpu", default="host")
    args = p.parse_args()
    root = args.output.resolve()
    root.mkdir(parents=True, exist_ok=True)
    status = {"hostname": socket.gethostname(), "pid": os.getpid(), "started_at": datetime.now(timezone.utc).isoformat(), "state": "running", "commands": []}

    def save():
        tmp = root / "job-status.json.tmp"
        tmp.write_text(json.dumps(status, indent=2))
        tmp.replace(root / "job-status.json")

    save()
    extra = ["--target-cpu", args.target_cpu]
    if args.pin_cpu is not None:
        extra += ["--pin-cpu", str(args.pin_cpu)]
    script = Path(__file__).with_name("fixed_weights.py").resolve()
    for stage, sizes, rounds, iterations in [("smoke", [512], 1, 1), ("full", args.sizes, args.rounds, args.iterations)]:
        command = [sys.executable, "-u", str(script), "--sizes", *map(str, sizes), "--rounds", str(rounds), "--iterations", str(iterations), "--output", str(root / stage), *extra]
        status.update(stage=stage)
        status["commands"].append(command)
        save()
        with (root / f"{stage}.log").open("w") as log:
            result = subprocess.run(command, stdout=log, stderr=subprocess.STDOUT, cwd=script.parent)
        status[stage + "_exit_code"] = result.returncode
        if result.returncode:
            status.update(state="failed", finished_at=datetime.now(timezone.utc).isoformat())
            save()
            return result.returncode
    status.update(state="complete", finished_at=datetime.now(timezone.utc).isoformat())
    save()
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
