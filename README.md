# IREE GEMM schedule experiments

A standalone reproducer comparing four CPU GEMM variants: default IREE data
tiling, interleaved panel packing, a custom AVX2/NEON microkernel, and the same
microkernel with complete input packing. No IREE source checkout or compiler
rebuild is required.

## Run on the current machine

Supported native hosts are Intel/AMD x86-64 with AVX2/FMA and AArch64 with
NEON (including macOS Apple Silicon). Use Python 3.11 and a Clang version
compatible with IREE's LLVM bitcode reader. IREE 3.12.0 is pinned in
`requirements.txt`; no IREE checkout or rebuild is required.

```sh
python3.11 -m venv .venv
source .venv/bin/activate
python -m pip install -r requirements.txt

# Build and validate all four variants, benchmark, then collect available counters.
python experiment.py --sizes 2048 4096 --output results
# Equivalent shell entry: bash run.sh --sizes 2048 4096 --output results
```

No CPU-model flag is needed. The LLVM target defaults to `host` on both Intel
and AMD and on Apple Silicon. Custom kernels select AVX2/FMA or NEON by native
architecture. Linux pins to the first permitted logical CPU; `--pin-cpu 5`
overrides that. macOS runs unpinned and records that fact. Execution uses the
single-threaded `local-sync` driver everywhere. The result layout is:

```text
results/
  commands.json       # commands for the complete pipeline
  artifacts/          # four VMFBs, inputs, MLIR/LLVM IR, numerical checks, timings
  metrics/            # independent original/panel timings, counters, diagnostics
```

Useful commands use the same entry point:

```sh
python experiment.py doctor                          # host/tools and candidate backend
python experiment.py bench --output results/bench    # four-way benchmark only
python experiment.py profile --input results/artifacts --output results/profile
python experiment.py --sizes 256 --rounds 1 --iterations 1 --output results/smoke
python experiment.py --build-only --sizes 256 --output results/build
```

Matrix dimensions must be positive multiples of 256. Output directories must
be new or empty. `--rounds` sets benchmark batches and counter/timing windows;
`--iterations` sets GEMMs per counter/timing window. `--min-time 3x` fixes each
native benchmark batch at three GEMMs. Profiling defaults to original/panel
only, with sizes read from artifact metadata. `collect_metrics.py --variants`
can also profile the custom-kernel versions.

`--backend auto` is the default: Linux probes perf permissions and actual
named event groups on the selected core; missing events/groups are recorded
and omitted. Intel and AMD use separate event profiles, with an IPC-only
fallback when detailed events are not available. AMD groups leave one of
Zen 3's six GP counters free for the NMI watchdog. On hybrid Intel, the PMU
matches the pinned P-core or E-core. On macOS, or when perf is missing/blocked,
timing completes and `metrics/status.json` explicitly records unavailable
counters. **macOS hardware counters are not implemented**; timing is not
reported as cache/TLB data. `--backend perf` requires PMU collection and exits
with an error after saving timings/diagnostics if perf cannot complete.
`--backend timing` skips counters. Intel IMC collection is optional and uses
only the currently supported exposed PMUs; other DRAM counters are not guessed.

The script does not change perf permissions, container policy, governor or
THP. Install Linux `perf` separately when you want hardware counters.
Each metric's definition and raw counter command are preserved. Availability
is different from meaning: Intel retired-load miss rates and AMD cache-fill
rates must not be compared as if they were the same event.

The schedules/microtile geometry remain fixed experiments, not CPU-specific
automatic tuning. The custom output microtile is 6×16 on both ISAs; native
IREE may select another default kernel, including AVX512 on capable x86 CPUs.
Thus a native-target run compares complete configurations and does not always
isolate packing alone. For the earlier controlled AVX2 experiment, explicitly
use `--target-cpu haswell`; an AMD-specific target such as `znver3` is also
supported. The actual resolved CPU/features/triple and custom ISA are saved.

The older lower-level scripts remain available: `reproduce.py --cpu` aliases
`--target-cpu`, while profiling `--cpu` aliases the logical `--pin-cpu`.
The unified entry uses `--target-cpu` and `--pin-cpu` to avoid this ambiguity.
`run.sh` forwards to the unified entry; its output now contains `artifacts/`
and `metrics/`. It accepts the legacy `--cpu`/`--repetitions` spellings.

The single-file zipapp retains the lower-level four-way builder entry point:

```sh
python reproduce.pyz --sizes 2048 4096 --output gemm-four-results
```

## Recheck existing binaries

