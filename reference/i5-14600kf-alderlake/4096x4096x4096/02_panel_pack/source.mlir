module attributes {stream.affinity.default = #hal.device.affinity<@__device_0>} {
  util.global private @__device_0 = #hal.device.target<"local", [#hal.executable.target<"llvm-cpu", "embedded-elf-x86_64", {cpu = "alderlake", cpu_features = "+adx,+aes,+avx,+avx2,+avxvnni,+bmi,+bmi2,+clflushopt,+clwb,+cmov,+crc32,+cx16,+cx8,+f16c,+fma,+fsgsbase,+fxsr,+gfni,+hreset,+invpcid,+kl,+lzcnt,+mmx,+movbe,+movdir64b,+movdiri,+pclmul,+pconfig,+pku,+popcnt,+prfchw,+ptwrite,+rdpid,+rdrnd,+rdseed,+sahf,+serialize,+sgx,+sha,+shstk,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+vaes,+vpclmulqdq,+waitpkg,+widekl,+x87,+xsave,+xsavec,+xsaveopt,+xsaves", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 4194304 : i64, native_vector_size = 32 : i64, target_triple = "x86_64-unknown-unknown-eabi-elf", ukernels = "all"}>]> : !hal.device
  hal.executable private @gemm_dispatch_0 {
    hal.executable.variant public @embedded_elf_x86_64 target(<"llvm-cpu", "embedded-elf-x86_64", {cpu = "alderlake", cpu_features = "+adx,+aes,+avx,+avx2,+avxvnni,+bmi,+bmi2,+clflushopt,+clwb,+cmov,+crc32,+cx16,+cx8,+f16c,+fma,+fsgsbase,+fxsr,+gfni,+hreset,+invpcid,+kl,+lzcnt,+mmx,+movbe,+movdir64b,+movdiri,+pclmul,+pconfig,+pku,+popcnt,+prfchw,+ptwrite,+rdpid,+rdrnd,+rdseed,+sahf,+serialize,+sgx,+sha,+shstk,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+vaes,+vpclmulqdq,+waitpkg,+widekl,+x87,+xsave,+xsavec,+xsaveopt,+xsaves", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 4194304 : i64, native_vector_size = 32 : i64, target_triple = "x86_64-unknown-unknown-eabi-elf", ukernels = "all"}>) {
      hal.executable.export public @gemm_dispatch_0_matmul_4096x4096x4096_f32 ordinal(0) layout(#hal.pipeline.layout<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) count(%arg0: !hal.device) -> (index, index, index) {
        %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
        hal.return %x, %y, %z : index, index, index
      }
      builtin.module {
func.func private @iree_uk_pack(memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i64, i32) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
func.func private @iree_uk_unpack(memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i32) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
func.func private @iree_uk_mmt4d(memref<f32>, index, index, memref<f32>, index, index, memref<f32>, index, index, index, index, index, i32, i32, i32, i32) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
func.func @gemm_dispatch_0_matmul_4096x4096x4096_f32() attributes {translation_info = #iree_codegen.translation_info<pipeline = #iree_cpu.pipeline<Default>>} {
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
%c16384 = arith.constant 16384 : index
%c32768 = arith.constant 32768 : index
%c524288 = arith.constant 524288 : index
%z64 = arith.constant 0 : i64
%packA = arith.constant 1 : i32
%packB = arith.constant 769 : i32
%baseFlags = arith.constant 1537 : i32
%accFlags = arith.constant 1793 : i32
%i8 = arith.constant 8 : i32
%i1 = arith.constant 1 : i32
%Abuf = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : memref<16777216xf32>
%A = memref.reinterpret_cast %Abuf to offset: [0], sizes: [], strides: [] : memref<16777216xf32> to memref<f32>
%Bbuf = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : memref<16777216xf32>
%B = memref.reinterpret_cast %Bbuf to offset: [0], sizes: [], strides: [] : memref<16777216xf32> to memref<f32>
%Cbuf = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(2) alignment(64) offset(%c0) flags("Indirect") : memref<16777216xf32>
%C = memref.reinterpret_cast %Cbuf to offset: [0], sizes: [], strides: [] : memref<16777216xf32> to memref<f32>
%APbuf = memref.alloca() {alignment = 64 : i64} : memref<16384xf32>
%AP = memref.reinterpret_cast %APbuf to offset: [0], sizes: [], strides: [] : memref<16384xf32> to memref<f32>
%BPbuf = memref.alloca() {alignment = 64 : i64} : memref<32768xf32>
%BP = memref.reinterpret_cast %BPbuf to offset: [0], sizes: [], strides: [] : memref<32768xf32> to memref<f32>
%CPbuf = memref.alloca() {alignment = 64 : i64} : memref<524288xf32>
%CP = memref.reinterpret_cast %CPbuf to offset: [0], sizes: [], strides: [] : memref<524288xf32> to memref<f32>
scf.for %nc = %c0 to %c4096 step %c128 {
scf.for %kc = %c0 to %c4096 step %c256 {
%bo0 = arith.muli %kc, %c4096 : index
%bo = arith.addi %bo0, %nc : index
%r1 = func.call @iree_uk_pack(%B, %bo, %c4096, %c1, %BP, %c0, %c2048, %c8, %c256, %c128, %c16, %c256, %c8, %c1, %z64, %packB) : (memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i64, i32) -> i32
%first = arith.cmpi eq, %kc, %c0 : index
%flags = arith.select %first, %baseFlags, %accFlags : i32
scf.for %mc = %c0 to %c4096 step %c64 {
%ao0 = arith.muli %mc, %c4096 : index
%ao = arith.addi %ao0, %kc : index
%co = arith.muli %mc, %c128 : index
%r2 = func.call @iree_uk_pack(%A, %ao, %c4096, %c1, %AP, %c0, %c2048, %c8, %c64, %c256, %c8, %c256, %c8, %c1, %z64, %packA) : (memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i64, i32) -> i32
%r3 = func.call @iree_uk_mmt4d(%AP, %c0, %c2048, %BP, %c0, %c2048, %CP, %co, %c1024, %c8, %c16, %c256, %i8, %i8, %i1, %flags) : (memref<f32>, index, index, memref<f32>, index, index, memref<f32>, index, index, index, index, index, i32, i32, i32, i32) -> i32
}
}
%mtiles = arith.constant 512 : index
%r4 = func.call @iree_uk_unpack(%CP, %c0, %c1024, %c64, %C, %nc, %c4096, %c1, %mtiles, %c16, %c8, %c8, %c4096, %c128, %packA) : (memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i32) -> i32
}
return
}
iree_codegen.dispatch_config @gemm_dispatch_0_matmul_4096x4096x4096_f32 workgroup_size = [1, 1, 1] {
^bb0(%device: !hal.device):
%c1 = arith.constant 1 : index
iree_codegen.yield %c1, %c1, %c1 : index, index, index
}
      }
    }
  }
  util.func public @gemm(%arg0: !hal.buffer_view, %arg1: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @gemm(%input0: tensor<4096x4096xf32>, %input1: tensor<4096x4096xf32>) -> (%output0: tensor<4096x4096xf32>)"}} {
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
    %2 = stream.cmd.execute on(#hal.device.affinity<@__device_0>) await(%result_timepoint) => with(%0 as %arg2: !stream.resource<external>{%c67108864}, %1 as %arg3: !stream.resource<external>{%c67108864}, %result as %arg4: !stream.resource<external>{%c67108864}) {
      stream.cmd.dispatch @gemm_dispatch_0::@embedded_elf_x86_64::@gemm_dispatch_0_matmul_4096x4096x4096_f32 {
        ro %arg2[%c0 for %c67108864] : !stream.resource<external>{%c67108864},
        ro %arg3[%c0 for %c67108864] : !stream.resource<external>{%c67108864},
        wo %arg4[%c0 for %c67108864] : !stream.resource<external>{%c67108864}
      }
    } => !stream.timepoint
    %3 = stream.timepoint.await %2 => %result : !stream.resource<external>{%c67108864}
    %4 = stream.tensor.export on(#hal.device.affinity<@__device_0>) %3 : tensor<4096x4096xf32> in !stream.resource<external>{%c67108864} -> !hal.buffer_view
    util.return %4 : !hal.buffer_view
  }
}
