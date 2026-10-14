#!/usr/bin/env python3
"""One entry point for native four-way GEMM benchmarks and available counters."""

import argparse
import json
from pathlib import Path
import platform
import shutil
import subprocess
import sys

from host_platform import hardware_info, pin_cpu

HERE = Path(__file__).resolve().parent


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "action",
        choices=["run", "bench", "profile", "doctor"],
        nargs="?",
        default="run",
    )
    parser.add_argument("--output", type=Path, default=Path("results"))
    parser.add_argument(
        "--input", type=Path, help="existing reproduce.py artifacts, for profile"
    )
    parser.add_argument(
        "--target-cpu",
        "--cpu",
        dest="target_cpu",
        default="host",
        help="LLVM CPU; normally detected natively",
    )
    parser.add_argument(
        "--pin-cpu", type=int, help="optional Linux logical CPU; macOS runs unpinned"
    )
    parser.add_argument(
        "--sizes",
        type=int,
        nargs="+",
        help="run default: 2048 4096; profile: input metadata",
    )
    parser.add_argument("--rounds", "--repetitions", dest="rounds", type=int, default=3)
    parser.add_argument(
        "--iterations", type=int, default=3, help="GEMMs per counter/timing window"
    )
    parser.add_argument(
        "--min-time", default="0.2s", help="native benchmark minimum time"
    )
    parser.add_argument("--backend", choices=["auto", "perf", "timing"], default="auto")
    parser.add_argument("--memory", choices=["auto", "skip"], default="auto")
    parser.add_argument(
        "--timeout", type=int, default=300, help="per profiling subprocess timeout"
    )
    parser.add_argument(
        "--build-only",
        action="store_true",
        help="only compile and dump the four variants",
    )
    args = parser.parse_args()
    if args.rounds < 1 or args.iterations < 1:
        parser.error("rounds and iterations must be positive")
    if args.build_only and args.action in ["profile", "doctor"]:
        parser.error("--build-only is used by run or bench")
    if args.action != "profile" and args.input is not None:
        parser.error("--input is only used by profile")
    if args.action == "profile" and args.input is None:
        parser.error("profile requires --input")
    try:
        cpu = pin_cpu(args.pin_cpu) if args.action != "doctor" else args.pin_cpu
        hardware = hardware_info(cpu)
    except ValueError as exc:
        parser.error(str(exc))
    if args.action == "doctor":
        print(
            json.dumps(
                dict(
                    hardware={
                        k: v
                        for k, v in hardware.items()
                        if k
                        in [
                            "system",
                            "architecture",
                            "platform",
                            "affinity",
                            "logical_cpu",
                            "cpu_details",
                            "/proc/sys/kernel/perf_event_paranoid",
                            "/sys/kernel/mm/transparent_hugepage/enabled",
                        ]
                    },
                    target_cpu=args.target_cpu,
                    kernel_isa="NEON"
                    if hardware["architecture"] == "aarch64"
                    else "AVX2/FMA",
                    tools={
                        tool: shutil.which(tool)
                        for tool in ["python3", "clang", "iree-compile", "perf"]
                    },
                    counter_backend="perf with event/permission probes"
                    if platform.system() == "Linux" and shutil.which("perf")
                    else "timing only",
                ),
                indent=2,
            )
        )
        return
    cpu_args = ["--pin-cpu", str(cpu)] if cpu is not None else []
    out = args.output.resolve()
    if out.exists() and any(out.iterdir()):
        parser.error("output must be new or empty")
    out.mkdir(parents=True, exist_ok=True)
    commands = []

    def run(script, extra):
        command = [sys.executable, "-u", str(HERE / script), *extra]
        commands.append(command)
        (out / "commands.json").write_text(json.dumps(commands, indent=2) + "\n")
        print("Running:", " ".join(command), flush=True)
        subprocess.run(command, check=True)

    if args.action in ["run", "bench"]:
        artifacts = out / "artifacts"
        run(
            "reproduce.py",
            [
                "--target-cpu",
                args.target_cpu,
                *cpu_args,
                "--sizes",
                *map(str, args.sizes or [2048, 4096]),
                "--repetitions",
                str(args.rounds),
                "--min-time",
                args.min_time,
                "--output",
                str(artifacts),
                *(["--build-only"] if args.build_only else []),
            ],
        )
    else:
        artifacts = args.input.resolve()
    if args.action in ["run", "profile"] and not args.build_only:
        run(
            "collect_metrics.py",
            [
                "--input",
                str(artifacts),
                "--output",
                str(out / "metrics"),
                *cpu_args,
                *(["--sizes", *map(str, args.sizes)] if args.sizes else []),
                "--rounds",
                str(args.rounds),
                "--iterations",
                str(args.iterations),
                "--backend",
                args.backend,
                "--memory",
                args.memory,
                "--timeout",
                str(args.timeout),
            ],
        )
    print("Results:", out, flush=True)


if __name__ == "__main__":
    main()
