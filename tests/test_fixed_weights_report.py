"""Reject incomplete or incompatible fixed-weight measurement evidence."""

import contextlib
import io
import json
from pathlib import Path
import tempfile
import unittest

from build_fixed_weights import VARIANTS
from summarize_fixed_weights import summarize


def fixture():
    return {
        "metadata": {"experiment": "fixed_b_controlled", "sizes": [2048], "rounds": 2, "iterations": 3, "hardware": {"cpu_details": "Model name: Test CPU\n"}},
        "results": [{"size": 2048, "variant": v, "times_ms": [t, t], "median_ms": t, "samples": [{"iterations": 3}, {"iterations": 3}]} for v,t in zip(VARIANTS, [110, 100, 120, 80, 100])],
        "setup": {"2048": {"b_pack_invocations": 1, "b_pack_layout_verified_exactly": True, "b_pack_once_ms_including_python_and_output_allocation": 1.2, "validation": [{"same_context_distinct_inputs": [{}, {}]} for _ in VARIANTS]}},
    }


class FixedWeightReportTests(unittest.TestCase):
    def test_schedule_and_packing_ratios_have_independent_controls(self):
        with tempfile.TemporaryDirectory() as tmp, contextlib.redirect_stdout(io.StringIO()):
            root = Path(tmp)
            source = root / "results.json"
            source.write_text(json.dumps(fixture()))
            self.assertFalse(summarize([("host", source)], root / "out", ["host"]))
            result = json.loads((root / "out/combined.json").read_text())["experiments"][0]
            self.assertEqual(result["cpu"], "Test CPU")
            summary = result["summary"][0]
            self.assertEqual(summary["schedule_speedup"], 1.5)
            self.assertEqual(summary["a_strategy_speedup"], 0.8)
            self.assertEqual(summary["overall_controlled_speedup"], 1.2)

    def test_missing_hosts_remain_missing(self):
        with tempfile.TemporaryDirectory() as tmp, contextlib.redirect_stdout(io.StringIO()):
            out = Path(tmp)
            self.assertTrue(summarize([], out, ["unreachable"]))
            self.assertEqual(json.loads((out / "combined.json").read_text())["missing_hosts"], ["unreachable"])

    def test_rejects_missing_variant_or_unamortized_b(self):
        with tempfile.TemporaryDirectory() as tmp, contextlib.redirect_stdout(io.StringIO()):
            root = Path(tmp)
            source = root / "results.json"
            for issue in ["variant", "packing", "samples"]:
                data = fixture()
                if issue == "variant":
                    data["results"].pop()
                elif issue == "packing":
                    data["setup"]["2048"]["b_pack_invocations"] = 2
                else:
                    data["results"][0]["times_ms"].pop()
                source.write_text(json.dumps(data))
                with self.subTest(issue=issue), self.assertRaises(AssertionError):
                    summarize([("host", source)], root / issue)


if __name__ == "__main__":
    unittest.main()
