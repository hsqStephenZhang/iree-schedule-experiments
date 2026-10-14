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
          %1 = llvm.mlir.constant(8 : i32) : i32
          %2 = llvm.mlir.constant(1793 : i32) : i32
          %3 = llvm.mlir.constant(1537 : i32) : i32
          %4 = llvm.mlir.constant(769 : i32) : i32
          %5 = llvm.mlir.constant(1 : i32) : i32
          %6 = llvm.mlir.constant(2048 : i64) : i64
          %7 = llvm.mlir.constant(1024 : i64) : i64
          %8 = llvm.mlir.constant(256 : i64) : i64
          %9 = llvm.mlir.constant(128 : i64) : i64
          %10 = llvm.mlir.constant(64 : i64) : i64
          %11 = llvm.mlir.constant(16 : i64) : i64
          %12 = llvm.mlir.constant(1 : i64) : i64
          %13 = llvm.mlir.constant(0 : i64) : i64
          %14 = llvm.mlir.constant(true) : i1
          %15 = llvm.mlir.constant(0 : i32) : i32
          %16 = llvm.mlir.constant(8 : i64) : i64
          %17 = llvm.alloca %5 x !llvm.array<8 x i64> {alignment = 8 : i64} : (i32) -> !llvm.ptr
          %18 = llvm.alloca %5 x !llvm.array<8 x i64> {alignment = 8 : i64} : (i32) -> !llvm.ptr
          %19 = llvm.alloca %5 x !llvm.array<8 x i64> {alignment = 8 : i64} : (i32) -> !llvm.ptr
          %20 = llvm.alloca %5 x !llvm.array<8 x i64> {alignment = 8 : i64} : (i32) -> !llvm.ptr
          %21 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %22 = llvm.extractvalue %21[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %23 = llvm.load %22 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %14 ["align"(%23, %10 : !llvm.ptr, i64)] : i1
          %24 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %25 = llvm.extractvalue %24[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %26 = llvm.getelementptr %25[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %27 = llvm.load %26 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %14 ["align"(%27, %10 : !llvm.ptr, i64)] : i1
          %28 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %29 = llvm.extractvalue %28[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %30 = llvm.getelementptr %29[2] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %31 = llvm.load %30 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %14 ["align"(%31, %10 : !llvm.ptr, i64)] : i1
          %32 = llvm.alloca %5 x !llvm.array<16384 x f32> {alignment = 64 : i64} : (i32) -> !llvm.ptr
          %33 = llvm.alloca %5 x !llvm.array<32768 x f32> {alignment = 64 : i64} : (i32) -> !llvm.ptr
          %34 = llvm.alloca %5 x !llvm.array<262144 x f32> {alignment = 64 : i64} : (i32) -> !llvm.ptr
          llvm.br ^bb1(%13 : i64)
        ^bb1(%35: i64):  // 2 preds: ^bb0, ^bb7
          %36 = llvm.icmp "slt" %35, %6 : i64
          llvm.cond_br %36, ^bb2(%13 : i64), ^bb8
        ^bb2(%37: i64):  // 2 preds: ^bb1, ^bb6
          %38 = llvm.icmp "slt" %37, %6 : i64
          llvm.cond_br %38, ^bb3, ^bb7
        ^bb3:  // pred: ^bb2
          %39 = llvm.mul %37, %6 : i64
          %40 = llvm.add %39, %35 : i64
          %41 = llvm.getelementptr inbounds %arg0[4] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          llvm.store %0, %18 : i64, !llvm.ptr
          %42 = llvm.getelementptr inbounds %41[1] : (!llvm.ptr) -> !llvm.ptr, i64
          %43 = llvm.load %42 : !llvm.ptr -> i64
          %44 = llvm.getelementptr inbounds %18[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %43, %44 : i64, !llvm.ptr
          %45 = llvm.getelementptr inbounds %41[2] : (!llvm.ptr) -> !llvm.ptr, i64
          %46 = llvm.load %45 : !llvm.ptr -> i64
          %47 = llvm.getelementptr inbounds %18[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %46, %47 : i64, !llvm.ptr
          %48 = llvm.getelementptr inbounds %41[3] : (!llvm.ptr) -> !llvm.ptr, i64
          %49 = llvm.load %48 : !llvm.ptr -> i64
          %50 = llvm.getelementptr inbounds %18[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %49, %50 : i64, !llvm.ptr
          %51 = llvm.getelementptr inbounds %41[4] : (!llvm.ptr) -> !llvm.ptr, i64
          %52 = llvm.load %51 : !llvm.ptr -> i64
          %53 = llvm.getelementptr inbounds %18[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %52, %53 : i64, !llvm.ptr
          %54 = llvm.getelementptr inbounds %41[5] : (!llvm.ptr) -> !llvm.ptr, i64
          %55 = llvm.load %54 : !llvm.ptr -> i64
          %56 = llvm.getelementptr inbounds %18[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %55, %56 : i64, !llvm.ptr
          %57 = llvm.getelementptr inbounds %41[6] : (!llvm.ptr) -> !llvm.ptr, i64
          %58 = llvm.load %57 : !llvm.ptr -> i64
          %59 = llvm.getelementptr inbounds %18[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %58, %59 : i64, !llvm.ptr
          %60 = llvm.getelementptr inbounds %41[7] : (!llvm.ptr) -> !llvm.ptr, i64
          %61 = llvm.load %60 : !llvm.ptr -> i64
          %62 = llvm.getelementptr inbounds %18[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %61, %62 : i64, !llvm.ptr
          %63 = llvm.call @iree_uk_pack(%27, %40, %6, %12, %33, %13, %6, %16, %8, %9, %11, %8, %16, %12, %13, %4, %18) : (!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32
          %64 = llvm.icmp "eq" %37, %13 : i64
          %65 = llvm.select %64, %3, %2 : i1, i32
          llvm.br ^bb4(%13 : i64)
        ^bb4(%66: i64):  // 2 preds: ^bb3, ^bb5
          %67 = llvm.icmp "slt" %66, %6 : i64
          llvm.cond_br %67, ^bb5, ^bb6
        ^bb5:  // pred: ^bb4
          %68 = llvm.mul %66, %6 : i64
          %69 = llvm.add %68, %37 : i64
          %70 = llvm.mul %66, %9 : i64
          llvm.store %0, %17 : i64, !llvm.ptr
          %71 = llvm.load %42 : !llvm.ptr -> i64
          %72 = llvm.getelementptr inbounds %17[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %71, %72 : i64, !llvm.ptr
          %73 = llvm.load %45 : !llvm.ptr -> i64
          %74 = llvm.getelementptr inbounds %17[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %73, %74 : i64, !llvm.ptr
          %75 = llvm.load %48 : !llvm.ptr -> i64
          %76 = llvm.getelementptr inbounds %17[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %75, %76 : i64, !llvm.ptr
          %77 = llvm.load %51 : !llvm.ptr -> i64
          %78 = llvm.getelementptr inbounds %17[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %77, %78 : i64, !llvm.ptr
          %79 = llvm.load %54 : !llvm.ptr -> i64
          %80 = llvm.getelementptr inbounds %17[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %79, %80 : i64, !llvm.ptr
          %81 = llvm.load %57 : !llvm.ptr -> i64
          %82 = llvm.getelementptr inbounds %17[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %81, %82 : i64, !llvm.ptr
          %83 = llvm.load %60 : !llvm.ptr -> i64
          %84 = llvm.getelementptr inbounds %17[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %83, %84 : i64, !llvm.ptr
          %85 = llvm.call @iree_uk_pack(%23, %69, %6, %12, %32, %13, %6, %16, %10, %8, %16, %8, %16, %12, %13, %5, %17) : (!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32
          llvm.store %0, %19 : i64, !llvm.ptr
          %86 = llvm.load %42 : !llvm.ptr -> i64
          %87 = llvm.getelementptr inbounds %19[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %86, %87 : i64, !llvm.ptr
          %88 = llvm.load %45 : !llvm.ptr -> i64
          %89 = llvm.getelementptr inbounds %19[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %88, %89 : i64, !llvm.ptr
          %90 = llvm.load %48 : !llvm.ptr -> i64
          %91 = llvm.getelementptr inbounds %19[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %90, %91 : i64, !llvm.ptr
          %92 = llvm.load %51 : !llvm.ptr -> i64
          %93 = llvm.getelementptr inbounds %19[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %92, %93 : i64, !llvm.ptr
          %94 = llvm.load %54 : !llvm.ptr -> i64
          %95 = llvm.getelementptr inbounds %19[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %94, %95 : i64, !llvm.ptr
          %96 = llvm.load %57 : !llvm.ptr -> i64
          %97 = llvm.getelementptr inbounds %19[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %96, %97 : i64, !llvm.ptr
          %98 = llvm.load %60 : !llvm.ptr -> i64
          %99 = llvm.getelementptr inbounds %19[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %98, %99 : i64, !llvm.ptr
          %100 = llvm.call @iree_uk_mmt4d(%32, %13, %6, %33, %13, %6, %34, %70, %7, %16, %11, %8, %1, %1, %5, %65, %19) : (!llvm.ptr, i64, i64, !llvm.ptr, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i32, i32, i32, i32, !llvm.ptr) -> i32
          %101 = llvm.add %66, %10 : i64
          llvm.br ^bb4(%101 : i64)
        ^bb6:  // pred: ^bb4
          %102 = llvm.add %37, %8 : i64
          llvm.br ^bb2(%102 : i64)
        ^bb7:  // pred: ^bb2
          %103 = llvm.getelementptr inbounds %arg0[4] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          llvm.store %0, %20 : i64, !llvm.ptr
          %104 = llvm.getelementptr inbounds %103[1] : (!llvm.ptr) -> !llvm.ptr, i64
          %105 = llvm.load %104 : !llvm.ptr -> i64
          %106 = llvm.getelementptr inbounds %20[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %105, %106 : i64, !llvm.ptr
          %107 = llvm.getelementptr inbounds %103[2] : (!llvm.ptr) -> !llvm.ptr, i64
          %108 = llvm.load %107 : !llvm.ptr -> i64
          %109 = llvm.getelementptr inbounds %20[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %108, %109 : i64, !llvm.ptr
          %110 = llvm.getelementptr inbounds %103[3] : (!llvm.ptr) -> !llvm.ptr, i64
          %111 = llvm.load %110 : !llvm.ptr -> i64
          %112 = llvm.getelementptr inbounds %20[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %111, %112 : i64, !llvm.ptr
          %113 = llvm.getelementptr inbounds %103[4] : (!llvm.ptr) -> !llvm.ptr, i64
          %114 = llvm.load %113 : !llvm.ptr -> i64
          %115 = llvm.getelementptr inbounds %20[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %114, %115 : i64, !llvm.ptr
          %116 = llvm.getelementptr inbounds %103[5] : (!llvm.ptr) -> !llvm.ptr, i64
          %117 = llvm.load %116 : !llvm.ptr -> i64
          %118 = llvm.getelementptr inbounds %20[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %117, %118 : i64, !llvm.ptr
          %119 = llvm.getelementptr inbounds %103[6] : (!llvm.ptr) -> !llvm.ptr, i64
          %120 = llvm.load %119 : !llvm.ptr -> i64
          %121 = llvm.getelementptr inbounds %20[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %120, %121 : i64, !llvm.ptr
          %122 = llvm.getelementptr inbounds %103[7] : (!llvm.ptr) -> !llvm.ptr, i64
          %123 = llvm.load %122 : !llvm.ptr -> i64
          %124 = llvm.getelementptr inbounds %20[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %123, %124 : i64, !llvm.ptr
          %125 = llvm.call @iree_uk_unpack(%34, %13, %7, %10, %31, %35, %6, %12, %8, %11, %16, %16, %6, %9, %5, %20) : (!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32
          %126 = llvm.add %35, %9 : i64
          llvm.br ^bb1(%126 : i64)
        ^bb8:  // pred: ^bb1
          llvm.return %15 : i32
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
