; ModuleID = 'final_linked'
source_filename = "final_linked"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-unknown-eabi-elf"

%iree_hal_executable_library_header_t = type { i32, ptr, i32, i32 }
%iree_hal_executable_dispatch_attrs_v0_t = type { i64, i16, i8, i8, i32, i32, i16, i16, i64, i64, i64, i64, i64 }
%iree_hal_executable_source_location_v0_t = type { i32, i32, ptr }
%iree_hal_executable_stage_location_table_v0_t = type { i32, ptr, ptr }
%iree_hal_executable_library_v0_t = type { ptr, %iree_hal_executable_import_table_v0_t, %iree_hal_executable_export_table_v0_t, %iree_hal_executable_constant_table_v0_t, %iree_hal_executable_source_file_table_v0_t }
%iree_hal_executable_import_table_v0_t = type { i32, ptr }
%iree_hal_executable_export_table_v0_t = type { i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }
%iree_hal_executable_constant_table_v0_t = type { i32 }
%iree_hal_executable_source_file_table_v0_t = type { i32, ptr }
%struct.exp2f_data = type { [32 x i64], double, [3 x double], double, double, [3 x double] }
%struct.powf_log2_data = type { [16 x %struct.anon], [5 x double] }
%struct.anon = type { double, double }
%struct.iree_uk_unpack_tmpbuf_helper_t = type { [4096 x i8], i32, [60 x i8] }
%struct.iree_uk_pack_tmpbuf_helper_t = type { [4096 x i8], i32, i8, [59 x i8] }

@0 = internal constant [13 x i8] c"final_linked\00", align 1
@iree_hal_executable_library_query_v0_header = internal constant %iree_hal_executable_library_header_t { i32 6, ptr @0, i32 0, i32 0 }
@iree_hal_executable_library_query_v0_funcs = internal constant [3 x ptr] [ptr @gemm_dispatch_0_matmul_2048x2048x2048_f32, ptr @_encoding_0_encode_2048x2048xf32_to_2048x2048xf32, ptr @_encoding_1_encode_2048x2048xf32_to_2048x2048xf32]
@iree_hal_executable_library_query_v0_attrs = internal constant [3 x %iree_hal_executable_dispatch_attrs_v0_t] [%iree_hal_executable_dispatch_attrs_v0_t { i64 0, i16 0, i8 0, i8 2, i32 1, i32 1, i16 1, i16 0, i64 0, i64 0, i64 0, i64 0, i64 0 }, %iree_hal_executable_dispatch_attrs_v0_t { i64 0, i16 0, i8 0, i8 2, i32 1, i32 1, i16 1, i16 0, i64 0, i64 0, i64 0, i64 0, i64 0 }, %iree_hal_executable_dispatch_attrs_v0_t { i64 0, i16 0, i8 0, i8 2, i32 1, i32 1, i16 1, i16 0, i64 0, i64 0, i64 0, i64 0, i64 0 }]
@1 = internal constant [42 x i8] c"gemm_dispatch_0_matmul_2048x2048x2048_f32\00", align 1
@2 = internal constant [50 x i8] c"_encoding_0_encode_2048x2048xf32_to_2048x2048xf32\00", align 1
@3 = internal constant [50 x i8] c"_encoding_1_encode_2048x2048xf32_to_2048x2048xf32\00", align 1
@iree_hal_executable_library_query_v0_names = internal constant [3 x ptr] [ptr @1, ptr @2, ptr @3]
@4 = internal constant [86 x i8] c"/tmp/iree-gemm-bench-confirmation/run-a/2048x2048x2048/04_full_pack_kernel/final.mlir\00", align 1
@5 = internal constant [86 x i8] c"/tmp/iree-gemm-bench-confirmation/run-a/2048x2048x2048/04_full_pack_kernel/final.mlir\00", align 1
@6 = internal constant [86 x i8] c"/tmp/iree-gemm-bench-confirmation/run-a/2048x2048x2048/04_full_pack_kernel/final.mlir\00", align 1
@iree_hal_executable_library_query_v0_source_locations = internal constant [3 x %iree_hal_executable_source_location_v0_t] [%iree_hal_executable_source_location_v0_t { i32 5, i32 85, ptr @4 }, %iree_hal_executable_source_location_v0_t { i32 126, i32 85, ptr @5 }, %iree_hal_executable_source_location_v0_t { i32 217, i32 85, ptr @6 }]
@iree_hal_executable_library_query_v0_gemm_dispatch_0_matmul_2048x2048x2048_f32_stage_names = internal constant [0 x ptr] zeroinitializer
@iree_hal_executable_library_query_v0_gemm_dispatch_0_matmul_2048x2048x2048_f32_stage_source_locations = internal constant [0 x %iree_hal_executable_source_location_v0_t] zeroinitializer
@iree_hal_executable_library_query_v0__encoding_0_encode_2048x2048xf32_to_2048x2048xf32_stage_names = internal constant [0 x ptr] zeroinitializer
@iree_hal_executable_library_query_v0__encoding_0_encode_2048x2048xf32_to_2048x2048xf32_stage_source_locations = internal constant [0 x %iree_hal_executable_source_location_v0_t] zeroinitializer
@iree_hal_executable_library_query_v0__encoding_1_encode_2048x2048xf32_to_2048x2048xf32_stage_names = internal constant [0 x ptr] zeroinitializer
@iree_hal_executable_library_query_v0__encoding_1_encode_2048x2048xf32_to_2048x2048xf32_stage_source_locations = internal constant [0 x %iree_hal_executable_source_location_v0_t] zeroinitializer
@iree_hal_executable_library_query_v0_stage_location_tables = internal constant [3 x %iree_hal_executable_stage_location_table_v0_t] [%iree_hal_executable_stage_location_table_v0_t { i32 0, ptr @iree_hal_executable_library_query_v0_gemm_dispatch_0_matmul_2048x2048x2048_f32_stage_names, ptr @iree_hal_executable_library_query_v0_gemm_dispatch_0_matmul_2048x2048x2048_f32_stage_source_locations }, %iree_hal_executable_stage_location_table_v0_t { i32 0, ptr @iree_hal_executable_library_query_v0__encoding_0_encode_2048x2048xf32_to_2048x2048xf32_stage_names, ptr @iree_hal_executable_library_query_v0__encoding_0_encode_2048x2048xf32_to_2048x2048xf32_stage_source_locations }, %iree_hal_executable_stage_location_table_v0_t { i32 0, ptr @iree_hal_executable_library_query_v0__encoding_1_encode_2048x2048xf32_to_2048x2048xf32_stage_names, ptr @iree_hal_executable_library_query_v0__encoding_1_encode_2048x2048xf32_to_2048x2048xf32_stage_source_locations }]
@iree_hal_executable_library_query_v0 = internal constant %iree_hal_executable_library_v0_t { ptr @iree_hal_executable_library_query_v0_header, %iree_hal_executable_import_table_v0_t zeroinitializer, %iree_hal_executable_export_table_v0_t { i32 3, ptr @iree_hal_executable_library_query_v0_funcs, ptr @iree_hal_executable_library_query_v0_attrs, ptr null, ptr null, ptr @iree_hal_executable_library_query_v0_names, ptr null, ptr null, ptr @iree_hal_executable_library_query_v0_source_locations, ptr @iree_hal_executable_library_query_v0_stage_location_tables }, %iree_hal_executable_constant_table_v0_t zeroinitializer, %iree_hal_executable_source_file_table_v0_t zeroinitializer }
@__exp2f_data = internal local_unnamed_addr constant %struct.exp2f_data { [32 x i64] [i64 4607182418800017408, i64 4607140297302181236, i64 4607100335213349135, i64 4607062579818421073, i64 4607027079437701499, i64 4606993883449571754, i64 4606963042313658936, i64 4606934607594512097, i64 4606908631985796885, i64 4606885169335019979, i64 4606864274668794914, i64 4606846004218661165, i64 4606830415447468583, i64 4606817567076339586, i64 4606807519112221737, i64 4606800332876043653, i64 4606796071031487437, i64 4606794797614391156, i64 4606796578062795143, i64 4606801479247646227, i64 4606809569504174299, i64 4606820918663955941, i64 4606835598087680144, i64 4606853680698631517, i64 4606875241016906669, i64 4606900355194379847, i64 4606929101050434204, i64 4606961558108475497, i64 4606997807633245319, i64 4607037932668951391, i64 4607082018078232794, i64 4607130150581978432], double f0x42E8000000000000, [3 x double] [double f0x3FAC6AF84B912394, double f0x3FCEBFCE50FAC4F3, double f0x3FE62E42FF0C52D6], double f0x4338000000000000, double f0x40471547652B82FE, [3 x double] [double f0x3EBC6AF84B912394, double f0x3F2EBFCE50FAC4F3, double f0x3F962E42FF0C52D6] }, align 8
@__powf_log2_data = internal local_unnamed_addr constant %struct.powf_log2_data { [16 x %struct.anon] [%struct.anon { double f0x3FF661EC79F8F3BE, double f0xBFDEFEC65B963019 }, %struct.anon { double f0x3FF571ED4AAF883D, double f0xBFDB0B6832D4FCA4 }, %struct.anon { double f0x3FF49539F0F010B0, double f0xBFD7418B0A1FB77B }, %struct.anon { double f0x3FF3C995B0B80385, double f0xBFD39DE91A6DCF7B }, %struct.anon { double f0x3FF30D190C8864A5, double f0xBFD01D9BF3F2B631 }, %struct.anon { double f0x3FF25E227B0B8EA0, double f0xBFC97C1D1B3B7AF0 }, %struct.anon { double f0x3FF1BB4A4A1A343F, double f0xBFC2F9E393AF3C9F }, %struct.anon { double f0x3FF12358F08AE5BA, double f0xBFB960CBBF788D5C }, %struct.anon { double f0x3FF0953F419900A7, double f0xBFAA6F9DB6475FCE }, %struct.anon { double 1.000000e+00, double 0.000000e+00 }, %struct.anon { double f0x3FEE608CFD9A47AC, double f0x3FB338CA9F24F53D }, %struct.anon { double f0x3FECA4B31F026AA0, double f0x3FC476A9543891BA }, %struct.anon { double f0x3FEB2036576AFCE6, double f0x3FCE840B4AC4E4D2 }, %struct.anon { double f0x3FE9C2D163A1AA2D, double f0x3FD40645F0C6651C }, %struct.anon { double f0x3FE886E6037841ED, double f0x3FD88E9C2C1B9FF8 }, %struct.anon { double f0x3FE767DCF5534862, double f0x3FDCE0A44EB17BCC }], [5 x double] [double f0x3FD27616C9496E0B, double f0xBFD71969A075C67A, double f0x3FDEC70A6CA7BADD, double f0xBFE7154748BEF6C8, double f0x3FF71547652AB82B] }, align 8

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, target_mem: none)
define internal noundef i32 @gemm_dispatch_0_matmul_2048x2048x2048_f32(ptr noalias nofree nonnull readonly align 16 captures(none) %0, ptr noalias nofree noundef nonnull readonly align 16 captures(none) %1, ptr noalias nofree noundef nonnull readonly align 16 captures(none) %2) #0 {
  %4 = alloca %struct.iree_uk_unpack_tmpbuf_helper_t, align 64
  %5 = load i32, ptr %2, align 16
  %6 = zext i32 %5 to i64
  %.elt19 = getelementptr inbounds nuw i8, ptr %1, i64 32
  %.unpack20 = load ptr, ptr %.elt19, align 16
  %7 = load ptr, ptr %.unpack20, align 8
  call void @llvm.assume(i1 true) [ "align"(ptr %7, i64 64) ]
  %8 = getelementptr i8, ptr %7, i64 16809984
  %9 = getelementptr i8, ptr %.unpack20, i64 8
  %10 = load ptr, ptr %9, align 8
  call void @llvm.assume(i1 true) [ "align"(ptr %10, i64 64) ]
  %11 = alloca [192 x float], align 64
  %12 = lshr i64 %6, 6
  %13 = and i64 %6, 63
  %.idx51 = mul nuw nsw i64 %12, 49152
  %14 = getelementptr inbounds nuw i8, ptr %7, i64 %.idx51
  %.idx = shl nuw nsw i64 %13, 18
  %15 = getelementptr inbounds nuw i8, ptr %8, i64 %.idx
  br label %16

16:                                               ; preds = %358, %3
  %17 = phi i1 [ false, %3 ], [ true, %358 ]
  %18 = phi i64 [ 0, %3 ], [ 1, %358 ]
  %.idx50 = shl nuw nsw i64 %18, 17
  %19 = getelementptr inbounds nuw i8, ptr %15, i64 %.idx50
  br label %20

