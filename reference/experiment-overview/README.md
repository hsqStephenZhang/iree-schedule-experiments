# 全部 GEMM 实验汇总

覆盖 **8 种 CPU 型号**：历史归档、GitHub CI、Oracle / ss420e、magic.root 原始确认运行，以及用户提供的 EPYC 7662 数据。时延单位为毫秒；加速比均以同一实验、同一尺寸的 original 为基线。

**适用范围：本页历史四组主实验中 A/B 都是运行时输入，每次调用包含 packing；不代表固定权重稳态，也未测 GEMV。** 新增的固定 B 三组控制与两条基线另见 [固定权重实验汇总](../fixed-weights/README.md)。EPYC 7662 仅有用户汇总，尚未核验原始 IR。[常量权重分析与编译验证](constant-weights.md)。

## 机器与来源

| ID | 型号 | 主机 / 环境 | 已知配置与限制 |
| --- | --- | --- | --- |
| i5 | Intel Core i5-14600KF | root@magic.root / Linux / Manjaro | Hostname rusty; remote run-a/run-b results exactly match local archives. |
| ryzen | AMD Ryzen 7 5800H | SSH alias not recorded / Linux container | Separate from magic.root; target haswell, CPU 5; perf blocked by container/host policy. |
| m2 | Apple M2 Pro | local macOS / macOS 27.0.1 | 8 performance + 4 efficiency cores; unpinned. |
| ci-xeon | Intel Xeon Platinum 8573C | GitHub ubuntu-24.04 / GitHub hosted Linux runner | Native target emeraldrapids; baseline may use wider SIMD than custom AVX2 kernels; counters unavailable. |
| ci-m1 | Apple M1 (Virtual) | GitHub macos-15 / GitHub hosted macOS VM | Resolved target generic; unpinned; counters unavailable. |
| oracle | AMD EPYC 7551 | root@oracle.usa.amd1 / Oracle Cloud VM / Ubuntu 22.04 | 947 MiB RAM; /proc/stat reports ~50% steal with accounting caveat; 4096 deferred by user. |
| ss420e | Intel Xeon Silver 4310 | sunqi@ss420e / Ubuntu 20.04 / Linux 5.4 | 2 sockets × 12 cores; ~503 GiB RAM; CPU 0, target icelake-server. |
| epyc7662 | AMD EPYC 7662 64-Core Processor | user supplied, alias unknown / not supplied | CPU family 23; do not infer socket count, IREE version, affinity, or compiler target. |

**magic.root 与 Ryzen 5800H、EPYC 7662 为不同机器。** magic.root 当前 hostname 为 rusty，CPU 为 i5-14600KF；其远端 run-a/run-b 与本地归档 JSON 完全相同。

## 主要性能结果

下表保留每台机器的主要实验。M2 的通用 A packing 与专用 A packing 分开列出；Oracle 采用额外的 12 轮复测。i5 采用两次 12 轮、合计 24 批的汇总。Ryzen 5800H 只有预加载独立计时，不能当作同口径原生 benchmark；EPYC 7662 是用户汇总值。

