from build_kernel import *


def build_fastpack(size):
    d, tag = build(size, size, size, 6, 16, 8, 60, 128, 256)
    s = (d / f"{tag}.mlir").read_text()
    lines = s.splitlines()
    for i, line in enumerate(lines):
        if "func.call @iree_uk_pack" not in line:
            continue
        if "%B," in line:
            lines[i] = line.replace(
                "%BP, %c0, %c4096, %c128, %c256, %c128, %c8, %c32, %c8, %c16,",
                "%BP, %c0, %c4096, %c16, %c256, %c128, %c8, %c256, %c1, %c16,",
            )
        elif "%A," in line:
            lines[i] = line.replace(
                "%AP, %c0, %c1536, %c48, %rows, %c256, %mt, %c32, %c8, %c6,",
                "%AP, %c0, %c1536, %c6, %rows, %c256, %mt, %c256, %c1, %c6,",
            )
        assert lines[i] != line
    tag = "6x16x8-fastpack-60-128-256"
    (d / f"{tag}.mlir").write_text("\n".join(lines) + "\n")
    (d / f"{tag}-ir").mkdir(exist_ok=True)
    name = "custom_mmt4d_6x16x8"
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
