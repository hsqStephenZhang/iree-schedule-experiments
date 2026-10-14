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
          %1 = llvm.mlir.constant(8 : i64) : i64
          %2 = llvm.mlir.constant(524544 : index) : i64
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
          %17 = llvm.mlir.constant(683 : index) : i64
          %18 = llvm.mlir.constant(768 : index) : i64
          %19 = llvm.mlir.constant(1536 : index) : i64
          %20 = llvm.mlir.constant(4096 : index) : i64
          %21 = llvm.mlir.constant(0 : i64) : i64
          %22 = llvm.mlir.constant(257 : i32) : i32
          %23 = llvm.mlir.constant(513 : i32) : i32
          %24 = llvm.mlir.constant(1 : i32) : i32
          %25 = llvm.mlir.constant(0 : i32) : i32
          %26 = llvm.mlir.constant(256 : i32) : i32
          %27 = llvm.mlir.constant(6 : i32) : i32
          %28 = llvm.mlir.constant(16 : i32) : i32
          %29 = llvm.mlir.constant(8 : i32) : i32
          %30 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %31 = llvm.extractvalue %30[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %32 = llvm.load %31 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %6 ["align"(%32, %5 : !llvm.ptr, i64)] : i1
          %33 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %34 = llvm.extractvalue %33[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %35 = llvm.getelementptr %34[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %36 = llvm.load %35 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %6 ["align"(%36, %5 : !llvm.ptr, i64)] : i1
          %37 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %38 = llvm.extractvalue %37[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %39 = llvm.getelementptr %38[2] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %40 = llvm.load %39 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %6 ["align"(%40, %5 : !llvm.ptr, i64)] : i1
          %41 = llvm.alloca %4 x f32 {alignment = 64 : i64} : (i64) -> !llvm.ptr
          %42 = llvm.alloca %3 x f32 {alignment = 64 : i64} : (i64) -> !llvm.ptr
          %43 = llvm.alloca %2 x f32 {alignment = 64 : i64} : (i64) -> !llvm.ptr
          llvm.br ^bb1(%7 : i64)
        ^bb1(%44: i64):  // 2 preds: ^bb0, ^bb7
          %45 = llvm.icmp "slt" %44, %20 : i64
          llvm.cond_br %45, ^bb2(%7 : i64), ^bb8
        ^bb2(%46: i64):  // 2 preds: ^bb1, ^bb6
          %47 = llvm.icmp "slt" %46, %20 : i64
          llvm.cond_br %47, ^bb3, ^bb7
        ^bb3:  // pred: ^bb2
          %48 = llvm.mul %46, %20 : i64
          %49 = llvm.add %48, %44 : i64
          %50 = llvm.getelementptr inbounds %arg0[4] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %51 = llvm.alloca %1 x i64 {alignment = 8 : i64} : (i64) -> !llvm.ptr
          %52 = llvm.load %50 : !llvm.ptr -> i64
          %53 = llvm.or %52, %0 : i64
          llvm.store %53, %51 : i64, !llvm.ptr
          %54 = llvm.getelementptr inbounds %50[1] : (!llvm.ptr) -> !llvm.ptr, i64
          %55 = llvm.load %54 : !llvm.ptr -> i64
          %56 = llvm.getelementptr inbounds %51[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %55, %56 : i64, !llvm.ptr
          %57 = llvm.getelementptr inbounds %50[2] : (!llvm.ptr) -> !llvm.ptr, i64
          %58 = llvm.load %57 : !llvm.ptr -> i64
          %59 = llvm.getelementptr inbounds %51[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %58, %59 : i64, !llvm.ptr
          %60 = llvm.getelementptr inbounds %50[3] : (!llvm.ptr) -> !llvm.ptr, i64
          %61 = llvm.load %60 : !llvm.ptr -> i64
          %62 = llvm.getelementptr inbounds %51[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %61, %62 : i64, !llvm.ptr
          %63 = llvm.getelementptr inbounds %50[4] : (!llvm.ptr) -> !llvm.ptr, i64
          %64 = llvm.load %63 : !llvm.ptr -> i64
          %65 = llvm.getelementptr inbounds %51[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %64, %65 : i64, !llvm.ptr
          %66 = llvm.getelementptr inbounds %50[5] : (!llvm.ptr) -> !llvm.ptr, i64
          %67 = llvm.load %66 : !llvm.ptr -> i64
          %68 = llvm.getelementptr inbounds %51[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %67, %68 : i64, !llvm.ptr
          %69 = llvm.getelementptr inbounds %50[6] : (!llvm.ptr) -> !llvm.ptr, i64
          %70 = llvm.load %69 : !llvm.ptr -> i64
          %71 = llvm.getelementptr inbounds %51[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %70, %71 : i64, !llvm.ptr
          %72 = llvm.getelementptr inbounds %50[7] : (!llvm.ptr) -> !llvm.ptr, i64
          %73 = llvm.load %72 : !llvm.ptr -> i64
          %74 = llvm.getelementptr inbounds %51[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %73, %74 : i64, !llvm.ptr
          %75 = llvm.call @iree_uk_pack(%36, %49, %20, %8, %42, %7, %20, %11, %16, %15, %10, %16, %8, %11, %21, %23, %51) : (!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32
          %76 = llvm.icmp "eq" %46, %7 : i64
          %77 = llvm.select %76, %25, %26 : i1, i32
          llvm.br ^bb4(%7 : i64)
        ^bb4(%78: i64):  // 2 preds: ^bb3, ^bb5
          %79 = llvm.icmp "slt" %78, %20 : i64
          llvm.cond_br %79, ^bb5, ^bb6
        ^bb5:  // pred: ^bb4
          %80 = llvm.sub %20, %78 : i64
          %81 = llvm.intr.umin(%80, %13) : (i64, i64) -> i64
          %82 = llvm.mul %78, %20 : i64
          %83 = llvm.add %82, %46 : i64
          %84 = llvm.mul %78, %15 : i64
          %85 = llvm.icmp "eq" %81, %7 : i64
          %86 = llvm.sub %81, %8 : i64
          %87 = llvm.udiv %86, %9 : i64
          %88 = llvm.add %87, %8 : i64
          %89 = llvm.select %85, %7, %88 : i1, i64
          %90 = llvm.alloca %1 x i64 {alignment = 8 : i64} : (i64) -> !llvm.ptr
          %91 = llvm.load %50 : !llvm.ptr -> i64
          %92 = llvm.or %91, %0 : i64
          llvm.store %92, %90 : i64, !llvm.ptr
          %93 = llvm.load %54 : !llvm.ptr -> i64
          %94 = llvm.getelementptr inbounds %90[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %93, %94 : i64, !llvm.ptr
          %95 = llvm.load %57 : !llvm.ptr -> i64
          %96 = llvm.getelementptr inbounds %90[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %95, %96 : i64, !llvm.ptr
          %97 = llvm.load %60 : !llvm.ptr -> i64
          %98 = llvm.getelementptr inbounds %90[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %97, %98 : i64, !llvm.ptr
          %99 = llvm.load %63 : !llvm.ptr -> i64
          %100 = llvm.getelementptr inbounds %90[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %99, %100 : i64, !llvm.ptr
          %101 = llvm.load %66 : !llvm.ptr -> i64
          %102 = llvm.getelementptr inbounds %90[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %101, %102 : i64, !llvm.ptr
          %103 = llvm.load %69 : !llvm.ptr -> i64
          %104 = llvm.getelementptr inbounds %90[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %103, %104 : i64, !llvm.ptr
          %105 = llvm.load %72 : !llvm.ptr -> i64
          %106 = llvm.getelementptr inbounds %90[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %105, %106 : i64, !llvm.ptr
          %107 = llvm.call @iree_uk_pack(%32, %83, %20, %8, %41, %7, %19, %9, %81, %16, %89, %16, %8, %9, %21, %22, %90) : (!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32
          %108 = llvm.alloca %1 x i64 {alignment = 8 : i64} : (i64) -> !llvm.ptr
          %109 = llvm.load %50 : !llvm.ptr -> i64
          %110 = llvm.or %109, %0 : i64
          llvm.store %110, %108 : i64, !llvm.ptr
          %111 = llvm.load %54 : !llvm.ptr -> i64
          %112 = llvm.getelementptr inbounds %108[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %111, %112 : i64, !llvm.ptr
          %113 = llvm.load %57 : !llvm.ptr -> i64
          %114 = llvm.getelementptr inbounds %108[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %113, %114 : i64, !llvm.ptr
          %115 = llvm.load %60 : !llvm.ptr -> i64
          %116 = llvm.getelementptr inbounds %108[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %115, %116 : i64, !llvm.ptr
          %117 = llvm.load %63 : !llvm.ptr -> i64
          %118 = llvm.getelementptr inbounds %108[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %117, %118 : i64, !llvm.ptr
          %119 = llvm.load %66 : !llvm.ptr -> i64
          %120 = llvm.getelementptr inbounds %108[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %119, %120 : i64, !llvm.ptr
          %121 = llvm.load %69 : !llvm.ptr -> i64
          %122 = llvm.getelementptr inbounds %108[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %121, %122 : i64, !llvm.ptr
          %123 = llvm.load %72 : !llvm.ptr -> i64
          %124 = llvm.getelementptr inbounds %108[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %123, %124 : i64, !llvm.ptr
          %125 = llvm.call @custom_mmt4d_6x16x8(%41, %7, %19, %42, %7, %20, %43, %84, %18, %89, %10, %12, %27, %28, %29, %77, %108) : (!llvm.ptr, i64, i64, !llvm.ptr, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i32, i32, i32, i32, !llvm.ptr) -> i32
          %126 = llvm.add %78, %13 : i64
          llvm.br ^bb4(%126 : i64)
        ^bb6:  // pred: ^bb4
          %127 = llvm.add %46, %16 : i64
          llvm.br ^bb2(%127 : i64)
        ^bb7:  // pred: ^bb2
          %128 = llvm.getelementptr inbounds %arg0[4] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %129 = llvm.alloca %1 x i64 {alignment = 8 : i64} : (i64) -> !llvm.ptr
          %130 = llvm.load %128 : !llvm.ptr -> i64
          %131 = llvm.or %130, %0 : i64
          llvm.store %131, %129 : i64, !llvm.ptr
          %132 = llvm.getelementptr inbounds %128[1] : (!llvm.ptr) -> !llvm.ptr, i64
          %133 = llvm.load %132 : !llvm.ptr -> i64
          %134 = llvm.getelementptr inbounds %129[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %133, %134 : i64, !llvm.ptr
          %135 = llvm.getelementptr inbounds %128[2] : (!llvm.ptr) -> !llvm.ptr, i64
          %136 = llvm.load %135 : !llvm.ptr -> i64
          %137 = llvm.getelementptr inbounds %129[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %136, %137 : i64, !llvm.ptr
          %138 = llvm.getelementptr inbounds %128[3] : (!llvm.ptr) -> !llvm.ptr, i64
          %139 = llvm.load %138 : !llvm.ptr -> i64
          %140 = llvm.getelementptr inbounds %129[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %139, %140 : i64, !llvm.ptr
          %141 = llvm.getelementptr inbounds %128[4] : (!llvm.ptr) -> !llvm.ptr, i64
          %142 = llvm.load %141 : !llvm.ptr -> i64
          %143 = llvm.getelementptr inbounds %129[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %142, %143 : i64, !llvm.ptr
          %144 = llvm.getelementptr inbounds %128[5] : (!llvm.ptr) -> !llvm.ptr, i64
          %145 = llvm.load %144 : !llvm.ptr -> i64
          %146 = llvm.getelementptr inbounds %129[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %145, %146 : i64, !llvm.ptr
          %147 = llvm.getelementptr inbounds %128[6] : (!llvm.ptr) -> !llvm.ptr, i64
          %148 = llvm.load %147 : !llvm.ptr -> i64
          %149 = llvm.getelementptr inbounds %129[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %148, %149 : i64, !llvm.ptr
          %150 = llvm.getelementptr inbounds %128[7] : (!llvm.ptr) -> !llvm.ptr, i64
          %151 = llvm.load %150 : !llvm.ptr -> i64
          %152 = llvm.getelementptr inbounds %129[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %151, %152 : i64, !llvm.ptr
          %153 = llvm.call @iree_uk_unpack(%43, %7, %18, %14, %40, %44, %20, %8, %17, %10, %9, %11, %20, %15, %24, %129) : (!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32
          %154 = llvm.add %44, %15 : i64
          llvm.br ^bb1(%154 : i64)
        ^bb8:  // pred: ^bb1
          llvm.return %25 : i32
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
