#!/usr/bin/env python3
"""Record CI provenance and combine native runner results without pooling hosts."""

import argparse
import csv
import json
import math
import os
from pathlib import Path
import re
import statistics

VARIANTS = ("01_original", "02_panel_pack", "03_panel_pack_kernel", "04_full_pack_kernel")


def read_json(path, default=None):
    return json.loads(path.read_text()) if path.is_file() else default


def write_json(path, data):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(data, indent=2) + "\n")


def context(output):
    names = ("CI_RUNNER_LABEL", "CI_JOB_STATUS", "CI_EXPERIMENT_OUTCOME",
             "RUNNER_OS", "RUNNER_ARCH", "RUNNER_NAME", "ImageOS", "ImageVersion",
             "GITHUB_REPOSITORY", "GITHUB_SHA", "GITHUB_RUN_ID", "GITHUB_RUN_ATTEMPT")
    data = {name: os.environ.get(name, "") for name in names}
    data["run_url"] = (
        f"{os.environ.get('GITHUB_SERVER_URL', 'https://github.com')}/"
        f"{data['GITHUB_REPOSITORY']}/actions/runs/{data['GITHUB_RUN_ID']}"
    ) if data["GITHUB_REPOSITORY"] and data["GITHUB_RUN_ID"] else ""
    write_json(output, data)


def cpu_model(metadata):
    hardware = metadata.get("hardware", {})
    details = "\n".join(str(hardware.get(key, "")) for key in
                        ("cpu_details", "/proc/cpuinfo"))
    for pattern in (r"^machdep\.cpu\.brand_string:\s*(.+)$",
                    r"^model name\s*:\s*(.+)$", r"^Model name:\s*(.+)$"):
        match = re.search(pattern, details, re.M)
        if match:
            return match.group(1).strip()
    return metadata.get("resolved_target", {}).get("cpu", "unknown")


def percentile(values, p):
    ordered = sorted(values)
    position = (len(ordered) - 1) * p
    lower = int(position)
    upper = min(lower + 1, len(ordered) - 1)
    return ordered[lower] + (ordered[upper] - ordered[lower]) * (position - lower)


def indexed(rows):
    return {(row["size"], row["variant"]): row for row in rows}


def markdown(rows, errors):
    columns = ["Runner", "CPU / ISA", "Size", "Variant", "Median ms (p10–p90)",
               "GFLOPS", "Speedup", "Max abs error", "Batches × GEMMs",
               "Independent ms (min–max)", "Core counters", "Memory counters", "Result"]
    extra = sorted({key for row in rows for key in row
                    if (key.startswith("pmu.") and key.endswith(".median"))
                    or key.startswith("memory.")})
    columns.extend(extra)

    def escape(value):
        return str(value).replace("|", "\\|").replace("\n", " ")

    text = ["# Native GEMM CI results", "",
            "Each row is one runner, size and variant. Speedups use the default on the same runner and size. "
            "Ranges describe observed batch variation, not confidence intervals. Hosted runners may vary between runs.", "",
            "All raw samples, compiler/host metadata, IR, binaries, input arrays and counter diagnostics are in the runner artifacts. "
            "summary.csv contains the complete flat table; summary.json retains the source reports. "
            "Unavailable counters are never inferred from timings.", "",
            "| " + " | ".join(columns) + " |", "| " + " | ".join("---" for _ in columns) + " |"]
    for row in rows:
        complete = row["result"] == "complete"
        number = lambda key, precision=3: f"{row[key]:.{precision}f}" if key in row else "—"
        values = [row["runner"], f"{row.get('cpu', 'unknown')} / {row.get('custom_isa', 'unknown')}",
                  row["size"], row["variant"],
                  f"{number('median_ms')} ({number('p10_ms')}–{number('p90_ms')})" if complete else "—",
                  number("gflops", 2), number("speedup_vs_original"),
                  f"{row['max_abs_error']:.3g}" if complete else "—",
                  f"{row.get('rounds', '—')} × {row.get('gemms_per_native_batch', '—')}",
                  f"{number('independent_median_ms')} ({number('independent_min_ms')}–{number('independent_max_ms')})",
                  row.get("core_pmu", "unavailable"), row.get("memory_status", "unavailable"), row["result"]]
        values.extend(f"{row[key]:.6g}" if isinstance(row.get(key), (int, float))
                      else row.get(key, "—") for key in extra)
        text.append("| " + " | ".join(escape(value) for value in values) + " |")
    if errors:
        text.extend(["", "## Incomplete or failed data", ""] + [f"- {escape(error)}" for error in errors])
    return "\n".join(text) + "\n"