| 实验 | CPU 型号 | 尺寸 | Original ms | Panel ms / 加速 | Panel+kernel ms / 加速 | Full+kernel ms / 加速 |
| --- | --- | ---: | ---: | ---: | ---: | ---: |
| i5-confirmed | Intel Core i5-14600KF | 2048³ | 146.79 | 146.21 (1.004×) | 129.42 (1.134×) | 117.40 (1.250×) |
| i5-confirmed | Intel Core i5-14600KF | 4096³ | 2178.14 | 1311.32 (1.661×) | 1161.38 (1.875×) | 2414.16 (0.902×) |
| m2-generic | Apple M2 Pro | 2048³ | 178.46 | 190.61 (0.936×) | 301.08 (0.593×) | 180.29 (0.990×) |
| m2-generic | Apple M2 Pro | 4096³ | 1433.42 | 1559.12 (0.919×) | 2442.14 (0.587×) | 1435.54 (0.999×) |
| m2-specialized | Apple M2 Pro | 2048³ | 180.10 | 192.16 (0.937×) | 189.12 (0.952×) | 176.22 (1.022×) |
| m2-specialized | Apple M2 Pro | 4096³ | 1418.10 | 1550.19 (0.915×) | 1540.64 (0.920×) | 1420.84 (0.998×) |
| ci-ubuntu-24.04 | Intel Xeon Platinum 8573C | 2048³ | 163.72 | 235.36 (0.696×) | 257.02 (0.637×) | 250.67 (0.653×) |
| ci-ubuntu-24.04 | Intel Xeon Platinum 8573C | 4096³ | 1722.35 | 1946.94 (0.885×) | 2137.53 (0.806×) | 2114.03 (0.815×) |
| ci-macos-15 | Apple M1 (Virtual) | 2048³ | 221.90 | 249.16 (0.891×) | 362.70 (0.612×) | 245.11 (0.905×) |
| ci-macos-15 | Apple M1 (Virtual) | 4096³ | 2141.38 | 2392.65 (0.895×) | 3422.98 (0.626×) | 2171.90 (0.986×) |
| oracle-recheck | AMD EPYC 7551 | 2048³ | 1458.66 | 1437.51 (1.015×) | 1194.62 (1.221×) | 1271.18 (1.147×) |
| ss420e-full | Intel Xeon Silver 4310 | 2048³ | 281.06 | 232.32 (1.210×) | 233.57 (1.203×) | 317.40 (0.886×) |
| ss420e-full | Intel Xeon Silver 4310 | 4096³ | 2507.01 | 1884.99 (1.330×) | 1920.48 (1.305×) | 4037.32 (0.621×) |
| ryzen-timing | AMD Ryzen 7 5800H | 2048³ | 225.18 | 187.20 (1.203×) | — | — |
| ryzen-timing | AMD Ryzen 7 5800H | 4096³ | 1924.05 | 1558.60 (1.234×) | — | — |
| epyc7662-user | AMD EPYC 7662 64-Core Processor | 2048³ | 633.50 | 546.70 (1.159×) | 367.00 (1.726×) | 721.00 (0.879×) |
| epyc7662-user | AMD EPYC 7662 64-Core Processor | 4096³ | 4779.00 | 3348.00 (1.427×) | 3007.00 (1.589×) | 5128.00 (0.932×) |

— 表示没有该项测量。所有归档时延为样本中位数；用户提供的 EPYC 7662 未提供样本、统计方法、IREE 版本和验证记录。

## 每次实验的配置与来源

所有已核验主实验均为 FP32、单线程 local-sync；CPU 总线程数不代表使用多线程。0.2s/0.1s/0.05s 为自适应批时长，不能统一当成每批固定三次。3x 才明确固定为三次。

