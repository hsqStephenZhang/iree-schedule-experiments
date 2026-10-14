// -----// IR Dump After LowerUKernelOpsToCallsPass: iree-codegen-lower-ukernel-ops-to-calls //----- //
module {
  func.func private @iree_uk_pack(memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i64, i32) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
  func.func private @iree_uk_unpack(memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i32) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
  func.func private @custom_mmt4d_6x16x8(memref<f32>, index, index, memref<f32>, index, index, memref<f32>, index, index, index, index, index, i32, i32, i32, i32) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
  func.func @gemm_dispatch_0_matmul_2048x2048x2048_f32() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c6 = arith.constant 6 : index
    %c8 = arith.constant 8 : index
    %c16 = arith.constant 16 : index
    %c32 = arith.constant 32 : index
    %c60 = arith.constant 60 : index
    %c96 = arith.constant 96 : index
    %c128 = arith.constant 128 : index
    %c256 = arith.constant 256 : index
    %c342 = arith.constant 342 : index
    %c768 = arith.constant 768 : index
    %c1536 = arith.constant 1536 : index
    %c2048 = arith.constant 2048 : index
    %c4096 = arith.constant 4096 : index
    %c0_i64 = arith.constant 0 : i64
    %c257_i32 = arith.constant 257 : i32
    %c513_i32 = arith.constant 513 : i32
    %c1_i32 = arith.constant 1 : i32
    %c0_i32 = arith.constant 0 : i32
    %c256_i32 = arith.constant 256 : i32
    %c6_i32 = arith.constant 6 : i32
    %c16_i32 = arith.constant 16 : i32
    %c8_i32 = arith.constant 8 : i32
    %0 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : memref<4194304xf32>
    %assume_align = memref.assume_alignment %0, 64 : memref<4194304xf32>
    %reinterpret_cast = memref.reinterpret_cast %assume_align to offset: [0], sizes: [], strides: [] : memref<4194304xf32> to memref<f32>
    %1 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : memref<4194304xf32>
    %assume_align_0 = memref.assume_alignment %1, 64 : memref<4194304xf32>
    %reinterpret_cast_1 = memref.reinterpret_cast %assume_align_0 to offset: [0], sizes: [], strides: [] : memref<4194304xf32> to memref<f32>
    %2 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(2) alignment(64) offset(%c0) flags(Indirect) : memref<4194304xf32>
    %assume_align_2 = memref.assume_alignment %2, 64 : memref<4194304xf32>
    %reinterpret_cast_3 = memref.reinterpret_cast %assume_align_2 to offset: [0], sizes: [], strides: [] : memref<4194304xf32> to memref<f32>
    %alloca = memref.alloca() alignment = 64 : memref<15360xf32>
    %reinterpret_cast_4 = memref.reinterpret_cast %alloca to offset: [0], sizes: [], strides: [] : memref<15360xf32> to memref<f32>
    %alloca_5 = memref.alloca() alignment = 64 : memref<32768xf32>
    %reinterpret_cast_6 = memref.reinterpret_cast %alloca_5 to offset: [0], sizes: [], strides: [] : memref<32768xf32> to memref<f32>
    %alloca_7 = memref.alloca() alignment = 64 : memref<262656xf32>
    %reinterpret_cast_8 = memref.reinterpret_cast %alloca_7 to offset: [0], sizes: [], strides: [] : memref<262656xf32> to memref<f32>
    scf.for %arg0 = %c0 to %c2048 step %c128 {
      scf.for %arg1 = %c0 to %c2048 step %c256 {
        %4 = arith.muli %arg1, %c2048 : index
        %5 = arith.addi %4, %arg0 : index
        %6 = func.call @iree_uk_pack(%reinterpret_cast_1, %5, %c2048, %c1, %reinterpret_cast_6, %c0, %c4096, %c16, %c256, %c128, %c8, %c256, %c1, %c16, %c0_i64, %c513_i32) : (memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i64, i32) -> i32
        %7 = arith.cmpi eq, %arg1, %c0 : index
        %8 = arith.select %7, %c0_i32, %c256_i32 : i32
        scf.for %arg2 = %c0 to %c2048 step %c60 {
          %9 = arith.subi %c2048, %arg2 : index
          %10 = arith.minui %9, %c60 : index
          %11 = arith.muli %arg2, %c2048 : index
          %12 = arith.addi %11, %arg1 : index
          %13 = arith.muli %arg2, %c128 : index
          %14 = arith.ceildivui %10, %c6 : index
          %15 = func.call @iree_uk_pack(%reinterpret_cast, %12, %c2048, %c1, %reinterpret_cast_4, %c0, %c1536, %c6, %10, %c256, %14, %c256, %c1, %c6, %c0_i64, %c257_i32) : (memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i64, i32) -> i32
          %16 = func.call @custom_mmt4d_6x16x8(%reinterpret_cast_4, %c0, %c1536, %reinterpret_cast_6, %c0, %c4096, %reinterpret_cast_8, %13, %c768, %14, %c8, %c32, %c6_i32, %c16_i32, %c8_i32, %8) : (memref<f32>, index, index, memref<f32>, index, index, memref<f32>, index, index, index, index, index, i32, i32, i32, i32) -> i32
        }
      }
      %3 = func.call @iree_uk_unpack(%reinterpret_cast_8, %c0, %c768, %c96, %reinterpret_cast_3, %arg0, %c2048, %c1, %c342, %c8, %c6, %c16, %c2048, %c128, %c1_i32) : (memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i32) -> i32
    }
    return
  }
  iree_codegen.dispatch_config @gemm_dispatch_0_matmul_2048x2048x2048_f32 workgroup_size = [1, 1, 1] {
  ^bb0(%arg0: !hal.device):
    %c1 = arith.constant 1 : index
    iree_codegen.yield %c1, %c1, %c1 : index, index, index
  }
}
