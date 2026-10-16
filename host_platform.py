"""Native architecture, optional affinity and host information shared by all CLIs."""

import os
from pathlib import Path
import platform
import shutil
import subprocess


def architecture():
    machine = platform.machine().lower()
    arch = {
        "arm64": "aarch64",
        "aarch64": "aarch64",
        "amd64": "x86_64",
        "x86_64": "x86_64",
    }.get(machine)
    if arch is None:
        raise ValueError(f"Unsupported native architecture: {machine}")
    return arch


def affinity():
    return sorted(os.sched_getaffinity(0)) if hasattr(os, "sched_getaffinity") else None


def pin_cpu(cpu=None):
    allowed = affinity()
    if allowed is None:
        if cpu is not None:
            raise ValueError(
                "CPU affinity is unavailable on this platform; omit --pin-cpu"
            )
        return None
    selected = min(allowed) if cpu is None else cpu
    if selected not in allowed:
        raise ValueError(f"CPU {selected} is not permitted: {allowed}")
    os.sched_setaffinity(0, {selected})
    return selected


def hardware_info(cpu=None):
    info = dict(
        system=platform.system(),
        architecture=architecture(),
        platform=platform.platform(),
        affinity=affinity(),
        logical_cpu=cpu,
    )
    for name in [
        "/proc/cpuinfo",
        "/proc/self/status",
        "/proc/sys/kernel/perf_event_paranoid",
        "/sys/kernel/mm/transparent_hugepage/enabled",
    ]:
        if Path(name).exists():
            info[name] = Path(name).read_text()
    if cpu is not None:
        for name in ["topology/thread_siblings_list", "cpufreq/scaling_governor"]:
            path = Path(f"/sys/devices/system/cpu/cpu{cpu}") / name
            if path.exists():
                info[name] = path.read_text().strip()
    command = None
    if shutil.which("lscpu"):
        command = ["lscpu"]
    elif platform.system() == "Darwin":
        command = ["sysctl", "-a"]
    if command:
        proc = subprocess.run(command, capture_output=True, text=True, timeout=30)
        # Keep CPU/memory details, not every unrelated macOS sysctl.
        info["cpu_details"] = (
            proc.stdout
            if command[0] == "lscpu"
            else "\n".join(
                line
                for line in proc.stdout.splitlines()
                if line.startswith(
                    ("hw.", "machdep.cpu.", "kern.osrelease:", "kern.osversion:")
                )
            )
        )
    return info


def native_pmu(cpu):
    devices = Path("/sys/bus/event_source/devices")
    for pmu in ["cpu_core", "cpu_atom"]:
        cpus = devices / pmu / "cpus"
        if cpus.exists():
            for part in cpus.read_text().strip().split(","):
                bounds = part.split("-")
                if int(bounds[0]) <= cpu <= int(bounds[-1]):
                    return pmu
    return "cpu" if (devices / "cpu").exists() else None


def perf_event_group(pmu, events):
    # Older perf accepts portable aliases but rejects cpu/cycles/u. Hybrid
    # PMUs still need explicit qualification to select the pinned core type.
    def selector(event):
        if not pmu or (pmu == "cpu" and event in ("cycles", "instructions")):
            return f"{event}:u"
        return f"{pmu}/{event}/u"

    return "{" + ",".join(selector(event) for event in events) + "}"
