module attributes {stream.affinity.default = #hal.device.affinity<@__device_0>} {
  util.global private @__device_0 = #hal.device.target<"local", [#hal.executable.target<"llvm-cpu", "embedded-elf-x86_64", {cpu = "alderlake", cpu_features = "+adx,+aes,+avx,+avx2,+avxvnni,+bmi,+bmi2,+clflushopt,+clwb,+cmov,+crc32,+cx16,+cx8,+f16c,+fma,+fsgsbase,+fxsr,+gfni,+hreset,+invpcid,+kl,+lzcnt,+mmx,+movbe,+movdir64b,+movdiri,+pclmul,+pconfig,+pku,+popcnt,+prfchw,+ptwrite,+rdpid,+rdrnd,+rdseed,+sahf,+serialize,+sgx,+sha,+shstk,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+vaes,+vpclmulqdq,+waitpkg,+widekl,+x87,+xsave,+xsavec,+xsaveopt,+xsaves", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 32 : i64, target_triple = "x86_64-unknown-unknown-eabi-elf", ukernels = "all"}>]> : !hal.device
  hal.executable private @gemm_dispatch_0 {
    hal.executable.variant public @embedded_elf_x86_64 target(<"llvm-cpu", "embedded-elf-x86_64", {cpu = "alderlake", cpu_features = "+adx,+aes,+avx,+avx2,+avxvnni,+bmi,+bmi2,+clflushopt,+clwb,+cmov,+crc32,+cx16,+cx8,+f16c,+fma,+fsgsbase,+fxsr,+gfni,+hreset,+invpcid,+kl,+lzcnt,+mmx,+movbe,+movdir64b,+movdiri,+pclmul,+pconfig,+pku,+popcnt,+prfchw,+ptwrite,+rdpid,+rdrnd,+rdseed,+sahf,+serialize,+sgx,+sha,+shstk,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+vaes,+vpclmulqdq,+waitpkg,+widekl,+x87,+xsave,+xsavec,+xsaveopt,+xsaves", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 32 : i64, target_triple = "x86_64-unknown-unknown-eabi-elf", ukernels = "all"}>) {
      hal.executable.export public @gemm_dispatch_0_matmul_2048x2048x2048_f32 ordinal(0) layout(#hal.pipeline.layout<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) count(%arg0: !hal.device) -> (index, index, index) {
        %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
        hal.return %x, %y, %z : index, index, index
      }
      builtin.module {
        func.func @gemm_dispatch_0_matmul_2048x2048x2048_f32() attributes {translation_info = #iree_codegen.translation_info<pipeline = #iree_cpu.pipeline<Mmt4dTilingExpert>>} {
          %cst = arith.constant 0.000000e+00 : f32
          %c0 = arith.constant 0 : index
          %c16777216 = arith.constant 16777216 : index
          %0 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : memref<256x2048x8x1xf32, #hal.descriptor_type<storage_buffer>>
          %1 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c16777216) flags("ReadOnly|Indirect") : memref<256x2048x8x1xf32, strided<[16384, 8, 1, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
          %2 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%c0) flags(Indirect) : memref<2048x2048xf32, #hal.descriptor_type<storage_buffer>>
          %3 = iree_codegen.load_from_buffer %0 : memref<256x2048x8x1xf32, #hal.descriptor_type<storage_buffer>> -> tensor<256x2048x8x1xf32>
          %4 = iree_codegen.load_from_buffer %1 : memref<256x2048x8x1xf32, strided<[16384, 8, 1, 1], offset: ?>, #hal.descriptor_type<storage_buffer>> -> tensor<256x2048x8x1xf32>
          %5 = tensor.empty() : tensor<256x256x8x8xf32>
          %6 = linalg.fill {lowering_config = #iree_cpu.lowering_config<vector_common_parallel = [1, 1, 8, 8]>} ins(%cst : f32) outs(%5 : tensor<256x256x8x8xf32>) -> tensor<256x256x8x8xf32>
          %7 = linalg.mmt4d {lowering_config = #iree_cpu.lowering_config<distribution = [1, 2, 0, 0, 0, 0], vector_common_parallel = [1, 1, 0, 8, 8, 0], vector_reduction = [0, 0, 1, 0, 0, 1]>} ins(%3, %4 : tensor<256x2048x8x1xf32>, tensor<256x2048x8x1xf32>) outs(%6 : tensor<256x256x8x8xf32>) -> tensor<256x256x8x8xf32>
          %8 = tensor.empty() : tensor<2048x2048xf32>
          %unpack = linalg.unpack %7 outer_dims_perm = [0, 1] inner_dims_pos = [0, 1] inner_tiles = [8, 8] into %8 {lowering_config = #iree_cpu.lowering_config<vector_common_parallel = [8, 8]>} : tensor<256x256x8x8xf32> -> tensor<2048x2048xf32>
          iree_codegen.store_to_buffer %unpack, %2 : tensor<2048x2048xf32> into memref<2048x2048xf32, #hal.descriptor_type<storage_buffer>>
          return
        }
        iree_codegen.dispatch_config @gemm_dispatch_0_matmul_2048x2048x2048_f32 {
        ^bb0(%arg0: !hal.device):
          %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
          iree_codegen.yield %x, %y, %z : index, index, index
        }
      }
    }
  }
  hal.executable private @_encoding_0 {
    hal.executable.variant public @embedded_elf_x86_64 target(<"llvm-cpu", "embedded-elf-x86_64", {cpu = "alderlake", cpu_features = "+adx,+aes,+avx,+avx2,+avxvnni,+bmi,+bmi2,+clflushopt,+clwb,+cmov,+crc32,+cx16,+cx8,+f16c,+fma,+fsgsbase,+fxsr,+gfni,+hreset,+invpcid,+kl,+lzcnt,+mmx,+movbe,+movdir64b,+movdiri,+pclmul,+pconfig,+pku,+popcnt,+prfchw,+ptwrite,+rdpid,+rdrnd,+rdseed,+sahf,+serialize,+sgx,+sha,+shstk,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+vaes,+vpclmulqdq,+waitpkg,+widekl,+x87,+xsave,+xsavec,+xsaveopt,+xsaves", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 32 : i64, target_triple = "x86_64-unknown-unknown-eabi-elf", ukernels = "all"}>) {
      hal.executable.export public @_encoding_0_encode_2048x2048xf32_to_2048x2048xf32 ordinal(0) layout(#hal.pipeline.layout<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) count(%arg0: !hal.device) -> (index, index, index) {
        %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
        hal.return %x, %y, %z : index, index, index
      }
      builtin.module {
        func.func @_encoding_0_encode_2048x2048xf32_to_2048x2048xf32() attributes {translation_info = #iree_codegen.translation_info<pipeline = #iree_cpu.pipeline<DataTiling>>} {
          %c0 = arith.constant 0 : index
          %0 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : memref<2048x2048xf32, #hal.descriptor_type<storage_buffer>>
          %1 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%c0) flags(Indirect) : memref<256x2048x8x1xf32, #hal.descriptor_type<storage_buffer>>
          %2 = iree_codegen.load_from_buffer %0 : memref<2048x2048xf32, #hal.descriptor_type<storage_buffer>> -> tensor<2048x2048xf32>
          %3 = tensor.empty() : tensor<256x2048x8x1xf32>
          %pack = linalg.pack %2 outer_dims_perm = [0, 1] inner_dims_pos = [0, 1] inner_tiles = [8, 1] into %3 {lowering_config = #iree_cpu.lowering_config<distribution = [64, 64], vector_common_parallel = [1, 1]>} : tensor<2048x2048xf32> -> tensor<256x2048x8x1xf32>
          iree_codegen.store_to_buffer %pack, %1 : tensor<256x2048x8x1xf32> into memref<256x2048x8x1xf32, #hal.descriptor_type<storage_buffer>>
          return
        }
        iree_codegen.dispatch_config @_encoding_0_encode_2048x2048xf32_to_2048x2048xf32 {
        ^bb0(%arg0: !hal.device):
          %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
          iree_codegen.yield %x, %y, %z : index, index, index
        }
      }
    }
  }
  hal.executable private @_encoding_1 {
    hal.executable.variant public @embedded_elf_x86_64 target(<"llvm-cpu", "embedded-elf-x86_64", {cpu = "alderlake", cpu_features = "+adx,+aes,+avx,+avx2,+avxvnni,+bmi,+bmi2,+clflushopt,+clwb,+cmov,+crc32,+cx16,+cx8,+f16c,+fma,+fsgsbase,+fxsr,+gfni,+hreset,+invpcid,+kl,+lzcnt,+mmx,+movbe,+movdir64b,+movdiri,+pclmul,+pconfig,+pku,+popcnt,+prfchw,+ptwrite,+rdpid,+rdrnd,+rdseed,+sahf,+serialize,+sgx,+sha,+shstk,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+vaes,+vpclmulqdq,+waitpkg,+widekl,+x87,+xsave,+xsavec,+xsaveopt,+xsaves", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 32 : i64, target_triple = "x86_64-unknown-unknown-eabi-elf", ukernels = "all"}>) {
      hal.executable.export public @_encoding_1_encode_2048x2048xf32_to_2048x2048xf32 ordinal(0) layout(#hal.pipeline.layout<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) count(%arg0: !hal.device) -> (index, index, index) {
        %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
        hal.return %x, %y, %z : index, index, index
      }
      builtin.module {
        func.func @_encoding_1_encode_2048x2048xf32_to_2048x2048xf32() attributes {translation_info = #iree_codegen.translation_info<pipeline = #iree_cpu.pipeline<DataTiling>>} {
          %c0 = arith.constant 0 : index
          %c16777216 = arith.constant 16777216 : index
          %0 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : memref<2048x2048xf32, #hal.descriptor_type<storage_buffer>>
          %1 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%c16777216) flags(Indirect) : memref<256x2048x8x1xf32, strided<[16384, 8, 1, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
          %2 = iree_codegen.load_from_buffer %0 : memref<2048x2048xf32, #hal.descriptor_type<storage_buffer>> -> tensor<2048x2048xf32>
          %3 = tensor.empty() : tensor<256x2048x8x1xf32>
          %pack = linalg.pack %2 outer_dims_perm = [1, 0] inner_dims_pos = [1, 0] inner_tiles = [8, 1] into %3 {lowering_config = #iree_cpu.lowering_config<distribution = [64, 64], vector_common_parallel = [1, 1]>} : tensor<2048x2048xf32> -> tensor<256x2048x8x1xf32>
          iree_codegen.store_to_buffer %pack, %1 : tensor<256x2048x8x1xf32> into memref<256x2048x8x1xf32, strided<[16384, 8, 1, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
          return
        }
        iree_codegen.dispatch_config @_encoding_1_encode_2048x2048xf32_to_2048x2048xf32 {
        ^bb0(%arg0: !hal.device):
          %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
          iree_codegen.yield %x, %y, %z : index, index, index
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
