module attributes {stream.affinity.default = #hal.device.affinity<@__device_0>} {
  util.global private @__device_0 = #hal.device.target<"local", [#hal.executable.target<"llvm-cpu", "embedded-elf-x86_64", {cpu = "alderlake", cpu_features = "+adx,+aes,+avx,+avx2,+avxvnni,+bmi,+bmi2,+clflushopt,+clwb,+cmov,+crc32,+cx16,+cx8,+f16c,+fma,+fsgsbase,+fxsr,+gfni,+hreset,+invpcid,+kl,+lzcnt,+mmx,+movbe,+movdir64b,+movdiri,+pclmul,+pconfig,+pku,+popcnt,+prfchw,+ptwrite,+rdpid,+rdrnd,+rdseed,+sahf,+serialize,+sgx,+sha,+shstk,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+vaes,+vpclmulqdq,+waitpkg,+widekl,+x87,+xsave,+xsavec,+xsaveopt,+xsaves", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 4194304 : i64, native_vector_size = 32 : i64, target_triple = "x86_64-unknown-unknown-eabi-elf", ukernels = "all"}>]> : !hal.device
  hal.executable private @gemm_dispatch_0 {
    hal.executable.variant public @embedded_elf_x86_64 target(<"llvm-cpu", "embedded-elf-x86_64", {cpu = "alderlake", cpu_features = "+adx,+aes,+avx,+avx2,+avxvnni,+bmi,+bmi2,+clflushopt,+clwb,+cmov,+crc32,+cx16,+cx8,+f16c,+fma,+fsgsbase,+fxsr,+gfni,+hreset,+invpcid,+kl,+lzcnt,+mmx,+movbe,+movdir64b,+movdiri,+pclmul,+pconfig,+pku,+popcnt,+prfchw,+ptwrite,+rdpid,+rdrnd,+rdseed,+sahf,+serialize,+sgx,+sha,+shstk,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+vaes,+vpclmulqdq,+waitpkg,+widekl,+x87,+xsave,+xsavec,+xsaveopt,+xsaves", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 4194304 : i64, native_vector_size = 32 : i64, target_triple = "x86_64-unknown-unknown-eabi-elf", ukernels = "all"}>) {
      hal.executable.export public @gemm_dispatch_0_matmul_4096x4096x4096_f32 ordinal(0) layout(#hal.pipeline.layout<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) count(%arg0: !hal.device) -> (index, index, index) {
        %c1 = arith.constant 1 : index
        hal.return %c1, %c1, %c1 : index, index, index
      } attributes {workgroup_size = [1 : index, 1 : index, 1 : index]}
      builtin.module attributes {llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-unknown-eabi-elf"} {
        llvm.func @iree_uk_pack(!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
        llvm.func @iree_uk_unpack(!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
        llvm.func @iree_uk_mmt4d(!llvm.ptr, i64, i64, !llvm.ptr, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i32, i32, i32, i32, !llvm.ptr) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
        llvm.func @gemm_dispatch_0_matmul_4096x4096x4096_f32(%arg0: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg1: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg2: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}) -> i32 {
          %0 = llvm.mlir.constant(52239 : i64) : i64
          %1 = llvm.mlir.constant(8 : i64) : i64
          %2 = llvm.mlir.constant(0 : i32) : i32
          %3 = llvm.mlir.constant(524288 : index) : i64
          %4 = llvm.mlir.constant(32768 : index) : i64
          %5 = llvm.mlir.constant(16384 : index) : i64
          %6 = llvm.mlir.constant(true) : i1
          %7 = llvm.mlir.constant(0 : index) : i64
          %8 = llvm.mlir.constant(1 : index) : i64
          %9 = llvm.mlir.constant(8 : index) : i64
          %10 = llvm.mlir.constant(16 : index) : i64
          %11 = llvm.mlir.constant(64 : index) : i64
          %12 = llvm.mlir.constant(128 : index) : i64
          %13 = llvm.mlir.constant(256 : index) : i64
          %14 = llvm.mlir.constant(512 : index) : i64
          %15 = llvm.mlir.constant(1024 : index) : i64
          %16 = llvm.mlir.constant(2048 : index) : i64
          %17 = llvm.mlir.constant(4096 : index) : i64
          %18 = llvm.mlir.constant(0 : i64) : i64
          %19 = llvm.mlir.constant(1 : i32) : i32
          %20 = llvm.mlir.constant(769 : i32) : i32
          %21 = llvm.mlir.constant(1537 : i32) : i32
          %22 = llvm.mlir.constant(1793 : i32) : i32
          %23 = llvm.mlir.constant(8 : i32) : i32
          %24 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %25 = llvm.extractvalue %24[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %26 = llvm.load %25 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %6 ["align"(%26, %11 : !llvm.ptr, i64)] : i1
          %27 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %28 = llvm.extractvalue %27[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %29 = llvm.getelementptr %28[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %30 = llvm.load %29 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %6 ["align"(%30, %11 : !llvm.ptr, i64)] : i1
          %31 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %32 = llvm.extractvalue %31[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %33 = llvm.getelementptr %32[2] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %34 = llvm.load %33 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %6 ["align"(%34, %11 : !llvm.ptr, i64)] : i1
          %35 = llvm.alloca %5 x f32 {alignment = 64 : i64} : (i64) -> !llvm.ptr
          %36 = llvm.alloca %4 x f32 {alignment = 64 : i64} : (i64) -> !llvm.ptr
          %37 = llvm.alloca %3 x f32 {alignment = 64 : i64} : (i64) -> !llvm.ptr
          llvm.br ^bb1(%7 : i64)
        ^bb1(%38: i64):  // 2 preds: ^bb0, ^bb7
          %39 = llvm.icmp "slt" %38, %17 : i64
          llvm.cond_br %39, ^bb2(%7 : i64), ^bb8
        ^bb2(%40: i64):  // 2 preds: ^bb1, ^bb6
          %41 = llvm.icmp "slt" %40, %17 : i64
          llvm.cond_br %41, ^bb3, ^bb7
        ^bb3:  // pred: ^bb2
          %42 = llvm.mul %40, %17 : i64
          %43 = llvm.add %42, %38 : i64
          %44 = llvm.getelementptr inbounds %arg0[4] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %45 = llvm.alloca %1 x i64 {alignment = 8 : i64} : (i64) -> !llvm.ptr
          %46 = llvm.load %44 : !llvm.ptr -> i64
          %47 = llvm.or %46, %0 : i64
          llvm.store %47, %45 : i64, !llvm.ptr
          %48 = llvm.getelementptr inbounds %44[1] : (!llvm.ptr) -> !llvm.ptr, i64
          %49 = llvm.load %48 : !llvm.ptr -> i64
          %50 = llvm.getelementptr inbounds %45[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %49, %50 : i64, !llvm.ptr
          %51 = llvm.getelementptr inbounds %44[2] : (!llvm.ptr) -> !llvm.ptr, i64
          %52 = llvm.load %51 : !llvm.ptr -> i64
          %53 = llvm.getelementptr inbounds %45[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %52, %53 : i64, !llvm.ptr
          %54 = llvm.getelementptr inbounds %44[3] : (!llvm.ptr) -> !llvm.ptr, i64
          %55 = llvm.load %54 : !llvm.ptr -> i64
          %56 = llvm.getelementptr inbounds %45[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %55, %56 : i64, !llvm.ptr
          %57 = llvm.getelementptr inbounds %44[4] : (!llvm.ptr) -> !llvm.ptr, i64
          %58 = llvm.load %57 : !llvm.ptr -> i64
          %59 = llvm.getelementptr inbounds %45[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %58, %59 : i64, !llvm.ptr
          %60 = llvm.getelementptr inbounds %44[5] : (!llvm.ptr) -> !llvm.ptr, i64
          %61 = llvm.load %60 : !llvm.ptr -> i64
          %62 = llvm.getelementptr inbounds %45[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %61, %62 : i64, !llvm.ptr
          %63 = llvm.getelementptr inbounds %44[6] : (!llvm.ptr) -> !llvm.ptr, i64
          %64 = llvm.load %63 : !llvm.ptr -> i64
          %65 = llvm.getelementptr inbounds %45[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %64, %65 : i64, !llvm.ptr
          %66 = llvm.getelementptr inbounds %44[7] : (!llvm.ptr) -> !llvm.ptr, i64
          %67 = llvm.load %66 : !llvm.ptr -> i64
          %68 = llvm.getelementptr inbounds %45[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %67, %68 : i64, !llvm.ptr
          %69 = llvm.call @iree_uk_pack(%30, %43, %17, %8, %36, %7, %16, %9, %13, %12, %10, %13, %9, %8, %18, %20, %45) : (!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32
          %70 = llvm.icmp "eq" %40, %7 : i64
          %71 = llvm.select %70, %21, %22 : i1, i32
          llvm.br ^bb4(%7 : i64)
        ^bb4(%72: i64):  // 2 preds: ^bb3, ^bb5
          %73 = llvm.icmp "slt" %72, %17 : i64
          llvm.cond_br %73, ^bb5, ^bb6
        ^bb5:  // pred: ^bb4
          %74 = llvm.mul %72, %17 : i64
          %75 = llvm.add %74, %40 : i64
          %76 = llvm.mul %72, %12 : i64
          %77 = llvm.alloca %1 x i64 {alignment = 8 : i64} : (i64) -> !llvm.ptr
          %78 = llvm.load %44 : !llvm.ptr -> i64
          %79 = llvm.or %78, %0 : i64
          llvm.store %79, %77 : i64, !llvm.ptr
          %80 = llvm.load %48 : !llvm.ptr -> i64
          %81 = llvm.getelementptr inbounds %77[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %80, %81 : i64, !llvm.ptr
          %82 = llvm.load %51 : !llvm.ptr -> i64
          %83 = llvm.getelementptr inbounds %77[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %82, %83 : i64, !llvm.ptr
          %84 = llvm.load %54 : !llvm.ptr -> i64
          %85 = llvm.getelementptr inbounds %77[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %84, %85 : i64, !llvm.ptr
          %86 = llvm.load %57 : !llvm.ptr -> i64
          %87 = llvm.getelementptr inbounds %77[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %86, %87 : i64, !llvm.ptr
          %88 = llvm.load %60 : !llvm.ptr -> i64
          %89 = llvm.getelementptr inbounds %77[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %88, %89 : i64, !llvm.ptr
          %90 = llvm.load %63 : !llvm.ptr -> i64
          %91 = llvm.getelementptr inbounds %77[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %90, %91 : i64, !llvm.ptr
          %92 = llvm.load %66 : !llvm.ptr -> i64
          %93 = llvm.getelementptr inbounds %77[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %92, %93 : i64, !llvm.ptr
          %94 = llvm.call @iree_uk_pack(%26, %75, %17, %8, %35, %7, %16, %9, %11, %13, %9, %13, %9, %8, %18, %19, %77) : (!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32
          %95 = llvm.alloca %1 x i64 {alignment = 8 : i64} : (i64) -> !llvm.ptr
          %96 = llvm.load %44 : !llvm.ptr -> i64
          %97 = llvm.or %96, %0 : i64
          llvm.store %97, %95 : i64, !llvm.ptr
          %98 = llvm.load %48 : !llvm.ptr -> i64
          %99 = llvm.getelementptr inbounds %95[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %98, %99 : i64, !llvm.ptr
          %100 = llvm.load %51 : !llvm.ptr -> i64
          %101 = llvm.getelementptr inbounds %95[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %100, %101 : i64, !llvm.ptr
          %102 = llvm.load %54 : !llvm.ptr -> i64
          %103 = llvm.getelementptr inbounds %95[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %102, %103 : i64, !llvm.ptr
          %104 = llvm.load %57 : !llvm.ptr -> i64
          %105 = llvm.getelementptr inbounds %95[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %104, %105 : i64, !llvm.ptr
          %106 = llvm.load %60 : !llvm.ptr -> i64
          %107 = llvm.getelementptr inbounds %95[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %106, %107 : i64, !llvm.ptr
          %108 = llvm.load %63 : !llvm.ptr -> i64
          %109 = llvm.getelementptr inbounds %95[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %108, %109 : i64, !llvm.ptr
          %110 = llvm.load %66 : !llvm.ptr -> i64
          %111 = llvm.getelementptr inbounds %95[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %110, %111 : i64, !llvm.ptr
          %112 = llvm.call @iree_uk_mmt4d(%35, %7, %16, %36, %7, %16, %37, %76, %15, %9, %10, %13, %23, %23, %19, %71, %95) : (!llvm.ptr, i64, i64, !llvm.ptr, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i32, i32, i32, i32, !llvm.ptr) -> i32
          %113 = llvm.add %72, %11 : i64
          llvm.br ^bb4(%113 : i64)
        ^bb6:  // pred: ^bb4
          %114 = llvm.add %40, %13 : i64
          llvm.br ^bb2(%114 : i64)
        ^bb7:  // pred: ^bb2
          %115 = llvm.getelementptr inbounds %arg0[4] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %116 = llvm.alloca %1 x i64 {alignment = 8 : i64} : (i64) -> !llvm.ptr
          %117 = llvm.load %115 : !llvm.ptr -> i64
          %118 = llvm.or %117, %0 : i64
          llvm.store %118, %116 : i64, !llvm.ptr
          %119 = llvm.getelementptr inbounds %115[1] : (!llvm.ptr) -> !llvm.ptr, i64
          %120 = llvm.load %119 : !llvm.ptr -> i64
          %121 = llvm.getelementptr inbounds %116[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %120, %121 : i64, !llvm.ptr
          %122 = llvm.getelementptr inbounds %115[2] : (!llvm.ptr) -> !llvm.ptr, i64
          %123 = llvm.load %122 : !llvm.ptr -> i64
          %124 = llvm.getelementptr inbounds %116[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %123, %124 : i64, !llvm.ptr
          %125 = llvm.getelementptr inbounds %115[3] : (!llvm.ptr) -> !llvm.ptr, i64
          %126 = llvm.load %125 : !llvm.ptr -> i64
          %127 = llvm.getelementptr inbounds %116[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %126, %127 : i64, !llvm.ptr
          %128 = llvm.getelementptr inbounds %115[4] : (!llvm.ptr) -> !llvm.ptr, i64
          %129 = llvm.load %128 : !llvm.ptr -> i64
          %130 = llvm.getelementptr inbounds %116[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %129, %130 : i64, !llvm.ptr
          %131 = llvm.getelementptr inbounds %115[5] : (!llvm.ptr) -> !llvm.ptr, i64
          %132 = llvm.load %131 : !llvm.ptr -> i64
          %133 = llvm.getelementptr inbounds %116[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %132, %133 : i64, !llvm.ptr
          %134 = llvm.getelementptr inbounds %115[6] : (!llvm.ptr) -> !llvm.ptr, i64
          %135 = llvm.load %134 : !llvm.ptr -> i64
          %136 = llvm.getelementptr inbounds %116[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %135, %136 : i64, !llvm.ptr
          %137 = llvm.getelementptr inbounds %115[7] : (!llvm.ptr) -> !llvm.ptr, i64
          %138 = llvm.load %137 : !llvm.ptr -> i64
          %139 = llvm.getelementptr inbounds %116[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %138, %139 : i64, !llvm.ptr
          %140 = llvm.call @iree_uk_unpack(%37, %7, %15, %11, %34, %38, %17, %8, %14, %10, %9, %9, %17, %12, %19, %116) : (!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32
          %141 = llvm.add %38, %12 : i64
          llvm.br ^bb1(%141 : i64)
        ^bb8:  // pred: ^bb1
          llvm.return %2 : i32
        }
      }
    }
  }
  util.func public @gemm(%arg0: !hal.buffer_view, %arg1: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @gemm(%input0: tensor<4096x4096xf32>, %input1: tensor<4096x4096xf32>) -> (%output0: tensor<4096x4096xf32>)"}} {
    %c0 = arith.constant 0 : index
    %c67108864 = arith.constant 67108864 : index
    %c4096 = arith.constant 4096 : index
    %element_type_f32 = hal.element_type<f32> : i32
    %dense_row_major = hal.encoding_type<dense_row_major> : i32
    hal.buffer_view.assert<%arg0 : !hal.buffer_view> message("input0") shape([%c4096, %c4096]) type(%element_type_f32) encoding(%dense_row_major)
    %0 = stream.tensor.import on(#hal.device.affinity<@__device_0>) %arg0 : !hal.buffer_view -> tensor<4096x4096xf32> in !stream.resource<external>{%c67108864}
    hal.buffer_view.assert<%arg1 : !hal.buffer_view> message("input1") shape([%c4096, %c4096]) type(%element_type_f32) encoding(%dense_row_major)
    %1 = stream.tensor.import on(#hal.device.affinity<@__device_0>) %arg1 : !hal.buffer_view -> tensor<4096x4096xf32> in !stream.resource<external>{%c67108864}
    %result, %result_timepoint = stream.resource.alloca uninitialized on(#hal.device.affinity<@__device_0>) : !stream.resource<external>{%c67108864} => !stream.timepoint
    %2 = stream.cmd.execute on(#hal.device.affinity<@__device_0>) await(%result_timepoint) => with(%0 as %arg2: !stream.resource<external>{%c67108864}, %1 as %arg3: !stream.resource<external>{%c67108864}, %result as %arg4: !stream.resource<external>{%c67108864}) {
      stream.cmd.dispatch @gemm_dispatch_0::@embedded_elf_x86_64::@gemm_dispatch_0_matmul_4096x4096x4096_f32 {
        ro %arg2[%c0 for %c67108864] : !stream.resource<external>{%c67108864},
        ro %arg3[%c0 for %c67108864] : !stream.resource<external>{%c67108864},
        wo %arg4[%c0 for %c67108864] : !stream.resource<external>{%c67108864}
      }
    } => !stream.timepoint
    %3 = stream.timepoint.await %2 => %result : !stream.resource<external>{%c67108864}
    %4 = stream.tensor.export on(#hal.device.affinity<@__device_0>) %3 : tensor<4096x4096xf32> in !stream.resource<external>{%c67108864} -> !hal.buffer_view
    util.return %4 : !hal.buffer_view
  }
}
