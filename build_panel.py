from pathlib import Path
import subprocess
import re
import sys

from common import BUILD_ROOT as ROOT, COMPILE, COMMON, run, span, input_mlir


def build(M, N, K, MC=64, NC=64, KC=64):
    assert M % MC == N % NC == K % KC == MC % 8 == NC % 8 == 0
    d = ROOT / f"{M}x{N}x{K}"
    d.mkdir(exist_ok=True)
    source = input_mlir(M, N, K)
    (d / "input.mlir").write_text(source)
    if not (d / "baseline.vmfb").exists():
        (d / "baseline-ir").mkdir(exist_ok=True)
        run(
            [
                COMPILE,
                d / "input.mlir",
                *COMMON,
                "--iree-opt-data-tiling=true",
                f"--iree-hal-dump-executable-files-to={d}/baseline-ir",
                "-o",
                d / "baseline.vmfb",
            ],
            d / "baseline.log",
        )
    run(
        [
            COMPILE,
            d / "input.mlir",
            *COMMON,
            "--compile-to=executable-configurations",
            "-o",
            d / "template.mlir",
        ],
        d / "template.log",
    )
    s = (d / "template.mlir").read_text()
    entry = re.search(r"func.func @(gemm_dispatch_0_\w+)\(\)", s).group(1)
    layout = re.search(r"layout\((<bindings = .*?>)\) binding\(0\)", s).group(1)
    a, b = span(s, s.index("        func.func @"))
    decls = ""
    sigs = {
        "pack": "memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i64, i32",
        "unpack": "memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i32",
        "mmt4d": "memref<f32>, index, index, memref<f32>, index, index, memref<f32>, index, index, index, index, index, i32, i32, i32, i32",
    }
    for n, t in sigs.items():
        decls += f'func.func private @iree_uk_{n}({t}) -> i32 attributes {{hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}}\n'
    lines = [
        f"func.func @{entry}() attributes {{translation_info = #iree_codegen.translation_info<pipeline = #iree_cpu.pipeline<Default>>}} {{"
    ]
    vals = {
        0,
        1,
        8,
        M,
        N,
        K,
        MC,
        NC,
        KC,
        MC // 8,
        NC // 8,
        MC * KC,
        NC * KC,
        M * NC,
        KC * 8,
        NC * 8,
        MC * 8,
    }
    for v in sorted(vals):
        lines.append(f"%c{v} = arith.constant {v} : index")
    lines += [
        "%z64 = arith.constant 0 : i64",
        "%packA = arith.constant 1 : i32",
        "%packB = arith.constant 769 : i32",
        "%baseFlags = arith.constant 1537 : i32",
        "%accFlags = arith.constant 1793 : i32",
        "%i8 = arith.constant 8 : i32",
        "%i1 = arith.constant 1 : i32",
    ]
    for name, binding, count, flags in [
        ("A", 0, M * K, "ReadOnly|Indirect"),
        ("B", 1, K * N, "ReadOnly|Indirect"),
        ("C", 2, M * N, "Indirect"),
    ]:
        lines.append(
            f'%{name}buf = hal.interface.binding.subspan layout({layout}) binding({binding}) alignment(64) offset(%c0) flags("{flags}") : memref<{count}xf32>'
        )
        lines.append(
            f"%{name} = memref.reinterpret_cast %{name}buf to offset: [0], sizes: [], strides: [] : memref<{count}xf32> to memref<f32>"
        )
    for name, count in [("AP", MC * KC), ("BP", NC * KC), ("CP", M * NC)]:
        lines.append(
            f"%{name}buf = memref.alloca() {{alignment = 64 : i64}} : memref<{count}xf32>"
        )
        lines.append(
            f"%{name} = memref.reinterpret_cast %{name}buf to offset: [0], sizes: [], strides: [] : memref<{count}xf32> to memref<f32>"
        )
    seq = 0

    def call(n, args):
        nonlocal seq
        seq += 1
        lines.append(f"%r{seq} = func.call @iree_uk_{n}({args}) : ({sigs[n]}) -> i32")

    lines += [
        f"scf.for %nc = %c0 to %c{N} step %c{NC} {{",
        f"scf.for %kc = %c0 to %c{K} step %c{KC} {{",
        f"%bo0 = arith.muli %kc, %c{N} : index",
        "%bo = arith.addi %bo0, %nc : index",
    ]
    call(
        "pack",
        f"%B, %bo, %c{N}, %c1, %BP, %c0, %c{KC * 8}, %c8, %c{KC}, %c{NC}, %c{NC // 8}, %c{KC}, %c8, %c1, %z64, %packB",
    )
    lines += [
        "%first = arith.cmpi eq, %kc, %c0 : index",
        "%flags = arith.select %first, %baseFlags, %accFlags : i32",
        f"scf.for %mc = %c0 to %c{M} step %c{MC} {{",
        f"%ao0 = arith.muli %mc, %c{K} : index",
        "%ao = arith.addi %ao0, %kc : index",
        f"%co = arith.muli %mc, %c{NC} : index",
    ]
    call(
        "pack",
        f"%A, %ao, %c{K}, %c1, %AP, %c0, %c{KC * 8}, %c8, %c{MC}, %c{KC}, %c{MC // 8}, %c{KC}, %c8, %c1, %z64, %packA",
    )
    call(
        "mmt4d",
        f"%AP, %c0, %c{KC * 8}, %BP, %c0, %c{KC * 8}, %CP, %co, %c{NC * 8}, %c{MC // 8}, %c{NC // 8}, %c{KC}, %i8, %i8, %i1, %flags",
    )
    lines += ["}", "}"]
    # Unpack the completed M x NC output strip after all K panels.
    valsneeded = M // 8
    lines.append(f"%mtiles = arith.constant {valsneeded} : index")
    call(
        "unpack",
        f"%CP, %c0, %c{NC * 8}, %c64, %C, %nc, %c{N}, %c1, %mtiles, %c{NC // 8}, %c8, %c8, %c{M}, %c{NC}, %packA",
    )
    lines += ["}", "return", "}"]
    # Unpack's second stride is one 8x8 tile (64 elements).
    if 64 not in vals:
        lines.insert(1, "%c64 = arith.constant 64 : index")
    s = s[:a] + decls + "\n".join(lines) + s[b:]
    a, b = span(s, s.index("        iree_codegen.dispatch_config @"))
    s = (
        s[:a]
        + f"""iree_codegen.dispatch_config @{entry} workgroup_size = [1, 1, 1] {{
^bb0(%device: !hal.device):
%c1 = arith.constant 1 : index
iree_codegen.yield %c1, %c1, %c1 : index, index, index
}}"""
        + s[b:]
    )
    s = s.replace(
        "max_stack_allocation_size = 32768", "max_stack_allocation_size = 4194304"
    )
    tag = f"panel-{MC}-{NC}-{KC}"
    (d / f"{tag}.mlir").write_text(s)
    (d / f"{tag}-ir").mkdir(exist_ok=True)
    run(
        [
            COMPILE,
            d / f"{tag}.mlir",
            *COMMON,
            "--compile-from=executable-configurations",
            "--iree-llvmcpu-stack-allocation-limit=4194304",
            f"--iree-hal-dump-executable-files-to={d}/{tag}-ir",
            "-o",
            d / f"{tag}.vmfb",
        ],
        d / f"{tag}.log",
    )
    return d
