// -----// IR Dump After LowerUKernelOpsToCallsPass: iree-codegen-lower-ukernel-ops-to-calls //----- //
module {
  func.func private @iree_uk_unpack(memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i32) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
  func.func private @iree_uk_mmt4d(memref<f32>, index, index, memref<f32>, index, index, memref<f32>, index, index, index, index, index, i32, i32, i32, i32) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
  func.func @gemm_dispatch_0_matmul_2048x2048x2048_f32() {
    %c16777216 = arith.constant 16777216 : index
    %c0 = arith.constant 0 : index
    %c8 = arith.constant 8 : index
    %c1 = arith.constant 1 : index
    %c2048 = arith.constant 2048 : index
    %c8_i32 = arith.constant 8 : i32
    %c1_i32 = arith.constant 1 : i32
    %c1537_i32 = arith.constant 1537 : i32
    %c2 = arith.constant 2 : index
    %alloca = memref.alloca() {alignment = 64 : i64} : memref<1x1x8x8xf32>
    %0 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : memref<256x2048x8x1xf32>
    %assume_align = memref.assume_alignment %0, 64 : memref<256x2048x8x1xf32>
    %1 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c16777216) flags("ReadOnly|Indirect") : memref<256x2048x8x1xf32, strided<[16384, 8, 1, 1], offset: ?>>
    %assume_align_0 = memref.assume_alignment %1, 64 : memref<256x2048x8x1xf32, strided<[16384, 8, 1, 1], offset: ?>>
    %2 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%c0) flags(Indirect) : memref<2048x2048xf32>
    %assume_align_1 = memref.assume_alignment %2, 64 : memref<2048x2048xf32>
    %workgroup_id_x = hal.interface.workgroup.id[0] : index
    %workgroup_count_x = hal.interface.workgroup.count[0] : index
    %c128 = arith.constant 128 : index
    %c0_2 = arith.constant 0 : index
    %3 = arith.floordivsi %workgroup_id_x, %c128 : index
    %4 = arith.remsi %workgroup_id_x, %c128 : index
    %5 = arith.cmpi slt, %4, %c0_2 : index
    %6 = arith.addi %4, %c128 overflow<nsw> : index
    %7 = arith.select %5, %6, %4 : index
    %c2_3 = arith.constant 2 : index
    %8 = arith.muli %7, %c2_3 overflow<nsw> : index
    %c8_4 = arith.constant 8 : index
    %9 = arith.muli %3, %c8_4 overflow<nsw> : index
    %c8_5 = arith.constant 8 : index
    %10 = arith.muli %8, %c8_5 overflow<nsw> : index
    %subview = memref.subview %assume_align_1[%9, %10] [8, 16] [1, 1] : memref<2048x2048xf32> to memref<8x16xf32, strided<[2048, 1], offset: ?>>
    %subview_6 = memref.subview %assume_align[%3, 0, 0, 0] [1, 2048, 8, 1] [1, 1, 1, 1] : memref<256x2048x8x1xf32> to memref<1x2048x8x1xf32, strided<[16384, 8, 1, 1], offset: ?>>
    scf.for %arg0 = %c0 to %c2 step %c1 {
      %11 = arith.addi %arg0, %8 : index
      %subview_7 = memref.subview %assume_align_0[%11, 0, 0, 0] [1, 2048, 8, 1] [1, 1, 1, 1] : memref<256x2048x8x1xf32, strided<[16384, 8, 1, 1], offset: ?>> to memref<1x2048x8x1xf32, strided<[16384, 8, 1, 1], offset: ?>>
      %base_buffer, %offset, %sizes:4, %strides:4 = memref.extract_strided_metadata %subview_6 : memref<1x2048x8x1xf32, strided<[16384, 8, 1, 1], offset: ?>> -> memref<f32>, index, index, index, index, index, index, index, index, index
      %base_buffer_8, %offset_9, %sizes_10:4, %strides_11:4 = memref.extract_strided_metadata %subview_7 : memref<1x2048x8x1xf32, strided<[16384, 8, 1, 1], offset: ?>> -> memref<f32>, index, index, index, index, index, index, index, index, index
      %base_buffer_12, %offset_13, %sizes_14:4, %strides_15:4 = memref.extract_strided_metadata %alloca : memref<1x1x8x8xf32> -> memref<f32>, index, index, index, index, index, index, index, index, index
      %12 = func.call @iree_uk_mmt4d(%base_buffer, %offset, %strides#0, %base_buffer_8, %offset_9, %strides_11#0, %base_buffer_12, %offset_13, %strides_15#0, %c1, %c1, %c2048, %c8_i32, %c8_i32, %c1_i32, %c1537_i32) : (memref<f32>, index, index, memref<f32>, index, index, memref<f32>, index, index, index, index, index, i32, i32, i32, i32) -> i32
      %c8_16 = arith.constant 8 : index
      %13 = arith.muli %arg0, %c8_16 overflow<nsw> : index
      %subview_17 = memref.subview %subview[0, %13] [8, 8] [1, 1] : memref<8x16xf32, strided<[2048, 1], offset: ?>> to memref<8x8xf32, strided<[2048, 1], offset: ?>>
      %base_buffer_18, %offset_19, %sizes_20:4, %strides_21:4 = memref.extract_strided_metadata %alloca : memref<1x1x8x8xf32> -> memref<f32>, index, index, index, index, index, index, index, index, index
      %base_buffer_22, %offset_23, %sizes_24:2, %strides_25:2 = memref.extract_strided_metadata %subview_17 : memref<8x8xf32, strided<[2048, 1], offset: ?>> -> memref<f32>, index, index, index, index, index
      %14 = func.call @iree_uk_unpack(%base_buffer_18, %offset_19, %strides_21#0, %strides_21#1, %base_buffer_22, %offset_23, %strides_25#0, %strides_25#1, %c1, %c1, %c8, %c8, %c8, %c8, %c1_i32) : (memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i32) -> i32
    }
    return
  }
  iree_codegen.dispatch_config @gemm_dispatch_0_matmul_2048x2048x2048_f32 workgroup_size = [1, 1, 1] {
  ^bb0(%arg0: !hal.device):
    %c32768 = arith.constant 32768 : index
    %c1 = arith.constant 1 : index
    %c1_0 = arith.constant 1 : index
    iree_codegen.yield %c32768, %c1, %c1_0 : index, index, index
  }
}


