from pathlib import Path
import sys
import re
import subprocess
from common import BUILD_ROOT as ROOT, COMPILE, COMMON, run, span


def kernel(MR=16, NR=8, KR=6):
    assert NR % 8 == 0
    name = f"custom_mmt4d_{MR}x{NR}x{KR}"
    c = [
        "#include <immintrin.h>",
        "#include <stdint.h>",
        f"__attribute__((always_inline)) static inline void tile(float *restrict c, const float *restrict a, const float *restrict b, int64_t kt, int acc) {{",
    ]
    for i in range(MR):
        for v in range(NR // 8):
            c.append(
                f"__m256 x{i}_{v} = acc ? _mm256_loadu_ps(c+{i * NR + v * 8}) : _mm256_setzero_ps();"
            )
    c.append("for(int64_t k=0;k<kt;++k) {")
    for sub in range(KR):
        c.append("{")
        for v in range(NR // 8):
            c.append(f"__m256 bv{v} = _mm256_loadu_ps(b+{sub * NR + v * 8});")
        for i in range(MR):
            c.append(f"__m256 av{i} = _mm256_broadcast_ss(a+{sub * MR + i});")
            for v in range(NR // 8):
                c.append(f"x{i}_{v} = _mm256_fmadd_ps(av{i},bv{v},x{i}_{v});")
        c.append("}")
    c.append(f"a+={MR * KR}; b+={NR * KR};\n}}")
    for i in range(MR):
        for v in range(NR // 8):
            c.append(f"_mm256_storeu_ps(c+{i * NR + v * 8},x{i}_{v});")
    c += [
        "}",
        f"""int32_t {name}(const float *a,int64_t ao,int64_t astride,const float *b,int64_t bo,int64_t bstride,float *c,int64_t co,int64_t cstride,int64_t mt,int64_t nt,int64_t kt,int32_t mr,int32_t nr,int32_t kr,int32_t flags,const void *cpu) {{
 for(int64_t m=0;m<mt;++m)
  for(int64_t n=0;n<nt;++n)
   tile(c+co+m*cstride+n*{MR * NR},a+ao+m*astride,b+bo+n*bstride,kt,flags&256);
 return 0;
}}""",
    ]
    (ROOT / f"{name}.c").write_text("\n".join(c))
    args = [
        "clang",
        "-O3",
        "-mavx2",
        "-mfma",
        "-ffreestanding",
        "-fno-stack-protector",
        "-fno-unroll-loops",
    ]
    run(
        [*args, "-emit-llvm", "-c", ROOT / f"{name}.c", "-o", ROOT / f"{name}.bc"],
        ROOT / f"{name}.log",
    )
    run(
        [*args, "-S", ROOT / f"{name}.c", "-o", ROOT / f"{name}.s"],
        ROOT / f"{name}-asm.log",
    )
    return name


def build(M, N, K, MR=16, NR=8, KR=6, MC=64, NC=128, KC=256):
    assert MC % MR == NC % NR == N % NC == K % KC == 0
    name = kernel(MR, NR, KR)
    d = ROOT / f"{M}x{N}x{K}"
    d.mkdir(exist_ok=True)
    src = ROOT / f"{M}x{N}x{K}" / "input.mlir"
    run(
        [
            COMPILE,
            src,
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
    start, end = span(s, s.index("        func.func @"))
    sigs = {
        "pack": "memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i64, i32",
        "unpack": "memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i32",
        "custom": "memref<f32>, index, index, memref<f32>, index, index, memref<f32>, index, index, index, index, index, i32, i32, i32, i32",
    }
    names = {"pack": "iree_uk_pack", "unpack": "iree_uk_unpack", "custom": name}
    decl = "\n".join(
        f"func.func private @{names[n]}({t})"
        + " -> i32"
        + ' attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}'
        for n, t in sigs.items()
    )
    KT = (KC + KR - 1) // KR
    MT = (M + MR - 1) // MR
    vals = {
        0,
        1,
        MR,
        NR,
        KR,
        M,
        N,
        K,
        MC,
        NC,
        KC,
        MC // MR,
        NC // NR,
        KT,
        MR * NR,
        KT * MR * KR,
        KT * NR * KR,
        NC * MR,
        MT,
    }
    lines = [
        f"func.func @{entry}() attributes {{translation_info = #iree_codegen.translation_info<pipeline = #iree_cpu.pipeline<Default>>}} {{"
    ]
    lines += [f"%c{v} = arith.constant {v} : index" for v in sorted(vals)]
    lines += [
        "%z64 = arith.constant 0 : i64",
        "%packA = arith.constant 257 : i32",
        "%packB = arith.constant 513 : i32",
        "%unpackFlags = arith.constant 1 : i32",
        "%baseFlags = arith.constant 0 : i32",
        "%accFlags = arith.constant 256 : i32",
        f"%mr = arith.constant {MR} : i32",
        f"%nr = arith.constant {NR} : i32",
        f"%kr = arith.constant {KR} : i32",
    ]
    for var, binding, count, flags in [
        ("A", 0, M * K, "ReadOnly|Indirect"),
        ("B", 1, K * N, "ReadOnly|Indirect"),
        ("C", 2, M * N, "Indirect"),
    ]:
        lines += [
            f'%{var}buf = hal.interface.binding.subspan layout({layout}) binding({binding}) alignment(64) offset(%c0) flags("{flags}") : memref<{count}xf32>',
            f"%{var} = memref.reinterpret_cast %{var}buf to offset: [0], sizes: [], strides: [] : memref<{count}xf32> to memref<f32>",
        ]
    for var, count in [
        ("AP", MC // MR * KT * MR * KR),
        ("BP", NC // NR * KT * NR * KR),
        ("CP", MT * MR * NC),
    ]:
        lines += [
            f"%{var}buf = memref.alloca() {{alignment = 64 : i64}} : memref<{count}xf32>",
            f"%{var} = memref.reinterpret_cast %{var}buf to offset: [0], sizes: [], strides: [] : memref<{count}xf32> to memref<f32>",
        ]
    seq = 0

    def call(n, args):
        nonlocal seq
        seq += 1
        lines.append(
            f"%r{seq} = " + f"func.call @{names[n]}({args}) : ({sigs[n]})" + " -> i32"
        )

    lines += [
        f"scf.for %nc = %c0 to %c{N} step %c{NC} {{",
        f"scf.for %kc = %c0 to %c{K} step %c{KC} {{",
        f"%bo0 = arith.muli %kc, %c{N} : index",
        "%bo = arith.addi %bo0, %nc : index",
    ]
    call(
        "pack",
        f"%B, %bo, %c{N}, %c1, %BP, %c0, %c{KT * NR * KR}, %c{NR * KR}, %c{KC}, %c{NC}, %c{NC // NR}, %c{KT}, %c{KR}, %c{NR}, %z64, %packB",
    )
    if NR * KR not in vals:
        lines.insert(1, f"%c{NR * KR} = arith.constant {NR * KR} : index")
    if MR * KR not in vals:
        lines.insert(1, f"%c{MR * KR} = arith.constant {MR * KR} : index")
    lines += [
        "%first = arith.cmpi eq, %kc, %c0 : index",
        "%flags = arith.select %first, %baseFlags, %accFlags : i32",
        f"scf.for %mc = %c0 to %c{M} step %c{MC} {{",
        f"%remaining = arith.subi %c{M}, %mc : index",
        f"%rows = arith.minui %remaining, %c{MC} : index",
        f"%ao0 = arith.muli %mc, %c{K} : index",
        "%ao = arith.addi %ao0, %kc : index",
        f"%co = arith.muli %mc, %c{NC} : index",
        f"%mt = arith.ceildivui %rows, %c{MR} : index",
    ]
    call(
        "pack",
        f"%A, %ao, %c{K}, %c1, %AP, %c0, %c{KT * MR * KR}, %c{MR * KR}, %rows, %c{KC}, %mt, %c{KT}, %c{KR}, %c{MR}, %z64, %packA",
    )
    call(
        "custom",
        f"%AP, %c0, %c{KT * MR * KR}, %BP, %c0, %c{KT * NR * KR}, %CP, %co, %c{NC * MR}, %mt, %c{NC // NR}, %c{KT}, %mr, %nr, %kr, %flags",
    )
    lines += ["}", "}"]
    call(
        "unpack",
        f"%CP, %c0, %c{NC * MR}, %c{MR * NR}, %C, %nc, %c{N}, %c1, %c{MT}, %c{NC // NR}, %c{MR}, %c{NR}, %c{M}, %c{NC}, %unpackFlags",
    )
    lines += ["}", "return", "}"]
    s = s[:start] + decl + "\n" + "\n".join(lines) + s[end:]
    start, end = span(s, s.index("iree_codegen.dispatch_config @"))
    s = (
        s[:start]
        + f"iree_codegen.dispatch_config @{entry} workgroup_size = [1, 1, 1] {{\n^bb0(%dev: !hal.device):\n%c1 = arith.constant 1 : index\niree_codegen.yield %c1, %c1, %c1 : index, index, index\n}}"
        + s[end:]
    )
    s = s.replace(
        "max_stack_allocation_size = 32768", "max_stack_allocation_size = 4194304"
    )
    tag = f"{MR}x{NR}x{KR}-{MC}-{NC}-{KC}"
    (d / f"{tag}.mlir").write_text(s)
    (d / f"{tag}-ir").mkdir(exist_ok=True)
    run(
        [
            COMPILE,
            d / f"{tag}.mlir",
            *COMMON,
            "--compile-from=executable-configurations",
            f"--iree-link-bitcode={ROOT}/{name}.bc",
            "--iree-llvmcpu-stack-allocation-limit=4194304",
            f"--iree-hal-dump-executable-files-to={d}/{tag}-ir",
            "-o",
            d / f"{tag}.vmfb",
        ],
        d / f"{tag}.log",
    )
    return d, tag
