"""Controlled panel-packing diagnostics using previously validated native artifacts.

Prepacked-input cases still calculate the original GEMM. Packing-only cases
replace compute with an opaque memory barrier and zeroing of the same C tiles;
they measure packing, loop/call overhead, C touches and final unpack together.
Their times are counterfactuals, not an additive decomposition of GEMM time.
"""

import argparse
import json
import os
from pathlib import Path
import re
import shutil
import statistics
import subprocess

os.environ["OPENBLAS_NUM_THREADS"] = "1"
os.environ["OMP_NUM_THREADS"] = "1"


def prepacked(source, size, operands):
    """Keep the 8x8x1 panel compute schedule, but read full packed inputs."""
    lines = []
    for line in source.splitlines():
        if "func.call @iree_uk_pack" in line and any(
            f"(%{operand}," in line for operand in operands
        ):
            continue
        if "func.call @iree_uk_mmt4d" in line:
            for operand, panel, block in (("A", "AP", "mc"), ("B", "BP", "nc")):
                if operand not in operands:
                    continue
                lines.extend([
                    f"%{operand}fullstride = arith.constant {size * 8} : index",
                    f"%{operand}blockoff = arith.muli %{block}, %c{size} : index",
                    f"%{operand}koff = arith.muli %kc, %c8 : index",
                    f"%{operand}fulloff = arith.addi %{operand}blockoff, %{operand}koff : index",
                ])
                line, count = re.subn(
                    rf"%{panel}, %c0, %c\d+,",
                    f"%{operand}, %{operand}fulloff, %{operand}fullstride,",
                    line, count=1,
                )
                assert count == 1
        lines.append(line)
    return "\n".join(lines) + "\n"


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source", type=Path, default=Path("results/neon"))
    parser.add_argument("--output", type=Path, default=Path("results/neon-analysis"))
    parser.add_argument("--size", type=int, default=4096)
    parser.add_argument("--repetitions", type=int, default=3)
    parser.add_argument("--min-time", default="0.1s")
    parser.add_argument("--only", nargs="+", help="run only the named diagnostic cases")
    args = parser.parse_args()
    if args.size % 256 or args.size < 256 or args.repetitions < 1:
        parser.error("size must be a positive multiple of 256; repetitions must be positive")
    import common
    common.configure(args.output, "host")
    if common.TARGET_ARCH != "aarch64":
        parser.error("these diagnostics target native AArch64")
    from build_panel import build
    import numpy as np
    import iree.runtime as rt
    from iree.runtime.benchmark import benchmark_exe

    output = args.output.resolve()
    size = args.size
    source_root = args.source.resolve() / f"{size}x{size}x{size}"
    output.mkdir(parents=True, exist_ok=True)
    sink = output / "packing_sink.c"
    sink.write_text('''#include <stdint.h>
int32_t packing_sink(const float *a, int64_t ao, int64_t astride,
 const float *b, int64_t bo, int64_t bstride, float *c, int64_t co,
 int64_t cstride, int64_t mt, int64_t nt, int64_t kt,
 int32_t mr, int32_t nr, int32_t kr, int32_t flags, const void *cpu) {
 // Keep all preceding pack writes observable to the optimizer.
 __asm__ volatile("" : : "r"(a), "r"(b), "r"(c) : "memory");
 for (int64_t m=0; m<mt; ++m)
  for (int64_t n=0; n<nt; ++n)
   for (int64_t i=0; i<(int64_t)mr*nr; ++i)
    c[co+m*cstride+n*(int64_t)mr*nr+i] = 0.0f;
 return 0;
}
''')
    sink_bc = sink.with_suffix(".bc")
    common.run([
        "clang", "--target=aarch64-none-elf", "-mcpu=native", "-ffixed-x18",
        "-O3", "-ffreestanding", "-fno-stack-protector", "-emit-llvm", "-c",
        sink, "-o", sink_bc,
    ], output / "packing_sink.log")
    cases = []

    def add(name, source=None, vmfb=None, operands="", packing_only=False, bitcode=None):
        if args.only and name not in args.only:
            return
        directory = output / name
        directory.mkdir(exist_ok=True)
        if source is not None:
            path = directory / "source.mlir"
            path.write_text(source)
            bitcodes = bitcode if isinstance(bitcode, (tuple, list)) else ([bitcode] if bitcode else [])
            extra = ["--iree-link-bitcode=" + ",".join(map(str, bitcodes))] if bitcodes else []
            common.run([
                common.COMPILE, path, *common.COMMON,
                "--compile-from=executable-configurations",
                "--iree-llvmcpu-stack-allocation-limit=4194304", *extra,
                f"--iree-hal-dump-executable-intermediates-to={directory}/llvm-ir",
                "-o", directory / "module.vmfb",
            ], directory / "compile.log")
        else:
            shutil.copy2(vmfb, directory / "module.vmfb")
        cases.append({"name": name, "operands": operands,
                      "packing_only": packing_only, "times_ms": []})

    for variant in ("01_original", "02_panel_pack", "03_panel_pack_kernel", "04_full_pack_kernel"):
        add(variant, vmfb=source_root / variant / "module.vmfb")
    panel = (source_root / "02_panel_pack/source.mlir").read_text()
    add("panel_prepacked_A", prepacked(panel, size, "A"), operands="A")
    add("panel_prepacked_AB", prepacked(panel, size, "AB"), operands="AB")
    for variant, symbol in (("02_panel_pack", "iree_uk_mmt4d"),
                            ("03_panel_pack_kernel", "custom_mmt4d_6x16x8")):
        source = (source_root / variant / "source.mlir").read_text()
        source = source.replace("@" + symbol, "@packing_sink")
        add(variant + "_packing_only", source, packing_only=True, bitcode=sink_bc)
    for mc, nc, kc in ((64, 128, 64), (64, 128, 512), (64, 128, 1024),
                       (64, 128, 2048), (64, 64, 1024), (128, 128, 256)):
        tag = f"panel-{mc}-{nc}-{kc}"
        if args.only and tag not in args.only:
            continue
        print(f"Building panel MC={mc} NC={nc} KC={kc}", flush=True)
        directory = build(size, size, size, mc, nc, kc)
        add(tag, vmfb=directory / f"{tag}.vmfb")

    pack_source = Path(__file__).resolve().with_name("neon_pack_a6.c")
    shutil.copy2(pack_source, output / pack_source.name)
    pack_bc = output / "neon_pack_a6.bc"
    common.run([
        "clang", "--target=aarch64-none-elf", "-mcpu=native", "-ffixed-x18",
        "-O3", "-ffreestanding", "-fno-stack-protector", "-emit-llvm", "-c",
        pack_source, "-o", pack_bc,
    ], output / "neon_pack_a6.log")
    for variant in ("03_panel_pack_kernel", "04_full_pack_kernel"):
        source = (source_root / variant / "source.mlir").read_text()
        declaration = next(line for line in source.splitlines()
                           if "func.func private @iree_uk_pack(" in line)
        source = source.replace(declaration, declaration + "\n" +
                                declaration.replace("@iree_uk_pack", "@neon_pack_a6"))
        source = "\n".join(
            line.replace("@iree_uk_pack", "@neon_pack_a6")
            if "func.call @iree_uk_pack(%A," in line else line
            for line in source.splitlines()
        ) + "\n"
        kernel_bc = source_root / variant / "kernel.bc"
        add(variant + "_neon_A_pack", source, bitcode=[kernel_bc, pack_bc])
        if variant == "03_panel_pack_kernel":
            source = source.replace("@custom_mmt4d_6x16x8", "@packing_sink")
            add(variant + "_neon_A_pack_packing_only", source,
                packing_only=True, bitcode=[sink_bc, pack_bc])
    if args.only:
        missing = set(args.only) - {case["name"] for case in cases}
        if missing:
            parser.error(f"unknown cases: {sorted(missing)}")

    a = np.load(source_root / "A.npy")
    b = np.load(source_root / "B.npy")
    expected = a.astype(np.float64) @ b.astype(np.float64)
    ap = np.ascontiguousarray(a.reshape(size // 8, 8, size).transpose(0, 2, 1)).reshape(size, size)
    bp = np.ascontiguousarray(b.reshape(size, size // 8, 8).transpose(1, 0, 2)).reshape(size, size)
    input_paths = {}
    for name, array in (("A", a), ("B", b), ("AP", ap), ("BP", bp)):
        path = output / f"{name}.npy"
        np.save(path, array)
        input_paths[name] = path
    config = rt.Config("local-sync")
    for case in cases:
        directory = output / case["name"]
        module = rt.VmModule.mmap(config.vm_instance, str(directory / "module.vmfb"))
        context = rt.SystemContext(config=config)
        context.add_vm_module(module)
        actual = context.modules.module.gemm(
            ap if "A" in case["operands"] else a,
            bp if "B" in case["operands"] else b,
        ).to_host()
        if case["packing_only"]:
            assert np.all(actual == 0), case["name"]
            case["validation"] = "zero output from packing sink; not a GEMM"
        else:
            np.testing.assert_allclose(actual, expected, rtol=1e-3, atol=1e-3)
            case["max_abs_error"] = float(np.max(np.abs(actual - expected)))
            case["validation"] = "float64 reference, rtol=1e-3 atol=1e-3"
        print(f"Verified {case['name']}", flush=True)
    del actual, expected, a, b, ap, bp, context, module
    metadata = {
        "size": size, "cpu": "host", "driver": "local-sync",
        "repetitions": args.repetitions, "min_time": args.min_time,
        "compiler": subprocess.check_output([common.COMPILE, "--version"], text=True),
        "source": str(source_root), "affinity_pinned": False,
        "packing_only_scope": "packing, opaque sink calls, repeated C zeroing, final unpack; non-additive counterfactual",
        "prepacked_scope": "packing performed before timing; packed full-input strides differ from compact panel strides",
    }
    for round_ in range(args.repetitions):
        for case in cases if round_ % 2 == 0 else cases[::-1]:
            directory = output / case["name"]
            dest = directory / f"benchmark-{round_}.json"
            common.run([
                benchmark_exe(), f"--module={directory}/module.vmfb",
                "--function=gemm", "--device=local-sync",
                f"--input=@{input_paths['AP' if 'A' in case['operands'] else 'A']}",
                f"--input=@{input_paths['BP' if 'B' in case['operands'] else 'B']}",
                f"--benchmark_min_time={args.min_time}", "--benchmark_repetitions=1",
                f"--benchmark_out={dest}", "--benchmark_out_format=json",
            ], directory / f"benchmark-{round_}.log")
            records = [r for r in json.loads(dest.read_text())["benchmarks"]
                       if r.get("run_type", "iteration") == "iteration"]
            if len(records) != 1 or records[0].get("error_occurred"):
                raise RuntimeError(records)
            record = records[0]
            case["times_ms"].append(record["real_time"] *
                                    {"ns": 1e-6, "us": 1e-3, "ms": 1, "s": 1e3}[record["time_unit"]])
        (output / "results.json").write_text(json.dumps({"metadata": metadata, "cases": cases}, indent=2))
        print(f"Round {round_ + 1}/{args.repetitions}", flush=True)
    original = next((case for case in cases if case["name"] == "01_original"), None)
    baseline = statistics.median(original["times_ms"]) if original else None
    for case in cases:
        case["median_ms"] = statistics.median(case["times_ms"])
        case["speedup_vs_original"] = (
            baseline / case["median_ms"] if baseline and not case["packing_only"] else None
        )
        print(f"{case['name']}: {case['median_ms']:.3f} ms", flush=True)
    (output / "results.json").write_text(json.dumps({"metadata": metadata, "cases": cases}, indent=2))


if __name__ == "__main__":
    main()