| 实验 ID | 类型 | LLVM target | 轮数 | 原生 min-time | 固定 CPU | IREE 编译器 | 来源与说明 |
| --- | --- | --- | ---: | --- | --- | --- | --- |
| i5-july | native | alderlake | 5 | 0.2s | 0 | 3.12.0rc20260713 | [reference/i5-14600kf-alderlake/results.json](../../reference/i5-14600kf-alderlake/results.json)；IREE 3.12.0rc20260713; adaptive 0.2s batches. |
| i5-run-a | native | alderlake | 12 | 3x | 0 | 3.12.0rc20260917 | [reference/i5-14600kf-alderlake-iree3.12.0-confirmation/run-a/results.json](../../reference/i5-14600kf-alderlake-iree3.12.0-confirmation/run-a/results.json)；12 batches × 3 GEMMs; run-b reuses identical modules. |
| i5-run-b | native | alderlake | 12 | 3x | 0 | 3.12.0rc20260917 | [reference/i5-14600kf-alderlake-iree3.12.0-confirmation/run-b/results.json](../../reference/i5-14600kf-alderlake-iree3.12.0-confirmation/run-b/results.json)；12 batches × 3 GEMMs; run-b reuses identical modules. |
| i5-confirmed | derived native | alderlake | 24 | 3x | 0 | 3.12.0rc20260917 | [reference/i5-14600kf-alderlake-iree3.12.0-confirmation/combined.json](../../reference/i5-14600kf-alderlake-iree3.12.0-confirmation/combined.json)；24 batches × 3 GEMMs per variant/size; derived union, not a third execution. |
| m2-generic | native | apple-m2 | 5 | 0.2s | 未绑定/未提供 | 3.12.0rc20260917 | [reference/apple-m2-neon/results.json](../../reference/apple-m2-neon/results.json)；5 adaptive 0.2s batches; custom 6-row A packing uses generic implementation. |
| m2-specialized | native | apple-m2 | 5 | 0.2s | 未绑定/未提供 | 3.12.0rc20260917 | [reference/apple-m2-neon-refined/results.json](../../reference/apple-m2-neon-refined/results.json)；5 adaptive 0.2s batches; only 03/04 use neon_pack_a6; separate configuration. |
| m2-readme | native | apple-m2 | 3 | 0.2s | 未绑定/未提供 | 3.12.0rc20260917 | [results/readme-check/artifacts/results.json](../../results/readme-check/artifacts/results.json)；3 adaptive batches; generic A packing. |
| ci-ubuntu-24.04 | native | emeraldrapids | 5 | 3x | 0 | 3.12.0rc20260917 | [results/github-ci-38640699039/summary.json](../../results/github-ci-38640699039/summary.json)；5 batches × 3 GEMMs; run 38640699039. Hardware counters unavailable. |
| ci-macos-15 | native | generic | 5 | 3x | 未绑定/未提供 | 3.12.0rc20260917 | [results/github-ci-38640699039/summary.json](../../results/github-ci-38640699039/summary.json)；5 batches × 3 GEMMs; run 38640699039. Hardware counters unavailable. |
| oracle-first | native | znver1 | 5 | 3x | 0 | 3.12.0rc20260917 | [results/remote-perf-20261016/runners/oracle-usa-amd1/experiment/artifacts/results.json](../../results/remote-perf-20261016/runners/oracle-usa-amd1/experiment/artifacts/results.json)；5 batches × 3 GEMMs; complete six-group perf collection. |
| oracle-recheck | native | znver1 | 12 | 3x | 0 | 3.12.0rc20260917 | [results/remote-perf-20261016/runners/oracle-usa-amd1/recheck/results.json](../../results/remote-perf-20261016/runners/oracle-usa-amd1/recheck/results.json)；12 batches × 3 GEMMs, rotated/reversed order; same VMFB; timing-only recheck. |
| ss420e-full | native | icelake-server | 5 | 3x | 0 | 3.12.0rc20260917 | [results/remote-perf-20261016/runners/ss420e/experiment/artifacts/results.json](../../results/remote-perf-20261016/runners/ss420e/experiment/artifacts/results.json)；5 batches × 3 GEMMs; original 158 perf windows + 42 recovered windows; independent timings completed. |
| oracle-pooled | derived native | znver1 | 17 | 3x | 0 | 3.12.0rc20260917 | [results/remote-perf-20261016/oracle-combined.json](../../results/remote-perf-20261016/oracle-combined.json)；17 batches per variant; derived union, not another execution. |
| ryzen-timing | warmed preloaded timing | haswell | 5 | 3 GEMMs/window (not native benchmark) | 5 | 3.12.0rc20260917 | [reference/ryzen-5800h-haswell-iree3.12.0-metrics/timing-summary.json](../../reference/ryzen-5800h-haswell-iree3.12.0-metrics/timing-summary.json)；5 windows × 3 GEMMs; only 01/02 measured; hardware counters blocked. |
| epyc7662-user | user reported | 未提供 | 3 | 未提供 | 未绑定/未提供 | 未提供 | [reference/experiment-overview/epyc-7662-user-report.json](../../reference/experiment-overview/epyc-7662-user-report.json)；Reported table only; original JSON, compiler, validation and aggregation method not supplied. |
| m2-sanity | native | host | 1 | 0.05s | 未绑定/未提供 | 3.12.0rc20260917 | [results/neon-sanity/results.json](../../results/neon-sanity/results.json)；Small-size smoke/entry-point validation; not a main performance conclusion. |
| m2-zipapp | native | apple-m2 | 1 | 0.05s | 未绑定/未提供 | 3.12.0rc20260917 | [results/neon-zipapp/results.json](../../results/neon-zipapp/results.json)；Small-size smoke/entry-point validation; not a main performance conclusion. |
| m2-fresh-smoke | native | apple-m2 | 1 | 0.2s | 未绑定/未提供 | 3.12.0rc20260917 | [results/readme-fresh-smoke/artifacts/results.json](../../results/readme-fresh-smoke/artifacts/results.json)；Small-size smoke/entry-point validation; not a main performance conclusion. |
| m2-ci-smoke | native | apple-m2 | 5 | 3x | 未绑定/未提供 | 3.12.0rc20260917 | [results/ci-smoke/experiment/artifacts/results.json](../../results/ci-smoke/experiment/artifacts/results.json)；Small-size smoke/entry-point validation; not a main performance conclusion. |
| magic-check-0 | native | raptorlake | 1 | 1x | 0 | 3.12.0rc20260917 | [reference/experiment-overview/magic-root-results.json](../../reference/experiment-overview/magic-root-results.json)；Existing remote check, not rerun for this catalog; /tmp/iree-portability-recheck/results.json |
| magic-check-1 | native | raptorlake | 1 | 0.01s | 0 | 3.12.0rc20260917 | [reference/experiment-overview/magic-root-results.json](../../reference/experiment-overview/magic-root-results.json)；Existing remote check, not rerun for this catalog; /tmp/iree-portability-smoke/artifacts/results.json |
| magic-check-4 | native | haswell | 1 | 0.05s | 0 | 3.12.0rc20260917 | [reference/experiment-overview/magic-root-results.json](../../reference/experiment-overview/magic-root-results.json)；Existing remote check, not rerun for this catalog; /tmp/iree-schedule-alignment-python311-check/results.json |
| magic-check-5 | native | haswell | 1 | 0.05s | 0 | 3.12.0rc20260917 | [reference/experiment-overview/magic-root-results.json](../../reference/experiment-overview/magic-root-results.json)；Existing remote check, not rerun for this catalog; /tmp/iree-schedule-alignment-stable-check/results.json |
| magic-check-6 | native | haswell | 1 | 0.05s | 2 | 3.12.0rc20260713 | [reference/experiment-overview/magic-root-results.json](../../reference/experiment-overview/magic-root-results.json)；Existing remote check, not rerun for this catalog; /tmp/iree-gemm-four-portable/results/results.json |