20:                                               ; preds = %20, %16
  %21 = phi ptr [ %354, %20 ], [ %14, %16 ]
  %22 = phi ptr [ %355, %20 ], [ %19, %16 ]
  %23 = phi <8 x float> [ %322, %20 ], [ zeroinitializer, %16 ]
  %24 = phi <8 x float> [ %323, %20 ], [ zeroinitializer, %16 ]
  %25 = phi <8 x float> [ %328, %20 ], [ zeroinitializer, %16 ]
  %26 = phi <8 x float> [ %329, %20 ], [ zeroinitializer, %16 ]
  %27 = phi <8 x float> [ %334, %20 ], [ zeroinitializer, %16 ]
  %28 = phi <8 x float> [ %335, %20 ], [ zeroinitializer, %16 ]
  %29 = phi <8 x float> [ %340, %20 ], [ zeroinitializer, %16 ]
  %30 = phi <8 x float> [ %341, %20 ], [ zeroinitializer, %16 ]
  %31 = phi <8 x float> [ %346, %20 ], [ zeroinitializer, %16 ]
  %32 = phi <8 x float> [ %347, %20 ], [ zeroinitializer, %16 ]
  %33 = phi <8 x float> [ %352, %20 ], [ zeroinitializer, %16 ]
  %34 = phi <8 x float> [ %353, %20 ], [ zeroinitializer, %16 ]
  %35 = phi i64 [ %356, %20 ], [ 0, %16 ]
  %36 = load <8 x float>, ptr %22, align 64, !tbaa !16
  %37 = getelementptr inbounds nuw i8, ptr %22, i64 32
  %38 = load <8 x float>, ptr %37, align 32, !tbaa !16
  %39 = load float, ptr %21, align 64, !tbaa !16
  %40 = insertelement <8 x float> poison, float %39, i64 0
  %41 = shufflevector <8 x float> %40, <8 x float> poison, <8 x i32> zeroinitializer
  %42 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %41, <8 x float> %36, <8 x float> %23)
  %43 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %41, <8 x float> %38, <8 x float> %24)
  %44 = getelementptr inbounds nuw i8, ptr %21, i64 4
  %45 = load float, ptr %44, align 4, !tbaa !16
  %46 = insertelement <8 x float> poison, float %45, i64 0
  %47 = shufflevector <8 x float> %46, <8 x float> poison, <8 x i32> zeroinitializer
  %48 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %47, <8 x float> %36, <8 x float> %25)
  %49 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %47, <8 x float> %38, <8 x float> %26)
  %50 = getelementptr inbounds nuw i8, ptr %21, i64 8
  %51 = load float, ptr %50, align 8, !tbaa !16
  %52 = insertelement <8 x float> poison, float %51, i64 0
  %53 = shufflevector <8 x float> %52, <8 x float> poison, <8 x i32> zeroinitializer
  %54 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %53, <8 x float> %36, <8 x float> %27)
  %55 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %53, <8 x float> %38, <8 x float> %28)
  %56 = getelementptr inbounds nuw i8, ptr %21, i64 12
  %57 = load float, ptr %56, align 1, !tbaa !16
  %58 = insertelement <8 x float> poison, float %57, i64 0
  %59 = shufflevector <8 x float> %58, <8 x float> poison, <8 x i32> zeroinitializer
  %60 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %59, <8 x float> %36, <8 x float> %29)
  %61 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %59, <8 x float> %38, <8 x float> %30)
  %62 = getelementptr inbounds nuw i8, ptr %21, i64 16
  %63 = load float, ptr %62, align 16, !tbaa !16
  %64 = insertelement <8 x float> poison, float %63, i64 0
  %65 = shufflevector <8 x float> %64, <8 x float> poison, <8 x i32> zeroinitializer
  %66 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %65, <8 x float> %36, <8 x float> %31)
  %67 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %65, <8 x float> %38, <8 x float> %32)
  %68 = getelementptr inbounds nuw i8, ptr %21, i64 20
  %69 = load float, ptr %68, align 1, !tbaa !16
  %70 = insertelement <8 x float> poison, float %69, i64 0
  %71 = shufflevector <8 x float> %70, <8 x float> poison, <8 x i32> zeroinitializer
  %72 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %71, <8 x float> %36, <8 x float> %33)
  %73 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %71, <8 x float> %38, <8 x float> %34)
  %74 = getelementptr inbounds nuw i8, ptr %22, i64 64
  %75 = load <8 x float>, ptr %74, align 64, !tbaa !16
  %76 = getelementptr inbounds nuw i8, ptr %22, i64 96
  %77 = load <8 x float>, ptr %76, align 32, !tbaa !16
  %78 = getelementptr inbounds nuw i8, ptr %21, i64 24
  %79 = load float, ptr %78, align 1, !tbaa !16
  %80 = insertelement <8 x float> poison, float %79, i64 0
  %81 = shufflevector <8 x float> %80, <8 x float> poison, <8 x i32> zeroinitializer
  %82 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %81, <8 x float> %75, <8 x float> %42)
  %83 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %81, <8 x float> %77, <8 x float> %43)
  %84 = getelementptr inbounds nuw i8, ptr %21, i64 28
  %85 = load float, ptr %84, align 1, !tbaa !16
  %86 = insertelement <8 x float> poison, float %85, i64 0
  %87 = shufflevector <8 x float> %86, <8 x float> poison, <8 x i32> zeroinitializer
  %88 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %87, <8 x float> %75, <8 x float> %48)
  %89 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %87, <8 x float> %77, <8 x float> %49)
  %90 = getelementptr inbounds nuw i8, ptr %21, i64 32
  %91 = load float, ptr %90, align 32, !tbaa !16
  %92 = insertelement <8 x float> poison, float %91, i64 0
  %93 = shufflevector <8 x float> %92, <8 x float> poison, <8 x i32> zeroinitializer
  %94 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %93, <8 x float> %75, <8 x float> %54)
  %95 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %93, <8 x float> %77, <8 x float> %55)
  %96 = getelementptr inbounds nuw i8, ptr %21, i64 36
  %97 = load float, ptr %96, align 1, !tbaa !16
  %98 = insertelement <8 x float> poison, float %97, i64 0
  %99 = shufflevector <8 x float> %98, <8 x float> poison, <8 x i32> zeroinitializer
  %100 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %99, <8 x float> %75, <8 x float> %60)
  %101 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %99, <8 x float> %77, <8 x float> %61)
  %102 = getelementptr inbounds nuw i8, ptr %21, i64 40
  %103 = load float, ptr %102, align 1, !tbaa !16
  %104 = insertelement <8 x float> poison, float %103, i64 0
  %105 = shufflevector <8 x float> %104, <8 x float> poison, <8 x i32> zeroinitializer
  %106 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %105, <8 x float> %75, <8 x float> %66)
  %107 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %105, <8 x float> %77, <8 x float> %67)
  %108 = getelementptr inbounds nuw i8, ptr %21, i64 44
  %109 = load float, ptr %108, align 1, !tbaa !16
  %110 = insertelement <8 x float> poison, float %109, i64 0
  %111 = shufflevector <8 x float> %110, <8 x float> poison, <8 x i32> zeroinitializer
  %112 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %111, <8 x float> %75, <8 x float> %72)
  %113 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %111, <8 x float> %77, <8 x float> %73)
  %114 = getelementptr inbounds nuw i8, ptr %22, i64 128
  %115 = load <8 x float>, ptr %114, align 64, !tbaa !16
  %116 = getelementptr inbounds nuw i8, ptr %22, i64 160
  %117 = load <8 x float>, ptr %116, align 32, !tbaa !16
  %118 = getelementptr inbounds nuw i8, ptr %21, i64 48
  %119 = load float, ptr %118, align 1, !tbaa !16
  %120 = insertelement <8 x float> poison, float %119, i64 0
  %121 = shufflevector <8 x float> %120, <8 x float> poison, <8 x i32> zeroinitializer
  %122 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %121, <8 x float> %115, <8 x float> %82)
  %123 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %121, <8 x float> %117, <8 x float> %83)
  %124 = getelementptr inbounds nuw i8, ptr %21, i64 52
  %125 = load float, ptr %124, align 1, !tbaa !16
  %126 = insertelement <8 x float> poison, float %125, i64 0
  %127 = shufflevector <8 x float> %126, <8 x float> poison, <8 x i32> zeroinitializer
  %128 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %127, <8 x float> %115, <8 x float> %88)
  %129 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %127, <8 x float> %117, <8 x float> %89)
  %130 = getelementptr inbounds nuw i8, ptr %21, i64 56
  %131 = load float, ptr %130, align 1, !tbaa !16
  %132 = insertelement <8 x float> poison, float %131, i64 0
  %133 = shufflevector <8 x float> %132, <8 x float> poison, <8 x i32> zeroinitializer
  %134 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %133, <8 x float> %115, <8 x float> %94)
  %135 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %133, <8 x float> %117, <8 x float> %95)
  %136 = getelementptr inbounds nuw i8, ptr %21, i64 60
  %137 = load float, ptr %136, align 1, !tbaa !16
  %138 = insertelement <8 x float> poison, float %137, i64 0
  %139 = shufflevector <8 x float> %138, <8 x float> poison, <8 x i32> zeroinitializer
  %140 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %139, <8 x float> %115, <8 x float> %100)
  %141 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %139, <8 x float> %117, <8 x float> %101)
  %142 = getelementptr inbounds nuw i8, ptr %21, i64 64
  %143 = load float, ptr %142, align 64, !tbaa !16
  %144 = insertelement <8 x float> poison, float %143, i64 0
  %145 = shufflevector <8 x float> %144, <8 x float> poison, <8 x i32> zeroinitializer
  %146 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %145, <8 x float> %115, <8 x float> %106)
  %147 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %145, <8 x float> %117, <8 x float> %107)
  %148 = getelementptr inbounds nuw i8, ptr %21, i64 68
  %149 = load float, ptr %148, align 4, !tbaa !16
  %150 = insertelement <8 x float> poison, float %149, i64 0
  %151 = shufflevector <8 x float> %150, <8 x float> poison, <8 x i32> zeroinitializer
  %152 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %151, <8 x float> %115, <8 x float> %112)
  %153 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %151, <8 x float> %117, <8 x float> %113)
  %154 = getelementptr inbounds nuw i8, ptr %22, i64 192
  %155 = load <8 x float>, ptr %154, align 64, !tbaa !16
  %156 = getelementptr inbounds nuw i8, ptr %22, i64 224
  %157 = load <8 x float>, ptr %156, align 32, !tbaa !16
  %158 = getelementptr inbounds nuw i8, ptr %21, i64 72
  %159 = load float, ptr %158, align 8, !tbaa !16
  %160 = insertelement <8 x float> poison, float %159, i64 0
  %161 = shufflevector <8 x float> %160, <8 x float> poison, <8 x i32> zeroinitializer
  %162 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %161, <8 x float> %155, <8 x float> %122)
  %163 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %161, <8 x float> %157, <8 x float> %123)
  %164 = getelementptr inbounds nuw i8, ptr %21, i64 76
  %165 = load float, ptr %164, align 1, !tbaa !16
  %166 = insertelement <8 x float> poison, float %165, i64 0
  %167 = shufflevector <8 x float> %166, <8 x float> poison, <8 x i32> zeroinitializer
  %168 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %167, <8 x float> %155, <8 x float> %128)
  %169 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %167, <8 x float> %157, <8 x float> %129)
  %170 = getelementptr inbounds nuw i8, ptr %21, i64 80
  %171 = load float, ptr %170, align 16, !tbaa !16
  %172 = insertelement <8 x float> poison, float %171, i64 0
  %173 = shufflevector <8 x float> %172, <8 x float> poison, <8 x i32> zeroinitializer
  %174 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %173, <8 x float> %155, <8 x float> %134)
  %175 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %173, <8 x float> %157, <8 x float> %135)
  %176 = getelementptr inbounds nuw i8, ptr %21, i64 84
  %177 = load float, ptr %176, align 1, !tbaa !16
  %178 = insertelement <8 x float> poison, float %177, i64 0
  %179 = shufflevector <8 x float> %178, <8 x float> poison, <8 x i32> zeroinitializer
  %180 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %179, <8 x float> %155, <8 x float> %140)
  %181 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %179, <8 x float> %157, <8 x float> %141)
  %182 = getelementptr inbounds nuw i8, ptr %21, i64 88
  %183 = load float, ptr %182, align 1, !tbaa !16
  %184 = insertelement <8 x float> poison, float %183, i64 0
  %185 = shufflevector <8 x float> %184, <8 x float> poison, <8 x i32> zeroinitializer
  %186 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %185, <8 x float> %155, <8 x float> %146)
  %187 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %185, <8 x float> %157, <8 x float> %147)
  %188 = getelementptr inbounds nuw i8, ptr %21, i64 92
  %189 = load float, ptr %188, align 1, !tbaa !16
  %190 = insertelement <8 x float> poison, float %189, i64 0
  %191 = shufflevector <8 x float> %190, <8 x float> poison, <8 x i32> zeroinitializer
  %192 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %191, <8 x float> %155, <8 x float> %152)
  %193 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %191, <8 x float> %157, <8 x float> %153)
  %194 = getelementptr inbounds nuw i8, ptr %22, i64 256
  %195 = load <8 x float>, ptr %194, align 64, !tbaa !16
  %196 = getelementptr inbounds nuw i8, ptr %22, i64 288
  %197 = load <8 x float>, ptr %196, align 32, !tbaa !16
  %198 = getelementptr inbounds nuw i8, ptr %21, i64 96
  %199 = load float, ptr %198, align 32, !tbaa !16
  %200 = insertelement <8 x float> poison, float %199, i64 0
  %201 = shufflevector <8 x float> %200, <8 x float> poison, <8 x i32> zeroinitializer
  %202 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %201, <8 x float> %195, <8 x float> %162)
  %203 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %201, <8 x float> %197, <8 x float> %163)
  %204 = getelementptr inbounds nuw i8, ptr %21, i64 100
  %205 = load float, ptr %204, align 1, !tbaa !16
  %206 = insertelement <8 x float> poison, float %205, i64 0
  %207 = shufflevector <8 x float> %206, <8 x float> poison, <8 x i32> zeroinitializer
  %208 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %207, <8 x float> %195, <8 x float> %168)
  %209 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %207, <8 x float> %197, <8 x float> %169)
  %210 = getelementptr inbounds nuw i8, ptr %21, i64 104
  %211 = load float, ptr %210, align 1, !tbaa !16
  %212 = insertelement <8 x float> poison, float %211, i64 0
  %213 = shufflevector <8 x float> %212, <8 x float> poison, <8 x i32> zeroinitializer
  %214 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %213, <8 x float> %195, <8 x float> %174)
  %215 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %213, <8 x float> %197, <8 x float> %175)
  %216 = getelementptr inbounds nuw i8, ptr %21, i64 108
  %217 = load float, ptr %216, align 1, !tbaa !16
  %218 = insertelement <8 x float> poison, float %217, i64 0
  %219 = shufflevector <8 x float> %218, <8 x float> poison, <8 x i32> zeroinitializer
  %220 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %219, <8 x float> %195, <8 x float> %180)
  %221 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %219, <8 x float> %197, <8 x float> %181)
  %222 = getelementptr inbounds nuw i8, ptr %21, i64 112
  %223 = load float, ptr %222, align 1, !tbaa !16
  %224 = insertelement <8 x float> poison, float %223, i64 0
  %225 = shufflevector <8 x float> %224, <8 x float> poison, <8 x i32> zeroinitializer
  %226 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %225, <8 x float> %195, <8 x float> %186)
  %227 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %225, <8 x float> %197, <8 x float> %187)
  %228 = getelementptr inbounds nuw i8, ptr %21, i64 116
  %229 = load float, ptr %228, align 1, !tbaa !16
  %230 = insertelement <8 x float> poison, float %229, i64 0
  %231 = shufflevector <8 x float> %230, <8 x float> poison, <8 x i32> zeroinitializer
  %232 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %231, <8 x float> %195, <8 x float> %192)
  %233 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %231, <8 x float> %197, <8 x float> %193)
  %234 = getelementptr inbounds nuw i8, ptr %22, i64 320
  %235 = load <8 x float>, ptr %234, align 64, !tbaa !16
  %236 = getelementptr inbounds nuw i8, ptr %22, i64 352
  %237 = load <8 x float>, ptr %236, align 32, !tbaa !16
  %238 = getelementptr inbounds nuw i8, ptr %21, i64 120
  %239 = load float, ptr %238, align 1, !tbaa !16
  %240 = insertelement <8 x float> poison, float %239, i64 0
  %241 = shufflevector <8 x float> %240, <8 x float> poison, <8 x i32> zeroinitializer
  %242 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %241, <8 x float> %235, <8 x float> %202)
  %243 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %241, <8 x float> %237, <8 x float> %203)
  %244 = getelementptr inbounds nuw i8, ptr %21, i64 124
  %245 = load float, ptr %244, align 1, !tbaa !16
  %246 = insertelement <8 x float> poison, float %245, i64 0
  %247 = shufflevector <8 x float> %246, <8 x float> poison, <8 x i32> zeroinitializer
  %248 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %247, <8 x float> %235, <8 x float> %208)
  %249 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %247, <8 x float> %237, <8 x float> %209)
  %250 = getelementptr inbounds nuw i8, ptr %21, i64 128
  %251 = load float, ptr %250, align 64, !tbaa !16
  %252 = insertelement <8 x float> poison, float %251, i64 0
  %253 = shufflevector <8 x float> %252, <8 x float> poison, <8 x i32> zeroinitializer
  %254 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %253, <8 x float> %235, <8 x float> %214)
  %255 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %253, <8 x float> %237, <8 x float> %215)
  %256 = getelementptr inbounds nuw i8, ptr %21, i64 132
  %257 = load float, ptr %256, align 4, !tbaa !16
  %258 = insertelement <8 x float> poison, float %257, i64 0
  %259 = shufflevector <8 x float> %258, <8 x float> poison, <8 x i32> zeroinitializer
  %260 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %259, <8 x float> %235, <8 x float> %220)
  %261 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %259, <8 x float> %237, <8 x float> %221)
  %262 = getelementptr inbounds nuw i8, ptr %21, i64 136
  %263 = load float, ptr %262, align 8, !tbaa !16
  %264 = insertelement <8 x float> poison, float %263, i64 0
  %265 = shufflevector <8 x float> %264, <8 x float> poison, <8 x i32> zeroinitializer
  %266 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %265, <8 x float> %235, <8 x float> %226)
  %267 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %265, <8 x float> %237, <8 x float> %227)
  %268 = getelementptr inbounds nuw i8, ptr %21, i64 140
  %269 = load float, ptr %268, align 1, !tbaa !16
  %270 = insertelement <8 x float> poison, float %269, i64 0
  %271 = shufflevector <8 x float> %270, <8 x float> poison, <8 x i32> zeroinitializer
  %272 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %271, <8 x float> %235, <8 x float> %232)
  %273 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %271, <8 x float> %237, <8 x float> %233)
  %274 = getelementptr inbounds nuw i8, ptr %22, i64 384
  %275 = load <8 x float>, ptr %274, align 64, !tbaa !16
  %276 = getelementptr inbounds nuw i8, ptr %22, i64 416
  %277 = load <8 x float>, ptr %276, align 32, !tbaa !16
  %278 = getelementptr inbounds nuw i8, ptr %21, i64 144
  %279 = load float, ptr %278, align 16, !tbaa !16
  %280 = insertelement <8 x float> poison, float %279, i64 0
  %281 = shufflevector <8 x float> %280, <8 x float> poison, <8 x i32> zeroinitializer
  %282 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %281, <8 x float> %275, <8 x float> %242)
  %283 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %281, <8 x float> %277, <8 x float> %243)
  %284 = getelementptr inbounds nuw i8, ptr %21, i64 148
  %285 = load float, ptr %284, align 1, !tbaa !16
  %286 = insertelement <8 x float> poison, float %285, i64 0
  %287 = shufflevector <8 x float> %286, <8 x float> poison, <8 x i32> zeroinitializer
  %288 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %287, <8 x float> %275, <8 x float> %248)
  %289 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %287, <8 x float> %277, <8 x float> %249)
  %290 = getelementptr inbounds nuw i8, ptr %21, i64 152
  %291 = load float, ptr %290, align 1, !tbaa !16
  %292 = insertelement <8 x float> poison, float %291, i64 0
  %293 = shufflevector <8 x float> %292, <8 x float> poison, <8 x i32> zeroinitializer
  %294 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %293, <8 x float> %275, <8 x float> %254)
  %295 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %293, <8 x float> %277, <8 x float> %255)
  %296 = getelementptr inbounds nuw i8, ptr %21, i64 156
  %297 = load float, ptr %296, align 1, !tbaa !16
  %298 = insertelement <8 x float> poison, float %297, i64 0
  %299 = shufflevector <8 x float> %298, <8 x float> poison, <8 x i32> zeroinitializer
  %300 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %299, <8 x float> %275, <8 x float> %260)
  %301 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %299, <8 x float> %277, <8 x float> %261)
  %302 = getelementptr inbounds nuw i8, ptr %21, i64 160
  %303 = load float, ptr %302, align 32, !tbaa !16
  %304 = insertelement <8 x float> poison, float %303, i64 0
  %305 = shufflevector <8 x float> %304, <8 x float> poison, <8 x i32> zeroinitializer
  %306 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %305, <8 x float> %275, <8 x float> %266)
  %307 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %305, <8 x float> %277, <8 x float> %267)
  %308 = getelementptr inbounds nuw i8, ptr %21, i64 164
  %309 = load float, ptr %308, align 1, !tbaa !16
  %310 = insertelement <8 x float> poison, float %309, i64 0
  %311 = shufflevector <8 x float> %310, <8 x float> poison, <8 x i32> zeroinitializer
  %312 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %311, <8 x float> %275, <8 x float> %272)
  %313 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %311, <8 x float> %277, <8 x float> %273)
  %314 = getelementptr inbounds nuw i8, ptr %22, i64 448
  %315 = load <8 x float>, ptr %314, align 64, !tbaa !16
  %316 = getelementptr inbounds nuw i8, ptr %22, i64 480
  %317 = load <8 x float>, ptr %316, align 32, !tbaa !16
  %318 = getelementptr inbounds nuw i8, ptr %21, i64 168
  %319 = load float, ptr %318, align 1, !tbaa !16
  %320 = insertelement <8 x float> poison, float %319, i64 0
  %321 = shufflevector <8 x float> %320, <8 x float> poison, <8 x i32> zeroinitializer
  %322 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %321, <8 x float> %315, <8 x float> %282)
  %323 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %321, <8 x float> %317, <8 x float> %283)
  %324 = getelementptr inbounds nuw i8, ptr %21, i64 172
  %325 = load float, ptr %324, align 1, !tbaa !16
  %326 = insertelement <8 x float> poison, float %325, i64 0
  %327 = shufflevector <8 x float> %326, <8 x float> poison, <8 x i32> zeroinitializer
  %328 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %327, <8 x float> %315, <8 x float> %288)
  %329 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %327, <8 x float> %317, <8 x float> %289)
  %330 = getelementptr inbounds nuw i8, ptr %21, i64 176
  %331 = load float, ptr %330, align 1, !tbaa !16
  %332 = insertelement <8 x float> poison, float %331, i64 0
  %333 = shufflevector <8 x float> %332, <8 x float> poison, <8 x i32> zeroinitializer
  %334 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %333, <8 x float> %315, <8 x float> %294)
  %335 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %333, <8 x float> %317, <8 x float> %295)
  %336 = getelementptr inbounds nuw i8, ptr %21, i64 180
  %337 = load float, ptr %336, align 1, !tbaa !16
  %338 = insertelement <8 x float> poison, float %337, i64 0
  %339 = shufflevector <8 x float> %338, <8 x float> poison, <8 x i32> zeroinitializer
  %340 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %339, <8 x float> %315, <8 x float> %300)
  %341 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %339, <8 x float> %317, <8 x float> %301)
  %342 = getelementptr inbounds nuw i8, ptr %21, i64 184
  %343 = load float, ptr %342, align 1, !tbaa !16
  %344 = insertelement <8 x float> poison, float %343, i64 0
  %345 = shufflevector <8 x float> %344, <8 x float> poison, <8 x i32> zeroinitializer
  %346 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %345, <8 x float> %315, <8 x float> %306)
  %347 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %345, <8 x float> %317, <8 x float> %307)
  %348 = getelementptr inbounds nuw i8, ptr %21, i64 188
  %349 = load float, ptr %348, align 1, !tbaa !16
  %350 = insertelement <8 x float> poison, float %349, i64 0
  %351 = shufflevector <8 x float> %350, <8 x float> poison, <8 x i32> zeroinitializer
  %352 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %351, <8 x float> %315, <8 x float> %312)
  %353 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %351, <8 x float> %317, <8 x float> %313)
  %354 = getelementptr inbounds nuw i8, ptr %21, i64 192
  %355 = getelementptr inbounds nuw i8, ptr %22, i64 512
  %356 = add nuw nsw i64 %35, 1
  %357 = icmp eq i64 %356, 256
  br i1 %357, label %358, label %20, !llvm.loop !13

358:                                              ; preds = %20
  %359 = mul nuw nsw i64 %18, 384
  %360 = getelementptr inbounds nuw i8, ptr %11, i64 %359
  store <8 x float> %322, ptr %360, align 64, !tbaa !16
  %361 = getelementptr inbounds nuw i8, ptr %360, i64 32
  store <8 x float> %323, ptr %361, align 32, !tbaa !16
  %362 = getelementptr inbounds nuw i8, ptr %360, i64 64
  store <8 x float> %328, ptr %362, align 64, !tbaa !16
  %363 = getelementptr inbounds nuw i8, ptr %360, i64 96
  store <8 x float> %329, ptr %363, align 32, !tbaa !16
  %364 = getelementptr inbounds nuw i8, ptr %360, i64 128
  store <8 x float> %334, ptr %364, align 64, !tbaa !16
  %365 = getelementptr inbounds nuw i8, ptr %360, i64 160
  store <8 x float> %335, ptr %365, align 32, !tbaa !16
  %366 = getelementptr inbounds nuw i8, ptr %360, i64 192
  store <8 x float> %340, ptr %366, align 64, !tbaa !16
  %367 = getelementptr inbounds nuw i8, ptr %360, i64 224
  store <8 x float> %341, ptr %367, align 32, !tbaa !16
  %368 = getelementptr inbounds nuw i8, ptr %360, i64 256
  store <8 x float> %346, ptr %368, align 64, !tbaa !16
  %369 = getelementptr inbounds nuw i8, ptr %360, i64 288
  store <8 x float> %347, ptr %369, align 32, !tbaa !16
  %370 = getelementptr inbounds nuw i8, ptr %360, i64 320
  store <8 x float> %352, ptr %370, align 64, !tbaa !16
  %371 = getelementptr inbounds nuw i8, ptr %360, i64 352
  store <8 x float> %353, ptr %371, align 32, !tbaa !16
  br i1 %17, label %custom_mmt4d_6x16x8.exit, label %16, !llvm.loop !14

custom_mmt4d_6x16x8.exit:                         ; preds = %358
  %.neg = mul nsw i64 %12, -6
  %372 = add nsw i64 %.neg, 2048
  %373 = tail call i64 @llvm.umin.i64(i64 %372, i64 6)
  %374 = icmp eq i64 %372, 0
  br i1 %374, label %iree_uk_unpack_p.exit, label %375

375:                                              ; preds = %custom_mmt4d_6x16x8.exit
  %376 = shl nuw nsw i64 %13, 7
  %377 = getelementptr inbounds nuw i8, ptr %10, i64 %376
  %378 = getelementptr inbounds nuw i8, ptr %377, i64 %.idx51
  call void @llvm.lifetime.start.p0(ptr nonnull %4) #14
  %379 = getelementptr inbounds nuw i8, ptr %4, i64 4096
  store i32 8, ptr %379, align 64, !tbaa !148
  %.not = icmp ugt i64 %372, 5
  br i1 %.not, label %iree_uk_unpack_row_using_tile_func.exit23, label %.thread

iree_uk_unpack_row_using_tile_func.exit23:        ; preds = %375
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2454)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2456)
  br label %380

380:                                              ; preds = %402, %iree_uk_unpack_row_using_tile_func.exit23
  %381 = phi i1 [ true, %402 ], [ false, %iree_uk_unpack_row_using_tile_func.exit23 ]
  %382 = phi ptr [ %404, %402 ], [ %378, %iree_uk_unpack_row_using_tile_func.exit23 ]
  %383 = phi ptr [ %403, %402 ], [ %11, %iree_uk_unpack_row_using_tile_func.exit23 ]
  br label %384

384:                                              ; preds = %397, %380
  %385 = phi i64 [ 0, %380 ], [ %400, %397 ]
  %386 = phi ptr [ %382, %380 ], [ %399, %397 ]
  %387 = phi ptr [ %383, %380 ], [ %398, %397 ]
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2447)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2448)
  br label %.preheader.i

.preheader.i:                                     ; preds = %.preheader.i, %384
  %388 = phi i64 [ %395, %.preheader.i ], [ 0, %384 ]
  %389 = getelementptr inbounds nuw i8, ptr %387, i64 %388
  %390 = getelementptr inbounds nuw i8, ptr %389, i64 16
  %391 = load <16 x i8>, ptr %389, align 1, !tbaa !16, !alias.scope !2458, !noalias !2457
  %392 = load <16 x i8>, ptr %390, align 1, !tbaa !16, !alias.scope !2458, !noalias !2457
  %393 = getelementptr inbounds nuw i8, ptr %386, i64 %388
  %394 = getelementptr inbounds nuw i8, ptr %393, i64 16
  store <16 x i8> %391, ptr %393, align 32, !tbaa !16, !alias.scope !2457, !noalias !2458
  store <16 x i8> %392, ptr %394, align 16, !tbaa !16, !alias.scope !2457, !noalias !2458
  %395 = add nuw nsw i64 %388, 32
  %396 = icmp eq i64 %395, 64
  br i1 %396, label %397, label %.preheader.i, !llvm.loop !1516

397:                                              ; preds = %.preheader.i
  %398 = getelementptr inbounds nuw i8, ptr %387, i64 64
  %399 = getelementptr inbounds nuw i8, ptr %386, i64 8192
  %400 = add nuw nsw i64 %385, 1
  %401 = icmp eq i64 %400, 6
  br i1 %401, label %402, label %384, !llvm.loop !1519

402:                                              ; preds = %397
  %403 = getelementptr inbounds nuw i8, ptr %383, i64 384
  %404 = getelementptr inbounds nuw i8, ptr %382, i64 64
  br i1 %381, label %iree_uk_unpack_tile_generic_direct.exit, label %380, !llvm.loop !1520

.thread:                                          ; preds = %375, %.loopexit53
  %405 = phi i64 [ %463, %.loopexit53 ], [ 0, %375 ]
  %406 = sub nsw i64 2, %405
  %407 = load i32, ptr %379, align 64, !tbaa !148
  %408 = sext i32 %407 to i64
  %409 = tail call noundef i64 @llvm.smin.i64(i64 %408, i64 %406)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2471)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2473)
  %410 = icmp sgt i64 %409, 0
  br i1 %410, label %411, label %.loopexit53

