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
          %1 = llvm.mlir.constant(8 : i64) : i64
          %2 = llvm.mlir.constant(0 : i32) : i32
          %3 = llvm.mlir.constant(4194304 : index) : i64
          %4 = llvm.mlir.constant(-1 : index) : i64
          %5 = llvm.mlir.constant(16 : index) : i64
          %6 = llvm.mlir.constant(64 : index) : i64
          %7 = llvm.mlir.constant(16384 : index) : i64
          %8 = llvm.mlir.constant(128 : index) : i64
          %9 = llvm.mlir.constant(0 : index) : i64
          %10 = llvm.mlir.constant(8 : index) : i64
          %11 = llvm.mlir.constant(1 : index) : i64
          %12 = llvm.mlir.constant(2048 : index) : i64
          %13 = llvm.mlir.constant(8 : i32) : i32
          %14 = llvm.mlir.constant(1 : i32) : i32
          %15 = llvm.mlir.constant(1537 : i32) : i32
          %16 = llvm.mlir.constant(2 : index) : i64
          %17 = llvm.alloca %6 x f32 {alignment = 64 : i64} : (i64) -> !llvm.ptr
          %18 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %19 = llvm.extractvalue %18[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %20 = llvm.load %19 : !llvm.ptr -> !llvm.ptr
          %21 = llvm.getelementptr %19[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %22 = llvm.load %21 : !llvm.ptr -> !llvm.ptr
          %23 = llvm.load %arg2 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)>
          %24 = llvm.extractvalue %23[0] : !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)>
          %25 = llvm.zext %24 : i32 to i64
          %26 = llvm.sdiv %25, %8 : i64
          %27 = llvm.mul %26, %8 : i64
          %28 = llvm.icmp "ne" %25, %27 : i64
          %29 = llvm.icmp "slt" %25, %9 : i64
          %30 = llvm.and %28, %29 : i1
          %31 = llvm.add %26, %4 : i64
          %32 = llvm.select %30, %31, %26 : i1, i64
          %33 = llvm.srem %25, %8 : i64
          %34 = llvm.icmp "slt" %33, %9 : i64
          %35 = llvm.add %33, %8 overflow<nsw> : i64
          %36 = llvm.select %34, %35, %33 : i1, i64
          %37 = llvm.mul %36, %16 overflow<nsw> : i64
          %38 = llvm.mul %32, %10 overflow<nsw> : i64
          %39 = llvm.mul %36, %5 overflow<nsw> : i64
          llvm.br ^bb1(%9 : i64)
        ^bb1(%40: i64):  // 2 preds: ^bb0, ^bb2
          %41 = llvm.icmp "slt" %40, %16 : i64
          llvm.cond_br %41, ^bb2, ^bb3
        ^bb2:  // pred: ^bb1
          %42 = llvm.add %40, %37 : i64
          %43 = llvm.mul %32, %7 overflow<nsw> : i64
          %44 = llvm.mul %42, %7 overflow<nsw> : i64
          %45 = llvm.add %44, %3 : i64
          %46 = llvm.getelementptr inbounds %arg0[4] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %47 = llvm.alloca %1 x i64 {alignment = 8 : i64} : (i64) -> !llvm.ptr
          %48 = llvm.load %46 : !llvm.ptr -> i64
          %49 = llvm.or %48, %0 : i64
          llvm.store %49, %47 : i64, !llvm.ptr
          %50 = llvm.getelementptr inbounds %46[1] : (!llvm.ptr) -> !llvm.ptr, i64
          %51 = llvm.load %50 : !llvm.ptr -> i64
          %52 = llvm.getelementptr inbounds %47[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %51, %52 : i64, !llvm.ptr
          %53 = llvm.getelementptr inbounds %46[2] : (!llvm.ptr) -> !llvm.ptr, i64
          %54 = llvm.load %53 : !llvm.ptr -> i64
          %55 = llvm.getelementptr inbounds %47[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %54, %55 : i64, !llvm.ptr
          %56 = llvm.getelementptr inbounds %46[3] : (!llvm.ptr) -> !llvm.ptr, i64
          %57 = llvm.load %56 : !llvm.ptr -> i64
          %58 = llvm.getelementptr inbounds %47[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %57, %58 : i64, !llvm.ptr
          %59 = llvm.getelementptr inbounds %46[4] : (!llvm.ptr) -> !llvm.ptr, i64
          %60 = llvm.load %59 : !llvm.ptr -> i64
          %61 = llvm.getelementptr inbounds %47[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %60, %61 : i64, !llvm.ptr
          %62 = llvm.getelementptr inbounds %46[5] : (!llvm.ptr) -> !llvm.ptr, i64
          %63 = llvm.load %62 : !llvm.ptr -> i64
          %64 = llvm.getelementptr inbounds %47[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %63, %64 : i64, !llvm.ptr
          %65 = llvm.getelementptr inbounds %46[6] : (!llvm.ptr) -> !llvm.ptr, i64
          %66 = llvm.load %65 : !llvm.ptr -> i64
          %67 = llvm.getelementptr inbounds %47[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %66, %67 : i64, !llvm.ptr
          %68 = llvm.getelementptr inbounds %46[7] : (!llvm.ptr) -> !llvm.ptr, i64
          %69 = llvm.load %68 : !llvm.ptr -> i64
          %70 = llvm.getelementptr inbounds %47[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %69, %70 : i64, !llvm.ptr
          %71 = llvm.call @iree_uk_mmt4d(%20, %43, %7, %20, %45, %7, %17, %9, %6, %11, %11, %12, %13, %13, %14, %15, %47) : (!llvm.ptr, i64, i64, !llvm.ptr, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i32, i32, i32, i32, !llvm.ptr) -> i32
          %72 = llvm.mul %40, %10 overflow<nsw> : i64
          %73 = llvm.mul %38, %12 overflow<nsw> : i64
          %74 = llvm.add %73, %72 : i64
          %75 = llvm.add %74, %39 : i64
          %76 = llvm.alloca %1 x i64 {alignment = 8 : i64} : (i64) -> !llvm.ptr
          %77 = llvm.load %46 : !llvm.ptr -> i64
          %78 = llvm.or %77, %0 : i64
          llvm.store %78, %76 : i64, !llvm.ptr
          %79 = llvm.load %50 : !llvm.ptr -> i64
          %80 = llvm.getelementptr inbounds %76[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %79, %80 : i64, !llvm.ptr
          %81 = llvm.load %53 : !llvm.ptr -> i64
          %82 = llvm.getelementptr inbounds %76[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %81, %82 : i64, !llvm.ptr
          %83 = llvm.load %56 : !llvm.ptr -> i64
          %84 = llvm.getelementptr inbounds %76[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %83, %84 : i64, !llvm.ptr
          %85 = llvm.load %59 : !llvm.ptr -> i64
          %86 = llvm.getelementptr inbounds %76[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %85, %86 : i64, !llvm.ptr
          %87 = llvm.load %62 : !llvm.ptr -> i64
          %88 = llvm.getelementptr inbounds %76[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %87, %88 : i64, !llvm.ptr
          %89 = llvm.load %65 : !llvm.ptr -> i64
          %90 = llvm.getelementptr inbounds %76[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %89, %90 : i64, !llvm.ptr
          %91 = llvm.load %68 : !llvm.ptr -> i64
          %92 = llvm.getelementptr inbounds %76[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %91, %92 : i64, !llvm.ptr
          %93 = llvm.call @iree_uk_unpack(%17, %9, %6, %6, %22, %75, %12, %11, %11, %11, %10, %10, %10, %10, %14, %76) : (!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32
          %94 = llvm.add %40, %11 : i64
          llvm.br ^bb1(%94 : i64)
        ^bb3:  // pred: ^bb1
          llvm.return %2 : i32
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
          %1 = llvm.mlir.constant(8 : i64) : i64
          %2 = llvm.mlir.constant(0 : i32) : i32
          %3 = llvm.mlir.constant(-1 : index) : i64
          %4 = llvm.mlir.constant(16384 : index) : i64
          %5 = llvm.mlir.constant(2048 : index) : i64
          %6 = llvm.mlir.constant(32 : index) : i64
          %7 = llvm.mlir.constant(1 : i32) : i32
          %8 = llvm.mlir.constant(1 : index) : i64
          %9 = llvm.mlir.constant(8 : index) : i64
          %10 = llvm.mlir.constant(64 : index) : i64
          %11 = llvm.mlir.constant(512 : index) : i64
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
          %22 = llvm.sdiv %21, %6 : i64
          %23 = llvm.mul %22, %6 : i64
          %24 = llvm.icmp "ne" %21, %23 : i64
          %25 = llvm.icmp "slt" %21, %13 : i64
          %26 = llvm.and %24, %25 : i1
          %27 = llvm.add %22, %3 : i64
          %28 = llvm.select %26, %27, %22 : i1, i64
          %29 = llvm.srem %21, %6 : i64
          %30 = llvm.icmp "slt" %29, %13 : i64
          %31 = llvm.add %29, %6 overflow<nsw> : i64
          %32 = llvm.select %30, %31, %29 : i1, i64
          %33 = llvm.mul %28, %10 overflow<nsw> : i64
          %34 = llvm.mul %32, %10 overflow<nsw> : i64
          %35 = llvm.mul %28, %11 overflow<nsw> : i64
          %36 = llvm.mul %35, %5 overflow<nsw> : i64
          %37 = llvm.add %36, %34 : i64
          %38 = llvm.mul %33, %4 overflow<nsw> : i64
          %39 = llvm.mul %34, %9 overflow<nsw> : i64
          %40 = llvm.add %38, %39 : i64
          %41 = llvm.getelementptr inbounds %arg0[4] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %42 = llvm.alloca %1 x i64 {alignment = 8 : i64} : (i64) -> !llvm.ptr
          %43 = llvm.load %41 : !llvm.ptr -> i64
          %44 = llvm.or %43, %0 : i64
          llvm.store %44, %42 : i64, !llvm.ptr
          %45 = llvm.getelementptr inbounds %41[1] : (!llvm.ptr) -> !llvm.ptr, i64
          %46 = llvm.load %45 : !llvm.ptr -> i64
          %47 = llvm.getelementptr inbounds %42[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %46, %47 : i64, !llvm.ptr
          %48 = llvm.getelementptr inbounds %41[2] : (!llvm.ptr) -> !llvm.ptr, i64
          %49 = llvm.load %48 : !llvm.ptr -> i64
          %50 = llvm.getelementptr inbounds %42[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %49, %50 : i64, !llvm.ptr
          %51 = llvm.getelementptr inbounds %41[3] : (!llvm.ptr) -> !llvm.ptr, i64
          %52 = llvm.load %51 : !llvm.ptr -> i64
          %53 = llvm.getelementptr inbounds %42[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %52, %53 : i64, !llvm.ptr
          %54 = llvm.getelementptr inbounds %41[4] : (!llvm.ptr) -> !llvm.ptr, i64
          %55 = llvm.load %54 : !llvm.ptr -> i64
          %56 = llvm.getelementptr inbounds %42[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %55, %56 : i64, !llvm.ptr
          %57 = llvm.getelementptr inbounds %41[5] : (!llvm.ptr) -> !llvm.ptr, i64
          %58 = llvm.load %57 : !llvm.ptr -> i64
          %59 = llvm.getelementptr inbounds %42[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %58, %59 : i64, !llvm.ptr
          %60 = llvm.getelementptr inbounds %41[6] : (!llvm.ptr) -> !llvm.ptr, i64
          %61 = llvm.load %60 : !llvm.ptr -> i64
          %62 = llvm.getelementptr inbounds %42[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %61, %62 : i64, !llvm.ptr
          %63 = llvm.getelementptr inbounds %41[7] : (!llvm.ptr) -> !llvm.ptr, i64
          %64 = llvm.load %63 : !llvm.ptr -> i64
          %65 = llvm.getelementptr inbounds %42[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %64, %65 : i64, !llvm.ptr
          %66 = llvm.call @iree_uk_pack(%16, %37, %5, %8, %18, %40, %4, %9, %11, %10, %10, %10, %9, %8, %12, %7, %42) : (!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32
          llvm.return %2 : i32
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
          %1 = llvm.mlir.constant(8 : i64) : i64
          %2 = llvm.mlir.constant(0 : i32) : i32
          %3 = llvm.mlir.constant(4194304 : index) : i64
          %4 = llvm.mlir.constant(-1 : index) : i64
          %5 = llvm.mlir.constant(16384 : index) : i64
          %6 = llvm.mlir.constant(2048 : index) : i64
          %7 = llvm.mlir.constant(32 : index) : i64
          %8 = llvm.mlir.constant(769 : i32) : i32
          %9 = llvm.mlir.constant(1 : index) : i64
          %10 = llvm.mlir.constant(8 : index) : i64
          %11 = llvm.mlir.constant(512 : index) : i64
          %12 = llvm.mlir.constant(64 : index) : i64
          %13 = llvm.mlir.constant(0 : i64) : i64
          %14 = llvm.mlir.constant(0 : index) : i64
          %15 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %16 = llvm.extractvalue %15[10] : !llvm.struct<"iree_hal_executable_dispatch_state_v0_t", (i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr)>
          %17 = llvm.load %16 : !llvm.ptr -> !llvm.ptr
          %18 = llvm.getelementptr %16[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %19 = llvm.load %18 : !llvm.ptr -> !llvm.ptr
          %20 = llvm.load %arg2 : !llvm.ptr -> !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)>
          %21 = llvm.extractvalue %20[0] : !llvm.struct<"iree_hal_executable_workgroup_state_v0_t", (i32, i32, i16, i16, i32, ptr, i32)>
          %22 = llvm.zext %21 : i32 to i64
          %23 = llvm.sdiv %22, %7 : i64
          %24 = llvm.mul %23, %7 : i64
          %25 = llvm.icmp "ne" %22, %24 : i64
          %26 = llvm.icmp "slt" %22, %14 : i64
          %27 = llvm.and %25, %26 : i1
          %28 = llvm.add %23, %4 : i64
          %29 = llvm.select %27, %28, %23 : i1, i64
          %30 = llvm.srem %22, %7 : i64
          %31 = llvm.icmp "slt" %30, %14 : i64
          %32 = llvm.add %30, %7 overflow<nsw> : i64
          %33 = llvm.select %31, %32, %30 : i1, i64
          %34 = llvm.mul %29, %12 overflow<nsw> : i64
          %35 = llvm.mul %33, %12 overflow<nsw> : i64
          %36 = llvm.mul %29, %11 overflow<nsw> : i64
          %37 = llvm.mul %35, %6 overflow<nsw> : i64
          %38 = llvm.add %37, %36 : i64
          %39 = llvm.mul %34, %5 overflow<nsw> : i64
          %40 = llvm.mul %35, %10 overflow<nsw> : i64
          %41 = llvm.add %39, %40 : i64
          %42 = llvm.add %41, %3 : i64
          %43 = llvm.getelementptr inbounds %arg0[4] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
          %44 = llvm.alloca %1 x i64 {alignment = 8 : i64} : (i64) -> !llvm.ptr
          %45 = llvm.load %43 : !llvm.ptr -> i64
          %46 = llvm.or %45, %0 : i64
          llvm.store %46, %44 : i64, !llvm.ptr
          %47 = llvm.getelementptr inbounds %43[1] : (!llvm.ptr) -> !llvm.ptr, i64
          %48 = llvm.load %47 : !llvm.ptr -> i64
          %49 = llvm.getelementptr inbounds %44[1] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %48, %49 : i64, !llvm.ptr
          %50 = llvm.getelementptr inbounds %43[2] : (!llvm.ptr) -> !llvm.ptr, i64
          %51 = llvm.load %50 : !llvm.ptr -> i64
          %52 = llvm.getelementptr inbounds %44[2] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %51, %52 : i64, !llvm.ptr
          %53 = llvm.getelementptr inbounds %43[3] : (!llvm.ptr) -> !llvm.ptr, i64
          %54 = llvm.load %53 : !llvm.ptr -> i64
          %55 = llvm.getelementptr inbounds %44[3] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %54, %55 : i64, !llvm.ptr
          %56 = llvm.getelementptr inbounds %43[4] : (!llvm.ptr) -> !llvm.ptr, i64
          %57 = llvm.load %56 : !llvm.ptr -> i64
          %58 = llvm.getelementptr inbounds %44[4] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %57, %58 : i64, !llvm.ptr
          %59 = llvm.getelementptr inbounds %43[5] : (!llvm.ptr) -> !llvm.ptr, i64
          %60 = llvm.load %59 : !llvm.ptr -> i64
          %61 = llvm.getelementptr inbounds %44[5] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %60, %61 : i64, !llvm.ptr
          %62 = llvm.getelementptr inbounds %43[6] : (!llvm.ptr) -> !llvm.ptr, i64
          %63 = llvm.load %62 : !llvm.ptr -> i64
          %64 = llvm.getelementptr inbounds %44[6] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %63, %64 : i64, !llvm.ptr
          %65 = llvm.getelementptr inbounds %43[7] : (!llvm.ptr) -> !llvm.ptr, i64
          %66 = llvm.load %65 : !llvm.ptr -> i64
          %67 = llvm.getelementptr inbounds %44[7] : (!llvm.ptr) -> !llvm.ptr, i64
          llvm.store %66, %67 : i64, !llvm.ptr
          %68 = llvm.call @iree_uk_pack(%17, %38, %6, %9, %19, %42, %5, %10, %12, %11, %12, %12, %10, %9, %13, %8, %44) : (!llvm.ptr, i64, i64, i64, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, !llvm.ptr) -> i32
          llvm.return %2 : i32
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