// -----// IR Dump After LowerUKernelOpsToCallsPass: iree-codegen-lower-ukernel-ops-to-calls //----- //
module {
  func.func private @iree_uk_pack(memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i64, i32) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
  func.func @_encoding_0_encode_2048x2048xf32_to_2048x2048xf32() {
    %c1_i32 = arith.constant 1 : i32
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    %c64 = arith.constant 64 : index
    %c512 = arith.constant 512 : index
    %c0_i64 = arith.constant 0 : i64
    %c0 = arith.constant 0 : index
    %0 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : memref<2048x2048xf32>
    %assume_align = memref.assume_alignment %0, 64 : memref<2048x2048xf32>
    %1 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%c0) flags(Indirect) : memref<256x2048x8x1xf32>
    %assume_align_0 = memref.assume_alignment %1, 64 : memref<256x2048x8x1xf32>
    %workgroup_id_x = hal.interface.workgroup.id[0] : index
    %workgroup_count_x = hal.interface.workgroup.count[0] : index
    %c32 = arith.constant 32 : index
    %c0_1 = arith.constant 0 : index
    %2 = arith.floordivsi %workgroup_id_x, %c32 : index
    %3 = arith.remsi %workgroup_id_x, %c32 : index
    %4 = arith.cmpi slt, %3, %c0_1 : index
    %5 = arith.addi %3, %c32 overflow<nsw> : index
    %6 = arith.select %4, %5, %3 : index
    %c64_2 = arith.constant 64 : index
    %7 = arith.muli %2, %c64_2 overflow<nsw> : index
    %c64_3 = arith.constant 64 : index
    %8 = arith.muli %6, %c64_3 overflow<nsw> : index
    %c8_4 = arith.constant 8 : index
    %9 = arith.muli %7, %c8_4 overflow<nsw> : index
    %subview = memref.subview %assume_align_0[%7, %8, 0, 0] [64, 64, 8, 1] [1, 1, 1, 1] : memref<256x2048x8x1xf32> to memref<64x64x8x1xf32, strided<[16384, 8, 1, 1], offset: ?>>
    %subview_5 = memref.subview %assume_align[%9, %8] [512, 64] [1, 1] : memref<2048x2048xf32> to memref<512x64xf32, strided<[2048, 1], offset: ?>>
    %base_buffer, %offset, %sizes:2, %strides:2 = memref.extract_strided_metadata %subview_5 : memref<512x64xf32, strided<[2048, 1], offset: ?>> -> memref<f32>, index, index, index, index, index
    %base_buffer_6, %offset_7, %sizes_8:4, %strides_9:4 = memref.extract_strided_metadata %subview : memref<64x64x8x1xf32, strided<[16384, 8, 1, 1], offset: ?>> -> memref<f32>, index, index, index, index, index, index, index, index, index
    %10 = call @iree_uk_pack(%base_buffer, %offset, %strides#0, %strides#1, %base_buffer_6, %offset_7, %strides_9#0, %strides_9#1, %c512, %c64, %c64, %c64, %c8, %c1, %c0_i64, %c1_i32) : (memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i64, i32) -> i32
    return
  }
  iree_codegen.dispatch_config @_encoding_0_encode_2048x2048xf32_to_2048x2048xf32 workgroup_size = [1, 1, 1] {
  ^bb0(%arg0: !hal.device):
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c1_0 = arith.constant 1 : index
    iree_codegen.yield %c128, %c1, %c1_0 : index, index, index
  }
}