411:                                              ; preds = %.thread
  %412 = mul i64 %405, 384
  %413 = getelementptr inbounds i8, ptr %11, i64 %412
  %414 = shl nuw nsw i64 %409, 6
  br label %415

415:                                              ; preds = %437, %411
  %416 = phi i64 [ %440, %437 ], [ 0, %411 ]
  %417 = phi ptr [ %439, %437 ], [ %4, %411 ]
  %418 = phi ptr [ %438, %437 ], [ %413, %411 ]
  br label %419

419:                                              ; preds = %432, %415
  %420 = phi i64 [ 0, %415 ], [ %435, %432 ]
  %421 = phi ptr [ %417, %415 ], [ %434, %432 ]
  %422 = phi ptr [ %418, %415 ], [ %433, %432 ]
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2464)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2465)
  br label %.preheader.i91

.preheader.i91:                                   ; preds = %.preheader.i91, %419
  %423 = phi i64 [ %430, %.preheader.i91 ], [ 0, %419 ]
  %424 = getelementptr inbounds nuw i8, ptr %422, i64 %423
  %425 = getelementptr inbounds nuw i8, ptr %424, i64 16
  %426 = load <16 x i8>, ptr %424, align 1, !tbaa !16, !alias.scope !2475, !noalias !2474
  %427 = load <16 x i8>, ptr %425, align 1, !tbaa !16, !alias.scope !2475, !noalias !2474
  %428 = getelementptr inbounds nuw i8, ptr %421, i64 %423
  %429 = getelementptr inbounds nuw i8, ptr %428, i64 16
  store <16 x i8> %426, ptr %428, align 1, !tbaa !16, !alias.scope !2474, !noalias !2475
  store <16 x i8> %427, ptr %429, align 1, !tbaa !16, !alias.scope !2474, !noalias !2475
  %430 = add nuw nsw i64 %423, 32
  %431 = icmp eq i64 %430, 64
  br i1 %431, label %432, label %.preheader.i91, !llvm.loop !1516

432:                                              ; preds = %.preheader.i91
  %433 = getelementptr inbounds nuw i8, ptr %422, i64 64
  %434 = getelementptr inbounds nuw i8, ptr %421, i64 %414
  %435 = add nuw nsw i64 %420, 1
  %436 = icmp eq i64 %435, 6
  br i1 %436, label %437, label %419, !llvm.loop !1519

437:                                              ; preds = %432
  %438 = getelementptr inbounds nuw i8, ptr %418, i64 384
  %439 = getelementptr inbounds nuw i8, ptr %417, i64 64
  %440 = add nuw nsw i64 %416, 1
  %441 = icmp eq i64 %440, %409
  br i1 %441, label %iree_uk_unpack_tile_generic_direct.exit92, label %415, !llvm.loop !1520

iree_uk_unpack_tile_generic_direct.exit92:        ; preds = %437
  %442 = shl i64 %405, 6
  %443 = getelementptr inbounds i8, ptr %378, i64 %442
  br label %444

444:                                              ; preds = %458, %iree_uk_unpack_tile_generic_direct.exit92
  %445 = phi i64 [ %461, %458 ], [ 0, %iree_uk_unpack_tile_generic_direct.exit92 ]
  %446 = phi ptr [ %460, %458 ], [ %4, %iree_uk_unpack_tile_generic_direct.exit92 ]
  %447 = phi ptr [ %459, %458 ], [ %443, %iree_uk_unpack_tile_generic_direct.exit92 ]
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2186)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2187)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2188)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2189)
  br label %448

448:                                              ; preds = %444, %448
  %449 = phi i64 [ %456, %448 ], [ 0, %444 ]
  %450 = getelementptr inbounds nuw i8, ptr %446, i64 %449
  %451 = getelementptr inbounds nuw i8, ptr %450, i64 16
  %452 = load <16 x i8>, ptr %450, align 1, !tbaa !16, !alias.scope !2190, !noalias !2191
  %453 = load <16 x i8>, ptr %451, align 1, !tbaa !16, !alias.scope !2190, !noalias !2191
  %454 = getelementptr inbounds nuw i8, ptr %447, i64 %449
  %455 = getelementptr inbounds nuw i8, ptr %454, i64 16
  store <16 x i8> %452, ptr %454, align 32, !tbaa !16, !alias.scope !2191, !noalias !2190
  store <16 x i8> %453, ptr %455, align 16, !tbaa !16, !alias.scope !2191, !noalias !2190
  %456 = add nuw nsw i64 %449, 32
  %457 = icmp eq i64 %456, %414
  br i1 %457, label %458, label %448, !llvm.loop !1464

458:                                              ; preds = %448
  %459 = getelementptr inbounds nuw i8, ptr %447, i64 8192
  %460 = getelementptr inbounds nuw i8, ptr %446, i64 %414
  %461 = add nuw nsw i64 %445, 1
  %462 = icmp eq i64 %461, %373
  br i1 %462, label %.loopexit53, label %444, !llvm.loop !1467

.loopexit53:                                      ; preds = %458, %.thread
  %463 = add nsw i64 %409, %405
  %464 = icmp slt i64 %463, 2
  br i1 %464, label %.thread, label %iree_uk_unpack_row_using_tile_func.exit, !llvm.loop !1468

iree_uk_unpack_row_using_tile_func.exit:          ; preds = %.loopexit53
  br label %iree_uk_unpack_tile_generic_direct.exit, !llvm.loop !1457

iree_uk_unpack_tile_generic_direct.exit:          ; preds = %402, %iree_uk_unpack_row_using_tile_func.exit
  call void @llvm.lifetime.end.p0(ptr nonnull %4) #14
  br label %iree_uk_unpack_p.exit

iree_uk_unpack_p.exit:                            ; preds = %custom_mmt4d_6x16x8.exit, %iree_uk_unpack_tile_generic_direct.exit
  ret i32 0
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, target_mem: none)
define internal noundef i32 @_encoding_0_encode_2048x2048xf32_to_2048x2048xf32(ptr noalias nofree nonnull readonly align 16 captures(none) %0, ptr noalias nofree noundef nonnull readonly align 16 captures(none) %1, ptr noalias nofree noundef nonnull readonly align 16 captures(none) %2) #0 {
  %4 = alloca %struct.iree_uk_pack_tmpbuf_helper_t, align 64
  %5 = load i32, ptr %2, align 16
  %.fr = freeze i32 %5
  %6 = zext i32 %.fr to i64
  %7 = lshr i64 %6, 5
  %.neg = mul nsw i64 %7, -60
  %8 = add nsw i64 %.neg, 2048
  %9 = tail call i64 @llvm.umin.i64(i64 %8, i64 60)
  %10 = icmp eq i64 %8, 0
  %11 = add nsw i64 %9, -2
  br i1 %10, label %iree_uk_pack_p.exit, label %12

12:                                               ; preds = %3
  %13 = mul nuw nsw i64 %7, 122880
  %14 = and i64 %6, 31
  %15 = mul nuw nsw i64 %14, 384
  %16 = add nuw nsw i64 %13, %15
  %.elt19 = getelementptr inbounds nuw i8, ptr %1, i64 32
  %.unpack20 = load ptr, ptr %.elt19, align 16
  %17 = getelementptr i8, ptr %.unpack20, i64 8
  %18 = load ptr, ptr %17, align 8
  %19 = load ptr, ptr %.unpack20, align 8
  %20 = shl nuw nsw i64 %14, 8
  %21 = mul nuw nsw i64 %7, 491520
  %22 = getelementptr inbounds nuw i8, ptr %19, i64 %20
  %23 = getelementptr inbounds nuw i8, ptr %22, i64 %21
  %24 = shl nuw nsw i64 %16, 2
  %25 = getelementptr inbounds nuw i8, ptr %18, i64 %24
  call void @llvm.lifetime.start.p0(ptr nonnull %4) #14
  %26 = getelementptr inbounds nuw i8, ptr %4, i64 4096
  store i32 128, ptr %26, align 64, !tbaa !131
  %27 = getelementptr inbounds nuw i8, ptr %4, i64 4100
  store i8 1, ptr %27, align 4, !tbaa !132
  %28 = icmp ult i64 %8, 6
  br i1 %28, label %.loopexit76, label %iree_uk_pad_and_pack_row_using_tile_func.exit23.preheader

iree_uk_pad_and_pack_row_using_tile_func.exit23.preheader: ; preds = %12
  %29 = add nsw i64 %9, -6
  br label %iree_uk_pad_and_pack_row_using_tile_func.exit23

.loopexit76:                                      ; preds = %iree_uk_pack_tile_generic_transpose.exit, %12
  %30 = phi ptr [ %23, %12 ], [ %59, %iree_uk_pack_tile_generic_transpose.exit ]
  %31 = phi ptr [ %25, %12 ], [ %58, %iree_uk_pack_tile_generic_transpose.exit ]
  %32 = phi i64 [ 0, %12 ], [ %60, %iree_uk_pack_tile_generic_transpose.exit ]
  %33 = urem i64 %11, 6
  %34 = sub nuw nsw i64 %11, %33
  %35 = add nsw i64 %34, 6
  %36 = icmp slt i64 %32, %35
  br i1 %36, label %.preheader74, label %.loopexit75

iree_uk_pad_and_pack_row_using_tile_func.exit23:  ; preds = %iree_uk_pad_and_pack_row_using_tile_func.exit23.preheader, %iree_uk_pack_tile_generic_transpose.exit
  %37 = phi i64 [ %60, %iree_uk_pack_tile_generic_transpose.exit ], [ 0, %iree_uk_pad_and_pack_row_using_tile_func.exit23.preheader ]
  %38 = phi ptr [ %58, %iree_uk_pack_tile_generic_transpose.exit ], [ %25, %iree_uk_pad_and_pack_row_using_tile_func.exit23.preheader ]
  %39 = phi ptr [ %59, %iree_uk_pack_tile_generic_transpose.exit ], [ %23, %iree_uk_pad_and_pack_row_using_tile_func.exit23.preheader ]
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2416)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2418)
  br label %40

40:                                               ; preds = %53, %iree_uk_pad_and_pack_row_using_tile_func.exit23
  %41 = phi i64 [ %56, %53 ], [ 0, %iree_uk_pad_and_pack_row_using_tile_func.exit23 ]
  %42 = phi ptr [ %54, %53 ], [ %38, %iree_uk_pad_and_pack_row_using_tile_func.exit23 ]
  %43 = phi ptr [ %55, %53 ], [ %39, %iree_uk_pad_and_pack_row_using_tile_func.exit23 ]
  br label %44

44:                                               ; preds = %44, %40
  %45 = phi i64 [ 0, %40 ], [ %51, %44 ]
  %46 = phi ptr [ %42, %40 ], [ %49, %44 ]
  %47 = phi ptr [ %43, %40 ], [ %50, %44 ]
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2409)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2410)
  %48 = load <4 x i8>, ptr %47, align 1, !tbaa !16, !alias.scope !2419, !noalias !2420
  store <4 x i8> %48, ptr %46, align 1, !tbaa !16, !alias.scope !2420, !noalias !2419
  %49 = getelementptr inbounds nuw i8, ptr %46, i64 4
  %50 = getelementptr inbounds nuw i8, ptr %47, i64 8192
  %51 = add nuw nsw i64 %45, 1
  %52 = icmp eq i64 %51, 6
  br i1 %52, label %53, label %44, !llvm.loop !1451

53:                                               ; preds = %44
  %54 = getelementptr inbounds nuw i8, ptr %42, i64 24
  %55 = getelementptr inbounds nuw i8, ptr %43, i64 4
  %56 = add nuw nsw i64 %41, 1
  %57 = icmp eq i64 %56, 64
  br i1 %57, label %iree_uk_pack_tile_generic_transpose.exit, label %40, !llvm.loop !1452

iree_uk_pack_tile_generic_transpose.exit:         ; preds = %53
  %58 = getelementptr inbounds nuw i8, ptr %38, i64 49152
  %59 = getelementptr inbounds nuw i8, ptr %39, i64 49152
  %60 = add nuw nsw i64 %37, 6
  %61 = icmp sgt i64 %60, %29
  br i1 %61, label %.loopexit76, label %iree_uk_pad_and_pack_row_using_tile_func.exit23, !llvm.loop !1363

.preheader74:                                     ; preds = %.loopexit76, %iree_uk_pad_and_pack_row_using_tile_func.exit
  %62 = phi i64 [ %193, %iree_uk_pad_and_pack_row_using_tile_func.exit ], [ %32, %.loopexit76 ]
  %63 = phi ptr [ %191, %iree_uk_pad_and_pack_row_using_tile_func.exit ], [ %31, %.loopexit76 ]
  %64 = phi ptr [ %192, %iree_uk_pad_and_pack_row_using_tile_func.exit ], [ %30, %.loopexit76 ]
  %65 = sub nsw i64 %9, %62
  %66 = tail call noundef range(i64 0, -9223372036854775808) i64 @llvm.smax.i64(i64 %65, i64 0)
  %67 = tail call i64 @llvm.umin.i64(i64 %66, i64 6)
  %.not = icmp slt i64 %65, 1
  br label %68

68:                                               ; preds = %iree_uk_pack_tile_generic_transpose.exit99, %.preheader74
  %69 = phi i64 [ 0, %.preheader74 ], [ %189, %iree_uk_pack_tile_generic_transpose.exit99 ]
  %70 = sub nsw i64 64, %69
  %71 = load i32, ptr %26, align 64, !tbaa !131
  %72 = sext i32 %71 to i64
  %73 = tail call noundef i64 @llvm.smin.i64(i64 %72, i64 %70)
  %74 = shl i64 %69, 2
  %75 = getelementptr inbounds i8, ptr %64, i64 %74
  %76 = load i8, ptr %27, align 4, !tbaa !132, !range !1410, !noundef !72
  %77 = trunc nuw i8 %76 to i1
  %78 = mul nuw nsw i64 %73, 6
  br i1 %77, label %79, label %106

79:                                               ; preds = %68
  %80 = mul nsw i64 %73, 24
  %81 = icmp sgt i64 %73, 0
  br i1 %81, label %82, label %.loopexit70

82:                                               ; preds = %79
  %83 = icmp samesign ult i64 %80, 32
  br i1 %83, label %.preheader135, label %84

84:                                               ; preds = %82
  %85 = and i64 %80, 9223372036854775776
  br label %86

86:                                               ; preds = %86, %84
  %87 = phi i64 [ 0, %84 ], [ %90, %86 ]
  %88 = getelementptr inbounds nuw i8, ptr %4, i64 %87
  %89 = getelementptr inbounds nuw i8, ptr %88, i64 16
  store <16 x i8> zeroinitializer, ptr %88, align 32, !tbaa !16, !alias.scope !1846
  store <16 x i8> zeroinitializer, ptr %89, align 16, !tbaa !16, !alias.scope !1846
  %90 = add nuw nsw i64 %87, 32
  %91 = icmp eq i64 %90, %85
  br i1 %91, label %92, label %86, !llvm.loop !1367

92:                                               ; preds = %86
  %93 = icmp eq i64 %80, %85
  br i1 %93, label %.loopexit70, label %94

94:                                               ; preds = %92
  %95 = and i64 %80, 24
  %96 = icmp eq i64 %95, 0
  br i1 %96, label %.preheader71, label %.preheader135, !prof !137

.preheader135:                                    ; preds = %94, %82
  %.ph136 = phi i64 [ 0, %82 ], [ %85, %94 ]
  br label %97

97:                                               ; preds = %.preheader135, %97
  %98 = phi i64 [ %100, %97 ], [ %.ph136, %.preheader135 ]
  %99 = getelementptr inbounds nuw i8, ptr %4, i64 %98
  store <4 x i8> zeroinitializer, ptr %99, align 4, !tbaa !16, !alias.scope !1846
  %100 = add nuw nsw i64 %98, 4
  %101 = icmp eq i64 %100, %80
  br i1 %101, label %.loopexit70, label %97, !llvm.loop !1368

.preheader71:                                     ; preds = %94, %.preheader71
  %102 = phi i64 [ %104, %.preheader71 ], [ %85, %94 ]
  %103 = getelementptr inbounds nuw i8, ptr %4, i64 %102
  store i8 0, ptr %103, align 1, !tbaa !16, !alias.scope !1846
  %104 = add nuw nsw i64 %102, 1
  %105 = icmp eq i64 %104, %80
  br i1 %105, label %.loopexit70, label %.preheader71, !llvm.loop !1369

106:                                              ; preds = %68
  %107 = icmp sgt i64 %73, 0
  br i1 %107, label %108, label %.loopexit70

108:                                              ; preds = %106
  %109 = icmp eq i64 %73, 1
  br i1 %109, label %.preheader138, label %110

110:                                              ; preds = %108
  %111 = and i64 %78, 9223372036854775800
  br label %112

112:                                              ; preds = %112, %110
  %113 = phi i64 [ 0, %110 ], [ %116, %112 ]
  %114 = getelementptr inbounds nuw [4 x i8], ptr %4, i64 %113
  %115 = getelementptr inbounds nuw i8, ptr %114, i64 16
  store <4 x i32> zeroinitializer, ptr %114, align 32, !tbaa !9, !alias.scope !1846
  store <4 x i32> zeroinitializer, ptr %115, align 16, !tbaa !9, !alias.scope !1846
  %116 = add nuw nsw i64 %113, 8
  %117 = icmp eq i64 %116, %111
  br i1 %117, label %118, label %112, !llvm.loop !1374

118:                                              ; preds = %112
  %119 = icmp eq i64 %78, %111
  br i1 %119, label %.loopexit70, label %.preheader138

.preheader138:                                    ; preds = %118, %108
  %.ph139 = phi i64 [ %111, %118 ], [ 0, %108 ]
  br label %120

120:                                              ; preds = %.preheader138, %120
  %121 = phi i64 [ %123, %120 ], [ %.ph139, %.preheader138 ]
  %122 = getelementptr inbounds nuw [4 x i8], ptr %4, i64 %121
  store i32 0, ptr %122, align 4, !tbaa !9, !alias.scope !1846
  %123 = add nuw nsw i64 %121, 1
  %124 = icmp eq i64 %123, %78
  br i1 %124, label %.loopexit70, label %120, !llvm.loop !1375

.loopexit70:                                      ; preds = %120, %.preheader71, %97, %118, %106, %92, %79
  br i1 %.not, label %.loopexit69, label %125

125:                                              ; preds = %.loopexit70
  %126 = shl nsw i64 %73, 2
  %127 = icmp sgt i64 %73, 0
  br i1 %127, label %128, label %iree_uk_pack_tile_generic_transpose.exit99

128:                                              ; preds = %125
  %129 = icmp samesign ult i64 %126, 32
  %130 = and i64 %126, 9223372036854775776
  %131 = icmp eq i64 %126, %130
  %132 = and i64 %73, 7
  %133 = icmp eq i64 %132, 0
  br label %134

134:                                              ; preds = %.loopexit, %128
  %135 = phi i64 [ %164, %.loopexit ], [ 0, %128 ]
  %136 = phi ptr [ %163, %.loopexit ], [ %75, %128 ]
  %137 = phi ptr [ %162, %.loopexit ], [ %4, %128 ]
  tail call void @llvm.experimental.noalias.scope.decl(metadata !1847)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !1848)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !1849)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !1850)
  br i1 %129, label %.preheader133, label %.preheader68

.preheader68:                                     ; preds = %134, %.preheader68
  %138 = phi i64 [ %145, %.preheader68 ], [ 0, %134 ]
  %139 = getelementptr inbounds nuw i8, ptr %136, i64 %138
  %140 = getelementptr inbounds nuw i8, ptr %139, i64 16
  %141 = load <16 x i8>, ptr %139, align 1, !tbaa !16, !alias.scope !1851, !noalias !1852
  %142 = load <16 x i8>, ptr %140, align 1, !tbaa !16, !alias.scope !1851, !noalias !1852
  %143 = getelementptr inbounds nuw i8, ptr %137, i64 %138
  %144 = getelementptr inbounds nuw i8, ptr %143, i64 16
  store <16 x i8> %141, ptr %143, align 1, !tbaa !16, !alias.scope !1852, !noalias !1851
  store <16 x i8> %142, ptr %144, align 1, !tbaa !16, !alias.scope !1852, !noalias !1851
  %145 = add nuw i64 %138, 32
  %146 = icmp eq i64 %145, %130
  br i1 %146, label %147, label %.preheader68, !llvm.loop !1383

147:                                              ; preds = %.preheader68
  br i1 %131, label %.loopexit, label %148

148:                                              ; preds = %147
  br i1 %133, label %.preheader, label %.preheader133, !prof !137

.preheader133:                                    ; preds = %148, %134
  %.ph = phi i64 [ 0, %134 ], [ %130, %148 ]
  br label %149

149:                                              ; preds = %.preheader133, %149
  %150 = phi i64 [ %154, %149 ], [ %.ph, %.preheader133 ]
  %151 = getelementptr inbounds nuw i8, ptr %136, i64 %150
  %152 = load <4 x i8>, ptr %151, align 1, !tbaa !16, !alias.scope !1851, !noalias !1852
  %153 = getelementptr inbounds nuw i8, ptr %137, i64 %150
  store <4 x i8> %152, ptr %153, align 1, !tbaa !16, !alias.scope !1852, !noalias !1851
  %154 = add nuw i64 %150, 4
  %155 = icmp eq i64 %154, %126
  br i1 %155, label %.loopexit, label %149, !llvm.loop !1384

.preheader:                                       ; preds = %148, %.preheader
  %156 = phi i64 [ %160, %.preheader ], [ %130, %148 ]
  %157 = getelementptr inbounds nuw i8, ptr %136, i64 %156
  %158 = load i8, ptr %157, align 1, !tbaa !16, !alias.scope !1851, !noalias !1852
  %159 = getelementptr inbounds nuw i8, ptr %137, i64 %156
  store i8 %158, ptr %159, align 1, !tbaa !16, !alias.scope !1852, !noalias !1851
  %160 = add nuw nsw i64 %156, 1
  %161 = icmp eq i64 %160, %126
  br i1 %161, label %.loopexit, label %.preheader, !llvm.loop !1385