A second run can reuse the exact modules and inputs from the first run. Its
order cycles each variant through every position, reversing the base order
every four rounds:

```bash
python benchmark_existing.py --input results/artifacts --output results-recheck \
  --repetitions 12 --min-time 3x
python analyze_runs.py results/artifacts results-recheck --output combined.json
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
| `02_panel_pack` | Current B panel, then current A panel immediately before use | IREE `8×8×1` ukernel on the native ISA; `nc → kc → mc` loops |
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

## One-shot hardware counter collection

Use existing validated VMFBs and input arrays (the same artifacts on every run):

```sh
.venv/bin/python -u collect_metrics.py \
  --input gemm-2048-4096-results --output metrics-results \
  --cpu 5 --sizes 2048 4096 --rounds 3 --iterations 3
```

Select an online CPU allowed by your process; the default is the first CPU in
its affinity mask. Install your distribution's Linux `perf` package first.
The script does not change system permissions, THP, CPU governor, or container
security settings. It checks perf access and records diagnostics before running
any large GEMM. All subprocess commands are saved in `commands.json` and the
individual PMU windows also save their actual `perf stat` command.

The entry point profiles **only original and panel packing**, preserves hardware,
compiler metadata and VMFB hashes, and alternates forward/reverse case order.
Counters cover warmed, preloaded `local-sync` GEMM calls, including runtime
packing and output allocation, without input transfer or output readback.
Independent timing windows are always collected. Each window contains the
requested number of GEMMs; summaries contain median/min/max across rounds.
Each named hardware event group has cycles and instructions and at most four
additional events. Preflight omits unschedulable groups. A measured window with unsupported
counters or multiplexing below 99% fails the PMU run and saves diagnostics
while independent timing still completes.

Intel uses the existing cache/TLB/stall events on `cpu_core` or `cpu`.
AMD uses named Zen 3 core events for DC accesses, L2 requests, demand/all cache
fills by source, DTLB reloads by page size and D-side pagewalks. Other AMD
models use whichever selected named event groups are advertised and schedulable;
unavailable groups are recorded and no raw encoding is guessed.
AMD event meanings differ from Intel retired-load miss rates: definitions and
explicit numerators/denominators are saved in `event-config.json` and PMU
metadata. Core `mem_io_local` fills include DRAM/IO and do not measure total
system DRAM bandwidth or a direct LLC miss probability.

Intel IMC traffic is also collected when the supported free-running IMC PMUs
are exposed; `--memory skip` disables that step. AMD shared L3/IMC counters are
not assumed available. `status.json` explicitly reports missing metrics.
When perf permissions are blocked, the script completes independent timings
and saves the failure in `perf-preflight.txt`; it does **not** report cache/TLB
rates. Containers may block `perf_event_open` through seccomp even with root
and `CAP_PERFMON`; that requires a host/container policy change.

The [Ryzen 7 5800H remote run](reference/ryzen-5800h-haswell-iree3.12.0-metrics)
contains five rounds of timing and perf permission diagnostics. Original
2048³/4096³ medians were 225.18/1924.05 ms; panel medians were
187.20/1558.60 ms. Container perf access was blocked, so this dataset contains
**no measured cache/TLB rates**. Its original scaling was 8.545×, compared
with panel's 8.326×; it did not reproduce the Intel host's much larger scaling
penalty. See that dataset's README for the exact scope and remaining blocker.

## AArch64 NEON measurements

An initial native port was measured on macOS 27.0.1 with IREE's `host` CPU
resolved to `apple-m2`, IREE package version 3.12.0, and Clang 22.1.4.
The compiler reports `3.12.0rc20260917`, LLVM 24.0.0git. FP32, single-threaded
`local-sync`, five alternating-order batches, `--min-time 0.2s`, no cache
flush, no CPU affinity or explicit power-mode control. The microtile and
panel dimensions were retained from the x86 experiment; they have not been
tuned for NEON. This compares complete schedules and does not isolate packing.

| Version | 2048³ median | 4096³ median | 4096³ speedup |
| --- | ---: | ---: | ---: |
| Original | 178.46 ms | 1433.42 ms | 1.00× |
| Panel packing | 190.61 ms | 1559.12 ms | 0.92× |
| Panel packing + NEON kernel | 301.08 ms | 2442.14 ms | 0.59× |
| Complete packing + NEON kernel | 180.29 ms | 1435.54 ms | 1.00× |

All four variants passed float64 NumPy comparison at 256³, 2048³, and 4096³
with `rtol=1e-3`, `atol=1e-3`. Maximum absolute error at 4096³ was
`9.26e-4`. The linked IR selects the IREE ARM `8×8×1` FP32 kernel for
version 02. Final assembly contains NEON `fmla` for the custom kernels and
does not use the macOS platform register `x18`.

These configurations provided no speedup over the default path in this run.
Timings alone do not establish why panel packing or the custom panel kernel
was slower. The measurements do not imply that other NEON microtiles or
cache blocking choices cannot improve performance.

Samples, compiler/target metadata, and CSV summary are archived in
[reference/apple-m2-neon](reference/apple-m2-neon). Complete generated IR,
assembly, VMFBs, compiler commands, benchmark logs, and inputs from this run
remain locally under `results/neon`.

### Diagnostic follow-up

The physical CPU was confirmed as **Apple M2 Pro** using `sysctl`. Performance
clusters have 128 KiB L1D per core and 16 MiB shared L2; efficiency clusters
have 64 KiB L1D per core and 4 MiB shared L2. The runs remain unpinned.

The archived x86 default path loses throughput as size increases: 111.58
GFLOPS at 2048³ versus 61.86 GFLOPS at 4096³, while its panel path sustains
118.53 and 104.05 GFLOPS. The Mac default sustains 96.27 and 95.88 GFLOPS.
Thus the x86 panel optimization recovers a large-matrix performance loss
that is largely absent from this Mac baseline. Different cache hierarchies
are a plausible contributor. This is not a hardware-counter diagnosis, and
the x86 archive also uses an earlier IREE compiler/runtime release.

Controlled 4096³ diagnostics used three alternating-order batches:

| Counterfactual or panel configuration | Median |
| --- | ---: |
| Default, repeated in diagnostic batch | 1422.33 ms |
| Panel `MC=64 NC=128 KC=256` | 1574.15 ms |
| Same panel with A already packed | 1501.54 ms |
| Same panel with A/B already packed | 1471.15 ms |
| Panel `MC=64 NC=128 KC=64` | 1726.66 ms |
| Panel `MC=64 NC=128 KC=512` | 1522.51 ms |
| Panel `MC=64 NC=128 KC=1024` | 1473.56 ms |
| Panel `MC=64 NC=128 KC=2048` | 1458.85 ms |
| Panel `MC=64 NC=64 KC=1024` | 1554.63 ms |
| Panel `MC=128 NC=128 KC=256` | 1567.48 ms |

Increasing KC reduces partial-C reloads/stores and panel loop overhead.
At 4096³, KC=256 writes each C element in 16 K panels; KC=2048 writes it in
two. For a 64 MiB output, minimum packed-C load/store volume falls from
about 1984 MiB to 192 MiB, excluding final unpack. This change alone brings
the original panel close to the default. Prepacked inputs still compute
the original GEMM, but have full-input strides rather than compact panel
strides; their timings are not an exact subtraction of packing time.

The custom kernel's six-row packing has a separate problem. IREE supplies
NEON FP32 pack specializations for shapes including `8×1` and `8×8`; the
`1×6` packing call uses the generic transpose path. In the final assembly,
the original A pack uses vector transpose instructions, while the custom
path contains generic loops. With NC=128, A is packed 4096/128 = 32 times:
approximately 2 GiB of packed A is materialized, compared with 64 MiB for
complete packing. Both original and custom panels repeat A; the generic
six-row implementation makes that repetition particularly expensive.

The diagnostic [neon_pack_a6.c](neon_pack_a6.c) specializes only A packing,
using vector loads and a 4×4 plus two-row transpose. It retains the six-row
layout, M-tail zero padding, microkernel and panel schedule. A second batch
measured:

| Configuration | Median |
| --- | ---: |
| Default | 1426.70 ms |
| Original panel | 1555.86 ms |
| Custom panel with generic A pack | 2425.70 ms |
| Same custom panel with specialized NEON A pack | 1547.14 ms |
| Complete packing + custom kernel | 1444.53 ms |
| Same complete path with specialized NEON A pack | 1411.83 ms |

Changing only A packing speeds up the custom panel by **1.57×**, confirming
that its large regression is substantially caused by packing. All GEMM
cases passed the same float64 reference. An additional 39 native packing
checks covered partial rows, noncompact strides, offsets, zero padding,
guard regions, and unsupported flags.

Replacing compute with an opaque memory barrier plus C-tile zeroing measured
196.91 ms for original panel packing, 1103.49 ms for generic custom panel
packing, and 208.23 ms for custom packing with the specialized A pack.
These include packing, loop/call overhead, C touches and final unpack.
Removing compute changes cache behavior, so these counterfactual times are
not an additive breakdown of GEMM runtime.

The supplied OpenBLAS checkout (`06f28d0942ee8eefce9aad7989d98743d2999932`)
maps M2 to `VORTEX`, which includes `KERNEL.NEOVERSEN1`. Its FP32 path uses
`sgemm_kernel_16x4.S`, with 16 vector accumulators and interleaved loads/FMAs;
its packed-data transpose uses vector ZIP operations. The column-major
16×4 geometry corresponds to 4×16 after transposing a row-major GEMM. The
`VORTEX` defaults in `param.h` are P=512, Q=1024, R=4096 (M/K/N in the
column-major driver). The driver packs B in small initial chunks, reuses
the accumulated B panel for later M blocks, and updates C directly. This
differs materially from our small NC=128 and packed M×NC output strip.
Row-major conversion exchanges operand roles, so those block sizes should
not be copied mechanically.

Useful next experiments are a wider outer panel with a compact C workspace
or direct C updates, and a 4×16 NEON kernel with matching packing. Simply
replacing AVX instructions while retaining x86 blocking does not implement
OpenBLAS's ARM schedule. Cache-miss counters or a same-release x86 rerun
would be needed to attribute the architecture difference more precisely.

The diagnostic script leaves the four-version reproducer's measured
configurations intact. To repeat all diagnostics, first generate native
256³/2048³/4096³ artifacts as above, then run:

```bash
.venv/bin/python analyze_neon.py --source results/neon --size 4096
```

[analysis-results.json](reference/apple-m2-neon/analysis-results.json) and
[specialized-pack-results.json](reference/apple-m2-neon/specialized-pack-results.json)
archive all samples. Full diagnostic artifacts remain locally in
`results/neon-analysis` and `results/neon-pack-specialized`.

### Four-way rerun with specialized A packing

All four versions were measured again at 2048³ and 4096³, using five
alternating-order batches and `--min-time 0.2s` on the same unpinned M2 Pro.
Versions 03 and 04 use `neon_pack_a6`; version 02 retains IREE packing.
The original blocking is retained: version 02 uses MC=64, NC=128, KC=256,
and version 03 uses MC=60, NC=128, KC=256. Version 04 reduces full K.

| Version | 2048³ median | Speedup | 4096³ median | Speedup |
| --- | ---: | ---: | ---: | ---: |
| Original | 180.10 ms | 1.000× | 1418.10 ms | 1.000× |
| Panel packing | 192.16 ms | 0.937× | 1550.19 ms | 0.915× |
| Panel + custom NEON kernel, specialized A pack | 189.12 ms | 0.952× | 1540.65 ms | 0.920× |
| Complete packing + custom NEON kernel, specialized A pack | 176.22 ms | 1.022× | 1420.84 ms | 0.998× |

Every combination passed float64 NumPy comparison (`rtol=1e-3`, `atol=1e-3`).
Maximum absolute error was `4.94e-4` at 2048³ and `9.26e-4` at 4096³.
Specialized A packing brings the custom panel close to the original panel;
with these blocking parameters neither panel version beats the default.
The small difference between complete packing and the default should be
interpreted with the unpinned execution and sample variation in mind.

Samples, metadata, exact driver commands, and CSV summary are in
[reference/apple-m2-neon-refined](reference/apple-m2-neon-refined).
Compiled diagnostic sources, linked IR/assembly, VMFBs, and raw benchmark
files remain under `results/neon-four-refined`. To repeat this four-way run
using the native artifacts already generated in `results/neon`:

```bash
for gemm_size in 2048 4096; do
  .venv/bin/python analyze_neon.py --source results/neon \
    --size "$gemm_size" --repetitions 5 --min-time 0.2s \
    --output "results/neon-four-refined/${gemm_size}x${gemm_size}x${gemm_size}" \
    --only 01_original 02_panel_pack \
      03_panel_pack_kernel_neon_A_pack 04_full_pack_kernel_neon_A_pack
done
```


## Portable entry validation

The merged entry was checked with eight dependency-free portability tests
(`python -m unittest discover -s tests -v`). A native Intel `host` run at 256³
built, executed and numerically verified all four variants, and completed all
selected core PMU groups plus independent timing. NEON generation was
cross-compiled with Clang and checked for `fmla` and reserved macOS `x18`.
The Apple native measurements above come from `fix/macos`; this integration
was not rerun on a Mac. Missing/blocked counters remain explicit in saved
status and are never synthesized from elapsed time.
