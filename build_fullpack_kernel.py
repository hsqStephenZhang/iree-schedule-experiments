"""Replace only pack geometry and the output microkernel in the default path.

The original two encoding dispatches remain before the compute dispatch.
Compute keeps one M microtile and two N microtiles per workgroup and reduces
all K in one call, without the NC/KC/MC cache-panel loops of variants 2/3.
"""

import re
from common import span

SIG = {
    "pack": "memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i64, i32",
    "unpack": "memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i32",
    "custom": "memref<f32>, index, index, memref<f32>, index, index, memref<f32>, index, index, index, index, index, i32, i32, i32, i32",
}
NAMES = {
    "pack": "iree_uk_pack",
    "unpack": "iree_uk_unpack",
    "custom": "custom_mmt4d_6x16x8",
}


def declarations():
    return "\n".join(
        f'func.func private @{NAMES[n]}({sig}) -> i32 attributes {{hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}}'
        for n, sig in SIG.items()
    )


class Body:
    def __init__(self, name, layout):
        self.name = name
        self.layout = layout
        self.constants = set()
        self.lines = []
        self.seq = 0

    def c(self, value):
        self.constants.add(value)
        return f"%c{value}"

    def add(self, line):
        self.lines.append(line)

    def bind(self, var, binding, count, offset, flags):
        self.add(
            f'%{var}buf = hal.interface.binding.subspan layout({self.layout}) binding({binding}) alignment(64) offset({self.c(offset)}) flags("{flags}") : memref<{count}xf32>'
        )
        self.add(
            f"%{var} = memref.reinterpret_cast %{var}buf to offset: [0], sizes: [], strides: [] : memref<{count}xf32> to memref<f32>"
        )

    def call(self, name, args):
        self.seq += 1
        self.add(
            f"%r{self.seq} = func.call @{NAMES[name]}({', '.join(args)}) : ({SIG[name]}) -> i32"
        )

    def text(self):
        header = f"func.func @{self.name}() attributes {{translation_info = #iree_codegen.translation_info<pipeline = #iree_cpu.pipeline<Default>>}} {{"
        constants = [
            f"%c{v} = arith.constant {v} : index" for v in sorted(self.constants)
        ]
        flags = [
            "%zero64 = arith.constant 0 : i64",
            "%packA = arith.constant 257 : i32",
            "%packB = arith.constant 513 : i32",
            "%unpackFlags = arith.constant 1 : i32",
            "%flags = arith.constant 0 : i32",
            "%mr = arith.constant 6 : i32",
            "%nr = arith.constant 16 : i32",
            "%kr = arith.constant 8 : i32",
        ]
        return "\n".join([header, *constants, *flags, *self.lines, "return", "}"])