.loopexit:                                        ; preds = %.preheader, %149, %147
  %162 = getelementptr inbounds nuw i8, ptr %137, i64 %126
  %163 = getelementptr inbounds nuw i8, ptr %136, i64 8192
  %164 = add nuw nsw i64 %135, 1
  %165 = icmp eq i64 %164, %67
  br i1 %165, label %.loopexit69, label %134, !llvm.loop !1386

.loopexit69:                                      ; preds = %.loopexit, %.loopexit70
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2433)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2435)
  %166 = icmp sgt i64 %73, 0
  br i1 %166, label %167, label %iree_uk_pack_tile_generic_transpose.exit99

167:                                              ; preds = %.loopexit69
  %168 = mul i64 %69, 24
  %169 = getelementptr inbounds i8, ptr %63, i64 %168
  %170 = shl nuw nsw i64 %73, 2
  br label %171

171:                                              ; preds = %184, %167
  %172 = phi i64 [ %187, %184 ], [ 0, %167 ]
  %173 = phi ptr [ %185, %184 ], [ %169, %167 ]
  %174 = phi ptr [ %186, %184 ], [ %4, %167 ]
  br label %175

175:                                              ; preds = %175, %171
  %176 = phi i64 [ 0, %171 ], [ %182, %175 ]
  %177 = phi ptr [ %173, %171 ], [ %180, %175 ]
  %178 = phi ptr [ %174, %171 ], [ %181, %175 ]
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2426)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2427)
  %179 = load <4 x i8>, ptr %178, align 1, !tbaa !16, !alias.scope !2436, !noalias !2437
  store <4 x i8> %179, ptr %177, align 1, !tbaa !16, !alias.scope !2437, !noalias !2436
  %180 = getelementptr inbounds nuw i8, ptr %177, i64 4
  %181 = getelementptr inbounds nuw i8, ptr %178, i64 %170
  %182 = add nuw nsw i64 %176, 1
  %183 = icmp eq i64 %182, 6
  br i1 %183, label %184, label %175, !llvm.loop !1451

184:                                              ; preds = %175
  %185 = getelementptr inbounds nuw i8, ptr %173, i64 24
  %186 = getelementptr inbounds nuw i8, ptr %174, i64 4
  %187 = add nuw nsw i64 %172, 1
  %188 = icmp eq i64 %187, %73
  br i1 %188, label %iree_uk_pack_tile_generic_transpose.exit99, label %171, !llvm.loop !1452

iree_uk_pack_tile_generic_transpose.exit99:       ; preds = %184, %125, %.loopexit69
  %189 = add nsw i64 %73, %69
  %190 = icmp slt i64 %189, 64
  br i1 %190, label %68, label %iree_uk_pad_and_pack_row_using_tile_func.exit, !llvm.loop !1409

iree_uk_pad_and_pack_row_using_tile_func.exit:    ; preds = %iree_uk_pack_tile_generic_transpose.exit99
  %191 = getelementptr inbounds nuw i8, ptr %63, i64 49152
  %192 = getelementptr inbounds nuw i8, ptr %64, i64 49152
  %193 = add nuw nsw i64 %62, 6
  %194 = icmp slt i64 %62, %34
  br i1 %194, label %.preheader74, label %.loopexit75, !llvm.loop !1364

.loopexit75:                                      ; preds = %iree_uk_pad_and_pack_row_using_tile_func.exit, %.loopexit76
  call void @llvm.lifetime.end.p0(ptr nonnull %4) #14
  br label %iree_uk_pack_p.exit

iree_uk_pack_p.exit:                              ; preds = %3, %.loopexit75
  ret i32 0
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, target_mem: none)
define internal noundef i32 @_encoding_1_encode_2048x2048xf32_to_2048x2048xf32(ptr noalias nofree nonnull readonly align 16 captures(none) %0, ptr noalias nofree noundef nonnull readonly align 16 captures(none) %1, ptr noalias nofree noundef nonnull readonly align 16 captures(none) %2) #0 {
  %4 = load i32, ptr %2, align 16
  %5 = zext i32 %4 to i64
  %.elt19 = getelementptr inbounds nuw i8, ptr %1, i64 32
  %.unpack20 = load ptr, ptr %.elt19, align 16
  %6 = load ptr, ptr %.unpack20, align 8
  call void @llvm.assume(i1 true) [ "align"(ptr %6, i64 64) ]
  %7 = getelementptr i8, ptr %.unpack20, i64 8
  %8 = load ptr, ptr %7, align 8
  %9 = getelementptr i8, ptr %8, i64 16809984
  call void @llvm.assume(i1 true) [ "align"(ptr %8, i64 64) ]
  %10 = lshr i64 %5, 5
  %11 = and i64 %5, 31
  %12 = shl nuw nsw i64 %10, 8
  %13 = shl nuw nsw i64 %11, 19
  %14 = shl nuw nsw i64 %10, 19
  %15 = shl nuw nsw i64 %11, 12
  %16 = getelementptr inbounds nuw i8, ptr %6, i64 %13
  %17 = getelementptr inbounds nuw i8, ptr %16, i64 %12
  %18 = getelementptr inbounds nuw i8, ptr %9, i64 %14
  %19 = getelementptr inbounds nuw i8, ptr %18, i64 %15
  br label %iree_uk_pad_and_pack_row_using_tile_func.exit23

iree_uk_pad_and_pack_row_using_tile_func.exit23:  ; preds = %3, %iree_uk_pack_tile_generic_direct.exit
  %20 = phi i64 [ 0, %3 ], [ %43, %iree_uk_pack_tile_generic_direct.exit ]
  %21 = phi ptr [ %19, %3 ], [ %41, %iree_uk_pack_tile_generic_direct.exit ]
  %22 = phi ptr [ %17, %3 ], [ %42, %iree_uk_pack_tile_generic_direct.exit ]
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2399)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2401)
  br label %23

23:                                               ; preds = %36, %iree_uk_pad_and_pack_row_using_tile_func.exit23
  %24 = phi i64 [ %39, %36 ], [ 0, %iree_uk_pad_and_pack_row_using_tile_func.exit23 ]
  %25 = phi ptr [ %37, %36 ], [ %21, %iree_uk_pad_and_pack_row_using_tile_func.exit23 ]
  %26 = phi ptr [ %38, %36 ], [ %22, %iree_uk_pad_and_pack_row_using_tile_func.exit23 ]
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2392)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2393)
  br label %.preheader.i

.preheader.i:                                     ; preds = %.preheader.i, %23
  %27 = phi i64 [ %34, %.preheader.i ], [ 0, %23 ]
  %28 = getelementptr inbounds nuw i8, ptr %26, i64 %27
  %29 = getelementptr inbounds nuw i8, ptr %28, i64 16
  %30 = load <16 x i8>, ptr %28, align 32, !tbaa !16, !alias.scope !2403, !noalias !2402
  %31 = load <16 x i8>, ptr %29, align 16, !tbaa !16, !alias.scope !2403, !noalias !2402
  %32 = getelementptr inbounds nuw i8, ptr %25, i64 %27
  %33 = getelementptr inbounds nuw i8, ptr %32, i64 16
  store <16 x i8> %30, ptr %32, align 32, !tbaa !16, !alias.scope !2402, !noalias !2403
  store <16 x i8> %31, ptr %33, align 16, !tbaa !16, !alias.scope !2402, !noalias !2403
  %34 = add nuw nsw i64 %27, 32
  %35 = icmp eq i64 %34, 64
  br i1 %35, label %36, label %.preheader.i, !llvm.loop !1437

36:                                               ; preds = %.preheader.i
  %37 = getelementptr inbounds nuw i8, ptr %25, i64 131072
  %38 = getelementptr inbounds nuw i8, ptr %26, i64 64
  %39 = add nuw nsw i64 %24, 1
  %40 = icmp eq i64 %39, 4
  br i1 %40, label %iree_uk_pack_tile_generic_direct.exit, label %23, !llvm.loop !1441

iree_uk_pack_tile_generic_direct.exit:            ; preds = %36
  %41 = getelementptr inbounds nuw i8, ptr %21, i64 64
  %42 = getelementptr inbounds nuw i8, ptr %22, i64 8192
  %43 = add nuw nsw i64 %20, 1
  %exitcond = icmp eq i64 %43, 64
  br i1 %exitcond, label %iree_uk_pack_p.exit, label %iree_uk_pad_and_pack_row_using_tile_func.exit23, !llvm.loop !1363

iree_uk_pack_p.exit:                              ; preds = %iree_uk_pack_tile_generic_direct.exit
  ret i32 0
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.umin.i64(i64, i64) #2

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local dllexport ptr @iree_hal_executable_library_query(i32 %0, ptr nofree readnone captures(none) %1) local_unnamed_addr #3 {
entry:
  %2 = icmp eq i32 %0, 6
  %3 = select i1 %2, ptr @iree_hal_executable_library_query_v0, ptr null
  ret ptr %3
}

; Function Attrs: alwaysinline nofree norecurse nosync nounwind memory(argmem: readwrite)
define internal noundef i32 @custom_mmt4d_6x16x8(ptr noundef readonly %0, i64 noundef %1, i64 noundef %2, ptr noundef readonly captures(none) %3, i64 noundef %4, i64 noundef %5, ptr nofree noundef captures(none) %6, i64 noundef %7, i64 noundef %8, i64 noundef %9, i64 noundef %10, i64 noundef %11, i32 noundef %12, i32 noundef %13, i32 noundef %14, i32 noundef %15, ptr noundef readnone captures(none) %16) local_unnamed_addr #4 {
  %18 = icmp sgt i64 %9, 0
  br i1 %18, label %19, label %.loopexit

19:                                               ; preds = %17
  %20 = icmp sgt i64 %10, 0
  %21 = getelementptr inbounds [4 x i8], ptr %6, i64 %7
  %22 = getelementptr inbounds [4 x i8], ptr %0, i64 %1
  %23 = getelementptr inbounds [4 x i8], ptr %3, i64 %4
  %24 = and i32 %15, 256
  %25 = icmp eq i32 %24, 0
  br i1 %20, label %26, label %.loopexit

26:                                               ; preds = %19
  %27 = icmp sgt i64 %11, 0
  br i1 %27, label %.preheader, label %418

.preheader:                                       ; preds = %26, %415
  %28 = phi i64 [ %416, %415 ], [ 0, %26 ]
  %29 = mul nsw i64 %28, %8
  %30 = getelementptr inbounds [4 x i8], ptr %21, i64 %29
  %31 = mul nsw i64 %28, %2
  %32 = getelementptr inbounds [4 x i8], ptr %22, i64 %31
  br label %33

33:                                               ; preds = %401, %.preheader
  %34 = phi i64 [ 0, %.preheader ], [ %413, %401 ]
  %35 = mul nuw nsw i64 %34, 384
  %36 = getelementptr inbounds nuw i8, ptr %30, i64 %35
  %37 = mul nsw i64 %34, %5
  %38 = getelementptr inbounds [4 x i8], ptr %23, i64 %37
  br i1 %25, label %.preheader59, label %39

39:                                               ; preds = %33
  %40 = load <8 x float>, ptr %36, align 1, !tbaa !16, !noalias !17
  %41 = getelementptr inbounds nuw i8, ptr %36, i64 32
  %42 = load <8 x float>, ptr %41, align 1, !tbaa !16, !noalias !17
  %43 = getelementptr inbounds nuw i8, ptr %36, i64 64
  %44 = load <8 x float>, ptr %43, align 1, !tbaa !16, !noalias !17
  %45 = getelementptr inbounds nuw i8, ptr %36, i64 96
  %46 = load <8 x float>, ptr %45, align 1, !tbaa !16, !noalias !17
  %47 = getelementptr inbounds nuw i8, ptr %36, i64 128
  %48 = load <8 x float>, ptr %47, align 1, !tbaa !16, !noalias !17
  %49 = getelementptr inbounds nuw i8, ptr %36, i64 160
  %50 = load <8 x float>, ptr %49, align 1, !tbaa !16, !noalias !17
  %51 = getelementptr inbounds nuw i8, ptr %36, i64 192
  %52 = load <8 x float>, ptr %51, align 1, !tbaa !16, !noalias !17
  %53 = getelementptr inbounds nuw i8, ptr %36, i64 224
  %54 = load <8 x float>, ptr %53, align 1, !tbaa !16, !noalias !17
  %55 = getelementptr inbounds nuw i8, ptr %36, i64 256
  %56 = load <8 x float>, ptr %55, align 1, !tbaa !16, !noalias !17
  %57 = getelementptr inbounds nuw i8, ptr %36, i64 288
  %58 = load <8 x float>, ptr %57, align 1, !tbaa !16, !noalias !17
  %59 = getelementptr inbounds nuw i8, ptr %36, i64 320
  %60 = load <8 x float>, ptr %59, align 1, !tbaa !16, !noalias !17
  %61 = getelementptr inbounds nuw i8, ptr %36, i64 352
  %62 = load <8 x float>, ptr %61, align 1, !tbaa !16, !noalias !17
  br label %.preheader59

.preheader59:                                     ; preds = %39, %33
  %.ph = phi <8 x float> [ zeroinitializer, %33 ], [ %40, %39 ]
  %.ph60 = phi <8 x float> [ zeroinitializer, %33 ], [ %42, %39 ]
  %.ph61 = phi <8 x float> [ zeroinitializer, %33 ], [ %44, %39 ]
  %.ph62 = phi <8 x float> [ zeroinitializer, %33 ], [ %46, %39 ]
  %.ph63 = phi <8 x float> [ zeroinitializer, %33 ], [ %48, %39 ]
  %.ph64 = phi <8 x float> [ zeroinitializer, %33 ], [ %50, %39 ]
  %.ph65 = phi <8 x float> [ zeroinitializer, %33 ], [ %52, %39 ]
  %.ph66 = phi <8 x float> [ zeroinitializer, %33 ], [ %54, %39 ]
  %.ph67 = phi <8 x float> [ zeroinitializer, %33 ], [ %56, %39 ]
  %.ph68 = phi <8 x float> [ zeroinitializer, %33 ], [ %58, %39 ]
  %.ph69 = phi <8 x float> [ zeroinitializer, %33 ], [ %60, %39 ]
  %.ph70 = phi <8 x float> [ zeroinitializer, %33 ], [ %62, %39 ]
  br label %63

