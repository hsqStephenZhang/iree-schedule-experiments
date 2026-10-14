// -----// IR Dump After LowerUKernelOpsToCallsPass: iree-codegen-lower-ukernel-ops-to-calls //----- //
module {
  func.func private @iree_uk_unpack(memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i32) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
  func.func private @iree_uk_mmt4d(memref<f32>, index, index, memref<f32>, index, index, memref<f32>, index, index, index, index, index, i32, i32, i32, i32) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
  func.func @gemm_dispatch_0_matmul_4096x4096x4096_f32() {
    %c67108864 = arith.constant 67108864 : index
    %c0 = arith.constant 0 : index
    %c8 = arith.constant 8 : index
    %c1 = arith.constant 1 : index
    %c4096 = arith.constant 4096 : index
    %c8_i32 = arith.constant 8 : i32
    %c1_i32 = arith.constant 1 : i32
    %c1537_i32 = arith.constant 1537 : i32
    %alloca = memref.alloca() alignment = 64 : memref<1x1x8x8xf32>
    %0 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : memref<512x4096x8x1xf32>
    %assume_align = memref.assume_alignment %0, 64 : memref<512x4096x8x1xf32>
    %1 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c67108864) flags("ReadOnly|Indirect") : memref<512x4096x8x1xf32, strided<[32768, 8, 1, 1], offset: ?>>
    %assume_align_0 = memref.assume_alignment %1, 64 : memref<512x4096x8x1xf32, strided<[32768, 8, 1, 1], offset: ?>>
    %2 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%c0) flags(Indirect) : memref<4096x4096xf32>
    %assume_align_1 = memref.assume_alignment %2, 64 : memref<4096x4096xf32>
    %workgroup_id_x = hal.interface.workgroup.id[0] : index
    %workgroup_count_x = hal.interface.workgroup.count[0] : index
    %c512 = arith.constant 512 : index
    %c0_2 = arith.constant 0 : index
    %3 = arith.floordivsi %workgroup_id_x, %c512 : index
    %4 = arith.remsi %workgroup_id_x, %c512 : index
    %5 = arith.cmpi slt, %4, %c0_2 : index
    %6 = arith.addi %4, %c512 overflow<nsw> : index
    %7 = arith.select %5, %6, %4 : index
    %subview = memref.subview %assume_align_0[%7, 0, 0, 0] [1, 4096, 8, 1] [1, 1, 1, 1] : memref<512x4096x8x1xf32, strided<[32768, 8, 1, 1], offset: ?>> to memref<1x4096x8x1xf32, strided<[32768, 8, 1, 1], offset: ?>>
    %subview_3 = memref.subview %assume_align[%3, 0, 0, 0] [1, 4096, 8, 1] [1, 1, 1, 1] : memref<512x4096x8x1xf32> to memref<1x4096x8x1xf32, strided<[32768, 8, 1, 1], offset: ?>>
    %c8_4 = arith.constant 8 : index
    %8 = arith.muli %3, %c8_4 overflow<nsw> : index
    %c8_5 = arith.constant 8 : index
    %9 = arith.muli %7, %c8_5 overflow<nsw> : index
    %subview_6 = memref.subview %assume_align_1[%8, %9] [8, 8] [1, 1] : memref<4096x4096xf32> to memref<8x8xf32, strided<[4096, 1], offset: ?>>
    %base_buffer, %offset, %sizes:4, %strides:4 = memref.extract_strided_metadata %subview_3 : memref<1x4096x8x1xf32, strided<[32768, 8, 1, 1], offset: ?>> -> memref<f32>, index, index, index, index, index, index, index, index, index
    %base_buffer_7, %offset_8, %sizes_9:4, %strides_10:4 = memref.extract_strided_metadata %subview : memref<1x4096x8x1xf32, strided<[32768, 8, 1, 1], offset: ?>> -> memref<f32>, index, index, index, index, index, index, index, index, index
    %base_buffer_11, %offset_12, %sizes_13:4, %strides_14:4 = memref.extract_strided_metadata %alloca : memref<1x1x8x8xf32> -> memref<f32>, index, index, index, index, index, index, index, index, index
    %10 = call @iree_uk_mmt4d(%base_buffer, %offset, %strides#0, %base_buffer_7, %offset_8, %strides_10#0, %base_buffer_11, %offset_12, %strides_14#0, %c1, %c1, %c4096, %c8_i32, %c8_i32, %c1_i32, %c1537_i32) : (memref<f32>, index, index, memref<f32>, index, index, memref<f32>, index, index, index, index, index, i32, i32, i32, i32) -> i32
    %base_buffer_15, %offset_16, %sizes_17:4, %strides_18:4 = memref.extract_strided_metadata %alloca : memref<1x1x8x8xf32> -> memref<f32>, index, index, index, index, index, index, index, index, index
    %base_buffer_19, %offset_20, %sizes_21:2, %strides_22:2 = memref.extract_strided_metadata %subview_6 : memref<8x8xf32, strided<[4096, 1], offset: ?>> -> memref<f32>, index, index, index, index, index
    %11 = call @iree_uk_unpack(%base_buffer_15, %offset_16, %strides_18#0, %strides_18#1, %base_buffer_19, %offset_20, %strides_22#0, %strides_22#1, %c1, %c1, %c8, %c8, %c8, %c8, %c1_i32) : (memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i32) -> i32
    return
  }
  iree_codegen.dispatch_config @gemm_dispatch_0_matmul_4096x4096x4096_f32 workgroup_size = [1, 1, 1] {
  ^bb0(%arg0: !hal.device):
    %c262144 = arith.constant 262144 : index
    %c1 = arith.constant 1 : index
    %c1_0 = arith.constant 1 : index
    iree_codegen.yield %c262144, %c1, %c1_0 : index, index, index
  }
}


