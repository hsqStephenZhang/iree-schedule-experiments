# 固定 B 实验汇总

时延为毫秒，是各批原生调用均值的中位数；单线程 local-sync，轮数和每批次数见下方配置。三组控制实验共用 IREE 8×8×1 微内核和预打包 B。原生 IREE 两条基线使用目标 CPU 默认微内核。

| 主机 / CPU | 尺寸 | 动态 A/B 原生 | 固定 B 原生 | ① full A/full K | ② full A/panel | ③ panel A/panel | ①/② 调度收益 | ②/③ A 策略收益 |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| magic.root / Intel(R) Core(TM) i5-14600KF | 2048³ | 142.48 | 140.84 | 132.77 | 142.21 | 144.71 | 0.934× | 0.983× |
| magic.root / Intel(R) Core(TM) i5-14600KF | 4096³ | 2077.46 | 2028.70 | 1097.23 | 1206.35 | 1332.09 | 0.910× | 0.906× |
| oracle.usa.amd1 / AMD EPYC 7551 32-Core Processor | 2048³ | 1504.72 | 1512.31 | 1441.83 | 1468.99 | 1498.05 | 0.982× | 0.981× |
| ss420e / Intel(R) Xeon(R) Silver 4310 CPU @ 2.10GHz | 2048³ | 280.05 | 257.69 | 271.67 | 232.98 | 236.79 | 1.166× | 0.984× |
| ss420e / Intel(R) Xeon(R) Silver 4310 CPU @ 2.10GHz | 4096³ | 2502.46 | 2487.57 | 2264.28 | 1854.57 | 1919.85 | 1.221× | 0.966× |
| ihciah / AMD Ryzen 7 5800H with Radeon Graphics | 2048³ | 236.39 | 230.13 | 217.12 | 209.24 | 219.72 | 1.038× | 0.952× |
| ihciah / AMD Ryzen 7 5800H with Radeon Graphics | 4096³ | 1949.32 | 1911.68 | 1669.90 | 1629.23 | 1755.78 | 1.025× | 0.928× |
| local M2 Pro / Apple M2 Pro | 2048³ | 174.58 | 171.68 | 168.38 | 178.17 | 185.96 | 0.945× | 0.958× |
| local M2 Pro / Apple M2 Pro | 4096³ | 1390.45 | 1360.43 | 1347.76 | 1446.65 | 1532.73 | 0.932× | 0.944× |
| ubuntu-24.04 / AMD EPYC 9V45 96-Core Processor | 2048³ | 77.05 | 75.29 | 155.36 | 162.62 | 162.97 | 0.955× | 0.998× |
| ubuntu-24.04 / AMD EPYC 9V45 96-Core Processor | 4096³ | 1072.39 | 1050.01 | 1193.41 | 1329.69 | 1329.08 | 0.898× | 1.000× |
| macos-15 / Apple M1 (Virtual) | 2048³ | 202.03 | 198.85 | 190.95 | 214.42 | 216.71 | 0.891× | 0.989× |
| macos-15 / Apple M1 (Virtual) | 4096³ | 2155.44 | 1973.43 | 1963.90 | 2158.32 | 2383.25 | 0.910× | 0.906× |

比值 >1 表示后一个策略更快。①/②包含 K 分块、循环次序与 C 累加次数变化；②/③包含 A 的打包次数、布局 stride、临时空间与 dispatch 差异，不能把时延差直接当作独立 pack 函数成本。

| 主机 | LLVM target | 固定逻辑 CPU | 轮数 | 每批 GEMM 次数 |
|---|---|---:|---:|---:|
| magic.root | host | 0 | 10 | 3 |
| oracle.usa.amd1 | host | 0 | 10 | 3 |
| ss420e | host | 0 | 10 | 3 |
| ihciah | haswell | 5 | 10 | 3 |
| local M2 Pro | host | 未绑定 | 10 | 3 |
| ubuntu-24.04 | host | 0 | 10 | 3 |
| macos-15 | host | 未绑定 | 10 | 3 |

B 在 GEMM 计时外打包/加载。原生固定 B 基线由 IREE 自行 hoist B packing；三组控制实验使用同一个预打包参数文件。A packing、输出转换、dispatch 和临时/输出分配均在计时内。每轮复用输入，没有额外配置 warmup 时长，不清空 cache；结果不声称剔除了首次 GEMM 的 cache/分配效应。

原始样本、验证记录、模块与源码 SHA256、硬件和编译器信息保存在 combined.json；各机器完整生成物保留在对应运行目录/CI artifact。

## 覆盖与解读

本轮归档 7 个环境、65 个机器/尺寸/配置结果，共 130 次不同 A 的数值校验；正式计时共 1950 次 GEMM。全部10轮×3次，未拼接旧数据。实现版本为 `9978477`，三组控制的两个核心源码哈希在全部环境一致。

原远程主机为 `root@magic.root`、`root@oracle.usa.amd1`、`sunqi@ss420e`、`root@ihciah`。Ryzen 使用用户确认的 ihciah 原容器、原 venv、haswell 目标与 CPU 5。Coder 上的临时探测数据未进入主表。Oracle 4096 按用户此前决定暂缓，未启用 swap。

GitHub [固定权重 CI](https://github.com/hsqStephenZhang/iree-schedule-experiments/actions/runs/38948593054) 的两台 runner 和合并 job 均成功。本次 Linux 实际 CPU 是 EPYC 9V45，不能与历史 Xeon 8573C 当作同机前后对照。学校 EPYC 7662 由用户在内网手动运行，尚未合并本轮数据；旧的动态结果不填入固定 B 表。

②/③最接近“只比较动态 A 的处理方式”，但依然包含分配、dispatch、布局 stride 和重复打包的影响。①/②显示计算分块有独立且依赖机器的作用：ss420e 的 panel 计算获益，而多台其他主机在当前参数下 full-K 更快。不能把旧动态四组的收益直接归因于本轮 A packing。

本轮固定 B 布局、MC/NC/KC 和输出 transient，并非对各策略分别做最佳参数搜索。Oracle 样本波动明显；Linux CI 的②/③近于持平；小差异不宣称统计显著。新实验未补采 PMU，不将计时结果解释为已经实测的 cache/TLB 因果。

详见 [实验定义、计时边界和 EPYC 命令](NOTES.md)。离线手动运行可使用 [独立源码包](fixed-weights-20261016.tar.gz)，文件哈希见 [bundle-info.json](bundle-info.json)。[generate.py](generate.py) 可从 data/ 重新生成本表及 combined.json；[verification.json](verification.json) 记录归档完整性检查。

[执行状态](execution-status.json) 记录5个本地/SSH环境和CI的成功状态；[artifact-verification.json](artifact-verification.json) 记录本地持有的45个 VMFB/源 IR 的独立字节哈希核对。CI20项的完整生成物仍保留在 GitHub artifact，未在本地重复下载校验。实际 [包版本](package-versions.json) 均为 IREE compiler/runtime 3.12.0、NumPy 2.4.6。
