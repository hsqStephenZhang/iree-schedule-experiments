module attributes {stream.affinity.default = #hal.device.affinity<@__device_0>} {
  util.global private @__device_0 = #hal.device.target<"local", [#hal.executable.target<"llvm-cpu", "embedded-elf-x86_64", {cpu = "alderlake", cpu_features = "+adx,+aes,+avx,+avx2,+avxvnni,+bmi,+bmi2,+clflushopt,+clwb,+cmov,+crc32,+cx16,+cx8,+f16c,+fma,+fsgsbase,+fxsr,+gfni,+hreset,+invpcid,+kl,+lzcnt,+mmx,+movbe,+movdir64b,+movdiri,+pclmul,+pconfig,+pku,+popcnt,+prfchw,+ptwrite,+rdpid,+rdrnd,+rdseed,+sahf,+serialize,+sgx,+sha,+shstk,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+vaes,+vpclmulqdq,+waitpkg,+widekl,+x87,+xsave,+xsavec,+xsaveopt,+xsaves", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 32 : i64, target_triple = "x86_64-unknown-unknown-eabi-elf", ukernels = "all"}>]> : !hal.device
  hal.executable private @gemm_dispatch_0 {
    hal.executable.variant public @embedded_elf_x86_64 target(<"llvm-cpu", "embedded-elf-x86_64", {cpu = "alderlake", cpu_features = "+adx,+aes,+avx,+avx2,+avxvnni,+bmi,+bmi2,+clflushopt,+clwb,+cmov,+crc32,+cx16,+cx8,+f16c,+fma,+fsgsbase,+fxsr,+gfni,+hreset,+invpcid,+kl,+lzcnt,+mmx,+movbe,+movdir64b,+movdiri,+pclmul,+pconfig,+pku,+popcnt,+prfchw,+ptwrite,+rdpid,+rdrnd,+rdseed,+sahf,+serialize,+sgx,+sha,+shstk,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+vaes,+vpclmulqdq,+waitpkg,+widekl,+x87,+xsave,+xsavec,+xsaveopt,+xsaves", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 32 : i64, target_triple = "x86_64-unknown-unknown-eabi-elf", ukernels = "all"}>) {
      hal.executable.export public @gemm_dispatch_0_matmul_4096x4096x4096_f32 ordinal(0) layout(#hal.pipeline.layout<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) count(%arg0: !hal.device) -> (index, index, index) {
        %c87424 = arith.constant 87424 : index
        %c1 = arith.constant 1 : index
        hal.return %c87424, %c1, %c1 : index, index, index
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
          %4 = llvm.mlir.constant(0 : i32) : i32
          %5 = llvm.mlir.constant(1 : i32) : i32
          %6 = llvm.mlir.constant(65536 : i64) : i64
          %7 = llvm.mlir.constant(24576 : i64) : i64
          %8 = llvm.mlir.constant(4096 : i64) : i64
          %9 = llvm.mlir.constant(512 : i64) : i64
          %10 = llvm.mlir.constant(192 : i64) : i64
          %11 = llvm.mlir.constant(128 : i64) : i64
          %12 = llvm.mlir.constant(96 : i64) : i64
          %13 = llvm.mlir.constant(32 : i64) : i64
          %14 = llvm.mlir.constant(16 : i64) : i64
          %15 = llvm.mlir.constant(6 : i64) : i64
          %16 = llvm.mlir.constant(2 : i64) : i64
          %17 = llvm.mlir.constant(1 : i64) : i64
          %18 = llvm.mlir.constant(0 : i64) : i64
          %19 = llvm.mlir.constant(131072 : i64) : i64
          %20 = llvm.mlir.constant(true) : i1
          %21 = llvm.mlir.constant(64 : i64) : i64
          %22 = llvm.alloca %5 x !llvm.array<8 x i64> {alignment = 8 : i64} : (i32) -> !llvm.ptr
          %23 = llvm.alloca %5 x !llvm.array<8 x i64> {alignment = 8 : i64} : (i32) -> !llvm.ptr
          %24 = llvm.load %arg2 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)>
          %25 = llvm.extractvalue %24[0] : !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)>
          %26 = llvm.zext %25 : i32 to i64
          %27 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %28 = llvm.extractvalue %27[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %29 = llvm.load %28 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %20 ["align"(%29, %21 : !llvm.ptr, i64)] : i1
          %30 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %31 = llvm.extractvalue %30[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %32 = llvm.load %31 : !llvm.ptr -> !llvm.ptr
          %33 = llvm.getelementptr %32[67141632] : (!llvm.ptr) -> !llvm.ptr, i8
          llvm.intr.assume %20 ["align"(%33, %21 : !llvm.ptr, i64)] : i1
          %34 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %35 = llvm.extractvalue %34[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %36 = llvm.getelementptr %35[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %37 = llvm.load %36 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %20 ["align"(%37, %21 : !llvm.ptr, i64)] : i1
          %38 = llvm.alloca %5 x !llvm.array<192 x f32> {alignment = 64 : i64} : (i32) -> !llvm.ptr
          %39 = llvm.udiv %26, %11 : i64
          %40 = llvm.urem %26, %11 : i64
          %41 = llvm.mul %39, %15 : i64
          %42 = llvm.mul %40, %13 : i64
          %43 = llvm.mul %39, %7 : i64
          %44 = llvm.mul %40, %19 : i64
          %45 = llvm.getelementptr inbounds %arg0[4] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          llvm.store %0, %22 : i64, !llvm.ptr
          %46 = llvm.getelementptr inbounds %45[1] : (!llvm.ptr) -> !llvm.ptr, i64
          %47 = llvm.load %46 : !llvm.ptr -> i64
          %48 = llvm.getelementptr inbounds %22[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %47, %48 : i64, !llvm.ptr
          %49 = llvm.getelementptr inbounds %45[2] : (!llvm.ptr) -> !llvm.ptr, i64
          %50 = llvm.load %49 : !llvm.ptr -> i64
          %51 = llvm.getelementptr inbounds %22[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %50, %51 : i64, !llvm.ptr
          %52 = llvm.getelementptr inbounds %45[3] : (!llvm.ptr) -> !llvm.ptr, i64
          %53 = llvm.load %52 : !llvm.ptr -> i64
          %54 = llvm.getelementptr inbounds %22[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %53, %54 : i64, !llvm.ptr
          %55 = llvm.getelementptr inbounds %45[4] : (!llvm.ptr) -> !llvm.ptr, i64
          %56 = llvm.load %55 : !llvm.ptr -> i64
          %57 = llvm.getelementptr inbounds %22[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %56, %57 : i64, !llvm.ptr
          %58 = llvm.getelementptr inbounds %45[5] : (!llvm.ptr) -> !llvm.ptr, i64
          %59 = llvm.load %58 : !llvm.ptr -> i64
          %60 = llvm.getelementptr inbounds %22[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %59, %60 : i64, !llvm.ptr
          %61 = llvm.getelementptr inbounds %45[6] : (!llvm.ptr) -> !llvm.ptr, i64
          %62 = llvm.load %61 : !llvm.ptr -> i64
          %63 = llvm.getelementptr inbounds %22[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %62, %63 : i64, !llvm.ptr
          %64 = llvm.getelementptr inbounds %45[7] : (!llvm.ptr) -> !llvm.ptr, i64
          %65 = llvm.load %64 : !llvm.ptr -> i64
          %66 = llvm.getelementptr inbounds %22[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %65, %66 : i64, !llvm.ptr
          %67 = llvm.call @custom_mmt4d_6x16x8(%29, %43, %7, %33, %44, %6, %38, %18, %10, %17, %16, %9, %3, %2, %1, %4, %22) : (!llvm.ptr, i64, i64, !llvm.ptr, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i32, i32, i32, i32, !llvm.ptr) -> i32
          %68 = llvm.sub %8, %41 : i64
          %69 = llvm.intr.umin(%68, %15) : (i64, i64) -> i64
          %70 = llvm.add %43, %42 : i64
          llvm.store %0, %23 : i64, !llvm.ptr
          %71 = llvm.load %46 : !llvm.ptr -> i64
          %72 = llvm.getelementptr inbounds %23[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %71, %72 : i64, !llvm.ptr
          %73 = llvm.load %49 : !llvm.ptr -> i64
          %74 = llvm.getelementptr inbounds %23[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %73, %74 : i64, !llvm.ptr
          %75 = llvm.load %52 : !llvm.ptr -> i64
          %76 = llvm.getelementptr inbounds %23[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %75, %76 : i64, !llvm.ptr
          %77 = llvm.load %55 : !llvm.ptr -> i64
          %78 = llvm.getelementptr inbounds %23[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %77, %78 : i64, !llvm.ptr
          %79 = llvm.load %58 : !llvm.ptr -> i64
          %80 = llvm.getelementptr inbounds %23[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %79, %80 : i64, !llvm.ptr
          %81 = llvm.load %61 : !llvm.ptr -> i64
          %82 = llvm.getelementptr inbounds %23[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %81, %82 : i64, !llvm.ptr
          %83 = llvm.load %64 : !llvm.ptr -> i64
          %84 = llvm.getelementptr inbounds %23[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %83, %84 : i64, !llvm.ptr
          %85 = llvm.call @iree_uk_unpack(%38, %18, %10, %12, %37, %70, %8, %17, %17, %16, %15, %14, %69, %13, %5, %23) : (!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32
          llvm.return %4 : i32
        }
      }
    }
  }
  hal.executable private @_encoding_0 {
    hal.executable.variant public @embedded_elf_x86_64 target(<"llvm-cpu", "embedded-elf-x86_64", {cpu = "alderlake", cpu_features = "+adx,+aes,+avx,+avx2,+avxvnni,+bmi,+bmi2,+clflushopt,+clwb,+cmov,+crc32,+cx16,+cx8,+f16c,+fma,+fsgsbase,+fxsr,+gfni,+hreset,+invpcid,+kl,+lzcnt,+mmx,+movbe,+movdir64b,+movdiri,+pclmul,+pconfig,+pku,+popcnt,+prfchw,+ptwrite,+rdpid,+rdrnd,+rdseed,+sahf,+serialize,+sgx,+sha,+shstk,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+vaes,+vpclmulqdq,+waitpkg,+widekl,+x87,+xsave,+xsavec,+xsaveopt,+xsaves", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 32 : i64, target_triple = "x86_64-unknown-unknown-eabi-elf", ukernels = "all"}>) {
      hal.executable.export public @_encoding_0_encode_4096x4096xf32_to_4096x4096xf32 ordinal(0) layout(#hal.pipeline.layout<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) count(%arg0: !hal.device) -> (index, index, index) {
        %c4416 = arith.constant 4416 : index
        %c1 = arith.constant 1 : index
        hal.return %c4416, %c1, %c1 : index, index, index
      } attributes {workgroup_size = [1 : index, 1 : index, 1 : index]}
      builtin.module attributes {llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-unknown-eabi-elf"} {
        llvm.func @iree_uk_pack(!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
        llvm.func @iree_uk_unpack(!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
        llvm.func @custom_mmt4d_6x16x8(!llvm.ptr, i64, i64, !llvm.ptr, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i32, i32, i32, i32, !llvm.ptr) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
        llvm.func @_encoding_0_encode_4096x4096xf32_to_4096x4096xf32(%arg0: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg1: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg2: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}) -> i32 {
          %0 = llvm.mlir.constant(52239 : i64) : i64
          %1 = llvm.mlir.constant(257 : i32) : i32
          %2 = llvm.mlir.constant(24576 : i64) : i64
          %3 = llvm.mlir.constant(4096 : i64) : i64
          %4 = llvm.mlir.constant(64 : i64) : i64
          %5 = llvm.mlir.constant(60 : i64) : i64
          %6 = llvm.mlir.constant(6 : i64) : i64
          %7 = llvm.mlir.constant(1 : i64) : i64
          %8 = llvm.mlir.constant(0 : i64) : i64
          %9 = llvm.mlir.constant(245760 : i64) : i64
          %10 = llvm.mlir.constant(384 : i64) : i64
          %11 = llvm.mlir.constant(true) : i1
          %12 = llvm.mlir.constant(0 : i32) : i32
          %13 = llvm.mlir.constant(1 : i32) : i32
          %14 = llvm.alloca %13 x !llvm.array<8 x i64> {alignment = 8 : i64} : (i32) -> !llvm.ptr
          %15 = llvm.load %arg2 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)>
          %16 = llvm.extractvalue %15[0] : !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)>
          %17 = llvm.zext %16 : i32 to i64
          %18 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %19 = llvm.extractvalue %18[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %20 = llvm.load %19 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %11 ["align"(%20, %4 : !llvm.ptr, i64)] : i1
          %21 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %22 = llvm.extractvalue %21[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %23 = llvm.getelementptr %22[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %24 = llvm.load %23 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %11 ["align"(%24, %4 : !llvm.ptr, i64)] : i1
          %25 = llvm.udiv %17, %4 : i64
          %26 = llvm.urem %17, %4 : i64
          %27 = llvm.mul %25, %5 : i64
          %28 = llvm.mul %26, %4 : i64
          %29 = llvm.sub %3, %27 : i64
          %30 = llvm.intr.umin(%29, %5) : (i64, i64) -> i64
          %31 = llvm.icmp "eq" %30, %8 : i64
          %32 = llvm.sub %30, %7 : i64
          %33 = llvm.udiv %32, %6 : i64
          %34 = llvm.add %33, %7 : i64
          %35 = llvm.select %31, %8, %34 : i1, i64
          %36 = llvm.mul %25, %9 : i64
          %37 = llvm.add %36, %28 : i64
          %38 = llvm.mul %26, %10 : i64
          %39 = llvm.add %36, %38 : i64
          %40 = llvm.getelementptr inbounds %arg0[4] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          llvm.store %0, %14 : i64, !llvm.ptr
          %41 = llvm.getelementptr inbounds %40[1] : (!llvm.ptr) -> !llvm.ptr, i64
          %42 = llvm.load %41 : !llvm.ptr -> i64
          %43 = llvm.getelementptr inbounds %14[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %42, %43 : i64, !llvm.ptr
          %44 = llvm.getelementptr inbounds %40[2] : (!llvm.ptr) -> !llvm.ptr, i64
          %45 = llvm.load %44 : !llvm.ptr -> i64
          %46 = llvm.getelementptr inbounds %14[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %45, %46 : i64, !llvm.ptr
          %47 = llvm.getelementptr inbounds %40[3] : (!llvm.ptr) -> !llvm.ptr, i64
          %48 = llvm.load %47 : !llvm.ptr -> i64
          %49 = llvm.getelementptr inbounds %14[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %48, %49 : i64, !llvm.ptr
          %50 = llvm.getelementptr inbounds %40[4] : (!llvm.ptr) -> !llvm.ptr, i64
          %51 = llvm.load %50 : !llvm.ptr -> i64
          %52 = llvm.getelementptr inbounds %14[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %51, %52 : i64, !llvm.ptr
          %53 = llvm.getelementptr inbounds %40[5] : (!llvm.ptr) -> !llvm.ptr, i64
          %54 = llvm.load %53 : !llvm.ptr -> i64
          %55 = llvm.getelementptr inbounds %14[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %54, %55 : i64, !llvm.ptr
          %56 = llvm.getelementptr inbounds %40[6] : (!llvm.ptr) -> !llvm.ptr, i64
          %57 = llvm.load %56 : !llvm.ptr -> i64
          %58 = llvm.getelementptr inbounds %14[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %57, %58 : i64, !llvm.ptr
          %59 = llvm.getelementptr inbounds %40[7] : (!llvm.ptr) -> !llvm.ptr, i64
          %60 = llvm.load %59 : !llvm.ptr -> i64
          %61 = llvm.getelementptr inbounds %14[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %60, %61 : i64, !llvm.ptr
          %62 = llvm.call @iree_uk_pack(%20, %37, %3, %7, %24, %39, %2, %6, %30, %4, %35, %4, %7, %6, %8, %1, %14) : (!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32
          llvm.return %12 : i32
        }
      }
    }
  }
  hal.executable private @_encoding_1 {
    hal.executable.variant public @embedded_elf_x86_64 target(<"llvm-cpu", "embedded-elf-x86_64", {cpu = "alderlake", cpu_features = "+adx,+aes,+avx,+avx2,+avxvnni,+bmi,+bmi2,+clflushopt,+clwb,+cmov,+crc32,+cx16,+cx8,+f16c,+fma,+fsgsbase,+fxsr,+gfni,+hreset,+invpcid,+kl,+lzcnt,+mmx,+movbe,+movdir64b,+movdiri,+pclmul,+pconfig,+pku,+popcnt,+prfchw,+ptwrite,+rdpid,+rdrnd,+rdseed,+sahf,+serialize,+sgx,+sha,+shstk,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+vaes,+vpclmulqdq,+waitpkg,+widekl,+x87,+xsave,+xsavec,+xsaveopt,+xsaves", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 32 : i64, target_triple = "x86_64-unknown-unknown-eabi-elf", ukernels = "all"}>) {
      hal.executable.export public @_encoding_1_encode_4096x4096xf32_to_4096x4096xf32 ordinal(0) layout(#hal.pipeline.layout<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) count(%arg0: !hal.device) -> (index, index, index) {
        %c4096 = arith.constant 4096 : index
        %c1 = arith.constant 1 : index
        hal.return %c4096, %c1, %c1 : index, index, index
      } attributes {workgroup_size = [1 : index, 1 : index, 1 : index]}
      builtin.module attributes {llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-unknown-eabi-elf"} {
        llvm.func @iree_uk_pack(!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
        llvm.func @iree_uk_unpack(!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
        llvm.func @custom_mmt4d_6x16x8(!llvm.ptr, i64, i64, !llvm.ptr, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i32, i32, i32, i32, !llvm.ptr) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
        llvm.func @_encoding_1_encode_4096x4096xf32_to_4096x4096xf32(%arg0: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg1: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg2: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}) -> i32 {
          %0 = llvm.mlir.constant(52239 : i64) : i64
          %1 = llvm.mlir.constant(513 : i32) : i32
          %2 = llvm.mlir.constant(65536 : i64) : i64
          %3 = llvm.mlir.constant(4096 : i64) : i64
          %4 = llvm.mlir.constant(64 : i64) : i64
          %5 = llvm.mlir.constant(16 : i64) : i64
          %6 = llvm.mlir.constant(4 : i64) : i64
          %7 = llvm.mlir.constant(1 : i64) : i64
          %8 = llvm.mlir.constant(0 : i64) : i64
          %9 = llvm.mlir.constant(262144 : i64) : i64
          %10 = llvm.mlir.constant(1024 : i64) : i64
          %11 = llvm.mlir.constant(true) : i1
          %12 = llvm.mlir.constant(0 : i32) : i32
          %13 = llvm.mlir.constant(1 : i32) : i32
          %14 = llvm.alloca %13 x !llvm.array<8 x i64> {alignment = 8 : i64} : (i32) -> !llvm.ptr
          %15 = llvm.load %arg2 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)>
          %16 = llvm.extractvalue %15[0] : !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)>
          %17 = llvm.zext %16 : i32 to i64
          %18 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %19 = llvm.extractvalue %18[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %20 = llvm.load %19 : !llvm.ptr -> !llvm.ptr
          llvm.intr.assume %11 ["align"(%20, %4 : !llvm.ptr, i64)] : i1
          %21 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %22 = llvm.extractvalue %21[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %23 = llvm.getelementptr %22[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %24 = llvm.load %23 : !llvm.ptr -> !llvm.ptr
          %25 = llvm.getelementptr %24[67141632] : (!llvm.ptr) -> !llvm.ptr, i8
          llvm.intr.assume %11 ["align"(%25, %4 : !llvm.ptr, i64)] : i1
          %26 = llvm.udiv %17, %4 : i64
          %27 = llvm.urem %17, %4 : i64
          %28 = llvm.mul %26, %4 : i64
          %29 = llvm.mul %27, %9 : i64
          %30 = llvm.add %29, %28 : i64
          %31 = llvm.mul %26, %9 : i64
          %32 = llvm.mul %27, %10 : i64
          %33 = llvm.add %31, %32 : i64
          %34 = llvm.getelementptr inbounds %arg0[4] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          llvm.store %0, %14 : i64, !llvm.ptr
          %35 = llvm.getelementptr inbounds %34[1] : (!llvm.ptr) -> !llvm.ptr, i64
          %36 = llvm.load %35 : !llvm.ptr -> i64
          %37 = llvm.getelementptr inbounds %14[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %36, %37 : i64, !llvm.ptr
          %38 = llvm.getelementptr inbounds %34[2] : (!llvm.ptr) -> !llvm.ptr, i64
          %39 = llvm.load %38 : !llvm.ptr -> i64
          %40 = llvm.getelementptr inbounds %14[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %39, %40 : i64, !llvm.ptr
          %41 = llvm.getelementptr inbounds %34[3] : (!llvm.ptr) -> !llvm.ptr, i64
          %42 = llvm.load %41 : !llvm.ptr -> i64
          %43 = llvm.getelementptr inbounds %14[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %42, %43 : i64, !llvm.ptr
          %44 = llvm.getelementptr inbounds %34[4] : (!llvm.ptr) -> !llvm.ptr, i64
          %45 = llvm.load %44 : !llvm.ptr -> i64
          %46 = llvm.getelementptr inbounds %14[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %45, %46 : i64, !llvm.ptr
          %47 = llvm.getelementptr inbounds %34[5] : (!llvm.ptr) -> !llvm.ptr, i64
          %48 = llvm.load %47 : !llvm.ptr -> i64
          %49 = llvm.getelementptr inbounds %14[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %48, %49 : i64, !llvm.ptr
          %50 = llvm.getelementptr inbounds %34[6] : (!llvm.ptr) -> !llvm.ptr, i64
          %51 = llvm.load %50 : !llvm.ptr -> i64
          %52 = llvm.getelementptr inbounds %14[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %51, %52 : i64, !llvm.ptr
          %53 = llvm.getelementptr inbounds %34[7] : (!llvm.ptr) -> !llvm.ptr, i64
          %54 = llvm.load %53 : !llvm.ptr -> i64
          %55 = llvm.getelementptr inbounds %14[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %54, %55 : i64, !llvm.ptr
          %56 = llvm.call @iree_uk_pack(%20, %30, %3, %7, %25, %33, %2, %5, %4, %4, %6, %4, %7, %5, %8, %1, %14) : (!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32
          llvm.return %12 : i32
        }
      }
    }
  }
  util.func public @gemm(%arg0: !hal.buffer_view, %arg1: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @gemm(%input0: tensor<4096x4096xf32>, %input1: tensor<4096x4096xf32>) -> (%output0: tensor<4096x4096xf32>)"}} {
    %c134250496 = arith.constant 134250496 : index
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
    %result_0, %result_timepoint_1 = stream.resource.alloca uninitialized on(#hal.device.affinity<@__device_0>) : !stream.resource<transient>{%c134250496} => !stream.timepoint
    %2 = stream.timepoint.join max(%result_timepoint, %result_timepoint_1) => !stream.timepoint
    %3 = stream.cmd.execute on(#hal.device.affinity<@__device_0>) await(%2) => with(%0 as %arg2: !stream.resource<external>{%c67108864}, %1 as %arg3: !stream.resource<external>{%c67108864}, %result as %arg4: !stream.resource<external>{%c67108864}, %result_0 as %arg5: !stream.resource<transient>{%c134250496}) {
      stream.cmd.concurrent {
        stream.cmd.dispatch @_encoding_0::@embedded_elf_x86_64::@_encoding_0_encode_4096x4096xf32_to_4096x4096xf32 {
          ro %arg2[%c0 for %c67108864] : !stream.resource<external>{%c67108864},
          wo %arg5[%c0 for %c134250496] : !stream.resource<transient>{%c134250496}
        }
        stream.cmd.dispatch @_encoding_1::@embedded_elf_x86_64::@_encoding_1_encode_4096x4096xf32_to_4096x4096xf32 {
          ro %arg3[%c0 for %c67108864] : !stream.resource<external>{%c67108864},
          wo %arg5[%c0 for %c134250496] : !stream.resource<transient>{%c134250496}
        }
      }
      stream.cmd.dispatch @gemm_dispatch_0::@embedded_elf_x86_64::@gemm_dispatch_0_matmul_4096x4096x4096_f32 {
        ro %arg5[%c0 for %c134250496] : !stream.resource<transient>{%c134250496},
        wo %arg4[%c0 for %c67108864] : !stream.resource<external>{%c67108864}
      }
    } => !stream.timepoint
    %4 = stream.resource.dealloca on(#hal.device.affinity<@__device_0>) await(%3) => %result_0 : !stream.resource<transient>{%c134250496} => !stream.timepoint
    %5 = stream.timepoint.await %4 => %result : !stream.resource<external>{%c67108864}
    %6 = stream.tensor.export on(#hal.device.affinity<@__device_0>) %5 : tensor<4096x4096xf32> in !stream.resource<external>{%c67108864} -> !hal.buffer_view
    util.return %6 : !hal.buffer_view
  }
}