63:                                               ; preds = %.preheader59, %63
  %64 = phi ptr [ %397, %63 ], [ %32, %.preheader59 ]
  %65 = phi ptr [ %398, %63 ], [ %38, %.preheader59 ]
  %66 = phi <8 x float> [ %365, %63 ], [ %.ph, %.preheader59 ]
  %67 = phi <8 x float> [ %366, %63 ], [ %.ph60, %.preheader59 ]
  %68 = phi <8 x float> [ %371, %63 ], [ %.ph61, %.preheader59 ]
  %69 = phi <8 x float> [ %372, %63 ], [ %.ph62, %.preheader59 ]
  %70 = phi <8 x float> [ %377, %63 ], [ %.ph63, %.preheader59 ]
  %71 = phi <8 x float> [ %378, %63 ], [ %.ph64, %.preheader59 ]
  %72 = phi <8 x float> [ %383, %63 ], [ %.ph65, %.preheader59 ]
  %73 = phi <8 x float> [ %384, %63 ], [ %.ph66, %.preheader59 ]
  %74 = phi <8 x float> [ %389, %63 ], [ %.ph67, %.preheader59 ]
  %75 = phi <8 x float> [ %390, %63 ], [ %.ph68, %.preheader59 ]
  %76 = phi <8 x float> [ %395, %63 ], [ %.ph69, %.preheader59 ]
  %77 = phi <8 x float> [ %396, %63 ], [ %.ph70, %.preheader59 ]
  %78 = phi i64 [ %399, %63 ], [ 0, %.preheader59 ]
  %79 = load <8 x float>, ptr %65, align 1, !tbaa !16
  %80 = getelementptr inbounds nuw i8, ptr %65, i64 32
  %81 = load <8 x float>, ptr %80, align 1, !tbaa !16
  %82 = load float, ptr %64, align 1, !tbaa !16
  %83 = insertelement <8 x float> poison, float %82, i64 0
  %84 = shufflevector <8 x float> %83, <8 x float> poison, <8 x i32> zeroinitializer
  %85 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %84, <8 x float> %79, <8 x float> %66)
  %86 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %84, <8 x float> %81, <8 x float> %67)
  %87 = getelementptr inbounds nuw i8, ptr %64, i64 4
  %88 = load float, ptr %87, align 1, !tbaa !16
  %89 = insertelement <8 x float> poison, float %88, i64 0
  %90 = shufflevector <8 x float> %89, <8 x float> poison, <8 x i32> zeroinitializer
  %91 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %90, <8 x float> %79, <8 x float> %68)
  %92 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %90, <8 x float> %81, <8 x float> %69)
  %93 = getelementptr inbounds nuw i8, ptr %64, i64 8
  %94 = load float, ptr %93, align 1, !tbaa !16
  %95 = insertelement <8 x float> poison, float %94, i64 0
  %96 = shufflevector <8 x float> %95, <8 x float> poison, <8 x i32> zeroinitializer
  %97 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %96, <8 x float> %79, <8 x float> %70)
  %98 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %96, <8 x float> %81, <8 x float> %71)
  %99 = getelementptr inbounds nuw i8, ptr %64, i64 12
  %100 = load float, ptr %99, align 1, !tbaa !16
  %101 = insertelement <8 x float> poison, float %100, i64 0
  %102 = shufflevector <8 x float> %101, <8 x float> poison, <8 x i32> zeroinitializer
  %103 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %102, <8 x float> %79, <8 x float> %72)
  %104 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %102, <8 x float> %81, <8 x float> %73)
  %105 = getelementptr inbounds nuw i8, ptr %64, i64 16
  %106 = load float, ptr %105, align 1, !tbaa !16
  %107 = insertelement <8 x float> poison, float %106, i64 0
  %108 = shufflevector <8 x float> %107, <8 x float> poison, <8 x i32> zeroinitializer
  %109 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %108, <8 x float> %79, <8 x float> %74)
  %110 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %108, <8 x float> %81, <8 x float> %75)
  %111 = getelementptr inbounds nuw i8, ptr %64, i64 20
  %112 = load float, ptr %111, align 1, !tbaa !16
  %113 = insertelement <8 x float> poison, float %112, i64 0
  %114 = shufflevector <8 x float> %113, <8 x float> poison, <8 x i32> zeroinitializer
  %115 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %114, <8 x float> %79, <8 x float> %76)
  %116 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %114, <8 x float> %81, <8 x float> %77)
  %117 = getelementptr inbounds nuw i8, ptr %65, i64 64
  %118 = load <8 x float>, ptr %117, align 1, !tbaa !16
  %119 = getelementptr inbounds nuw i8, ptr %65, i64 96
  %120 = load <8 x float>, ptr %119, align 1, !tbaa !16
  %121 = getelementptr inbounds nuw i8, ptr %64, i64 24
  %122 = load float, ptr %121, align 1, !tbaa !16
  %123 = insertelement <8 x float> poison, float %122, i64 0
  %124 = shufflevector <8 x float> %123, <8 x float> poison, <8 x i32> zeroinitializer
  %125 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %124, <8 x float> %118, <8 x float> %85)
  %126 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %124, <8 x float> %120, <8 x float> %86)
  %127 = getelementptr inbounds nuw i8, ptr %64, i64 28
  %128 = load float, ptr %127, align 1, !tbaa !16
  %129 = insertelement <8 x float> poison, float %128, i64 0
  %130 = shufflevector <8 x float> %129, <8 x float> poison, <8 x i32> zeroinitializer
  %131 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %130, <8 x float> %118, <8 x float> %91)
  %132 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %130, <8 x float> %120, <8 x float> %92)
  %133 = getelementptr inbounds nuw i8, ptr %64, i64 32
  %134 = load float, ptr %133, align 1, !tbaa !16
  %135 = insertelement <8 x float> poison, float %134, i64 0
  %136 = shufflevector <8 x float> %135, <8 x float> poison, <8 x i32> zeroinitializer
  %137 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %136, <8 x float> %118, <8 x float> %97)
  %138 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %136, <8 x float> %120, <8 x float> %98)
  %139 = getelementptr inbounds nuw i8, ptr %64, i64 36
  %140 = load float, ptr %139, align 1, !tbaa !16
  %141 = insertelement <8 x float> poison, float %140, i64 0
  %142 = shufflevector <8 x float> %141, <8 x float> poison, <8 x i32> zeroinitializer
  %143 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %142, <8 x float> %118, <8 x float> %103)
  %144 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %142, <8 x float> %120, <8 x float> %104)
  %145 = getelementptr inbounds nuw i8, ptr %64, i64 40
  %146 = load float, ptr %145, align 1, !tbaa !16
  %147 = insertelement <8 x float> poison, float %146, i64 0
  %148 = shufflevector <8 x float> %147, <8 x float> poison, <8 x i32> zeroinitializer
  %149 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %148, <8 x float> %118, <8 x float> %109)
  %150 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %148, <8 x float> %120, <8 x float> %110)
  %151 = getelementptr inbounds nuw i8, ptr %64, i64 44
  %152 = load float, ptr %151, align 1, !tbaa !16
  %153 = insertelement <8 x float> poison, float %152, i64 0
  %154 = shufflevector <8 x float> %153, <8 x float> poison, <8 x i32> zeroinitializer
  %155 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %154, <8 x float> %118, <8 x float> %115)
  %156 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %154, <8 x float> %120, <8 x float> %116)
  %157 = getelementptr inbounds nuw i8, ptr %65, i64 128
  %158 = load <8 x float>, ptr %157, align 1, !tbaa !16
  %159 = getelementptr inbounds nuw i8, ptr %65, i64 160
  %160 = load <8 x float>, ptr %159, align 1, !tbaa !16
  %161 = getelementptr inbounds nuw i8, ptr %64, i64 48
  %162 = load float, ptr %161, align 1, !tbaa !16
  %163 = insertelement <8 x float> poison, float %162, i64 0
  %164 = shufflevector <8 x float> %163, <8 x float> poison, <8 x i32> zeroinitializer
  %165 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %164, <8 x float> %158, <8 x float> %125)
  %166 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %164, <8 x float> %160, <8 x float> %126)
  %167 = getelementptr inbounds nuw i8, ptr %64, i64 52
  %168 = load float, ptr %167, align 1, !tbaa !16
  %169 = insertelement <8 x float> poison, float %168, i64 0
  %170 = shufflevector <8 x float> %169, <8 x float> poison, <8 x i32> zeroinitializer
  %171 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %170, <8 x float> %158, <8 x float> %131)
  %172 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %170, <8 x float> %160, <8 x float> %132)
  %173 = getelementptr inbounds nuw i8, ptr %64, i64 56
  %174 = load float, ptr %173, align 1, !tbaa !16
  %175 = insertelement <8 x float> poison, float %174, i64 0
  %176 = shufflevector <8 x float> %175, <8 x float> poison, <8 x i32> zeroinitializer
  %177 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %176, <8 x float> %158, <8 x float> %137)
  %178 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %176, <8 x float> %160, <8 x float> %138)
  %179 = getelementptr inbounds nuw i8, ptr %64, i64 60
  %180 = load float, ptr %179, align 1, !tbaa !16
  %181 = insertelement <8 x float> poison, float %180, i64 0
  %182 = shufflevector <8 x float> %181, <8 x float> poison, <8 x i32> zeroinitializer
  %183 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %182, <8 x float> %158, <8 x float> %143)
  %184 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %182, <8 x float> %160, <8 x float> %144)
  %185 = getelementptr inbounds nuw i8, ptr %64, i64 64
  %186 = load float, ptr %185, align 1, !tbaa !16
  %187 = insertelement <8 x float> poison, float %186, i64 0
  %188 = shufflevector <8 x float> %187, <8 x float> poison, <8 x i32> zeroinitializer
  %189 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %188, <8 x float> %158, <8 x float> %149)
  %190 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %188, <8 x float> %160, <8 x float> %150)
  %191 = getelementptr inbounds nuw i8, ptr %64, i64 68
  %192 = load float, ptr %191, align 1, !tbaa !16
  %193 = insertelement <8 x float> poison, float %192, i64 0
  %194 = shufflevector <8 x float> %193, <8 x float> poison, <8 x i32> zeroinitializer
  %195 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %194, <8 x float> %158, <8 x float> %155)
  %196 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %194, <8 x float> %160, <8 x float> %156)
  %197 = getelementptr inbounds nuw i8, ptr %65, i64 192
  %198 = load <8 x float>, ptr %197, align 1, !tbaa !16
  %199 = getelementptr inbounds nuw i8, ptr %65, i64 224
  %200 = load <8 x float>, ptr %199, align 1, !tbaa !16
  %201 = getelementptr inbounds nuw i8, ptr %64, i64 72
  %202 = load float, ptr %201, align 1, !tbaa !16
  %203 = insertelement <8 x float> poison, float %202, i64 0
  %204 = shufflevector <8 x float> %203, <8 x float> poison, <8 x i32> zeroinitializer
  %205 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %204, <8 x float> %198, <8 x float> %165)
  %206 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %204, <8 x float> %200, <8 x float> %166)
  %207 = getelementptr inbounds nuw i8, ptr %64, i64 76
  %208 = load float, ptr %207, align 1, !tbaa !16
  %209 = insertelement <8 x float> poison, float %208, i64 0
  %210 = shufflevector <8 x float> %209, <8 x float> poison, <8 x i32> zeroinitializer
  %211 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %210, <8 x float> %198, <8 x float> %171)
  %212 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %210, <8 x float> %200, <8 x float> %172)
  %213 = getelementptr inbounds nuw i8, ptr %64, i64 80
  %214 = load float, ptr %213, align 1, !tbaa !16
  %215 = insertelement <8 x float> poison, float %214, i64 0
  %216 = shufflevector <8 x float> %215, <8 x float> poison, <8 x i32> zeroinitializer
  %217 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %216, <8 x float> %198, <8 x float> %177)
  %218 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %216, <8 x float> %200, <8 x float> %178)
  %219 = getelementptr inbounds nuw i8, ptr %64, i64 84
  %220 = load float, ptr %219, align 1, !tbaa !16
  %221 = insertelement <8 x float> poison, float %220, i64 0
  %222 = shufflevector <8 x float> %221, <8 x float> poison, <8 x i32> zeroinitializer
  %223 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %222, <8 x float> %198, <8 x float> %183)
  %224 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %222, <8 x float> %200, <8 x float> %184)
  %225 = getelementptr inbounds nuw i8, ptr %64, i64 88
  %226 = load float, ptr %225, align 1, !tbaa !16
  %227 = insertelement <8 x float> poison, float %226, i64 0
  %228 = shufflevector <8 x float> %227, <8 x float> poison, <8 x i32> zeroinitializer
  %229 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %228, <8 x float> %198, <8 x float> %189)
  %230 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %228, <8 x float> %200, <8 x float> %190)
  %231 = getelementptr inbounds nuw i8, ptr %64, i64 92
  %232 = load float, ptr %231, align 1, !tbaa !16
  %233 = insertelement <8 x float> poison, float %232, i64 0
  %234 = shufflevector <8 x float> %233, <8 x float> poison, <8 x i32> zeroinitializer
  %235 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %234, <8 x float> %198, <8 x float> %195)
  %236 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %234, <8 x float> %200, <8 x float> %196)
  %237 = getelementptr inbounds nuw i8, ptr %65, i64 256
  %238 = load <8 x float>, ptr %237, align 1, !tbaa !16
  %239 = getelementptr inbounds nuw i8, ptr %65, i64 288
  %240 = load <8 x float>, ptr %239, align 1, !tbaa !16
  %241 = getelementptr inbounds nuw i8, ptr %64, i64 96
  %242 = load float, ptr %241, align 1, !tbaa !16
  %243 = insertelement <8 x float> poison, float %242, i64 0
  %244 = shufflevector <8 x float> %243, <8 x float> poison, <8 x i32> zeroinitializer
  %245 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %244, <8 x float> %238, <8 x float> %205)
  %246 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %244, <8 x float> %240, <8 x float> %206)
  %247 = getelementptr inbounds nuw i8, ptr %64, i64 100
  %248 = load float, ptr %247, align 1, !tbaa !16
  %249 = insertelement <8 x float> poison, float %248, i64 0
  %250 = shufflevector <8 x float> %249, <8 x float> poison, <8 x i32> zeroinitializer
  %251 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %250, <8 x float> %238, <8 x float> %211)
  %252 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %250, <8 x float> %240, <8 x float> %212)
  %253 = getelementptr inbounds nuw i8, ptr %64, i64 104
  %254 = load float, ptr %253, align 1, !tbaa !16
  %255 = insertelement <8 x float> poison, float %254, i64 0
  %256 = shufflevector <8 x float> %255, <8 x float> poison, <8 x i32> zeroinitializer
  %257 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %256, <8 x float> %238, <8 x float> %217)
  %258 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %256, <8 x float> %240, <8 x float> %218)
  %259 = getelementptr inbounds nuw i8, ptr %64, i64 108
  %260 = load float, ptr %259, align 1, !tbaa !16
  %261 = insertelement <8 x float> poison, float %260, i64 0
  %262 = shufflevector <8 x float> %261, <8 x float> poison, <8 x i32> zeroinitializer
  %263 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %262, <8 x float> %238, <8 x float> %223)
  %264 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %262, <8 x float> %240, <8 x float> %224)
  %265 = getelementptr inbounds nuw i8, ptr %64, i64 112
  %266 = load float, ptr %265, align 1, !tbaa !16
  %267 = insertelement <8 x float> poison, float %266, i64 0
  %268 = shufflevector <8 x float> %267, <8 x float> poison, <8 x i32> zeroinitializer
  %269 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %268, <8 x float> %238, <8 x float> %229)
  %270 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %268, <8 x float> %240, <8 x float> %230)
  %271 = getelementptr inbounds nuw i8, ptr %64, i64 116
  %272 = load float, ptr %271, align 1, !tbaa !16
  %273 = insertelement <8 x float> poison, float %272, i64 0
  %274 = shufflevector <8 x float> %273, <8 x float> poison, <8 x i32> zeroinitializer
  %275 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %274, <8 x float> %238, <8 x float> %235)
  %276 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %274, <8 x float> %240, <8 x float> %236)
  %277 = getelementptr inbounds nuw i8, ptr %65, i64 320
  %278 = load <8 x float>, ptr %277, align 1, !tbaa !16
  %279 = getelementptr inbounds nuw i8, ptr %65, i64 352
  %280 = load <8 x float>, ptr %279, align 1, !tbaa !16
  %281 = getelementptr inbounds nuw i8, ptr %64, i64 120
  %282 = load float, ptr %281, align 1, !tbaa !16
  %283 = insertelement <8 x float> poison, float %282, i64 0
  %284 = shufflevector <8 x float> %283, <8 x float> poison, <8 x i32> zeroinitializer
  %285 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %284, <8 x float> %278, <8 x float> %245)
  %286 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %284, <8 x float> %280, <8 x float> %246)
  %287 = getelementptr inbounds nuw i8, ptr %64, i64 124
  %288 = load float, ptr %287, align 1, !tbaa !16
  %289 = insertelement <8 x float> poison, float %288, i64 0
  %290 = shufflevector <8 x float> %289, <8 x float> poison, <8 x i32> zeroinitializer
  %291 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %290, <8 x float> %278, <8 x float> %251)
  %292 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %290, <8 x float> %280, <8 x float> %252)
  %293 = getelementptr inbounds nuw i8, ptr %64, i64 128
  %294 = load float, ptr %293, align 1, !tbaa !16
  %295 = insertelement <8 x float> poison, float %294, i64 0
  %296 = shufflevector <8 x float> %295, <8 x float> poison, <8 x i32> zeroinitializer
  %297 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %296, <8 x float> %278, <8 x float> %257)
  %298 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %296, <8 x float> %280, <8 x float> %258)
  %299 = getelementptr inbounds nuw i8, ptr %64, i64 132
  %300 = load float, ptr %299, align 1, !tbaa !16
  %301 = insertelement <8 x float> poison, float %300, i64 0
  %302 = shufflevector <8 x float> %301, <8 x float> poison, <8 x i32> zeroinitializer
  %303 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %302, <8 x float> %278, <8 x float> %263)
  %304 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %302, <8 x float> %280, <8 x float> %264)
  %305 = getelementptr inbounds nuw i8, ptr %64, i64 136
  %306 = load float, ptr %305, align 1, !tbaa !16
  %307 = insertelement <8 x float> poison, float %306, i64 0
  %308 = shufflevector <8 x float> %307, <8 x float> poison, <8 x i32> zeroinitializer
  %309 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %308, <8 x float> %278, <8 x float> %269)
  %310 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %308, <8 x float> %280, <8 x float> %270)
  %311 = getelementptr inbounds nuw i8, ptr %64, i64 140
  %312 = load float, ptr %311, align 1, !tbaa !16
  %313 = insertelement <8 x float> poison, float %312, i64 0
  %314 = shufflevector <8 x float> %313, <8 x float> poison, <8 x i32> zeroinitializer
  %315 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %314, <8 x float> %278, <8 x float> %275)
  %316 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %314, <8 x float> %280, <8 x float> %276)
  %317 = getelementptr inbounds nuw i8, ptr %65, i64 384
  %318 = load <8 x float>, ptr %317, align 1, !tbaa !16
  %319 = getelementptr inbounds nuw i8, ptr %65, i64 416
  %320 = load <8 x float>, ptr %319, align 1, !tbaa !16
  %321 = getelementptr inbounds nuw i8, ptr %64, i64 144
  %322 = load float, ptr %321, align 1, !tbaa !16
  %323 = insertelement <8 x float> poison, float %322, i64 0
  %324 = shufflevector <8 x float> %323, <8 x float> poison, <8 x i32> zeroinitializer
  %325 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %324, <8 x float> %318, <8 x float> %285)
  %326 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %324, <8 x float> %320, <8 x float> %286)
  %327 = getelementptr inbounds nuw i8, ptr %64, i64 148
  %328 = load float, ptr %327, align 1, !tbaa !16
  %329 = insertelement <8 x float> poison, float %328, i64 0
  %330 = shufflevector <8 x float> %329, <8 x float> poison, <8 x i32> zeroinitializer
  %331 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %330, <8 x float> %318, <8 x float> %291)
  %332 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %330, <8 x float> %320, <8 x float> %292)
  %333 = getelementptr inbounds nuw i8, ptr %64, i64 152
  %334 = load float, ptr %333, align 1, !tbaa !16
  %335 = insertelement <8 x float> poison, float %334, i64 0
  %336 = shufflevector <8 x float> %335, <8 x float> poison, <8 x i32> zeroinitializer
  %337 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %336, <8 x float> %318, <8 x float> %297)
  %338 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %336, <8 x float> %320, <8 x float> %298)
  %339 = getelementptr inbounds nuw i8, ptr %64, i64 156
  %340 = load float, ptr %339, align 1, !tbaa !16
  %341 = insertelement <8 x float> poison, float %340, i64 0
  %342 = shufflevector <8 x float> %341, <8 x float> poison, <8 x i32> zeroinitializer
  %343 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %342, <8 x float> %318, <8 x float> %303)
  %344 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %342, <8 x float> %320, <8 x float> %304)
  %345 = getelementptr inbounds nuw i8, ptr %64, i64 160
  %346 = load float, ptr %345, align 1, !tbaa !16
  %347 = insertelement <8 x float> poison, float %346, i64 0
  %348 = shufflevector <8 x float> %347, <8 x float> poison, <8 x i32> zeroinitializer
  %349 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %348, <8 x float> %318, <8 x float> %309)
  %350 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %348, <8 x float> %320, <8 x float> %310)
  %351 = getelementptr inbounds nuw i8, ptr %64, i64 164
  %352 = load float, ptr %351, align 1, !tbaa !16
  %353 = insertelement <8 x float> poison, float %352, i64 0
  %354 = shufflevector <8 x float> %353, <8 x float> poison, <8 x i32> zeroinitializer
  %355 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %354, <8 x float> %318, <8 x float> %315)
  %356 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %354, <8 x float> %320, <8 x float> %316)
  %357 = getelementptr inbounds nuw i8, ptr %65, i64 448
  %358 = load <8 x float>, ptr %357, align 1, !tbaa !16
  %359 = getelementptr inbounds nuw i8, ptr %65, i64 480
  %360 = load <8 x float>, ptr %359, align 1, !tbaa !16
  %361 = getelementptr inbounds nuw i8, ptr %64, i64 168
  %362 = load float, ptr %361, align 1, !tbaa !16
  %363 = insertelement <8 x float> poison, float %362, i64 0
  %364 = shufflevector <8 x float> %363, <8 x float> poison, <8 x i32> zeroinitializer
  %365 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %364, <8 x float> %358, <8 x float> %325)
  %366 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %364, <8 x float> %360, <8 x float> %326)
  %367 = getelementptr inbounds nuw i8, ptr %64, i64 172
  %368 = load float, ptr %367, align 1, !tbaa !16
  %369 = insertelement <8 x float> poison, float %368, i64 0
  %370 = shufflevector <8 x float> %369, <8 x float> poison, <8 x i32> zeroinitializer
  %371 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %370, <8 x float> %358, <8 x float> %331)
  %372 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %370, <8 x float> %360, <8 x float> %332)
  %373 = getelementptr inbounds nuw i8, ptr %64, i64 176
  %374 = load float, ptr %373, align 1, !tbaa !16
  %375 = insertelement <8 x float> poison, float %374, i64 0
  %376 = shufflevector <8 x float> %375, <8 x float> poison, <8 x i32> zeroinitializer
  %377 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %376, <8 x float> %358, <8 x float> %337)
  %378 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %376, <8 x float> %360, <8 x float> %338)
  %379 = getelementptr inbounds nuw i8, ptr %64, i64 180
  %380 = load float, ptr %379, align 1, !tbaa !16
  %381 = insertelement <8 x float> poison, float %380, i64 0
  %382 = shufflevector <8 x float> %381, <8 x float> poison, <8 x i32> zeroinitializer
  %383 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %382, <8 x float> %358, <8 x float> %343)
  %384 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %382, <8 x float> %360, <8 x float> %344)
  %385 = getelementptr inbounds nuw i8, ptr %64, i64 184
  %386 = load float, ptr %385, align 1, !tbaa !16
  %387 = insertelement <8 x float> poison, float %386, i64 0
  %388 = shufflevector <8 x float> %387, <8 x float> poison, <8 x i32> zeroinitializer
  %389 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %388, <8 x float> %358, <8 x float> %349)
  %390 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %388, <8 x float> %360, <8 x float> %350)
  %391 = getelementptr inbounds nuw i8, ptr %64, i64 188
  %392 = load float, ptr %391, align 1, !tbaa !16
  %393 = insertelement <8 x float> poison, float %392, i64 0
  %394 = shufflevector <8 x float> %393, <8 x float> poison, <8 x i32> zeroinitializer
  %395 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %394, <8 x float> %358, <8 x float> %355)
  %396 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %394, <8 x float> %360, <8 x float> %356)
  %397 = getelementptr inbounds nuw i8, ptr %64, i64 192
  %398 = getelementptr inbounds nuw i8, ptr %65, i64 512
  %399 = add nuw nsw i64 %78, 1
  %400 = icmp eq i64 %399, %11
  br i1 %400, label %401, label %63, !llvm.loop !13

401:                                              ; preds = %63
  store <8 x float> %365, ptr %36, align 1, !tbaa !16
  %402 = getelementptr inbounds nuw i8, ptr %36, i64 32
  store <8 x float> %366, ptr %402, align 1, !tbaa !16
  %403 = getelementptr inbounds nuw i8, ptr %36, i64 64
  store <8 x float> %371, ptr %403, align 1, !tbaa !16
  %404 = getelementptr inbounds nuw i8, ptr %36, i64 96
  store <8 x float> %372, ptr %404, align 1, !tbaa !16
  %405 = getelementptr inbounds nuw i8, ptr %36, i64 128
  store <8 x float> %377, ptr %405, align 1, !tbaa !16
  %406 = getelementptr inbounds nuw i8, ptr %36, i64 160
  store <8 x float> %378, ptr %406, align 1, !tbaa !16
  %407 = getelementptr inbounds nuw i8, ptr %36, i64 192
  store <8 x float> %383, ptr %407, align 1, !tbaa !16
  %408 = getelementptr inbounds nuw i8, ptr %36, i64 224
  store <8 x float> %384, ptr %408, align 1, !tbaa !16
  %409 = getelementptr inbounds nuw i8, ptr %36, i64 256
  store <8 x float> %389, ptr %409, align 1, !tbaa !16
  %410 = getelementptr inbounds nuw i8, ptr %36, i64 288
  store <8 x float> %390, ptr %410, align 1, !tbaa !16
  %411 = getelementptr inbounds nuw i8, ptr %36, i64 320
  store <8 x float> %395, ptr %411, align 1, !tbaa !16
  %412 = getelementptr inbounds nuw i8, ptr %36, i64 352
  store <8 x float> %396, ptr %412, align 1, !tbaa !16
  %413 = add nuw nsw i64 %34, 1
  %414 = icmp eq i64 %413, %10
  br i1 %414, label %415, label %33, !llvm.loop !14

415:                                              ; preds = %401
  %416 = add nuw nsw i64 %28, 1
  %417 = icmp eq i64 %416, %9
  br i1 %417, label %.loopexit, label %.preheader, !llvm.loop !15

418:                                              ; preds = %26
  br i1 %25, label %.preheader5, label %.loopexit

.preheader5:                                      ; preds = %418, %439
  %419 = phi i64 [ %440, %439 ], [ 0, %418 ]
  %420 = mul nsw i64 %419, %8
  %421 = getelementptr inbounds [4 x i8], ptr %21, i64 %420
  br label %422

422:                                              ; preds = %422, %.preheader5
  %423 = phi i64 [ 0, %.preheader5 ], [ %437, %422 ]
  %424 = mul nuw nsw i64 %423, 384
  %425 = getelementptr inbounds nuw i8, ptr %421, i64 %424
  store <8 x float> zeroinitializer, ptr %425, align 1, !tbaa !16
  %426 = getelementptr inbounds nuw i8, ptr %425, i64 32
  store <8 x float> zeroinitializer, ptr %426, align 1, !tbaa !16
  %427 = getelementptr inbounds nuw i8, ptr %425, i64 64
  store <8 x float> zeroinitializer, ptr %427, align 1, !tbaa !16
  %428 = getelementptr inbounds nuw i8, ptr %425, i64 96
  store <8 x float> zeroinitializer, ptr %428, align 1, !tbaa !16
  %429 = getelementptr inbounds nuw i8, ptr %425, i64 128
  store <8 x float> zeroinitializer, ptr %429, align 1, !tbaa !16
  %430 = getelementptr inbounds nuw i8, ptr %425, i64 160
  store <8 x float> zeroinitializer, ptr %430, align 1, !tbaa !16
  %431 = getelementptr inbounds nuw i8, ptr %425, i64 192
  store <8 x float> zeroinitializer, ptr %431, align 1, !tbaa !16
  %432 = getelementptr inbounds nuw i8, ptr %425, i64 224
  store <8 x float> zeroinitializer, ptr %432, align 1, !tbaa !16
  %433 = getelementptr inbounds nuw i8, ptr %425, i64 256
  store <8 x float> zeroinitializer, ptr %433, align 1, !tbaa !16
  %434 = getelementptr inbounds nuw i8, ptr %425, i64 288
  store <8 x float> zeroinitializer, ptr %434, align 1, !tbaa !16
  %435 = getelementptr inbounds nuw i8, ptr %425, i64 320
  store <8 x float> zeroinitializer, ptr %435, align 1, !tbaa !16
  %436 = getelementptr inbounds nuw i8, ptr %425, i64 352
  store <8 x float> zeroinitializer, ptr %436, align 1, !tbaa !16
  %437 = add nuw nsw i64 %423, 1
  %438 = icmp eq i64 %437, %10
  br i1 %438, label %439, label %422, !llvm.loop !14

