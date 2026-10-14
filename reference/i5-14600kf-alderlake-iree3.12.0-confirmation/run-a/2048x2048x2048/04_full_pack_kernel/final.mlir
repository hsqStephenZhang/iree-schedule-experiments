module attributes {stream.affinity.default = #hal.device.affinity<@__device_0>} {
  util.global private @__device_0 = #hal.device.target<"local", [#hal.executable.target<"llvm-cpu", "embedded-elf-x86_64", {cpu = "alderlake", cpu_features = "+adx,+aes,+avx,+avx2,+avxvnni,+bmi,+bmi2,+clflushopt,+clwb,+cmov,+crc32,+cx16,+cx8,+f16c,+fma,+fsgsbase,+fxsr,+gfni,+hreset,+invpcid,+kl,+lzcnt,+mmx,+movbe,+movdir64b,+movdiri,+pclmul,+pconfig,+pku,+popcnt,+prfchw,+ptwrite,+rdpid,+rdrnd,+rdseed,+sahf,+serialize,+sgx,+sha,+shstk,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+vaes,+vpclmulqdq,+waitpkg,+widekl,+x87,+xsave,+xsavec,+xsaveopt,+xsaves", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 32 : i64, target_triple = "x86_64-unknown-unknown-eabi-elf", ukernels = "all"}>]> : !hal.device
  hal.executable private @gemm_dispatch_0 {
    hal.executable.variant public @embedded_elf_x86_64 target(<"llvm-cpu", "embedded-elf-x86_64", {cpu = "alderlake", cpu_features = "+adx,+aes,+avx,+avx2,+avxvnni,+bmi,+bmi2,+clflushopt,+clwb,+cmov,+crc32,+cx16,+cx8,+f16c,+fma,+fsgsbase,+fxsr,+gfni,+hreset,+invpcid,+kl,+lzcnt,+mmx,+movbe,+movdir64b,+movdiri,+pclmul,+pconfig,+pku,+popcnt,+prfchw,+ptwrite,+rdpid,+rdrnd,+rdseed,+sahf,+serialize,+sgx,+sha,+shstk,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+vaes,+vpclmulqdq,+waitpkg,+widekl,+x87,+xsave,+xsavec,+xsaveopt,+xsaves", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 32 : i64, target_triple = "x86_64-unknown-unknown-eabi-elf", ukernels = "all"}>) {
      hal.executable.export public @gemm_dispatch_0_matmul_2048x2048x2048_f32 ordinal(0) layout(#hal.pipeline.layout<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) count(%arg0: !hal.device) -> (index, index, index) {
        %c21888 = arith.constant 21888 : index
        %c1 = arith.constant 1 : index
        hal.return %c21888, %c1, %c1 : index, index, index
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
          %4 = llvm.mlir.constant(0 : i32) : i32
          %5 = llvm.mlir.constant(1 : i32) : i32
          %6 = llvm.mlir.constant(32768 : i64) : i64
          %7 = llvm.mlir.constant(12288 : i64) : i64
          %8 = llvm.mlir.constant(2048 : i64) : i64
          %9 = llvm.mlir.constant(256 : i64) : i64
          %10 = llvm.mlir.constant(192 : i64) : i64
          %11 = llvm.mlir.constant(96 : i64) : i64
          %12 = llvm.mlir.constant(64 : i64) : i64
          %13 = llvm.mlir.constant(32 : i64) : i64
          %14 = llvm.mlir.constant(16 : i64) : i64
          %15 = llvm.mlir.constant(6 : i64) : i64
          %16 = llvm.mlir.constant(2 : i64) : i64
          %17 = llvm.mlir.constant(1 : i64) : i64
          %18 = llvm.mlir.constant(0 : i64) : i64
          %19 = llvm.mlir.constant(65536 : i64) : i64
          %20 = llvm.mlir.constant(true) : i1
          %21 = llvm.alloca %5 x !llvm.array<8 x i64> {alignment = 8 : i64} : (i32) -> !llvm.ptr
          %22 = llvm.alloca %5 x !llvm.array<8 x i64> {alignment = 8 : i64} : (i32) -> !llvm.ptr
          %23 = llvm.load %arg2 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)>
          %24 = llvm.extractvalue %23[0] : !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)>
          %25 = llvm.zext %24 : i32 to i64
          %26 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %27 = llvm.extractvalue %26[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %28 = llvm.load %27 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %20 ["align"(%28, %12 : !llvm.ptr, i64)] : i1
          %29 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %30 = llvm.extractvalue %29[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %31 = llvm.load %30 : !llvm.ptr -> !llvm.ptr
          %32 = llvm.getelementptr %31[16809984] : (!llvm.ptr) -> !llvm.ptr, i8
          llvm.intr.assume %20 ["align"(%32, %12 : !llvm.ptr, i64)] : i1
          %33 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %34 = llvm.extractvalue %33[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %35 = llvm.getelementptr %34[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %36 = llvm.load %35 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %20 ["align"(%36, %12 : !llvm.ptr, i64)] : i1
          %37 = llvm.alloca %5 x !llvm.array<192 x f32> {alignment = 64 : i64} : (i32) -> !llvm.ptr
          %38 = llvm.udiv %25, %12 : i64
          %39 = llvm.urem %25, %12 : i64
          %40 = llvm.mul %38, %15 : i64
          %41 = llvm.mul %39, %13 : i64
          %42 = llvm.mul %38, %7 : i64
          %43 = llvm.mul %39, %19 : i64
          %44 = llvm.getelementptr inbounds %arg0[4] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          llvm.store %0, %21 : i64, !llvm.ptr
          %45 = llvm.getelementptr inbounds %44[1] : (!llvm.ptr) -> !llvm.ptr, i64
          %46 = llvm.load %45 : !llvm.ptr -> i64
          %47 = llvm.getelementptr inbounds %21[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %46, %47 : i64, !llvm.ptr
          %48 = llvm.getelementptr inbounds %44[2] : (!llvm.ptr) -> !llvm.ptr, i64
          %49 = llvm.load %48 : !llvm.ptr -> i64
          %50 = llvm.getelementptr inbounds %21[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %49, %50 : i64, !llvm.ptr
          %51 = llvm.getelementptr inbounds %44[3] : (!llvm.ptr) -> !llvm.ptr, i64
          %52 = llvm.load %51 : !llvm.ptr -> i64
          %53 = llvm.getelementptr inbounds %21[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %52, %53 : i64, !llvm.ptr
          %54 = llvm.getelementptr inbounds %44[4] : (!llvm.ptr) -> !llvm.ptr, i64
          %55 = llvm.load %54 : !llvm.ptr -> i64
          %56 = llvm.getelementptr inbounds %21[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %55, %56 : i64, !llvm.ptr
          %57 = llvm.getelementptr inbounds %44[5] : (!llvm.ptr) -> !llvm.ptr, i64
          %58 = llvm.load %57 : !llvm.ptr -> i64
          %59 = llvm.getelementptr inbounds %21[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %58, %59 : i64, !llvm.ptr
          %60 = llvm.getelementptr inbounds %44[6] : (!llvm.ptr) -> !llvm.ptr, i64
          %61 = llvm.load %60 : !llvm.ptr -> i64
          %62 = llvm.getelementptr inbounds %21[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %61, %62 : i64, !llvm.ptr
          %63 = llvm.getelementptr inbounds %44[7] : (!llvm.ptr) -> !llvm.ptr, i64
          %64 = llvm.load %63 : !llvm.ptr -> i64
          %65 = llvm.getelementptr inbounds %21[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %64, %65 : i64, !llvm.ptr
          %66 = llvm.call @custom_mmt4d_6x16x8(%28, %42, %7, %32, %43, %6, %37, %18, %10, %17, %16, %9, %3, %2, %1, %4, %21) : (!llvm.ptr, i64, i64, !llvm.ptr, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i32, i32, i32, i32, !llvm.ptr) -> i32
          %67 = llvm.sub %8, %40 : i64
          %68 = llvm.intr.umin(%67, %15) : (i64, i64) -> i64
          %69 = llvm.add %42, %41 : i64
          llvm.store %0, %22 : i64, !llvm.ptr
          %70 = llvm.load %45 : !llvm.ptr -> i64
          %71 = llvm.getelementptr inbounds %22[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %70, %71 : i64, !llvm.ptr
          %72 = llvm.load %48 : !llvm.ptr -> i64
          %73 = llvm.getelementptr inbounds %22[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %72, %73 : i64, !llvm.ptr
          %74 = llvm.load %51 : !llvm.ptr -> i64
          %75 = llvm.getelementptr inbounds %22[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %74, %75 : i64, !llvm.ptr
          %76 = llvm.load %54 : !llvm.ptr -> i64
          %77 = llvm.getelementptr inbounds %22[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %76, %77 : i64, !llvm.ptr
          %78 = llvm.load %57 : !llvm.ptr -> i64
          %79 = llvm.getelementptr inbounds %22[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %78, %79 : i64, !llvm.ptr
          %80 = llvm.load %60 : !llvm.ptr -> i64
          %81 = llvm.getelementptr inbounds %22[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %80, %81 : i64, !llvm.ptr
          %82 = llvm.load %63 : !llvm.ptr -> i64
          %83 = llvm.getelementptr inbounds %22[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %82, %83 : i64, !llvm.ptr
          %84 = llvm.call @iree_uk_unpack(%37, %18, %10, %11, %36, %69, %8, %17, %17, %16, %15, %14, %68, %13, %5, %22) : (!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32
          llvm.return %4 : i32
        }
      }
    }
  }
  hal.executable private @_encoding_0 {
    hal.executable.variant public @embedded_elf_x86_64 target(<"llvm-cpu", "embedded-elf-x86_64", {cpu = "alderlake", cpu_features = "+adx,+aes,+avx,+avx2,+avxvnni,+bmi,+bmi2,+clflushopt,+clwb,+cmov,+crc32,+cx16,+cx8,+f16c,+fma,+fsgsbase,+fxsr,+gfni,+hreset,+invpcid,+kl,+lzcnt,+mmx,+movbe,+movdir64b,+movdiri,+pclmul,+pconfig,+pku,+popcnt,+prfchw,+ptwrite,+rdpid,+rdrnd,+rdseed,+sahf,+serialize,+sgx,+sha,+shstk,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+vaes,+vpclmulqdq,+waitpkg,+widekl,+x87,+xsave,+xsavec,+xsaveopt,+xsaves", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 32 : i64, target_triple = "x86_64-unknown-unknown-eabi-elf", ukernels = "all"}>) {
      hal.executable.export public @_encoding_0_encode_2048x2048xf32_to_2048x2048xf32 ordinal(0) layout(#hal.pipeline.layout<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) count(%arg0: !hal.device) -> (index, index, index) {
        %c1120 = arith.constant 1120 : index
        %c1 = arith.constant 1 : index
        hal.return %c1120, %c1, %c1 : index, index, index
      } attributes {workgroup_size = [1 : index, 1 : index, 1 : index]}
      builtin.module attributes {llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-unknown-eabi-elf"} {
        llvm.func @iree_uk_pack(!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
        llvm.func @iree_uk_unpack(!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
        llvm.func @custom_mmt4d_6x16x8(!llvm.ptr, i64, i64, !llvm.ptr, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i32, i32, i32, i32, !llvm.ptr) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
        llvm.func @_encoding_0_encode_2048x2048xf32_to_2048x2048xf32(%arg0: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg1: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg2: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}) -> i32 {
          %0 = llvm.mlir.constant(52239 : i64) : i64
          %1 = llvm.mlir.constant(257 : i32) : i32
          %2 = llvm.mlir.constant(12288 : i64) : i64
          %3 = llvm.mlir.constant(2048 : i64) : i64
          %4 = llvm.mlir.constant(64 : i64) : i64
          %5 = llvm.mlir.constant(60 : i64) : i64
          %6 = llvm.mlir.constant(32 : i64) : i64
          %7 = llvm.mlir.constant(6 : i64) : i64
          %8 = llvm.mlir.constant(1 : i64) : i64
          %9 = llvm.mlir.constant(0 : i64) : i64
          %10 = llvm.mlir.constant(122880 : i64) : i64
          %11 = llvm.mlir.constant(384 : i64) : i64
          %12 = llvm.mlir.constant(true) : i1
          %13 = llvm.mlir.constant(0 : i32) : i32
          %14 = llvm.mlir.constant(1 : i32) : i32
          %15 = llvm.alloca %14 x !llvm.array<8 x i64> {alignment = 8 : i64} : (i32) -> !llvm.ptr
          %16 = llvm.load %arg2 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)>
          %17 = llvm.extractvalue %16[0] : !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)>
          %18 = llvm.zext %17 : i32 to i64
          %19 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %20 = llvm.extractvalue %19[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %21 = llvm.load %20 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %12 ["align"(%21, %4 : !llvm.ptr, i64)] : i1
          %22 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %23 = llvm.extractvalue %22[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %24 = llvm.getelementptr %23[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %25 = llvm.load %24 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %12 ["align"(%25, %4 : !llvm.ptr, i64)] : i1
          %26 = llvm.udiv %18, %6 : i64
          %27 = llvm.urem %18, %6 : i64
          %28 = llvm.mul %26, %5 : i64
          %29 = llvm.mul %27, %4 : i64
          %30 = llvm.sub %3, %28 : i64
          %31 = llvm.intr.umin(%30, %5) : (i64, i64) -> i64
          %32 = llvm.icmp "eq" %31, %9 : i64
          %33 = llvm.sub %31, %8 : i64
          %34 = llvm.udiv %33, %7 : i64
          %35 = llvm.add %34, %8 : i64
          %36 = llvm.select %32, %9, %35 : i1, i64
          %37 = llvm.mul %26, %10 : i64
          %38 = llvm.add %37, %29 : i64
          %39 = llvm.mul %27, %11 : i64
          %40 = llvm.add %37, %39 : i64
          %41 = llvm.getelementptr inbounds %arg0[4] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          llvm.store %0, %15 : i64, !llvm.ptr
          %42 = llvm.getelementptr inbounds %41[1] : (!llvm.ptr) -> !llvm.ptr, i64
          %43 = llvm.load %42 : !llvm.ptr -> i64
          %44 = llvm.getelementptr inbounds %15[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %43, %44 : i64, !llvm.ptr
          %45 = llvm.getelementptr inbounds %41[2] : (!llvm.ptr) -> !llvm.ptr, i64
          %46 = llvm.load %45 : !llvm.ptr -> i64
          %47 = llvm.getelementptr inbounds %15[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %46, %47 : i64, !llvm.ptr
          %48 = llvm.getelementptr inbounds %41[3] : (!llvm.ptr) -> !llvm.ptr, i64
          %49 = llvm.load %48 : !llvm.ptr -> i64
          %50 = llvm.getelementptr inbounds %15[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %49, %50 : i64, !llvm.ptr
          %51 = llvm.getelementptr inbounds %41[4] : (!llvm.ptr) -> !llvm.ptr, i64
          %52 = llvm.load %51 : !llvm.ptr -> i64
          %53 = llvm.getelementptr inbounds %15[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %52, %53 : i64, !llvm.ptr
          %54 = llvm.getelementptr inbounds %41[5] : (!llvm.ptr) -> !llvm.ptr, i64
          %55 = llvm.load %54 : !llvm.ptr -> i64
          %56 = llvm.getelementptr inbounds %15[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %55, %56 : i64, !llvm.ptr
          %57 = llvm.getelementptr inbounds %41[6] : (!llvm.ptr) -> !llvm.ptr, i64
          %58 = llvm.load %57 : !llvm.ptr -> i64
          %59 = llvm.getelementptr inbounds %15[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %58, %59 : i64, !llvm.ptr
          %60 = llvm.getelementptr inbounds %41[7] : (!llvm.ptr) -> !llvm.ptr, i64
          %61 = llvm.load %60 : !llvm.ptr -> i64
          %62 = llvm.getelementptr inbounds %15[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %61, %62 : i64, !llvm.ptr
          %63 = llvm.call @iree_uk_pack(%21, %38, %3, %8, %25, %40, %2, %7, %31, %4, %36, %4, %8, %7, %9, %1, %15) : (!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32
          llvm.return %13 : i32
        }
      }
    }
  }
  hal.executable private @_encoding_1 {
    hal.executable.variant public @embedded_elf_x86_64 target(<"llvm-cpu", "embedded-elf-x86_64", {cpu = "alderlake", cpu_features = "+adx,+aes,+avx,+avx2,+avxvnni,+bmi,+bmi2,+clflushopt,+clwb,+cmov,+crc32,+cx16,+cx8,+f16c,+fma,+fsgsbase,+fxsr,+gfni,+hreset,+invpcid,+kl,+lzcnt,+mmx,+movbe,+movdir64b,+movdiri,+pclmul,+pconfig,+pku,+popcnt,+prfchw,+ptwrite,+rdpid,+rdrnd,+rdseed,+sahf,+serialize,+sgx,+sha,+shstk,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+vaes,+vpclmulqdq,+waitpkg,+widekl,+x87,+xsave,+xsavec,+xsaveopt,+xsaves", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 32 : i64, target_triple = "x86_64-unknown-unknown-eabi-elf", ukernels = "all"}>) {
      hal.executable.export public @_encoding_1_encode_2048x2048xf32_to_2048x2048xf32 ordinal(0) layout(#hal.pipeline.layout<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) count(%arg0: !hal.device) -> (index, index, index) {
        %c1024 = arith.constant 1024 : index
        %c1 = arith.constant 1 : index
        hal.return %c1024, %c1, %c1 : index, index, index
      } attributes {workgroup_size = [1 : index, 1 : index, 1 : index]}
      builtin.module attributes {llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-unknown-eabi-elf"} {
        llvm.func @iree_uk_pack(!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
        llvm.func @iree_uk_unpack(!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
        llvm.func @custom_mmt4d_6x16x8(!llvm.ptr, i64, i64, !llvm.ptr, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i32, i32, i32, i32, !llvm.ptr) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
        llvm.func @_encoding_1_encode_2048x2048xf32_to_2048x2048xf32(%arg0: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg1: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg2: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}) -> i32 {
          %0 = llvm.mlir.constant(52239 : i64) : i64
          %1 = llvm.mlir.constant(513 : i32) : i32
          %2 = llvm.mlir.constant(32768 : i64) : i64
          %3 = llvm.mlir.constant(2048 : i64) : i64
          %4 = llvm.mlir.constant(64 : i64) : i64
          %5 = llvm.mlir.constant(32 : i64) : i64
          %6 = llvm.mlir.constant(16 : i64) : i64
          %7 = llvm.mlir.constant(4 : i64) : i64
          %8 = llvm.mlir.constant(1 : i64) : i64
          %9 = llvm.mlir.constant(0 : i64) : i64
          %10 = llvm.mlir.constant(131072 : i64) : i64
          %11 = llvm.mlir.constant(1024 : i64) : i64
          %12 = llvm.mlir.constant(true) : i1
          %13 = llvm.mlir.constant(0 : i32) : i32
          %14 = llvm.mlir.constant(1 : i32) : i32
          %15 = llvm.alloca %14 x !llvm.array<8 x i64> {alignment = 8 : i64} : (i32) -> !llvm.ptr
          %16 = llvm.load %arg2 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)>
          %17 = llvm.extractvalue %16[0] : !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)>
          %18 = llvm.zext %17 : i32 to i64
          %19 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %20 = llvm.extractvalue %19[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %21 = llvm.load %20 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %12 ["align"(%21, %4 : !llvm.ptr, i64)] : i1
          %22 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %23 = llvm.extractvalue %22[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %24 = llvm.getelementptr %23[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %25 = llvm.load %24 : !llvm.ptr -> !llvm.ptr
          %26 = llvm.getelementptr %25[16809984] : (!llvm.ptr) -> !llvm.ptr, i8
          llvm.intr.assume %12 ["align"(%26, %4 : !llvm.ptr, i64)] : i1
          %27 = llvm.udiv %18, %5 : i64
          %28 = llvm.urem %18, %5 : i64
          %29 = llvm.mul %27, %4 : i64
          %30 = llvm.mul %28, %10 : i64
          %31 = llvm.add %30, %29 : i64
          %32 = llvm.mul %27, %10 : i64
          %33 = llvm.mul %28, %11 : i64
          %34 = llvm.add %32, %33 : i64
          %35 = llvm.getelementptr inbounds %arg0[4] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          llvm.store %0, %15 : i64, !llvm.ptr
          %36 = llvm.getelementptr inbounds %35[1] : (!llvm.ptr) -> !llvm.ptr, i64
          %37 = llvm.load %36 : !llvm.ptr -> i64
          %38 = llvm.getelementptr inbounds %15[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %37, %38 : i64, !llvm.ptr
          %39 = llvm.getelementptr inbounds %35[2] : (!llvm.ptr) -> !llvm.ptr, i64
          %40 = llvm.load %39 : !llvm.ptr -> i64
          %41 = llvm.getelementptr inbounds %15[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %40, %41 : i64, !llvm.ptr
          %42 = llvm.getelementptr inbounds %35[3] : (!llvm.ptr) -> !llvm.ptr, i64
          %43 = llvm.load %42 : !llvm.ptr -> i64
          %44 = llvm.getelementptr inbounds %15[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %43, %44 : i64, !llvm.ptr
          %45 = llvm.getelementptr inbounds %35[4] : (!llvm.ptr) -> !llvm.ptr, i64
          %46 = llvm.load %45 : !llvm.ptr -> i64
          %47 = llvm.getelementptr inbounds %15[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %46, %47 : i64, !llvm.ptr
          %48 = llvm.getelementptr inbounds %35[5] : (!llvm.ptr) -> !llvm.ptr, i64
          %49 = llvm.load %48 : !llvm.ptr -> i64
          %50 = llvm.getelementptr inbounds %15[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %49, %50 : i64, !llvm.ptr
          %51 = llvm.getelementptr inbounds %35[6] : (!llvm.ptr) -> !llvm.ptr, i64
          %52 = llvm.load %51 : !llvm.ptr -> i64
          %53 = llvm.getelementptr inbounds %15[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %52, %53 : i64, !llvm.ptr
          %54 = llvm.getelementptr inbounds %35[7] : (!llvm.ptr) -> !llvm.ptr, i64
          %55 = llvm.load %54 : !llvm.ptr -> i64
          %56 = llvm.getelementptr inbounds %15[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %55, %56 : i64, !llvm.ptr
          %57 = llvm.call @iree_uk_pack(%21, %31, %3, %8, %26, %34, %2, %6, %4, %4, %7, %4, %8, %6, %9, %1, %15) : (!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32
          llvm.return %13 : i32
        }
      }
    }
  }
  util.func public @gemm(%arg0: !hal.buffer_view, %arg1: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @gemm(%input0: tensor<2048x2048xf32>, %input1: tensor<2048x2048xf32>) -> (%output0: tensor<2048x2048xf32>)"}} {
    %c33587200 = arith.constant 33587200 : index
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
    %result_0, %result_timepoint_1 = stream.resource.alloca uninitialized on(#hal.device.affinity<@__device_0>) : !stream.resource<transient>{%c33587200} => !stream.timepoint
    %2 = stream.timepoint.join max(%result_timepoint, %result_timepoint_1) => !stream.timepoint
    %3 = stream.cmd.execute on(#hal.device.affinity<@__device_0>) await(%2) => with(%0 as %arg2: !stream.resource<external>{%c16777216}, %1 as %arg3: !stream.resource<external>{%c16777216}, %result as %arg4: !stream.resource<external>{%c16777216}, %result_0 as %arg5: !stream.resource<transient>{%c33587200}) {
      stream.cmd.concurrent {
        stream.cmd.dispatch @_encoding_0::@embedded_elf_x86_64::@_encoding_0_encode_2048x2048xf32_to_2048x2048xf32 {
          ro %arg2[%c0 for %c16777216] : !stream.resource<external>{%c16777216},
          wo %arg5[%c0 for %c33587200] : !stream.resource<transient>{%c33587200}
        }
        stream.cmd.dispatch @_encoding_1::@embedded_elf_x86_64::@_encoding_1_encode_2048x2048xf32_to_2048x2048xf32 {
          ro %arg3[%c0 for %c16777216] : !stream.resource<external>{%c16777216},
          wo %arg5[%c0 for %c33587200] : !stream.resource<transient>{%c33587200}
        }
      }
      stream.cmd.dispatch @gemm_dispatch_0::@embedded_elf_x86_64::@gemm_dispatch_0_matmul_2048x2048x2048_f32 {
        ro %arg5[%c0 for %c33587200] : !stream.resource<transient>{%c33587200},
        wo %arg4[%c0 for %c16777216] : !stream.resource<external>{%c16777216}
      }
    } => !stream.timepoint
    %4 = stream.resource.dealloca on(#hal.device.affinity<@__device_0>) await(%3) => %result_0 : !stream.resource<transient>{%c33587200} => !stream.timepoint
    %5 = stream.timepoint.await %4 => %result : !stream.resource<external>{%c16777216}
    %6 = stream.tensor.export on(#hal.device.affinity<@__device_0>) %5 : tensor<2048x2048xf32> in !stream.resource<external>{%c16777216} -> !hal.buffer_view
    util.return %6 : !hal.buffer_view
  }
}
