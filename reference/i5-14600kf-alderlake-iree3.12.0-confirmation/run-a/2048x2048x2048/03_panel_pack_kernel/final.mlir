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
        llvm.func @custom_mmt4d_6x16x8(!llvm.ptr, i64, i64, !llvm.ptr, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i32, i32, i32, i32, !llvm.ptr) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
        llvm.func @gemm_dispatch_0_matmul_2048x2048x2048_f32(%arg0: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg1: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg2: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}) -> i32 {
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
          %10 = llvm.mlir.constant(2048 : i64) : i64
          %11 = llvm.mlir.constant(1536 : i64) : i64
          %12 = llvm.mlir.constant(768 : i64) : i64
          %13 = llvm.mlir.constant(342 : i64) : i64
          %14 = llvm.mlir.constant(256 : i64) : i64
          %15 = llvm.mlir.constant(128 : i64) : i64
          %16 = llvm.mlir.constant(96 : i64) : i64
          %17 = llvm.mlir.constant(60 : i64) : i64
          %18 = llvm.mlir.constant(32 : i64) : i64
          %19 = llvm.mlir.constant(16 : i64) : i64
          %20 = llvm.mlir.constant(6 : i64) : i64
          %21 = llvm.mlir.constant(1 : i64) : i64
          %22 = llvm.mlir.constant(0 : i64) : i64
          %23 = llvm.mlir.constant(true) : i1
          %24 = llvm.mlir.constant(64 : i64) : i64
          %25 = llvm.mlir.constant(8 : i64) : i64
          %26 = llvm.alloca %6 x !llvm.array<8 x i64> {alignment = 8 : i64} : (i32) -> !llvm.ptr
          %27 = llvm.alloca %6 x !llvm.array<8 x i64> {alignment = 8 : i64} : (i32) -> !llvm.ptr
          %28 = llvm.alloca %6 x !llvm.array<8 x i64> {alignment = 8 : i64} : (i32) -> !llvm.ptr
          %29 = llvm.alloca %6 x !llvm.array<8 x i64> {alignment = 8 : i64} : (i32) -> !llvm.ptr
          %30 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %31 = llvm.extractvalue %30[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %32 = llvm.load %31 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %23 ["align"(%32, %24 : !llvm.ptr, i64)] : i1
          %33 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %34 = llvm.extractvalue %33[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %35 = llvm.getelementptr %34[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %36 = llvm.load %35 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %23 ["align"(%36, %24 : !llvm.ptr, i64)] : i1
          %37 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %38 = llvm.extractvalue %37[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %39 = llvm.getelementptr %38[2] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %40 = llvm.load %39 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %23 ["align"(%40, %24 : !llvm.ptr, i64)] : i1
          %41 = llvm.alloca %6 x !llvm.array<15360 x f32> {alignment = 64 : i64} : (i32) -> !llvm.ptr
          %42 = llvm.alloca %6 x !llvm.array<32768 x f32> {alignment = 64 : i64} : (i32) -> !llvm.ptr
          %43 = llvm.alloca %6 x !llvm.array<262656 x f32> {alignment = 64 : i64} : (i32) -> !llvm.ptr
          llvm.br ^bb1(%22 : i64)
        ^bb1(%44: i64):  // 2 preds: ^bb0, ^bb7
          %45 = llvm.icmp "slt" %44, %10 : i64
          llvm.cond_br %45, ^bb2(%22 : i64), ^bb8
        ^bb2(%46: i64):  // 2 preds: ^bb1, ^bb6
          %47 = llvm.icmp "slt" %46, %10 : i64
          llvm.cond_br %47, ^bb3, ^bb7
        ^bb3:  // pred: ^bb2
          %48 = llvm.mul %46, %10 : i64
          %49 = llvm.add %48, %44 : i64
          %50 = llvm.getelementptr inbounds %arg0[4] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          llvm.store %0, %27 : i64, !llvm.ptr
          %51 = llvm.getelementptr inbounds %50[1] : (!llvm.ptr) -> !llvm.ptr, i64
          %52 = llvm.load %51 : !llvm.ptr -> i64
          %53 = llvm.getelementptr inbounds %27[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %52, %53 : i64, !llvm.ptr
          %54 = llvm.getelementptr inbounds %50[2] : (!llvm.ptr) -> !llvm.ptr, i64
          %55 = llvm.load %54 : !llvm.ptr -> i64
          %56 = llvm.getelementptr inbounds %27[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %55, %56 : i64, !llvm.ptr
          %57 = llvm.getelementptr inbounds %50[3] : (!llvm.ptr) -> !llvm.ptr, i64
          %58 = llvm.load %57 : !llvm.ptr -> i64
          %59 = llvm.getelementptr inbounds %27[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %58, %59 : i64, !llvm.ptr
          %60 = llvm.getelementptr inbounds %50[4] : (!llvm.ptr) -> !llvm.ptr, i64
          %61 = llvm.load %60 : !llvm.ptr -> i64
          %62 = llvm.getelementptr inbounds %27[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %61, %62 : i64, !llvm.ptr
          %63 = llvm.getelementptr inbounds %50[5] : (!llvm.ptr) -> !llvm.ptr, i64
          %64 = llvm.load %63 : !llvm.ptr -> i64
          %65 = llvm.getelementptr inbounds %27[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %64, %65 : i64, !llvm.ptr
          %66 = llvm.getelementptr inbounds %50[6] : (!llvm.ptr) -> !llvm.ptr, i64
          %67 = llvm.load %66 : !llvm.ptr -> i64
          %68 = llvm.getelementptr inbounds %27[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %67, %68 : i64, !llvm.ptr
          %69 = llvm.getelementptr inbounds %50[7] : (!llvm.ptr) -> !llvm.ptr, i64
          %70 = llvm.load %69 : !llvm.ptr -> i64
          %71 = llvm.getelementptr inbounds %27[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %70, %71 : i64, !llvm.ptr
          %72 = llvm.call @iree_uk_pack(%36, %49, %10, %21, %42, %22, %9, %19, %14, %15, %25, %14, %21, %19, %22, %7, %27) : (!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32
          %73 = llvm.icmp "eq" %46, %22 : i64
          %74 = llvm.select %73, %5, %4 : i1, i32
          llvm.br ^bb4(%22 : i64)
        ^bb4(%75: i64):  // 2 preds: ^bb3, ^bb5
          %76 = llvm.icmp "slt" %75, %10 : i64
          llvm.cond_br %76, ^bb5, ^bb6
        ^bb5:  // pred: ^bb4
          %77 = llvm.sub %10, %75 : i64
          %78 = llvm.intr.umin(%77, %17) : (i64, i64) -> i64
          %79 = llvm.mul %75, %10 : i64
          %80 = llvm.add %79, %46 : i64
          %81 = llvm.mul %75, %15 : i64
          %82 = llvm.icmp "eq" %78, %22 : i64
          %83 = llvm.sub %78, %21 : i64
          %84 = llvm.udiv %83, %20 : i64
          %85 = llvm.add %84, %21 : i64
          %86 = llvm.select %82, %22, %85 : i1, i64
          llvm.store %0, %26 : i64, !llvm.ptr
          %87 = llvm.load %51 : !llvm.ptr -> i64
          %88 = llvm.getelementptr inbounds %26[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %87, %88 : i64, !llvm.ptr
          %89 = llvm.load %54 : !llvm.ptr -> i64
          %90 = llvm.getelementptr inbounds %26[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %89, %90 : i64, !llvm.ptr
          %91 = llvm.load %57 : !llvm.ptr -> i64
          %92 = llvm.getelementptr inbounds %26[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %91, %92 : i64, !llvm.ptr
          %93 = llvm.load %60 : !llvm.ptr -> i64
          %94 = llvm.getelementptr inbounds %26[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %93, %94 : i64, !llvm.ptr
          %95 = llvm.load %63 : !llvm.ptr -> i64
          %96 = llvm.getelementptr inbounds %26[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %95, %96 : i64, !llvm.ptr
          %97 = llvm.load %66 : !llvm.ptr -> i64
          %98 = llvm.getelementptr inbounds %26[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %97, %98 : i64, !llvm.ptr
          %99 = llvm.load %69 : !llvm.ptr -> i64
          %100 = llvm.getelementptr inbounds %26[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %99, %100 : i64, !llvm.ptr
          %101 = llvm.call @iree_uk_pack(%32, %80, %10, %21, %41, %22, %11, %20, %78, %14, %86, %14, %21, %20, %22, %8, %26) : (!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32
          llvm.store %0, %28 : i64, !llvm.ptr
          %102 = llvm.load %51 : !llvm.ptr -> i64
          %103 = llvm.getelementptr inbounds %28[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %102, %103 : i64, !llvm.ptr
          %104 = llvm.load %54 : !llvm.ptr -> i64
          %105 = llvm.getelementptr inbounds %28[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %104, %105 : i64, !llvm.ptr
          %106 = llvm.load %57 : !llvm.ptr -> i64
          %107 = llvm.getelementptr inbounds %28[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %106, %107 : i64, !llvm.ptr
          %108 = llvm.load %60 : !llvm.ptr -> i64
          %109 = llvm.getelementptr inbounds %28[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %108, %109 : i64, !llvm.ptr
          %110 = llvm.load %63 : !llvm.ptr -> i64
          %111 = llvm.getelementptr inbounds %28[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %110, %111 : i64, !llvm.ptr
          %112 = llvm.load %66 : !llvm.ptr -> i64
          %113 = llvm.getelementptr inbounds %28[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %112, %113 : i64, !llvm.ptr
          %114 = llvm.load %69 : !llvm.ptr -> i64
          %115 = llvm.getelementptr inbounds %28[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %114, %115 : i64, !llvm.ptr
          %116 = llvm.call @custom_mmt4d_6x16x8(%41, %22, %11, %42, %22, %9, %43, %81, %12, %86, %25, %18, %3, %2, %1, %74, %28) : (!llvm.ptr, i64, i64, !llvm.ptr, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i32, i32, i32, i32, !llvm.ptr) -> i32
          %117 = llvm.add %75, %17 : i64
          llvm.br ^bb4(%117 : i64)
        ^bb6:  // pred: ^bb4
          %118 = llvm.add %46, %14 : i64
          llvm.br ^bb2(%118 : i64)
        ^bb7:  // pred: ^bb2
          %119 = llvm.getelementptr inbounds %arg0[4] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          llvm.store %0, %29 : i64, !llvm.ptr
          %120 = llvm.getelementptr inbounds %119[1] : (!llvm.ptr) -> !llvm.ptr, i64
          %121 = llvm.load %120 : !llvm.ptr -> i64
          %122 = llvm.getelementptr inbounds %29[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %121, %122 : i64, !llvm.ptr
          %123 = llvm.getelementptr inbounds %119[2] : (!llvm.ptr) -> !llvm.ptr, i64
          %124 = llvm.load %123 : !llvm.ptr -> i64
          %125 = llvm.getelementptr inbounds %29[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %124, %125 : i64, !llvm.ptr
          %126 = llvm.getelementptr inbounds %119[3] : (!llvm.ptr) -> !llvm.ptr, i64
          %127 = llvm.load %126 : !llvm.ptr -> i64
          %128 = llvm.getelementptr inbounds %29[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %127, %128 : i64, !llvm.ptr
          %129 = llvm.getelementptr inbounds %119[4] : (!llvm.ptr) -> !llvm.ptr, i64
          %130 = llvm.load %129 : !llvm.ptr -> i64
          %131 = llvm.getelementptr inbounds %29[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %130, %131 : i64, !llvm.ptr
          %132 = llvm.getelementptr inbounds %119[5] : (!llvm.ptr) -> !llvm.ptr, i64
          %133 = llvm.load %132 : !llvm.ptr -> i64
          %134 = llvm.getelementptr inbounds %29[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %133, %134 : i64, !llvm.ptr
          %135 = llvm.getelementptr inbounds %119[6] : (!llvm.ptr) -> !llvm.ptr, i64
          %136 = llvm.load %135 : !llvm.ptr -> i64
          %137 = llvm.getelementptr inbounds %29[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %136, %137 : i64, !llvm.ptr
          %138 = llvm.getelementptr inbounds %119[7] : (!llvm.ptr) -> !llvm.ptr, i64
          %139 = llvm.load %138 : !llvm.ptr -> i64
          %140 = llvm.getelementptr inbounds %29[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %139, %140 : i64, !llvm.ptr
          %141 = llvm.call @iree_uk_unpack(%43, %22, %12, %16, %40, %44, %10, %21, %13, %25, %20, %19, %10, %15, %6, %29) : (!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32
          %142 = llvm.add %44, %15 : i64
          llvm.br ^bb1(%142 : i64)
        ^bb8:  // pred: ^bb1
          llvm.return %5 : i32
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
