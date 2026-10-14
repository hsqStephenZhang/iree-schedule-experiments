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
          %1 = llvm.mlir.constant(1537 : i32) : i32
          %2 = llvm.mlir.constant(1 : i32) : i32
          %3 = llvm.mlir.constant(8 : i32) : i32
          %4 = llvm.mlir.constant(4096 : i64) : i64
          %5 = llvm.mlir.constant(1 : i64) : i64
          %6 = llvm.mlir.constant(0 : i64) : i64
          %7 = llvm.mlir.constant(512 : i64) : i64
          %8 = llvm.mlir.constant(32768 : i64) : i64
          %9 = llvm.mlir.constant(64 : i64) : i64
          %10 = llvm.mlir.constant(-1 : i64) : i64
          %11 = llvm.mlir.constant(16777216 : i64) : i64
          %12 = llvm.mlir.constant(0 : i32) : i32
          %13 = llvm.mlir.constant(8 : i64) : i64
          %14 = llvm.alloca %2 x !llvm.array<8 x i64> {alignment = 8 : i64} : (i32) -> !llvm.ptr
          %15 = llvm.alloca %2 x !llvm.array<8 x i64> {alignment = 8 : i64} : (i32) -> !llvm.ptr
          %16 = llvm.alloca %2 x !llvm.array<64 x f32> {alignment = 64 : i64} : (i32) -> !llvm.ptr
          %17 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %18 = llvm.extractvalue %17[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %19 = llvm.load %18 : !llvm.ptr -> !llvm.ptr
          %20 = llvm.getelementptr %18[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %21 = llvm.load %20 : !llvm.ptr -> !llvm.ptr
          %22 = llvm.load %arg2 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)>
          %23 = llvm.extractvalue %22[0] : !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)>
          %24 = llvm.zext %23 : i32 to i64
          %25 = llvm.sdiv %24, %7 : i64
          %26 = llvm.mul %25, %7 : i64
          %27 = llvm.icmp "ne" %24, %26 : i64
          %28 = llvm.icmp "slt" %24, %6 : i64
          %29 = llvm.and %27, %28 : i1
          %30 = llvm.add %25, %10 : i64
          %31 = llvm.select %29, %30, %25 : i1, i64
          %32 = llvm.srem %24, %7 : i64
          %33 = llvm.icmp "slt" %32, %6 : i64
          %34 = llvm.add %32, %7 overflow<nsw> : i64
          %35 = llvm.select %33, %34, %32 : i1, i64
          %36 = llvm.mul %31, %13 overflow<nsw> : i64
          %37 = llvm.mul %35, %13 overflow<nsw> : i64
          %38 = llvm.mul %31, %8 overflow<nsw> : i64
          %39 = llvm.mul %35, %8 overflow<nsw> : i64
          %40 = llvm.add %39, %11 : i64
          %41 = llvm.getelementptr inbounds %arg0[4] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          llvm.store %0, %14 : i64, !llvm.ptr
          %42 = llvm.getelementptr inbounds %41[1] : (!llvm.ptr) -> !llvm.ptr, i64
          %43 = llvm.load %42 : !llvm.ptr -> i64
          %44 = llvm.getelementptr inbounds %14[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %43, %44 : i64, !llvm.ptr
          %45 = llvm.getelementptr inbounds %41[2] : (!llvm.ptr) -> !llvm.ptr, i64
          %46 = llvm.load %45 : !llvm.ptr -> i64
          %47 = llvm.getelementptr inbounds %14[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %46, %47 : i64, !llvm.ptr
          %48 = llvm.getelementptr inbounds %41[3] : (!llvm.ptr) -> !llvm.ptr, i64
          %49 = llvm.load %48 : !llvm.ptr -> i64
          %50 = llvm.getelementptr inbounds %14[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %49, %50 : i64, !llvm.ptr
          %51 = llvm.getelementptr inbounds %41[4] : (!llvm.ptr) -> !llvm.ptr, i64
          %52 = llvm.load %51 : !llvm.ptr -> i64
          %53 = llvm.getelementptr inbounds %14[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %52, %53 : i64, !llvm.ptr
          %54 = llvm.getelementptr inbounds %41[5] : (!llvm.ptr) -> !llvm.ptr, i64
          %55 = llvm.load %54 : !llvm.ptr -> i64
          %56 = llvm.getelementptr inbounds %14[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %55, %56 : i64, !llvm.ptr
          %57 = llvm.getelementptr inbounds %41[6] : (!llvm.ptr) -> !llvm.ptr, i64
          %58 = llvm.load %57 : !llvm.ptr -> i64
          %59 = llvm.getelementptr inbounds %14[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %58, %59 : i64, !llvm.ptr
          %60 = llvm.getelementptr inbounds %41[7] : (!llvm.ptr) -> !llvm.ptr, i64
          %61 = llvm.load %60 : !llvm.ptr -> i64
          %62 = llvm.getelementptr inbounds %14[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %61, %62 : i64, !llvm.ptr
          %63 = llvm.call @iree_uk_mmt4d(%19, %38, %8, %19, %40, %8, %16, %6, %9, %5, %5, %4, %3, %3, %2, %1, %14) : (!llvm.ptr, i64, i64, !llvm.ptr, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i32, i32, i32, i32, !llvm.ptr) -> i32
          %64 = llvm.mul %36, %4 overflow<nsw> : i64
          %65 = llvm.add %64, %37 : i64
          llvm.store %0, %15 : i64, !llvm.ptr
          %66 = llvm.load %42 : !llvm.ptr -> i64
          %67 = llvm.getelementptr inbounds %15[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %66, %67 : i64, !llvm.ptr
          %68 = llvm.load %45 : !llvm.ptr -> i64
          %69 = llvm.getelementptr inbounds %15[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %68, %69 : i64, !llvm.ptr
          %70 = llvm.load %48 : !llvm.ptr -> i64
          %71 = llvm.getelementptr inbounds %15[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %70, %71 : i64, !llvm.ptr
          %72 = llvm.load %51 : !llvm.ptr -> i64
          %73 = llvm.getelementptr inbounds %15[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %72, %73 : i64, !llvm.ptr
          %74 = llvm.load %54 : !llvm.ptr -> i64
          %75 = llvm.getelementptr inbounds %15[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %74, %75 : i64, !llvm.ptr
          %76 = llvm.load %57 : !llvm.ptr -> i64
          %77 = llvm.getelementptr inbounds %15[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %76, %77 : i64, !llvm.ptr
          %78 = llvm.load %60 : !llvm.ptr -> i64
          %79 = llvm.getelementptr inbounds %15[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %78, %79 : i64, !llvm.ptr
          %80 = llvm.call @iree_uk_unpack(%16, %6, %9, %9, %21, %65, %4, %5, %5, %5, %13, %13, %13, %13, %2, %15) : (!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32
          llvm.return %12 : i32
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
          %1 = llvm.mlir.constant(0 : i64) : i64
          %2 = llvm.mlir.constant(512 : i64) : i64
          %3 = llvm.mlir.constant(64 : i64) : i64
          %4 = llvm.mlir.constant(1 : i64) : i64
          %5 = llvm.mlir.constant(1 : i32) : i32
          %6 = llvm.mlir.constant(4096 : i64) : i64
          %7 = llvm.mlir.constant(32768 : i64) : i64
          %8 = llvm.mlir.constant(-1 : i64) : i64
          %9 = llvm.mlir.constant(0 : i32) : i32
          %10 = llvm.mlir.constant(8 : i64) : i64
          %11 = llvm.alloca %5 x !llvm.array<8 x i64> {alignment = 8 : i64} : (i32) -> !llvm.ptr
          %12 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %13 = llvm.extractvalue %12[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %14 = llvm.load %13 : !llvm.ptr -> !llvm.ptr
          %15 = llvm.getelementptr %13[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %16 = llvm.load %15 : !llvm.ptr -> !llvm.ptr
          %17 = llvm.load %arg2 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)>
          %18 = llvm.extractvalue %17[0] : !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)>
          %19 = llvm.zext %18 : i32 to i64
          %20 = llvm.sdiv %19, %3 : i64
          %21 = llvm.mul %20, %3 : i64
          %22 = llvm.icmp "ne" %19, %21 : i64
          %23 = llvm.icmp "slt" %19, %1 : i64
          %24 = llvm.and %22, %23 : i1
          %25 = llvm.add %20, %8 : i64
          %26 = llvm.select %24, %25, %20 : i1, i64
          %27 = llvm.srem %19, %3 : i64
          %28 = llvm.icmp "slt" %27, %1 : i64
          %29 = llvm.add %27, %3 overflow<nsw> : i64
          %30 = llvm.select %28, %29, %27 : i1, i64
          %31 = llvm.mul %26, %3 overflow<nsw> : i64
          %32 = llvm.mul %30, %3 overflow<nsw> : i64
          %33 = llvm.mul %26, %2 overflow<nsw> : i64
          %34 = llvm.mul %33, %6 overflow<nsw> : i64
          %35 = llvm.add %34, %32 : i64
          %36 = llvm.mul %31, %7 overflow<nsw> : i64
          %37 = llvm.mul %32, %10 overflow<nsw> : i64
          %38 = llvm.add %36, %37 : i64
          %39 = llvm.getelementptr inbounds %arg0[4] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          llvm.store %0, %11 : i64, !llvm.ptr
          %40 = llvm.getelementptr inbounds %39[1] : (!llvm.ptr) -> !llvm.ptr, i64
          %41 = llvm.load %40 : !llvm.ptr -> i64
          %42 = llvm.getelementptr inbounds %11[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %41, %42 : i64, !llvm.ptr
          %43 = llvm.getelementptr inbounds %39[2] : (!llvm.ptr) -> !llvm.ptr, i64
          %44 = llvm.load %43 : !llvm.ptr -> i64
          %45 = llvm.getelementptr inbounds %11[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %44, %45 : i64, !llvm.ptr
          %46 = llvm.getelementptr inbounds %39[3] : (!llvm.ptr) -> !llvm.ptr, i64
          %47 = llvm.load %46 : !llvm.ptr -> i64
          %48 = llvm.getelementptr inbounds %11[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %47, %48 : i64, !llvm.ptr
          %49 = llvm.getelementptr inbounds %39[4] : (!llvm.ptr) -> !llvm.ptr, i64
          %50 = llvm.load %49 : !llvm.ptr -> i64
          %51 = llvm.getelementptr inbounds %11[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %50, %51 : i64, !llvm.ptr
          %52 = llvm.getelementptr inbounds %39[5] : (!llvm.ptr) -> !llvm.ptr, i64
          %53 = llvm.load %52 : !llvm.ptr -> i64
          %54 = llvm.getelementptr inbounds %11[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %53, %54 : i64, !llvm.ptr
          %55 = llvm.getelementptr inbounds %39[6] : (!llvm.ptr) -> !llvm.ptr, i64
          %56 = llvm.load %55 : !llvm.ptr -> i64
          %57 = llvm.getelementptr inbounds %11[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %56, %57 : i64, !llvm.ptr
          %58 = llvm.getelementptr inbounds %39[7] : (!llvm.ptr) -> !llvm.ptr, i64
          %59 = llvm.load %58 : !llvm.ptr -> i64
          %60 = llvm.getelementptr inbounds %11[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %59, %60 : i64, !llvm.ptr
          %61 = llvm.call @iree_uk_pack(%14, %35, %6, %4, %16, %38, %7, %10, %2, %3, %3, %3, %10, %4, %1, %5, %11) : (!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32
          llvm.return %9 : i32
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
          %1 = llvm.mlir.constant(0 : i64) : i64
          %2 = llvm.mlir.constant(64 : i64) : i64
          %3 = llvm.mlir.constant(512 : i64) : i64
          %4 = llvm.mlir.constant(1 : i64) : i64
          %5 = llvm.mlir.constant(769 : i32) : i32
          %6 = llvm.mlir.constant(4096 : i64) : i64
          %7 = llvm.mlir.constant(32768 : i64) : i64
          %8 = llvm.mlir.constant(-1 : i64) : i64
          %9 = llvm.mlir.constant(16777216 : i64) : i64
          %10 = llvm.mlir.constant(0 : i32) : i32
          %11 = llvm.mlir.constant(8 : i64) : i64
          %12 = llvm.mlir.constant(1 : i32) : i32
          %13 = llvm.alloca %12 x !llvm.array<8 x i64> {alignment = 8 : i64} : (i32) -> !llvm.ptr
          %14 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %15 = llvm.extractvalue %14[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %16 = llvm.load %15 : !llvm.ptr -> !llvm.ptr
          %17 = llvm.getelementptr %15[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %18 = llvm.load %17 : !llvm.ptr -> !llvm.ptr
          %19 = llvm.load %arg2 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)>
          %20 = llvm.extractvalue %19[0] : !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)>
          %21 = llvm.zext %20 : i32 to i64
          %22 = llvm.sdiv %21, %2 : i64
          %23 = llvm.mul %22, %2 : i64
          %24 = llvm.icmp "ne" %21, %23 : i64
          %25 = llvm.icmp "slt" %21, %1 : i64
          %26 = llvm.and %24, %25 : i1
          %27 = llvm.add %22, %8 : i64
          %28 = llvm.select %26, %27, %22 : i1, i64
          %29 = llvm.srem %21, %2 : i64
          %30 = llvm.icmp "slt" %29, %1 : i64
          %31 = llvm.add %29, %2 overflow<nsw> : i64
          %32 = llvm.select %30, %31, %29 : i1, i64
          %33 = llvm.mul %28, %2 overflow<nsw> : i64
          %34 = llvm.mul %32, %2 overflow<nsw> : i64
          %35 = llvm.mul %28, %3 overflow<nsw> : i64
          %36 = llvm.mul %34, %6 overflow<nsw> : i64
          %37 = llvm.add %36, %35 : i64
          %38 = llvm.mul %33, %7 overflow<nsw> : i64
          %39 = llvm.mul %34, %11 overflow<nsw> : i64
          %40 = llvm.add %38, %39 : i64
          %41 = llvm.add %40, %9 : i64
          %42 = llvm.getelementptr inbounds %arg0[4] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          llvm.store %0, %13 : i64, !llvm.ptr
          %43 = llvm.getelementptr inbounds %42[1] : (!llvm.ptr) -> !llvm.ptr, i64
          %44 = llvm.load %43 : !llvm.ptr -> i64
          %45 = llvm.getelementptr inbounds %13[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %44, %45 : i64, !llvm.ptr
          %46 = llvm.getelementptr inbounds %42[2] : (!llvm.ptr) -> !llvm.ptr, i64
          %47 = llvm.load %46 : !llvm.ptr -> i64
          %48 = llvm.getelementptr inbounds %13[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %47, %48 : i64, !llvm.ptr
          %49 = llvm.getelementptr inbounds %42[3] : (!llvm.ptr) -> !llvm.ptr, i64
          %50 = llvm.load %49 : !llvm.ptr -> i64
          %51 = llvm.getelementptr inbounds %13[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %50, %51 : i64, !llvm.ptr
          %52 = llvm.getelementptr inbounds %42[4] : (!llvm.ptr) -> !llvm.ptr, i64
          %53 = llvm.load %52 : !llvm.ptr -> i64
          %54 = llvm.getelementptr inbounds %13[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %53, %54 : i64, !llvm.ptr
          %55 = llvm.getelementptr inbounds %42[5] : (!llvm.ptr) -> !llvm.ptr, i64
          %56 = llvm.load %55 : !llvm.ptr -> i64
          %57 = llvm.getelementptr inbounds %13[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %56, %57 : i64, !llvm.ptr
          %58 = llvm.getelementptr inbounds %42[6] : (!llvm.ptr) -> !llvm.ptr, i64
          %59 = llvm.load %58 : !llvm.ptr -> i64
          %60 = llvm.getelementptr inbounds %13[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %59, %60 : i64, !llvm.ptr
          %61 = llvm.getelementptr inbounds %42[7] : (!llvm.ptr) -> !llvm.ptr, i64
          %62 = llvm.load %61 : !llvm.ptr -> i64
          %63 = llvm.getelementptr inbounds %13[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %62, %63 : i64, !llvm.ptr
          %64 = llvm.call @iree_uk_pack(%16, %37, %6, %4, %18, %41, %7, %11, %2, %3, %2, %2, %11, %4, %1, %5, %13) : (!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32
          llvm.return %10 : i32
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
