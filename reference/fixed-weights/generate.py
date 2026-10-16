#!/usr/bin/env python3
"""Rebuild the all-machine table from archived fixed-B JSON evidence."""

import hashlib
import json
from pathlib import Path
import sys

HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]
sys.path.insert(0, str(REPO))
from build_fixed_weights import CONTROLLED, VARIANTS
from summarize_fixed_weights import summarize


def main():
    hosts = [
        ("magic.root", "magic-root", [2048, 4096]),
        ("oracle.usa.amd1", "oracle", [2048]),
        ("ss420e", "ss420e", [2048, 4096]),
        ("ihciah", "ihciah", [2048, 4096]),
        ("local M2 Pro", "m2-pro", [2048, 4096]),
        ("ubuntu-24.04", "ubuntu-24.04", [2048, 4096]),
        ("macos-15", "macos-15", [2048, 4096]),
    ]
    if (HERE / "data/epyc7662.json").exists():
        hosts.append(("EPYC 7662 (manual)", "epyc7662", [2048, 4096]))
    datasets = []
    audit = []
    for label, key, expected_sizes in hosts:
        path = HERE / "data" / f"{key}.json"
        data = json.loads(path.read_text())
        assert data["metadata"]["sizes"] == expected_sizes, label
        assert data["metadata"]["rounds"] == 10, label
        assert data["metadata"]["iterations"] == 3, label
        for source in ["fixed_weights.py", "build_fixed_weights.py"]:
            assert data["metadata"]["source_hashes"][source] == hashlib.sha256((REPO / source).read_bytes()).hexdigest(), (label, source)
        for size in expected_sizes:
            modules = data["module_audit"][str(size)]
            assert modules[VARIANTS[1]]["b_pack_in_initializer"]
            for variant in CONTROLLED:
                row = modules[variant]
                assert row["mmt4d_geometry"] == [8, 8, 1]
                assert row["gemm_runtime_inputs"] == 1
                assert row["b_load_in_initializer_only"]
                assert row["a_panel_stack_bytes"] == (65536 if variant == CONTROLLED[2] else 0)
        audit.append({"host": label, "file": str(path.relative_to(HERE)), "file_sha256": hashlib.sha256(path.read_bytes()).hexdigest(), "sizes": expected_sizes, "variant_cases": len(data["results"]), "distinct_a_validations": sum(len(r["same_context_distinct_inputs"]) for setup in data["setup"].values() for r in setup["validation"]), "algorithm_source_hashes_match": True})
        datasets.append((label, path))
    assert not summarize(datasets, HERE, [h[0] for h in hosts])
    cases = sum(item["variant_cases"] for item in audit)
    validations = sum(item["distinct_a_validations"] for item in audit)
    note = f"""
## 覆盖与解读

本轮归档 {len(hosts)} 个环境、{cases} 个机器/尺寸/配置结果，共 {validations} 次不同 A 的数值校验；正式计时共 {cases*30} 次 GEMM。全部10轮×3次，未拼接旧数据。实现版本为 `9978477`，三组控制的两个核心源码哈希在全部环境一致。

原远程主机为 `root@magic.root`、`root@oracle.usa.amd1`、`sunqi@ss420e`、`root@ihciah`。Ryzen 使用用户确认的 ihciah 原容器、原 venv、haswell 目标与 CPU 5。Coder 上的临时探测数据未进入主表。Oracle 4096 按用户此前决定暂缓，未启用 swap。

GitHub [固定权重 CI](https://github.com/hsqStephenZhang/iree-schedule-experiments/actions/runs/38948593054) 的两台 runner 和合并 job 均成功。本次 Linux 实际 CPU 是 EPYC 9V45，不能与历史 Xeon 8573C 当作同机前后对照。学校 EPYC 7662 由用户在内网手动运行，尚未合并本轮数据；旧的动态结果不填入固定 B 表。

②/③最接近“只比较动态 A 的处理方式”，但依然包含分配、dispatch、布局 stride 和重复打包的影响。①/②显示计算分块有独立且依赖机器的作用：ss420e 的 panel 计算获益，而多台其他主机在当前参数下 full-K 更快。不能把旧动态四组的收益直接归因于本轮 A packing。

本轮固定 B 布局、MC/NC/KC 和输出 transient，并非对各策略分别做最佳参数搜索。Oracle 样本波动明显；Linux CI 的②/③近于持平；小差异不宣称统计显著。新实验未补采 PMU，不将计时结果解释为已经实测的 cache/TLB 因果。

详见 [实验定义、计时边界和 EPYC 命令](NOTES.md)。离线手动运行可使用 [独立源码包](fixed-weights-20261016.tar.gz)，文件哈希见 [bundle-info.json](bundle-info.json)。[generate.py](generate.py) 可从 data/ 重新生成本表及 combined.json；[verification.json](verification.json) 记录归档完整性检查。

[执行状态](execution-status.json) 记录5个本地/SSH环境和CI的成功状态；[artifact-verification.json](artifact-verification.json) 记录本地持有的45个 VMFB/源 IR 的独立字节哈希核对。CI20项的完整生成物仍保留在 GitHub artifact，未在本地重复下载校验。实际 [包版本](package-versions.json) 均为 IREE compiler/runtime 3.12.0、NumPy 2.4.6。
"""
    with (HERE / "README.md").open("a") as stream:
        stream.write(note)
    (HERE / "verification.json").write_text(json.dumps({"environments": len(hosts), "variant_cases": cases, "distinct_a_validations": validations, "timed_gemm_calls": cases*30, "files": audit}, indent=2))


if __name__ == "__main__":
    main()
