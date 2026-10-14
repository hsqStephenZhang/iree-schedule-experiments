# IREE GEMM schedule experiments

A standalone reproducer comparing four CPU GEMM variants: default IREE data
tiling, interleaved panel packing, a custom AVX2 microkernel, and the same
microkernel with complete input packing. No IREE source checkout or compiler
rebuild is required.

## Run

Requirements: Linux x86-64 with AVX2/FMA, Python 3.11, and Clang on `PATH`.
The pinned IREE 3.12.0 packages and Clang 22.1.3 were tested. Clang emits
LLVM bitcode, so its version must be compatible with the LLVM reader in IREE.

```bash
python3.11 -m venv .venv
source .venv/bin/activate
python -m pip install -r requirements.txt

bash run.sh --cpu haswell --pin-cpu 0 --sizes 2048 4096 \
  --repetitions 12 --min-time 3x --output results
```

Use the same `--cpu haswell` across AVX2 machines to keep the target ISA
consistent. `--cpu host` instead selects the native target; the original
version may then select another ukernel, including AVX512. Choose an available
physical-core logical CPU for `--pin-cpu`; by default, the first permitted
logical CPU is used. Execution uses the single-threaded `local-sync` driver.

For a quick sanity check:

```bash
bash run.sh --cpu haswell --sizes 256 --repetitions 1 --min-time 0.05s
```

`--build-only` generates and compiles all four variants without benchmarking.
Matrix sizes must be positive multiples of 256.

The single-file alternative embeds all Python helpers:

```bash
python reproduce.pyz --cpu haswell --sizes 2048 4096 --output results
```

## Recheck existing binaries

A second run can reuse the exact modules and inputs from the first run. Its
order cycles each variant through every position, reversing the base order
every four rounds:

```bash
python benchmark_existing.py --input results --output results-recheck \
  --pin-cpu 0 --repetitions 12 --min-time 3x
python analyze_runs.py results results-recheck --output combined.json
```

`3x` fixes each native batch at three timed GEMM invocations. Two runs of
12 rounds yield 24 batch averages and 72 timed invocations per version and
matrix size. The analysis reports pooled/group medians, empirical p10–p90
ranges, and speed ratios paired within each round. These ranges describe
observed variation; they are not statistical confidence intervals.

## Four versions

| Version | Packing | Compute |
| --- | --- | --- |
| `01_original` | Complete A/B tensors, in separate encoding dispatches | Default target-selected ukernel; full K reduction per output microtile |
| `02_panel_pack` | Current B panel, then current A panel immediately before use | Original AVX2 `8×8×1` ukernel; `nc → kc → mc` loops |
| `03_panel_pack_kernel` | Same panel approach | Custom `6×16` output kernel; K unrolled by 8 |
| `04_full_pack_kernel` | Complete A/B tensors, in separate encoding dispatches before compute | Same custom kernel; full K reduction without cache-panel K blocking |

Version 02 uses `MC=64, NC=128, KC=256`; version 03 uses `MC=60` to align with
its six-row microtile. Moving packing also changes compute blocking and
dispatch granularity, so the comparison does not isolate only packing cost.
Panel variants re-pack A for each N panel and retain an `M×NC` packed output
strip across K panels.

The custom row-major kernel mirrors the column-major `MR=16, K=8, NR=6`
shape: its A/B/C tiles are `6×8`, `8×16`, and `6×16`. Twelve YMM accumulators
hold C; B uses two vectors and A is broadcast. Pack calls use a K inner tile
of one while compute groups K by eight. Their linear packed layouts are
identical; this retains the faster pack implementation observed in testing.

Version 04 manually uses one M tile and two N tiles per workgroup, matching
the earlier July RC configuration; newer compiler defaults can differ. The
new geometry produces a
`6×32` output block, with one full-K kernel call and unpack. Its A pack tasks
cover `60×64` input chunks; B pack tasks cover `64×64`. The final M microtile
is zero-padded and output unpack clips to the real rows. New kernel geometry
requires a corresponding packed layout, but packing stays before compute.

## Confirmation with IREE 3.12.0