## 历史与复测明细

下表包含首轮、确认 run-a/run-b、历史编译器、README 复跑及派生合并结果。派生合并不是额外的一次执行，不应与来源样本重复累计。

| 实验 | CPU 型号 | 尺寸 | Original ms | Panel ms / 加速 | Panel+kernel ms / 加速 | Full+kernel ms / 加速 |
| --- | --- | ---: | ---: | ---: | ---: | ---: |
| i5-july | Intel Core i5-14600KF | 2048³ | 153.96 | 144.94 (1.062×) | 127.00 (1.212×) | 115.57 (1.332×) |
| i5-july | Intel Core i5-14600KF | 4096³ | 2221.84 | 1320.88 (1.682×) | 1175.28 (1.890×) | 2442.81 (0.910×) |
| i5-run-a | Intel Core i5-14600KF | 2048³ | 147.02 | 146.01 (1.007×) | 129.70 (1.134×) | 117.23 (1.254×) |
| i5-run-a | Intel Core i5-14600KF | 4096³ | 2187.14 | 1310.04 (1.670×) | 1162.27 (1.882×) | 2432.40 (0.899×) |
| i5-run-b | Intel Core i5-14600KF | 2048³ | 146.60 | 146.71 (0.999×) | 129.27 (1.134×) | 117.56 (1.247×) |
| i5-run-b | Intel Core i5-14600KF | 4096³ | 2170.73 | 1311.87 (1.655×) | 1161.20 (1.869×) | 2405.11 (0.903×) |
| m2-readme | Apple M2 Pro | 2048³ | 177.78 | 187.13 (0.950×) | 294.85 (0.603×) | 179.97 (0.988×) |
| m2-readme | Apple M2 Pro | 4096³ | 1429.95 | 1521.76 (0.940×) | 2378.58 (0.601×) | 1399.34 (1.022×) |
| oracle-first | AMD EPYC 7551 | 2048³ | 1527.58 | 1450.82 (1.053×) | 1229.10 (1.243×) | 1289.44 (1.185×) |
| oracle-pooled | AMD EPYC 7551 | 2048³ | 1462.07 | 1440.08 (1.015×) | 1196.04 (1.222×) | 1274.00 (1.148×) |