439:                                              ; preds = %422
  %440 = add nuw nsw i64 %419, 1
  %441 = icmp eq i64 %440, %9
  br i1 %441, label %.loopexit, label %.preheader5, !llvm.loop !15

.loopexit:                                        ; preds = %439, %415, %418, %19, %17
  ret i32 0
}

; Function Attrs: alwaysinline mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x float> @llvm.fma.v8f32(<8 x float>, <8 x float>, <8 x float>) #5

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal float @iree_h2f_ieee(i16 noundef signext %0) local_unnamed_addr #6 {
  %2 = and i16 %0, 31744
  %3 = and i16 %0, 1023
  %4 = and i16 %0, -32768
  %5 = zext i16 %4 to i32
  %6 = shl nuw i32 %5, 16
  switch i16 %2, label %15 [
    i16 31744, label %7
    i16 0, label %23
  ]

7:                                                ; preds = %1
  %8 = icmp eq i16 %3, 0
  br i1 %8, label %12, label %9

9:                                                ; preds = %7
  %10 = or disjoint i32 %6, 2143289344
  %11 = bitcast i32 %10 to float
  br label %28

12:                                               ; preds = %7
  %13 = or disjoint i32 %6, 2139095040
  %14 = bitcast i32 %13 to float
  br label %28

15:                                               ; preds = %1
  %16 = zext nneg i16 %3 to i32
  %17 = zext nneg i16 %2 to i32
  %18 = add nuw nsw i32 %17, 114688
  %19 = or disjoint i32 %18, %16
  %20 = shl nuw nsw i32 %19, 13
  %21 = or disjoint i32 %20, %6
  %22 = bitcast i32 %21 to float
  br label %28

23:                                               ; preds = %1
  %24 = or disjoint i32 %6, 864026624
  %25 = uitofp nneg i16 %3 to float
  %26 = bitcast i32 %24 to float
  %27 = fmul float %25, %26
  br label %28

28:                                               ; preds = %23, %15, %12, %9
  %29 = phi float [ %11, %9 ], [ %14, %12 ], [ %22, %15 ], [ %27, %23 ]
  ret float %29
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal signext i16 @iree_f2h_ieee(float noundef %0) local_unnamed_addr #6 {
  %2 = bitcast float %0 to i32
  %3 = and i32 %2, 2139095040
  %4 = and i32 %2, 8388607
  %5 = lshr i32 %2, 16
  %6 = and i32 %5, 32768
  switch i32 %3, label %12 [
    i32 2139095040, label %7
    i32 0, label %29
  ]

7:                                                ; preds = %1
  %8 = icmp eq i32 %4, 0
  br i1 %8, label %29, label %9

9:                                                ; preds = %7
  %10 = trunc nuw i32 %5 to i16
  %11 = or i16 %10, 32767
  br label %33

12:                                               ; preds = %1
  %13 = lshr exact i32 %3, 13
  %14 = icmp samesign ugt i32 %3, 1191182336
  br i1 %14, label %29, label %15

15:                                               ; preds = %12
  %16 = icmp samesign ult i32 %3, 947912704
  br i1 %16, label %29, label %17

17:                                               ; preds = %15
  %18 = and i32 %2, 8192
  %19 = icmp eq i32 %18, 0
  %20 = select i1 %19, i32 4095, i32 4096
  %21 = add nuw nsw i32 %20, %4
  %22 = icmp samesign ugt i32 %21, 8388607
  %23 = select i1 %22, i32 -129024, i32 -130048
  %24 = add nuw nsw i32 %13, 15360
  %25 = add nsw i32 %24, %23
  %26 = lshr i32 %21, 13
  %27 = select i1 %22, i32 0, i32 %26
  %28 = add nuw nsw i32 %25, %27
  br label %29

29:                                               ; preds = %17, %12, %15, %1, %7
  %30 = phi i32 [ 31744, %7 ], [ %3, %1 ], [ %28, %17 ], [ 31744, %12 ], [ 0, %15 ]
  %31 = or i32 %30, %6
  %32 = trunc i32 %31 to i16
  br label %33

33:                                               ; preds = %29, %9
  %34 = phi i16 [ %11, %9 ], [ %32, %29 ]
  ret i16 %34
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal float @__gnu_h2f_ieee(i16 noundef signext %0) local_unnamed_addr #6 {
  %2 = and i16 %0, 31744
  %3 = and i16 %0, 1023
  %4 = and i16 %0, -32768
  %5 = zext i16 %4 to i32
  %6 = shl nuw i32 %5, 16
  switch i16 %2, label %15 [
    i16 31744, label %7
    i16 0, label %23
  ]

7:                                                ; preds = %1
  %8 = icmp eq i16 %3, 0
  br i1 %8, label %12, label %9

9:                                                ; preds = %7
  %10 = or disjoint i32 %6, 2143289344
  %11 = bitcast i32 %10 to float
  br label %28

12:                                               ; preds = %7
  %13 = or disjoint i32 %6, 2139095040
  %14 = bitcast i32 %13 to float
  br label %28

15:                                               ; preds = %1
  %16 = zext nneg i16 %3 to i32
  %17 = zext nneg i16 %2 to i32
  %18 = add nuw nsw i32 %17, 114688
  %19 = or disjoint i32 %18, %16
  %20 = shl nuw nsw i32 %19, 13
  %21 = or disjoint i32 %20, %6
  %22 = bitcast i32 %21 to float
  br label %28

23:                                               ; preds = %1
  %24 = or disjoint i32 %6, 864026624
  %25 = uitofp nneg i16 %3 to float
  %26 = bitcast i32 %24 to float
  %27 = fmul float %25, %26
  br label %28

28:                                               ; preds = %9, %12, %15, %23
  %29 = phi float [ %11, %9 ], [ %14, %12 ], [ %22, %15 ], [ %27, %23 ]
  ret float %29
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal float @__extendhfsf2(float noundef %0) local_unnamed_addr #6 {
  %2 = bitcast float %0 to i32
  %3 = trunc i32 %2 to i16
  %4 = and i16 %3, 31744
  %5 = and i16 %3, 1023
  %6 = shl i32 %2, 16
  %7 = and i32 %6, -2147483648
  switch i16 %4, label %16 [
    i16 31744, label %8
    i16 0, label %24
  ]

8:                                                ; preds = %1
  %9 = icmp eq i16 %5, 0
  br i1 %9, label %13, label %10

10:                                               ; preds = %8
  %11 = or disjoint i32 %7, 2143289344
  %12 = bitcast i32 %11 to float
  br label %29

13:                                               ; preds = %8
  %14 = or disjoint i32 %7, 2139095040
  %15 = bitcast i32 %14 to float
  br label %29

16:                                               ; preds = %1
  %17 = and i32 %2, 1023
  %18 = and i32 %2, 31744
  %19 = add nuw nsw i32 %18, 114688
  %20 = or disjoint i32 %19, %17
  %21 = shl nuw nsw i32 %20, 13
  %22 = or disjoint i32 %21, %7
  %23 = bitcast i32 %22 to float
  br label %29

24:                                               ; preds = %1
  %25 = or disjoint i32 %7, 864026624
  %26 = uitofp nneg i16 %5 to float
  %27 = bitcast i32 %25 to float
  %28 = fmul nnan float %26, %27
  br label %29

29:                                               ; preds = %10, %13, %16, %24
  %30 = phi float [ %12, %10 ], [ %15, %13 ], [ %23, %16 ], [ %28, %24 ]
  ret float %30
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal signext i16 @__gnu_f2h_ieee(float noundef %0) local_unnamed_addr #6 {
  %2 = bitcast float %0 to i32
  %3 = and i32 %2, 2139095040
  %4 = and i32 %2, 8388607
  %5 = lshr i32 %2, 16
  %6 = and i32 %5, 32768
  switch i32 %3, label %12 [
    i32 2139095040, label %7
    i32 0, label %29
  ]

7:                                                ; preds = %1
  %8 = icmp eq i32 %4, 0
  br i1 %8, label %29, label %9

9:                                                ; preds = %7
  %10 = trunc nuw i32 %5 to i16
  %11 = or i16 %10, 32767
  br label %33

12:                                               ; preds = %1
  %13 = lshr exact i32 %3, 13
  %14 = icmp samesign ugt i32 %3, 1191182336
  br i1 %14, label %29, label %15

15:                                               ; preds = %12
  %16 = icmp samesign ult i32 %3, 947912704
  br i1 %16, label %29, label %17

17:                                               ; preds = %15
  %18 = and i32 %2, 8192
  %19 = icmp eq i32 %18, 0
  %20 = select i1 %19, i32 4095, i32 4096
  %21 = add nuw nsw i32 %20, %4
  %22 = icmp samesign ugt i32 %21, 8388607
  %23 = select i1 %22, i32 -129024, i32 -130048
  %24 = add nuw nsw i32 %13, 15360
  %25 = add nsw i32 %24, %23
  %26 = lshr i32 %21, 13
  %27 = select i1 %22, i32 0, i32 %26
  %28 = add nuw nsw i32 %25, %27
  br label %29

29:                                               ; preds = %17, %15, %12, %7, %1
  %30 = phi i32 [ 31744, %7 ], [ %3, %1 ], [ %28, %17 ], [ 31744, %12 ], [ 0, %15 ]
  %31 = or i32 %30, %6
  %32 = trunc i32 %31 to i16
  br label %33

33:                                               ; preds = %9, %29
  %34 = phi i16 [ %11, %9 ], [ %32, %29 ]
  ret i16 %34
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal float @__truncsfhf2(float noundef %0) local_unnamed_addr #6 {
  %2 = alloca i16, align 4
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
  %3 = bitcast float %0 to i32
  %4 = and i32 %3, 2139095040
  %5 = and i32 %3, 8388607
  %6 = lshr i32 %3, 16
  %7 = and i32 %6, 32768
  switch i32 %4, label %13 [
    i32 2139095040, label %8
    i32 0, label %30
  ]

8:                                                ; preds = %1
  %9 = icmp eq i32 %5, 0
  br i1 %9, label %30, label %10

10:                                               ; preds = %8
  %11 = trunc nuw i32 %6 to i16
  %12 = or i16 %11, 32767
  br label %34

13:                                               ; preds = %1
  %14 = lshr exact i32 %4, 13
  %15 = icmp samesign ugt i32 %4, 1191182336
  br i1 %15, label %30, label %16

16:                                               ; preds = %13
  %17 = icmp samesign ult i32 %4, 947912704
  br i1 %17, label %30, label %18

18:                                               ; preds = %16
  %19 = and i32 %3, 8192
  %20 = icmp eq i32 %19, 0
  %21 = select i1 %20, i32 4095, i32 4096
  %22 = add nuw nsw i32 %21, %5
  %23 = icmp samesign ugt i32 %22, 8388607
  %24 = select i1 %23, i32 -129024, i32 -130048
  %25 = add nuw nsw i32 %14, 15360
  %26 = add nsw i32 %25, %24
  %27 = lshr i32 %22, 13
  %28 = select i1 %23, i32 0, i32 %27
  %29 = add nuw nsw i32 %26, %28
  br label %30

30:                                               ; preds = %18, %16, %13, %8, %1
  %31 = phi i32 [ 31744, %8 ], [ %4, %1 ], [ %29, %18 ], [ 31744, %13 ], [ 0, %16 ]
  %32 = or i32 %31, %7
  %33 = trunc i32 %32 to i16
  br label %34

34:                                               ; preds = %10, %30
  %35 = phi i16 [ %12, %10 ], [ %33, %30 ]
  store i16 %35, ptr %2, align 4, !tbaa !24
  %.0..0..0..0. = load float, ptr %2, align 4, !tbaa !26
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  ret float %.0..0..0..0.
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #7

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #7

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal double @__extendhfdf2(float noundef %0) local_unnamed_addr #6 {
  %2 = bitcast float %0 to i32
  %3 = trunc i32 %2 to i16
  %4 = and i16 %3, 31744
  %5 = and i16 %3, 1023
  %6 = shl i32 %2, 16
  %7 = and i32 %6, -2147483648
  switch i16 %4, label %16 [
    i16 31744, label %8
    i16 0, label %24
  ]

8:                                                ; preds = %1
  %9 = icmp eq i16 %5, 0
  br i1 %9, label %13, label %10

10:                                               ; preds = %8
  %11 = or disjoint i32 %7, 2143289344
  %12 = bitcast i32 %11 to float
  br label %29

13:                                               ; preds = %8
  %14 = or disjoint i32 %7, 2139095040
  %15 = bitcast i32 %14 to float
  br label %29

16:                                               ; preds = %1
  %17 = and i32 %2, 1023
  %18 = and i32 %2, 31744
  %19 = add nuw nsw i32 %18, 114688
  %20 = or disjoint i32 %19, %17
  %21 = shl nuw nsw i32 %20, 13
  %22 = or disjoint i32 %21, %7
  %23 = bitcast i32 %22 to float
  br label %29

24:                                               ; preds = %1
  %25 = or disjoint i32 %7, 864026624
  %26 = uitofp nneg i16 %5 to float
  %27 = bitcast i32 %25 to float
  %28 = fmul nnan float %26, %27
  br label %29

29:                                               ; preds = %10, %13, %16, %24
  %30 = phi float [ %12, %10 ], [ %15, %13 ], [ %23, %16 ], [ %28, %24 ]
  %31 = fpext float %30 to double
  ret double %31
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal float @__truncdfhf2(double noundef %0) local_unnamed_addr #6 {
  %2 = alloca i16, align 4
  %3 = fptrunc double %0 to float
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
  %4 = bitcast float %3 to i32
  %5 = and i32 %4, 2139095040
  %6 = and i32 %4, 8388607
  %7 = lshr i32 %4, 16
  %8 = and i32 %7, 32768
  switch i32 %5, label %14 [
    i32 2139095040, label %9
    i32 0, label %31
  ]

9:                                                ; preds = %1
  %10 = icmp eq i32 %6, 0
  br i1 %10, label %31, label %11

11:                                               ; preds = %9
  %12 = trunc nuw i32 %7 to i16
  %13 = or i16 %12, 32767
  br label %35

14:                                               ; preds = %1
  %15 = lshr exact i32 %5, 13
  %16 = icmp samesign ugt i32 %5, 1191182336
  br i1 %16, label %31, label %17

17:                                               ; preds = %14
  %18 = icmp samesign ult i32 %5, 947912704
  br i1 %18, label %31, label %19

19:                                               ; preds = %17
  %20 = and i32 %4, 8192
  %21 = icmp eq i32 %20, 0
  %22 = select i1 %21, i32 4095, i32 4096
  %23 = add nuw nsw i32 %22, %6
  %24 = icmp samesign ugt i32 %23, 8388607
  %25 = select i1 %24, i32 -129024, i32 -130048
  %26 = add nuw nsw i32 %15, 15360
  %27 = add nsw i32 %26, %25
  %28 = lshr i32 %23, 13
  %29 = select i1 %24, i32 0, i32 %28
  %30 = add nuw nsw i32 %27, %29
  br label %31

31:                                               ; preds = %19, %17, %14, %9, %1
  %32 = phi i32 [ 31744, %9 ], [ %5, %1 ], [ %30, %19 ], [ 31744, %14 ], [ 0, %17 ]
  %33 = or i32 %32, %8
  %34 = trunc i32 %33 to i16
  br label %35

35:                                               ; preds = %11, %31
  %36 = phi i16 [ %13, %11 ], [ %34, %31 ]
  store i16 %36, ptr %2, align 4, !tbaa !24
  %.0..0..0..0. = load float, ptr %2, align 4, !tbaa !26
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  ret float %.0..0..0..0.
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef double @fma(double noundef %0, double noundef %1, double noundef %2) local_unnamed_addr #6 {
  %4 = tail call double @llvm.fmuladd.f64(double %0, double %1, double %2)
  ret double %4
}

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #8

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef float @__math_invalidf(float noundef %0) local_unnamed_addr #9 {
  %2 = fsub float %0, %0
  %3 = fdiv float %2, %2
  ret float %3
}

; Function Attrs: inlinehint nofree norecurse nosync nounwind memory(inaccessiblemem: readwrite)
define internal float @__math_oflowf(i32 noundef %0) local_unnamed_addr #10 {
  %2 = alloca float, align 4
  %.not.i = icmp eq i32 %0, 0
  %3 = select i1 %.not.i, float f0x70000000, float f0xF0000000
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
  store volatile float %3, ptr %2, align 4, !tbaa !26
  %.0..0..0..0..0..0..0..0..0..0..0..0..i.i = load volatile float, ptr %2, align 4, !tbaa !26
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  %4 = fmul float %.0..0..0..0..0..0..0..0..0..0..0..0..i.i, f0x70000000
  ret float %4
}

; Function Attrs: inlinehint nofree norecurse nosync nounwind memory(inaccessiblemem: readwrite)
define internal float @__math_xflowf(i32 noundef %0, float noundef %1) local_unnamed_addr #10 {
  %3 = alloca float, align 4
  %.not = icmp eq i32 %0, 0
  %4 = fneg float %1
  %5 = select i1 %.not, float %1, float %4
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  store volatile float %5, ptr %3, align 4, !tbaa !26
  %.0..0..0..0..0..0..0..0..0..0..i = load volatile float, ptr %3, align 4, !tbaa !26
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  %6 = fmul float %1, %.0..0..0..0..0..0..0..0..0..0..i
  ret float %6
}

; Function Attrs: inlinehint nofree norecurse nosync nounwind memory(inaccessiblemem: readwrite)
define internal float @__math_uflowf(i32 noundef %0) local_unnamed_addr #10 {
  %2 = alloca float, align 4
  %.not.i = icmp eq i32 %0, 0
  %3 = select i1 %.not.i, float f0x10000000, float f0x90000000
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
  store volatile float %3, ptr %2, align 4, !tbaa !26
  %.0..0..0..0..0..0..0..0..0..0..0..0..i.i = load volatile float, ptr %2, align 4, !tbaa !26
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  %4 = fmul float %.0..0..0..0..0..0..0..0..0..0..0..0..i.i, f0x10000000
  ret float %4
}

; Function Attrs: inlinehint nofree norecurse nosync nounwind memory(inaccessiblemem: readwrite)
define internal float @ceilf(float noundef %0) local_unnamed_addr #10 {
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = bitcast float %0 to i32
  %5 = lshr i32 %4, 23
  %6 = and i32 %5, 255
  %7 = add nsw i32 %6, -127
  %8 = icmp samesign ugt i32 %6, 149
  br i1 %8, label %26, label %9

9:                                                ; preds = %1
  %10 = icmp samesign ugt i32 %6, 126
  br i1 %10, label %11, label %23

11:                                               ; preds = %9
  %12 = lshr i32 8388607, %7
  %13 = and i32 %12, %4
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %26, label %15

15:                                               ; preds = %11
  %16 = fadd float %0, f0x7B800000
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  store volatile float %16, ptr %3, align 4, !tbaa !26
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  %17 = icmp slt i32 %4, 0
  %18 = ashr i32 -8388608, %7
  %19 = select i1 %17, i32 0, i32 %12
  %20 = add nuw i32 %19, %4
  %21 = and i32 %20, %18
  %22 = bitcast i32 %21 to float
  br label %26

23:                                               ; preds = %9
  %24 = fadd float %0, f0x7B800000
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
  store volatile float %24, ptr %2, align 4, !tbaa !26
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  %.not = icmp sgt i32 %4, -1
  br i1 %.not, label %25, label %26

25:                                               ; preds = %23
  %.not18 = icmp eq i32 %4, 0
  %spec.select = select i1 %.not18, float %0, float 1.000000e+00
  br label %26

26:                                               ; preds = %25, %23, %15, %11, %1
  %.0 = phi float [ %0, %1 ], [ %0, %11 ], [ %22, %15 ], [ -0.000000e+00, %23 ], [ %spec.select, %25 ]
  ret float %.0
}

; Function Attrs: inlinehint nofree norecurse nosync nounwind memory(inaccessiblemem: readwrite)
define internal float @expf(float noundef %0) local_unnamed_addr #10 {
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = fpext float %0 to double
  %5 = bitcast float %0 to i32
  %6 = lshr i32 %5, 20
  %7 = and i32 %6, 2047
  %.not = icmp samesign ult i32 %7, 1067
  br i1 %.not, label %21, label %8, !prof !27

8:                                                ; preds = %1
  %9 = fcmp oeq float %0, -inf
  br i1 %9, label %39, label %10

10:                                               ; preds = %8
  %.not34 = icmp samesign ult i32 %7, 2040
  br i1 %.not34, label %13, label %11

11:                                               ; preds = %10
  %12 = fadd float %0, %0
  br label %39

13:                                               ; preds = %10
  %14 = fcmp ogt float %0, f0x42B17217
  br i1 %14, label %15, label %17

15:                                               ; preds = %13
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  store volatile float f0x70000000, ptr %3, align 4, !tbaa !26
  %.0..0..0..0..0..0..0..0..0..0..0..0..0..0..i.i.i = load volatile float, ptr %3, align 4, !tbaa !26
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  %16 = fmul float %.0..0..0..0..0..0..0..0..0..0..0..0..0..0..i.i.i, f0x70000000
  br label %39

17:                                               ; preds = %13
  %18 = fcmp olt float %0, f0xC2CFF1B4
  br i1 %18, label %19, label %21

19:                                               ; preds = %17
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
  store volatile float f0x10000000, ptr %2, align 4, !tbaa !26
  %.0..0..0..0..0..0..0..0..0..0..0..0..0..0..i.i.i3 = load volatile float, ptr %2, align 4, !tbaa !26
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  %20 = fmul float %.0..0..0..0..0..0..0..0..0..0..0..0..0..0..i.i.i3, f0x10000000
  br label %39

