# Ryzen 7 5800H: original versus panel packing

Collected remotely with `collect_metrics.py` at commit `d3b4e21` using existing
validated artifacts. Artifact metadata/hashes were added after execution at
`408ed07`. IREE compiler/runtime 3.12.0, LLVM target `haswell`, `local-sync`,
logical CPU 5, one thread, 2048³ and 4096³, five alternating forward/reverse
rounds of three GEMMs each. Inputs are uploaded before one untimed warmup;
timed windows include GEMM packing, compute and output lifetime, without
input transfer or output readback. There is no cache flush.

| Version | 2048³ median ms (min–max) | 4096³ median ms (min–max) | 4096/2048 |
| --- | ---: | ---: | ---: |
| Original | 225.18 (224.42–228.78) | 1924.05 (1906.11–1946.91) | 8.545× |
| Panel packing | 187.20 (180.79–187.85) | 1558.60 (1496.42–1572.23) | 8.326× |

Panel packing improves median time by 1.203× at 2048 and 1.234× at 4096.
It wins every one of the five rounds at both sizes. These are empirical
ranges across five windows, not confidence intervals. The large/small ratio
does not reproduce the Intel host's approximately 14–15× original slowdown.
Timings alone do not identify cache/TLB causes.

## Hardware counters are blocked

Linux perf 7.2.8 was installed from the official Arch package archive (the
remote package database's selected version was no longer on its live mirror).
Both the hardware cycles/instructions preflight and a separate task-clock
probe failed. The process has CAP_PERFMON and CAP_SYS_ADMIN; seccomp is enabled,
`/proc/sys` is mounted read-only, and perf_event_paranoid is 4. This is a
container/host permission issue; its exact denying policy was not identified.
No cache miss rate, TLB miss rate, stall count, or DRAM traffic was measured
on this host. Missing counters are not represented as zeros.

The machine exposes the core `cpu`, `ibs_fetch` and `ibs_op` PMUs but no
shared AMD L3 PMU or supported Intel IMC PMU. The saved Zen 3 event configuration
uses core events, including L2 requests, cache fills by source and DTLB
reloads/pagewalks; it was selected from the installed perf event definitions
but could not be exercised while perf access remained blocked. Core cache-fill
counts would not be equivalent to total system DRAM bandwidth or Intel
retired-load miss percentages.

Host evidence reports 512 KiB L2 per core and 16 MiB shared L3. THP is
`madvise`; recorded AnonHugePages before each timed window is saved in the
individual timing JSONs. Consult the raw data rather than assuming the
Intel host's huge-page behavior applies here.

After the host allows the container's perf_event_open calls, rerun once with
a new output directory:

```sh
.venv/bin/python -u collect_metrics.py \
  --input gemm-2048-4096-results --output metrics-with-perf \
  --cpu 5 --sizes 2048 4096 --rounds 5 --iterations 3
```

`commands.json` records the executed subprocesses. `perf-preflight.txt` is
the raw access failure, `perf-events.txt` contains the installed event
definitions, `hardware.json` records CPU/permission/THP state, and
`artifact-metadata.json` records compiler metadata and VMFB hashes.
`timing-records.json` and `timing-summary.json` preserve all measurements.
Remote alignment edits were saved in a named Git stash before updating;
the updated three source files exactly match those edits.