## NEON 诊断实验

均在 Apple M2 Pro、4096³ 上执行，每项 3 轮。prepacked_A / prepacked_AB 在计时前手工打包，改变了寻址 stride；packing_only 用不执行 GEMM 的 sink 替代计算。它们既不是正常动态 GEMM，也不是“仅 B 固定”的模型推理测试。

| 批次 | 配置 | 时延 ms | 预打包输入 | packing-only |
| --- | --- | ---: | --- | --- |
| analysis-results | 01_original | 1422.33 | 无 | 否 |
| analysis-results | 02_panel_pack | 1574.15 | 无 | 否 |
| analysis-results | 03_panel_pack_kernel | 2452.53 | 无 | 否 |
| analysis-results | 04_full_pack_kernel | 1459.46 | 无 | 否 |
| analysis-results | panel_prepacked_A | 1501.54 | A | 否 |
| analysis-results | panel_prepacked_AB | 1471.15 | AB | 否 |
| analysis-results | 02_panel_pack_packing_only | 196.91 | 无 | 是，非 GEMM |
| analysis-results | 03_panel_pack_kernel_packing_only | 1103.49 | 无 | 是，非 GEMM |
| analysis-results | panel-64-128-64 | 1726.66 | 无 | 否 |
| analysis-results | panel-64-128-512 | 1522.51 | 无 | 否 |
| analysis-results | panel-64-128-1024 | 1473.56 | 无 | 否 |
| analysis-results | panel-64-128-2048 | 1458.85 | 无 | 否 |
| analysis-results | panel-64-64-1024 | 1554.63 | 无 | 否 |
| analysis-results | panel-128-128-256 | 1567.48 | 无 | 否 |
| specialized-pack-results | 01_original | 1426.70 | 无 | 否 |
| specialized-pack-results | 02_panel_pack | 1555.86 | 无 | 否 |
| specialized-pack-results | 03_panel_pack_kernel | 2425.70 | 无 | 否 |
| specialized-pack-results | 04_full_pack_kernel | 1444.53 | 无 | 否 |
| specialized-pack-results | 03_panel_pack_kernel_neon_A_pack | 1547.14 | 无 | 否 |
| specialized-pack-results | 03_panel_pack_kernel_neon_A_pack_packing_only | 208.23 | 无 | 是，非 GEMM |
| specialized-pack-results | 04_full_pack_kernel_neon_A_pack | 1411.83 | 无 | 否 |

## 冒烟与兼容检查

包含本地 256³ 检查和 magic.root 上已有的 portability / alignment 检查；用于记录执行覆盖，不作为大矩阵性能结论。

