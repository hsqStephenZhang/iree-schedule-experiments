// -----// IR Dump After LowerUKernelOpsToCallsPass: iree-codegen-lower-ukernel-ops-to-calls //----- //
module {
  func.func private @iree_uk_pack(memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i64, i32) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
  func.func private @iree_uk_unpack(memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i32) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
  func.func private @custom_mmt4d_6x16x8(memref<f32>, index, index, memref<f32>, index, index, memref<f32>, index, index, index, index, index, i32, i32, i32, i32) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
  func.func @gemm_dispatch_0_matmul_4096x4096x4096_f32() {
    %c131072 = arith.constant 131072 : index
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c6 = arith.constant 6 : index
    %c16 = arith.constant 16 : index
    %c32 = arith.constant 32 : index
    %c96 = arith.constant 96 : index
    %c128 = arith.constant 128 : index
    %c192 = arith.constant 192 : index
    %c512 = arith.constant 512 : index
    %c4096 = arith.constant 4096 : index
    %c24576 = arith.constant 24576 : index
    %c65536 = arith.constant 65536 : index
    %c67141632 = arith.constant 67141632 : index
    %c1_i32 = arith.constant 1 : i32
    %c0_i32 = arith.constant 0 : i32
    %c6_i32 = arith.constant 6 : i32
    %c16_i32 = arith.constant 16 : i32
    %c8_i32 = arith.constant 8 : i32
    %workgroup_id_x = hal.interface.workgroup.id[0] upper_bound 87424 : index
    %0 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : memref<16785408xf32>
    %assume_align = memref.assume_alignment %0, 64 : memref<16785408xf32>
    %reinterpret_cast = memref.reinterpret_cast %assume_align to offset: [0], sizes: [], strides: [] : memref<16785408xf32> to memref<f32>
    %1 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c67141632) flags("ReadOnly|Indirect") : memref<16777216xf32>
    %assume_align_0 = memref.assume_alignment %1, 64 : memref<16777216xf32>
    %reinterpret_cast_1 = memref.reinterpret_cast %assume_align_0 to offset: [0], sizes: [], strides: [] : memref<16777216xf32> to memref<f32>
    %2 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%c0) flags(Indirect) : memref<16777216xf32>
    %assume_align_2 = memref.assume_alignment %2, 64 : memref<16777216xf32>
    %reinterpret_cast_3 = memref.reinterpret_cast %assume_align_2 to offset: [0], sizes: [], strides: [] : memref<16777216xf32> to memref<f32>
    %alloca = memref.alloca() {alignment = 64 : i64} : memref<192xf32>
    %reinterpret_cast_4 = memref.reinterpret_cast %alloca to offset: [0], sizes: [], strides: [] : memref<192xf32> to memref<f32>
    %3 = arith.divui %workgroup_id_x, %c128 : index
    %4 = arith.remui %workgroup_id_x, %c128 : index
    %5 = arith.muli %3, %c6 : index
    %6 = arith.muli %4, %c32 : index
    %7 = arith.muli %3, %c24576 : index
    %8 = arith.muli %4, %c131072 : index
    %9 = call @custom_mmt4d_6x16x8(%reinterpret_cast, %7, %c24576, %reinterpret_cast_1, %8, %c65536, %reinterpret_cast_4, %c0, %c192, %c1, %c2, %c512, %c6_i32, %c16_i32, %c8_i32, %c0_i32) : (memref<f32>, index, index, memref<f32>, index, index, memref<f32>, index, index, index, index, index, i32, i32, i32, i32) -> i32
    %10 = arith.subi %c4096, %5 : index
    %11 = arith.minui %10, %c6 : index
    %12 = arith.addi %7, %6 : index
    %13 = call @iree_uk_unpack(%reinterpret_cast_4, %c0, %c192, %c96, %reinterpret_cast_3, %12, %c4096, %c1, %c1, %c2, %c6, %c16, %11, %c32, %c1_i32) : (memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i32) -> i32
    return
  }
  iree_codegen.dispatch_config @gemm_dispatch_0_matmul_4096x4096x4096_f32 workgroup_size = [1, 1, 1] {
  ^bb0(%arg0: !hal.device):
    %c87424 = arith.constant 87424 : index
    %c1 = arith.constant 1 : index
    iree_codegen.yield %c87424, %c1, %c1 : index, index, index
  }
}


