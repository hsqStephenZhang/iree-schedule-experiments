"""Platform and event availability regressions; run without IREE installed."""

import json
import io
import subprocess
from pathlib import Path
import tempfile
import unittest
from unittest import mock

import host_platform as host
from pmu_profiles import amd_config, intel_config, select_profile
from profile_perf import parse_counts


class PortabilityTests(unittest.TestCase):
    def test_arm64_alias_and_macos_unpinned(self):
        with mock.patch.object(host.platform, "machine", return_value="arm64"):
            self.assertEqual(host.architecture(), "aarch64")
        with mock.patch.object(host, "affinity", return_value=None):
            self.assertIsNone(host.pin_cpu())
            with self.assertRaisesRegex(ValueError, "omit --pin-cpu"):
                host.pin_cpu(0)

    def test_offline_cpu_is_not_selected(self):
        with (
            mock.patch.object(host, "affinity", return_value=[5, 7]),
            mock.patch.object(host.os, "sched_setaffinity", create=True) as setter,
        ):
            self.assertEqual(host.pin_cpu(), 5)
            setter.assert_called_once_with(0, {5})
            with self.assertRaisesRegex(ValueError, "not permitted"):
                host.pin_cpu(0)

    def test_hybrid_pmu_matches_pinned_core(self):
        with (
            mock.patch.object(Path, "exists", return_value=True),
            mock.patch.object(Path, "read_text", side_effect=["0-11\n", "12-19\n"]),
        ):
            self.assertEqual(host.native_pmu(16), "cpu_atom")

    def test_amd_missing_group_preserves_other_metrics(self):
        all_events = {e for es in amd_config()["groups"].values() for e in es}
        profile = select_profile("AuthenticAMD", all_events - {"ls_tablewalker.dside"})
        self.assertIn("dtlb", profile["unavailable_groups"])
        self.assertNotIn("dtlb", profile["groups"])
        self.assertNotIn("dside_pagewalks_per_1000_dc_accesses", profile["metrics"])
        self.assertIn(
            "l2_dc_request_miss_percent_including_prefetch", profile["metrics"]
        )
        self.assertIn("ipc", profile["metrics"])
        # Zen 3 cycles/instructions consume GP counters; leave one slot for NMI watchdog.
        self.assertTrue(all(len(es) <= 3 for es in profile["groups"].values()))

    def test_unrecognized_cpu_gets_only_portable_counters(self):
        profile = select_profile("ARM implementer", {"ls_tablewalker.dside"})
        self.assertEqual(profile["groups"], {"basic": []})
        self.assertEqual(set(profile["metrics"]), {"ipc"})

    def test_metric_denominators_stay_in_their_counter_window(self):
        for config in [amd_config(), intel_config()]:
            for metric in config["metrics"].values():
                measured = set(config["groups"][metric["group"]]) | {
                    "cycles",
                    "instructions",
                }
                self.assertTrue(
                    set(metric["numerator"] + metric["denominator"]) <= measured
                )
        # Profiles must remain serializable artifacts, without closures/raw CPU encodings.
        json.dumps(amd_config())

    def test_perf_csv_aliases_and_multiplex_rejection(self):
        with tempfile.TemporaryDirectory() as temp:
            report = Path(temp) / "counts.csv"
            report.write_text(
                "100;;cpu_atom/cycles/u;100000;100.00\n200;;instructions:u;100000;100.00\n"
            )
            self.assertEqual(set(parse_counts(report)), {"cycles", "instructions"})
            report.write_text("100;;cpu/cycles/u;100000;80.00\n")
            with self.assertRaisesRegex(RuntimeError, "multiplexed"):
                parse_counts(report)
            report.write_text("<not supported>;;cycles:u;0;100.00\n")
            with self.assertRaisesRegex(RuntimeError, "not measured"):
                parse_counts(report)

    def test_older_perf_aliases_preserve_hybrid_pmu_selection(self):
        events = ["cycles", "instructions", "mem_inst_retired.all_loads"]
        self.assertEqual(
            host.perf_event_group("cpu", events),
            "{cycles:u,instructions:u,cpu/mem_inst_retired.all_loads/u}",
        )
        self.assertEqual(
            host.perf_event_group("cpu_atom", events),
            "{cpu_atom/cycles/u,cpu_atom/instructions/u,cpu_atom/mem_inst_retired.all_loads/u}",
        )
        self.assertEqual(host.perf_event_group(None, events[:2]), "{cycles:u,instructions:u}")

    def test_blocked_perf_and_macos_still_finish_timing(self):
        import collect_metrics

        for system, cpu in [("Linux", 5), ("Darwin", None)]:
            with self.subTest(system=system), tempfile.TemporaryDirectory() as temp:
                root = Path(temp)
                source = root / "input"
                source.mkdir()
                (source / "metadata.json").write_text(json.dumps({"sizes": [256]}))
                d = source / "256x256x256"
                d.mkdir()
                for relative in [
                    "A.npy",
                    "B.npy",
                    "01_original/module.vmfb",
                    "02_panel_pack/module.vmfb",
                ]:
                    path = d / relative
                    path.parent.mkdir(exist_ok=True)
                    path.write_bytes(b"test fixture")
                out = root / "output"
                calls = []

                def execute(command, **kwargs):
                    calls.append(command)
                    if command[0] == "perf":
                        if "stat" in command:
                            return subprocess.CompletedProcess(
                                command, 1, "", "perf_event_open denied"
                            )
                        return subprocess.CompletedProcess(command, 0, "perf 7\n", "")
                    target = Path(command[command.index("--output") + 1])
                    target.write_text(json.dumps({"ms_per_gemm": 1.0, "iterations": 1}))
                    return subprocess.CompletedProcess(command, 0, "", "")

                with (
                    mock.patch.object(collect_metrics, "pin_cpu", return_value=cpu),
                    mock.patch.object(
                        collect_metrics,
                        "hardware_info",
                        return_value={"/proc/cpuinfo": "AuthenticAMD"},
                    ),
                    mock.patch.object(
                        collect_metrics.platform, "system", return_value=system
                    ),
                    mock.patch.object(
                        collect_metrics.shutil, "which", return_value="/usr/bin/perf"
                    ),
                    mock.patch.object(
                        collect_metrics.subprocess, "run", side_effect=execute
                    ),
                    mock.patch.object(
                        collect_metrics.sys,
                        "argv",
                        [
                            "collect_metrics.py",
                            "--input",
                            str(source),
                            "--output",
                            str(out),
                            "--rounds",
                            "1",
                            "--iterations",
                            "1",
                        ],
                    ),
                    mock.patch("sys.stdout", new_callable=io.StringIO),
                ):
                    collect_metrics.main()
                status = json.loads((out / "status.json").read_text())
                self.assertEqual(status["timing"], "complete")
                self.assertNotEqual(status["core_pmu"], "complete")
                self.assertEqual(
                    len(json.loads((out / "timing-records.json").read_text())), 2
                )
                if system == "Darwin":
                    self.assertTrue(
                        all(c[0] != "perf" and "--cpu" not in c for c in calls)
                    )


if __name__ == "__main__":
    unittest.main()
