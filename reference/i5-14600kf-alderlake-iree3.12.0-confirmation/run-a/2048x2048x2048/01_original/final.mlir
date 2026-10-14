module attributes {stream.affinity.default = #hal.device.affinity<@__device_0>} {
  util.global private @__device_0 = #hal.device.target<"local", [#hal.executable.target<"llvm-cpu", "embedded-elf-x86_64", {cpu = "alderlake", cpu_features = "+adx,+aes,+avx,+avx2,+avxvnni,+bmi,+bmi2,+clflushopt,+clwb,+cmov,+crc32,+cx16,+cx8,+f16c,+fma,+fsgsbase,+fxsr,+gfni,+hreset,+invpcid,+kl,+lzcnt,+mmx,+movbe,+movdir64b,+movdiri,+pclmul,+pconfig,+pku,+popcnt,+prfchw,+ptwrite,+rdpid,+rdrnd,+rdseed,+sahf,+serialize,+sgx,+sha,+shstk,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+vaes,+vpclmulqdq,+waitpkg,+widekl,+x87,+xsave,+xsavec,+xsaveopt,+xsaves", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 32 : i64, target_triple = "x86_64-unknown-unknown-eabi-elf", ukernels = "all"}>]> : !hal.device
  hal.executable private @gemm_dispatch_0 {
    hal.executable.variant public @embedded_elf_x86_64 target(<"llvm-cpu", "embedded-elf-x86_64", {cpu = "alderlake", cpu_features = "+adx,+aes,+avx,+avx2,+avxvnni,+bmi,+bmi2,+clflushopt,+clwb,+cmov,+crc32,+cx16,+cx8,+f16c,+fma,+fsgsbase,+fxsr,+gfni,+hreset,+invpcid,+kl,+lzcnt,+mmx,+movbe,+movdir64b,+movdiri,+pclmul,+pconfig,+pku,+popcnt,+prfchw,+ptwrite,+rdpid,+rdrnd,+rdseed,+sahf,+serialize,+sgx,+sha,+shstk,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+vaes,+vpclmulqdq,+waitpkg,+widekl,+x87,+xsave,+xsavec,+xsaveopt,+xsaves", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 32 : i64, target_triple = "x86_64-unknown-unknown-eabi-elf", ukernels = "all"}>) {
      hal.executable.export public @gemm_dispatch_0_matmul_2048x2048x2048_f32 ordinal(0) layout(#hal.pipeline.layout<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) count(%arg0: !hal.device) -> (index, index, index) {
        %c32768 = arith.constant 32768 : index
        %c1 = arith.constant 1 : index
        hal.return %c32768, %c1, %c1 : index, index, index
      } attributes {workgroup_size = [1 : index, 1 : index, 1 : index]}
      builtin.module attributes {llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-unknown-eabi-elf"} {
        llvm.func @iree_uk_unpack(!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
        llvm.func @iree_uk_mmt4d(!llvm.ptr, i64, i64, !llvm.ptr, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i32, i32, i32, i32, !llvm.ptr) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
        llvm.func @gemm_dispatch_0_matmul_2048x2048x2048_f32(%arg0: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg1: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg2: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}) -> i32 {
          %0 = llvm.mlir.constant(52239 : i64) : i64
          %1 = llvm.mlir.constant(2 : i64) : i64
          %2 = llvm.mlir.constant(1537 : i32) : i32
          %3 = llvm.mlir.constant(1 : i32) : i32
          %4 = llvm.mlir.constant(8 : i32) : i32
          %5 = llvm.mlir.constant(2048 : i64) : i64
          %6 = llvm.mlir.constant(1 : i64) : i64
          %7 = llvm.mlir.constant(0 : i64) : i64
          %8 = llvm.mlir.constant(128 : i64) : i64
          %9 = llvm.mlir.constant(16384 : i64) : i64
          %10 = llvm.mlir.constant(64 : i64) : i64
          %11 = llvm.mlir.constant(16 : i64) : i64
          %12 = llvm.mlir.constant(-1 : i64) : i64
          %13 = llvm.mlir.constant(4194304 : i64) : i64
          %14 = llvm.mlir.constant(0 : i32) : i32
          %15 = llvm.mlir.constant(8 : i64) : i64
          %16 = llvm.alloca %3 x !llvm.array<8 x i64> {alignment = 8 : i64} : (i32) -> !llvm.ptr
          %17 = llvm.alloca %3 x !llvm.array<8 x i64> {alignment = 8 : i64} : (i32) -> !llvm.ptr
          %18 = llvm.alloca %3 x !llvm.array<64 x f32> {alignment = 64 : i64} : (i32) -> !llvm.ptr
          %19 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %20 = llvm.extractvalue %19[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %21 = llvm.load %20 : !llvm.ptr -> !llvm.ptr
          %22 = llvm.getelementptr %20[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %23 = llvm.load %22 : !llvm.ptr -> !llvm.ptr
          %24 = llvm.load %arg2 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)>
          %25 = llvm.extractvalue %24[0] : !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)>
          %26 = llvm.zext %25 : i32 to i64
          %27 = llvm.sdiv %26, %8 : i64
          %28 = llvm.mul %27, %8 : i64
          %29 = llvm.icmp "ne" %26, %28 : i64
          %30 = llvm.icmp "slt" %26, %7 : i64
          %31 = llvm.and %29, %30 : i1
          %32 = llvm.add %27, %12 : i64
          %33 = llvm.select %31, %32, %27 : i1, i64
          %34 = llvm.srem %26, %8 : i64
          %35 = llvm.icmp "slt" %34, %7 : i64
          %36 = llvm.add %34, %8 overflow<nsw> : i64
          %37 = llvm.select %35, %36, %34 : i1, i64
          %38 = llvm.mul %37, %1 overflow<nsw> : i64
          %39 = llvm.mul %33, %15 overflow<nsw> : i64
          %40 = llvm.mul %37, %11 overflow<nsw> : i64
          llvm.br ^bb1(%7 : i64)
        ^bb1(%41: i64):  // 2 preds: ^bb0, ^bb2
          %42 = llvm.icmp "slt" %41, %1 : i64
          llvm.cond_br %42, ^bb2, ^bb3
        ^bb2:  // pred: ^bb1
          %43 = llvm.add %41, %38 : i64
          %44 = llvm.mul %33, %9 overflow<nsw> : i64
          %45 = llvm.mul %43, %9 overflow<nsw> : i64
          %46 = llvm.add %45, %13 : i64
          %47 = llvm.getelementptr inbounds %arg0[4] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          llvm.store %0, %16 : i64, !llvm.ptr
          %48 = llvm.getelementptr inbounds %47[1] : (!llvm.ptr) -> !llvm.ptr, i64
          %49 = llvm.load %48 : !llvm.ptr -> i64
          %50 = llvm.getelementptr inbounds %16[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %49, %50 : i64, !llvm.ptr
          %51 = llvm.getelementptr inbounds %47[2] : (!llvm.ptr) -> !llvm.ptr, i64
          %52 = llvm.load %51 : !llvm.ptr -> i64
          %53 = llvm.getelementptr inbounds %16[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %52, %53 : i64, !llvm.ptr
          %54 = llvm.getelementptr inbounds %47[3] : (!llvm.ptr) -> !llvm.ptr, i64
          %55 = llvm.load %54 : !llvm.ptr -> i64
          %56 = llvm.getelementptr inbounds %16[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %55, %56 : i64, !llvm.ptr
          %57 = llvm.getelementptr inbounds %47[4] : (!llvm.ptr) -> !llvm.ptr, i64
          %58 = llvm.load %57 : !llvm.ptr -> i64
          %59 = llvm.getelementptr inbounds %16[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %58, %59 : i64, !llvm.ptr
          %60 = llvm.getelementptr inbounds %47[5] : (!llvm.ptr) -> !llvm.ptr, i64
          %61 = llvm.load %60 : !llvm.ptr -> i64
          %62 = llvm.getelementptr inbounds %16[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %61, %62 : i64, !llvm.ptr
          %63 = llvm.getelementptr inbounds %47[6] : (!llvm.ptr) -> !llvm.ptr, i64
          %64 = llvm.load %63 : !llvm.ptr -> i64
          %65 = llvm.getelementptr inbounds %16[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %64, %65 : i64, !llvm.ptr
          %66 = llvm.getelementptr inbounds %47[7] : (!llvm.ptr) -> !llvm.ptr, i64
          %67 = llvm.load %66 : !llvm.ptr -> i64
          %68 = llvm.getelementptr inbounds %16[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %67, %68 : i64, !llvm.ptr
          %69 = llvm.call @iree_uk_mmt4d(%21, %44, %9, %21, %46, %9, %18, %7, %10, %6, %6, %5, %4, %4, %3, %2, %16) : (!llvm.ptr, i64, i64, !llvm.ptr, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i32, i32, i32, i32, !llvm.ptr) -> i32
          %70 = llvm.mul %41, %15 overflow<nsw> : i64
          %71 = llvm.mul %39, %5 overflow<nsw> : i64
          %72 = llvm.add %71, %70 : i64
          %73 = llvm.add %72, %40 : i64
          llvm.store %0, %17 : i64, !llvm.ptr
          %74 = llvm.load %48 : !llvm.ptr -> i64
          %75 = llvm.getelementptr inbounds %17[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %74, %75 : i64, !llvm.ptr
          %76 = llvm.load %51 : !llvm.ptr -> i64
          %77 = llvm.getelementptr inbounds %17[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %76, %77 : i64, !llvm.ptr
          %78 = llvm.load %54 : !llvm.ptr -> i64
          %79 = llvm.getelementptr inbounds %17[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %78, %79 : i64, !llvm.ptr
          %80 = llvm.load %57 : !llvm.ptr -> i64
          %81 = llvm.getelementptr inbounds %17[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %80, %81 : i64, !llvm.ptr
          %82 = llvm.load %60 : !llvm.ptr -> i64
          %83 = llvm.getelementptr inbounds %17[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %82, %83 : i64, !llvm.ptr
          %84 = llvm.load %63 : !llvm.ptr -> i64
          %85 = llvm.getelementptr inbounds %17[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %84, %85 : i64, !llvm.ptr
          %86 = llvm.load %66 : !llvm.ptr -> i64
          %87 = llvm.getelementptr inbounds %17[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %86, %87 : i64, !llvm.ptr
          %88 = llvm.call @iree_uk_unpack(%18, %7, %10, %10, %23, %73, %5, %6, %6, %6, %15, %15, %15, %15, %3, %17) : (!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32
          %89 = llvm.add %41, %6 : i64
          llvm.br ^bb1(%89 : i64)
        ^bb3:  // pred: ^bb1
          llvm.return %14 : i32
        }
      }
    }
  }
  hal.executable private @_encoding_0 {
    hal.executable.variant public @embedded_elf_x86_64 target(<"llvm-cpu", "embedded-elf-x86_64", {cpu = "alderlake", cpu_features = "+adx,+aes,+avx,+avx2,+avxvnni,+bmi,+bmi2,+clflushopt,+clwb,+cmov,+crc32,+cx16,+cx8,+f16c,+fma,+fsgsbase,+fxsr,+gfni,+hreset,+invpcid,+kl,+lzcnt,+mmx,+movbe,+movdir64b,+movdiri,+pclmul,+pconfig,+pku,+popcnt,+prfchw,+ptwrite,+rdpid,+rdrnd,+rdseed,+sahf,+serialize,+sgx,+sha,+shstk,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+vaes,+vpclmulqdq,+waitpkg,+widekl,+x87,+xsave,+xsavec,+xsaveopt,+xsaves", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 32 : i64, target_triple = "x86_64-unknown-unknown-eabi-elf", ukernels = "all"}>) {
      hal.executable.export public @_encoding_0_encode_2048x2048xf32_to_2048x2048xf32 ordinal(0) layout(#hal.pipeline.layout<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) count(%arg0: !hal.device) -> (index, index, index) {
        %c128 = arith.constant 128 : index
        %c1 = arith.constant 1 : index
        hal.return %c128, %c1, %c1 : index, index, index
      } attributes {workgroup_size = [1 : index, 1 : index, 1 : index]}
      builtin.module attributes {llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-unknown-eabi-elf"} {
        llvm.func @iree_uk_pack(!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
        llvm.func @_encoding_0_encode_2048x2048xf32_to_2048x2048xf32(%arg0: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg1: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg2: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}) -> i32 {
          %0 = llvm.mlir.constant(52239 : i64) : i64
          %1 = llvm.mlir.constant(0 : i64) : i64
          %2 = llvm.mlir.constant(512 : i64) : i64
          %3 = llvm.mlir.constant(64 : i64) : i64
          %4 = llvm.mlir.constant(1 : i64) : i64
          %5 = llvm.mlir.constant(1 : i32) : i32
          %6 = llvm.mlir.constant(32 : i64) : i64
          %7 = llvm.mlir.constant(2048 : i64) : i64
          %8 = llvm.mlir.constant(16384 : i64) : i64
          %9 = llvm.mlir.constant(-1 : i64) : i64
          %10 = llvm.mlir.constant(0 : i32) : i32
          %11 = llvm.mlir.constant(8 : i64) : i64
          %12 = llvm.alloca %5 x !llvm.array<8 x i64> {alignment = 8 : i64} : (i32) -> !llvm.ptr
          %13 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %14 = llvm.extractvalue %13[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %15 = llvm.load %14 : !llvm.ptr -> !llvm.ptr
          %16 = llvm.getelementptr %14[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %17 = llvm.load %16 : !llvm.ptr -> !llvm.ptr
          %18 = llvm.load %arg2 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)>
          %19 = llvm.extractvalue %18[0] : !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)>
          %20 = llvm.zext %19 : i32 to i64
          %21 = llvm.sdiv %20, %6 : i64
          %22 = llvm.mul %21, %6 : i64
          %23 = llvm.icmp "ne" %20, %22 : i64
          %24 = llvm.icmp "slt" %20, %1 : i64
          %25 = llvm.and %23, %24 : i1
          %26 = llvm.add %21, %9 : i64
          %27 = llvm.select %25, %26, %21 : i1, i64
          %28 = llvm.srem %20, %6 : i64
          %29 = llvm.icmp "slt" %28, %1 : i64
          %30 = llvm.add %28, %6 overflow<nsw> : i64
          %31 = llvm.select %29, %30, %28 : i1, i64
          %32 = llvm.mul %27, %3 overflow<nsw> : i64
          %33 = llvm.mul %31, %3 overflow<nsw> : i64
          %34 = llvm.mul %27, %2 overflow<nsw> : i64
          %35 = llvm.mul %34, %7 overflow<nsw> : i64
          %36 = llvm.add %35, %33 : i64
          %37 = llvm.mul %32, %8 overflow<nsw> : i64
          %38 = llvm.mul %33, %11 overflow<nsw> : i64
          %39 = llvm.add %37, %38 : i64
          %40 = llvm.getelementptr inbounds %arg0[4] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          llvm.store %0, %12 : i64, !llvm.ptr
          %41 = llvm.getelementptr inbounds %40[1] : (!llvm.ptr) -> !llvm.ptr, i64
          %42 = llvm.load %41 : !llvm.ptr -> i64
          %43 = llvm.getelementptr inbounds %12[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %42, %43 : i64, !llvm.ptr
          %44 = llvm.getelementptr inbounds %40[2] : (!llvm.ptr) -> !llvm.ptr, i64
          %45 = llvm.load %44 : !llvm.ptr -> i64
          %46 = llvm.getelementptr inbounds %12[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %45, %46 : i64, !llvm.ptr
          %47 = llvm.getelementptr inbounds %40[3] : (!llvm.ptr) -> !llvm.ptr, i64
          %48 = llvm.load %47 : !llvm.ptr -> i64
          %49 = llvm.getelementptr inbounds %12[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %48, %49 : i64, !llvm.ptr
          %50 = llvm.getelementptr inbounds %40[4] : (!llvm.ptr) -> !llvm.ptr, i64
          %51 = llvm.load %50 : !llvm.ptr -> i64
          %52 = llvm.getelementptr inbounds %12[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %51, %52 : i64, !llvm.ptr
          %53 = llvm.getelementptr inbounds %40[5] : (!llvm.ptr) -> !llvm.ptr, i64
          %54 = llvm.load %53 : !llvm.ptr -> i64
          %55 = llvm.getelementptr inbounds %12[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %54, %55 : i64, !llvm.ptr
          %56 = llvm.getelementptr inbounds %40[6] : (!llvm.ptr) -> !llvm.ptr, i64
          %57 = llvm.load %56 : !llvm.ptr -> i64
          %58 = llvm.getelementptr inbounds %12[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %57, %58 : i64, !llvm.ptr
          %59 = llvm.getelementptr inbounds %40[7] : (!llvm.ptr) -> !llvm.ptr, i64
          %60 = llvm.load %59 : !llvm.ptr -> i64
          %61 = llvm.getelementptr inbounds %12[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %60, %61 : i64, !llvm.ptr
          %62 = llvm.call @iree_uk_pack(%15, %36, %7, %4, %17, %39, %8, %11, %2, %3, %3, %3, %11, %4, %1, %5, %12) : (!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32
          llvm.return %10 : i32
        }
      }
    }
  }
  hal.executable private @_encoding_1 {
    hal.executable.variant public @embedded_elf_x86_64 target(<"llvm-cpu", "embedded-elf-x86_64", {cpu = "alderlake", cpu_features = "+adx,+aes,+avx,+avx2,+avxvnni,+bmi,+bmi2,+clflushopt,+clwb,+cmov,+crc32,+cx16,+cx8,+f16c,+fma,+fsgsbase,+fxsr,+gfni,+hreset,+invpcid,+kl,+lzcnt,+mmx,+movbe,+movdir64b,+movdiri,+pclmul,+pconfig,+pku,+popcnt,+prfchw,+ptwrite,+rdpid,+rdrnd,+rdseed,+sahf,+serialize,+sgx,+sha,+shstk,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+vaes,+vpclmulqdq,+waitpkg,+widekl,+x87,+xsave,+xsavec,+xsaveopt,+xsaves", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 32 : i64, target_triple = "x86_64-unknown-unknown-eabi-elf", ukernels = "all"}>) {
      hal.executable.export public @_encoding_1_encode_2048x2048xf32_to_2048x2048xf32 ordinal(0) layout(#hal.pipeline.layout<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) count(%arg0: !hal.device) -> (index, index, index) {
        %c128 = arith.constant 128 : index
        %c1 = arith.constant 1 : index
        hal.return %c128, %c1, %c1 : index, index, index
      } attributes {workgroup_size = [1 : index, 1 : index, 1 : index]}
      builtin.module attributes {llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-unknown-eabi-elf"} {
        llvm.func @iree_uk_pack(!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
        llvm.func @_encoding_1_encode_2048x2048xf32_to_2048x2048xf32(%arg0: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg1: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}, %arg2: !llvm.ptr {llvm.align = 16 : i64, llvm.noalias, llvm.nonnull, llvm.noundef}) -> i32 {
          %0 = llvm.mlir.constant(52239 : i64) : i64
          %1 = llvm.mlir.constant(0 : i64) : i64
          %2 = llvm.mlir.constant(64 : i64) : i64
          %3 = llvm.mlir.constant(512 : i64) : i64
          %4 = llvm.mlir.constant(1 : i64) : i64
          %5 = llvm.mlir.constant(769 : i32) : i32
          %6 = llvm.mlir.constant(32 : i64) : i64
          %7 = llvm.mlir.constant(2048 : i64) : i64
          %8 = llvm.mlir.constant(16384 : i64) : i64
          %9 = llvm.mlir.constant(-1 : i64) : i64
          %10 = llvm.mlir.constant(4194304 : i64) : i64
          %11 = llvm.mlir.constant(0 : i32) : i32
          %12 = llvm.mlir.constant(8 : i64) : i64
          %13 = llvm.mlir.constant(1 : i32) : i32
          %14 = llvm.alloca %13 x !llvm.array<8 x i64> {alignment = 8 : i64} : (i32) -> !llvm.ptr
          %15 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %16 = llvm.extractvalue %15[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %17 = llvm.load %16 : !llvm.ptr -> !llvm.ptr
          %18 = llvm.getelementptr %16[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %19 = llvm.load %18 : !llvm.ptr -> !llvm.ptr
          %20 = llvm.load %arg2 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)>
          %21 = llvm.extractvalue %20[0] : !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)>
          %22 = llvm.zext %21 : i32 to i64
          %23 = llvm.sdiv %22, %6 : i64
          %24 = llvm.mul %23, %6 : i64
          %25 = llvm.icmp "ne" %22, %24 : i64
          %26 = llvm.icmp "slt" %22, %1 : i64
          %27 = llvm.and %25, %26 : i1
          %28 = llvm.add %23, %9 : i64
          %29 = llvm.select %27, %28, %23 : i1, i64
          %30 = llvm.srem %22, %6 : i64
          %31 = llvm.icmp "slt" %30, %1 : i64
          %32 = llvm.add %30, %6 overflow<nsw> : i64
          %33 = llvm.select %31, %32, %30 : i1, i64
          %34 = llvm.mul %29, %2 overflow<nsw> : i64
          %35 = llvm.mul %33, %2 overflow<nsw> : i64
          %36 = llvm.mul %29, %3 overflow<nsw> : i64
          %37 = llvm.mul %35, %7 overflow<nsw> : i64
          %38 = llvm.add %37, %36 : i64
          %39 = llvm.mul %34, %8 overflow<nsw> : i64
          %40 = llvm.mul %35, %12 overflow<nsw> : i64
          %41 = llvm.add %39, %40 : i64
          %42 = llvm.add %41, %10 : i64
          %43 = llvm.getelementptr inbounds %arg0[4] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          llvm.store %0, %14 : i64, !llvm.ptr
          %44 = llvm.getelementptr inbounds %43[1] : (!llvm.ptr) -> !llvm.ptr, i64
          %45 = llvm.load %44 : !llvm.ptr -> i64
          %46 = llvm.getelementptr inbounds %14[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %45, %46 : i64, !llvm.ptr
          %47 = llvm.getelementptr inbounds %43[2] : (!llvm.ptr) -> !llvm.ptr, i64
          %48 = llvm.load %47 : !llvm.ptr -> i64
          %49 = llvm.getelementptr inbounds %14[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %48, %49 : i64, !llvm.ptr
          %50 = llvm.getelementptr inbounds %43[3] : (!llvm.ptr) -> !llvm.ptr, i64
          %51 = llvm.load %50 : !llvm.ptr -> i64
          %52 = llvm.getelementptr inbounds %14[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %51, %52 : i64, !llvm.ptr
          %53 = llvm.getelementptr inbounds %43[4] : (!llvm.ptr) -> !llvm.ptr, i64
          %54 = llvm.load %53 : !llvm.ptr -> i64
          %55 = llvm.getelementptr inbounds %14[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %54, %55 : i64, !llvm.ptr
          %56 = llvm.getelementptr inbounds %43[5] : (!llvm.ptr) -> !llvm.ptr, i64
          %57 = llvm.load %56 : !llvm.ptr -> i64
          %58 = llvm.getelementptr inbounds %14[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %57, %58 : i64, !llvm.ptr
          %59 = llvm.getelementptr inbounds %43[6] : (!llvm.ptr) -> !llvm.ptr, i64
          %60 = llvm.load %59 : !llvm.ptr -> i64
          %61 = llvm.getelementptr inbounds %14[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %60, %61 : i64, !llvm.ptr
          %62 = llvm.getelementptr inbounds %43[7] : (!llvm.ptr) -> !llvm.ptr, i64
          %63 = llvm.load %62 : !llvm.ptr -> i64
          %64 = llvm.getelementptr inbounds %14[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %63, %64 : i64, !llvm.ptr
          %65 = llvm.call @iree_uk_pack(%17, %38, %7, %4, %19, %42, %8, %12, %2, %3, %2, %2, %12, %4, %1, %5, %14) : (!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32
          llvm.return %11 : i32
        }
      }
    }
  }
  util.func public @gemm(%arg0: !hal.buffer_view, %arg1: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @gemm(%input0: tensor<2048x2048xf32>, %input1: tensor<2048x2048xf32>) -> (%output0: tensor<2048x2048xf32>)"}} {
    %c33554432 = arith.constant 33554432 : index
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
    %result_0, %result_timepoint_1 = stream.resource.alloca uninitialized on(#hal.device.affinity<@__device_0>) : !stream.resource<transient>{%c33554432} => !stream.timepoint
    %2 = stream.timepoint.join max(%result_timepoint, %result_timepoint_1) => !stream.timepoint
    %3 = stream.cmd.execute on(#hal.device.affinity<@__device_0>) await(%2) => with(%0 as %arg2: !stream.resource<external>{%c16777216}, %1 as %arg3: !stream.resource<external>{%c16777216}, %result as %arg4: !stream.resource<external>{%c16777216}, %result_0 as %arg5: !stream.resource<transient>{%c33554432}) {
      stream.cmd.concurrent {
        stream.cmd.dispatch @_encoding_0::@embedded_elf_x86_64::@_encoding_0_encode_2048x2048xf32_to_2048x2048xf32 {
          ro %arg2[%c0 for %c16777216] : !stream.resource<external>{%c16777216},
          wo %arg5[%c0 for %c33554432] : !stream.resource<transient>{%c33554432}
        }
        stream.cmd.dispatch @_encoding_1::@embedded_elf_x86_64::@_encoding_1_encode_2048x2048xf32_to_2048x2048xf32 {
          ro %arg3[%c0 for %c16777216] : !stream.resource<external>{%c16777216},
          wo %arg5[%c0 for %c33554432] : !stream.resource<transient>{%c33554432}
        }
      }
      stream.cmd.dispatch @gemm_dispatch_0::@embedded_elf_x86_64::@gemm_dispatch_0_matmul_2048x2048x2048_f32 {
        ro %arg5[%c0 for %c33554432] : !stream.resource<transient>{%c33554432},
        wo %arg4[%c0 for %c16777216] : !stream.resource<external>{%c16777216}
      }
    } => !stream.timepoint
    %4 = stream.resource.dealloca on(#hal.device.affinity<@__device_0>) await(%3) => %result_0 : !stream.resource<transient>{%c33554432} => !stream.timepoint
    %5 = stream.timepoint.await %4 => %result : !stream.resource<external>{%c16777216}
    %6 = stream.tensor.export on(#hal.device.affinity<@__device_0>) %5 : tensor<2048x2048xf32> in !stream.resource<external>{%c16777216} -> !hal.buffer_view
    util.return %6 : !hal.buffer_view
  }
}
