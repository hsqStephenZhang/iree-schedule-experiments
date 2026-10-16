#!/usr/bin/env python3
"""Build, validate and benchmark fixed-B controlled GEMM variants and dynamic baseline."""

import argparse
import gc
import hashlib
import json
import os
from pathlib import Path
import platform
import re
import statistics
import subprocess
import time

os.environ["OPENBLAS_NUM_THREADS"] = "1"
os.environ["OMP_NUM_THREADS"] = "1"

from build_fixed_weights import VARIANTS, CONTROLLED, build_all
from host_platform import hardware_info, pin_cpu


def write_json(path, data):
    tmp = path.with_suffix(path.suffix + ".tmp")
    tmp.write_text(json.dumps(data, indent=2))
    tmp.replace(path)


def sha256(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def load_context(config, module_path, archive=None):
    import iree.runtime as rt
    ctx = rt.SystemContext(config=config)
    if archive is not None:
        index = rt.ParameterIndex()
        index.load(str(archive))
        provider = index.create_provider(scope="weights")
        ctx.add_vm_module(rt.create_io_parameters_module(config.vm_instance, provider))
    ctx.add_vm_module(rt.VmModule.mmap(config.vm_instance, str(module_path)))
    return ctx


def prepare_and_validate(size, directory):
    import numpy as np
    import iree.runtime as rt
    d = directory
    cfg = rt.Config("local-sync")
    rng = np.random.default_rng(42)
    a = rng.standard_normal((size, size), dtype=np.float32)
    b = rng.standard_normal((size, size), dtype=np.float32)
    np.save(d / "A.npy", a)
    np.save(d / "B.npy", b)
    pack_ctx = load_context(cfg, d / "pack-b.vmfb")
    b_device = rt.asdevicearray(cfg.device, b)
    t0 = time.perf_counter_ns()
    packed_device = pack_ctx.modules.module.pack_b(b_device)
    pack_once_ms = (time.perf_counter_ns() - t0) / 1e6
    packed = packed_device.to_host()
    expected_bp = b.reshape(size, size//8, 8).transpose(1, 0, 2)[..., None]
    for start in range(0, size//8, 8):
        np.testing.assert_array_equal(packed[start:start+8], expected_bp[start:start+8])
    index = rt.ParameterIndex()
    index.add_buffer("B", packed)
    index.add_buffer("B_raw", b)
    index.create_archive_file(str(d / "weights.irpa"))
    del packed, packed_device, expected_bp, index, b_device, pack_ctx
    gc.collect()
    validation = []
    b64 = b.astype(np.float64)
    for variant in VARIANTS:
        v = d / variant
        t0 = time.perf_counter_ns()
        ctx = load_context(cfg, v / "module.vmfb", None if variant == VARIANTS[0] else d / "weights.irpa")
        context_init_ms = (time.perf_counter_ns() - t0) / 1e6
        invoke = ctx.modules.module.gemm
        b_input = rt.asdevicearray(cfg.device, b) if variant == VARIANTS[0] else None
        checks = []
        # Two different activation tensors, same context and immutable B.
        for input_index in range(2):
            av = a if input_index == 0 else (-0.5 * a + np.float32(0.125))
            a_input = rt.asdevicearray(cfg.device, av)
            t0 = time.perf_counter_ns()
            result = invoke(a_input, b_input) if b_input is not None else invoke(a_input)
            invocation_ms = (time.perf_counter_ns() - t0) / 1e6
            actual = result.to_host()
            error = 0.0
            # Avoid simultaneous full-size float64 A, B and C on the 1 GiB VM.
            for start in range(0, size, 64):
                expected = av[start:start+64].astype(np.float64) @ b64
                np.testing.assert_allclose(actual[start:start+64], expected, rtol=1e-3, atol=1e-3)
                error = max(error, float(np.max(np.abs(actual[start:start+64] - expected))))
            checks.append({"input_index": input_index, "max_abs_error": error, "invocation_ms_including_python": invocation_ms})
            del result, actual, expected, a_input, av
        validation.append({"variant": variant, "same_context_distinct_inputs": checks, "context_init_ms_including_parameter_load": context_init_ms})
        print(f"  verified {size} {variant}: {[c['max_abs_error'] for c in checks]}", flush=True)
        del invoke, ctx, b_input
        gc.collect()
    record = {"b_pack_invocations": 1, "b_pack_once_ms_including_python_and_output_allocation": pack_once_ms, "b_pack_layout_verified_exactly": True, "weights_archive_sha256": sha256(d / "weights.irpa"), "validation": validation}
    write_json(d / "validation.json", record)
    return record


def inspect_modules(directory):
    records = {}
    for variant in VARIANTS:
        v = directory / variant
        source = (v / "source.mlir").read_text()
        row = {"module_sha256": sha256(v / "module.vmfb"), "source_sha256": sha256(v / "source.mlir")}
        if variant in CONTROLLED:
            host = source[source.index("util.func public @gemm"):]
            assert "util.global.load immutable @B" in host
            assert "stream.cmd.parameter.load" not in host
            assert host.count("stream.tensor.import") == 1
            assert "func.call @iree_uk_pack(%BP" not in source
            assert source.count("func.call @iree_uk_mmt4d(") == 1
            assert "memref<16777216xf32> = memref.alloca" not in source
            row.update({"gemm_runtime_inputs": 1, "b_load_in_initializer_only": True, "mmt4d_geometry": [8, 8, 1], "gemm_dispatches": host.count("stream.cmd.dispatch"), "a_pack_call_sites": source.count("func.call @iree_uk_pack("), "a_panel_stack_bytes": 64*256*4 if variant == CONTROLLED[2] else 0})
        elif variant == VARIANTS[1]:
            host = source[source.index("util.func public @gemm"):]
            assert host.count("stream.tensor.import") == 1
            assert "stream.cmd.parameter.load" not in host
            assert "stream.cmd.execute once" in source
            row.update({"gemm_runtime_inputs": 1, "b_pack_in_initializer": True, "microkernel": "native IREE target-selected"})
        records[variant] = row
    write_json(directory / "module-audit.json", records)
    return records


def benchmark(size, directory, repetitions, iterations):
    import common
    from iree.runtime.benchmark import benchmark_exe
    rows = {variant: {"size": size, "variant": variant, "times_ms": [], "samples": []} for variant in VARIANTS}
    schedule = []
    for rnd in range(repetitions):
        order = VARIANTS if (rnd//len(VARIANTS)) % 2 == 0 else VARIANTS[::-1]
        shift = rnd % len(VARIANTS)
        order = order[shift:] + order[:shift]
        schedule.append(order)
        for variant in order:
            v = directory / variant
            report = v / f"benchmark-{rnd}.json"
            command = [benchmark_exe(), f"--module={v}/module.vmfb", "--function=gemm", "--device=local-sync", f"--input=@{directory}/A.npy"]
            if variant == VARIANTS[0]:
                command.append(f"--input=@{directory}/B.npy")
            else:
                command.append(f"--parameters=weights={directory}/weights.irpa")
            command.extend([f"--benchmark_min_time={iterations}x", "--benchmark_repetitions=1", f"--benchmark_out={report}", "--benchmark_out_format=json"])
            common.run(command, v / f"benchmark-{rnd}.log")
            records = [r for r in json.loads(report.read_text())["benchmarks"] if r.get("run_type", "iteration") == "iteration"]
            if len(records) != 1 or records[0].get("error_occurred"):
                raise RuntimeError(records)
            r = records[0]
            assert r["iterations"] == iterations, r
            ms = r["real_time"] * {"ns": 1e-6, "us": 1e-3, "ms": 1, "s": 1000}[r["time_unit"]]
            rows[variant]["times_ms"].append(ms)
            rows[variant]["samples"].append({"round": rnd, "position": order.index(variant), "iterations": r["iterations"], "real_time": r["real_time"], "cpu_time": r["cpu_time"], "time_unit": r["time_unit"]})
        write_json(directory / "timing-progress.json", {"completed_rounds": rnd+1, "schedule": schedule, "results": list(rows.values())})
        print(f"  {size}: round {rnd+1}/{repetitions}", flush=True)
    base = statistics.median(rows[VARIANTS[0]]["times_ms"])
    full = statistics.median(rows[CONTROLLED[0]]["times_ms"])
    native_fixed = statistics.median(rows[VARIANTS[1]]["times_ms"])
    for row in rows.values():
        row["median_ms"] = statistics.median(row["times_ms"])
        row["min_ms"] = min(row["times_ms"])
        row["max_ms"] = max(row["times_ms"])
        row["speedup_vs_dynamic_baseline"] = base / row["median_ms"]
        row["speedup_vs_fixed_b_full_a_full_k"] = full / row["median_ms"]
        row["speedup_vs_native_fixed_b"] = native_fixed / row["median_ms"]
        row["gflops"] = 2*size**3 / (row["median_ms"]*1e6)
        print(f"  {size} {row['variant']}: {row['median_ms']:.3f} ms", flush=True)
    return list(rows.values())


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--sizes", nargs="+", type=int, default=[2048, 4096])
    parser.add_argument("--rounds", type=int, default=10)
    parser.add_argument("--iterations", type=int, default=3)
    parser.add_argument("--target-cpu", default="host")
    parser.add_argument("--pin-cpu", type=int)
    parser.add_argument("--output", type=Path, default=Path("results/fixed-weights"))
    parser.add_argument("--build-only", action="store_true")
    parser.add_argument("--reuse-build", action="store_true", help="Reuse built modules, revalidate, regenerate inputs and run timings")
    args = parser.parse_args()
    if any(s <= 0 or s % 256 for s in args.sizes) or args.rounds < 1 or args.iterations < 1:
        parser.error("positive sizes divisible by 256, rounds and iterations required")
    cpu = pin_cpu(args.pin_cpu)
    output = args.output.resolve()
    output.mkdir(parents=True, exist_ok=True)
    import common
    common.configure(output, args.target_cpu)
    metadata = {
        "schema_version": 1, "experiment": "fixed_b_controlled", "platform": platform.platform(),
        "hardware": hardware_info(cpu), "target_cpu": args.target_cpu, "logical_cpu": cpu,
        "compiler": subprocess.check_output([common.COMPILE, "--version"], text=True),
        "sizes": args.sizes, "rounds": args.rounds, "iterations": args.iterations,
        "driver": "local-sync", "dtype": "float32", "microkernel": "IREE 8x8x1 for all three controlled groups; native baseline target-selected",
        "blocking": {"MC": 64, "NC": 128, "KC": 256},
        "scope": "native Google Benchmark real_time; A packing, GEMM, C unpack, dispatch and output/transient allocation included; parameter archive loading and one-time B packing excluded; no cache flush",
        "b_lifetime": "one IREE pack_b invocation creates shared weights.irpa; each benchmark context initializes immutable B once and reuses across warmup/timed calls",
        "variants": dict(zip(VARIANTS, ["original native IREE data-tiling, dynamic A/B; historical reference", "native IREE matmul with immutable raw B; IREE hoists native B packing into context initialization", "full A pack each call, NC/MC/full-K", "full A pack each call, NC/KC/MC", "panel A pack each call, NC/KC/MC; A repacked size/NC times"])),
        "source_hashes": {p.name: sha256(p) for p in [Path(__file__), Path(__file__).with_name("build_fixed_weights.py"), Path(__file__).with_name("common.py"), Path(__file__).with_name("host_platform.py")]},
    }
    write_json(output / "metadata.json", metadata)
    results, setups, audits = [], {}, {}
    for size in args.sizes:
        d = output / f"{size}x{size}x{size}"
        print(f"Building fixed-B variants and baseline: {size}", flush=True)
        if not args.reuse_build:
            build_all(size, d)
        audits[str(size)] = inspect_modules(d)
        if args.build_only:
            continue
        setups[str(size)] = prepare_and_validate(size, d)
        results.extend(benchmark(size, d, args.rounds, args.iterations))
        write_json(output / "results.json", {"metadata": metadata, "setup": setups, "module_audit": audits, "results": results})
    print(f"Saved to {output}", flush=True)


if __name__ == "__main__":
    main()