def summarize(input_path, output, runners, sizes, rounds=5, native_iterations=3):
    reports, rows, errors = {}, [], []
    for path in sorted(input_path.glob("*/context.json")):
        ctx = read_json(path)
        runner = ctx["CI_RUNNER_LABEL"]
        if runner in reports:
            errors.append(f"duplicate artifact for {runner}")
            continue
        root = path.parent
        artifacts, metrics = root / "experiment/artifacts", root / "experiment/metrics"
        data = read_json(artifacts / "results.json", {})
        status = read_json(metrics / "status.json", {})
        pmu = read_json(metrics / "pmu/summary.json", [])
        memory = read_json(metrics / "memory/summary.json", {})
        reports[runner] = dict(context=ctx, benchmark=data, status=status,
                               independent_timing=read_json(metrics / "timing-summary.json", []),
                               independent_samples=read_json(metrics / "timing-records.json", []),
                               pmu=pmu, memory=memory,
                               event_definitions=read_json(metrics / "event-config.json", {}))
        if ctx.get("CI_JOB_STATUS") != "success" or ctx.get("CI_EXPERIMENT_OUTCOME") != "success":
            errors.append(f"{runner}: runner job/experiment did not succeed")
        if status.get("timing") != "complete" or status.get("error"):
            errors.append(f"{runner}: profiling did not complete: {status}")
        if not data:
            errors.append(f"{runner}: missing benchmark results")
    for runner in runners:
        report = reports.get(runner)
        if report is None:
            errors.append(f"missing runner artifact: {runner}")
        data = report["benchmark"] if report else {}
        metadata = data.get("metadata", {})
        measured = indexed(data.get("results", []))
        timing = indexed(report["independent_timing"]) if report else {}
        pmu = indexed(report["pmu"]) if report else {}
        memory = indexed(report["memory"].get("summary", [])) if report else {}
        root = next((p.parent for p in input_path.glob("*/context.json")
                     if read_json(p).get("CI_RUNNER_LABEL") == runner), None)
        for size in sizes:
            base = measured.get((size, VARIANTS[0]), {}).get("times_ms", [])
            for variant in VARIANTS:
                key = (size, variant)
                ctx = report["context"] if report else {}
                row = dict(runner=runner, os=ctx.get("RUNNER_OS", "unknown"),
                           architecture=metadata.get("architecture", "unknown"), cpu=cpu_model(metadata),
                           custom_isa=metadata.get("custom_kernel_isa", "unknown"),
                           target_cpu=metadata.get("resolved_target", {}).get("cpu", "unknown"),
                           runner_image=ctx.get("ImageVersion", ""), commit=ctx.get("GITHUB_SHA", ""),
                           run_url=ctx.get("run_url", ""), size=size, variant=variant,
                           result="missing benchmark", affinity_pinned=metadata.get("affinity_pinned"),
                           clang=metadata.get("clang", ""), compiler=metadata.get("compiler", ""))
                status = report["status"] if report else {}
                row["core_pmu"] = status.get("core_pmu", "unavailable: no runner report")
                row["memory_status"] = status.get("memory", "unavailable: no runner report")
                if key in measured:
                    try:
                        sample = measured[key]
                        values = sample["times_ms"]
                        if len(values) != rounds or not all(math.isfinite(v) and v > 0 for v in values):
                            raise ValueError("invalid or incomplete native timing samples")
                        if not base or not all(math.isfinite(v) and v > 0 for v in base):
                            raise ValueError("missing/invalid same-host baseline")
                        batch_counts = []
                        for index in range(rounds):
                            raw = read_json(root / "experiment/artifacts" / f"{size}x{size}x{size}" /
                                            variant / f"benchmark-{index}.json", {})
                            records = [r for r in raw.get("benchmarks", [])
                                       if r.get("run_type", "iteration") == "iteration"]
                            if len(records) != 1 or records[0].get("error_occurred"):
                                raise ValueError("missing/failed raw native benchmark")
                            batch_counts.append(records[0]["iterations"])
                        if any(count != native_iterations for count in batch_counts):
                            raise ValueError(f"native iteration counts differ from {native_iterations}: {batch_counts}")
                        median = statistics.median(values)
                        row.update(result="complete", median_ms=median,
                                   p10_ms=percentile(values, .1), p90_ms=percentile(values, .9),
                                   min_ms=min(values), max_ms=max(values), rounds=len(values),
                                   gemms_per_native_batch=native_iterations, times_ms=values,
                                   gflops=2 * size**3 / (median * 1e6),
                                   speedup_vs_original=statistics.median(base) / median,
                                   max_abs_error=sample["max_abs_error"], validation="float64 reference passed")
                    except (KeyError, TypeError, ValueError) as exc:
                        row["result"] = f"invalid benchmark: {exc}"
                if row["result"] != "complete":
                    errors.append(f"{runner}/{size}/{variant}: {row['result']}")
                if key in timing:
                    row.update({"independent_" + name: timing[key][name]
                                for name in ("median_ms", "min_ms", "max_ms")})
                    windows = [r for r in report["independent_samples"]
                               if (r["size"], r["variant"]) == key]
                    row["independent_samples_ms"] = [r["ms_per_gemm"] for r in windows]
                    row["independent_gemms_per_window"] = sorted({r["iterations"] for r in windows})
                else:
                    errors.append(f"{runner}/{size}/{variant}: independent timing missing")
                for name, metric in pmu.get(key, {}).get("metrics", {}).items():
                    row.update({f"pmu.{name}.{stat}": value for stat, value in metric.items()})
                for name, event in pmu.get(key, {}).get("event_counts_per_gemm", {}).items():
                    row.update({f"event.{name}.{stat}": value for stat, value in event.items()})
                row.update({f"memory.{name}": value for name, value in memory.get(key, {}).items()
                            if name not in ("size", "variant")})
                rows.append(row)
    output.mkdir(parents=True, exist_ok=True)
    write_json(output / "summary.json", dict(rows=rows, reports=reports, errors=errors))
    fields = list(dict.fromkeys(key for row in rows for key in row))
    with (output / "summary.csv").open("w", newline="") as file:
        writer = csv.DictWriter(file, fieldnames=fields)
        writer.writeheader()
        for row in rows:
            writer.writerow({key: json.dumps(value) if isinstance(value, (list, dict)) else value
                             for key, value in row.items()})
    rendered = markdown(rows, errors)
    (output / "summary.md").write_text(rendered)
    if os.environ.get("GITHUB_STEP_SUMMARY"):
        with Path(os.environ["GITHUB_STEP_SUMMARY"]).open("a") as file:
            file.write(rendered)
    print(rendered)
    return 1 if errors else 0


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    actions = parser.add_subparsers(dest="action", required=True)
    record = actions.add_parser("context")
    record.add_argument("--output", type=Path, required=True)
    summary = actions.add_parser("summarize")
    summary.add_argument("--input", type=Path, required=True)
    summary.add_argument("--output", type=Path, required=True)
    summary.add_argument("--expected-runners", nargs="+", required=True)
    summary.add_argument("--sizes", nargs="+", type=int, default=[2048, 4096])
    summary.add_argument("--rounds", type=int, default=5)
    summary.add_argument("--native-iterations", type=int, default=3)
    args = parser.parse_args()
    if args.action == "context":
        context(args.output)
        return 0
    return summarize(args.input, args.output, args.expected_runners, args.sizes,
                     args.rounds, args.native_iterations)


if __name__ == "__main__":
    raise SystemExit(main())
