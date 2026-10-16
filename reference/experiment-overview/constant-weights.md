# 常量权重对现有实验结论的影响

**是，四组主实验没有覆盖“权重只打包一次、随后多次复用”的模型稳态场景。** 当前结果回答的是动态 A/B GEMM 的整体调度问题，不能直接推出固定权重推理中的优劣。用户提供的 EPYC 7662 尚无原始 IR，单独标记为未核验。

## 当前实际测量了什么

[common.py](../../common.py) 的入口是 `gemm(%a, %b)`：A、B 都是函数入参；唯一显式常量是输出初值 0。主实验每次调用执行布局转换/packing，再计算 GEMM。

重复传入同一组随机输入、预先上传输入、执行 warmup，都不会让编译器将函数入参识别成模型常量，也不会自动跨调用记忆 packed B。perf 排除了输入加载/上传，但仍计入 GEMM 内部 packing。

以 `C = A × W`、B 为权重 W 为例：A 通常是动态 activation，只有 B 可以跨请求持久化。不能把 A、B 都排除 packing 的实验直接视为普通 linear 层；若两者都被编译器认定为常量，整个乘法本身也可能成为常量求值对象。

## IREE 源码证据

检查的本地源码为 `/Users/zc/courses/compiler/iree`，提交 `89ece87b89852100c0a4ac3d515e14842d090967`。该源码提交与实验使用的 3.12.0 wheel 不是同一提交，因此下面同时给出实际 wheel 的编译验证。