The updated scripts were rerun with the pinned 3.12.0 packages (the compiler
reports build `3.12.0rc20260917`, LLVM 24), Python 3.11, Clang 22.1.3,
`alderlake`, logical CPU 0, and single-threaded `local-sync`.

Two independent runs each used 12 rounds and three timed invocations per
native batch: 24 batch averages and **72 timed GEMMs per version and size**.
Run A alternated forward/reverse order; run B reused the exact binaries and
rotated the variant order. All module hashes were checked, and all 192 raw
native reports contain three iterations, one benchmark thread, and no errors.
All four versions passed float64-reference validation at both sizes.

| Version | 2048³ median | Speedup | 4096³ median | Speedup |
| --- | ---: | ---: | ---: | ---: |
| Original | 146.79 ms | 1.000× | 2178.14 ms | 1.000× |
| Panel packing | 146.21 ms | 1.004× | 1311.32 ms | 1.661× |
| Panel packing + custom kernel | 129.42 ms | 1.134× | 1161.38 ms | 1.875× |
| Complete packing + custom kernel | 117.40 ms | 1.250× | 2414.16 ms | 0.902× |

The 4096³ ranking was consistent in all 24 paired rounds: panel packing
beats the original, the custom kernel improves the panel variant, and
complete packing with the custom kernel loses to the original. The combined
panel/kernel version is about **1.88×** faster than the original; its separate
run medians are 1162.27 and 1161.20 ms.

At 2048³, panel packing alone is effectively tied with the original. Its
run speedups are 1.007× and 0.999×, and it wins only 16 of 24 paired rounds.
The custom-kernel variants improve consistently, with complete packing plus
the kernel fastest at this size in every paired round. These results narrow
the earlier claim: changing packing/scheduling helps clearly at 4096³, but
not reliably at 2048³.

The CPU governor was `powersave`; frequency was not locked. Empirical p10–p90
batch ranges, separate-run medians, and same-round ratios are recorded in
[combined.json](reference/i5-14600kf-alderlake-iree3.12.0-confirmation/combined.json) and [summary.csv](reference/i5-14600kf-alderlake-iree3.12.0-confirmation/summary.csv).
All new MLIR/LLVM IR and raw timings are in [run-a](reference/i5-14600kf-alderlake-iree3.12.0-confirmation/run-a);
the balanced-order repeat is in [run-b](reference/i5-14600kf-alderlake-iree3.12.0-confirmation/run-b).

## Cache/TLB diagnosis: original versus panel packing

Hardware-counter windows excluded input loading, startup and output readback.
Three rounds per event group ran without multiplexing. The original's 4096³
LLC request miss rate is 83.0%, versus 2.15% at 2048³; its LLC misses grow
about 303x although instructions grow only about 8x. IPC falls from 3.63 to
1.90, and total execution stalls rise from 7.26% to 45.66% of cycles.

At 4096³, panel scheduling cuts LLC misses about 9.75x and approximate DRAM
reads from 28 to 4.1 GiB/GEMM. Load/store page-walk-active cycles each remain
below 0.01% for the original 4096 case, so TLB walks are not its primary
bottleneck in this THP-enabled setup. The evidence identifies lost LLC reuse
and increased DRAM traffic/memory stalls as the main additional cost.

[Full cache/TLB/IMC results and methods](reference/i5-14600kf-alderlake-iree3.12.0-perf/README.md)
include counter definitions, raw counts, background estimates and profiling
commands. The IMC traffic measurements are system-wide and approximate.

## Earlier July RC reference

These archived measurements and IR were produced with the earlier
`3.12.0rc20260713` packages. The runnable scripts now target the pinned
`3.12.0` packages and use the newer `memref.alloca() alignment = 64` syntax.
Regenerate IR using the scripts when running with the current dependencies;
the historical dumps are retained unchanged.

Intel Core i5-14600KF, logical CPU 0, `alderlake` target, FP32, single-threaded
`local-sync`, five interleaved batches. Time includes runtime packing,
VM/dispatch, and output allocation. Inputs are runtime A/B tensors, not
pre-packed weights. Repeated identical inputs are used without explicit cache
flushing. These are measurements on this machine, not portable speedup claims.