// -----// IR Dump After LowerUKernelOpsToCallsPass: iree-codegen-lower-ukernel-ops-to-calls //----- //
module {
  func.func private @iree_uk_pack(memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i64, i32) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
  func.func @_encoding_0_encode_4096x4096xf32_to_4096x4096xf32() {
    %c1_i32 = arith.constant 1 : i32
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    %c64 = arith.constant 64 : index
    %c512 = arith.constant 512 : index
    %c0_i64 = arith.constant 0 : i64
    %c0 = arith.constant 0 : index
    %0 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : memref<4096x4096xf32>
    %assume_align = memref.assume_alignment %0, 64 : memref<4096x4096xf32>
    %1 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%c0) flags(Indirect) : memref<512x4096x8x1xf32>
    %assume_align_0 = memref.assume_alignment %1, 64 : memref<512x4096x8x1xf32>
    %workgroup_id_x = hal.interface.workgroup.id[0] : index
    %workgroup_count_x = hal.interface.workgroup.count[0] : index
    %c64_1 = arith.constant 64 : index
    %c0_2 = arith.constant 0 : index
    %2 = arith.floordivsi %workgroup_id_x, %c64_1 : index
    %3 = arith.remsi %workgroup_id_x, %c64_1 : index
    %4 = arith.cmpi slt, %3, %c0_2 : index
    %5 = arith.addi %3, %c64_1 overflow<nsw> : index
    %6 = arith.select %4, %5, %3 : index
    %c64_3 = arith.constant 64 : index
    %7 = arith.muli %2, %c64_3 overflow<nsw> : index
    %c64_4 = arith.constant 64 : index
    %8 = arith.muli %6, %c64_4 overflow<nsw> : index
    %c8_5 = arith.constant 8 : index
    %9 = arith.muli %7, %c8_5 overflow<nsw> : index
    %subview = memref.subview %assume_align_0[%7, %8, 0, 0] [64, 64, 8, 1] [1, 1, 1, 1] : memref<512x4096x8x1xf32> to memref<64x64x8x1xf32, strided<[32768, 8, 1, 1], offset: ?>>
    %subview_6 = memref.subview %assume_align[%9, %8] [512, 64] [1, 1] : memref<4096x4096xf32> to memref<512x64xf32, strided<[4096, 1], offset: ?>>
    %base_buffer, %offset, %sizes:2, %strides:2 = memref.extract_strided_metadata %subview_6 : memref<512x64xf32, strided<[4096, 1], offset: ?>> -> memref<f32>, index, index, index, index, index
    %base_buffer_7, %offset_8, %sizes_9:4, %strides_10:4 = memref.extract_strided_metadata %subview : memref<64x64x8x1xf32, strided<[32768, 8, 1, 1], offset: ?>> -> memref<f32>, index, index, index, index, index, index, index, index, index
    %10 = call @iree_uk_pack(%base_buffer, %offset, %strides#0, %strides#1, %base_buffer_7, %offset_8, %strides_10#0, %strides_10#1, %c512, %c64, %c64, %c64, %c8, %c1, %c0_i64, %c1_i32) : (memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i64, i32) -> i32
    return
  }
  iree_codegen.dispatch_config @_encoding_0_encode_4096x4096xf32_to_4096x4096xf32 workgroup_size = [1, 1, 1] {
  ^bb0(%arg0: !hal.device):
    %c512 = arith.constant 512 : index
    %c1 = arith.constant 1 : index
    %c1_0 = arith.constant 1 : index
    iree_codegen.yield %c512, %c1, %c1_0 : index, index, index
  }
}