21:                                               ; preds = %17, %1
  %22 = fmul double %4, f0x40471547652B82FE
  %23 = fadd double %22, f0x4338000000000000
  %24 = bitcast double %23 to i64
  %25 = fadd double %23, f0xC338000000000000
  %26 = fsub double %22, %25
  %27 = and i64 %24, 31
  %28 = getelementptr inbounds nuw [8 x i8], ptr @__exp2f_data, i64 %27
  %29 = load i64, ptr %28, align 8, !tbaa !31
  %30 = shl i64 %24, 47
  %31 = add i64 %29, %30
  %32 = bitcast i64 %31 to double
  %33 = tail call double @llvm.fmuladd.f64(double %26, double f0x3EBC6AF84B912394, double f0x3F2EBFCE50FAC4F3)
  %34 = fmul double %26, %26
  %35 = tail call double @llvm.fmuladd.f64(double %26, double f0x3F962E42FF0C52D6, double 1.000000e+00)
  %36 = tail call double @llvm.fmuladd.f64(double %33, double %34, double %35)
  %37 = fmul double %36, %32
  %38 = fptrunc double %37 to float
  br label %39

39:                                               ; preds = %21, %19, %15, %11, %8
  %.0 = phi float [ %12, %11 ], [ %16, %15 ], [ %20, %19 ], [ %38, %21 ], [ 0.000000e+00, %8 ]
  ret float %.0
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef i32 @feclearexcept(i32 noundef %0) local_unnamed_addr #9 {
  ret i32 0
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef i32 @feraiseexcept(i32 noundef %0) local_unnamed_addr #9 {
  ret i32 0
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef i32 @fetestexcept(i32 noundef %0) local_unnamed_addr #9 {
  ret i32 0
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef i32 @fegetround() local_unnamed_addr #9 {
  ret i32 0
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef i32 @__fesetround(i32 noundef %0) local_unnamed_addr #9 {
  ret i32 0
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef i32 @fegetenv(ptr noundef readnone captures(none) %0) local_unnamed_addr #9 {
  ret i32 0
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef i32 @fesetenv(ptr noundef readnone captures(none) %0) local_unnamed_addr #9 {
  ret i32 0
}

; Function Attrs: inlinehint nofree norecurse nosync nounwind memory(inaccessiblemem: readwrite)
define internal float @floorf(float noundef %0) local_unnamed_addr #10 {
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = bitcast float %0 to i32
  %5 = lshr i32 %4, 23
  %6 = and i32 %5, 255
  %7 = add nsw i32 %6, -127
  %8 = icmp samesign ugt i32 %6, 149
  br i1 %8, label %26, label %9

9:                                                ; preds = %1
  %10 = icmp samesign ugt i32 %6, 126
  br i1 %10, label %11, label %22

11:                                               ; preds = %9
  %12 = lshr i32 8388607, %7
  %13 = and i32 %12, %4
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %26, label %15

15:                                               ; preds = %11
  %16 = fadd float %0, f0x7B800000
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  store volatile float %16, ptr %3, align 4, !tbaa !26
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  %.not1819 = icmp slt i32 %4, 0
  %17 = ashr i32 -8388608, %7
  %18 = select i1 %.not1819, i32 %12, i32 0
  %19 = add nsw i32 %18, %4
  %20 = and i32 %19, %17
  %21 = bitcast i32 %20 to float
  br label %26

22:                                               ; preds = %9
  %23 = fadd float %0, f0x7B800000
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
  store volatile float %23, ptr %2, align 4, !tbaa !26
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  %24 = icmp sgt i32 %4, -1
  br i1 %24, label %26, label %25

25:                                               ; preds = %22
  %.not = fcmp oeq float %0, 0.000000e+00
  %spec.select = select i1 %.not, float %0, float -1.000000e+00
  br label %26

26:                                               ; preds = %25, %22, %15, %11, %1
  %.0 = phi float [ %0, %1 ], [ %0, %11 ], [ %21, %15 ], [ 0.000000e+00, %22 ], [ %spec.select, %25 ]
  ret float %.0
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal float @fmaf(float noundef %0, float noundef %1, float noundef %2) local_unnamed_addr #9 {
  %4 = fpext float %0 to double
  %5 = fpext float %1 to double
  %6 = fmul double %4, %5
  %7 = fpext float %2 to double
  %8 = fadd double %6, %7
  %9 = bitcast double %8 to i64
  %10 = and i64 %9, 536870911
  %11 = icmp ne i64 %10, 268435456
  %12 = and i64 %9, 9218868437227405312
  %13 = icmp eq i64 %12, 9218868437227405312
  %or.cond = or i1 %11, %13
  br i1 %or.cond, label %31, label %14

14:                                               ; preds = %3
  %15 = fsub double %8, %6
  %16 = fcmp oeq double %15, %7
  %17 = fsub double %8, %7
  %18 = fcmp oeq double %17, %6
  %or.cond44 = and i1 %16, %18
  br i1 %or.cond44, label %31, label %19

19:                                               ; preds = %14
  %20 = icmp slt i64 %9, 0
  %21 = fcmp uge double %6, %7
  %22 = xor i1 %21, %20
  %23 = fsub double %6, %8
  %24 = fadd double %23, %7
  %25 = fsub double %7, %8
  %26 = fadd double %6, %25
  %.038 = select i1 %22, double %24, double %26
  %27 = fcmp uge double %.038, 0.000000e+00
  %28 = xor i1 %20, %27
  %29 = or disjoint i64 %9, 1
  %30 = add nsw i64 %9, -1
  %.sroa.0.0.in = select i1 %28, i64 %29, i64 %30
  %.sroa.0.0 = bitcast i64 %.sroa.0.0.in to double
  br label %31

31:                                               ; preds = %3, %14, %19
  %.0.in = phi double [ %.sroa.0.0, %19 ], [ %8, %14 ], [ %8, %3 ]
  %.0 = fptrunc double %.0.in to float
  ret float %.0
}

; Function Attrs: inlinehint nofree norecurse nosync nounwind memory(none)
define internal float @fmodf(float noundef %0, float noundef %1) local_unnamed_addr #11 {
  %3 = bitcast float %0 to i32
  %4 = lshr i32 %3, 23
  %5 = and i32 %4, 255
  %6 = bitcast float %1 to i32
  %7 = lshr i32 %6, 23
  %8 = and i32 %7, 255
  %9 = and i32 %3, -2147483648
  %10 = shl i32 %6, 1
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %17, label %12

12:                                               ; preds = %2
  %13 = tail call float @llvm.fabs.f32(float %1)
  %14 = bitcast float %13 to i32
  %15 = icmp samesign ugt i32 %14, 2139095040
  %16 = icmp eq i32 %5, 255
  %or.cond = or i1 %15, %16
  br i1 %or.cond, label %17, label %20

17:                                               ; preds = %12, %2
  %18 = fmul float %0, %1
  %19 = fdiv float %18, %18
  br label %83

20:                                               ; preds = %12
  %21 = shl i32 %3, 1
  %.not = icmp ugt i32 %21, %10
  br i1 %.not, label %25, label %22

22:                                               ; preds = %20
  %23 = icmp eq i32 %21, %10
  %24 = fmul float %0, 0.000000e+00
  %spec.select = select i1 %23, float %24, float %0
  br label %83

25:                                               ; preds = %20
  %.not81 = icmp eq i32 %5, 0
  br i1 %.not81, label %26, label %34

26:                                               ; preds = %25
  %27 = shl i32 %3, 9
  %28 = icmp sgt i32 %27, -1
  br i1 %28, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %26, %.lr.ph
  %.06586 = phi i32 [ %30, %.lr.ph ], [ %27, %26 ]
  %.07085 = phi i32 [ %29, %.lr.ph ], [ 0, %26 ]
  %29 = add nsw i32 %.07085, -1
  %30 = shl nuw i32 %.06586, 1
  %31 = icmp sgt i32 %30, -1
  br i1 %31, label %.lr.ph, label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph, %26
  %.070.lcssa = phi i32 [ 0, %26 ], [ %29, %.lr.ph ]
  %32 = sub i32 1, %.070.lcssa
  %33 = shl i32 %3, %32
  br label %37

34:                                               ; preds = %25
  %35 = and i32 %3, 8388607
  %36 = or disjoint i32 %35, 8388608
  br label %37

37:                                               ; preds = %34, %._crit_edge
  %.171 = phi i32 [ %5, %34 ], [ %.070.lcssa, %._crit_edge ]
  %.0 = phi i32 [ %36, %34 ], [ %33, %._crit_edge ]
  %.not82 = icmp eq i32 %8, 0
  br i1 %.not82, label %38, label %46

38:                                               ; preds = %37
  %39 = shl i32 %6, 9
  %40 = icmp sgt i32 %39, -1
  br i1 %40, label %.lr.ph90, label %._crit_edge91

.lr.ph90:                                         ; preds = %38, %.lr.ph90
  %.16688 = phi i32 [ %42, %.lr.ph90 ], [ %39, %38 ]
  %.06887 = phi i32 [ %41, %.lr.ph90 ], [ 0, %38 ]
  %41 = add nsw i32 %.06887, -1
  %42 = shl nuw i32 %.16688, 1
  %43 = icmp sgt i32 %42, -1
  br i1 %43, label %.lr.ph90, label %._crit_edge91

._crit_edge91:                                    ; preds = %.lr.ph90, %38
  %.068.lcssa = phi i32 [ 0, %38 ], [ %41, %.lr.ph90 ]
  %44 = sub i32 1, %.068.lcssa
  %45 = shl i32 %6, %44
  br label %49

46:                                               ; preds = %37
  %47 = and i32 %6, 8388607
  %48 = or disjoint i32 %47, 8388608
  br label %49

49:                                               ; preds = %46, %._crit_edge91
  %.sroa.0.0.in = phi i32 [ %48, %46 ], [ %45, %._crit_edge91 ]
  %.169 = phi i32 [ %8, %46 ], [ %.068.lcssa, %._crit_edge91 ]
  %50 = icmp sgt i32 %.171, %.169
  br i1 %50, label %.lr.ph96, label %._crit_edge97

.lr.ph96:                                         ; preds = %49, %57
  %.194 = phi i32 [ %58, %57 ], [ %.0, %49 ]
  %.27293 = phi i32 [ %59, %57 ], [ %.171, %49 ]
  %51 = sub i32 %.194, %.sroa.0.0.in
  %52 = icmp sgt i32 %51, -1
  br i1 %52, label %53, label %57

53:                                               ; preds = %.lr.ph96
  %54 = icmp eq i32 %51, 0
  br i1 %54, label %55, label %57

55:                                               ; preds = %53
  %56 = fmul float %0, 0.000000e+00
  br label %83

57:                                               ; preds = %53, %.lr.ph96
  %.2 = phi i32 [ %.194, %.lr.ph96 ], [ %51, %53 ]
  %58 = shl i32 %.2, 1
  %59 = add nsw i32 %.27293, -1
  %60 = icmp sgt i32 %59, %.169
  br i1 %60, label %.lr.ph96, label %._crit_edge97

._crit_edge97:                                    ; preds = %57, %49
  %.272.lcssa = phi i32 [ %.171, %49 ], [ %.169, %57 ]
  %.1.lcssa = phi i32 [ %.0, %49 ], [ %58, %57 ]
  %61 = sub i32 %.1.lcssa, %.sroa.0.0.in
  %62 = icmp sgt i32 %61, -1
  br i1 %62, label %63, label %67

63:                                               ; preds = %._crit_edge97
  %64 = icmp eq i32 %61, 0
  br i1 %64, label %65, label %67

65:                                               ; preds = %63
  %66 = fmul float %0, 0.000000e+00
  br label %83

67:                                               ; preds = %63, %._crit_edge97
  %.3 = phi i32 [ %.1.lcssa, %._crit_edge97 ], [ %61, %63 ]
  %68 = icmp ult i32 %.3, 8388608
  br i1 %68, label %.lr.ph103, label %._crit_edge104

.lr.ph103:                                        ; preds = %67, %.lr.ph103
  %.4101 = phi i32 [ %69, %.lr.ph103 ], [ %.3, %67 ]
  %.373100 = phi i32 [ %70, %.lr.ph103 ], [ %.272.lcssa, %67 ]
  %69 = shl nuw nsw i32 %.4101, 1
  %70 = add nsw i32 %.373100, -1
  %71 = icmp samesign ult i32 %.4101, 4194304
  br i1 %71, label %.lr.ph103, label %._crit_edge104

._crit_edge104:                                   ; preds = %.lr.ph103, %67
  %.373.lcssa = phi i32 [ %.272.lcssa, %67 ], [ %70, %.lr.ph103 ]
  %.4.lcssa = phi i32 [ %.3, %67 ], [ %69, %.lr.ph103 ]
  %72 = icmp sgt i32 %.373.lcssa, 0
  br i1 %72, label %73, label %77

73:                                               ; preds = %._crit_edge104
  %74 = add i32 %.4.lcssa, -8388608
  %75 = shl i32 %.373.lcssa, 23
  %76 = or i32 %74, %75
  br label %80

77:                                               ; preds = %._crit_edge104
  %78 = sub i32 1, %.373.lcssa
  %79 = lshr i32 %.4.lcssa, %78
  br label %80

80:                                               ; preds = %77, %73
  %.5 = phi i32 [ %76, %73 ], [ %79, %77 ]
  %81 = or i32 %.5, %9
  %82 = bitcast i32 %81 to float
  br label %83

83:                                               ; preds = %80, %65, %55, %22, %17
  %.067 = phi float [ %19, %17 ], [ %56, %55 ], [ %66, %65 ], [ %82, %80 ], [ %spec.select, %22 ]
  ret float %.067
}

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fabs.f32(float) #8

; Function Attrs: inlinehint nofree nosync nounwind memory(argmem: readwrite)
define internal float @frexpf(float noundef %0, ptr nofree noundef captures(none) %1) local_unnamed_addr #12 {
  %3 = bitcast float %0 to i32
  %4 = lshr i32 %3, 23
  %trunc = trunc i32 %4 to i8
  switch i8 %trunc, label %13 [
    i8 0, label %5
    i8 -1, label %19
  ]

5:                                                ; preds = %2
  %6 = fcmp une float %0, 0.000000e+00
  br i1 %6, label %7, label %12

7:                                                ; preds = %5
  %8 = fmul float %0, f0x5F800000
  %9 = tail call float @frexpf(float noundef %8, ptr noundef %1) #15
  %10 = load i32, ptr %1, align 4, !tbaa !9
  %11 = add nsw i32 %10, -64
  br label %12

12:                                               ; preds = %7, %5
  %storemerge = phi i32 [ %11, %7 ], [ 0, %5 ]
  %.014 = phi float [ %9, %7 ], [ %0, %5 ]
  store i32 %storemerge, ptr %1, align 4, !tbaa !9
  br label %19

13:                                               ; preds = %2
  %14 = and i32 %4, 255
  %15 = add nsw i32 %14, -126
  store i32 %15, ptr %1, align 4, !tbaa !9
  %16 = and i32 %3, -2139095041
  %17 = or disjoint i32 %16, 1056964608
  %18 = bitcast i32 %17 to float
  br label %19

19:                                               ; preds = %13, %12, %2
  %.0 = phi float [ %18, %13 ], [ %.014, %12 ], [ %0, %2 ]
  ret float %.0
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal float @ldexpf(float noundef %0, i32 noundef %1) local_unnamed_addr #9 {
  %3 = icmp sgt i32 %1, 127
  br i1 %3, label %4, label %11

4:                                                ; preds = %2
  %5 = fmul float %0, f0x7F000000
  %6 = add nsw i32 %1, -127
  %7 = icmp samesign ugt i32 %1, 254
  br i1 %7, label %8, label %scalbnf.exit

8:                                                ; preds = %4
  %9 = fmul float %5, f0x7F000000
  %10 = tail call i32 @llvm.umin.i32(i32 %1, i32 381)
  %spec.store.select.i = add nsw i32 %10, -254
  br label %scalbnf.exit

11:                                               ; preds = %2
  %12 = icmp slt i32 %1, -126
  br i1 %12, label %13, label %scalbnf.exit

13:                                               ; preds = %11
  %14 = fmul float %0, f0x0C800000
  %15 = add nuw nsw i32 %1, 102
  %16 = icmp samesign ult i32 %1, -228
  br i1 %16, label %17, label %scalbnf.exit

17:                                               ; preds = %13
  %18 = fmul float %14, f0x0C800000
  %19 = tail call i32 @llvm.umax.i32(i32 %1, i32 -330)
  %spec.store.select1.i = add nuw nsw i32 %19, 204
  br label %scalbnf.exit

scalbnf.exit:                                     ; preds = %4, %8, %11, %13, %17
  %.018.i = phi i32 [ %spec.store.select.i, %8 ], [ %6, %4 ], [ %spec.store.select1.i, %17 ], [ %15, %13 ], [ %1, %11 ]
  %.0.i = phi float [ %9, %8 ], [ %5, %4 ], [ %18, %17 ], [ %14, %13 ], [ %0, %11 ]
  %20 = shl nsw i32 %.018.i, 23
  %21 = add nsw i32 %20, 1065353216
  %22 = bitcast i32 %21 to float
  %23 = fmul float %.0.i, %22
  ret float %23
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal float @scalbnf(float noundef %0, i32 noundef %1) local_unnamed_addr #9 {
  %3 = icmp sgt i32 %1, 127
  br i1 %3, label %4, label %11

4:                                                ; preds = %2
  %5 = fmul float %0, f0x7F000000
  %6 = add nsw i32 %1, -127
  %7 = icmp samesign ugt i32 %1, 254
  br i1 %7, label %8, label %20

8:                                                ; preds = %4
  %9 = fmul float %5, f0x7F000000
  %10 = tail call i32 @llvm.umin.i32(i32 %1, i32 381)
  %spec.store.select = add nsw i32 %10, -254
  br label %20

11:                                               ; preds = %2
  %12 = icmp slt i32 %1, -126
  br i1 %12, label %13, label %20

13:                                               ; preds = %11
  %14 = fmul float %0, f0x0C800000
  %15 = add nuw nsw i32 %1, 102
  %16 = icmp samesign ult i32 %1, -228
  br i1 %16, label %17, label %20

17:                                               ; preds = %13
  %18 = fmul float %14, f0x0C800000
  %19 = tail call i32 @llvm.umax.i32(i32 %1, i32 -330)
  %spec.store.select1 = add nuw nsw i32 %19, 204
  br label %20

20:                                               ; preds = %17, %13, %11, %8, %4
  %.018 = phi i32 [ %spec.store.select, %8 ], [ %6, %4 ], [ %spec.store.select1, %17 ], [ %15, %13 ], [ %1, %11 ]
  %.0 = phi float [ %9, %8 ], [ %5, %4 ], [ %18, %17 ], [ %14, %13 ], [ %0, %11 ]
  %21 = shl nsw i32 %.018, 23
  %22 = add nsw i32 %21, 1065353216
  %23 = bitcast i32 %22 to float
  %24 = fmul float %.0, %23
  ret float %24
}

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umin.i32(i32, i32) #8

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umax.i32(i32, i32) #8

; Function Attrs: inlinehint nofree norecurse nosync nounwind memory(inaccessiblemem: readwrite)
define internal float @powf(float noundef %0, float noundef %1) local_unnamed_addr #10 {
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  %5 = alloca float, align 4
  %6 = bitcast float %0 to i32
  %7 = bitcast float %1 to i32
  %8 = add i32 %6, -2139095040
  %9 = icmp ult i32 %8, -2130706432
  %.pre = shl i32 %7, 1
  %10 = add i32 %.pre, 16777216
  %11 = icmp ult i32 %10, 16777217
  %or.cond99 = or i1 %9, %11
  br i1 %or.cond99, label %.critedge, label %76, !prof !35

.critedge:                                        ; preds = %2
  %12 = add i32 %.pre, -1
  %13 = icmp ult i32 %12, -16777217
  br i1 %13, label %30, label %14, !prof !27

14:                                               ; preds = %.critedge
  %15 = icmp eq i32 %.pre, 0
  %16 = icmp eq i32 %6, 1065353216
  %or.cond70 = or i1 %16, %15
  br i1 %or.cond70, label %134, label %17

17:                                               ; preds = %14
  %18 = shl i32 %6, 1
  %19 = icmp ugt i32 %18, -16777216
  %20 = icmp samesign ugt i32 %.pre, -16777216
  %or.cond = or i1 %19, %20
  br i1 %or.cond, label %21, label %23

21:                                               ; preds = %17
  %22 = fadd float %0, %1
  br label %134

23:                                               ; preds = %17
  %24 = icmp eq i32 %18, 2130706432
  br i1 %24, label %134, label %25

25:                                               ; preds = %23
  %26 = icmp ult i32 %18, 2130706432
  %27 = icmp slt i32 %7, 0
  %28 = xor i1 %26, %27
  %29 = fmul float %1, %1
  %spec.select71 = select i1 %28, float 0.000000e+00, float %29
  br label %134

30:                                               ; preds = %.critedge
  %31 = shl i32 %6, 1
  %32 = add i32 %31, -1
  %33 = icmp ult i32 %32, -16777217
  br i1 %33, label %49, label %34, !prof !27

34:                                               ; preds = %30
  %35 = fmul float %0, %0
  %.not66 = icmp sgt i32 %6, -1
  br i1 %.not66, label %checkint.exit.thread, label %36

36:                                               ; preds = %34
  %37 = lshr i32 %7, 23
  %38 = and i32 %37, 255
  %39 = add nsw i32 %38, -151
  %or.cond92 = icmp ult i32 %39, -24
  br i1 %or.cond92, label %checkint.exit.thread, label %40

