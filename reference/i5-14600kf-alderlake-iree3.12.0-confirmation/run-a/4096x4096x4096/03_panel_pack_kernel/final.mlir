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
        llvm.func @custom_mmt4d_6x16x8(!llvm.ptr, i64, i64, !llvm.ptr, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i32, i32, i32, i32, !llvm.ptr) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
        llvm.func @gemm_dispatch_0_matmul_4096x4096x4096_f32(%arg0: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg1: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg2: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}) -> i32 {
          %0 = llvm.mlir.constant(52239 : i64) : i64
          %1 = llvm.mlir.constant(8 : i32) : i32
          %2 = llvm.mlir.constant(16 : i32) : i32
          %3 = llvm.mlir.constant(6 : i32) : i32
          %4 = llvm.mlir.constant(256 : i32) : i32
          %5 = llvm.mlir.constant(0 : i32) : i32
          %6 = llvm.mlir.constant(1 : i32) : i32
          %7 = llvm.mlir.constant(513 : i32) : i32
          %8 = llvm.mlir.constant(257 : i32) : i32
          %9 = llvm.mlir.constant(4096 : i64) : i64
          %10 = llvm.mlir.constant(1536 : i64) : i64
          %11 = llvm.mlir.constant(768 : i64) : i64
          %12 = llvm.mlir.constant(683 : i64) : i64
          %13 = llvm.mlir.constant(256 : i64) : i64
          %14 = llvm.mlir.constant(128 : i64) : i64
          %15 = llvm.mlir.constant(96 : i64) : i64
          %16 = llvm.mlir.constant(60 : i64) : i64
          %17 = llvm.mlir.constant(32 : i64) : i64
          %18 = llvm.mlir.constant(16 : i64) : i64
          %19 = llvm.mlir.constant(6 : i64) : i64
          %20 = llvm.mlir.constant(1 : i64) : i64
          %21 = llvm.mlir.constant(0 : i64) : i64
          %22 = llvm.mlir.constant(true) : i1
          %23 = llvm.mlir.constant(64 : i64) : i64
          %24 = llvm.mlir.constant(8 : i64) : i64
          %25 = llvm.alloca %6 x !llvm.array<8 x i64> {alignment = 8 : i64} : (i32) -> !llvm.ptr
          %26 = llvm.alloca %6 x !llvm.array<8 x i64> {alignment = 8 : i64} : (i32) -> !llvm.ptr
          %27 = llvm.alloca %6 x !llvm.array<8 x i64> {alignment = 8 : i64} : (i32) -> !llvm.ptr
          %28 = llvm.alloca %6 x !llvm.array<8 x i64> {alignment = 8 : i64} : (i32) -> !llvm.ptr
          %29 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %30 = llvm.extractvalue %29[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %31 = llvm.load %30 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %22 ["align"(%31, %23 : !llvm.ptr, i64)] : i1
          %32 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %33 = llvm.extractvalue %32[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %34 = llvm.getelementptr %33[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %35 = llvm.load %34 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %22 ["align"(%35, %23 : !llvm.ptr, i64)] : i1
          %36 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %37 = llvm.extractvalue %36[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %38 = llvm.getelementptr %37[2] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %39 = llvm.load %38 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %22 ["align"(%39, %23 : !llvm.ptr, i64)] : i1
          %40 = llvm.alloca %6 x !llvm.array<15360 x f32> {alignment = 64 : i64} : (i32) -> !llvm.ptr
          %41 = llvm.alloca %6 x !llvm.array<32768 x f32> {alignment = 64 : i64} : (i32) -> !llvm.ptr
          %42 = llvm.alloca %6 x !llvm.array<524544 x f32> {alignment = 64 : i64} : (i32) -> !llvm.ptr
          llvm.br ^bb1(%21 : i64)
        ^bb1(%43: i64):  // 2 preds: ^bb0, ^bb7
          %44 = llvm.icmp "slt" %43, %9 : i64
          llvm.cond_br %44, ^bb2(%21 : i64), ^bb8
        ^bb2(%45: i64):  // 2 preds: ^bb1, ^bb6
          %46 = llvm.icmp "slt" %45, %9 : i64
          llvm.cond_br %46, ^bb3, ^bb7
        ^bb3:  // pred: ^bb2
          %47 = llvm.mul %45, %9 : i64
          %48 = llvm.add %47, %43 : i64
          %49 = llvm.getelementptr inbounds %arg0[4] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          llvm.store %0, %26 : i64, !llvm.ptr
          %50 = llvm.getelementptr inbounds %49[1] : (!llvm.ptr) -> !llvm.ptr, i64
          %51 = llvm.load %50 : !llvm.ptr -> i64
          %52 = llvm.getelementptr inbounds %26[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %51, %52 : i64, !llvm.ptr
          %53 = llvm.getelementptr inbounds %49[2] : (!llvm.ptr) -> !llvm.ptr, i64
          %54 = llvm.load %53 : !llvm.ptr -> i64
          %55 = llvm.getelementptr inbounds %26[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %54, %55 : i64, !llvm.ptr
          %56 = llvm.getelementptr inbounds %49[3] : (!llvm.ptr) -> !llvm.ptr, i64
          %57 = llvm.load %56 : !llvm.ptr -> i64
          %58 = llvm.getelementptr inbounds %26[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %57, %58 : i64, !llvm.ptr
          %59 = llvm.getelementptr inbounds %49[4] : (!llvm.ptr) -> !llvm.ptr, i64
          %60 = llvm.load %59 : !llvm.ptr -> i64
          %61 = llvm.getelementptr inbounds %26[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %60, %61 : i64, !llvm.ptr
          %62 = llvm.getelementptr inbounds %49[5] : (!llvm.ptr) -> !llvm.ptr, i64
          %63 = llvm.load %62 : !llvm.ptr -> i64
          %64 = llvm.getelementptr inbounds %26[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %63, %64 : i64, !llvm.ptr
          %65 = llvm.getelementptr inbounds %49[6] : (!llvm.ptr) -> !llvm.ptr, i64
          %66 = llvm.load %65 : !llvm.ptr -> i64
          %67 = llvm.getelementptr inbounds %26[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %66, %67 : i64, !llvm.ptr
          %68 = llvm.getelementptr inbounds %49[7] : (!llvm.ptr) -> !llvm.ptr, i64
          %69 = llvm.load %68 : !llvm.ptr -> i64
          %70 = llvm.getelementptr inbounds %26[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %69, %70 : i64, !llvm.ptr
          %71 = llvm.call @iree_uk_pack(%35, %48, %9, %20, %41, %21, %9, %18, %13, %14, %24, %13, %20, %18, %21, %7, %26) : (!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32
          %72 = llvm.icmp "eq" %45, %21 : i64
          %73 = llvm.select %72, %5, %4 : i1, i32
          llvm.br ^bb4(%21 : i64)
        ^bb4(%74: i64):  // 2 preds: ^bb3, ^bb5
          %75 = llvm.icmp "slt" %74, %9 : i64
          llvm.cond_br %75, ^bb5, ^bb6
        ^bb5:  // pred: ^bb4
          %76 = llvm.sub %9, %74 : i64
          %77 = llvm.intr.umin(%76, %16) : (i64, i64) -> i64
          %78 = llvm.mul %74, %9 : i64
          %79 = llvm.add %78, %45 : i64
          %80 = llvm.mul %74, %14 : i64
          %81 = llvm.icmp "eq" %77, %21 : i64
          %82 = llvm.sub %77, %20 : i64
          %83 = llvm.udiv %82, %19 : i64
          %84 = llvm.add %83, %20 : i64
          %85 = llvm.select %81, %21, %84 : i1, i64
          llvm.store %0, %25 : i64, !llvm.ptr
          %86 = llvm.load %50 : !llvm.ptr -> i64
          %87 = llvm.getelementptr inbounds %25[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %86, %87 : i64, !llvm.ptr
          %88 = llvm.load %53 : !llvm.ptr -> i64
          %89 = llvm.getelementptr inbounds %25[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %88, %89 : i64, !llvm.ptr
          %90 = llvm.load %56 : !llvm.ptr -> i64
          %91 = llvm.getelementptr inbounds %25[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %90, %91 : i64, !llvm.ptr
          %92 = llvm.load %59 : !llvm.ptr -> i64
          %93 = llvm.getelementptr inbounds %25[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %92, %93 : i64, !llvm.ptr
          %94 = llvm.load %62 : !llvm.ptr -> i64
          %95 = llvm.getelementptr inbounds %25[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %94, %95 : i64, !llvm.ptr
          %96 = llvm.load %65 : !llvm.ptr -> i64
          %97 = llvm.getelementptr inbounds %25[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %96, %97 : i64, !llvm.ptr
          %98 = llvm.load %68 : !llvm.ptr -> i64
          %99 = llvm.getelementptr inbounds %25[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %98, %99 : i64, !llvm.ptr
          %100 = llvm.call @iree_uk_pack(%31, %79, %9, %20, %40, %21, %10, %19, %77, %13, %85, %13, %20, %19, %21, %8, %25) : (!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32
          llvm.store %0, %27 : i64, !llvm.ptr
          %101 = llvm.load %50 : !llvm.ptr -> i64
          %102 = llvm.getelementptr inbounds %27[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %101, %102 : i64, !llvm.ptr
          %103 = llvm.load %53 : !llvm.ptr -> i64
          %104 = llvm.getelementptr inbounds %27[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %103, %104 : i64, !llvm.ptr
          %105 = llvm.load %56 : !llvm.ptr -> i64
          %106 = llvm.getelementptr inbounds %27[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %105, %106 : i64, !llvm.ptr
          %107 = llvm.load %59 : !llvm.ptr -> i64
          %108 = llvm.getelementptr inbounds %27[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %107, %108 : i64, !llvm.ptr
          %109 = llvm.load %62 : !llvm.ptr -> i64
          %110 = llvm.getelementptr inbounds %27[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %109, %110 : i64, !llvm.ptr
          %111 = llvm.load %65 : !llvm.ptr -> i64
          %112 = llvm.getelementptr inbounds %27[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %111, %112 : i64, !llvm.ptr
          %113 = llvm.load %68 : !llvm.ptr -> i64
          %114 = llvm.getelementptr inbounds %27[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %113, %114 : i64, !llvm.ptr
          %115 = llvm.call @custom_mmt4d_6x16x8(%40, %21, %10, %41, %21, %9, %42, %80, %11, %85, %24, %17, %3, %2, %1, %73, %27) : (!llvm.ptr, i64, i64, !llvm.ptr, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i32, i32, i32, i32, !llvm.ptr) -> i32
          %116 = llvm.add %74, %16 : i64
          llvm.br ^bb4(%116 : i64)
        ^bb6:  // pred: ^bb4
          %117 = llvm.add %45, %13 : i64
          llvm.br ^bb2(%117 : i64)
        ^bb7:  // pred: ^bb2
          %118 = llvm.getelementptr inbounds %arg0[4] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          llvm.store %0, %28 : i64, !llvm.ptr
          %119 = llvm.getelementptr inbounds %118[1] : (!llvm.ptr) -> !llvm.ptr, i64
          %120 = llvm.load %119 : !llvm.ptr -> i64
          %121 = llvm.getelementptr inbounds %28[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %120, %121 : i64, !llvm.ptr
          %122 = llvm.getelementptr inbounds %118[2] : (!llvm.ptr) -> !llvm.ptr, i64
          %123 = llvm.load %122 : !llvm.ptr -> i64
          %124 = llvm.getelementptr inbounds %28[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %123, %124 : i64, !llvm.ptr
          %125 = llvm.getelementptr inbounds %118[3] : (!llvm.ptr) -> !llvm.ptr, i64
          %126 = llvm.load %125 : !llvm.ptr -> i64
          %127 = llvm.getelementptr inbounds %28[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %126, %127 : i64, !llvm.ptr
          %128 = llvm.getelementptr inbounds %118[4] : (!llvm.ptr) -> !llvm.ptr, i64
          %129 = llvm.load %128 : !llvm.ptr -> i64
          %130 = llvm.getelementptr inbounds %28[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %129, %130 : i64, !llvm.ptr
          %131 = llvm.getelementptr inbounds %118[5] : (!llvm.ptr) -> !llvm.ptr, i64
          %132 = llvm.load %131 : !llvm.ptr -> i64
          %133 = llvm.getelementptr inbounds %28[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %132, %133 : i64, !llvm.ptr
          %134 = llvm.getelementptr inbounds %118[6] : (!llvm.ptr) -> !llvm.ptr, i64
          %135 = llvm.load %134 : !llvm.ptr -> i64
          %136 = llvm.getelementptr inbounds %28[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %135, %136 : i64, !llvm.ptr
          %137 = llvm.getelementptr inbounds %118[7] : (!llvm.ptr) -> !llvm.ptr, i64
          %138 = llvm.load %137 : !llvm.ptr -> i64
          %139 = llvm.getelementptr inbounds %28[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %138, %139 : i64, !llvm.ptr
          %140 = llvm.call @iree_uk_unpack(%42, %21, %11, %15, %39, %43, %9, %20, %12, %24, %19, %18, %9, %14, %6, %28) : (!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32
          %141 = llvm.add %43, %14 : i64
          llvm.br ^bb1(%141 : i64)
        ^bb8:  // pred: ^bb1
          llvm.return %5 : i32
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