- [hoist_into_globals.mlir](https://github.com/iree-org/iree/blob/89ece87b89852100c0a4ac3d515e14842d090967/compiler/src/iree/compiler/GlobalOptimization/test/hoist_into_globals.mlir#L96) 明确测试常量 `linalg.pack` 被提升为 global。
- [GlobalOptimization/Passes.cpp](https://github.com/iree-org/iree/blob/89ece87b89852100c0a4ac3d515e14842d090967/compiler/src/iree/compiler/GlobalOptimization/Passes.cpp#L97) 接入表达式提升；后续接入 const-eval，并可在 const-eval 后导出参数。
- [HoistIntoGlobals.cpp](https://github.com/iree-org/iree/blob/89ece87b89852100c0a4ac3d515e14842d090967/compiler/src/iree/compiler/Dialect/Util/Transforms/HoistIntoGlobals.cpp#L312) 将常量表达式复制到 initializer，建立 immutable global 并保存结果。
- [Pipelines/Options.h](https://github.com/iree-org/iree/blob/89ece87b89852100c0a4ac3d515e14842d090967/compiler/src/iree/compiler/Pipelines/Options.h#L179) 默认开启 const-eval。
- [ConstEval/JitGlobals.cpp](https://github.com/iree-org/iree/blob/89ece87b89852100c0a4ac3d515e14842d090967/compiler/src/iree/compiler/ConstEval/JitGlobals.cpp#L249) 对仍依赖外部 parameter 的 initializer 降为 runtime availability。因此“模型权重固定”不等于“编译期已经取得全部权重字节”；参数导入、预转换和初始化策略也影响具体时机。

这些路径须满足常量表达式、类型、shape、布局与提升策略等条件，不能假设任意 packing 都会自动被消除。

## IREE 3.12.0 的实际小型验证

使用本项目固定的 IREE 3.12.0 包，编译器报告 `3.12.0rc20260917 @ 2b05c5d`，Apple M2 目标、FP32、`local-sync`。形状为 `A[32,64] × B[64,64]`；B 为非 splat 随机常量，A 保持动态。

| 输入与路径 | 每次 gemm 的 dispatch | 初始化 packing dispatch | 证据 |
| --- | ---: | ---: | --- |
| 动态 A、动态 B，默认 data-tiling | 3：pack A、pack B、计算/输出 | 0 | [dynamic-compiled.mlir](constant-weight-check/dynamic-compiled.mlir) |
| 动态 A、常量 B，默认 data-tiling | 2：pack A、计算/输出 | 1，`stream.cmd.execute once` | [constant-b-compiled.mlir](constant-weight-check/constant-b-compiled.mlir) |
| 常量 B，关闭 const-eval | 2 | 1，仍只在初始化 | [constant-b-no-consteval-compiled.mlir](constant-weight-check/constant-b-no-consteval-compiled.mlir) |
| 常量 B，global data-tiling + early materialization + 默认 const-eval | 3：pack A、计算、unpack | 0，packed B 已成为常量数据 | [constant-b-early-materialized-compiled.mlir](constant-weight-check/constant-b-early-materialized-compiled.mlir) |

第二行中 `gemm` 通过 `util.global.load immutable` 取得 packed B，B 的转换位于 `util.initializer`，而不是每次 GEMM 的命令序列内。默认路径开关 const-eval 的两份 IR 均保留一次性初始化 packing，因此这里不能声称“默认已在编译期完成 pack B”。

第四行证明编译期求值路径确实可用，但 early materialization 改变了 lowering pipeline（包括输出 unpack 的 dispatch 组织）；这里仅核验机制，不比较其性能。

四份 IR 都已序列化为 VMFB，并在同一 context 中分别用两个不同 A 输入执行。8 次结果均通过 float64 参考，最大绝对误差约 `7.15e-6`。见 [verification.json](constant-weight-check/verification.json)。本节只是 IR/正确性验证；后来新增的大尺寸性能实验另见 [固定 B 汇总](../fixed-weights/README.md)，仍没有测 GEMV。

## 如何重新解释现有结果

可以用下面的示意拆分理解摊销；实际调度会改变 cache 状态，不能直接拿已有总时延做精确相减：

```text
动态 A/B： 每次付 pack(A) + pack(B) + GEMM/dispatch/output
固定 B：   一次付 pack(B)，每次付 pack(A) + GEMM/dispatch/output
R 次复用： 平均包含 pack(B)/R；纯稳态可单独排除初始化
```

1. **当前比较对固定权重的 full-pack baseline 计入了本可摊销的 B packing。** 若据此声称 panel 一定优于 IREE 模型推理默认路径，结论超出了证据。
2. **完整预打包与 panel 计算并不冲突。** 固定 B 可以一次转为持久化 tiled layout，计算时仍按 NC/KC/MC 分块读取它。公平的固定权重比较，应让两种调度都复用已打包 B，单独考察动态 A、C 更新和计算局部性。
3. **预打包不会自动修复 full-K 计算的 cache 容量/复用问题。** i5 的 4096³ PMU 证据仍支持 B 重复扫描造成 LLC/DRAM 额外流量；即使不再写 packed B，计算仍需访问权重。因此现有缓存证据没有失效，但固定权重下的净加速必须补测。
4. **NEON 的动态 A packing 问题也仍可能存在。** 当前 panel 在 N 面板间重复打包 A，六行通用 pack 的代价并不会因为 B 固定就消失。
5. **现有方阵不代表 GEMV / decode。** 当前主实验是 2048³、4096³。GEMV 的常见形状是 M=1；packing 权重和 GEMV 本身都随 NK 增长，权重摊销更值得单独测量，内存带宽与 kernel 选择也不同。

## 已有预打包诊断的覆盖

NEON 4096³ 的 3 轮诊断记录为：

| 配置 | 时延 |
| --- | ---: |
| 同批 default | 1422.33 ms |
| 正常动态 panel | 1574.15 ms |
| panel，A 预打包 | 1501.54 ms |
| panel，A/B 预打包 | 1471.15 ms |

这些是手工改写 packed-input 寻址的反事实，不是 IREE 编译器识别常量权重的运行。**此前没有仅 B 预打包的对照，也没有四个变体在同一固定 B 条件下的比较。** A/AB 两项还改变了 full-input stride，不能通过两数相减精确得到 pack B 的独立成本。

## 应补的实验矩阵

| 维度 | 建议对照 |
| --- | --- |
| 权重生命周期 | 动态 B；编译可见常量 B；初始化时取得的 immutable parameter B |
| 计算调度 | 默认完整预打包 + 原调度；持久化预打包 B + panel 调度；匹配布局的自定义 kernel |
| A 的处理 | A 保持动态；分别记录完整 pack 与 panel pack / 重复次数 |
| 形状 | M=1/4/16/64 的 GEMV、小 batch GEMM，以及原有 2048³ / 4096³；K、N 独立控制 |
| 时间口径 | 编译、参数加载/首次 packing、首请求、同 context 稳态、R 次请求总时延 |
| 证据 | IR 中 B packing 的位置、packed global 的复用、数值校验、稳态 perf、内存占用 |

结论应分为“动态 GEMM 调度”和“固定权重推理”两组。后续已按同微内核原则实现 full A/full K、full A/panel、panel A/panel，并增加原生 IREE 固定 B 基线；数据与限制见 [固定 B 汇总](../fixed-weights/README.md)。不能把两组实验的时延直接相减解释为 B packing 的独立成本。
