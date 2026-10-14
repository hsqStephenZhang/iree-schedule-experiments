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
          %1 = llvm.mlir.constant(8 : i64) : i64
          %2 = llvm.mlir.constant(262656 : index) : i64
          %3 = llvm.mlir.constant(32768 : index) : i64
          %4 = llvm.mlir.constant(15360 : index) : i64
          %5 = llvm.mlir.constant(64 : index) : i64
          %6 = llvm.mlir.constant(true) : i1
          %7 = llvm.mlir.constant(0 : index) : i64
          %8 = llvm.mlir.constant(1 : index) : i64
          %9 = llvm.mlir.constant(6 : index) : i64
          %10 = llvm.mlir.constant(8 : index) : i64
          %11 = llvm.mlir.constant(16 : index) : i64
          %12 = llvm.mlir.constant(32 : index) : i64
          %13 = llvm.mlir.constant(60 : index) : i64
          %14 = llvm.mlir.constant(96 : index) : i64
          %15 = llvm.mlir.constant(128 : index) : i64
          %16 = llvm.mlir.constant(256 : index) : i64
          %17 = llvm.mlir.constant(342 : index) : i64
          %18 = llvm.mlir.constant(768 : index) : i64
          %19 = llvm.mlir.constant(1536 : index) : i64
          %20 = llvm.mlir.constant(2048 : index) : i64
          %21 = llvm.mlir.constant(4096 : index) : i64
          %22 = llvm.mlir.constant(0 : i64) : i64
          %23 = llvm.mlir.constant(257 : i32) : i32
          %24 = llvm.mlir.constant(513 : i32) : i32
          %25 = llvm.mlir.constant(1 : i32) : i32
          %26 = llvm.mlir.constant(0 : i32) : i32
          %27 = llvm.mlir.constant(256 : i32) : i32
          %28 = llvm.mlir.constant(6 : i32) : i32
          %29 = llvm.mlir.constant(16 : i32) : i32
          %30 = llvm.mlir.constant(8 : i32) : i32
          %31 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %32 = llvm.extractvalue %31[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %33 = llvm.load %32 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %6 ["align"(%33, %5 : !llvm.ptr, i64)] : i1
          %34 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %35 = llvm.extractvalue %34[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %36 = llvm.getelementptr %35[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %37 = llvm.load %36 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %6 ["align"(%37, %5 : !llvm.ptr, i64)] : i1
          %38 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %39 = llvm.extractvalue %38[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %40 = llvm.getelementptr %39[2] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %41 = llvm.load %40 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %6 ["align"(%41, %5 : !llvm.ptr, i64)] : i1
          %42 = llvm.alloca %4 x f32 {alignment = 64 : i64} : (i64) -> !llvm.ptr
          %43 = llvm.alloca %3 x f32 {alignment = 64 : i64} : (i64) -> !llvm.ptr
          %44 = llvm.alloca %2 x f32 {alignment = 64 : i64} : (i64) -> !llvm.ptr
          llvm.br ^bb1(%7 : i64)
        ^bb1(%45: i64):  // 2 preds: ^bb0, ^bb7
          %46 = llvm.icmp "slt" %45, %20 : i64
          llvm.cond_br %46, ^bb2(%7 : i64), ^bb8
        ^bb2(%47: i64):  // 2 preds: ^bb1, ^bb6
          %48 = llvm.icmp "slt" %47, %20 : i64
          llvm.cond_br %48, ^bb3, ^bb7
        ^bb3:  // pred: ^bb2
          %49 = llvm.mul %47, %20 : i64
          %50 = llvm.add %49, %45 : i64
          %51 = llvm.getelementptr inbounds %arg0[4] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %52 = llvm.alloca %1 x i64 {alignment = 8 : i64} : (i64) -> !llvm.ptr
          %53 = llvm.load %51 : !llvm.ptr -> i64
          %54 = llvm.or %53, %0 : i64
          llvm.store %54, %52 : i64, !llvm.ptr
          %55 = llvm.getelementptr inbounds %51[1] : (!llvm.ptr) -> !llvm.ptr, i64
          %56 = llvm.load %55 : !llvm.ptr -> i64
          %57 = llvm.getelementptr inbounds %52[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %56, %57 : i64, !llvm.ptr
          %58 = llvm.getelementptr inbounds %51[2] : (!llvm.ptr) -> !llvm.ptr, i64
          %59 = llvm.load %58 : !llvm.ptr -> i64
          %60 = llvm.getelementptr inbounds %52[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %59, %60 : i64, !llvm.ptr
          %61 = llvm.getelementptr inbounds %51[3] : (!llvm.ptr) -> !llvm.ptr, i64
          %62 = llvm.load %61 : !llvm.ptr -> i64
          %63 = llvm.getelementptr inbounds %52[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %62, %63 : i64, !llvm.ptr
          %64 = llvm.getelementptr inbounds %51[4] : (!llvm.ptr) -> !llvm.ptr, i64
          %65 = llvm.load %64 : !llvm.ptr -> i64
          %66 = llvm.getelementptr inbounds %52[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %65, %66 : i64, !llvm.ptr
          %67 = llvm.getelementptr inbounds %51[5] : (!llvm.ptr) -> !llvm.ptr, i64
          %68 = llvm.load %67 : !llvm.ptr -> i64
          %69 = llvm.getelementptr inbounds %52[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %68, %69 : i64, !llvm.ptr
          %70 = llvm.getelementptr inbounds %51[6] : (!llvm.ptr) -> !llvm.ptr, i64
          %71 = llvm.load %70 : !llvm.ptr -> i64
          %72 = llvm.getelementptr inbounds %52[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %71, %72 : i64, !llvm.ptr
          %73 = llvm.getelementptr inbounds %51[7] : (!llvm.ptr) -> !llvm.ptr, i64
          %74 = llvm.load %73 : !llvm.ptr -> i64
          %75 = llvm.getelementptr inbounds %52[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %74, %75 : i64, !llvm.ptr
          %76 = llvm.call @iree_uk_pack(%37, %50, %20, %8, %43, %7, %21, %11, %16, %15, %10, %16, %8, %11, %22, %24, %52) : (!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32
          %77 = llvm.icmp "eq" %47, %7 : i64
          %78 = llvm.select %77, %26, %27 : i1, i32
          llvm.br ^bb4(%7 : i64)
        ^bb4(%79: i64):  // 2 preds: ^bb3, ^bb5
          %80 = llvm.icmp "slt" %79, %20 : i64
          llvm.cond_br %80, ^bb5, ^bb6
        ^bb5:  // pred: ^bb4
          %81 = llvm.sub %20, %79 : i64
          %82 = llvm.intr.umin(%81, %13) : (i64, i64) -> i64
          %83 = llvm.mul %79, %20 : i64
          %84 = llvm.add %83, %47 : i64
          %85 = llvm.mul %79, %15 : i64
          %86 = llvm.icmp "eq" %82, %7 : i64
          %87 = llvm.sub %82, %8 : i64
          %88 = llvm.udiv %87, %9 : i64
          %89 = llvm.add %88, %8 : i64
          %90 = llvm.select %86, %7, %89 : i1, i64
          %91 = llvm.alloca %1 x i64 {alignment = 8 : i64} : (i64) -> !llvm.ptr
          %92 = llvm.load %51 : !llvm.ptr -> i64
          %93 = llvm.or %92, %0 : i64
          llvm.store %93, %91 : i64, !llvm.ptr
          %94 = llvm.load %55 : !llvm.ptr -> i64
          %95 = llvm.getelementptr inbounds %91[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %94, %95 : i64, !llvm.ptr
          %96 = llvm.load %58 : !llvm.ptr -> i64
          %97 = llvm.getelementptr inbounds %91[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %96, %97 : i64, !llvm.ptr
          %98 = llvm.load %61 : !llvm.ptr -> i64
          %99 = llvm.getelementptr inbounds %91[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %98, %99 : i64, !llvm.ptr
          %100 = llvm.load %64 : !llvm.ptr -> i64
          %101 = llvm.getelementptr inbounds %91[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %100, %101 : i64, !llvm.ptr
          %102 = llvm.load %67 : !llvm.ptr -> i64
          %103 = llvm.getelementptr inbounds %91[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %102, %103 : i64, !llvm.ptr
          %104 = llvm.load %70 : !llvm.ptr -> i64
          %105 = llvm.getelementptr inbounds %91[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %104, %105 : i64, !llvm.ptr
          %106 = llvm.load %73 : !llvm.ptr -> i64
          %107 = llvm.getelementptr inbounds %91[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %106, %107 : i64, !llvm.ptr
          %108 = llvm.call @iree_uk_pack(%33, %84, %20, %8, %42, %7, %19, %9, %82, %16, %90, %16, %8, %9, %22, %23, %91) : (!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32
          %109 = llvm.alloca %1 x i64 {alignment = 8 : i64} : (i64) -> !llvm.ptr
          %110 = llvm.load %51 : !llvm.ptr -> i64
          %111 = llvm.or %110, %0 : i64
          llvm.store %111, %109 : i64, !llvm.ptr
          %112 = llvm.load %55 : !llvm.ptr -> i64
          %113 = llvm.getelementptr inbounds %109[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %112, %113 : i64, !llvm.ptr
          %114 = llvm.load %58 : !llvm.ptr -> i64
          %115 = llvm.getelementptr inbounds %109[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %114, %115 : i64, !llvm.ptr
          %116 = llvm.load %61 : !llvm.ptr -> i64
          %117 = llvm.getelementptr inbounds %109[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %116, %117 : i64, !llvm.ptr
          %118 = llvm.load %64 : !llvm.ptr -> i64
          %119 = llvm.getelementptr inbounds %109[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %118, %119 : i64, !llvm.ptr
          %120 = llvm.load %67 : !llvm.ptr -> i64
          %121 = llvm.getelementptr inbounds %109[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %120, %121 : i64, !llvm.ptr
          %122 = llvm.load %70 : !llvm.ptr -> i64
          %123 = llvm.getelementptr inbounds %109[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %122, %123 : i64, !llvm.ptr
          %124 = llvm.load %73 : !llvm.ptr -> i64
          %125 = llvm.getelementptr inbounds %109[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %124, %125 : i64, !llvm.ptr
          %126 = llvm.call @custom_mmt4d_6x16x8(%42, %7, %19, %43, %7, %21, %44, %85, %18, %90, %10, %12, %28, %29, %30, %78, %109) : (!llvm.ptr, i64, i64, !llvm.ptr, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i32, i32, i32, i32, !llvm.ptr) -> i32
          %127 = llvm.add %79, %13 : i64
          llvm.br ^bb4(%127 : i64)
        ^bb6:  // pred: ^bb4
          %128 = llvm.add %47, %16 : i64
          llvm.br ^bb2(%128 : i64)
        ^bb7:  // pred: ^bb2
          %129 = llvm.getelementptr inbounds %arg0[4] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %130 = llvm.alloca %1 x i64 {alignment = 8 : i64} : (i64) -> !llvm.ptr
          %131 = llvm.load %129 : !llvm.ptr -> i64
          %132 = llvm.or %131, %0 : i64
          llvm.store %132, %130 : i64, !llvm.ptr
          %133 = llvm.getelementptr inbounds %129[1] : (!llvm.ptr) -> !llvm.ptr, i64
          %134 = llvm.load %133 : !llvm.ptr -> i64
          %135 = llvm.getelementptr inbounds %130[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %134, %135 : i64, !llvm.ptr
          %136 = llvm.getelementptr inbounds %129[2] : (!llvm.ptr) -> !llvm.ptr, i64
          %137 = llvm.load %136 : !llvm.ptr -> i64
          %138 = llvm.getelementptr inbounds %130[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %137, %138 : i64, !llvm.ptr
          %139 = llvm.getelementptr inbounds %129[3] : (!llvm.ptr) -> !llvm.ptr, i64
          %140 = llvm.load %139 : !llvm.ptr -> i64
          %141 = llvm.getelementptr inbounds %130[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %140, %141 : i64, !llvm.ptr
          %142 = llvm.getelementptr inbounds %129[4] : (!llvm.ptr) -> !llvm.ptr, i64
          %143 = llvm.load %142 : !llvm.ptr -> i64
          %144 = llvm.getelementptr inbounds %130[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %143, %144 : i64, !llvm.ptr
          %145 = llvm.getelementptr inbounds %129[5] : (!llvm.ptr) -> !llvm.ptr, i64
          %146 = llvm.load %145 : !llvm.ptr -> i64
          %147 = llvm.getelementptr inbounds %130[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %146, %147 : i64, !llvm.ptr
          %148 = llvm.getelementptr inbounds %129[6] : (!llvm.ptr) -> !llvm.ptr, i64
          %149 = llvm.load %148 : !llvm.ptr -> i64
          %150 = llvm.getelementptr inbounds %130[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %149, %150 : i64, !llvm.ptr
          %151 = llvm.getelementptr inbounds %129[7] : (!llvm.ptr) -> !llvm.ptr, i64
          %152 = llvm.load %151 : !llvm.ptr -> i64
          %153 = llvm.getelementptr inbounds %130[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %152, %153 : i64, !llvm.ptr
          %154 = llvm.call @iree_uk_unpack(%44, %7, %18, %14, %41, %45, %20, %8, %17, %10, %9, %11, %20, %15, %25, %130) : (!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32
          %155 = llvm.add %45, %15 : i64
          llvm.br ^bb1(%155 : i64)
        ^bb8:  // pred: ^bb1
          llvm.return %26 : i32
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
