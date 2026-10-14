module attributes {stream.affinity.default = #hal.device.affinity<@__device_0>} {
  util.global private @__device_0 = #hal.device.target<"local", [#hal.executable.target<"llvm-cpu", "embedded-elf-x86_64", {cpu = "alderlake", cpu_features = "+adx,+aes,+avx,+avx2,+avxvnni,+bmi,+bmi2,+clflushopt,+clwb,+cmov,+crc32,+cx16,+cx8,+f16c,+fma,+fsgsbase,+fxsr,+gfni,+hreset,+invpcid,+kl,+lzcnt,+mmx,+movbe,+movdir64b,+movdiri,+pclmul,+pconfig,+pku,+popcnt,+prfchw,+ptwrite,+rdpid,+rdrnd,+rdseed,+sahf,+serialize,+sgx,+sha,+shstk,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+vaes,+vpclmulqdq,+waitpkg,+widekl,+x87,+xsave,+xsavec,+xsaveopt,+xsaves", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 4194304 : i64, native_vector_size = 32 : i64, target_triple = "x86_64-unknown-unknown-eabi-elf", ukernels = "all"}>]> : !hal.device
  hal.executable private @gemm_dispatch_0 {
    hal.executable.variant public @embedded_elf_x86_64 target(<"llvm-cpu", "embedded-elf-x86_64", {cpu = "alderlake", cpu_features = "+adx,+aes,+avx,+avx2,+avxvnni,+bmi,+bmi2,+clflushopt,+clwb,+cmov,+crc32,+cx16,+cx8,+f16c,+fma,+fsgsbase,+fxsr,+gfni,+hreset,+invpcid,+kl,+lzcnt,+mmx,+movbe,+movdir64b,+movdiri,+pclmul,+pconfig,+pku,+popcnt,+prfchw,+ptwrite,+rdpid,+rdrnd,+rdseed,+sahf,+serialize,+sgx,+sha,+shstk,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+vaes,+vpclmulqdq,+waitpkg,+widekl,+x87,+xsave,+xsavec,+xsaveopt,+xsaves", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 4194304 : i64, native_vector_size = 32 : i64, target_triple = "x86_64-unknown-unknown-eabi-elf", ukernels = "all"}>) {
      hal.executable.export public @gemm_dispatch_0_matmul_2048x2048x2048_f32 ordinal(0) layout(#hal.pipeline.layout<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) count(%arg0: !hal.device) -> (index, index, index) {
        %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
        hal.return %x, %y, %z : index, index, index
      }
      builtin.module {
func.func private @iree_uk_pack(memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i64, i32) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
func.func private @iree_uk_unpack(memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i32) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
func.func private @custom_mmt4d_6x16x8(memref<f32>, index, index, memref<f32>, index, index, memref<f32>, index, index, index, index, index, i32, i32, i32, i32) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
func.func @gemm_dispatch_0_matmul_2048x2048x2048_f32() attributes {translation_info = #iree_codegen.translation_info<pipeline = #iree_cpu.pipeline<Default>>} {
%c48 = arith.constant 48 : index
%c0 = arith.constant 0 : index
%c1 = arith.constant 1 : index
%c6 = arith.constant 6 : index
%c8 = arith.constant 8 : index
%c10 = arith.constant 10 : index
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
%z64 = arith.constant 0 : i64
%packA = arith.constant 257 : i32
%packB = arith.constant 513 : i32
%unpackFlags = arith.constant 1 : i32
%baseFlags = arith.constant 0 : i32
%accFlags = arith.constant 256 : i32
%mr = arith.constant 6 : i32
%nr = arith.constant 16 : i32
%kr = arith.constant 8 : i32
%Abuf = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : memref<4194304xf32>
%A = memref.reinterpret_cast %Abuf to offset: [0], sizes: [], strides: [] : memref<4194304xf32> to memref<f32>
%Bbuf = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : memref<4194304xf32>
%B = memref.reinterpret_cast %Bbuf to offset: [0], sizes: [], strides: [] : memref<4194304xf32> to memref<f32>
%Cbuf = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(2) alignment(64) offset(%c0) flags("Indirect") : memref<4194304xf32>
%C = memref.reinterpret_cast %Cbuf to offset: [0], sizes: [], strides: [] : memref<4194304xf32> to memref<f32>
%APbuf = memref.alloca() alignment = 64 : memref<15360xf32>
%AP = memref.reinterpret_cast %APbuf to offset: [0], sizes: [], strides: [] : memref<15360xf32> to memref<f32>
%BPbuf = memref.alloca() alignment = 64 : memref<32768xf32>
%BP = memref.reinterpret_cast %BPbuf to offset: [0], sizes: [], strides: [] : memref<32768xf32> to memref<f32>
%CPbuf = memref.alloca() alignment = 64 : memref<262656xf32>
%CP = memref.reinterpret_cast %CPbuf to offset: [0], sizes: [], strides: [] : memref<262656xf32> to memref<f32>
scf.for %nc = %c0 to %c2048 step %c128 {
scf.for %kc = %c0 to %c2048 step %c256 {
%bo0 = arith.muli %kc, %c2048 : index
%bo = arith.addi %bo0, %nc : index
%r1 = func.call @iree_uk_pack(%B, %bo, %c2048, %c1, %BP, %c0, %c4096, %c16, %c256, %c128, %c8, %c256, %c1, %c16, %z64, %packB) : (memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i64, i32) -> i32
%first = arith.cmpi eq, %kc, %c0 : index
%flags = arith.select %first, %baseFlags, %accFlags : i32
scf.for %mc = %c0 to %c2048 step %c60 {
%remaining = arith.subi %c2048, %mc : index
%rows = arith.minui %remaining, %c60 : index
%ao0 = arith.muli %mc, %c2048 : index
%ao = arith.addi %ao0, %kc : index
%co = arith.muli %mc, %c128 : index
%mt = arith.ceildivui %rows, %c6 : index
%r2 = func.call @iree_uk_pack(%A, %ao, %c2048, %c1, %AP, %c0, %c1536, %c6, %rows, %c256, %mt, %c256, %c1, %c6, %z64, %packA) : (memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i64, i32) -> i32
%r3 = func.call @custom_mmt4d_6x16x8(%AP, %c0, %c1536, %BP, %c0, %c4096, %CP, %co, %c768, %mt, %c8, %c32, %mr, %nr, %kr, %flags) : (memref<f32>, index, index, memref<f32>, index, index, memref<f32>, index, index, index, index, index, i32, i32, i32, i32) -> i32
}
}
%r4 = func.call @iree_uk_unpack(%CP, %c0, %c768, %c96, %C, %nc, %c2048, %c1, %c342, %c8, %c6, %c16, %c2048, %c128, %unpackFlags) : (memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i32) -> i32
}
return
}
        iree_codegen.dispatch_config @gemm_dispatch_0_matmul_2048x2048x2048_f32 workgroup_size = [1, 1, 1] {
^bb0(%dev: !hal.device):
%c1 = arith.constant 1 : index
iree_codegen.yield %c1, %c1, %c1 : index, index, index
}
      }
    }
  }
  util.func public @gemm(%arg0: !hal.buffer_view, %arg1: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @gemm(%input0: tensor<2048x2048xf32>, %input1: tensor<2048x2048xf32>) -> (%output0: tensor<2048x2048xf32>)"}} {
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
    %2 = stream.cmd.execute on(#hal.device.affinity<@__device_0>) await(%result_timepoint) => with(%0 as %arg2: !stream.resource<external>{%c16777216}, %1 as %arg3: !stream.resource<external>{%c16777216}, %result as %arg4: !stream.resource<external>{%c16777216}) {
      stream.cmd.dispatch @gemm_dispatch_0::@embedded_elf_x86_64::@gemm_dispatch_0_matmul_2048x2048x2048_f32 {
        ro %arg2[%c0 for %c16777216] : !stream.resource<external>{%c16777216},
        ro %arg3[%c0 for %c16777216] : !stream.resource<external>{%c16777216},
        wo %arg4[%c0 for %c16777216] : !stream.resource<external>{%c16777216}
      }
    } => !stream.timepoint
    %3 = stream.timepoint.await %2 => %result : !stream.resource<external>{%c16777216}
    %4 = stream.tensor.export on(#hal.device.affinity<@__device_0>) %3 : tensor<2048x2048xf32> in !stream.resource<external>{%c16777216} -> !hal.buffer_view
    util.return %4 : !hal.buffer_view
  }
}