// -----// IR Dump After LowerUKernelOpsToCallsPass: iree-codegen-lower-ukernel-ops-to-calls //----- //
module {
  func.func private @iree_uk_pack(memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i64, i32) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
  func.func @_encoding_1_encode_2048x2048xf32_to_2048x2048xf32() {
    %c769_i32 = arith.constant 769 : i32
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    %c512 = arith.constant 512 : index
    %c64 = arith.constant 64 : index
    %c0_i64 = arith.constant 0 : i64
    %c0 = arith.constant 0 : index
    %c16777216 = arith.constant 16777216 : index
    %0 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : memref<2048x2048xf32>
    %assume_align = memref.assume_alignment %0, 64 : memref<2048x2048xf32>
    %1 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%c16777216) flags(Indirect) : memref<256x2048x8x1xf32, strided<[16384, 8, 1, 1], offset: ?>>
    %assume_align_0 = memref.assume_alignment %1, 64 : memref<256x2048x8x1xf32, strided<[16384, 8, 1, 1], offset: ?>>
    %workgroup_id_x = hal.interface.workgroup.id[0] : index
    %workgroup_count_x = hal.interface.workgroup.count[0] : index
    %c32 = arith.constant 32 : index
    %c0_1 = arith.constant 0 : index
    %2 = arith.floordivsi %workgroup_id_x, %c32 : index
    %3 = arith.remsi %workgroup_id_x, %c32 : index
    %4 = arith.cmpi slt, %3, %c0_1 : index
    %5 = arith.addi %3, %c32 overflow<nsw> : index
    %6 = arith.select %4, %5, %3 : index
    %c64_2 = arith.constant 64 : index
    %7 = arith.muli %2, %c64_2 overflow<nsw> : index
    %c64_3 = arith.constant 64 : index
    %8 = arith.muli %6, %c64_3 overflow<nsw> : index
    %c8_4 = arith.constant 8 : index
    %9 = arith.muli %7, %c8_4 overflow<nsw> : index
    %subview = memref.subview %assume_align_0[%7, %8, 0, 0] [64, 64, 8, 1] [1, 1, 1, 1] : memref<256x2048x8x1xf32, strided<[16384, 8, 1, 1], offset: ?>> to memref<64x64x8x1xf32, strided<[16384, 8, 1, 1], offset: ?>>
    %subview_5 = memref.subview %assume_align[%8, %9] [64, 512] [1, 1] : memref<2048x2048xf32> to memref<64x512xf32, strided<[2048, 1], offset: ?>>
    %base_buffer, %offset, %sizes:2, %strides:2 = memref.extract_strided_metadata %subview_5 : memref<64x512xf32, strided<[2048, 1], offset: ?>> -> memref<f32>, index, index, index, index, index
    %base_buffer_6, %offset_7, %sizes_8:4, %strides_9:4 = memref.extract_strided_metadata %subview : memref<64x64x8x1xf32, strided<[16384, 8, 1, 1], offset: ?>> -> memref<f32>, index, index, index, index, index, index, index, index, index
    %10 = call @iree_uk_pack(%base_buffer, %offset, %strides#0, %strides#1, %base_buffer_6, %offset_7, %strides_9#0, %strides_9#1, %c64, %c512, %c64, %c64, %c8, %c1, %c0_i64, %c769_i32) : (memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i64, i32) -> i32
    return
  }
  iree_codegen.dispatch_config @_encoding_1_encode_2048x2048xf32_to_2048x2048xf32 workgroup_size = [1, 1, 1] {
  ^bb0(%arg0: !hal.device):
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c1_0 = arith.constant 1 : index
    iree_codegen.yield %c128, %c1, %c1_0 : index, index, index
  }
}
