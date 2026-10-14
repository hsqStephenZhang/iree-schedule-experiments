"""Cross-host report joins, unavailable metrics and partial CI failures."""

import contextlib
import csv
import io
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
from unittest import mock

from ci_results import VARIANTS, summarize, write_json


class CIResultsTests(unittest.TestCase):
    def setUp(self):
        temporary = tempfile.TemporaryDirectory()
        self.addCleanup(temporary.cleanup)
        self.root = Path(temporary.name)
        self.input = self.root / "downloaded"
        self.output = self.root / "combined"

    def runner(self, label, scale, mac=False):
        root = self.input / ("gemm-run-" + label)
        write_json(root / "context.json", {
            "CI_RUNNER_LABEL": label, "CI_JOB_STATUS": "success",
            "CI_EXPERIMENT_OUTCOME": "success", "RUNNER_OS": "macOS" if mac else "Linux",
        })
        metadata = dict(architecture="aarch64" if mac else "x86_64",
                        custom_kernel_isa="NEON" if mac else "AVX2/FMA",
                        resolved_target={"cpu": "apple-m1" if mac else "znver3"},
                        hardware={"cpu_details": "machdep.cpu.brand_string: Apple M1" if mac
                                  else "model name : AMD EPYC 7763"})
        rows, timing, windows, pmu = [], [], [], []
        for index, variant in enumerate(VARIANTS):
            values = [n * scale / (index + 1) for n in (10, 9, 11, 10, 12)]
            rows.append(dict(size=256, variant=variant, times_ms=values, max_abs_error=1e-5))
            timing.append(dict(size=256, variant=variant, median_ms=values[0],
                               min_ms=min(values), max_ms=max(values)))
            for round_, value in enumerate(values):
                windows.append(dict(size=256, variant=variant, ms_per_gemm=value,
                                    iterations=3, round=round_))
                write_json(root / "experiment/artifacts/256x256x256" / variant /
                           f"benchmark-{round_}.json", {"benchmarks": [{"iterations": 3}]})
            if not mac:
                pmu.append(dict(size=256, variant=variant,
                                metrics={"ipc": {"median": 2.0, "min": 1.9, "max": 2.1}},
                                event_counts_per_gemm={"cycles": {"median": 1000}}))
        write_json(root / "experiment/artifacts/results.json", dict(metadata=metadata, results=rows))
        write_json(root / "experiment/metrics/timing-summary.json", timing)
        write_json(root / "experiment/metrics/timing-records.json", windows)
        write_json(root / "experiment/metrics/pmu/summary.json", pmu)
        write_json(root / "experiment/metrics/status.json", {
            "timing": "complete", "core_pmu": "unavailable on macOS" if mac else "complete",
            "memory": "unavailable",
        })
        return root

    def summarize(self):
        with mock.patch.dict(os.environ, {}, clear=True), contextlib.redirect_stdout(io.StringIO()):
            return summarize(self.input, self.output, ["ubuntu-24.04", "macos-15"], [256])

    def test_hosts_are_joined_without_pooling_baselines_or_inventing_counters(self):
        self.runner("ubuntu-24.04", 1)
        self.runner("macos-15", 10, mac=True)
        self.assertEqual(self.summarize(), 0)
        report = json.loads((self.output / "summary.json").read_text())
        self.assertEqual(len(report["rows"]), 8)
        linux, mac = report["rows"][1], report["rows"][5]
        self.assertEqual(linux["speedup_vs_original"], 2.0)
        self.assertEqual(mac["speedup_vs_original"], 2.0)
        self.assertEqual(mac["median_ms"], 10 * linux["median_ms"])
        self.assertEqual(mac["cpu"], "Apple M1")
        self.assertEqual(linux["cpu"], "AMD EPYC 7763")
        self.assertEqual(linux["pmu.ipc.median"], 2.0)
        self.assertNotIn("pmu.ipc.median", mac)
        with (self.output / "summary.csv").open() as file:
            flat = list(csv.DictReader(file))
        self.assertEqual(len(flat), 8)
        self.assertEqual(flat[5]["pmu.ipc.median"], "")
        self.assertEqual(len(report["reports"]["macos-15"]["independent_samples"]), 20)

    def test_missing_runner_still_produces_complete_grid_and_fails(self):
        self.runner("ubuntu-24.04", 1)
        self.assertEqual(self.summarize(), 1)
        report = json.loads((self.output / "summary.json").read_text())
        self.assertEqual(len(report["rows"]), 8)
        self.assertTrue(any("missing runner artifact" in error for error in report["errors"]))
        self.assertTrue((self.output / "summary.md").exists())

    def test_incorrect_native_iteration_count_is_not_reported_as_success(self):
        root = self.runner("ubuntu-24.04", 1)
        self.runner("macos-15", 10, mac=True)
        write_json(root / "experiment/artifacts/256x256x256/01_original/benchmark-0.json",
                   {"benchmarks": [{"iterations": 2}]})
        self.assertEqual(self.summarize(), 1)
        report = json.loads((self.output / "summary.json").read_text())
        self.assertIn("iteration counts differ", report["rows"][0]["result"])

    def test_failed_job_with_partial_data_remains_failed(self):
        root = self.runner("ubuntu-24.04", 1)
        self.runner("macos-15", 10, mac=True)
        ctx = json.loads((root / "context.json").read_text())
        ctx["CI_JOB_STATUS"] = "failure"
        write_json(root / "context.json", ctx)
        self.assertEqual(self.summarize(), 1)

    def test_unified_entry_forwards_all_requested_profile_variants(self):
        import experiment
        argv = ["experiment.py", "--sizes", "256", "--output", str(self.root / "run"),
                "--profile-variants", *VARIANTS]
        with (mock.patch.object(sys, "argv", argv),
              mock.patch.object(experiment, "pin_cpu", return_value=None),
              mock.patch.object(experiment, "hardware_info", return_value={}),
              mock.patch.object(experiment.subprocess, "run", return_value=subprocess.CompletedProcess([], 0)) as run,
              contextlib.redirect_stdout(io.StringIO())):
            experiment.main()
        command = run.call_args_list[-1].args[0]
        start = command.index("--variants") + 1
        self.assertEqual(command[start:start + 4], list(VARIANTS))


if __name__ == "__main__":
    unittest.main()
