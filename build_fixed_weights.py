"""Controlled 8x8x1 GEMM experiments with an immutable prepacked B parameter."""

import re
from pathlib import Path

from common import span


VARIANTS = ["00_dynamic_baseline", "00_native_fixed_b", "01_full_a_full_k", "02_full_a_panel", "03_panel_a_panel"]
CONTROLLED = VARIANTS[2:]
SIGS = {
    "pack": "memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i64, i32",
    "unpack": "memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i32",
    "mmt4d": "memref<f32>, index, index, memref<f32>, index, index, memref<f32>, index, index, index, index, index, i32, i32, i32, i32",
}


def input_source(size, full_a=True):
    s = size
    ap = f"tensor<{s//8}x{s}x8x1xf32>"
    cp = f"tensor<{s//8}x{s//8}x8x8xf32>"
    flat = f"tensor<{s*s}xf32>"
    mat = f"tensor<{s}x{s}xf32>"
    pack = f"""%ae = tensor.empty() : {ap}
    %ap = linalg.pack %a inner_dims_pos = [0, 1] inner_tiles = [8, 1] into %ae : {mat} -> {ap}""" if full_a else f"""%flat = tensor.collapse_shape %a [[0, 1]] : {mat} into {flat}
    %ap = tensor.expand_shape %flat [[0, 1, 2, 3]] output_shape [{s//8}, {s}, 8, 1] : {flat} into {ap}"""
    return f"""module {{
  util.global private @B = #stream.parameter.named<\"weights\"::\"B\"> : {ap}
  func.func @gemm(%a: {mat}) -> {mat} {{
    %bp = util.global.load immutable @B : {ap}
    {pack}
    %z = arith.constant 0.0 : f32
    %ce = tensor.empty() : {cp}
    %cz = linalg.fill ins(%z : f32) outs(%ce : {cp}) -> {cp}
    %ct = linalg.mmt4d ins(%ap, %bp : {ap}, {ap}) outs(%cz : {cp}) -> {cp}
    %out = tensor.empty() : {mat}
    %c = linalg.unpack %ct inner_dims_pos = [0, 1] inner_tiles = [8, 8] into %out : {cp} -> {mat}
    return %c : {mat}
  }}
}}
"""


def pack_b_source(s):
    return f"""module {{
  func.func @pack_b(%b: tensor<{s}x{s}xf32>) -> tensor<{s//8}x{s}x8x1xf32> {{
    %e = tensor.empty() : tensor<{s//8}x{s}x8x1xf32>
    %p = linalg.pack %b outer_dims_perm = [1, 0] inner_dims_pos = [1, 0] inner_tiles = [8, 1] into %e : tensor<{s}x{s}xf32> -> tensor<{s//8}x{s}x8x1xf32>
    return %p : tensor<{s//8}x{s}x8x1xf32>
  }}
}}
"""


def native_fixed_b_source(size):
    from common import input_mlir
    mat = f"tensor<{size}x{size}xf32>"
    source = input_mlir(size, size, size)
    source = source.replace("module {", f'module {{\n  util.global private @B = #stream.parameter.named<"weights"::"B_raw"> : {mat}')
    source = source.replace(f", %b: {mat})", ")")
    source = source.replace("    %zero =", f"    %b = util.global.load immutable @B : {mat}\n    %zero =")
    return source