def generate(template, M, N, K):
    assert M % 64 == N % 64 == K % 256 == 0
    mt = (M + 5) // 6
    ap_elements = mt * 6 * K
    ap_bytes = ap_elements * 4
    bp_elements = N * K
    total_bytes = (ap_elements + bp_elements) * 4
    names = re.findall(r"func.func @([\w]+)\(\)", template)
    bodies = {}
    counts = {}
    for name in names:
        if not (name.startswith("gemm_dispatch_0_") or name.startswith("_encoding_")):
            continue
        fstart = template.index(f"func.func @{name}")
        layout = re.search(
            r"layout\((<bindings = .*?>)\) binding\(0\)", template[fstart:]
        ).group(1)
        b = Body(name, layout)
        c = b.c
        b.add("%wg = hal.interface.workgroup.id[0] : index")
        if name.startswith("_encoding_0_"):
            b.bind("A", 0, M * K, 0, "ReadOnly|Indirect")
            b.bind("AP", 1, ap_elements, 0, "Indirect")
            b.add(f"%mi = arith.divui %wg, {c(K // 64)} : index")
            b.add(f"%ki = arith.remui %wg, {c(K // 64)} : index")
            b.add(f"%mo = arith.muli %mi, {c(60)} : index")
            b.add(f"%ko = arith.muli %ki, {c(64)} : index")
            b.add(f"%remaining = arith.subi {c(M)}, %mo : index")
            b.add(f"%rows = arith.minui %remaining, {c(60)} : index")
            b.add(f"%mt = arith.ceildivui %rows, {c(6)} : index")
            b.add(f"%aoff0 = arith.muli %mo, {c(K)} : index")
            b.add("%aoff = arith.addi %aoff0, %ko : index")
            b.add(f"%koff = arith.muli %ko, {c(6)} : index")
            b.add("%apoff = arith.addi %aoff0, %koff : index")
            b.call(
                "pack",
                [
                    "%A",
                    "%aoff",
                    c(K),
                    c(1),
                    "%AP",
                    "%apoff",
                    c(K * 6),
                    c(6),
                    "%rows",
                    c(64),
                    "%mt",
                    c(64),
                    c(1),
                    c(6),
                    "%zero64",
                    "%packA",
                ],
            )
            counts[name] = ((M + 59) // 60) * (K // 64)
        elif name.startswith("_encoding_1_"):
            b.bind("B", 0, K * N, 0, "ReadOnly|Indirect")
            b.bind("BP", 1, bp_elements, ap_bytes, "Indirect")
            b.add(f"%ni = arith.divui %wg, {c(K // 64)} : index")
            b.add(f"%ki = arith.remui %wg, {c(K // 64)} : index")
            b.add(f"%no = arith.muli %ni, {c(64)} : index")
            b.add(f"%ko = arith.muli %ki, {c(64)} : index")
            b.add(f"%boff0 = arith.muli %ko, {c(N)} : index")
            b.add("%boff = arith.addi %boff0, %no : index")
            b.add(f"%bpoff0 = arith.muli %no, {c(K)} : index")
            b.add(f"%koff = arith.muli %ko, {c(16)} : index")
            b.add("%bpoff = arith.addi %bpoff0, %koff : index")
            b.call(
                "pack",
                [
                    "%B",
                    "%boff",
                    c(N),
                    c(1),
                    "%BP",
                    "%bpoff",
                    c(K * 16),
                    c(16),
                    c(64),
                    c(64),
                    c(4),
                    c(64),
                    c(1),
                    c(16),
                    "%zero64",
                    "%packB",
                ],
            )
            counts[name] = (N // 64) * (K // 64)
        else:
            b.bind("AP", 0, ap_elements, 0, "ReadOnly|Indirect")
            b.bind("BP", 0, bp_elements, ap_bytes, "ReadOnly|Indirect")
            b.bind("C", 1, M * N, 0, "Indirect")
            b.add("%CPbuf = memref.alloca() {alignment = 64 : i64} : memref<192xf32>")
            b.add(
                "%CP = memref.reinterpret_cast %CPbuf to offset: [0], sizes: [], strides: [] : memref<192xf32> to memref<f32>"
            )
            b.add(f"%mi = arith.divui %wg, {c(N // 32)} : index")
            b.add(f"%ni = arith.remui %wg, {c(N // 32)} : index")
            b.add(f"%mo = arith.muli %mi, {c(6)} : index")
            b.add(f"%no = arith.muli %ni, {c(32)} : index")
            b.add(f"%aoff = arith.muli %mo, {c(K)} : index")
            b.add(f"%boff = arith.muli %no, {c(K)} : index")
            b.call(
                "custom",
                [
                    "%AP",
                    "%aoff",
                    c(K * 6),
                    "%BP",
                    "%boff",
                    c(K * 16),
                    "%CP",
                    c(0),
                    c(192),
                    c(1),
                    c(2),
                    c(K // 8),
                    "%mr",
                    "%nr",
                    "%kr",
                    "%flags",
                ],
            )
            b.add(f"%remaining = arith.subi {c(M)}, %mo : index")
            b.add(f"%rows = arith.minui %remaining, {c(6)} : index")
            b.add(f"%coff0 = arith.muli %mo, {c(N)} : index")
            b.add("%coff = arith.addi %coff0, %no : index")
            b.call(
                "unpack",
                [
                    "%CP",
                    c(0),
                    c(192),
                    c(96),
                    "%C",
                    "%coff",
                    c(N),
                    c(1),
                    c(1),
                    c(2),
                    c(6),
                    c(16),
                    "%rows",
                    c(32),
                    "%unpackFlags",
                ],
            )
            counts[name] = mt * (N // 32)
        bodies[name] = b.text()
    s = template
    for name, body in bodies.items():
        a, z = span(s, s.index(f"func.func @{name}"))
        s = s[:a] + declarations() + "\n" + body + s[z:]
        a, z = span(s, s.index(f"iree_codegen.dispatch_config @{name}"))
        config = f"iree_codegen.dispatch_config @{name} workgroup_size = [1, 1, 1] {{\n^bb0(%dev: !hal.device):\n%count = arith.constant {counts[name]} : index\n%one = arith.constant 1 : index\niree_codegen.yield %count, %one, %one : index, index, index\n}}"
        s = s[:a] + config + s[z:]
    # Preserve the host imports/output sizes; enlarge only the transient packed allocation.
    old_total = (M * K + K * N) * 4
    old = f" = arith.constant {old_total} : index"
    assert s.count(old) == 1
    s = s.replace(old, f" = arith.constant {total_bytes} : index")
    return s
