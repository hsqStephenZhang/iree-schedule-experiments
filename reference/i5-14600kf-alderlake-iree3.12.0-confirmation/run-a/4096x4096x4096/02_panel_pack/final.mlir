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
          %1 = llvm.mlir.constant(8 : i32) : i32
          %2 = llvm.mlir.constant(1793 : i32) : i32
          %3 = llvm.mlir.constant(1537 : i32) : i32
          %4 = llvm.mlir.constant(769 : i32) : i32
          %5 = llvm.mlir.constant(1 : i32) : i32
          %6 = llvm.mlir.constant(4096 : i64) : i64
          %7 = llvm.mlir.constant(2048 : i64) : i64
          %8 = llvm.mlir.constant(1024 : i64) : i64
          %9 = llvm.mlir.constant(512 : i64) : i64
          %10 = llvm.mlir.constant(256 : i64) : i64
          %11 = llvm.mlir.constant(128 : i64) : i64
          %12 = llvm.mlir.constant(64 : i64) : i64
          %13 = llvm.mlir.constant(16 : i64) : i64
          %14 = llvm.mlir.constant(1 : i64) : i64
          %15 = llvm.mlir.constant(0 : i64) : i64
          %16 = llvm.mlir.constant(true) : i1
          %17 = llvm.mlir.constant(0 : i32) : i32
          %18 = llvm.mlir.constant(8 : i64) : i64
          %19 = llvm.alloca %5 x !llvm.array<8 x i64> {alignment = 8 : i64} : (i32) -> !llvm.ptr
          %20 = llvm.alloca %5 x !llvm.array<8 x i64> {alignment = 8 : i64} : (i32) -> !llvm.ptr
          %21 = llvm.alloca %5 x !llvm.array<8 x i64> {alignment = 8 : i64} : (i32) -> !llvm.ptr
          %22 = llvm.alloca %5 x !llvm.array<8 x i64> {alignment = 8 : i64} : (i32) -> !llvm.ptr
          %23 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %24 = llvm.extractvalue %23[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %25 = llvm.load %24 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %16 ["align"(%25, %12 : !llvm.ptr, i64)] : i1
          %26 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %27 = llvm.extractvalue %26[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %28 = llvm.getelementptr %27[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %29 = llvm.load %28 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %16 ["align"(%29, %12 : !llvm.ptr, i64)] : i1
          %30 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %31 = llvm.extractvalue %30[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %32 = llvm.getelementptr %31[2] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %33 = llvm.load %32 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %16 ["align"(%33, %12 : !llvm.ptr, i64)] : i1
          %34 = llvm.alloca %5 x !llvm.array<16384 x f32> {alignment = 64 : i64} : (i32) -> !llvm.ptr
          %35 = llvm.alloca %5 x !llvm.array<32768 x f32> {alignment = 64 : i64} : (i32) -> !llvm.ptr
          %36 = llvm.alloca %5 x !llvm.array<524288 x f32> {alignment = 64 : i64} : (i32) -> !llvm.ptr
          llvm.br ^bb1(%15 : i64)
        ^bb1(%37: i64):  // 2 preds: ^bb0, ^bb7
          %38 = llvm.icmp "slt" %37, %6 : i64
          llvm.cond_br %38, ^bb2(%15 : i64), ^bb8
        ^bb2(%39: i64):  // 2 preds: ^bb1, ^bb6
          %40 = llvm.icmp "slt" %39, %6 : i64
          llvm.cond_br %40, ^bb3, ^bb7
        ^bb3:  // pred: ^bb2
          %41 = llvm.mul %39, %6 : i64
          %42 = llvm.add %41, %37 : i64
          %43 = llvm.getelementptr inbounds %arg0[4] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          llvm.store %0, %20 : i64, !llvm.ptr
          %44 = llvm.getelementptr inbounds %43[1] : (!llvm.ptr) -> !llvm.ptr, i64
          %45 = llvm.load %44 : !llvm.ptr -> i64
          %46 = llvm.getelementptr inbounds %20[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %45, %46 : i64, !llvm.ptr
          %47 = llvm.getelementptr inbounds %43[2] : (!llvm.ptr) -> !llvm.ptr, i64
          %48 = llvm.load %47 : !llvm.ptr -> i64
          %49 = llvm.getelementptr inbounds %20[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %48, %49 : i64, !llvm.ptr
          %50 = llvm.getelementptr inbounds %43[3] : (!llvm.ptr) -> !llvm.ptr, i64
          %51 = llvm.load %50 : !llvm.ptr -> i64
          %52 = llvm.getelementptr inbounds %20[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %51, %52 : i64, !llvm.ptr
          %53 = llvm.getelementptr inbounds %43[4] : (!llvm.ptr) -> !llvm.ptr, i64
          %54 = llvm.load %53 : !llvm.ptr -> i64
          %55 = llvm.getelementptr inbounds %20[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %54, %55 : i64, !llvm.ptr
          %56 = llvm.getelementptr inbounds %43[5] : (!llvm.ptr) -> !llvm.ptr, i64
          %57 = llvm.load %56 : !llvm.ptr -> i64
          %58 = llvm.getelementptr inbounds %20[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %57, %58 : i64, !llvm.ptr
          %59 = llvm.getelementptr inbounds %43[6] : (!llvm.ptr) -> !llvm.ptr, i64
          %60 = llvm.load %59 : !llvm.ptr -> i64
          %61 = llvm.getelementptr inbounds %20[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %60, %61 : i64, !llvm.ptr
          %62 = llvm.getelementptr inbounds %43[7] : (!llvm.ptr) -> !llvm.ptr, i64
          %63 = llvm.load %62 : !llvm.ptr -> i64
          %64 = llvm.getelementptr inbounds %20[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %63, %64 : i64, !llvm.ptr
          %65 = llvm.call @iree_uk_pack(%29, %42, %6, %14, %35, %15, %7, %18, %10, %11, %13, %10, %18, %14, %15, %4, %20) : (!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32
          %66 = llvm.icmp "eq" %39, %15 : i64
          %67 = llvm.select %66, %3, %2 : i1, i32
          llvm.br ^bb4(%15 : i64)
        ^bb4(%68: i64):  // 2 preds: ^bb3, ^bb5
          %69 = llvm.icmp "slt" %68, %6 : i64
          llvm.cond_br %69, ^bb5, ^bb6
        ^bb5:  // pred: ^bb4
          %70 = llvm.mul %68, %6 : i64
          %71 = llvm.add %70, %39 : i64
          %72 = llvm.mul %68, %11 : i64
          llvm.store %0, %19 : i64, !llvm.ptr
          %73 = llvm.load %44 : !llvm.ptr -> i64
          %74 = llvm.getelementptr inbounds %19[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %73, %74 : i64, !llvm.ptr
          %75 = llvm.load %47 : !llvm.ptr -> i64
          %76 = llvm.getelementptr inbounds %19[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %75, %76 : i64, !llvm.ptr
          %77 = llvm.load %50 : !llvm.ptr -> i64
          %78 = llvm.getelementptr inbounds %19[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %77, %78 : i64, !llvm.ptr
          %79 = llvm.load %53 : !llvm.ptr -> i64
          %80 = llvm.getelementptr inbounds %19[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %79, %80 : i64, !llvm.ptr
          %81 = llvm.load %56 : !llvm.ptr -> i64
          %82 = llvm.getelementptr inbounds %19[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %81, %82 : i64, !llvm.ptr
          %83 = llvm.load %59 : !llvm.ptr -> i64
          %84 = llvm.getelementptr inbounds %19[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %83, %84 : i64, !llvm.ptr
          %85 = llvm.load %62 : !llvm.ptr -> i64
          %86 = llvm.getelementptr inbounds %19[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %85, %86 : i64, !llvm.ptr
          %87 = llvm.call @iree_uk_pack(%25, %71, %6, %14, %34, %15, %7, %18, %12, %10, %18, %10, %18, %14, %15, %5, %19) : (!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32
          llvm.store %0, %21 : i64, !llvm.ptr
          %88 = llvm.load %44 : !llvm.ptr -> i64
          %89 = llvm.getelementptr inbounds %21[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %88, %89 : i64, !llvm.ptr
          %90 = llvm.load %47 : !llvm.ptr -> i64
          %91 = llvm.getelementptr inbounds %21[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %90, %91 : i64, !llvm.ptr
          %92 = llvm.load %50 : !llvm.ptr -> i64
          %93 = llvm.getelementptr inbounds %21[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %92, %93 : i64, !llvm.ptr
          %94 = llvm.load %53 : !llvm.ptr -> i64
          %95 = llvm.getelementptr inbounds %21[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %94, %95 : i64, !llvm.ptr
          %96 = llvm.load %56 : !llvm.ptr -> i64
          %97 = llvm.getelementptr inbounds %21[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %96, %97 : i64, !llvm.ptr
          %98 = llvm.load %59 : !llvm.ptr -> i64
          %99 = llvm.getelementptr inbounds %21[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %98, %99 : i64, !llvm.ptr
          %100 = llvm.load %62 : !llvm.ptr -> i64
          %101 = llvm.getelementptr inbounds %21[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %100, %101 : i64, !llvm.ptr
          %102 = llvm.call @iree_uk_mmt4d(%34, %15, %7, %35, %15, %7, %36, %72, %8, %18, %13, %10, %1, %1, %5, %67, %21) : (!llvm.ptr, i64, i64, !llvm.ptr, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i32, i32, i32, i32, !llvm.ptr) -> i32
          %103 = llvm.add %68, %12 : i64
          llvm.br ^bb4(%103 : i64)
        ^bb6:  // pred: ^bb4
          %104 = llvm.add %39, %10 : i64
          llvm.br ^bb2(%104 : i64)
        ^bb7:  // pred: ^bb2
          %105 = llvm.getelementptr inbounds %arg0[4] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          llvm.store %0, %22 : i64, !llvm.ptr
          %106 = llvm.getelementptr inbounds %105[1] : (!llvm.ptr) -> !llvm.ptr, i64
          %107 = llvm.load %106 : !llvm.ptr -> i64
          %108 = llvm.getelementptr inbounds %22[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %107, %108 : i64, !llvm.ptr
          %109 = llvm.getelementptr inbounds %105[2] : (!llvm.ptr) -> !llvm.ptr, i64
          %110 = llvm.load %109 : !llvm.ptr -> i64
          %111 = llvm.getelementptr inbounds %22[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %110, %111 : i64, !llvm.ptr
          %112 = llvm.getelementptr inbounds %105[3] : (!llvm.ptr) -> !llvm.ptr, i64
          %113 = llvm.load %112 : !llvm.ptr -> i64
          %114 = llvm.getelementptr inbounds %22[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %113, %114 : i64, !llvm.ptr
          %115 = llvm.getelementptr inbounds %105[4] : (!llvm.ptr) -> !llvm.ptr, i64
          %116 = llvm.load %115 : !llvm.ptr -> i64
          %117 = llvm.getelementptr inbounds %22[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %116, %117 : i64, !llvm.ptr
          %118 = llvm.getelementptr inbounds %105[5] : (!llvm.ptr) -> !llvm.ptr, i64
          %119 = llvm.load %118 : !llvm.ptr -> i64
          %120 = llvm.getelementptr inbounds %22[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %119, %120 : i64, !llvm.ptr
          %121 = llvm.getelementptr inbounds %105[6] : (!llvm.ptr) -> !llvm.ptr, i64
          %122 = llvm.load %121 : !llvm.ptr -> i64
          %123 = llvm.getelementptr inbounds %22[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %122, %123 : i64, !llvm.ptr
          %124 = llvm.getelementptr inbounds %105[7] : (!llvm.ptr) -> !llvm.ptr, i64
          %125 = llvm.load %124 : !llvm.ptr -> i64
          %126 = llvm.getelementptr inbounds %22[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %125, %126 : i64, !llvm.ptr
          %127 = llvm.call @iree_uk_unpack(%36, %15, %8, %12, %33, %37, %6, %14, %9, %13, %18, %18, %6, %11, %5, %22) : (!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32
          %128 = llvm.add %37, %11 : i64
          llvm.br ^bb1(%128 : i64)
        ^bb8:  // pred: ^bb1
          llvm.return %17 : i32
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
