module attributes {stream.affinity.default = #hal.device.affinity<@__device_0>} {
  util.global private @__device_0 = #hal.device.target<"local", [#hal.executable.target<"llvm-cpu", "embedded-elf-arm_64", {cpu = "apple-m2", cpu_features = "+v8.6a,+aes,+bf16,+complxnum,+crc,+dotprod,+fp-armv8,+fp16fml,+fpac,+fullfp16,+i8mm,+jsconv,+lse,+neon,+pauth,+perfmon,+ras,+rcpc,+rdm,+sha2,+sha3,+ssbs,+reserve-x18", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128-Fn32", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 16 : i64, target_triple = "arm64-unknown-unknown-eabi-elf", ukernels = "all"}>]> : !hal.device
  hal.executable private @gemm_dispatch_0 {
    hal.executable.variant public @embedded_elf_arm_64 target(<"llvm-cpu", "embedded-elf-arm_64", {cpu = "apple-m2", cpu_features = "+v8.6a,+aes,+bf16,+complxnum,+crc,+dotprod,+fp-armv8,+fp16fml,+fpac,+fullfp16,+i8mm,+jsconv,+lse,+neon,+pauth,+perfmon,+ras,+rcpc,+rdm,+sha2,+sha3,+ssbs,+reserve-x18", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128-Fn32", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 16 : i64, target_triple = "arm64-unknown-unknown-eabi-elf", ukernels = "all"}>) {
      hal.executable.export public @gemm_dispatch_0_matmul_32x64x64_f32 ordinal(0) layout(#hal.pipeline.layout<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) count(%arg0: !hal.device) -> (index, index, index) {
        %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
        hal.return %x, %y, %z : index, index, index
      }
      builtin.module {
        func.func @gemm_dispatch_0_matmul_32x64x64_f32() attributes {translation_info = #iree_codegen.translation_info<pipeline = #iree_cpu.pipeline<Mmt4dTilingExpert>>} {
          %cst = arith.constant 0.000000e+00 : f32
          %c0 = arith.constant 0 : index
          %c8192 = arith.constant 8192 : index
          %0 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : memref<4x64x8x1xf32, #hal.descriptor_type<storage_buffer>>
          %1 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c8192) flags("ReadOnly|Indirect") : memref<8x64x8x1xf32, strided<[512, 8, 1, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
          %2 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%c0) flags(Indirect) : memref<32x64xf32, #hal.descriptor_type<storage_buffer>>
          %3 = iree_codegen.load_from_buffer %0 : memref<4x64x8x1xf32, #hal.descriptor_type<storage_buffer>> -> tensor<4x64x8x1xf32>
          %4 = iree_codegen.load_from_buffer %1 : memref<8x64x8x1xf32, strided<[512, 8, 1, 1], offset: ?>, #hal.descriptor_type<storage_buffer>> -> tensor<8x64x8x1xf32>
          %5 = tensor.empty() : tensor<4x8x8x8xf32>
          %6 = linalg.fill {lowering_config = #iree_cpu.lowering_config<vector_common_parallel = [1, 1, 8, 8]>} ins(%cst : f32) outs(%5 : tensor<4x8x8x8xf32>) -> tensor<4x8x8x8xf32>
          %7 = linalg.mmt4d {lowering_config = #iree_cpu.lowering_config<distribution = [2, 2, 0, 0, 0, 0], vector_common_parallel = [1, 1, 0, 8, 8, 0], vector_reduction = [0, 0, 1, 0, 0, 1]>} ins(%3, %4 : tensor<4x64x8x1xf32>, tensor<8x64x8x1xf32>) outs(%6 : tensor<4x8x8x8xf32>) -> tensor<4x8x8x8xf32>
          %8 = tensor.empty() : tensor<32x64xf32>
          %unpack = linalg.unpack %7 outer_dims_perm = [0, 1] inner_dims_pos = [0, 1] inner_tiles = [8, 8] into %8 {lowering_config = #iree_cpu.lowering_config<vector_common_parallel = [8, 8]>} : tensor<4x8x8x8xf32> -> tensor<32x64xf32>
          iree_codegen.store_to_buffer %unpack, %2 : tensor<32x64xf32> into memref<32x64xf32, #hal.descriptor_type<storage_buffer>>
          return
        }
        iree_codegen.dispatch_config @gemm_dispatch_0_matmul_32x64x64_f32 {
        ^bb0(%arg0: !hal.device):
          %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
          iree_codegen.yield %x, %y, %z : index, index, index
        }
      }
    }
  }
  hal.executable private @_encoding_0 {
    hal.executable.variant public @embedded_elf_arm_64 target(<"llvm-cpu", "embedded-elf-arm_64", {cpu = "apple-m2", cpu_features = "+v8.6a,+aes,+bf16,+complxnum,+crc,+dotprod,+fp-armv8,+fp16fml,+fpac,+fullfp16,+i8mm,+jsconv,+lse,+neon,+pauth,+perfmon,+ras,+rcpc,+rdm,+sha2,+sha3,+ssbs,+reserve-x18", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128-Fn32", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 16 : i64, target_triple = "arm64-unknown-unknown-eabi-elf", ukernels = "all"}>) {
      hal.executable.export public @_encoding_0_encode_32x64xf32_to_32x64xf32 ordinal(0) layout(#hal.pipeline.layout<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) count(%arg0: !hal.device) -> (index, index, index) {
        %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
        hal.return %x, %y, %z : index, index, index
      }
      builtin.module {
        func.func @_encoding_0_encode_32x64xf32_to_32x64xf32() attributes {translation_info = #iree_codegen.translation_info<pipeline = #iree_cpu.pipeline<DataTiling>, {enable_decomposition}>} {
          %c0 = arith.constant 0 : index
          %0 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : memref<32x64xf32, #hal.descriptor_type<storage_buffer>>
          %1 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%c0) flags(Indirect) : memref<4x64x8x1xf32, #hal.descriptor_type<storage_buffer>>
          %2 = iree_codegen.load_from_buffer %0 : memref<32x64xf32, #hal.descriptor_type<storage_buffer>> -> tensor<32x64xf32>
          %3 = tensor.empty() : tensor<4x64x8x1xf32>
          %pack = linalg.pack %2 outer_dims_perm = [0, 1] inner_dims_pos = [0, 1] inner_tiles = [8, 1] into %3 {lowering_config = #iree_cpu.lowering_config<distribution = [1, 32], vector_common_parallel = [1, 1]>} : tensor<32x64xf32> -> tensor<4x64x8x1xf32>
          iree_codegen.store_to_buffer %pack, %1 : tensor<4x64x8x1xf32> into memref<4x64x8x1xf32, #hal.descriptor_type<storage_buffer>>
          return
        }
        iree_codegen.dispatch_config @_encoding_0_encode_32x64xf32_to_32x64xf32 {
        ^bb0(%arg0: !hal.device):
          %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
          iree_codegen.yield %x, %y, %z : index, index, index
        }
      }
    }
  }
  hal.executable private @_encoding_1 {
    hal.executable.variant public @embedded_elf_arm_64 target(<"llvm-cpu", "embedded-elf-arm_64", {cpu = "apple-m2", cpu_features = "+v8.6a,+aes,+bf16,+complxnum,+crc,+dotprod,+fp-armv8,+fp16fml,+fpac,+fullfp16,+i8mm,+jsconv,+lse,+neon,+pauth,+perfmon,+ras,+rcpc,+rdm,+sha2,+sha3,+ssbs,+reserve-x18", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128-Fn32", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 16 : i64, target_triple = "arm64-unknown-unknown-eabi-elf", ukernels = "all"}>) {
      hal.executable.export public @_encoding_1_encode_64x64xf32_to_64x64xf32 ordinal(0) layout(#hal.pipeline.layout<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) count(%arg0: !hal.device) -> (index, index, index) {
        %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
        hal.return %x, %y, %z : index, index, index
      }
      builtin.module {
        func.func @_encoding_1_encode_64x64xf32_to_64x64xf32() attributes {translation_info = #iree_codegen.translation_info<pipeline = #iree_cpu.pipeline<DataTiling>, {enable_decomposition}>} {
          %c0 = arith.constant 0 : index
          %c8192 = arith.constant 8192 : index
          %0 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : memref<64x64xf32, #hal.descriptor_type<storage_buffer>>
          %1 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%c8192) flags(Indirect) : memref<8x64x8x1xf32, strided<[512, 8, 1, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
          %2 = iree_codegen.load_from_buffer %0 : memref<64x64xf32, #hal.descriptor_type<storage_buffer>> -> tensor<64x64xf32>
          %3 = tensor.empty() : tensor<8x64x8x1xf32>
          %pack = linalg.pack %2 outer_dims_perm = [1, 0] inner_dims_pos = [1, 0] inner_tiles = [8, 1] into %3 {lowering_config = #iree_cpu.lowering_config<distribution = [1, 64], vector_common_parallel = [1, 1]>} : tensor<64x64xf32> -> tensor<8x64x8x1xf32>
          iree_codegen.store_to_buffer %pack, %1 : tensor<8x64x8x1xf32> into memref<8x64x8x1xf32, strided<[512, 8, 1, 1], offset: ?>, #hal.descriptor_type<storage_buffer>>
          return
        }
        iree_codegen.dispatch_config @_encoding_1_encode_64x64xf32_to_64x64xf32 {
        ^bb0(%arg0: !hal.device):
          %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
          iree_codegen.yield %x, %y, %z : index, index, index
        }
      }
    }
  }
  util.func public @gemm(%arg0: !hal.buffer_view, %arg1: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @gemm(%input0: tensor<32x64xf32>, %input1: tensor<64x64xf32>) -> (%output0: tensor<32x64xf32>)"}} {
    %c24576 = arith.constant 24576 : index
    %c0 = arith.constant 0 : index
    %c16384 = arith.constant 16384 : index
    %c8192 = arith.constant 8192 : index
    %c64 = arith.constant 64 : index
    %c32 = arith.constant 32 : index
    %element_type_f32 = hal.element_type<f32> : i32
    %dense_row_major = hal.encoding_type<dense_row_major> : i32
    hal.buffer_view.assert<%arg0 : !hal.buffer_view> message("input0") shape([%c32, %c64]) type(%element_type_f32) encoding(%dense_row_major)
    %0 = stream.tensor.import on(#hal.device.affinity<@__device_0>) %arg0 : !hal.buffer_view -> tensor<32x64xf32> in !stream.resource<external>{%c8192}
    hal.buffer_view.assert<%arg1 : !hal.buffer_view> message("input1") shape([%c64, %c64]) type(%element_type_f32) encoding(%dense_row_major)
    %1 = stream.tensor.import on(#hal.device.affinity<@__device_0>) %arg1 : !hal.buffer_view -> tensor<64x64xf32> in !stream.resource<external>{%c16384}
    %result, %result_timepoint = stream.resource.alloca uninitialized on(#hal.device.affinity<@__device_0>) : !stream.resource<external>{%c8192} => !stream.timepoint
    %result_0, %result_timepoint_1 = stream.resource.alloca uninitialized on(#hal.device.affinity<@__device_0>) : !stream.resource<transient>{%c24576} => !stream.timepoint
    %2 = stream.timepoint.join max(%result_timepoint, %result_timepoint_1) => !stream.timepoint
    %3 = stream.cmd.execute on(#hal.device.affinity<@__device_0>) await(%2) => with(%0 as %arg2: !stream.resource<external>{%c8192}, %1 as %arg3: !stream.resource<external>{%c16384}, %result as %arg4: !stream.resource<external>{%c8192}, %result_0 as %arg5: !stream.resource<transient>{%c24576}) {
      stream.cmd.concurrent {
        stream.cmd.dispatch @_encoding_0::@embedded_elf_arm_64::@_encoding_0_encode_32x64xf32_to_32x64xf32 {
          ro %arg2[%c0 for %c8192] : !stream.resource<external>{%c8192},
          wo %arg5[%c0 for %c24576] : !stream.resource<transient>{%c24576}
        }
        stream.cmd.dispatch @_encoding_1::@embedded_elf_arm_64::@_encoding_1_encode_64x64xf32_to_64x64xf32 {
          ro %arg3[%c0 for %c16384] : !stream.resource<external>{%c16384},
          wo %arg5[%c0 for %c24576] : !stream.resource<transient>{%c24576}
        }
      }
      stream.cmd.dispatch @gemm_dispatch_0::@embedded_elf_arm_64::@gemm_dispatch_0_matmul_32x64x64_f32 {
        ro %arg5[%c0 for %c24576] : !stream.resource<transient>{%c24576},
        wo %arg4[%c0 for %c8192] : !stream.resource<external>{%c8192}
      }
    } => !stream.timepoint
    %4 = stream.resource.dealloca on(#hal.device.affinity<@__device_0>) await(%3) => %result_0 : !stream.resource<transient>{%c24576} => !stream.timepoint
    %5 = stream.timepoint.await %4 => %result : !stream.resource<external>{%c8192}
    %6 = stream.tensor.export on(#hal.device.affinity<@__device_0>) %5 : tensor<32x64xf32> in !stream.resource<external>{%c8192} -> !hal.buffer_view
    util.return %6 : !hal.buffer_view
  }
}