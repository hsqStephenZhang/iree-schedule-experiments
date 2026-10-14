// -----// IR Dump After LowerUKernelOpsToCallsPass: iree-codegen-lower-ukernel-ops-to-calls //----- //
module {
  func.func private @iree_uk_pack(memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i64, i32) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
  func.func private @iree_uk_unpack(memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i32) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
  func.func private @iree_uk_mmt4d(memref<f32>, index, index, memref<f32>, index, index, memref<f32>, index, index, index, index, index, i32, i32, i32, i32) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
  func.func @gemm_dispatch_0_matmul_4096x4096x4096_f32() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    %c16 = arith.constant 16 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c256 = arith.constant 256 : index
    %c512 = arith.constant 512 : index
    %c1024 = arith.constant 1024 : index
    %c2048 = arith.constant 2048 : index
    %c4096 = arith.constant 4096 : index
    %c0_i64 = arith.constant 0 : i64
    %c1_i32 = arith.constant 1 : i32
    %c769_i32 = arith.constant 769 : i32
    %c1537_i32 = arith.constant 1537 : i32
    %c1793_i32 = arith.constant 1793 : i32
    %c8_i32 = arith.constant 8 : i32
    %0 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : memref<16777216xf32>
    %assume_align = memref.assume_alignment %0, 64 : memref<16777216xf32>
    %reinterpret_cast = memref.reinterpret_cast %assume_align to offset: [0], sizes: [], strides: [] : memref<16777216xf32> to memref<f32>
    %1 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : memref<16777216xf32>
    %assume_align_0 = memref.assume_alignment %1, 64 : memref<16777216xf32>
    %reinterpret_cast_1 = memref.reinterpret_cast %assume_align_0 to offset: [0], sizes: [], strides: [] : memref<16777216xf32> to memref<f32>
    %2 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(2) alignment(64) offset(%c0) flags(Indirect) : memref<16777216xf32>
    %assume_align_2 = memref.assume_alignment %2, 64 : memref<16777216xf32>
    %reinterpret_cast_3 = memref.reinterpret_cast %assume_align_2 to offset: [0], sizes: [], strides: [] : memref<16777216xf32> to memref<f32>
    %alloca = memref.alloca() alignment = 64 : memref<16384xf32>
    %reinterpret_cast_4 = memref.reinterpret_cast %alloca to offset: [0], sizes: [], strides: [] : memref<16384xf32> to memref<f32>
    %alloca_5 = memref.alloca() alignment = 64 : memref<32768xf32>
    %reinterpret_cast_6 = memref.reinterpret_cast %alloca_5 to offset: [0], sizes: [], strides: [] : memref<32768xf32> to memref<f32>
    %alloca_7 = memref.alloca() alignment = 64 : memref<524288xf32>
    %reinterpret_cast_8 = memref.reinterpret_cast %alloca_7 to offset: [0], sizes: [], strides: [] : memref<524288xf32> to memref<f32>
    scf.for %arg0 = %c0 to %c4096 step %c128 {
      scf.for %arg1 = %c0 to %c4096 step %c256 {
        %4 = arith.muli %arg1, %c4096 : index
        %5 = arith.addi %4, %arg0 : index
        %6 = func.call @iree_uk_pack(%reinterpret_cast_1, %5, %c4096, %c1, %reinterpret_cast_6, %c0, %c2048, %c8, %c256, %c128, %c16, %c256, %c8, %c1, %c0_i64, %c769_i32) : (memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i64, i32) -> i32
        %7 = arith.cmpi eq, %arg1, %c0 : index
        %8 = arith.select %7, %c1537_i32, %c1793_i32 : i32
        scf.for %arg2 = %c0 to %c4096 step %c64 {
          %9 = arith.muli %arg2, %c4096 : index
          %10 = arith.addi %9, %arg1 : index
          %11 = arith.muli %arg2, %c128 : index
          %12 = func.call @iree_uk_pack(%reinterpret_cast, %10, %c4096, %c1, %reinterpret_cast_4, %c0, %c2048, %c8, %c64, %c256, %c8, %c256, %c8, %c1, %c0_i64, %c1_i32) : (memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i64, i32) -> i32
          %13 = func.call @iree_uk_mmt4d(%reinterpret_cast_4, %c0, %c2048, %reinterpret_cast_6, %c0, %c2048, %reinterpret_cast_8, %11, %c1024, %c8, %c16, %c256, %c8_i32, %c8_i32, %c1_i32, %8) : (memref<f32>, index, index, memref<f32>, index, index, memref<f32>, index, index, index, index, index, i32, i32, i32, i32) -> i32
        }
      }
      %3 = func.call @iree_uk_unpack(%reinterpret_cast_8, %c0, %c1024, %c64, %reinterpret_cast_3, %arg0, %c4096, %c1, %c512, %c16, %c8, %c8, %c4096, %c128, %c1_i32) : (memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i32) -> i32
    }
    return
  }
  iree_codegen.dispatch_config @gemm_dispatch_0_matmul_4096x4096x4096_f32 workgroup_size = [1, 1, 1] {
  ^bb0(%arg0: !hal.device):
    %c1 = arith.constant 1 : index
    iree_codegen.yield %c1, %c1, %c1 : index, index, index
  }
}
