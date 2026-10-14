#!/usr/bin/env python3
"""Run only preloaded GEMM calls inside a perf stat control window."""

import argparse
import gc
import json
import os
from pathlib import Path
import time
from host_platform import pin_cpu

os.environ["OPENBLAS_NUM_THREADS"] = "1"
os.environ["OMP_NUM_THREADS"] = "1"


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--module", type=Path, required=True)
    p.add_argument("--a", type=Path, required=True)
    p.add_argument("--b", type=Path, required=True)
    p.add_argument("--iterations", type=int, default=3)
    p.add_argument("--pin-cpu", "--cpu", dest="cpu", type=int)
    p.add_argument("--control-fd", type=int)
    p.add_argument("--ack-fd", type=int)
    p.add_argument("--output", type=Path, required=True)
    p.add_argument("--idle-seconds", type=float, default=0)
    args = p.parse_args()
    try:
        args.cpu = pin_cpu(args.cpu)
    except ValueError as exc:
        p.error(str(exc))
    import numpy as np
    import iree.runtime as rt

    config = rt.Config("local-sync")
    module = rt.VmModule.mmap(config.vm_instance, str(args.module))
    ctx = rt.SystemContext(config=config)
    ctx.add_vm_module(module)
    a = rt.asdevicearray(config.device, np.load(args.a))
    b = rt.asdevicearray(config.device, np.load(args.b))
    fn = ctx.modules.module.gemm
    # No input transfer or result readback occurs in the measured loop.
    result = fn(a, b)
    result = None
    gc.collect()
    ack = os.fdopen(args.ack_fd, "rb", buffering=0) if args.ack_fd is not None else None

    def control(command):
        if ack is None:
            return
        os.write(args.control_fd, (command + "\n").encode())
        response = ack.readline()
        if response.lstrip(b"\x00") != b"ack\n":
            raise RuntimeError(f"perf control failed: {response!r}")

    huge_before = None
    if Path("/proc/self/smaps").exists():
        huge_before = sum(
            int(line.split()[1])
            for line in Path("/proc/self/smaps").read_text().splitlines()
            if line.startswith("AnonHugePages:")
        )
    control("enable")
    start = time.perf_counter_ns()
    if args.idle_seconds:
        time.sleep(args.idle_seconds)
    else:
        for _ in range(args.iterations):
            result = fn(a, b)
            result = None
    elapsed = time.perf_counter_ns() - start
    control("disable")
    args.output.write_text(
        json.dumps(
            {
                "iterations": args.iterations,
                "idle_seconds": args.idle_seconds,
                "elapsed_ns": elapsed,
                "ms_per_gemm": elapsed / args.iterations / 1e6,
                "logical_cpu": args.cpu,
                "anon_huge_pages_kb_before": huge_before,
                "scope": "preloaded device inputs; one untimed warmup; GEMM invocation and output lifetime, no readback; counter scope specified by external perf command",
            },
            indent=2,
        )
        + "\n"
    )


if __name__ == "__main__":
    main()
