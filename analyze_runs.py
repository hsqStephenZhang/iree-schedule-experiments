#!/usr/bin/env python3
"""Summarize repeated runs and same-round speed ratios for GEMM variants."""

import argparse
import json
from pathlib import Path
import statistics


def percentile(values, p):
    values = sorted(values)
    position = (len(values) - 1) * p
    low = int(position)
    high = min(low + 1, len(values) - 1)
    return values[low] + (values[high] - values[low]) * (position - low)


def stats(values):
    return {
        "median": statistics.median(values),
        "p10": percentile(values, 0.1),
        "p90": percentile(values, 0.9),
        "min": min(values),
        "max": max(values),
        "samples": len(values),
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "runs", type=Path, nargs="+", help="directories containing results.json"
    )
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    data = [json.loads((p / "results.json").read_text()) for p in args.runs]
    for key in ["target_cpu", "logical_cpu", "compiler", "minimum_time", "sizes"]:
        if any(d["metadata"][key] != data[0]["metadata"][key] for d in data):
            parser.error(f"runs disagree on {key}")
    keys = sorted({(r["size"], r["variant"]) for d in data for r in d["results"]})
    result = {
        "method": "each sample is one native batch; intervals describe observed variation, not a confidence interval",
        "groups": [p.name for p in args.runs],
        "metadata": data[0]["metadata"],
        "rows": [],
        "paired_comparisons": [],
    }
    for size, variant in keys:
        grouped = [
            [r for r in d["results"] if r["size"] == size and r["variant"] == variant][
                0
            ]["times_ms"]
            for d in data
        ]
        pooled = [v for group in grouped for v in group]
        baseline = [
            v
            for d in data
            for r in d["results"]
            if r["size"] == size and r["variant"] == "01_original"
            for v in r["times_ms"]
        ]
        result["rows"].append(
            {
                "size": size,
                "variant": variant,
                "times_ms": stats(pooled),
                "group_medians_ms": [statistics.median(g) for g in grouped],
                "speedup_vs_original": statistics.median(baseline)
                / statistics.median(pooled),
            }
        )
    pairs = [
        ("01_original", v)
        for v in ["02_panel_pack", "03_panel_pack_kernel", "04_full_pack_kernel"]
    ] + [
        ("02_panel_pack", "03_panel_pack_kernel"),
        ("04_full_pack_kernel", "03_panel_pack_kernel"),
    ]
    for size in sorted({s for s, _ in keys}):
        for baseline, candidate in pairs:
            ratios = []
            for d in data:
                rows = {
                    r["variant"]: r["times_ms"]
                    for r in d["results"]
                    if r["size"] == size
                }
                if len(rows[baseline]) != len(rows[candidate]):
                    parser.error("paired runs must have equal round counts")
                ratios.extend(a / b for a, b in zip(rows[baseline], rows[candidate]))
            result["paired_comparisons"].append(
                {
                    "size": size,
                    "baseline": baseline,
                    "candidate": candidate,
                    "speed_ratios": stats(ratios),
                    "candidate_faster_rounds": sum(v > 1 for v in ratios),
                    "rounds": len(ratios),
                }
            )
    args.output.write_text(json.dumps(result, indent=2) + "\n")
    for row in result["rows"]:
        s = row["times_ms"]
        print(
            f"{row['size']} {row['variant']}: {s['median']:.3f} ms "
            f"(p10-p90 {s['p10']:.3f}-{s['p90']:.3f}), "
            f"{row['speedup_vs_original']:.3f}x; groups={row['group_medians_ms']}"
        )


if __name__ == "__main__":
    main()
