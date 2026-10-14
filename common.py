"""Compiler helpers. No IREE source checkout is required."""

from pathlib import Path
import subprocess
import shutil

BUILD_ROOT = None
COMPILE = None
COMMON = []


def configure(output, cpu):
    global BUILD_ROOT, COMPILE, COMMON
    BUILD_ROOT = Path(output).resolve() / ".build"
    BUILD_ROOT.mkdir(parents=True, exist_ok=True)
    COMPILE = shutil.which("iree-compile")
    if not COMPILE:
        from iree.compiler.tools.binaries import find_tool

        COMPILE = find_tool("iree-compile")
    COMMON = [
        "--iree-hal-target-backends=llvm-cpu",
        f"--iree-llvmcpu-target-cpu={cpu}",
        "--iree-llvmcpu-enable-ukernels=all",
    ]


def input_mlir(M, N, K):
    return f"""module {{
  func.func @gemm(%a: tensor<{M}x{K}xf32>, %b: tensor<{K}x{N}xf32>) -> tensor<{M}x{N}xf32> {{
    %zero = arith.constant 0.0 : f32
    %empty = tensor.empty() : tensor<{M}x{N}xf32>
    %init = linalg.fill ins(%zero : f32) outs(%empty : tensor<{M}x{N}xf32>) -> tensor<{M}x{N}xf32>
    %c = linalg.matmul ins(%a, %b : tensor<{M}x{K}xf32>, tensor<{K}x{N}xf32>) outs(%init : tensor<{M}x{N}xf32>) -> tensor<{M}x{N}xf32>
    return %c : tensor<{M}x{N}xf32>
  }}
}}
"""


def run(args, log):
    args = list(map(str, args))
    p = subprocess.run(args, capture_output=True, text=True)
    log = Path(log)
    log.write_text(p.stdout + p.stderr)
    log.with_suffix(log.suffix + ".command.json").write_text(
        __import__("json").dumps(args, indent=2)
    )
    if p.returncode:
        raise RuntimeError(f"{log}: {p.stderr[-4000:]}")


def span(s, start):
    body = s.index(" {\n", start) + 1
    depth = 0
    for i in range(body, len(s)):
        if s[i] == "{":
            depth += 1
        elif s[i] == "}":
            depth -= 1
            if depth == 0:
                return start, i + 1
    raise ValueError("unclosed operation region")
