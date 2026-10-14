module attributes {stream.affinity.default = #hal.device.affinity<@__device_0>} {
  util.global private @__device_0 = #hal.device.target<"local", [#hal.executable.target<"llvm-cpu", "embedded-elf-x86_64", {cpu = "alderlake", cpu_features = "+adx,+aes,+avx,+avx2,+avxvnni,+bmi,+bmi2,+clflushopt,+clwb,+cmov,+crc32,+cx16,+cx8,+f16c,+fma,+fsgsbase,+fxsr,+gfni,+hreset,+invpcid,+kl,+lzcnt,+mmx,+movbe,+movdir64b,+movdiri,+pclmul,+pconfig,+pku,+popcnt,+prfchw,+ptwrite,+rdpid,+rdrnd,+rdseed,+sahf,+serialize,+sgx,+sha,+shstk,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+vaes,+vpclmulqdq,+waitpkg,+widekl,+x87,+xsave,+xsavec,+xsaveopt,+xsaves", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 32 : i64, target_triple = "x86_64-unknown-unknown-eabi-elf", ukernels = "all"}>]> : !hal.device
  hal.executable private @gemm_dispatch_0 {
    hal.executable.variant public @embedded_elf_x86_64 target(<"llvm-cpu", "embedded-elf-x86_64", {cpu = "alderlake", cpu_features = "+adx,+aes,+avx,+avx2,+avxvnni,+bmi,+bmi2,+clflushopt,+clwb,+cmov,+crc32,+cx16,+cx8,+f16c,+fma,+fsgsbase,+fxsr,+gfni,+hreset,+invpcid,+kl,+lzcnt,+mmx,+movbe,+movdir64b,+movdiri,+pclmul,+pconfig,+pku,+popcnt,+prfchw,+ptwrite,+rdpid,+rdrnd,+rdseed,+sahf,+serialize,+sgx,+sha,+shstk,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+vaes,+vpclmulqdq,+waitpkg,+widekl,+x87,+xsave,+xsavec,+xsaveopt,+xsaves", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 32 : i64, target_triple = "x86_64-unknown-unknown-eabi-elf", ukernels = "all"}>) {
      hal.executable.export public @gemm_dispatch_0_matmul_4096x4096x4096_f32 ordinal(0) layout(#hal.pipeline.layout<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) count(%arg0: !hal.device) -> (index, index, index) {
        %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
        hal.return %x, %y, %z : index, index, index
      }
      builtin.module {
        func.func private @iree_uk_pack(memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i64, i32) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
func.func private @iree_uk_unpack(memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i32) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
func.func private @custom_mmt4d_6x16x8(memref<f32>, index, index, memref<f32>, index, index, memref<f32>, index, index, index, index, index, i32, i32, i32, i32) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
func.func @gemm_dispatch_0_matmul_4096x4096x4096_f32() attributes {translation_info = #iree_codegen.translation_info<pipeline = #iree_cpu.pipeline<Default>>} {
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
%zero64 = arith.constant 0 : i64
%packA = arith.constant 257 : i32
%packB = arith.constant 513 : i32
%unpackFlags = arith.constant 1 : i32
%flags = arith.constant 0 : i32
%mr = arith.constant 6 : i32
%nr = arith.constant 16 : i32
%kr = arith.constant 8 : i32
%wg = hal.interface.workgroup.id[0] : index
%APbuf = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : memref<16785408xf32>
%AP = memref.reinterpret_cast %APbuf to offset: [0], sizes: [], strides: [] : memref<16785408xf32> to memref<f32>
%BPbuf = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c67141632) flags("ReadOnly|Indirect") : memref<16777216xf32>
%BP = memref.reinterpret_cast %BPbuf to offset: [0], sizes: [], strides: [] : memref<16777216xf32> to memref<f32>
%Cbuf = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%c0) flags("Indirect") : memref<16777216xf32>
%C = memref.reinterpret_cast %Cbuf to offset: [0], sizes: [], strides: [] : memref<16777216xf32> to memref<f32>
%CPbuf = memref.alloca() {alignment = 64 : i64} : memref<192xf32>
%CP = memref.reinterpret_cast %CPbuf to offset: [0], sizes: [], strides: [] : memref<192xf32> to memref<f32>
%mi = arith.divui %wg, %c128 : index
%ni = arith.remui %wg, %c128 : index
%mo = arith.muli %mi, %c6 : index
%no = arith.muli %ni, %c32 : index
%aoff = arith.muli %mo, %c4096 : index
%boff = arith.muli %no, %c4096 : index
%r1 = func.call @custom_mmt4d_6x16x8(%AP, %aoff, %c24576, %BP, %boff, %c65536, %CP, %c0, %c192, %c1, %c2, %c512, %mr, %nr, %kr, %flags) : (memref<f32>, index, index, memref<f32>, index, index, memref<f32>, index, index, index, index, index, i32, i32, i32, i32) -> i32
%remaining = arith.subi %c4096, %mo : index
%rows = arith.minui %remaining, %c6 : index
%coff0 = arith.muli %mo, %c4096 : index
%coff = arith.addi %coff0, %no : index
%r2 = func.call @iree_uk_unpack(%CP, %c0, %c192, %c96, %C, %coff, %c4096, %c1, %c1, %c2, %c6, %c16, %rows, %c32, %unpackFlags) : (memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i32) -> i32
return
}
        iree_codegen.dispatch_config @gemm_dispatch_0_matmul_4096x4096x4096_f32 workgroup_size = [1, 1, 1] {
^bb0(%dev: !hal.device):
%count = arith.constant 87424 : index
%one = arith.constant 1 : index
iree_codegen.yield %count, %one, %one : index, index, index
}
      }
    }
  }
  hal.executable private @_encoding_0 {
    hal.executable.variant public @embedded_elf_x86_64 target(<"llvm-cpu", "embedded-elf-x86_64", {cpu = "alderlake", cpu_features = "+adx,+aes,+avx,+avx2,+avxvnni,+bmi,+bmi2,+clflushopt,+clwb,+cmov,+crc32,+cx16,+cx8,+f16c,+fma,+fsgsbase,+fxsr,+gfni,+hreset,+invpcid,+kl,+lzcnt,+mmx,+movbe,+movdir64b,+movdiri,+pclmul,+pconfig,+pku,+popcnt,+prfchw,+ptwrite,+rdpid,+rdrnd,+rdseed,+sahf,+serialize,+sgx,+sha,+shstk,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+vaes,+vpclmulqdq,+waitpkg,+widekl,+x87,+xsave,+xsavec,+xsaveopt,+xsaves", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 32 : i64, target_triple = "x86_64-unknown-unknown-eabi-elf", ukernels = "all"}>) {
      hal.executable.export public @_encoding_0_encode_4096x4096xf32_to_4096x4096xf32 ordinal(0) layout(#hal.pipeline.layout<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) count(%arg0: !hal.device) -> (index, index, index) {
        %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
        hal.return %x, %y, %z : index, index, index
      }
      builtin.module {
        func.func private @iree_uk_pack(memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i64, i32) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
func.func private @iree_uk_unpack(memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i32) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
func.func private @custom_mmt4d_6x16x8(memref<f32>, index, index, memref<f32>, index, index, memref<f32>, index, index, index, index, index, i32, i32, i32, i32) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
func.func @_encoding_0_encode_4096x4096xf32_to_4096x4096xf32() attributes {translation_info = #iree_codegen.translation_info<pipeline = #iree_cpu.pipeline<Default>>} {
%c0 = arith.constant 0 : index
%c1 = arith.constant 1 : index
%c6 = arith.constant 6 : index
%c60 = arith.constant 60 : index
%c64 = arith.constant 64 : index
%c4096 = arith.constant 4096 : index
%c24576 = arith.constant 24576 : index
%zero64 = arith.constant 0 : i64
%packA = arith.constant 257 : i32
%packB = arith.constant 513 : i32
%unpackFlags = arith.constant 1 : i32
%flags = arith.constant 0 : i32
%mr = arith.constant 6 : i32
%nr = arith.constant 16 : i32
%kr = arith.constant 8 : i32
%wg = hal.interface.workgroup.id[0] : index
%Abuf = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : memref<16777216xf32>
%A = memref.reinterpret_cast %Abuf to offset: [0], sizes: [], strides: [] : memref<16777216xf32> to memref<f32>
%APbuf = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%c0) flags("Indirect") : memref<16785408xf32>
%AP = memref.reinterpret_cast %APbuf to offset: [0], sizes: [], strides: [] : memref<16785408xf32> to memref<f32>
%mi = arith.divui %wg, %c64 : index
%ki = arith.remui %wg, %c64 : index
%mo = arith.muli %mi, %c60 : index
%ko = arith.muli %ki, %c64 : index
%remaining = arith.subi %c4096, %mo : index
%rows = arith.minui %remaining, %c60 : index
%mt = arith.ceildivui %rows, %c6 : index
%aoff0 = arith.muli %mo, %c4096 : index
%aoff = arith.addi %aoff0, %ko : index
%koff = arith.muli %ko, %c6 : index
%apoff = arith.addi %aoff0, %koff : index
%r1 = func.call @iree_uk_pack(%A, %aoff, %c4096, %c1, %AP, %apoff, %c24576, %c6, %rows, %c64, %mt, %c64, %c1, %c6, %zero64, %packA) : (memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i64, i32) -> i32
return
}
        iree_codegen.dispatch_config @_encoding_0_encode_4096x4096xf32_to_4096x4096xf32 workgroup_size = [1, 1, 1] {
^bb0(%dev: !hal.device):
%count = arith.constant 4416 : index
%one = arith.constant 1 : index
iree_codegen.yield %count, %one, %one : index, index, index
}
      }
    }
  }
  hal.executable private @_encoding_1 {
    hal.executable.variant public @embedded_elf_x86_64 target(<"llvm-cpu", "embedded-elf-x86_64", {cpu = "alderlake", cpu_features = "+adx,+aes,+avx,+avx2,+avxvnni,+bmi,+bmi2,+clflushopt,+clwb,+cmov,+crc32,+cx16,+cx8,+f16c,+fma,+fsgsbase,+fxsr,+gfni,+hreset,+invpcid,+kl,+lzcnt,+mmx,+movbe,+movdir64b,+movdiri,+pclmul,+pconfig,+pku,+popcnt,+prfchw,+ptwrite,+rdpid,+rdrnd,+rdseed,+sahf,+serialize,+sgx,+sha,+shstk,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+vaes,+vpclmulqdq,+waitpkg,+widekl,+x87,+xsave,+xsavec,+xsaveopt,+xsaves", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 32 : i64, target_triple = "x86_64-unknown-unknown-eabi-elf", ukernels = "all"}>) {
      hal.executable.export public @_encoding_1_encode_4096x4096xf32_to_4096x4096xf32 ordinal(0) layout(#hal.pipeline.layout<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) count(%arg0: !hal.device) -> (index, index, index) {
        %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
        hal.return %x, %y, %z : index, index, index
      }
      builtin.module {
        func.func private @iree_uk_pack(memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i64, i32) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
func.func private @iree_uk_unpack(memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i32) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
func.func private @custom_mmt4d_6x16x8(memref<f32>, index, index, memref<f32>, index, index, memref<f32>, index, index, index, index, index, i32, i32, i32, i32) -> i32 attributes {hal.import.bitcode = true, hal.import.fields = ["processor_data"], llvm.bareptr = true}
func.func @_encoding_1_encode_4096x4096xf32_to_4096x4096xf32() attributes {translation_info = #iree_codegen.translation_info<pipeline = #iree_cpu.pipeline<Default>>} {
%c0 = arith.constant 0 : index
%c1 = arith.constant 1 : index
%c4 = arith.constant 4 : index
%c16 = arith.constant 16 : index
%c64 = arith.constant 64 : index
%c4096 = arith.constant 4096 : index
%c65536 = arith.constant 65536 : index
%c67141632 = arith.constant 67141632 : index
%zero64 = arith.constant 0 : i64
%packA = arith.constant 257 : i32
%packB = arith.constant 513 : i32
%unpackFlags = arith.constant 1 : i32
%flags = arith.constant 0 : i32
%mr = arith.constant 6 : i32
%nr = arith.constant 16 : i32
%kr = arith.constant 8 : i32
%wg = hal.interface.workgroup.id[0] : index
%Bbuf = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : memref<16777216xf32>
%B = memref.reinterpret_cast %Bbuf to offset: [0], sizes: [], strides: [] : memref<16777216xf32> to memref<f32>
%BPbuf = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%c67141632) flags("Indirect") : memref<16777216xf32>
%BP = memref.reinterpret_cast %BPbuf to offset: [0], sizes: [], strides: [] : memref<16777216xf32> to memref<f32>
%ni = arith.divui %wg, %c64 : index
%ki = arith.remui %wg, %c64 : index
%no = arith.muli %ni, %c64 : index
%ko = arith.muli %ki, %c64 : index
%boff0 = arith.muli %ko, %c4096 : index
%boff = arith.addi %boff0, %no : index
%bpoff0 = arith.muli %no, %c4096 : index
%koff = arith.muli %ko, %c16 : index
%bpoff = arith.addi %bpoff0, %koff : index
%r1 = func.call @iree_uk_pack(%B, %boff, %c4096, %c1, %BP, %bpoff, %c65536, %c16, %c64, %c64, %c4, %c64, %c1, %c16, %zero64, %packB) : (memref<f32>, index, index, index, memref<f32>, index, index, index, index, index, index, index, index, index, i64, i32) -> i32
return
}
        iree_codegen.dispatch_config @_encoding_1_encode_4096x4096xf32_to_4096x4096xf32 workgroup_size = [1, 1, 1] {
^bb0(%dev: !hal.device):
%count = arith.constant 4096 : index
%one = arith.constant 1 : index
iree_codegen.yield %count, %one, %one : index, index, index
}
      }
    }
  }
  util.func public @gemm(%arg0: !hal.buffer_view, %arg1: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub, iree.reflection = {iree.abi.declaration = "sync func @gemm(%input0: tensor<4096x4096xf32>, %input1: tensor<4096x4096xf32>) -> (%output0: tensor<4096x4096xf32>)"}} {
    %c134217728 = arith.constant 134250496 : index
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
    %result_0, %result_timepoint_1 = stream.resource.alloca uninitialized on(#hal.device.affinity<@__device_0>) : !stream.resource<transient>{%c134217728} => !stream.timepoint
    %2 = stream.timepoint.join max(%result_timepoint, %result_timepoint_1) => !stream.timepoint
    %3 = stream.cmd.execute on(#hal.device.affinity<@__device_0>) await(%2) => with(%0 as %arg2: !stream.resource<external>{%c67108864}, %1 as %arg3: !stream.resource<external>{%c67108864}, %result as %arg4: !stream.resource<external>{%c67108864}, %result_0 as %arg5: !stream.resource<transient>{%c134217728}) {
      stream.cmd.concurrent {
        stream.cmd.dispatch @_encoding_0::@embedded_elf_x86_64::@_encoding_0_encode_4096x4096xf32_to_4096x4096xf32 {
          ro %arg2[%c0 for %c67108864] : !stream.resource<external>{%c67108864},
          wo %arg5[%c0 for %c134217728] : !stream.resource<transient>{%c134217728}
        }
        stream.cmd.dispatch @_encoding_1::@embedded_elf_x86_64::@_encoding_1_encode_4096x4096xf32_to_4096x4096xf32 {
          ro %arg3[%c0 for %c67108864] : !stream.resource<external>{%c67108864},
          wo %arg5[%c0 for %c134217728] : !stream.resource<transient>{%c134217728}
        }
      }
      stream.cmd.dispatch @gemm_dispatch_0::@embedded_elf_x86_64::@gemm_dispatch_0_matmul_4096x4096x4096_f32 {
        ro %arg5[%c0 for %c134217728] : !stream.resource<transient>{%c134217728},
        wo %arg4[%c0 for %c67108864] : !stream.resource<external>{%c67108864}
      }
    } => !stream.timepoint
    %4 = stream.resource.dealloca on(#hal.device.affinity<@__device_0>) await(%3) => %result_0 : !stream.resource<transient>{%c134217728} => !stream.timepoint
    %5 = stream.timepoint.await %4 => %result : !stream.resource<external>{%c67108864}
    %6 = stream.tensor.export on(#hal.device.affinity<@__device_0>) %5 : tensor<4096x4096xf32> in !stream.resource<external>{%c67108864} -> !hal.buffer_view
    util.return %6 : !hal.buffer_view
  }
}
