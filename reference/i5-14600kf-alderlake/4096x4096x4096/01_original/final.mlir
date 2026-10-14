module attributes {stream.affinity.default = #hal.device.affinity<@__device_0>} {
  util.global private @__device_0 = #hal.device.target<"local", [#hal.executable.target<"llvm-cpu", "embedded-elf-x86_64", {cpu = "alderlake", cpu_features = "+adx,+aes,+avx,+avx2,+avxvnni,+bmi,+bmi2,+clflushopt,+clwb,+cmov,+crc32,+cx16,+cx8,+f16c,+fma,+fsgsbase,+fxsr,+gfni,+hreset,+invpcid,+kl,+lzcnt,+mmx,+movbe,+movdir64b,+movdiri,+pclmul,+pconfig,+pku,+popcnt,+prfchw,+ptwrite,+rdpid,+rdrnd,+rdseed,+sahf,+serialize,+sgx,+sha,+shstk,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+vaes,+vpclmulqdq,+waitpkg,+widekl,+x87,+xsave,+xsavec,+xsaveopt,+xsaves", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 32 : i64, target_triple = "x86_64-unknown-unknown-eabi-elf", ukernels = "all"}>]> : !hal.device
  hal.executable private @gemm_dispatch_0 {
    hal.executable.variant public @embedded_elf_x86_64 target(<"llvm-cpu", "embedded-elf-x86_64", {cpu = "alderlake", cpu_features = "+adx,+aes,+avx,+avx2,+avxvnni,+bmi,+bmi2,+clflushopt,+clwb,+cmov,+crc32,+cx16,+cx8,+f16c,+fma,+fsgsbase,+fxsr,+gfni,+hreset,+invpcid,+kl,+lzcnt,+mmx,+movbe,+movdir64b,+movdiri,+pclmul,+pconfig,+pku,+popcnt,+prfchw,+ptwrite,+rdpid,+rdrnd,+rdseed,+sahf,+serialize,+sgx,+sha,+shstk,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+vaes,+vpclmulqdq,+waitpkg,+widekl,+x87,+xsave,+xsavec,+xsaveopt,+xsaves", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 32 : i64, target_triple = "x86_64-unknown-unknown-eabi-elf", ukernels = "all"}>) {
      hal.executable.export public @gemm_dispatch_0_matmul_4096x4096x4096_f32 ordinal(0) layout(#hal.pipeline.layout<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) count(%arg0: !hal.device) -> (index, index, index) {
        %c262144 = arith.constant 262144 : index
        %c1 = arith.constant 1 : index
        hal.return %c262144, %c1, %c1 : index, index, index
      } attributes {workgroup_size = [1 : index, 1 : index, 1 : index]}
      builtin.module attributes {llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-unknown-eabi-elf"} {
        llvm.func @iree_uk_unpack(!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
        llvm.func @iree_uk_mmt4d(!llvm.ptr, i64, i64, !llvm.ptr, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i32, i32, i32, i32, !llvm.ptr) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
        llvm.func @gemm_dispatch_0_matmul_4096x4096x4096_f32(%arg0: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg1: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg2: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}) -> i32 {
          %0 = llvm.mlir.constant(52239 : i64) : i64
          %1 = llvm.mlir.constant(8 : i64) : i64
          %2 = llvm.mlir.constant(0 : i32) : i32
          %3 = llvm.mlir.constant(16777216 : index) : i64
          %4 = llvm.mlir.constant(-1 : index) : i64
          %5 = llvm.mlir.constant(64 : index) : i64
          %6 = llvm.mlir.constant(32768 : index) : i64
          %7 = llvm.mlir.constant(512 : index) : i64
          %8 = llvm.mlir.constant(0 : index) : i64
          %9 = llvm.mlir.constant(8 : index) : i64
          %10 = llvm.mlir.constant(1 : index) : i64
          %11 = llvm.mlir.constant(4096 : index) : i64
          %12 = llvm.mlir.constant(8 : i32) : i32
          %13 = llvm.mlir.constant(1 : i32) : i32
          %14 = llvm.mlir.constant(1537 : i32) : i32
          %15 = llvm.alloca %5 x f32 {alignment = 64 : i64} : (i64) -> !llvm.ptr
          %16 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %17 = llvm.extractvalue %16[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %18 = llvm.load %17 : !llvm.ptr -> !llvm.ptr
          %19 = llvm.getelementptr %17[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %20 = llvm.load %19 : !llvm.ptr -> !llvm.ptr
          %21 = llvm.load %arg2 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)>
          %22 = llvm.extractvalue %21[0] : !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)>
          %23 = llvm.zext %22 : i32 to i64
          %24 = llvm.sdiv %23, %7 : i64
          %25 = llvm.mul %24, %7 : i64
          %26 = llvm.icmp "ne" %23, %25 : i64
          %27 = llvm.icmp "slt" %23, %8 : i64
          %28 = llvm.and %26, %27 : i1
          %29 = llvm.add %24, %4 : i64
          %30 = llvm.select %28, %29, %24 : i1, i64
          %31 = llvm.srem %23, %7 : i64
          %32 = llvm.icmp "slt" %31, %8 : i64
          %33 = llvm.add %31, %7 overflow<nsw> : i64
          %34 = llvm.select %32, %33, %31 : i1, i64
          %35 = llvm.mul %30, %9 overflow<nsw> : i64
          %36 = llvm.mul %34, %9 overflow<nsw> : i64
          %37 = llvm.mul %30, %6 overflow<nsw> : i64
          %38 = llvm.mul %34, %6 overflow<nsw> : i64
          %39 = llvm.add %38, %3 : i64
          %40 = llvm.getelementptr inbounds %arg0[4] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %41 = llvm.alloca %1 x i64 {alignment = 8 : i64} : (i64) -> !llvm.ptr
          %42 = llvm.load %40 : !llvm.ptr -> i64
          %43 = llvm.or %42, %0 : i64
          llvm.store %43, %41 : i64, !llvm.ptr
          %44 = llvm.getelementptr inbounds %40[1] : (!llvm.ptr) -> !llvm.ptr, i64
          %45 = llvm.load %44 : !llvm.ptr -> i64
          %46 = llvm.getelementptr inbounds %41[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %45, %46 : i64, !llvm.ptr
          %47 = llvm.getelementptr inbounds %40[2] : (!llvm.ptr) -> !llvm.ptr, i64
          %48 = llvm.load %47 : !llvm.ptr -> i64
          %49 = llvm.getelementptr inbounds %41[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %48, %49 : i64, !llvm.ptr
          %50 = llvm.getelementptr inbounds %40[3] : (!llvm.ptr) -> !llvm.ptr, i64
          %51 = llvm.load %50 : !llvm.ptr -> i64
          %52 = llvm.getelementptr inbounds %41[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %51, %52 : i64, !llvm.ptr
          %53 = llvm.getelementptr inbounds %40[4] : (!llvm.ptr) -> !llvm.ptr, i64
          %54 = llvm.load %53 : !llvm.ptr -> i64
          %55 = llvm.getelementptr inbounds %41[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %54, %55 : i64, !llvm.ptr
          %56 = llvm.getelementptr inbounds %40[5] : (!llvm.ptr) -> !llvm.ptr, i64
          %57 = llvm.load %56 : !llvm.ptr -> i64
          %58 = llvm.getelementptr inbounds %41[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %57, %58 : i64, !llvm.ptr
          %59 = llvm.getelementptr inbounds %40[6] : (!llvm.ptr) -> !llvm.ptr, i64
          %60 = llvm.load %59 : !llvm.ptr -> i64
          %61 = llvm.getelementptr inbounds %41[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %60, %61 : i64, !llvm.ptr
          %62 = llvm.getelementptr inbounds %40[7] : (!llvm.ptr) -> !llvm.ptr, i64
          %63 = llvm.load %62 : !llvm.ptr -> i64
          %64 = llvm.getelementptr inbounds %41[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %63, %64 : i64, !llvm.ptr
          %65 = llvm.call @iree_uk_mmt4d(%18, %37, %6, %18, %39, %6, %15, %8, %5, %10, %10, %11, %12, %12, %13, %14, %41) : (!llvm.ptr, i64, i64, !llvm.ptr, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i32, i32, i32, i32, !llvm.ptr) -> i32
          %66 = llvm.mul %35, %11 overflow<nsw> : i64
          %67 = llvm.add %66, %36 : i64
          %68 = llvm.alloca %1 x i64 {alignment = 8 : i64} : (i64) -> !llvm.ptr
          %69 = llvm.load %40 : !llvm.ptr -> i64
          %70 = llvm.or %69, %0 : i64
          llvm.store %70, %68 : i64, !llvm.ptr
          %71 = llvm.load %44 : !llvm.ptr -> i64
          %72 = llvm.getelementptr inbounds %68[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %71, %72 : i64, !llvm.ptr
          %73 = llvm.load %47 : !llvm.ptr -> i64
          %74 = llvm.getelementptr inbounds %68[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %73, %74 : i64, !llvm.ptr
          %75 = llvm.load %50 : !llvm.ptr -> i64
          %76 = llvm.getelementptr inbounds %68[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %75, %76 : i64, !llvm.ptr
          %77 = llvm.load %53 : !llvm.ptr -> i64
          %78 = llvm.getelementptr inbounds %68[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %77, %78 : i64, !llvm.ptr
          %79 = llvm.load %56 : !llvm.ptr -> i64
          %80 = llvm.getelementptr inbounds %68[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %79, %80 : i64, !llvm.ptr
          %81 = llvm.load %59 : !llvm.ptr -> i64
          %82 = llvm.getelementptr inbounds %68[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %81, %82 : i64, !llvm.ptr
          %83 = llvm.load %62 : !llvm.ptr -> i64
          %84 = llvm.getelementptr inbounds %68[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %83, %84 : i64, !llvm.ptr
          %85 = llvm.call @iree_uk_unpack(%15, %8, %5, %5, %20, %67, %11, %10, %10, %10, %9, %9, %9, %9, %13, %68) : (!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32
          llvm.return %2 : i32
        }
      }
    }
  }
  hal.executable private @_encoding_0 {
    hal.executable.variant public @embedded_elf_x86_64 target(<"llvm-cpu", "embedded-elf-x86_64", {cpu = "alderlake", cpu_features = "+adx,+aes,+avx,+avx2,+avxvnni,+bmi,+bmi2,+clflushopt,+clwb,+cmov,+crc32,+cx16,+cx8,+f16c,+fma,+fsgsbase,+fxsr,+gfni,+hreset,+invpcid,+kl,+lzcnt,+mmx,+movbe,+movdir64b,+movdiri,+pclmul,+pconfig,+pku,+popcnt,+prfchw,+ptwrite,+rdpid,+rdrnd,+rdseed,+sahf,+serialize,+sgx,+sha,+shstk,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+vaes,+vpclmulqdq,+waitpkg,+widekl,+x87,+xsave,+xsavec,+xsaveopt,+xsaves", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 32 : i64, target_triple = "x86_64-unknown-unknown-eabi-elf", ukernels = "all"}>) {
      hal.executable.export public @_encoding_0_encode_4096x4096xf32_to_4096x4096xf32 ordinal(0) layout(#hal.pipeline.layout<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) count(%arg0: !hal.device) -> (index, index, index) {
        %c512 = arith.constant 512 : index
        %c1 = arith.constant 1 : index
        hal.return %c512, %c1, %c1 : index, index, index
      } attributes {workgroup_size = [1 : index, 1 : index, 1 : index]}
      builtin.module attributes {llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-unknown-eabi-elf"} {
        llvm.func @iree_uk_pack(!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
        llvm.func @_encoding_0_encode_4096x4096xf32_to_4096x4096xf32(%arg0: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg1: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg2: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}) -> i32 {
          %0 = llvm.mlir.constant(52239 : i64) : i64
          %1 = llvm.mlir.constant(8 : i64) : i64
          %2 = llvm.mlir.constant(0 : i32) : i32
          %3 = llvm.mlir.constant(-1 : index) : i64
          %4 = llvm.mlir.constant(32768 : index) : i64
          %5 = llvm.mlir.constant(4096 : index) : i64
          %6 = llvm.mlir.constant(1 : i32) : i32
          %7 = llvm.mlir.constant(1 : index) : i64
          %8 = llvm.mlir.constant(8 : index) : i64
          %9 = llvm.mlir.constant(64 : index) : i64
          %10 = llvm.mlir.constant(512 : index) : i64
          %11 = llvm.mlir.constant(0 : i64) : i64
          %12 = llvm.mlir.constant(0 : index) : i64
          %13 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %14 = llvm.extractvalue %13[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %15 = llvm.load %14 : !llvm.ptr -> !llvm.ptr
          %16 = llvm.getelementptr %14[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %17 = llvm.load %16 : !llvm.ptr -> !llvm.ptr
          %18 = llvm.load %arg2 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)>
          %19 = llvm.extractvalue %18[0] : !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)>
          %20 = llvm.zext %19 : i32 to i64
          %21 = llvm.sdiv %20, %9 : i64
          %22 = llvm.mul %21, %9 : i64
          %23 = llvm.icmp "ne" %20, %22 : i64
          %24 = llvm.icmp "slt" %20, %12 : i64
          %25 = llvm.and %23, %24 : i1
          %26 = llvm.add %21, %3 : i64
          %27 = llvm.select %25, %26, %21 : i1, i64
          %28 = llvm.srem %20, %9 : i64
          %29 = llvm.icmp "slt" %28, %12 : i64
          %30 = llvm.add %28, %9 overflow<nsw> : i64
          %31 = llvm.select %29, %30, %28 : i1, i64
          %32 = llvm.mul %27, %9 overflow<nsw> : i64
          %33 = llvm.mul %31, %9 overflow<nsw> : i64
          %34 = llvm.mul %27, %10 overflow<nsw> : i64
          %35 = llvm.mul %34, %5 overflow<nsw> : i64
          %36 = llvm.add %35, %33 : i64
          %37 = llvm.mul %32, %4 overflow<nsw> : i64
          %38 = llvm.mul %33, %8 overflow<nsw> : i64
          %39 = llvm.add %37, %38 : i64
          %40 = llvm.getelementptr inbounds %arg0[4] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %41 = llvm.alloca %1 x i64 {alignment = 8 : i64} : (i64) -> !llvm.ptr
          %42 = llvm.load %40 : !llvm.ptr -> i64
          %43 = llvm.or %42, %0 : i64
          llvm.store %43, %41 : i64, !llvm.ptr
          %44 = llvm.getelementptr inbounds %40[1] : (!llvm.ptr) -> !llvm.ptr, i64
          %45 = llvm.load %44 : !llvm.ptr -> i64
          %46 = llvm.getelementptr inbounds %41[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %45, %46 : i64, !llvm.ptr
          %47 = llvm.getelementptr inbounds %40[2] : (!llvm.ptr) -> !llvm.ptr, i64
          %48 = llvm.load %47 : !llvm.ptr -> i64
          %49 = llvm.getelementptr inbounds %41[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %48, %49 : i64, !llvm.ptr
          %50 = llvm.getelementptr inbounds %40[3] : (!llvm.ptr) -> !llvm.ptr, i64
          %51 = llvm.load %50 : !llvm.ptr -> i64
          %52 = llvm.getelementptr inbounds %41[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %51, %52 : i64, !llvm.ptr
          %53 = llvm.getelementptr inbounds %40[4] : (!llvm.ptr) -> !llvm.ptr, i64
          %54 = llvm.load %53 : !llvm.ptr -> i64
          %55 = llvm.getelementptr inbounds %41[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %54, %55 : i64, !llvm.ptr
          %56 = llvm.getelementptr inbounds %40[5] : (!llvm.ptr) -> !llvm.ptr, i64
          %57 = llvm.load %56 : !llvm.ptr -> i64
          %58 = llvm.getelementptr inbounds %41[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %57, %58 : i64, !llvm.ptr
          %59 = llvm.getelementptr inbounds %40[6] : (!llvm.ptr) -> !llvm.ptr, i64
          %60 = llvm.load %59 : !llvm.ptr -> i64
          %61 = llvm.getelementptr inbounds %41[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %60, %61 : i64, !llvm.ptr
          %62 = llvm.getelementptr inbounds %40[7] : (!llvm.ptr) -> !llvm.ptr, i64
          %63 = llvm.load %62 : !llvm.ptr -> i64
          %64 = llvm.getelementptr inbounds %41[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %63, %64 : i64, !llvm.ptr
          %65 = llvm.call @iree_uk_pack(%15, %36, %5, %7, %17, %39, %4, %8, %10, %9, %9, %9, %8, %7, %11, %6, %41) : (!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32
          llvm.return %2 : i32
        }
      }
    }
  }
  hal.executable private @_encoding_1 {
    hal.executable.variant public @embedded_elf_x86_64 target(<"llvm-cpu", "embedded-elf-x86_64", {cpu = "alderlake", cpu_features = "+adx,+aes,+avx,+avx2,+avxvnni,+bmi,+bmi2,+clflushopt,+clwb,+cmov,+crc32,+cx16,+cx8,+f16c,+fma,+fsgsbase,+fxsr,+gfni,+hreset,+invpcid,+kl,+lzcnt,+mmx,+movbe,+movdir64b,+movdiri,+pclmul,+pconfig,+pku,+popcnt,+prfchw,+ptwrite,+rdpid,+rdrnd,+rdseed,+sahf,+serialize,+sgx,+sha,+shstk,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+vaes,+vpclmulqdq,+waitpkg,+widekl,+x87,+xsave,+xsavec,+xsaveopt,+xsaves", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 32 : i64, target_triple = "x86_64-unknown-unknown-eabi-elf", ukernels = "all"}>) {
      hal.executable.export public @_encoding_1_encode_4096x4096xf32_to_4096x4096xf32 ordinal(0) layout(#hal.pipeline.layout<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) count(%arg0: !hal.device) -> (index, index, index) {
        %c512 = arith.constant 512 : index
        %c1 = arith.constant 1 : index
        hal.return %c512, %c1, %c1 : index, index, index
      } attributes {workgroup_size = [1 : index, 1 : index, 1 : index]}
      builtin.module attributes {llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-unknown-eabi-elf"} {
        llvm.func @iree_uk_pack(!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
        llvm.func @_encoding_1_encode_4096x4096xf32_to_4096x4096xf32(%arg0: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg1: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg2: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}) -> i32 {
          %0 = llvm.mlir.constant(52239 : i64) : i64
          %1 = llvm.mlir.constant(8 : i64) : i64
          %2 = llvm.mlir.constant(0 : i32) : i32
          %3 = llvm.mlir.constant(16777216 : index) : i64
          %4 = llvm.mlir.constant(-1 : index) : i64
          %5 = llvm.mlir.constant(32768 : index) : i64
          %6 = llvm.mlir.constant(4096 : index) : i64
          %7 = llvm.mlir.constant(769 : i32) : i32
          %8 = llvm.mlir.constant(1 : index) : i64
          %9 = llvm.mlir.constant(8 : index) : i64
          %10 = llvm.mlir.constant(512 : index) : i64
          %11 = llvm.mlir.constant(64 : index) : i64
          %12 = llvm.mlir.constant(0 : i64) : i64
          %13 = llvm.mlir.constant(0 : index) : i64
          %14 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %15 = llvm.extractvalue %14[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %16 = llvm.load %15 : !llvm.ptr -> !llvm.ptr
          %17 = llvm.getelementptr %15[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %18 = llvm.load %17 : !llvm.ptr -> !llvm.ptr
          %19 = llvm.load %arg2 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)>
          %20 = llvm.extractvalue %19[0] : !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)>
          %21 = llvm.zext %20 : i32 to i64
          %22 = llvm.sdiv %21, %11 : i64
          %23 = llvm.mul %22, %11 : i64
          %24 = llvm.icmp "ne" %21, %23 : i64
          %25 = llvm.icmp "slt" %21, %13 : i64
          %26 = llvm.and %24, %25 : i1
          %27 = llvm.add %22, %4 : i64
          %28 = llvm.select %26, %27, %22 : i1, i64
          %29 = llvm.srem %21, %11 : i64
          %30 = llvm.icmp "slt" %29, %13 : i64
          %31 = llvm.add %29, %11 overflow<nsw> : i64
          %32 = llvm.select %30, %31, %29 : i1, i64
          %33 = llvm.mul %28, %11 overflow<nsw> : i64
          %34 = llvm.mul %32, %11 overflow<nsw> : i64
          %35 = llvm.mul %28, %10 overflow<nsw> : i64
          %36 = llvm.mul %34, %6 overflow<nsw> : i64
          %37 = llvm.add %36, %35 : i64
          %38 = llvm.mul %33, %5 overflow<nsw> : i64
          %39 = llvm.mul %34, %9 overflow<nsw> : i64
          %40 = llvm.add %38, %39 : i64
          %41 = llvm.add %40, %3 : i64
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
          %67 = llvm.call @iree_uk_pack(%16, %37, %6, %8, %18, %41, %5, %9, %11, %10, %11, %11, %9, %8, %12, %7, %43) : (!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32
          llvm.return %2 : i32
        }
      }
    }
  }
  util.func public @gemm(%arg0: !hal.buffer_view, %arg1: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @gemm(%input0: tensor<4096x4096xf32>, %input1: tensor<4096x4096xf32>) -> (%output0: tensor<4096x4096xf32>)"}} {
    %c134217728 = arith.constant 134217728 : index
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
    %result_0, %result_timepoint_1 = stream.resource.alloca uninitialized on(#hal.device.affinity<@__device_0>) : !stream.resource<transient>{%c134217728} => !stream.timepoint
    %2 = stream.timepoint.join max(%result_timepoint, %result_timepoint_1) => !stream.timepoint
    %3 = stream.cmd.execute on(#hal.device.affinity<@__device_0>) await(%2) => with(%0 as %arg2: !stream.resource<external>{%c67108864}, %1 as %arg3: !stream.resource<external>{%c67108864}, %result as %arg4: !stream.resource<external>{%c67108864}, %result_0 as %arg5: !stream.resource<transient>{%c134217728}) {
      stream.cmd.concurrent {
        stream.cmd.dispatch @_encoding_0::@embedded_elf_x86_64::@_encoding_0_encode_4096x4096xf32_to_4096x4096xf32 {
          ro %arg2[%c0 for %c67108864] : !stream.resource<external>{%c67108864},
          wo %arg5[%c0 for %c134217728] : !stream.resource<transient>{%c134217728}
        }
        stream.cmd.dispatch @_encoding_1::@embedded_elf_x86_64::@_encoding_1_encode_4096x4096xf32_to_4096x4096xf32 {
          ro %arg3[%c0 for %c67108864] : !stream.resource<external>{%c67108864},
          wo %arg5[%c0 for %c134217728] : !stream.resource<transient>{%c134217728}
        }
      }
      stream.cmd.dispatch @gemm_dispatch_0::@embedded_elf_x86_64::@gemm_dispatch_0_matmul_4096x4096x4096_f32 {
        ro %arg5[%c0 for %c134217728] : !stream.resource<transient>{%c134217728},
        wo %arg4[%c0 for %c67108864] : !stream.resource<external>{%c67108864}
      }
    } => !stream.timepoint
    %4 = stream.resource.dealloca on(#hal.device.affinity<@__device_0>) await(%3) => %result_0 : !stream.resource<transient>{%c134217728} => !stream.timepoint
    %5 = stream.timepoint.await %4 => %result : !stream.resource<external>{%c67108864}
    %6 = stream.tensor.export on(#hal.device.affinity<@__device_0>) %5 : tensor<4096x4096xf32> in !stream.resource<external>{%c67108864} -> !hal.buffer_view
    util.return %6 : !hal.buffer_view
  }
}
