module attributes {stream.affinity.default = #hal.device.affinity<@__device_0>} {
  util.global private @__device_0 = #hal.device.target<"local", [#hal.executable.target<"llvm-cpu", "embedded-elf-x86_64", {cpu = "alderlake", cpu_features = "+adx,+aes,+avx,+avx2,+avxvnni,+bmi,+bmi2,+clflushopt,+clwb,+cmov,+crc32,+cx16,+cx8,+f16c,+fma,+fsgsbase,+fxsr,+gfni,+hreset,+invpcid,+kl,+lzcnt,+mmx,+movbe,+movdir64b,+movdiri,+pclmul,+pconfig,+pku,+popcnt,+prfchw,+ptwrite,+rdpid,+rdrnd,+rdseed,+sahf,+serialize,+sgx,+sha,+shstk,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+vaes,+vpclmulqdq,+waitpkg,+widekl,+x87,+xsave,+xsavec,+xsaveopt,+xsaves", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 4194304 : i64, native_vector_size = 32 : i64, target_triple = "x86_64-unknown-unknown-eabi-elf", ukernels = "all"}>]> : !hal.device
  hal.executable private @gemm_dispatch_0 {
    hal.executable.variant public @embedded_elf_x86_64 target(<"llvm-cpu", "embedded-elf-x86_64", {cpu = "alderlake", cpu_features = "+adx,+aes,+avx,+avx2,+avxvnni,+bmi,+bmi2,+clflushopt,+clwb,+cmov,+crc32,+cx16,+cx8,+f16c,+fma,+fsgsbase,+fxsr,+gfni,+hreset,+invpcid,+kl,+lzcnt,+mmx,+movbe,+movdir64b,+movdiri,+pclmul,+pconfig,+pku,+popcnt,+prfchw,+ptwrite,+rdpid,+rdrnd,+rdseed,+sahf,+serialize,+sgx,+sha,+shstk,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+vaes,+vpclmulqdq,+waitpkg,+widekl,+x87,+xsave,+xsavec,+xsaveopt,+xsaves", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 4194304 : i64, native_vector_size = 32 : i64, target_triple = "x86_64-unknown-unknown-eabi-elf", ukernels = "all"}>) {
      hal.executable.export public @gemm_dispatch_0_matmul_2048x2048x2048_f32 ordinal(0) layout(#hal.pipeline.layout<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) count(%arg0: !hal.device) -> (index, index, index) {
        %c1 = arith.constant 1 : index
        hal.return %c1, %c1, %c1 : index, index, index
      } attributes {workgroup_size = [1 : index, 1 : index, 1 : index]}
      builtin.module attributes {llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-unknown-eabi-elf"} {
        llvm.func @iree_uk_pack(!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
        llvm.func @iree_uk_unpack(!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
        llvm.func @iree_uk_mmt4d(!llvm.ptr, i64, i64, !llvm.ptr, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i32, i32, i32, i32, !llvm.ptr) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
        llvm.func @gemm_dispatch_0_matmul_2048x2048x2048_f32(%arg0: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg1: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg2: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}) -> i32 {
          %0 = llvm.mlir.constant(52239 : i64) : i64
          %1 = llvm.mlir.constant(8 : i64) : i64
          %2 = llvm.mlir.constant(0 : i32) : i32
          %3 = llvm.mlir.constant(262144 : index) : i64
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
          %14 = llvm.mlir.constant(1024 : index) : i64
          %15 = llvm.mlir.constant(2048 : index) : i64
          %16 = llvm.mlir.constant(0 : i64) : i64
          %17 = llvm.mlir.constant(1 : i32) : i32
          %18 = llvm.mlir.constant(769 : i32) : i32
          %19 = llvm.mlir.constant(1537 : i32) : i32
          %20 = llvm.mlir.constant(1793 : i32) : i32
          %21 = llvm.mlir.constant(8 : i32) : i32
          %22 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %23 = llvm.extractvalue %22[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %24 = llvm.load %23 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %6 ["align"(%24, %11 : !llvm.ptr, i64)] : i1
          %25 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %26 = llvm.extractvalue %25[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %27 = llvm.getelementptr %26[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %28 = llvm.load %27 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %6 ["align"(%28, %11 : !llvm.ptr, i64)] : i1
          %29 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %30 = llvm.extractvalue %29[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %31 = llvm.getelementptr %30[2] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %32 = llvm.load %31 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %6 ["align"(%32, %11 : !llvm.ptr, i64)] : i1
          %33 = llvm.alloca %5 x f32 {alignment = 64 : i64} : (i64) -> !llvm.ptr
          %34 = llvm.alloca %4 x f32 {alignment = 64 : i64} : (i64) -> !llvm.ptr
          %35 = llvm.alloca %3 x f32 {alignment = 64 : i64} : (i64) -> !llvm.ptr
          llvm.br ^bb1(%7 : i64)
        ^bb1(%36: i64):  // 2 preds: ^bb0, ^bb7
          %37 = llvm.icmp "slt" %36, %15 : i64
          llvm.cond_br %37, ^bb2(%7 : i64), ^bb8
        ^bb2(%38: i64):  // 2 preds: ^bb1, ^bb6
          %39 = llvm.icmp "slt" %38, %15 : i64
          llvm.cond_br %39, ^bb3, ^bb7
        ^bb3:  // pred: ^bb2
          %40 = llvm.mul %38, %15 : i64
          %41 = llvm.add %40, %36 : i64
          %42 = llvm.getelementptr inbounds %arg0[4] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %43 = llvm.alloca %1 x i64 {alignment = 8 : i64} : (i64) -> !llvm.ptr
          %44 = llvm.load %42 : !llvm.ptr -> i64
          %45 = llvm.or %44, %0 : i64
          llvm.store %45, %43 : i64, !llvm.ptr
          %46 = llvm.getelementptr inbounds %42[1] : (!llvm.ptr) -> !llvm.ptr, i64
          %47 = llvm.load %46 : !llvm.ptr -> i64
          %48 = llvm.getelementptr inbounds %43[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %47, %48 : i64, !llvm.ptr
          %49 = llvm.getelementptr inbounds %42[2] : (!llvm.ptr) -> !llvm.ptr, i64
          %50 = llvm.load %49 : !llvm.ptr -> i64
          %51 = llvm.getelementptr inbounds %43[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %50, %51 : i64, !llvm.ptr
          %52 = llvm.getelementptr inbounds %42[3] : (!llvm.ptr) -> !llvm.ptr, i64
          %53 = llvm.load %52 : !llvm.ptr -> i64
          %54 = llvm.getelementptr inbounds %43[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %53, %54 : i64, !llvm.ptr
          %55 = llvm.getelementptr inbounds %42[4] : (!llvm.ptr) -> !llvm.ptr, i64
          %56 = llvm.load %55 : !llvm.ptr -> i64
          %57 = llvm.getelementptr inbounds %43[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %56, %57 : i64, !llvm.ptr
          %58 = llvm.getelementptr inbounds %42[5] : (!llvm.ptr) -> !llvm.ptr, i64
          %59 = llvm.load %58 : !llvm.ptr -> i64
          %60 = llvm.getelementptr inbounds %43[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %59, %60 : i64, !llvm.ptr
          %61 = llvm.getelementptr inbounds %42[6] : (!llvm.ptr) -> !llvm.ptr, i64
          %62 = llvm.load %61 : !llvm.ptr -> i64
          %63 = llvm.getelementptr inbounds %43[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %62, %63 : i64, !llvm.ptr
          %64 = llvm.getelementptr inbounds %42[7] : (!llvm.ptr) -> !llvm.ptr, i64
          %65 = llvm.load %64 : !llvm.ptr -> i64
          %66 = llvm.getelementptr inbounds %43[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %65, %66 : i64, !llvm.ptr
          %67 = llvm.call @iree_uk_pack(%28, %41, %15, %8, %34, %7, %15, %9, %13, %12, %10, %13, %9, %8, %16, %18, %43) : (!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32
          %68 = llvm.icmp "eq" %38, %7 : i64
          %69 = llvm.select %68, %19, %20 : i1, i32
          llvm.br ^bb4(%7 : i64)
        ^bb4(%70: i64):  // 2 preds: ^bb3, ^bb5
          %71 = llvm.icmp "slt" %70, %15 : i64
          llvm.cond_br %71, ^bb5, ^bb6
        ^bb5:  // pred: ^bb4
          %72 = llvm.mul %70, %15 : i64
          %73 = llvm.add %72, %38 : i64
          %74 = llvm.mul %70, %12 : i64
          %75 = llvm.alloca %1 x i64 {alignment = 8 : i64} : (i64) -> !llvm.ptr
          %76 = llvm.load %42 : !llvm.ptr -> i64
          %77 = llvm.or %76, %0 : i64
          llvm.store %77, %75 : i64, !llvm.ptr
          %78 = llvm.load %46 : !llvm.ptr -> i64
          %79 = llvm.getelementptr inbounds %75[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %78, %79 : i64, !llvm.ptr
          %80 = llvm.load %49 : !llvm.ptr -> i64
          %81 = llvm.getelementptr inbounds %75[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %80, %81 : i64, !llvm.ptr
          %82 = llvm.load %52 : !llvm.ptr -> i64
          %83 = llvm.getelementptr inbounds %75[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %82, %83 : i64, !llvm.ptr
          %84 = llvm.load %55 : !llvm.ptr -> i64
          %85 = llvm.getelementptr inbounds %75[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %84, %85 : i64, !llvm.ptr
          %86 = llvm.load %58 : !llvm.ptr -> i64
          %87 = llvm.getelementptr inbounds %75[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %86, %87 : i64, !llvm.ptr
          %88 = llvm.load %61 : !llvm.ptr -> i64
          %89 = llvm.getelementptr inbounds %75[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %88, %89 : i64, !llvm.ptr
          %90 = llvm.load %64 : !llvm.ptr -> i64
          %91 = llvm.getelementptr inbounds %75[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %90, %91 : i64, !llvm.ptr
          %92 = llvm.call @iree_uk_pack(%24, %73, %15, %8, %33, %7, %15, %9, %11, %13, %9, %13, %9, %8, %16, %17, %75) : (!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32
          %93 = llvm.alloca %1 x i64 {alignment = 8 : i64} : (i64) -> !llvm.ptr
          %94 = llvm.load %42 : !llvm.ptr -> i64
          %95 = llvm.or %94, %0 : i64
          llvm.store %95, %93 : i64, !llvm.ptr
          %96 = llvm.load %46 : !llvm.ptr -> i64
          %97 = llvm.getelementptr inbounds %93[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %96, %97 : i64, !llvm.ptr
          %98 = llvm.load %49 : !llvm.ptr -> i64
          %99 = llvm.getelementptr inbounds %93[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %98, %99 : i64, !llvm.ptr
          %100 = llvm.load %52 : !llvm.ptr -> i64
          %101 = llvm.getelementptr inbounds %93[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %100, %101 : i64, !llvm.ptr
          %102 = llvm.load %55 : !llvm.ptr -> i64
          %103 = llvm.getelementptr inbounds %93[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %102, %103 : i64, !llvm.ptr
          %104 = llvm.load %58 : !llvm.ptr -> i64
          %105 = llvm.getelementptr inbounds %93[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %104, %105 : i64, !llvm.ptr
          %106 = llvm.load %61 : !llvm.ptr -> i64
          %107 = llvm.getelementptr inbounds %93[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %106, %107 : i64, !llvm.ptr
          %108 = llvm.load %64 : !llvm.ptr -> i64
          %109 = llvm.getelementptr inbounds %93[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %108, %109 : i64, !llvm.ptr
          %110 = llvm.call @iree_uk_mmt4d(%33, %7, %15, %34, %7, %15, %35, %74, %14, %9, %10, %13, %21, %21, %17, %69, %93) : (!llvm.ptr, i64, i64, !llvm.ptr, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i32, i32, i32, i32, !llvm.ptr) -> i32
          %111 = llvm.add %70, %11 : i64
          llvm.br ^bb4(%111 : i64)
        ^bb6:  // pred: ^bb4
          %112 = llvm.add %38, %13 : i64
          llvm.br ^bb2(%112 : i64)
        ^bb7:  // pred: ^bb2
          %113 = llvm.getelementptr inbounds %arg0[4] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %114 = llvm.alloca %1 x i64 {alignment = 8 : i64} : (i64) -> !llvm.ptr
          %115 = llvm.load %113 : !llvm.ptr -> i64
          %116 = llvm.or %115, %0 : i64
          llvm.store %116, %114 : i64, !llvm.ptr
          %117 = llvm.getelementptr inbounds %113[1] : (!llvm.ptr) -> !llvm.ptr, i64
          %118 = llvm.load %117 : !llvm.ptr -> i64
          %119 = llvm.getelementptr inbounds %114[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %118, %119 : i64, !llvm.ptr
          %120 = llvm.getelementptr inbounds %113[2] : (!llvm.ptr) -> !llvm.ptr, i64
          %121 = llvm.load %120 : !llvm.ptr -> i64
          %122 = llvm.getelementptr inbounds %114[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %121, %122 : i64, !llvm.ptr
          %123 = llvm.getelementptr inbounds %113[3] : (!llvm.ptr) -> !llvm.ptr, i64
          %124 = llvm.load %123 : !llvm.ptr -> i64
          %125 = llvm.getelementptr inbounds %114[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %124, %125 : i64, !llvm.ptr
          %126 = llvm.getelementptr inbounds %113[4] : (!llvm.ptr) -> !llvm.ptr, i64
          %127 = llvm.load %126 : !llvm.ptr -> i64
          %128 = llvm.getelementptr inbounds %114[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %127, %128 : i64, !llvm.ptr
          %129 = llvm.getelementptr inbounds %113[5] : (!llvm.ptr) -> !llvm.ptr, i64
          %130 = llvm.load %129 : !llvm.ptr -> i64
          %131 = llvm.getelementptr inbounds %114[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %130, %131 : i64, !llvm.ptr
          %132 = llvm.getelementptr inbounds %113[6] : (!llvm.ptr) -> !llvm.ptr, i64
          %133 = llvm.load %132 : !llvm.ptr -> i64
          %134 = llvm.getelementptr inbounds %114[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %133, %134 : i64, !llvm.ptr
          %135 = llvm.getelementptr inbounds %113[7] : (!llvm.ptr) -> !llvm.ptr, i64
          %136 = llvm.load %135 : !llvm.ptr -> i64
          %137 = llvm.getelementptr inbounds %114[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %136, %137 : i64, !llvm.ptr
          %138 = llvm.call @iree_uk_unpack(%35, %7, %14, %11, %32, %36, %15, %8, %13, %10, %9, %9, %15, %12, %17, %114) : (!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32
          %139 = llvm.add %36, %12 : i64
          llvm.br ^bb1(%139 : i64)
        ^bb8:  // pred: ^bb1
          llvm.return %2 : i32
        }
      }
    }
  }
  util.func public @gemm(%arg0: !hal.buffer_view, %arg1: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @gemm(%input0: tensor<2048x2048xf32>, %input1: tensor<2048x2048xf32>) -> (%output0: tensor<2048x2048xf32>)"}} {
    %c0 = arith.constant 0 : index
    %c16777216 = arith.constant 16777216 : index
    %c2048 = arith.constant 2048 : index
    %element_type_f32 = hal.element_type<f32> : i32
    %dense_row_major = hal.encoding_type<dense_row_major> : i32
    hal.buffer_view.assert<%arg0 : !hal.buffer_view> message("input0") shape([%c2048, %c2048]) type(%element_type_f32) encoding(%dense_row_major)
    %0 = stream.tensor.import on(#hal.device.affinity<@__device_0>) %arg0 : !hal.buffer_view -> tensor<2048x2048xf32> in !stream.resource<external>{%c16777216}
    hal.buffer_view.assert<%arg1 : !hal.buffer_view> message("input1") shape([%c2048, %c2048]) type(%element_type_f32) encoding(%dense_row_major)
    %1 = stream.tensor.import on(#hal.device.affinity<@__device_0>) %arg1 : !hal.buffer_view -> tensor<2048x2048xf32> in !stream.resource<external>{%c16777216}
    %result, %result_timepoint = stream.resource.alloca uninitialized on(#hal.device.affinity<@__device_0>) : !stream.resource<external>{%c16777216} => !stream.timepoint
    %2 = stream.cmd.execute on(#hal.device.affinity<@__device_0>) await(%result_timepoint) => with(%0 as %arg2: !stream.resource<external>{%c16777216}, %1 as %arg3: !stream.resource<external>{%c16777216}, %result as %arg4: !stream.resource<external>{%c16777216}) {
      stream.cmd.dispatch @gemm_dispatch_0::@embedded_elf_x86_64::@gemm_dispatch_0_matmul_2048x2048x2048_f32 {
        ro %arg2[%c0 for %c16777216] : !stream.resource<external>{%c16777216},
        ro %arg3[%c0 for %c16777216] : !stream.resource<external>{%c16777216},
        wo %arg4[%c0 for %c16777216] : !stream.resource<external>{%c16777216}
      }
    } => !stream.timepoint
    %3 = stream.timepoint.await %2 => %result : !stream.resource<external>{%c16777216}
    %4 = stream.tensor.export on(#hal.device.affinity<@__device_0>) %3 : tensor<2048x2048xf32> in !stream.resource<external>{%c16777216} -> !hal.buffer_view
    util.return %4 : !hal.buffer_view
  }
}