| Version | 2048³ median | 4096³ median | 4096³ speedup |
| --- | ---: | ---: | ---: |
| Original | 153.96 ms | 2221.84 ms | 1.00× |
| Panel packing | 144.94 ms | 1320.88 ms | 1.68× |
| Panel packing + custom kernel | 127.00 ms | 1175.28 ms | 1.89× |
| Complete packing + custom kernel | 115.57 ms | 2442.81 ms | 0.91× |

All versions passed comparison with a float64 NumPy reference
(`rtol=1e-3`, `atol=1e-3`). Forward/reverse variant ordering alternates across
batches. A GEMM that exceeds `--min-time` can produce one timed iteration in
a batch. Every sample and machine/compiler details are recorded in
[results.json](reference/i5-14600kf-alderlake/results.json) and
[metadata.json](reference/i5-14600kf-alderlake/metadata.json).

## MLIR and LLVM IR

The earlier July RC artifacts for both matrix sizes are under
[reference/i5-14600kf-alderlake](reference/i5-14600kf-alderlake).

| 4096³ version | Editable source | Readable SCF calls | Final LLVM dialect MLIR |
| --- | --- | --- | --- |
| Original | [source](reference/i5-14600kf-alderlake/4096x4096x4096/01_original/source.mlir) | [SCF](reference/i5-14600kf-alderlake/4096x4096x4096/01_original/scf-calls.mlir) | [final](reference/i5-14600kf-alderlake/4096x4096x4096/01_original/final.mlir) |
| Panel packing | [source](reference/i5-14600kf-alderlake/4096x4096x4096/02_panel_pack/source.mlir) | [SCF](reference/i5-14600kf-alderlake/4096x4096x4096/02_panel_pack/scf-calls.mlir) | [final](reference/i5-14600kf-alderlake/4096x4096x4096/02_panel_pack/final.mlir) |
| Panel packing + kernel | [source](reference/i5-14600kf-alderlake/4096x4096x4096/03_panel_pack_kernel/source.mlir) | [SCF](reference/i5-14600kf-alderlake/4096x4096x4096/03_panel_pack_kernel/scf-calls.mlir) | [final](reference/i5-14600kf-alderlake/4096x4096x4096/03_panel_pack_kernel/final.mlir) |
| Complete packing + kernel | [source](reference/i5-14600kf-alderlake/4096x4096x4096/04_full_pack_kernel/source.mlir) | [SCF](reference/i5-14600kf-alderlake/4096x4096x4096/04_full_pack_kernel/scf-calls.mlir) | [final](reference/i5-14600kf-alderlake/4096x4096x4096/04_full_pack_kernel/final.mlir) |

`source.mlir` is a complete module at `executable-configurations`.
`scf-calls.mlir` contains diagnostic excerpts for all dispatches; it is meant
for inspection. `final.mlir` is a complete module at `executable-targets`,
which is subsequently serialized into the benchmarked VMFB. Custom kernel
C and optimized LLVM IR are included beside the MLIR; bitcode linking inserts
the custom kernel body after MLIR lowering.

New runs additionally save VMFBs, linked IR/assembly, bitcode, exact compiler
and benchmark command JSON, raw timings, and `summary.csv`. Large input
arrays and build caches are generated locally and are not tracked here.

## Validation

The complete four-version experiment was run at 2048³ and 4096³. The
reproducer was also copied outside the IREE checkout and successfully built,
executed, and numerically validated all four variants at 256³ with the
`haswell` target. The alignment syntax update and rebuilt `reproduce.pyz`
were verified at 256³ and 2048³ with the pinned 3.12.0 packages using Python
3.14.4. All four variants compiled, executed, and passed numerical checks.
Python files pass compilation checks, and `reproduce.pyz` embeds the same
Python sources as the repository.

This is an experimental fixed-shape reproducer, not a general GEMM library
or a patch to IREE's automatic scheduling passes. Generated IR comes from
[IREE](https://github.com/iree-org/iree); its runtime and compiler retain their
upstream licenses.
