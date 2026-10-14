#!/usr/bin/env python3
"""Build and benchmark four IREE GEMM variants without an IREE checkout."""

import argparse
import json
import os
from pathlib import Path
import platform
import re
import shutil
import statistics
import subprocess
import sys

# Set these before importing NumPy, so reference computation is single-threaded.
os.environ["OPENBLAS_NUM_THREADS"] = "1"
os.environ["OMP_NUM_THREADS"] = "1"

VARIANTS = [
    "01_original",
    "02_panel_pack",
    "03_panel_pack_kernel",
    "04_full_pack_kernel",
]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--sizes",
        type=int,
        nargs="+",
        default=[2048, 4096],
        help="square GEMM dimensions, multiples of 256",
    )
    parser.add_argument(
        "--cpu", default="haswell", help="LLVM target CPU, e.g. host, alderlake, znver4"
    )
    parser.add_argument(
        "--pin-cpu",
        type=int,
        default=None,
        help="Linux logical CPU; default: first permitted CPU",
    )
    parser.add_argument("--repetitions", type=int, default=5)
    parser.add_argument(
        "--min-time", default="0.2s", help="Google Benchmark minimum time per batch"
    )
    parser.add_argument("--output", type=Path, default=Path("gemm-four-results"))
    parser.add_argument("--build-only", action="store_true")
    args = parser.parse_args()
    if any(s <= 0 or s % 256 for s in args.sizes):
        parser.error("--sizes must be positive multiples of 256")
    if args.repetitions < 1:
        parser.error("--repetitions must be positive")
    affinity = None
    if hasattr(os, "sched_getaffinity"):
        available = os.sched_getaffinity(0)
        affinity = args.pin_cpu if args.pin_cpu is not None else min(available)
        if affinity not in available:
            parser.error(f"CPU {affinity} is not permitted: {sorted(available)}")
        os.sched_setaffinity(0, {affinity})
    elif args.pin_cpu is not None:
        parser.error("--pin-cpu needs Linux sched_setaffinity")
    output = args.output.resolve()
    output.mkdir(parents=True, exist_ok=True)
    import common

    common.configure(output, args.cpu)
    from common import COMPILE, COMMON, BUILD_ROOT, run
    from build_panel import build as build_panel
    from build_fastpack import build_fastpack
    from build_fullpack_kernel import generate
    import numpy as np
    import iree.runtime as rt
    from iree.runtime.benchmark import benchmark_exe

    config = rt.Config("local-sync")
    metadata = {
        "target_cpu": args.cpu,
        "logical_cpu": affinity,
        "platform": platform.platform(),
        "cpu_description": platform.processor(),
        "compiler": subprocess.check_output([COMPILE, "--version"], text=True),
        "clang": subprocess.check_output(["clang", "--version"], text=True),
        "driver": "local-sync",
        "dtype": "float32",
        "sizes": args.sizes,
        "rounds": args.repetitions,
        "minimum_time": args.min_time,
        "scope": "native invocation including runtime packing, dispatch and output allocation; repeated runtime inputs, no cache flush",
        "variants": {
            "01_original": "unmodified IREE data-tiling, complete A/B packing, target-selected ukernel (8x8x1 for tested AVX2 targets)",
            "02_panel_pack": "NC/KC/MC panel packing interleaved with compute, original 8x8x1 ukernel; MC=64 NC=128 KC=256",
            "03_panel_pack_kernel": "same panel schedule with row-major 6x16 output kernel, K unrolled by 8; MC=60 NC=128 KC=256",
            "04_full_pack_kernel": "complete A/B packing in separate encoding dispatches; 6x16 output kernel, full K reduction; original distribution granularity of one M tile and two N tiles per workgroup",
        },
        "validation": "float64 NumPy reference, rtol=1e-3 atol=1e-3",
    }
    if shutil.which("lscpu"):
        metadata["lscpu"] = subprocess.check_output(["lscpu"], text=True)
    (output / "metadata.json").write_text(json.dumps(metadata, indent=2))
    results = []
    for size in args.sizes:
        d = output / f"{size}x{size}x{size}"
        d.mkdir(exist_ok=True)
        print(f"Building four variants for {size}...", flush=True)
        scratch = build_panel(size, size, size, 64, 128, 256)
        scratch, tag = build_fastpack(size)
        run(
            [
                COMPILE,
                scratch / "input.mlir",
                *COMMON,
                "--iree-opt-data-tiling=true",
                "--compile-to=executable-configurations",
                "-o",
                scratch / "original.mlir",
            ],
            scratch / "original.log",
        )
        original = (scratch / "original.mlir").read_text()
        sources = {
            VARIANTS[0]: original,
            VARIANTS[1]: (scratch / "panel-64-128-256.mlir").read_text(),
            VARIANTS[2]: (scratch / f"{tag}.mlir").read_text(),
            VARIANTS[3]: generate(original, size, size, size),
        }
        shutil.copy2(scratch / "input.mlir", d / "input.mlir")
        for variant, source in sources.items():
            v = d / variant
            v.mkdir(exist_ok=True)
            (v / "source.mlir").write_text(source)
            extra = []
            if variant in (VARIANTS[2], VARIANTS[3]):
                for suffix in ["c", "bc"]:
                    shutil.copy2(
                        BUILD_ROOT / f"custom_mmt4d_6x16x8.{suffix}",
                        v / f"kernel.{suffix}",
                    )
                extra = [f"--iree-link-bitcode={v}/kernel.bc"]
            flags = [*COMMON, "--iree-llvmcpu-stack-allocation-limit=4194304", *extra]
            run(
                [
                    COMPILE,
                    v / "source.mlir",
                    *flags,
                    "--compile-from=executable-configurations",
                    "--compile-to=executable-targets",
                    "--mlir-disable-threading",
                    "--mlir-print-ir-after=iree-codegen-lower-ukernel-ops-to-calls",
                    "-o",
                    v / "final.mlir",
                ],
                v / "lowering.log",
            )
            blocks = re.split(
                r"(?=^// -----// IR Dump After)",
                (v / "lowering.log").read_text(),
                flags=re.M,
            )
            calls = [
                b
                for b in blocks
                if "IR Dump After LowerUKernelOpsToCallsPass:" in b.split("\n")[0]
            ]
            (v / "scf-calls.mlir").write_text("\n".join(calls))
            (v / "llvm-ir").mkdir(exist_ok=True)
            run(
                [
                    COMPILE,
                    v / "final.mlir",
                    *flags,
                    "--compile-from=executable-targets",
                    f"--iree-hal-dump-executable-intermediates-to={v}/llvm-ir",
                    "-o",
                    v / "module.vmfb",
                ],
                v / "serialization.log",
            )
        if args.build_only:
            continue
        rng = np.random.default_rng(42)
        a = rng.normal(size=(size, size)).astype(np.float32)
        b = rng.normal(size=(size, size)).astype(np.float32)
        np.save(d / "A.npy", a)
        np.save(d / "B.npy", b)
        expected = a.astype(np.float64) @ b.astype(np.float64)
        rows = []
        for variant in VARIANTS:
            v = d / variant
            module = rt.VmModule.mmap(config.vm_instance, str(v / "module.vmfb"))
            ctx = rt.SystemContext(config=config)
            ctx.add_vm_module(module)
            actual = ctx.modules.module.gemm(a, b).to_host()
            np.testing.assert_allclose(actual, expected, rtol=1e-3, atol=1e-3)
            row = {
                "size": size,
                "variant": variant,
                "max_abs_error": float(np.max(np.abs(actual - expected))),
                "times_ms": [],
            }
            rows.append(row)
            print(f"  verified {variant}, error={row['max_abs_error']:.6g}", flush=True)
        del actual, expected, a, b, ctx, module
        for rnd in range(args.repetitions):
            for row in rows if rnd % 2 == 0 else rows[::-1]:
                v = d / row["variant"]
                dest = v / f"benchmark-{rnd}.json"
                command = [
                    benchmark_exe(),
                    f"--module={v}/module.vmfb",
                    "--function=gemm",
                    "--device=local-sync",
                    f"--input=@{d}/A.npy",
                    f"--input=@{d}/B.npy",
                    f"--benchmark_min_time={args.min_time}",
                    "--benchmark_repetitions=1",
                    f"--benchmark_out={dest}",
                    "--benchmark_out_format=json",
                ]
                run(command, v / f"benchmark-{rnd}.log")
                records = [
                    r
                    for r in json.loads(dest.read_text())["benchmarks"]
                    if r.get("run_type", "iteration") == "iteration"
                ]
                if len(records) != 1 or records[0].get("error_occurred"):
                    raise RuntimeError(records)
                r = records[0]
                row["times_ms"].append(
                    r["real_time"]
                    * {"ns": 1e-6, "us": 1e-3, "ms": 1, "s": 1e3}[r["time_unit"]]
                )
            print(f"  {size}: round {rnd + 1}/{args.repetitions}", flush=True)
        base = statistics.median(rows[0]["times_ms"])
        for row in rows:
            row["median_ms"] = statistics.median(row["times_ms"])
            row["speedup_vs_original"] = base / row["median_ms"]
            row["gflops"] = 2 * size**3 / (row["median_ms"] * 1e6)
            print(
                f"  {row['variant']}: {row['median_ms']:.3f} ms, {row['speedup_vs_original']:.3f}x",
                flush=True,
            )
        results.extend(rows)
        (output / "results.json").write_text(
            json.dumps({"metadata": metadata, "results": results}, indent=2)
        )
        summary = ["size,variant,median_ms,gflops,speedup_vs_original,max_abs_error"]
        summary.extend(
            f"{r['size']},{r['variant']},{r['median_ms']:.6f},{r['gflops']:.6f},{r['speedup_vs_original']:.6f},{r['max_abs_error']:.9g}"
            for r in results
        )
        (output / "summary.csv").write_text("\n".join(summary) + "\n")
    print(f"Artifacts: {output}", flush=True)


if __name__ == "__main__":
    main()
