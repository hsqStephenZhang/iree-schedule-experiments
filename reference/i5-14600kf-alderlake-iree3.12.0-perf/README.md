# Cache, TLB and DRAM analysis

Only `01_original` and `02_panel_pack` were profiled, using the exact VMFBs
from the IREE 3.12.0 confirmation run. Intel Core i5-14600KF, logical CPU 0
(P-core), single-threaded local-sync; Clang 22.1.3 and LLVM 24.

## Measurement

Inputs were uploaded to device buffers before counting. One GEMM warmed up
the module. `perf stat -D -1 --control=fd:...` enabled counting only around
three GEMM calls and disabled it before report writing. There was no input
transfer or output readback inside that window. Calls went through the Python
runtime interface; hardware counters include its small user-space overhead
and output allocation/release, but exclude kernel-mode execution.

Five separate event groups were measured in three independent rounds per
case. Each group used four programmable counters plus fixed cycles and
instructions. All 60 measured groups ran **100% of their windows**, without
multiplex scaling. The table reports medians of same-window ratios, not ratios
of separately collected counts. Raw perf CSV and timing records are in `pmu/`.

IMC measurements used two memory-controller PMUs, three rounds per case,
three GEMM calls per window, and two idle windows (before and after). IMC
counts are **system-wide**, including unrelated OS traffic. Approximate
background subtraction uses the median idle rate: 415.97 MiB/s reads and
52.55 MiB/s writes. Raw and adjusted values are both retained in `memory/`.

## Results

| Metric | Original 2048³ | Original 4096³ | Panel 2048³ | Panel 4096³ |
| --- | ---: | ---: | ---: | ---: |
| Instructions/GEMM (billions) | 2.694 | 21.514 | 2.753 | 22.004 |
| IPC | 3.625 | 1.898 | 3.536 | 3.230 |
| L1 load miss / retired loads (%) | 3.692 | 3.559 | 0.849 | 0.846 |
| L2 load miss / retired loads (%) | 0.0427 | 1.1999 | 0.0955 | 0.1233 |
| L3 load miss / retired loads (%) | 0.0183 | 1.1945 | 0.0455 | 0.1163 |
| LLC request miss rate (%) | 2.149 | 83.038 | 20.765 | 62.838 |
| LLC references/GEMM (millions) | 70.230 | 549.800 | 9.795 | 74.686 |
| LLC misses/GEMM (millions) | 1.507 | 456.518 | 2.034 | 46.821 |
| Total execution stall cycles (%) | 7.260 | 45.659 | 8.512 | 17.990 |
| L3-miss-related stall cycles (%) | 3.657 | 24.571 | 4.289 | 15.866 |
| DTLB load miss events / 1000 retired loads | 0.01698 | 0.00472 | 0.06331 | 0.02810 |
| DTLB store miss events / 1000 retired stores | 19.525 | 22.705 | 40.484 | 33.395 |
| Load page walks/GEMM | 983.3 | 963.0 | 2345.3 | 8174.0 |
| Store page walks/GEMM | 6919.3 | 12324.0 | 1481.7 | 14984.3 |
| Load page-walk-active cycles (%) | 0.01613 | 0.00146 | 0.02846 | 0.01659 |
| Store page-walk-active cycles (%) | 0.02598 | 0.00283 | 0.02490 | 0.01292 |
| DRAM read/GEMM, raw (GiB) | 0.173 | 28.882 | 0.169 | 4.624 |
| DRAM read/GEMM, background-adjusted (GiB) | 0.114 | 27.949 | 0.111 | 4.095 |
| DRAM write/GEMM, background-adjusted (GiB) | 0.065 | 0.305 | 0.031 | 0.205 |

Rates have different denominators. Retired-load miss rates use
`mem_inst_retired.all_loads`. LLC request miss rate uses
`longest_lat_cache.miss / longest_lat_cache.reference`: core-originated
cacheable L3 requests, excluding hardware prefetches directly to L3. Do not
compare these percentages as if they measured the same population.

DTLB miss events combine STLB hits and completed page walks. They describe
speculative demand activity normalized by retired instructions; these are
normalized event rates, not exact miss probabilities. Page-walk-active cycles
are another metric. Stall-cycle events overlap and must not be summed.

## Interpretation

The original executes about 7.985 times as many instructions at 4096³ as at
2048³, but its cycles increase about 15.18 times. Its LLC references grow from
70.23 million to 549.80 million (roughly the expected 8x), while LLC misses
grow from 1.51 million to 456.52 million (about 303x). IPC falls from 3.63 to
1.90. The extra instruction count is not the cause of the additional loss.

Total execution stalls grow from 7.26% to 45.66% of cycles. Comparing the
4096 counter window to 8x the 2048 window, about 89% of the extra cycles
correspond to extra execution-stall cycles. This is a cycle-accounting check,
not an exact causal partition. The L1-miss-associated stall counter closely
tracks the total, and L3-miss-associated stalls rise to 24.57% of cycles.

The concrete reuse problem is visible in the original SCF: the workgroup ID
is split into M and N tile indices, N varies fastest, and each 8x8 microtile
reduces full K. Each M tile traverses the packed B matrix. At 2048, packed B
is 16 MiB and can remain largely in the shared 24 MiB LLC. At 4096, B is
64 MiB and exceeds it. Scanning the whole B for 512 M microtiles would read
32 GiB if it were fetched each time; measured DRAM reads of roughly 28 GiB
per GEMM are consistent with losing that reuse.

Panel scheduling instead reuses the current packed B across all MC blocks,
with MC/NC/KC = 64/128/256. Its A/B scratch panels are 64/128 KiB. At 4096,
LLC references fall about 7.36x and LLC misses about 9.75x versus the original.
DRAM reads fall from approximately 28 to 4.1 GiB/GEMM, and IPC remains 3.23.
At 2048 the two versions have similar DRAM read traffic and similar runtime;
panel packing's higher conditional LLC miss rate is therefore not evidence
that it is slower. Absolute traffic and stalls matter alongside the rate.

TLB/page-walk events do not explain the original's 4096 loss on this machine.
Load and store page-walk-active cycles are each below 0.01% for that case.
Transparent huge pages were `[always]`; pre-window anonymous huge-page totals
were recorded. This conclusion about TLB costs is specific to this page setup,
not a prediction for a machine running only 4 KiB pages.

The evidence points to LLC capacity/reuse loss and resulting DRAM traffic
and memory stalls. IMC background subtraction is approximate and no PEBS
address attribution was performed; the B-scan explanation follows the actual
SCF access order and matches the measured traffic magnitude.

## Reproduce

First build and validate the benchmark artifacts with `reproduce.py`.
On a supported Intel P-core PMU with perf permissions:

```bash
python profile_perf.py --input results --output perf-results \
  --cpu 0 --rounds 3 --iterations 3
python profile_memory.py --input results --output memory-results \
  --cpu 0 --rounds 3 --iterations 3
```

IMC access requires system-wide perf permissions. These scripts do not change
`perf_event_paranoid`, governor, frequency, or THP settings. They are specific
to supported Intel `cpu_core`/IMC events; adapt the event mapping for other
CPUs. Missing events or counter multiplexing cause an explicit failure.

See `combined.json` for full numeric results and per-round scaling checks.
