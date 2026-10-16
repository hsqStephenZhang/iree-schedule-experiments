# 固定 B 实验的定义和边界

本实验回答：B 的转换已移出每次 GEMM 后，动态 A 使用全量 packing 还是 panel packing，计算按 full-K 还是 KC 分块，各有什么代价。计时入口只接收 A；B 是 immutable parameter。所有数据仍是方阵 FP32 GEMM，不代表 GEMV、decode 或小 batch 推理。

## 五个配置

| 配置 | B 的生命周期 | 每次 A packing | 计算 |
| --- | --- | --- | --- |
| `00_dynamic_baseline` | 每次重新打包 | 原生 IREE 全量 | 原生 IREE |
| `00_native_fixed_b` | 原生 IREE 在 context 初始化时打包一次 | 原生 IREE 全量 | 原生 IREE |
| ① `01_full_a_full_k` | 已打包参数，初始化时加载 | 全量，独立 dispatch/transient | NC→MC，每次 mmt4d 归约全部 K |
| ② `02_full_a_panel` | 同① | 与①相同 | NC→KC→MC，累加 C |
| ③ `03_panel_a_panel` | 同① | 计算前打包当前 MC×KC | 与②相同 |

三组控制均为 IREE 8×8×1 ukernel，MC=64、NC=128、KC=256；①的“full-K”也保留相同的 MC/NC 空间分块，不能解读为完全无任何 tiling。①/②考察 K 分块、循环次序与 C 读写次数；②/③考察 A 的完整策略，包括打包次数、packed stride、缓存、临时空间与 dispatch；①/③为总体策略比较。

原生基线保留目标 CPU 默认 kernel，可能使用 AVX512/不同微块。它与控制组的差异不能仅归因于 A packing。例如本次 Linux CI 为 AMD EPYC 9V45，而上次为 Xeon 8573C；相同 runner label 不保证同一物理 CPU，不能拼成同机前后对照。

## 布局和内存

- 三组控制的持久化 B 为 `[N/8,K,8,1]`，完全相同；由 IREE `pack_b` 实际执行一次并逐元素校验，然后写入同一 `weights.irpa`。这覆盖固定权重的离线预转换/加载方式，不要求把大型权重常量嵌进 MLIR。
- 原生固定 B 基线加载原始 `B_raw` parameter，IREE 自己将 native B packing 提升到 initializer。模板审计确认 `stream.cmd.execute once`；动态 A 的入口仍保留。
- 完整 A 为 `[M/8,K,8,1]`，每次调用重新创建 IREE transient；pack dispatch 在计算前完成，不使用 64 MiB 栈分配。
- panel A 使用 64×256×4 = 64 KiB scratch，packed tile stride 为 KC×8，而完整 A 的 stride 为 K×8。当前 NC 外层调度会重复打包 A `N/NC` 次：2048 为16次，4096为32次。4096 的逻辑 A 打包写入量分别为全量64 MiB、panel合计2 GiB；这不是实测 DRAM 流量。
- 三组都写入同形状的完整 tiled C transient，并使用同一独立 unpack dispatch。full-K 写入每个 C tile 一次；KC 分块在后续 K 面板读写累加。这里并未沿用旧 panel 实验在栈上保留 M×NC 输出 strip 的实现。
- 本轮固定了 B 的布局，没有同时搜索 KC-major 权重格式、NC/KC 参数、循环次序或新的 kernel。因此结果只适用于这组控制条件，不能推出 panel 的所有实现都优于/劣于 full packing。

panel 模板中的 A reshape 仅用于让编译器生成所需的 HAL bindings；它随后被手写的实际 packing/compute body 替换。`input.mlir` 是布局模板，`source.mlir` 才是最终编译输入，不能单独执行 panel 的模板来做参考计算。

## 计时口径

每项正式计时为10批，每批启动一个 native `iree-benchmark-module` context，在同一 context 中调用3次 GEMM；报告10个批均值的中位数。5个配置轮换/反向执行，单线程 `local-sync`，Linux 固定 CPU，macOS 无 affinity。原生 benchmark JSON 保存 real_time、cpu_time、iterations；没有将 Python 调用时间混入主表。

B 的一次性 packing、参数归档和 context 初始化均不在 native GEMM 主表内。A packing、GEMM、C unpack、dispatch、输出和临时空间分配仍在计时内。初始化/首次调用的 Python 测量单独记录，不应当作可直接扣除的 pack 微基准；原生固定 B 的 kernel/layout 也可能不同于控制组。

**本轮没有额外设置 Google Benchmark 的 warmup 时长，也没有 flush cache。** 这是“B 初始化后重复调用”的测量，不声称剔除了首次 GEMM 的 cache、缺页或分配效应。核对的 wheel 对应源码为 [iree-benchmark-module-main.cc@2b05c5d](https://github.com/iree-org/iree/blob/2b05c5d/tools/iree-benchmark-module-main.cc#L239)，generic sync 路径直接进入 KeepRunningBatch。metadata 中提到 warmup/timed calls 的生命周期描述不应理解为已经执行额外 warmup。

每个模块另外在同一 context 中分别输入两个不同 A，并与 float64 NumPy 参考比较，rtol/atol 均为1e-3；原生计时反复使用同一 A，编译器仍把它视为动态输入。B 布局还进行精确逐元素比较。源码与 VMFB 的 SHA256、pack 次数、模板审计、逐批样本与硬件信息均在结果 JSON 内。

Oracle 保持只跑2048，无 swap，未改变 governor/THP/perf 权限。其共享 VM 样本波动明显，几个百分点的差距不作稳定性能结论。此次新组别未另采 PMU，因此关于 cache/TLB 的解释仅为机制推测，旧实验的 PMU 不能充当本轮计数器。

## 学校 EPYC 7662 手动运行

用户确认该机在学校内网，需手动执行。主表暂不填入旧的动态 A/B 汇总数。

```sh
git pull
# 已安装项目依赖时可跳过以下三行。
python3.11 -m venv .venv
. .venv/bin/activate
python -m pip install -r requirements.txt

python -u run_fixed_weights_job.py --sizes 2048 4096 --rounds 10 --iterations 3 --output results/fixed-b-epyc7662
```

只需返回 `results/fixed-b-epyc7662/full/results.json`，即可用 `summarize_fixed_weights.py --dataset epyc7662=路径` 纳入同一格式；原始日志、源 IR、VMFB 和 benchmark JSON 留在该运行目录。脚本无需 Clang 或本地 IREE 源码。