class Body:
    def __init__(self, name, original):
        self.name = name
        self.layout = re.search(r"layout\((<bindings = .*?>)\) binding", original).group(1)
        self.bindings = re.findall(r'(%\w+) = hal.interface.binding.subspan .*? binding\((\d+)\).*?offset\((%\w+)\).*?flags\((.*?)\) : (memref<.*>)', original)
        self.original_constants = re.findall(r"(%\w+) = arith.constant (\d+) : index", original)
        self.constants = set()
        self.lines = []
        self.seq = 0

    def c(self, n):
        self.constants.add(n)
        return f"%i{n}"

    def add(self, line):
        self.lines.append(line)

    def bind(self, name, which):
        _, binding, offset, flags, typ = self.bindings[which]
        shape = re.match(r"memref<([0-9x]+)f32", typ).group(1)
        import math
        count = math.prod(int(n) for n in shape.rstrip("x").split("x"))
        typ = f"memref<{count}xf32>"
        self.add(f'%{name}buf = hal.interface.binding.subspan layout({self.layout}) binding({binding}) alignment(64) offset({offset}) flags({flags}) : {typ}')
        self.add(f"%{name} = memref.reinterpret_cast %{name}buf to offset: [0], sizes: [], strides: [] : {typ} to memref<f32>")

    def scratch(self, name, count):
        self.add(f"%{name}buf = memref.alloca() alignment = 64 : memref<{count}xf32>")
        self.add(f"%{name} = memref.reinterpret_cast %{name}buf to offset: [0], sizes: [], strides: [] : memref<{count}xf32> to memref<f32>")

    def call(self, kind, args):
        self.seq += 1
        self.add(f"%r{self.seq} = func.call @iree_uk_{kind}({', '.join(args)}) : ({SIGS[kind]}) -> i32")

    def text(self):
        decls = [f'func.func private @iree_uk_{kind}({sig}) -> i32 attributes {{hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}}' for kind, sig in SIGS.items()]
        constants = [f"{v} = arith.constant {n} : index" for v,n in self.original_constants]
        constants += [f"%i{n} = arith.constant {n} : index" for n in sorted(self.constants)]
        constants += ["%zero64 = arith.constant 0 : i64", "%packA = arith.constant 1 : i32", "%base = arith.constant 1537 : i32", "%acc = arith.constant 1793 : i32", "%eight = arith.constant 8 : i32", "%one = arith.constant 1 : i32"]
        return "\n".join([*decls, f"func.func @{self.name}() attributes {{translation_info = #iree_codegen.translation_info<pipeline = #iree_cpu.pipeline<Default>>}} {{", *constants, *self.lines, "return", "}"])