// -----// IR Dump After LowerUKernelOpsToCallsPass: iree-codegen-lower-ukernel-ops-to-calls //----- //
module {
  func.func private @iree_uk_pack(memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i64, i32) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
  func.func private @iree_uk_unpack(memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i32) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
  func.func private @custom_mmt4d_6x16x8(memref<f32>, index, index, memref<f32>, index, index, memref<f32>, index, index, index, index, index, i32, i32, i32, i32) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
  func.func @_encoding_0_encode_4096x4096xf32_to_4096x4096xf32() {
    %c384 = arith.constant 384 : index
    %c245760 = arith.constant 245760 : index
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c6 = arith.constant 6 : index
    %c60 = arith.constant 60 : index
    %c64 = arith.constant 64 : index
    %c4096 = arith.constant 4096 : index
    %c24576 = arith.constant 24576 : index
    %c0_i64 = arith.constant 0 : i64
    %c257_i32 = arith.constant 257 : i32
    %workgroup_id_x = hal.interface.workgroup.id[0] upper_bound 4416 : index
    %0 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : memref<16777216xf32>
    %assume_align = memref.assume_alignment %0, 64 : memref<16777216xf32>
    %reinterpret_cast = memref.reinterpret_cast %assume_align to offset: [0], sizes: [], strides: [] : memref<16777216xf32> to memref<f32>
    %1 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%c0) flags(Indirect) : memref<16785408xf32>
    %assume_align_0 = memref.assume_alignment %1, 64 : memref<16785408xf32>
    %reinterpret_cast_1 = memref.reinterpret_cast %assume_align_0 to offset: [0], sizes: [], strides: [] : memref<16785408xf32> to memref<f32>
    %2 = arith.divui %workgroup_id_x, %c64 : index
    %3 = arith.remui %workgroup_id_x, %c64 : index
    %4 = arith.muli %2, %c60 : index
    %5 = arith.muli %3, %c64 : index
    %6 = arith.subi %c4096, %4 : index
    %7 = arith.minui %6, %c60 : index
    %8 = arith.ceildivui %7, %c6 : index
    %9 = arith.muli %2, %c245760 : index
    %10 = arith.addi %9, %5 : index
    %11 = arith.muli %3, %c384 : index
    %12 = arith.addi %9, %11 : index
    %13 = call @iree_uk_pack(%reinterpret_cast, %10, %c4096, %c1, %reinterpret_cast_1, %12, %c24576, %c6, %7, %c64, %8, %c64, %c1, %c6, %c0_i64, %c257_i32) : (memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i64, i32) -> i32
    return
  }
  iree_codegen.dispatch_config @_encoding_0_encode_4096x4096xf32_to_4096x4096xf32 workgroup_size = [1, 1, 1] {
  ^bb0(%arg0: !hal.device):
    %c4416 = arith.constant 4416 : index
    %c1 = arith.constant 1 : index
    iree_codegen.yield %c4416, %c1, %c1 : index, index, index
  }
}


// -----// IR Dump After LowerUKernelOpsToCallsPass: iree-codegen-lower-ukernel-ops-to-calls //----- //
module {
  func.func private @iree_uk_pack(memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i64, i32) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
  func.func private @iree_uk_unpack(memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i32) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
  func.func private @custom_mmt4d_6x16x8(memref<f32>, index, index, memref<f32>, index, index, memref<f32>, index, index, index, index, index, i32, i32, i32, i32) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
  func.func @_encoding_1_encode_4096x4096xf32_to_4096x4096xf32() {
    %c1024 = arith.constant 1024 : index
    %c262144 = arith.constant 262144 : index
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c16 = arith.constant 16 : index
    %c64 = arith.constant 64 : index
    %c4096 = arith.constant 4096 : index
    %c65536 = arith.constant 65536 : index
    %c67141632 = arith.constant 67141632 : index
    %c0_i64 = arith.constant 0 : i64
    %c513_i32 = arith.constant 513 : i32
    %workgroup_id_x = hal.interface.workgroup.id[0] upper_bound 4096 : index
    %0 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : memref<16777216xf32>
    %assume_align = memref.assume_alignment %0, 64 : memref<16777216xf32>
    %reinterpret_cast = memref.reinterpret_cast %assume_align to offset: [0], sizes: [], strides: [] : memref<16777216xf32> to memref<f32>
    %1 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%c67141632) flags(Indirect) : memref<16777216xf32>
    %assume_align_0 = memref.assume_alignment %1, 64 : memref<16777216xf32>
    %reinterpret_cast_1 = memref.reinterpret_cast %assume_align_0 to offset: [0], sizes: [], strides: [] : memref<16777216xf32> to memref<f32>
    %2 = arith.divui %workgroup_id_x, %c64 : index
    %3 = arith.remui %workgroup_id_x, %c64 : index
    %4 = arith.muli %2, %c64 : index
    %5 = arith.muli %3, %c262144 : index
    %6 = arith.addi %5, %4 : index
    %7 = arith.muli %2, %c262144 : index
    %8 = arith.muli %3, %c1024 : index
    %9 = arith.addi %7, %8 : index
    %10 = call @iree_uk_pack(%reinterpret_cast, %6, %c4096, %c1, %reinterpret_cast_1, %9, %c65536, %c16, %c64, %c64, %c4, %c64, %c1, %c16, %c0_i64, %c513_i32) : (memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i64, i32) -> i32
    return
  }
  iree_codegen.dispatch_config @_encoding_1_encode_4096x4096xf32_to_4096x4096xf32 workgroup_size = [1, 1, 1] {
  ^bb0(%arg0: !hal.device):
    %c4096 = arith.constant 4096 : index
    %c1 = arith.constant 1 : index
    iree_codegen.yield %c4096, %c1, %c1 : index, index, index
  }
}