40:                                               ; preds = %36
  %41 = sub nuw nsw i32 150, %38
  %42 = shl nuw nsw i32 1, %41
  %43 = add nsw i32 %42, -1
  %44 = and i32 %43, %7
  %.not.i = icmp ne i32 %44, 0
  %45 = and i32 %42, %7
  %.not9.i = icmp eq i32 %45, 0
  %or.cond93 = or i1 %.not9.i, %.not.i
  %46 = fneg float %35
  %spec.select = select i1 %or.cond93, float %35, float %46
  br label %checkint.exit.thread

checkint.exit.thread:                             ; preds = %40, %36, %34
  %.057 = phi float [ %35, %34 ], [ %35, %36 ], [ %spec.select, %40 ]
  %.not67 = icmp sgt i32 %7, -1
  br i1 %.not67, label %134, label %47

47:                                               ; preds = %checkint.exit.thread
  %48 = fdiv float 1.000000e+00, %.057
  call void @llvm.lifetime.start.p0(ptr nonnull %5)
  store volatile float %48, ptr %5, align 4, !tbaa !26
  %.0..0..0..0..0..0..0..0..0..0..i = load volatile float, ptr %5, align 4, !tbaa !26
  call void @llvm.lifetime.end.p0(ptr nonnull %5)
  br label %134

49:                                               ; preds = %30
  %.not64 = icmp sgt i32 %6, -1
  br i1 %.not64, label %69, label %50

50:                                               ; preds = %49
  %51 = lshr i32 %7, 23
  %52 = and i32 %51, 255
  %53 = icmp samesign ult i32 %52, 127
  br i1 %53, label %.thread, label %54

54:                                               ; preds = %50
  %55 = icmp samesign ugt i32 %52, 150
  br i1 %55, label %checkint.exit76.thread85, label %56

56:                                               ; preds = %54
  %57 = sub nuw nsw i32 150, %52
  %58 = shl nuw nsw i32 1, %57
  %59 = add nsw i32 %58, -1
  %60 = and i32 %59, %7
  %.not.i72 = icmp eq i32 %60, 0
  br i1 %.not.i72, label %61, label %.thread

61:                                               ; preds = %56
  %62 = and i32 %58, %7
  %.not9.i74 = icmp eq i32 %62, 0
  br i1 %.not9.i74, label %checkint.exit76.thread85, label %65

.thread:                                          ; preds = %56, %50
  %63 = fsub float %0, %0
  %64 = fdiv float %63, %63
  br label %134

checkint.exit76.thread85:                         ; preds = %61, %54
  br label %65

65:                                               ; preds = %checkint.exit76.thread85, %61
  %66 = phi i32 [ 0, %checkint.exit76.thread85 ], [ 65536, %61 ]
  %67 = tail call float @llvm.fabs.f32(float %0)
  %68 = bitcast float %67 to i32
  br label %69

69:                                               ; preds = %65, %49
  %.154 = phi i32 [ %68, %65 ], [ %6, %49 ]
  %.151 = phi i32 [ %66, %65 ], [ 0, %49 ]
  %70 = icmp ult i32 %.154, 8388608
  br i1 %70, label %71, label %76

71:                                               ; preds = %69
  %72 = fmul float %0, f0x4B000000
  %73 = tail call float @llvm.fabs.f32(float %72)
  %74 = bitcast float %73 to i32
  %75 = add nsw i32 %74, -192937984
  br label %76

76:                                               ; preds = %71, %69, %2
  %.053 = phi i32 [ %75, %71 ], [ %.154, %69 ], [ %6, %2 ]
  %.050 = phi i32 [ %.151, %71 ], [ %.151, %69 ], [ 0, %2 ]
  %77 = add i32 %.053, -1060306944
  %78 = lshr i32 %77, 19
  %79 = and i32 %78, 15
  %80 = and i32 %77, -8388608
  %81 = sub i32 %.053, %80
  %82 = ashr i32 %77, 23
  %83 = zext nneg i32 %79 to i64
  %84 = getelementptr inbounds nuw [16 x i8], ptr @__powf_log2_data, i64 %83
  %85 = load double, ptr %84, align 8, !tbaa !37
  %86 = getelementptr inbounds nuw i8, ptr %84, i64 8
  %87 = load double, ptr %86, align 8, !tbaa !38
  %88 = bitcast i32 %81 to float
  %89 = fpext float %88 to double
  %90 = tail call double @llvm.fmuladd.f64(double %89, double %85, double -1.000000e+00)
  %91 = sitofp i32 %82 to double
  %92 = fadd double %87, %91
  %93 = fmul double %90, %90
  %94 = tail call double @llvm.fmuladd.f64(double %90, double f0x3FD27616C9496E0B, double f0xBFD71969A075C67A)
  %95 = tail call double @llvm.fmuladd.f64(double %90, double f0x3FDEC70A6CA7BADD, double f0xBFE7154748BEF6C8)
  %96 = fmul double %93, %93
  %97 = tail call double @llvm.fmuladd.f64(double %90, double f0x3FF71547652AB82B, double %92)
  %98 = tail call double @llvm.fmuladd.f64(double %95, double %93, double %97)
  %99 = tail call double @llvm.fmuladd.f64(double %94, double %96, double %98)
  %100 = fpext float %1 to double
  %101 = fmul double %99, %100
  %102 = bitcast double %101 to i64
  %103 = and i64 %102, 9223231299366420480
  %104 = icmp samesign ugt i64 %103, 4638426141214900224
  br i1 %104, label %105, label %115, !prof !39

105:                                              ; preds = %76
  %106 = fcmp ogt double %101, f0x405FFFFFFFD1D571
  br i1 %106, label %107, label %110

107:                                              ; preds = %105
  %.not.i.i = icmp eq i32 %.050, 0
  %108 = select i1 %.not.i.i, float f0x70000000, float f0xF0000000
  call void @llvm.lifetime.start.p0(ptr nonnull %4)
  store volatile float %108, ptr %4, align 4, !tbaa !26
  %.0..0..0..0..0..0..0..0..0..0..0..0..0..0..i.i.i = load volatile float, ptr %4, align 4, !tbaa !26
  call void @llvm.lifetime.end.p0(ptr nonnull %4)
  %109 = fmul float %.0..0..0..0..0..0..0..0..0..0..0..0..0..0..i.i.i, f0x70000000
  br label %134

110:                                              ; preds = %105
  %111 = fcmp ugt double %101, -1.500000e+02
  br i1 %111, label %115, label %112

112:                                              ; preds = %110
  %.not.i.i5 = icmp eq i32 %.050, 0
  %113 = select i1 %.not.i.i5, float f0x10000000, float f0x90000000
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  store volatile float %113, ptr %3, align 4, !tbaa !26
  %.0..0..0..0..0..0..0..0..0..0..0..0..0..0..i.i.i6 = load volatile float, ptr %3, align 4, !tbaa !26
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  %114 = fmul float %.0..0..0..0..0..0..0..0..0..0..0..0..0..0..i.i.i6, f0x10000000
  br label %134

115:                                              ; preds = %110, %76
  %116 = fadd double %101, f0x42E8000000000000
  %117 = bitcast double %116 to i64
  %118 = fadd double %116, f0xC2E8000000000000
  %119 = fsub double %101, %118
  %120 = and i64 %117, 31
  %121 = getelementptr inbounds nuw [8 x i8], ptr @__exp2f_data, i64 %120
  %122 = load i64, ptr %121, align 8, !tbaa !31
  %123 = zext nneg i32 %.050 to i64
  %124 = add i64 %117, %123
  %125 = shl i64 %124, 47
  %126 = add i64 %122, %125
  %127 = bitcast i64 %126 to double
  %128 = tail call double @llvm.fmuladd.f64(double %119, double f0x3FAC6AF84B912394, double f0x3FCEBFCE50FAC4F3)
  %129 = fmul double %119, %119
  %130 = tail call double @llvm.fmuladd.f64(double %119, double f0x3FE62E42FF0C52D6, double 1.000000e+00)
  %131 = tail call double @llvm.fmuladd.f64(double %128, double %129, double %130)
  %132 = fmul double %131, %127
  %133 = fptrunc double %132 to float
  br label %134

134:                                              ; preds = %115, %112, %107, %.thread, %47, %checkint.exit.thread, %25, %23, %21, %14
  %.0 = phi float [ %22, %21 ], [ 1.000000e+00, %14 ], [ 1.000000e+00, %23 ], [ %.0..0..0..0..0..0..0..0..0..0..i, %47 ], [ %.057, %checkint.exit.thread ], [ %109, %107 ], [ %114, %112 ], [ %133, %115 ], [ %spec.select71, %25 ], [ %64, %.thread ]
  ret float %.0
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef float @rintf(float noundef %0) local_unnamed_addr #9 {
  %2 = bitcast float %0 to i32
  %3 = and i32 %2, 2130706432
  %4 = icmp samesign ugt i32 %3, 1249902592
  br i1 %4, label %12, label %5

5:                                                ; preds = %1
  %.not = icmp sgt i32 %2, -1
  %6 = fadd float %0, f0xCB000000
  %7 = fadd float %6, f0x4B000000
  %8 = fadd float %0, f0x4B000000
  %9 = fadd float %8, f0xCB000000
  %.0 = select i1 %.not, float %9, float %7
  %10 = fcmp oeq float %.0, 0.000000e+00
  %11 = select i1 %.not, float 0.000000e+00, float -0.000000e+00
  %spec.select = select i1 %10, float %11, float %.0
  br label %12

12:                                               ; preds = %5, %1
  %.010 = phi float [ %spec.select, %5 ], [ %0, %1 ]
  ret float %.010
}

; Function Attrs: inlinehint nofree norecurse nosync nounwind memory(inaccessiblemem: readwrite)
define internal float @roundf(float noundef %0) local_unnamed_addr #10 {
  %2 = alloca float, align 4
  %3 = bitcast float %0 to i32
  %4 = lshr i32 %3, 23
  %5 = and i32 %4, 255
  %6 = icmp samesign ugt i32 %5, 149
  br i1 %6, label %25, label %7

7:                                                ; preds = %1
  %spec.select = tail call float @llvm.fabs.f32(float %0)
  %8 = icmp samesign ult i32 %5, 126
  %9 = fadd float %spec.select, f0x4B000000
  br i1 %8, label %10, label %12

10:                                               ; preds = %7
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
  store volatile float %9, ptr %2, align 4, !tbaa !26
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  %11 = fmul float %0, 0.000000e+00
  br label %25

12:                                               ; preds = %7
  %13 = fadd float %9, f0xCB000000
  %14 = fsub float %13, %spec.select
  %15 = fcmp ogt float %14, 5.000000e-01
  br i1 %15, label %16, label %19

16:                                               ; preds = %12
  %17 = fadd float %spec.select, %14
  %18 = fadd float %17, -1.000000e+00
  br label %23

19:                                               ; preds = %12
  %20 = fcmp ugt float %14, -5.000000e-01
  %21 = fadd float %spec.select, %14
  %22 = fadd float %21, 1.000000e+00
  %spec.select1 = select i1 %20, float %21, float %22
  br label %23

23:                                               ; preds = %19, %16
  %.0 = phi float [ %18, %16 ], [ %spec.select1, %19 ]
  %24 = fneg float %.0
  %.not26 = icmp slt i32 %3, 0
  %spec.select25 = select i1 %.not26, float %24, float %.0
  br label %25

25:                                               ; preds = %23, %10, %1
  %.020 = phi float [ %11, %10 ], [ %spec.select25, %23 ], [ %0, %1 ]
  ret float %.020
}

; Function Attrs: alwaysinline mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.smax.i64(i64, i64) #5

; Function Attrs: alwaysinline mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.smin.i64(i64, i64) #5

; Function Attrs: alwaysinline mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.experimental.noalias.scope.decl(metadata) #13

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, target_mem: none) "frame-pointer"="all" "hot" "no-builtins" "nonlazybind" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) "frame-pointer"="all" "hot" "no-builtins" "nonlazybind" }
attributes #2 = { mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) "frame-pointer"="all" "hot" "no-builtins" "nonlazybind" }
attributes #3 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable "nonlazybind" }
attributes #4 = { alwaysinline nofree norecurse nosync nounwind memory(argmem: readwrite) "min-legal-vector-width"="256" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+avx,+avx2,+cmov,+crc32,+cx8,+fma,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87,+xsave" "tune-cpu"="generic" }
attributes #5 = { alwaysinline mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #6 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #7 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #8 = { mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #9 = { inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none) }
attributes #10 = { inlinehint nofree norecurse nosync nounwind memory(inaccessiblemem: readwrite) }
attributes #11 = { inlinehint nofree norecurse nosync nounwind memory(none) }
attributes #12 = { inlinehint nofree nosync nounwind memory(argmem: readwrite) }
attributes #13 = { alwaysinline mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #14 = { nounwind }
attributes #15 = { inlinehint }

!llvm.module.flags = !{!0, !1, !2, !20, !4, !54}
!llvm.ident = !{}
!llvm.errno.tbaa = !{!9, !22}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 1, !"float-abi", !"hard"}
!2 = !{i32 1, !"wchar_size", i32 4}
!4 = !{i32 7, !"PIE Level", i32 2}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!"omnipotent char", !6, i64 0}
!8 = !{!"int", !7, i64 0}
!9 = !{!8, !8, i64 0}
!10 = distinct !{!10, !"tile"}
!11 = distinct !{!11, !10, !"tile: argument 2"}
!12 = distinct !{!12, !10, !"tile: argument 1"}
!13 = distinct !{!13, !18, !19}
!14 = distinct !{!14, !18, !19}
!15 = distinct !{!15, !18, !19}
!16 = !{!7, !7, i64 0}
!17 = !{!12, !11}
!18 = !{!"llvm.loop.mustprogress"}
!19 = !{!"llvm.loop.unroll.disable"}
!20 = !{i32 8, !"PIC Level", i32 0}
!21 = !{!"__libc_errno", !8, i64 0}
!22 = !{!21, !8, i64 0}
!23 = !{!"short", !7, i64 0}
!24 = !{!23, !23, i64 0}
!25 = !{!"float", !7, i64 0}
!26 = !{!25, !25, i64 0}
!27 = !{!"branch_weights", !"expected", i32 2000, i32 1}
!28 = !{!"double", !7, i64 0}
!30 = !{!"long", !7, i64 0}
!31 = !{!30, !30, i64 0}
!35 = !{!"branch_weights", i32 4001, i32 4000000}
!36 = !{!"", !28, i64 0, !28, i64 8}
!37 = !{!36, !28, i64 0}
!38 = !{!36, !28, i64 8}
!39 = !{!"branch_weights", !"expected", i32 1, i32 2000}
!54 = !{i32 7, !"frame-pointer", i32 2}
!72 = !{}
!107 = !{!"llvm.loop.isvectorized", i32 1}
!108 = !{!"llvm.loop.unroll.runtime.disable"}
!129 = !{!"_Bool", !7, i64 0}
!130 = !{!"iree_uk_pack_tmpbuf_helper_t", !7, i64 0, !8, i64 4096, !129, i64 4100}
!131 = !{!130, !8, i64 4096}
!132 = !{!130, !129, i64 4100}
!137 = !{!"branch_weights", i32 4, i32 28}
!147 = !{!"iree_uk_unpack_tmpbuf_helper_t", !7, i64 0, !8, i64 4096}
!148 = !{!147, !8, i64 4096}
!1363 = distinct !{!1363, !18}
!1364 = distinct !{!1364, !18}
!1367 = distinct !{!1367, !18, !107, !108}
!1368 = distinct !{!1368, !18, !107, !108}
!1369 = distinct !{!1369, !18, !108, !107}
!1374 = distinct !{!1374, !18, !107, !108}
!1375 = distinct !{!1375, !18, !108, !107}
!1383 = distinct !{!1383, !18, !107, !108}
!1384 = distinct !{!1384, !18, !107, !108}
!1385 = distinct !{!1385, !18, !108, !107}
!1386 = distinct !{!1386, !18}
!1409 = distinct !{!1409, !18}
!1410 = !{i8 0, i8 2}
!1437 = distinct !{!1437, !18, !107, !108}
!1441 = distinct !{!1441, !18}
!1451 = distinct !{!1451, !18}
!1452 = distinct !{!1452, !18}
!1457 = distinct !{!1457, !18}
!1464 = distinct !{!1464, !18, !107, !108}
!1467 = distinct !{!1467, !18}
!1468 = distinct !{!1468, !18}
!1516 = distinct !{!1516, !18, !107, !108}
!1519 = distinct !{!1519, !18}
!1520 = distinct !{!1520, !18}
!1846 = !{!1887}
!1847 = !{!1870}
!1848 = !{!1874}
!1849 = !{!1884}
!1850 = !{!1886}
!1851 = !{!1886, !1874}
!1852 = !{!1884, !1870}
!1870 = distinct !{!1870, !1871, !"iree_uk_copy_1d_strided_to_unstrided: argument 0"}
!1871 = distinct !{!1871, !"iree_uk_copy_1d_strided_to_unstrided"}
!1874 = distinct !{!1874, !1871, !"iree_uk_copy_1d_strided_to_unstrided: argument 1"}
!1884 = distinct !{!1884, !1885, !"iree_uk_memcpy: argument 0"}
!1885 = distinct !{!1885, !"iree_uk_memcpy"}
!1886 = distinct !{!1886, !1885, !"iree_uk_memcpy: argument 1"}
!1887 = distinct !{!1887, !1888, !"iree_uk_fill: argument 0"}
!1888 = distinct !{!1888, !"iree_uk_fill"}
!2186 = !{!2209}
!2187 = !{!2213}
!2188 = !{!2223}
!2189 = !{!2225}
!2190 = !{!2225, !2213}
!2191 = !{!2223, !2209}
!2209 = distinct !{!2209, !2210, !"iree_uk_copy_1d_unstrided_to_strided: argument 0"}
!2210 = distinct !{!2210, !"iree_uk_copy_1d_unstrided_to_strided"}
!2213 = distinct !{!2213, !2210, !"iree_uk_copy_1d_unstrided_to_strided: argument 1"}
!2223 = distinct !{!2223, !2224, !"iree_uk_memcpy: argument 0"}
!2224 = distinct !{!2224, !"iree_uk_memcpy"}
!2225 = distinct !{!2225, !2224, !"iree_uk_memcpy: argument 1"}
!2392 = !{!2396}
!2393 = !{!2394}
!2394 = distinct !{!2394, !2395, !"iree_uk_memcpy: argument 1"}
!2395 = distinct !{!2395, !"iree_uk_memcpy"}
!2396 = distinct !{!2396, !2395, !"iree_uk_memcpy: argument 0"}
!2397 = distinct !{!2397, !"iree_uk_pack_tile_generic_direct"}
!2398 = distinct !{!2398, !2397, !"iree_uk_pack_tile_generic_direct: argument 0"}
!2399 = !{!2398}
!2400 = distinct !{!2400, !2397, !"iree_uk_pack_tile_generic_direct: argument 1"}
!2401 = !{!2400}
!2402 = !{!2396, !2398}
!2403 = !{!2394, !2400}
!2409 = !{!2413}
!2410 = !{!2411}
!2411 = distinct !{!2411, !2412, !"iree_uk_memcpy: argument 1"}
!2412 = distinct !{!2412, !"iree_uk_memcpy"}
!2413 = distinct !{!2413, !2412, !"iree_uk_memcpy: argument 0"}
!2414 = distinct !{!2414, !"iree_uk_pack_tile_generic_transpose"}
!2415 = distinct !{!2415, !2414, !"iree_uk_pack_tile_generic_transpose: argument 0"}
!2416 = !{!2415}
!2417 = distinct !{!2417, !2414, !"iree_uk_pack_tile_generic_transpose: argument 1"}
!2418 = !{!2417}
!2419 = !{!2411, !2417}
!2420 = !{!2413, !2415}
!2426 = !{!2430}
!2427 = !{!2428}
!2428 = distinct !{!2428, !2429, !"iree_uk_memcpy: argument 1"}
!2429 = distinct !{!2429, !"iree_uk_memcpy"}
!2430 = distinct !{!2430, !2429, !"iree_uk_memcpy: argument 0"}
!2431 = distinct !{!2431, !"iree_uk_pack_tile_generic_transpose"}
!2432 = distinct !{!2432, !2431, !"iree_uk_pack_tile_generic_transpose: argument 0"}
!2433 = !{!2432}
!2434 = distinct !{!2434, !2431, !"iree_uk_pack_tile_generic_transpose: argument 1"}
!2435 = !{!2434}
!2436 = !{!2428, !2434}
!2437 = !{!2430, !2432}
!2447 = !{!2451}
!2448 = !{!2449}
!2449 = distinct !{!2449, !2450, !"iree_uk_memcpy: argument 1"}
!2450 = distinct !{!2450, !"iree_uk_memcpy"}
!2451 = distinct !{!2451, !2450, !"iree_uk_memcpy: argument 0"}
!2452 = distinct !{!2452, !"iree_uk_unpack_tile_generic_direct"}
!2453 = distinct !{!2453, !2452, !"iree_uk_unpack_tile_generic_direct: argument 0"}
!2454 = !{!2453}
!2455 = distinct !{!2455, !2452, !"iree_uk_unpack_tile_generic_direct: argument 1"}
!2456 = !{!2455}
!2457 = !{!2451, !2453}
!2458 = !{!2449, !2455}
!2464 = !{!2468}
!2465 = !{!2466}
!2466 = distinct !{!2466, !2467, !"iree_uk_memcpy: argument 1"}
!2467 = distinct !{!2467, !"iree_uk_memcpy"}
!2468 = distinct !{!2468, !2467, !"iree_uk_memcpy: argument 0"}
!2469 = distinct !{!2469, !"iree_uk_unpack_tile_generic_direct"}
!2470 = distinct !{!2470, !2469, !"iree_uk_unpack_tile_generic_direct: argument 0"}
!2471 = !{!2470}
!2472 = distinct !{!2472, !2469, !"iree_uk_unpack_tile_generic_direct: argument 1"}
!2473 = !{!2472}
!2474 = !{!2468, !2470}
!2475 = !{!2466, !2472}
