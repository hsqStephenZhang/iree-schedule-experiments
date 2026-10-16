#!/usr/bin/env python3
"""Collect fixed-weight result JSON files into a machine/size comparison table."""

import argparse
import json
from pathlib import Path
import re
import statistics

from build_fixed_weights import VARIANTS, CONTROLLED


def cpu_model(hardware):
    info = hardware.get("cpu_details", "") + "\n" + hardware.get("/proc/cpuinfo", "")
    for pattern in [r"Model name:\s*(.+)", r"machdep.cpu.brand_string:\s*(.+)", r"model name\s*:\s*(.+)"]:
        found = re.search(pattern, info)
        if found:
            return found.group(1).strip()
    return hardware.get("architecture", "unknown")


def summarize(datasets, output, expected_hosts=()):
    output.mkdir(parents=True, exist_ok=True)
    entries = []
    lines = ["# 固定 B 实验汇总", "", "时延为毫秒，是各批原生调用均值的中位数；单线程 local-sync，轮数和每批次数见下方配置。三组控制实验共用 IREE 8×8×1 微内核和预打包 B。原生 IREE 两条基线使用目标 CPU 默认微内核。", "", "| 主机 / CPU | 尺寸 | 动态 A/B 原生 | 固定 B 原生 | ① full A/full K | ② full A/panel | ③ panel A/panel | ①/② 调度收益 | ②/③ A 策略收益 |", "|---|---:|---:|---:|---:|---:|---:|---:|---:|"]
    labels = set()
    for label, source in datasets:
        if label in labels:
            raise ValueError(f"duplicate host: {label}")
        labels.add(label)
        data = json.loads(source.read_text())
        md = data["metadata"]
        assert md["experiment"] == "fixed_b_controlled"
        model = cpu_model(md["hardware"])
        host_rows = []
        for size in md["sizes"]:
            rows = {r["variant"]: r for r in data["results"] if r["size"] == size}
            assert set(rows) == set(VARIANTS), (label, size, set(rows))
            for row in rows.values():
                assert len(row["times_ms"]) == md["rounds"]
                assert len(row["samples"]) == md["rounds"]
                assert abs(statistics.median(row["times_ms"]) - row["median_ms"]) < 1e-8
                assert all(s["iterations"] == md["iterations"] for s in row["samples"])
            setup = data["setup"][str(size)]
            assert setup["b_pack_invocations"] == 1 and setup["b_pack_layout_verified_exactly"]
            assert len(setup["validation"]) == len(VARIANTS)
            assert all(len(v["same_context_distinct_inputs"]) == 2 for v in setup["validation"])
            t = {key: row["median_ms"] for key, row in rows.items()}
            schedule = t[CONTROLLED[0]] / t[CONTROLLED[1]]
            packing = t[CONTROLLED[1]] / t[CONTROLLED[2]]
            cells = " | ".join(f"{t[key]:.2f}" for key in VARIANTS)
            lines.append(f"| {label} / {model} | {size}³ | {cells} | {schedule:.3f}× | {packing:.3f}× |")
            host_rows.append({"size": size, "times_ms": t, "schedule_speedup": schedule, "a_strategy_speedup": packing, "overall_controlled_speedup": t[CONTROLLED[0]]/t[CONTROLLED[2]], "b_pack_once_ms": setup["b_pack_once_ms_including_python_and_output_allocation"]})
        entries.append({"host": label, "cpu": model, "source": str(source), "summary": host_rows, "data": data})
    missing = sorted(set(expected_hosts) - labels)
    if missing:
        lines += ["", "尚缺结果：" + ", ".join(missing)]
    lines += ["", "比值 >1 表示后一个策略更快。①/②包含 K 分块、循环次序与 C 累加次数变化；②/③包含 A 的打包次数、布局 stride、临时空间与 dispatch 差异，不能把时延差直接当作独立 pack 函数成本。", "", "| 主机 | LLVM target | 固定逻辑 CPU | 轮数 | 每批 GEMM 次数 |", "|---|---|---:|---:|---:|"]
    for entry in entries:
        md = entry["data"]["metadata"]
        cpu = md.get("logical_cpu")
        lines.append(f"| {entry['host']} | {md.get('target_cpu', '未提供')} | {cpu if cpu is not None else '未绑定'} | {md['rounds']} | {md['iterations']} |")
    lines += ["", "B 在 GEMM 计时外打包/加载。原生固定 B 基线由 IREE 自行 hoist B packing；三组控制实验使用同一个预打包参数文件。A packing、输出转换、dispatch 和临时/输出分配均在计时内。每轮复用输入，没有额外配置 warmup 时长，不清空 cache；结果不声称剔除了首次 GEMM 的 cache/分配效应。", "", "原始样本、验证记录、模块与源码 SHA256、硬件和编译器信息保存在 combined.json；各机器完整生成物保留在对应运行目录/CI artifact。", ""]
    (output / "README.md").write_text("\n".join(lines))
    (output / "combined.json").write_text(json.dumps({"experiments": entries, "missing_hosts": missing}, indent=2))
    print("\n".join(lines))
    return bool(missing)


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--dataset", action="append", default=[], help="label=/path/to/full/results.json")
    p.add_argument("--root", type=Path, help="Downloaded CI artifacts root")
    p.add_argument("--expected-hosts", nargs="*", default=[])
    p.add_argument("--output", type=Path, required=True)
    args = p.parse_args()
    datasets = [(item.split("=", 1)[0], Path(item.split("=", 1)[1])) for item in args.dataset]
    if args.root:
        for source in sorted(args.root.glob("**/full/results.json")):
            label = source.relative_to(args.root).parts[0].removeprefix("fixed-b-")
            datasets.append((label, source))
    if not datasets and not args.expected_hosts:
        p.error("provide --dataset or --root")
    raise SystemExit(summarize(datasets, args.output, args.expected_hosts))


if __name__ == "__main__":
    main()