def generate(template, size, variant):
    """Keep IREE's transient allocations and binding offsets; replace dispatch code."""
    s = size
    mc, nc, kc = 64, 128, 256
    full_a = variant != "03_panel_a_panel"
    panel = variant != "01_full_a_full_k"
    names = re.findall(r"func.func @(gemm_dispatch_\w+)\(\)", template)
    assert len(names) == (3 if full_a else 2), names
    for name in names:
        start, end = span(template, template.index(f"func.func @{name}"))
        original = template[start:end]
        b = Body(name, original)
        c, add = b.c, b.add
        if "_pack_" in name:
            # Complete AP is a runtime transient, never a large stack allocation.
            b.bind("A", 0)
            b.bind("AP", 1)
            add(f"scf.for %mc = {c(0)} to {c(s)} step {c(mc)} {{")
            add(f"scf.for %kc = {c(0)} to {c(s)} step {c(kc)} {{")
            add(f"%ao0 = arith.muli %mc, {c(s)} : index")
            add("%ao = arith.addi %ao0, %kc : index")
            add(f"%ap0 = arith.muli %kc, {c(8)} : index")
            add("%apoff = arith.addi %ao0, %ap0 : index")
            b.call("pack", ["%A", "%ao", c(s), c(1), "%AP", "%apoff", c(s*8), c(8), c(mc), c(kc), c(mc//8), c(kc), c(8), c(1), "%zero64", "%packA"])
            add("}")
            add("}")
        elif "_unpack_" in name:
            b.bind("CP", 0)
            b.bind("C", 1)
            b.call("unpack", ["%CP", c(0), c(s*8), c(64), "%C", c(0), c(s), c(1), c(s//8), c(s//8), c(8), c(8), c(s), c(s), "%packA"])
        else:
            assert "_mmt4d_" in name, name
            b.bind("AP" if full_a else "A", 0)
            b.bind("BP", 1)
            b.bind("CP", 2)
            if not full_a:
                b.scratch("AP", mc*kc)
            add(f"scf.for %nc = {c(0)} to {c(s)} step {c(nc)} {{")
            if panel:
                add(f"scf.for %kc = {c(0)} to {c(s)} step {c(kc)} {{")
                add(f"%first = arith.cmpi eq, %kc, {c(0)} : index")
                add("%flags = arith.select %first, %base, %acc : i32")
            add(f"scf.for %mc = {c(0)} to {c(s)} step {c(mc)} {{")
            add(f"%a0 = arith.muli %mc, {c(s)} : index")
            add(f"%b0 = arith.muli %nc, {c(s)} : index")
            add(f"%cn = arith.muli %nc, {c(8)} : index")
            add("%co = arith.addi %a0, %cn : index")
            if panel:
                add(f"%ko = arith.muli %kc, {c(8)} : index")
                add("%apoff = arith.addi %a0, %ko : index")
                add("%bpoff = arith.addi %b0, %ko : index")
            if not full_a:
                add("%ao = arith.addi %a0, %kc : index")
                b.call("pack", ["%A", "%ao", c(s), c(1), "%AP", c(0), c(kc*8), c(8), c(mc), c(kc), c(mc//8), c(kc), c(8), c(1), "%zero64", "%packA"])
            b.call("mmt4d", ["%AP", ("%apoff" if panel else "%a0") if full_a else c(0), c(s*8 if full_a else kc*8), "%BP", "%bpoff" if panel else "%b0", c(s*8), "%CP", "%co", c(s*8), c(mc//8), c(nc//8), c(kc if panel else s), "%eight", "%eight", "%one", "%flags" if panel else "%base"])
            add("}")
            if panel:
                add("}")
            add("}")
        template = template[:start] + b.text() + template[end:]
        start, end = span(template, template.index(f"iree_codegen.dispatch_config @{name}"))
        config = f"iree_codegen.dispatch_config @{name} workgroup_size = [1, 1, 1] {{\n^bb0(%device: !hal.device):\n%one = arith.constant 1 : index\niree_codegen.yield %one, %one, %one : index, index, index\n}}"
        template = template[:start] + config + template[end:]
    return template.replace("max_stack_allocation_size = 32768", "max_stack_allocation_size = 131072")


def build_all(size, directory):
    import common
    d = Path(directory)
    d.mkdir(parents=True, exist_ok=True)
    for variant in VARIANTS:
        v = d / variant
        v.mkdir(exist_ok=True)
        if variant in VARIANTS[:2]:
            source = common.input_mlir(size, size, size) if variant == VARIANTS[0] else native_fixed_b_source(size)
            (v / "input.mlir").write_text(source)
            common.run([common.COMPILE, v / "input.mlir", *common.COMMON, "--iree-opt-data-tiling=true", "--compile-to=executable-configurations", "-o", v / "source.mlir"], v / "template.log")
        else:
            (v / "input.mlir").write_text(input_source(size, variant != CONTROLLED[2]))
            common.run([common.COMPILE, v / "input.mlir", *common.COMMON, "--iree-opt-data-tiling=false", "--compile-to=executable-configurations", "-o", v / "template.mlir"], v / "template.log")
            template = (v / "template.mlir").read_text()
            (v / "source.mlir").write_text(generate(template, size, variant))
        (v / "llvm-ir").mkdir(exist_ok=True)
        common.run([common.COMPILE, v / "source.mlir", *common.COMMON, "--compile-from=executable-configurations", "--iree-llvmcpu-stack-allocation-limit=131072", f"--iree-hal-dump-executable-intermediates-to={v}/llvm-ir", "-o", v / "module.vmfb"], v / "compile.log")
    (d / "pack-b.mlir").write_text(pack_b_source(size))
    common.run([common.COMPILE, d / "pack-b.mlir", *common.COMMON, "--iree-opt-data-tiling=false", "-o", d / "pack-b.vmfb"], d / "pack-b.log")