// -----// IR Dump After LowerUKernelOpsToCallsPass: iree-codegen-lower-ukernel-ops-to-calls //----- //
module {
  func.func private @iree_uk_pack(memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i64, i32) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
  func.func @_encoding_1_encode_4096x4096xf32_to_4096x4096xf32() {
    %c769_i32 = arith.constant 769 : i32
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    %c512 = arith.constant 512 : index
    %c64 = arith.constant 64 : index
    %c0_i64 = arith.constant 0 : i64
    %c0 = arith.constant 0 : index
    %c67108864 = arith.constant 67108864 : index
    %0 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : memref<4096x4096xf32>
    %assume_align = memref.assume_alignment %0, 64 : memref<4096x4096xf32>
    %1 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%c67108864) flags(Indirect) : memref<512x4096x8x1xf32, strided<[32768, 8, 1, 1], offset: ?>>
    %assume_align_0 = memref.assume_alignment %1, 64 : memref<512x4096x8x1xf32, strided<[32768, 8, 1, 1], offset: ?>>
    %workgroup_id_x = hal.interface.workgroup.id[0] : index
    %workgroup_count_x = hal.interface.workgroup.count[0] : index
    %c64_1 = arith.constant 64 : index
    %c0_2 = arith.constant 0 : index
    %2 = arith.floordivsi %workgroup_id_x, %c64_1 : index
    %3 = arith.remsi %workgroup_id_x, %c64_1 : index
    %4 = arith.cmpi slt, %3, %c0_2 : index
    %5 = arith.addi %3, %c64_1 overflow<nsw> : index
    %6 = arith.select %4, %5, %3 : index
    %c64_3 = arith.constant 64 : index
    %7 = arith.muli %2, %c64_3 overflow<nsw> : index
    %c64_4 = arith.constant 64 : index
    %8 = arith.muli %6, %c64_4 overflow<nsw> : index
    %c8_5 = arith.constant 8 : index
    %9 = arith.muli %7, %c8_5 overflow<nsw> : index
    %subview = memref.subview %assume_align_0[%7, %8, 0, 0] [64, 64, 8, 1] [1, 1, 1, 1] : memref<512x4096x8x1xf32, strided<[32768, 8, 1, 1], offset: ?>> to memref<64x64x8x1xf32, strided<[32768, 8, 1, 1], offset: ?>>
    %subview_6 = memref.subview %assume_align[%8, %9] [64, 512] [1, 1] : memref<4096x4096xf32> to memref<64x512xf32, strided<[4096, 1], offset: ?>>
    %base_buffer, %offset, %sizes:2, %strides:2 = memref.extract_strided_metadata %subview_6 : memref<64x512xf32, strided<[4096, 1], offset: ?>> -> memref<f32>, index, index, index, index, index
    %base_buffer_7, %offset_8, %sizes_9:4, %strides_10:4 = memref.extract_strided_metadata %subview : memref<64x64x8x1xf32, strided<[32768, 8, 1, 1], offset: ?>> -> memref<f32>, index, index, index, index, index, index, index, index, index
    %10 = call @iree_uk_pack(%base_buffer, %offset, %strides#0, %strides#1, %base_buffer_7, %offset_8, %strides_10#0, %strides_10#1, %c64, %c512, %c64, %c64, %c8, %c1, %c0_i64, %c769_i32) : (memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i64, i32) -> i32
    return
  }
  iree_codegen.dispatch_config @_encoding_1_encode_4096x4096xf32_to_4096x4096xf32 workgroup_size = [1, 1, 1] {
  ^bb0(%arg0: !hal.device):
    %c512 = arith.constant 512 : index
    %c1 = arith.constant 1 : index
    %c1_0 = arith.constant 1 : index
    iree_codegen.yield %c512, %c1, %c1_0 : index, index, index
  }
}