| 实验 | CPU 型号 | 尺寸 | Original ms | Panel ms / 加速 | Panel+kernel ms / 加速 | Full+kernel ms / 加速 |
| --- | --- | ---: | ---: | ---: | ---: | ---: |
| m2-sanity | Apple M2 Pro | 256³ | 0.51 | 0.37 (1.382×) | 0.60 (0.855×) | 0.48 (1.069×) |
| m2-zipapp | Apple M2 Pro | 256³ | 0.36 | 0.36 (1.000×) | 0.60 (0.602×) | 0.52 (0.698×) |
| m2-fresh-smoke | Apple M2 Pro | 256³ | 0.35 | 0.35 (0.977×) | 0.58 (0.598×) | 0.45 (0.770×) |
| m2-ci-smoke | Apple M2 Pro | 256³ | 0.38 | 0.40 (0.958×) | 0.62 (0.612×) | 0.50 (0.754×) |
| magic-check-0 | Intel Core i5-14600KF | 256³ | 0.53 | 0.42 (1.279×) | 0.34 (1.555×) | 0.39 (1.385×) |
| magic-check-1 | Intel Core i5-14600KF | 256³ | 0.28 | 0.29 (0.963×) | 0.26 (1.080×) | 0.24 (1.158×) |
| magic-check-4 | Intel Core i5-14600KF | 256³ | 0.27 | 0.28 (0.966×) | 0.26 (1.071×) | 0.25 (1.110×) |
| magic-check-5 | Intel Core i5-14600KF | 256³ | 0.28 | 0.29 (0.962×) | 0.25 (1.085×) | 0.24 (1.158×) |
| magic-check-5 | Intel Core i5-14600KF | 2048³ | 293.66 | 159.84 (1.837×) | 132.31 (2.220×) | 123.63 (2.375×) |
| magic-check-6 | Intel Core i5-14600KF | 256³ | 0.28 | 0.29 (0.962×) | 0.25 (1.108×) | 0.24 (1.163×) |

## perf 与测量证据

| 主机 | 核心 PMU | 内存流量 | 说明 |
| --- | --- | --- | --- |
| magic.root / i5-14600KF | original/panel，3 轮，60 窗口，无复用 | Intel IMC 已测，系统级、近似背景扣除 | 4096³ LLC miss 与 DRAM 读流量显著下降；只适用于本实验数据 |
| Oracle EPYC 7551 | 四组，5 轮、120 窗口，100% running | 未暴露 | /proc/stat 的 ~50% steal 与线程 CPU 时钟存在口径差异；12 轮复测未重新采 PMU |
| ss420e Xeon 4310 | 四组双尺寸，5 轮、200 窗口，100% running | 支持的 IMC 未暴露 | SSH 中断后保留 158 窗口，补齐 42；恢复过程单独留档 |
| Ryzen 5800H | 被权限/容器策略阻止 | 未采集 | 只有独立计时，不能推导 cache/TLB 原因 |
| GitHub CI 两主机 | 不可用 | 不可用 | 保存权限/后端诊断 |
| M2 Pro | 未实现 | 未采集 | 诊断依据 IR、汇编和受控改动 |
| EPYC 7662 用户实验 | 未提供 | 未提供 | 不填零、不推断 |

完整计数器数值、事件定义和各组 median/min/max 保存在 [data.json](data.json) 的 pmu/intel_imc 中；原始来源见 sources。不同厂商事件的分母与含义不同，不合并成统一 miss rate。

## 汇总观察与限制

- Panel packing 的收益依赖机器和尺寸。i5 的 4096³ 为 1.66×，2048³ 约持平；EPYC 7662 用户结果为 1.16× / 1.43×；ss420e 为 1.21× / 1.33×；Oracle 2048³ 复测仅约 1.015×。
- M2 Pro 与两台 GitHub runner 没有复现上述 panel 收益。M2 专用 A packing 大幅改善了自定义路径，但不能把不同 packing 实现的两次运行混成一组。
- 原生 IREE target 可选择不同微内核/指令集，03/04 的自定义内核保持 AVX2 或 NEON；因此跨配置差异包含内核形状、packing、blocking、dispatch、输出生命周期。
- **动态 A/B 的结果不能直接用来否定 IREE 对常量权重做全量 packing。** 固定 B 的预打包可在编译或初始化阶段摊销，panel 计算也可以消费持久化预打包 B；新增独立控制实验见 [固定 B 结果](../fixed-weights/README.md)。
- 未提供的测试结果、硬件计数器与模型稳态性能均保留为空，不由当前时间表推算。

## 文件

- [data.json](data.json)：全部机器、逐变体测量、原始样本、独立计时、NEON 诊断、PMU、来源哈希；可直接用于后续分析。
- [epyc-7662-user-report.json](epyc-7662-user-report.json)：保留用户原始数字及未知配置字段。
- [magic-root-results.json](magic-root-results.json)：magic.root 已有实验及硬件快照；确认归档归属的证据。
- [constant-weights.md](constant-weights.md)：固定权重适用范围、IREE 源码依据和小型编译验证。
