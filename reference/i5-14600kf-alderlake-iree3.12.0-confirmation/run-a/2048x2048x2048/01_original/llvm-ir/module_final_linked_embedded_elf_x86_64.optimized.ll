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

@0 = internal constant [13 x i8] c"final_linked\00", align 1
@iree_hal_executable_library_query_v0_header = internal constant %iree_hal_executable_library_header_t { i32 6, ptr @0, i32 0, i32 0 }
@iree_hal_executable_library_query_v0_funcs = internal constant [3 x ptr] [ptr @gemm_dispatch_0_matmul_2048x2048x2048_f32, ptr @_encoding_0_encode_2048x2048xf32_to_2048x2048xf32, ptr @_encoding_1_encode_2048x2048xf32_to_2048x2048xf32]
@iree_hal_executable_library_query_v0_attrs = internal constant [3 x %iree_hal_executable_dispatch_attrs_v0_t] [%iree_hal_executable_dispatch_attrs_v0_t { i64 0, i16 0, i8 0, i8 2, i32 1, i32 1, i16 1, i16 0, i64 0, i64 0, i64 0, i64 0, i64 0 }, %iree_hal_executable_dispatch_attrs_v0_t { i64 0, i16 0, i8 0, i8 2, i32 1, i32 1, i16 1, i16 0, i64 0, i64 0, i64 0, i64 0, i64 0 }, %iree_hal_executable_dispatch_attrs_v0_t { i64 0, i16 0, i8 0, i8 2, i32 1, i32 1, i16 1, i16 0, i64 0, i64 0, i64 0, i64 0, i64 0 }]
@1 = internal constant [42 x i8] c"gemm_dispatch_0_matmul_2048x2048x2048_f32\00", align 1
@2 = internal constant [50 x i8] c"_encoding_0_encode_2048x2048xf32_to_2048x2048xf32\00", align 1
@3 = internal constant [50 x i8] c"_encoding_1_encode_2048x2048xf32_to_2048x2048xf32\00", align 1
@iree_hal_executable_library_query_v0_names = internal constant [3 x ptr] [ptr @1, ptr @2, ptr @3]
@4 = internal constant [78 x i8] c"/tmp/iree-gemm-bench-confirmation/run-a/2048x2048x2048/01_original/final.mlir\00", align 1
@5 = internal constant [78 x i8] c"/tmp/iree-gemm-bench-confirmation/run-a/2048x2048x2048/01_original/final.mlir\00", align 1
@6 = internal constant [78 x i8] c"/tmp/iree-gemm-bench-confirmation/run-a/2048x2048x2048/01_original/final.mlir\00", align 1
@iree_hal_executable_library_query_v0_source_locations = internal constant [3 x %iree_hal_executable_source_location_v0_t] [%iree_hal_executable_source_location_v0_t { i32 5, i32 77, ptr @4 }, %iree_hal_executable_source_location_v0_t { i32 132, i32 77, ptr @5 }, %iree_hal_executable_source_location_v0_t { i32 218, i32 77, ptr @6 }]
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
  %4 = alloca [64 x float], align 64
  %.elt19 = getelementptr inbounds nuw i8, ptr %1, i64 32
  %.unpack20 = load ptr, ptr %.elt19, align 16
  %5 = load ptr, ptr %.unpack20, align 8
  %6 = getelementptr i8, ptr %.unpack20, i64 8
  %7 = load ptr, ptr %6, align 8
  %8 = load i32, ptr %2, align 16
  %9 = zext i32 %8 to i64
  %10 = and i64 %9, 127
  %11 = shl nuw nsw i64 %9, 9
  %12 = and i64 %11, 2199023190016
  %13 = shl nuw nsw i64 %10, 17
  %14 = getelementptr inbounds nuw i8, ptr %5, i64 %12
  %15 = shl nuw nsw i64 %10, 6
  %invariant.gep = getelementptr i8, ptr %7, i64 %15
  %invariant.gep47 = getelementptr i8, ptr %invariant.gep, i64 %12
  %invariant.gep56 = getelementptr inbounds nuw i8, ptr %5, i64 %13
  %16 = getelementptr inbounds nuw i8, ptr %4, i64 32
  %17 = getelementptr inbounds nuw i8, ptr %4, i64 64
  %18 = getelementptr inbounds nuw i8, ptr %4, i64 96
  %19 = getelementptr inbounds nuw i8, ptr %4, i64 128
  %20 = getelementptr inbounds nuw i8, ptr %4, i64 160
  %21 = getelementptr inbounds nuw i8, ptr %4, i64 192
  %22 = getelementptr inbounds nuw i8, ptr %4, i64 224
  br label %23

23:                                               ; preds = %iree_uk_mmt4d_tile_f32f32f32_8x8x1_x86_64_avx2_fma.exit, %3
  %24 = phi i1 [ true, %3 ], [ false, %iree_uk_mmt4d_tile_f32f32f32_8x8x1_x86_64_avx2_fma.exit ]
  %25 = phi i64 [ 0, %3 ], [ 1, %iree_uk_mmt4d_tile_f32f32f32_8x8x1_x86_64_avx2_fma.exit ]
  %26 = shl nuw nsw i64 %25, 16
  %gep = getelementptr inbounds nuw i8, ptr %invariant.gep56, i64 %26
  %27 = getelementptr inbounds nuw i8, ptr %gep, i64 16777216
  call void @llvm.prefetch.p0(ptr nonnull %4, i32 1, i32 1, i32 1)
  tail call void @llvm.prefetch.p0(ptr %14, i32 0, i32 3, i32 1)
  tail call void @llvm.prefetch.p0(ptr nonnull %27, i32 0, i32 3, i32 1)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2515)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2517)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2519)
  br label %.preheader.i

.preheader.i:                                     ; preds = %23, %.preheader.i
  %28 = phi <8 x float> [ %78, %.preheader.i ], [ zeroinitializer, %23 ]
  %29 = phi <8 x float> [ %73, %.preheader.i ], [ zeroinitializer, %23 ]
  %30 = phi <8 x float> [ %68, %.preheader.i ], [ zeroinitializer, %23 ]
  %31 = phi <8 x float> [ %63, %.preheader.i ], [ zeroinitializer, %23 ]
  %32 = phi <8 x float> [ %58, %.preheader.i ], [ zeroinitializer, %23 ]
  %33 = phi <8 x float> [ %53, %.preheader.i ], [ zeroinitializer, %23 ]
  %34 = phi <8 x float> [ %48, %.preheader.i ], [ zeroinitializer, %23 ]
  %35 = phi <8 x float> [ %43, %.preheader.i ], [ zeroinitializer, %23 ]
  %36 = phi i64 [ %81, %.preheader.i ], [ 0, %23 ]
  %37 = phi ptr [ %79, %.preheader.i ], [ %27, %23 ]
  %38 = phi ptr [ %80, %.preheader.i ], [ %14, %23 ]
  %39 = load <8 x float>, ptr %37, align 1, !tbaa !46, !alias.scope !2519, !noalias !2525
  %40 = load float, ptr %38, align 1, !tbaa !46, !alias.scope !2517, !noalias !2522
  %41 = insertelement <8 x float> poison, float %40, i64 0
  %42 = shufflevector <8 x float> %41, <8 x float> poison, <8 x i32> zeroinitializer
  %43 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %42, <8 x float> %39, <8 x float> %35)
  %44 = getelementptr inbounds nuw i8, ptr %38, i64 4
  %45 = load float, ptr %44, align 1, !tbaa !46, !alias.scope !2517, !noalias !2522
  %46 = insertelement <8 x float> poison, float %45, i64 0
  %47 = shufflevector <8 x float> %46, <8 x float> poison, <8 x i32> zeroinitializer
  %48 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %47, <8 x float> %39, <8 x float> %34)
  %49 = getelementptr inbounds nuw i8, ptr %38, i64 8
  %50 = load float, ptr %49, align 1, !tbaa !46, !alias.scope !2517, !noalias !2522
  %51 = insertelement <8 x float> poison, float %50, i64 0
  %52 = shufflevector <8 x float> %51, <8 x float> poison, <8 x i32> zeroinitializer
  %53 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %52, <8 x float> %39, <8 x float> %33)
  %54 = getelementptr inbounds nuw i8, ptr %38, i64 12
  %55 = load float, ptr %54, align 1, !tbaa !46, !alias.scope !2517, !noalias !2522
  %56 = insertelement <8 x float> poison, float %55, i64 0
  %57 = shufflevector <8 x float> %56, <8 x float> poison, <8 x i32> zeroinitializer
  %58 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %57, <8 x float> %39, <8 x float> %32)
  %59 = getelementptr inbounds nuw i8, ptr %38, i64 16
  %60 = load float, ptr %59, align 1, !tbaa !46, !alias.scope !2517, !noalias !2522
  %61 = insertelement <8 x float> poison, float %60, i64 0
  %62 = shufflevector <8 x float> %61, <8 x float> poison, <8 x i32> zeroinitializer
  %63 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %62, <8 x float> %39, <8 x float> %31)
  %64 = getelementptr inbounds nuw i8, ptr %38, i64 20
  %65 = load float, ptr %64, align 1, !tbaa !46, !alias.scope !2517, !noalias !2522
  %66 = insertelement <8 x float> poison, float %65, i64 0
  %67 = shufflevector <8 x float> %66, <8 x float> poison, <8 x i32> zeroinitializer
  %68 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %67, <8 x float> %39, <8 x float> %30)
  %69 = getelementptr inbounds nuw i8, ptr %38, i64 24
  %70 = load float, ptr %69, align 1, !tbaa !46, !alias.scope !2517, !noalias !2522
  %71 = insertelement <8 x float> poison, float %70, i64 0
  %72 = shufflevector <8 x float> %71, <8 x float> poison, <8 x i32> zeroinitializer
  %73 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %72, <8 x float> %39, <8 x float> %29)
  %74 = getelementptr inbounds nuw i8, ptr %38, i64 28
  %75 = load float, ptr %74, align 1, !tbaa !46, !alias.scope !2517, !noalias !2522
  %76 = insertelement <8 x float> poison, float %75, i64 0
  %77 = shufflevector <8 x float> %76, <8 x float> poison, <8 x i32> zeroinitializer
  %78 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %77, <8 x float> %39, <8 x float> %28)
  %79 = getelementptr inbounds nuw i8, ptr %37, i64 32
  %80 = getelementptr inbounds nuw i8, ptr %38, i64 32
  %81 = add nuw nsw i64 %36, 1
  %82 = icmp eq i64 %81, 2048
  br i1 %82, label %iree_uk_mmt4d_tile_f32f32f32_8x8x1_x86_64_avx2_fma.exit, label %.preheader.i, !llvm.loop !27

iree_uk_mmt4d_tile_f32f32f32_8x8x1_x86_64_avx2_fma.exit: ; preds = %.preheader.i
  store <8 x float> %43, ptr %4, align 64, !tbaa !46, !alias.scope !2515, !noalias !2520
  store <8 x float> %48, ptr %16, align 32, !tbaa !46, !alias.scope !2515, !noalias !2520
  store <8 x float> %53, ptr %17, align 64, !tbaa !46, !alias.scope !2515, !noalias !2520
  store <8 x float> %58, ptr %18, align 32, !tbaa !46, !alias.scope !2515, !noalias !2520
  store <8 x float> %63, ptr %19, align 64, !tbaa !46, !alias.scope !2515, !noalias !2520
  store <8 x float> %68, ptr %20, align 32, !tbaa !46, !alias.scope !2515, !noalias !2520
  store <8 x float> %73, ptr %21, align 64, !tbaa !46, !alias.scope !2515, !noalias !2520
  store <8 x float> %78, ptr %22, align 32, !tbaa !46, !alias.scope !2515, !noalias !2520
  %83 = shl nuw nsw i64 %25, 5
  %gep48 = getelementptr i8, ptr %invariant.gep47, i64 %83
  store <8 x float> %43, ptr %gep48, align 1, !tbaa !46, !alias.scope !2643, !noalias !2644
  %84 = getelementptr inbounds nuw i8, ptr %gep48, i64 8192
  store <8 x float> %48, ptr %84, align 1, !tbaa !46, !alias.scope !2639, !noalias !2640
  %85 = getelementptr inbounds nuw i8, ptr %gep48, i64 16384
  store <8 x float> %53, ptr %85, align 1, !tbaa !46, !alias.scope !2647, !noalias !2648
  %86 = getelementptr inbounds nuw i8, ptr %gep48, i64 24576
  store <8 x float> %58, ptr %86, align 1, !tbaa !46, !alias.scope !2650, !noalias !2649
  %87 = getelementptr inbounds nuw i8, ptr %gep48, i64 32768
  store <8 x float> %63, ptr %87, align 1, !tbaa !46, !alias.scope !2642, !noalias !2641
  %88 = getelementptr inbounds nuw i8, ptr %gep48, i64 40960
  store <8 x float> %68, ptr %88, align 1, !tbaa !46, !alias.scope !2646, !noalias !2645
  %89 = getelementptr inbounds nuw i8, ptr %gep48, i64 49152
  store <8 x float> %73, ptr %89, align 1, !tbaa !46, !alias.scope !2653, !noalias !2654
  %90 = getelementptr inbounds nuw i8, ptr %gep48, i64 57344
  store <8 x float> %78, ptr %90, align 1, !tbaa !46, !alias.scope !2651, !noalias !2652
  br i1 %24, label %23, label %91

91:                                               ; preds = %iree_uk_mmt4d_tile_f32f32f32_8x8x1_x86_64_avx2_fma.exit
  ret i32 0
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, target_mem: none)
define internal noundef i32 @_encoding_0_encode_2048x2048xf32_to_2048x2048xf32(ptr noalias nofree nonnull readonly align 16 captures(none) %0, ptr noalias nofree noundef nonnull readonly align 16 captures(none) %1, ptr noalias nofree noundef nonnull readonly align 16 captures(none) %2) #0 {
  %.elt19 = getelementptr inbounds nuw i8, ptr %1, i64 32
  %.unpack20 = load ptr, ptr %.elt19, align 16
  %4 = load ptr, ptr %.unpack20, align 8
  %5 = getelementptr i8, ptr %.unpack20, i64 8
  %6 = load ptr, ptr %5, align 8
  %7 = load i32, ptr %2, align 16
  %8 = zext i32 %7 to i64
  %9 = shl nuw nsw i64 %8, 6
  %10 = and i64 %9, 1984
  %11 = shl nuw nsw i64 %8, 15
  %12 = and i64 %11, 140737487306752
  %13 = or disjoint i64 %12, %10
  %14 = shl nuw nsw i64 %13, 2
  %15 = getelementptr inbounds nuw i8, ptr %4, i64 %14
  %16 = shl nuw nsw i64 %10, 5
  %17 = shl nuw nsw i64 %12, 2
  %18 = getelementptr inbounds nuw i8, ptr %6, i64 %16
  %19 = getelementptr inbounds nuw i8, ptr %18, i64 %17
  br label %iree_uk_pad_and_pack_row_using_tile_func.exit23

iree_uk_pad_and_pack_row_using_tile_func.exit23:  ; preds = %3, %iree_uk_pack_tile_8x1_x32_x86_64_avx2_fma_direct.exit
  %20 = phi i64 [ 0, %3 ], [ %75, %iree_uk_pack_tile_8x1_x32_x86_64_avx2_fma_direct.exit ]
  %21 = phi ptr [ %19, %3 ], [ %73, %iree_uk_pack_tile_8x1_x32_x86_64_avx2_fma_direct.exit ]
  %22 = phi ptr [ %15, %3 ], [ %74, %iree_uk_pack_tile_8x1_x32_x86_64_avx2_fma_direct.exit ]
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2494)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2496)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2474)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2475)
  br label %23

23:                                               ; preds = %23, %iree_uk_pad_and_pack_row_using_tile_func.exit23
  %24 = phi ptr [ %22, %iree_uk_pad_and_pack_row_using_tile_func.exit23 ], [ %70, %23 ]
  %25 = phi ptr [ %21, %iree_uk_pad_and_pack_row_using_tile_func.exit23 ], [ %69, %23 ]
  %26 = phi i64 [ 64, %iree_uk_pad_and_pack_row_using_tile_func.exit23 ], [ %71, %23 ]
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2479)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2480)
  %27 = getelementptr inbounds nuw i8, ptr %24, i64 32768
  %28 = load <2 x i64>, ptr %24, align 1, !tbaa !46, !alias.scope !2498, !noalias !2497
  %29 = load <2 x i64>, ptr %27, align 1, !tbaa !46, !alias.scope !2498, !noalias !2497
  %30 = shufflevector <2 x i64> %28, <2 x i64> %29, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %31 = getelementptr inbounds nuw i8, ptr %24, i64 8192
  %32 = getelementptr inbounds nuw i8, ptr %24, i64 40960
  %33 = load <2 x i64>, ptr %31, align 1, !tbaa !46, !alias.scope !2498, !noalias !2497
  %34 = load <2 x i64>, ptr %32, align 1, !tbaa !46, !alias.scope !2498, !noalias !2497
  %35 = shufflevector <2 x i64> %33, <2 x i64> %34, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %36 = getelementptr inbounds nuw i8, ptr %24, i64 16384
  %37 = getelementptr inbounds nuw i8, ptr %24, i64 49152
  %38 = load <2 x i64>, ptr %36, align 1, !tbaa !46, !alias.scope !2498, !noalias !2497
  %39 = load <2 x i64>, ptr %37, align 1, !tbaa !46, !alias.scope !2498, !noalias !2497
  %40 = shufflevector <2 x i64> %38, <2 x i64> %39, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %41 = getelementptr inbounds nuw i8, ptr %24, i64 24576
  %42 = getelementptr inbounds nuw i8, ptr %24, i64 57344
  %43 = load <2 x i64>, ptr %41, align 1, !tbaa !46, !alias.scope !2498, !noalias !2497
  %44 = load <2 x i64>, ptr %42, align 1, !tbaa !46, !alias.scope !2498, !noalias !2497
  %45 = shufflevector <2 x i64> %43, <2 x i64> %44, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %46 = shufflevector <4 x i64> %30, <4 x i64> %40, <4 x i32> <i32 0, i32 4, i32 2, i32 6>
  %47 = shufflevector <4 x i64> %30, <4 x i64> %40, <4 x i32> <i32 1, i32 5, i32 3, i32 7>
  %48 = shufflevector <4 x i64> %35, <4 x i64> %45, <4 x i32> <i32 0, i32 4, i32 2, i32 6>
  %49 = shufflevector <4 x i64> %35, <4 x i64> %45, <4 x i32> <i32 1, i32 5, i32 3, i32 7>
  %50 = bitcast <4 x i64> %46 to <8 x i32>
  %51 = bitcast <4 x i64> %48 to <8 x i32>
  %52 = shufflevector <8 x i32> %50, <8 x i32> %51, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 4, i32 12, i32 5, i32 13>
  %53 = bitcast <8 x i32> %52 to <4 x i64>
  %54 = bitcast <4 x i64> %47 to <8 x i32>
  %55 = bitcast <4 x i64> %49 to <8 x i32>
  %56 = shufflevector <8 x i32> %54, <8 x i32> %55, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 4, i32 12, i32 5, i32 13>
  %57 = bitcast <8 x i32> %56 to <4 x i64>
  %58 = shufflevector <8 x i32> %50, <8 x i32> %51, <8 x i32> <i32 2, i32 10, i32 3, i32 11, i32 6, i32 14, i32 7, i32 15>
  %59 = bitcast <8 x i32> %58 to <4 x i64>
  %60 = shufflevector <8 x i32> %54, <8 x i32> %55, <8 x i32> <i32 2, i32 10, i32 3, i32 11, i32 6, i32 14, i32 7, i32 15>
  %61 = bitcast <8 x i32> %60 to <4 x i64>
  %62 = shufflevector <4 x i64> %53, <4 x i64> %59, <4 x i32> <i32 0, i32 4, i32 2, i32 6>
  %63 = shufflevector <4 x i64> %53, <4 x i64> %59, <4 x i32> <i32 1, i32 5, i32 3, i32 7>
  %64 = shufflevector <4 x i64> %57, <4 x i64> %61, <4 x i32> <i32 0, i32 4, i32 2, i32 6>
  %65 = shufflevector <4 x i64> %57, <4 x i64> %61, <4 x i32> <i32 1, i32 5, i32 3, i32 7>
  store <4 x i64> %62, ptr %25, align 1, !tbaa !46, !alias.scope !2497, !noalias !2498
  %66 = getelementptr inbounds nuw i8, ptr %25, i64 32
  store <4 x i64> %63, ptr %66, align 1, !tbaa !46, !alias.scope !2497, !noalias !2498
  %67 = getelementptr inbounds nuw i8, ptr %25, i64 64
  store <4 x i64> %64, ptr %67, align 1, !tbaa !46, !alias.scope !2497, !noalias !2498
  %68 = getelementptr inbounds nuw i8, ptr %25, i64 96
  store <4 x i64> %65, ptr %68, align 1, !tbaa !46, !alias.scope !2497, !noalias !2498
  %69 = getelementptr inbounds nuw i8, ptr %25, i64 128
  %70 = getelementptr inbounds nuw i8, ptr %24, i64 16
  %71 = add nsw i64 %26, -4
  %72 = icmp samesign ugt i64 %26, 7
  br i1 %72, label %23, label %iree_uk_pack_tile_8x1_x32_x86_64_avx2_fma_direct.exit, !llvm.loop !376

iree_uk_pack_tile_8x1_x32_x86_64_avx2_fma_direct.exit: ; preds = %23
  %73 = getelementptr inbounds nuw i8, ptr %21, i64 65536
  %74 = getelementptr inbounds nuw i8, ptr %22, i64 65536
  %75 = add nuw nsw i64 %20, 8
  %76 = icmp samesign ugt i64 %20, 503
  br i1 %76, label %iree_uk_pack_p.exit, label %iree_uk_pad_and_pack_row_using_tile_func.exit23, !llvm.loop !1352

iree_uk_pack_p.exit:                              ; preds = %iree_uk_pack_tile_8x1_x32_x86_64_avx2_fma_direct.exit
  ret i32 0
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, target_mem: none)
define internal noundef i32 @_encoding_1_encode_2048x2048xf32_to_2048x2048xf32(ptr noalias nofree nonnull readonly align 16 captures(none) %0, ptr noalias nofree noundef nonnull readonly align 16 captures(none) %1, ptr noalias nofree noundef nonnull readonly align 16 captures(none) %2) #0 {
  %.elt19 = getelementptr inbounds nuw i8, ptr %1, i64 32
  %.unpack20 = load ptr, ptr %.elt19, align 16
  %4 = load ptr, ptr %.unpack20, align 8
  %5 = getelementptr i8, ptr %.unpack20, i64 8
  %6 = load ptr, ptr %5, align 8
  %7 = load i32, ptr %2, align 16
  %8 = zext i32 %7 to i64
  %9 = lshr i64 %8, 5
  %10 = shl nuw nsw i64 %8, 6
  %11 = and i64 %10, 1984
  %12 = shl nuw nsw i64 %9, 11
  %13 = shl nuw nsw i64 %11, 13
  %14 = shl nuw nsw i64 %9, 22
  %15 = shl nuw nsw i64 %11, 5
  %16 = getelementptr inbounds nuw i8, ptr %4, i64 %13
  %17 = getelementptr inbounds nuw i8, ptr %16, i64 %12
  %18 = getelementptr inbounds nuw i8, ptr %6, i64 %14
  %19 = getelementptr inbounds nuw i8, ptr %18, i64 %15
  %20 = getelementptr inbounds nuw i8, ptr %19, i64 16777216
  br label %iree_uk_pad_and_pack_row_using_tile_func.exit23

iree_uk_pad_and_pack_row_using_tile_func.exit23:  ; preds = %3, %iree_uk_pack_tile_8x1_x32_x86_64_avx2_fma_transpose.exit
  %21 = phi i64 [ 0, %3 ], [ %55, %iree_uk_pack_tile_8x1_x32_x86_64_avx2_fma_transpose.exit ]
  %22 = phi ptr [ %20, %3 ], [ %53, %iree_uk_pack_tile_8x1_x32_x86_64_avx2_fma_transpose.exit ]
  %23 = phi ptr [ %17, %3 ], [ %54, %iree_uk_pack_tile_8x1_x32_x86_64_avx2_fma_transpose.exit ]
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2437)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2439)
  br label %.preheader.i

.preheader.i:                                     ; preds = %.preheader.i, %iree_uk_pad_and_pack_row_using_tile_func.exit23
  %24 = phi ptr [ %49, %.preheader.i ], [ %22, %iree_uk_pad_and_pack_row_using_tile_func.exit23 ]
  %25 = phi ptr [ %50, %.preheader.i ], [ %23, %iree_uk_pad_and_pack_row_using_tile_func.exit23 ]
  %26 = phi i64 [ %51, %.preheader.i ], [ 64, %iree_uk_pad_and_pack_row_using_tile_func.exit23 ]
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2402)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2403)
  %27 = load <32 x i8>, ptr %25, align 1, !tbaa !46, !alias.scope !2444, !noalias !2445
  store <32 x i8> %27, ptr %24, align 1, !tbaa !46, !alias.scope !2445, !noalias !2444
  %28 = getelementptr inbounds nuw i8, ptr %24, i64 65536
  %29 = getelementptr inbounds nuw i8, ptr %25, i64 32
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2404)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2405)
  %30 = load <32 x i8>, ptr %29, align 1, !tbaa !46, !alias.scope !2442, !noalias !2443
  store <32 x i8> %30, ptr %28, align 1, !tbaa !46, !alias.scope !2443, !noalias !2442
  %31 = getelementptr inbounds nuw i8, ptr %24, i64 131072
  %32 = getelementptr inbounds nuw i8, ptr %25, i64 64
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2406)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2407)
  %33 = load <32 x i8>, ptr %32, align 1, !tbaa !46, !alias.scope !2446, !noalias !2447
  store <32 x i8> %33, ptr %31, align 1, !tbaa !46, !alias.scope !2447, !noalias !2446
  %34 = getelementptr inbounds nuw i8, ptr %24, i64 196608
  %35 = getelementptr inbounds nuw i8, ptr %25, i64 96
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2408)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2409)
  %36 = load <32 x i8>, ptr %35, align 1, !tbaa !46, !alias.scope !2440, !noalias !2441
  store <32 x i8> %36, ptr %34, align 1, !tbaa !46, !alias.scope !2441, !noalias !2440
  %37 = getelementptr inbounds nuw i8, ptr %24, i64 262144
  %38 = getelementptr inbounds nuw i8, ptr %25, i64 128
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2410)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2411)
  %39 = load <32 x i8>, ptr %38, align 1, !tbaa !46, !alias.scope !2453, !noalias !2452
  store <32 x i8> %39, ptr %37, align 1, !tbaa !46, !alias.scope !2452, !noalias !2453
  %40 = getelementptr inbounds nuw i8, ptr %24, i64 327680
  %41 = getelementptr inbounds nuw i8, ptr %25, i64 160
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2412)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2413)
  %42 = load <32 x i8>, ptr %41, align 1, !tbaa !46, !alias.scope !2448, !noalias !2449
  store <32 x i8> %42, ptr %40, align 1, !tbaa !46, !alias.scope !2449, !noalias !2448
  %43 = getelementptr inbounds nuw i8, ptr %24, i64 393216
  %44 = getelementptr inbounds nuw i8, ptr %25, i64 192
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2414)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2415)
  %45 = load <32 x i8>, ptr %44, align 1, !tbaa !46, !alias.scope !2455, !noalias !2454
  store <32 x i8> %45, ptr %43, align 1, !tbaa !46, !alias.scope !2454, !noalias !2455
  %46 = getelementptr inbounds nuw i8, ptr %24, i64 458752
  %47 = getelementptr inbounds nuw i8, ptr %25, i64 224
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2416)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2417)
  %48 = load <32 x i8>, ptr %47, align 1, !tbaa !46, !alias.scope !2450, !noalias !2451
  store <32 x i8> %48, ptr %46, align 1, !tbaa !46, !alias.scope !2451, !noalias !2450
  %49 = getelementptr inbounds nuw i8, ptr %24, i64 524288
  %50 = getelementptr inbounds nuw i8, ptr %25, i64 256
  %51 = add nsw i64 %26, -8
  %52 = icmp samesign ugt i64 %26, 8
  br i1 %52, label %.preheader.i, label %iree_uk_pack_tile_8x1_x32_x86_64_avx2_fma_transpose.exit, !llvm.loop !426

iree_uk_pack_tile_8x1_x32_x86_64_avx2_fma_transpose.exit: ; preds = %.preheader.i
  %53 = getelementptr inbounds nuw i8, ptr %22, i64 32
  %54 = getelementptr inbounds nuw i8, ptr %23, i64 8192
  %55 = add nuw nsw i64 %21, 1
  %exitcond = icmp eq i64 %55, 64
  br i1 %exitcond, label %iree_uk_pack_p.exit, label %iree_uk_pad_and_pack_row_using_tile_func.exit23, !llvm.loop !1352

iree_uk_pack_p.exit:                              ; preds = %iree_uk_pack_tile_8x1_x32_x86_64_avx2_fma_transpose.exit
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local dllexport ptr @iree_hal_executable_library_query(i32 %0, ptr nofree readnone captures(none) %1) local_unnamed_addr #1 {
entry:
  %2 = icmp eq i32 %0, 6
  %3 = select i1 %2, ptr @iree_hal_executable_library_query_v0, ptr null
  ret ptr %3
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal float @iree_h2f_ieee(i16 noundef signext %0) local_unnamed_addr #2 {
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
define internal signext i16 @iree_f2h_ieee(float noundef %0) local_unnamed_addr #2 {
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
define internal float @__gnu_h2f_ieee(i16 noundef signext %0) local_unnamed_addr #2 {
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
define internal float @__extendhfsf2(float noundef %0) local_unnamed_addr #2 {
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
define internal signext i16 @__gnu_f2h_ieee(float noundef %0) local_unnamed_addr #2 {
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
define internal float @__truncsfhf2(float noundef %0) local_unnamed_addr #2 {
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
  store i16 %35, ptr %2, align 4, !tbaa !8
  %.0..0..0..0. = load float, ptr %2, align 4, !tbaa !10
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  ret float %.0..0..0..0.
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #3

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal double @__extendhfdf2(float noundef %0) local_unnamed_addr #2 {
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
define internal float @__truncdfhf2(double noundef %0) local_unnamed_addr #2 {
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
  store i16 %36, ptr %2, align 4, !tbaa !8
  %.0..0..0..0. = load float, ptr %2, align 4, !tbaa !10
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  ret float %.0..0..0..0.
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef double @fma(double noundef %0, double noundef %1, double noundef %2) local_unnamed_addr #2 {
  %4 = tail call double @llvm.fmuladd.f64(double %0, double %1, double %2)
  ret double %4
}

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #4

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef float @__math_invalidf(float noundef %0) local_unnamed_addr #5 {
  %2 = fsub float %0, %0
  %3 = fdiv float %2, %2
  ret float %3
}

; Function Attrs: inlinehint nofree norecurse nosync nounwind memory(inaccessiblemem: readwrite)
define internal float @__math_oflowf(i32 noundef %0) local_unnamed_addr #6 {
  %2 = alloca float, align 4
  %.not.i = icmp eq i32 %0, 0
  %3 = select i1 %.not.i, float f0x70000000, float f0xF0000000
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
  store volatile float %3, ptr %2, align 4, !tbaa !10
  %.0..0..0..0..0..0..0..0..0..0..0..0..i.i = load volatile float, ptr %2, align 4, !tbaa !10
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  %4 = fmul float %.0..0..0..0..0..0..0..0..0..0..0..0..i.i, f0x70000000
  ret float %4
}

; Function Attrs: inlinehint nofree norecurse nosync nounwind memory(inaccessiblemem: readwrite)
define internal float @__math_xflowf(i32 noundef %0, float noundef %1) local_unnamed_addr #6 {
  %3 = alloca float, align 4
  %.not = icmp eq i32 %0, 0
  %4 = fneg float %1
  %5 = select i1 %.not, float %1, float %4
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  store volatile float %5, ptr %3, align 4, !tbaa !10
  %.0..0..0..0..0..0..0..0..0..0..i = load volatile float, ptr %3, align 4, !tbaa !10
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  %6 = fmul float %1, %.0..0..0..0..0..0..0..0..0..0..i
  ret float %6
}

; Function Attrs: inlinehint nofree norecurse nosync nounwind memory(inaccessiblemem: readwrite)
define internal float @__math_uflowf(i32 noundef %0) local_unnamed_addr #6 {
  %2 = alloca float, align 4
  %.not.i = icmp eq i32 %0, 0
  %3 = select i1 %.not.i, float f0x10000000, float f0x90000000
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
  store volatile float %3, ptr %2, align 4, !tbaa !10
  %.0..0..0..0..0..0..0..0..0..0..0..0..i.i = load volatile float, ptr %2, align 4, !tbaa !10
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  %4 = fmul float %.0..0..0..0..0..0..0..0..0..0..0..0..i.i, f0x10000000
  ret float %4
}

; Function Attrs: inlinehint nofree norecurse nosync nounwind memory(inaccessiblemem: readwrite)
define internal float @ceilf(float noundef %0) local_unnamed_addr #6 {
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
  store volatile float %16, ptr %3, align 4, !tbaa !10
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
  store volatile float %24, ptr %2, align 4, !tbaa !10
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
define internal float @expf(float noundef %0) local_unnamed_addr #6 {
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = fpext float %0 to double
  %5 = bitcast float %0 to i32
  %6 = lshr i32 %5, 20
  %7 = and i32 %6, 2047
  %.not = icmp samesign ult i32 %7, 1067
  br i1 %.not, label %21, label %8, !prof !12

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
  store volatile float f0x70000000, ptr %3, align 4, !tbaa !10
  %.0..0..0..0..0..0..0..0..0..0..0..0..0..0..i.i.i = load volatile float, ptr %3, align 4, !tbaa !10
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  %16 = fmul float %.0..0..0..0..0..0..0..0..0..0..0..0..0..0..i.i.i, f0x70000000
  br label %39

17:                                               ; preds = %13
  %18 = fcmp olt float %0, f0xC2CFF1B4
  br i1 %18, label %19, label %21

19:                                               ; preds = %17
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
  store volatile float f0x10000000, ptr %2, align 4, !tbaa !10
  %.0..0..0..0..0..0..0..0..0..0..0..0..0..0..i.i.i3 = load volatile float, ptr %2, align 4, !tbaa !10
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
  %29 = load i64, ptr %28, align 8, !tbaa !16
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
define internal noundef i32 @feclearexcept(i32 noundef %0) local_unnamed_addr #5 {
  ret i32 0
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef i32 @feraiseexcept(i32 noundef %0) local_unnamed_addr #5 {
  ret i32 0
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef i32 @fetestexcept(i32 noundef %0) local_unnamed_addr #5 {
  ret i32 0
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef i32 @fegetround() local_unnamed_addr #5 {
  ret i32 0
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef i32 @__fesetround(i32 noundef %0) local_unnamed_addr #5 {
  ret i32 0
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef i32 @fegetenv(ptr noundef readnone captures(none) %0) local_unnamed_addr #5 {
  ret i32 0
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef i32 @fesetenv(ptr noundef readnone captures(none) %0) local_unnamed_addr #5 {
  ret i32 0
}

; Function Attrs: inlinehint nofree norecurse nosync nounwind memory(inaccessiblemem: readwrite)
define internal float @floorf(float noundef %0) local_unnamed_addr #6 {
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
  store volatile float %16, ptr %3, align 4, !tbaa !10
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
  store volatile float %23, ptr %2, align 4, !tbaa !10
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
define internal float @fmaf(float noundef %0, float noundef %1, float noundef %2) local_unnamed_addr #5 {
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
define internal float @fmodf(float noundef %0, float noundef %1) local_unnamed_addr #7 {
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
declare float @llvm.fabs.f32(float) #4

; Function Attrs: inlinehint nofree nosync nounwind memory(argmem: readwrite)
define internal float @frexpf(float noundef %0, ptr nofree noundef captures(none) %1) local_unnamed_addr #8 {
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
  %9 = tail call float @frexpf(float noundef %8, ptr noundef %1) #12
  %10 = load i32, ptr %1, align 4, !tbaa !20
  %11 = add nsw i32 %10, -64
  br label %12

12:                                               ; preds = %7, %5
  %storemerge = phi i32 [ %11, %7 ], [ 0, %5 ]
  %.014 = phi float [ %9, %7 ], [ %0, %5 ]
  store i32 %storemerge, ptr %1, align 4, !tbaa !20
  br label %19

13:                                               ; preds = %2
  %14 = and i32 %4, 255
  %15 = add nsw i32 %14, -126
  store i32 %15, ptr %1, align 4, !tbaa !20
  %16 = and i32 %3, -2139095041
  %17 = or disjoint i32 %16, 1056964608
  %18 = bitcast i32 %17 to float
  br label %19

19:                                               ; preds = %13, %12, %2
  %.0 = phi float [ %18, %13 ], [ %.014, %12 ], [ %0, %2 ]
  ret float %.0
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal float @ldexpf(float noundef %0, i32 noundef %1) local_unnamed_addr #5 {
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
define internal float @scalbnf(float noundef %0, i32 noundef %1) local_unnamed_addr #5 {
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
declare i32 @llvm.umin.i32(i32, i32) #4

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umax.i32(i32, i32) #4

; Function Attrs: inlinehint nofree norecurse nosync nounwind memory(inaccessiblemem: readwrite)
define internal float @powf(float noundef %0, float noundef %1) local_unnamed_addr #6 {
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
  br i1 %or.cond99, label %.critedge, label %76, !prof !21

.critedge:                                        ; preds = %2
  %12 = add i32 %.pre, -1
  %13 = icmp ult i32 %12, -16777217
  br i1 %13, label %30, label %14, !prof !12

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
  br i1 %33, label %49, label %34, !prof !12

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
  store volatile float %48, ptr %5, align 4, !tbaa !10
  %.0..0..0..0..0..0..0..0..0..0..i = load volatile float, ptr %5, align 4, !tbaa !10
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
  %85 = load double, ptr %84, align 8, !tbaa !23
  %86 = getelementptr inbounds nuw i8, ptr %84, i64 8
  %87 = load double, ptr %86, align 8, !tbaa !24
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
  br i1 %104, label %105, label %115, !prof !25

105:                                              ; preds = %76
  %106 = fcmp ogt double %101, f0x405FFFFFFFD1D571
  br i1 %106, label %107, label %110

107:                                              ; preds = %105
  %.not.i.i = icmp eq i32 %.050, 0
  %108 = select i1 %.not.i.i, float f0x70000000, float f0xF0000000
  call void @llvm.lifetime.start.p0(ptr nonnull %4)
  store volatile float %108, ptr %4, align 4, !tbaa !10
  %.0..0..0..0..0..0..0..0..0..0..0..0..0..0..i.i.i = load volatile float, ptr %4, align 4, !tbaa !10
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
  store volatile float %113, ptr %3, align 4, !tbaa !10
  %.0..0..0..0..0..0..0..0..0..0..0..0..0..0..i.i.i6 = load volatile float, ptr %3, align 4, !tbaa !10
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
  %122 = load i64, ptr %121, align 8, !tbaa !16
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
define internal noundef float @rintf(float noundef %0) local_unnamed_addr #5 {
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
define internal float @roundf(float noundef %0) local_unnamed_addr #6 {
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
  store volatile float %9, ptr %2, align 4, !tbaa !10
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

; Function Attrs: alwaysinline mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite)
declare void @llvm.prefetch.p0(ptr readonly captures(none), i32 immarg range(i32 0, 2), i32 immarg range(i32 0, 4), i32 immarg range(i32 0, 2)) #9

; Function Attrs: alwaysinline mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.experimental.noalias.scope.decl(metadata) #10

; Function Attrs: alwaysinline mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x float> @llvm.fma.v8f32(<8 x float>, <8 x float>, <8 x float>) #11

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, target_mem: none) "frame-pointer"="all" "hot" "no-builtins" "nonlazybind" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable "nonlazybind" }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #3 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #5 = { inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none) }
attributes #6 = { inlinehint nofree norecurse nosync nounwind memory(inaccessiblemem: readwrite) }
attributes #7 = { inlinehint nofree norecurse nosync nounwind memory(none) }
attributes #8 = { inlinehint nofree nosync nounwind memory(argmem: readwrite) }
attributes #9 = { alwaysinline mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite) }
attributes #10 = { alwaysinline mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #11 = { alwaysinline mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #12 = { inlinehint }

!llvm.module.flags = !{!0, !1, !11, !40}
!llvm.errno.tbaa = !{!6}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 1, !"float-abi", !"hard"}
!2 = !{!"Simple C/C++ TBAA"}
!3 = !{!"omnipotent char", !2, i64 0}
!4 = !{!"int", !3, i64 0}
!5 = !{!"__libc_errno", !4, i64 0}
!6 = !{!5, !4, i64 0}
!7 = !{!"short", !3, i64 0}
!8 = !{!7, !7, i64 0}
!9 = !{!"float", !3, i64 0}
!10 = !{!9, !9, i64 0}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{!"branch_weights", !"expected", i32 2000, i32 1}
!13 = !{!"double", !3, i64 0}
!15 = !{!"long", !3, i64 0}
!16 = !{!15, !15, i64 0}
!20 = !{!4, !4, i64 0}
!21 = !{!"branch_weights", i32 4001, i32 4000000}
!22 = !{!"", !13, i64 0, !13, i64 8}
!23 = !{!22, !13, i64 0}
!24 = !{!22, !13, i64 8}
!25 = !{!"branch_weights", !"expected", i32 1, i32 2000}
!27 = distinct !{!27, !48}
!40 = !{i32 7, !"frame-pointer", i32 2}
!46 = !{!3, !3, i64 0}
!48 = !{!"llvm.loop.mustprogress"}
!376 = distinct !{!376, !48}
!426 = distinct !{!426, !48}
!1352 = distinct !{!1352, !48}
!2402 = !{!2434}
!2403 = !{!2433}
!2404 = !{!2432}
!2405 = !{!2431}
!2406 = !{!2430}
!2407 = !{!2429}
!2408 = !{!2428}
!2409 = !{!2427}
!2410 = !{!2426}
!2411 = !{!2425}
!2412 = !{!2424}
!2413 = !{!2423}
!2414 = !{!2422}
!2415 = !{!2421}
!2416 = !{!2420}
!2417 = !{!2418}
!2418 = distinct !{!2418, !2419, !"iree_uk_memcpy: argument 1:It7"}
!2419 = distinct !{!2419, !"iree_uk_memcpy"}
!2420 = distinct !{!2420, !2419, !"iree_uk_memcpy: argument 0:It7"}
!2421 = distinct !{!2421, !2419, !"iree_uk_memcpy: argument 1:It6"}
!2422 = distinct !{!2422, !2419, !"iree_uk_memcpy: argument 0:It6"}
!2423 = distinct !{!2423, !2419, !"iree_uk_memcpy: argument 1:It5"}
!2424 = distinct !{!2424, !2419, !"iree_uk_memcpy: argument 0:It5"}
!2425 = distinct !{!2425, !2419, !"iree_uk_memcpy: argument 1:It4"}
!2426 = distinct !{!2426, !2419, !"iree_uk_memcpy: argument 0:It4"}
!2427 = distinct !{!2427, !2419, !"iree_uk_memcpy: argument 1:It3"}
!2428 = distinct !{!2428, !2419, !"iree_uk_memcpy: argument 0:It3"}
!2429 = distinct !{!2429, !2419, !"iree_uk_memcpy: argument 1:It2"}
!2430 = distinct !{!2430, !2419, !"iree_uk_memcpy: argument 0:It2"}
!2431 = distinct !{!2431, !2419, !"iree_uk_memcpy: argument 1:It1"}
!2432 = distinct !{!2432, !2419, !"iree_uk_memcpy: argument 0:It1"}
!2433 = distinct !{!2433, !2419, !"iree_uk_memcpy: argument 1"}
!2434 = distinct !{!2434, !2419, !"iree_uk_memcpy: argument 0"}
!2435 = distinct !{!2435, !"iree_uk_pack_tile_8x1_x32_x86_64_avx2_fma_transpose"}
!2436 = distinct !{!2436, !2435, !"iree_uk_pack_tile_8x1_x32_x86_64_avx2_fma_transpose: argument 0"}
!2437 = !{!2436}
!2438 = distinct !{!2438, !2435, !"iree_uk_pack_tile_8x1_x32_x86_64_avx2_fma_transpose: argument 1"}
!2439 = !{!2438}
!2440 = !{!2427, !2438}
!2441 = !{!2428, !2436}
!2442 = !{!2431, !2438}
!2443 = !{!2432, !2436}
!2444 = !{!2433, !2438}
!2445 = !{!2434, !2436}
!2446 = !{!2429, !2438}
!2447 = !{!2430, !2436}
!2448 = !{!2423, !2438}
!2449 = !{!2424, !2436}
!2450 = !{!2418, !2438}
!2451 = !{!2420, !2436}
!2452 = !{!2426, !2436}
!2453 = !{!2425, !2438}
!2454 = !{!2422, !2436}
!2455 = !{!2421, !2438}
!2474 = !{!2484}
!2475 = !{!2488}
!2479 = !{!2483}
!2480 = !{!2487}
!2483 = distinct !{!2483, !2486, !"iree_uk_avx2_copy_8x16xi8_tiled_1x4_transpose_strided_to_strided: argument 0"}
!2484 = distinct !{!2484, !2485, !"iree_uk_pack_tile_8x4_x8_x86_64_avx2_fma_direct: argument 0"}
!2485 = distinct !{!2485, !"iree_uk_pack_tile_8x4_x8_x86_64_avx2_fma_direct"}
!2486 = distinct !{!2486, !"iree_uk_avx2_copy_8x16xi8_tiled_1x4_transpose_strided_to_strided"}
!2487 = distinct !{!2487, !2486, !"iree_uk_avx2_copy_8x16xi8_tiled_1x4_transpose_strided_to_strided: argument 1"}
!2488 = distinct !{!2488, !2485, !"iree_uk_pack_tile_8x4_x8_x86_64_avx2_fma_direct: argument 1"}
!2492 = distinct !{!2492, !"iree_uk_pack_tile_8x1_x32_x86_64_avx2_fma_direct"}
!2493 = distinct !{!2493, !2492, !"iree_uk_pack_tile_8x1_x32_x86_64_avx2_fma_direct: argument 0"}
!2494 = !{!2493}
!2495 = distinct !{!2495, !2492, !"iree_uk_pack_tile_8x1_x32_x86_64_avx2_fma_direct: argument 1"}
!2496 = !{!2495}
!2497 = !{!2483, !2484, !2493}
!2498 = !{!2487, !2488, !2495}
!2513 = distinct !{!2513, !"iree_uk_mmt4d_tile_f32f32f32_8x8x1_x86_64_avx2_fma"}
!2514 = distinct !{!2514, !2513, !"iree_uk_mmt4d_tile_f32f32f32_8x8x1_x86_64_avx2_fma: argument 0"}
!2515 = !{!2514}
!2516 = distinct !{!2516, !2513, !"iree_uk_mmt4d_tile_f32f32f32_8x8x1_x86_64_avx2_fma: argument 1"}
!2517 = !{!2516}
!2518 = distinct !{!2518, !2513, !"iree_uk_mmt4d_tile_f32f32f32_8x8x1_x86_64_avx2_fma: argument 2"}
!2519 = !{!2518}
!2520 = !{!2516, !2518}
!2522 = !{!2514, !2518}
!2525 = !{!2514, !2516}
!2614 = distinct !{!2614, !2617, !"iree_uk_memcpy: argument 0:It7"}
!2615 = distinct !{!2615, !2616, !"iree_uk_copy_8x32xi8_strided_to_strided: argument 0"}
!2616 = distinct !{!2616, !"iree_uk_copy_8x32xi8_strided_to_strided"}
!2617 = distinct !{!2617, !"iree_uk_memcpy"}
!2618 = distinct !{!2618, !2617, !"iree_uk_memcpy: argument 1:It7"}
!2619 = distinct !{!2619, !2616, !"iree_uk_copy_8x32xi8_strided_to_strided: argument 1"}
!2620 = distinct !{!2620, !2617, !"iree_uk_memcpy: argument 0:It6"}
!2621 = distinct !{!2621, !2617, !"iree_uk_memcpy: argument 1:It6"}
!2622 = distinct !{!2622, !2617, !"iree_uk_memcpy: argument 0:It5"}
!2623 = distinct !{!2623, !2617, !"iree_uk_memcpy: argument 1:It5"}
!2624 = distinct !{!2624, !2617, !"iree_uk_memcpy: argument 0:It4"}
!2625 = distinct !{!2625, !2617, !"iree_uk_memcpy: argument 1:It4"}
!2626 = distinct !{!2626, !2617, !"iree_uk_memcpy: argument 0:It3"}
!2627 = distinct !{!2627, !2617, !"iree_uk_memcpy: argument 1:It3"}
!2628 = distinct !{!2628, !2617, !"iree_uk_memcpy: argument 0:It2"}
!2629 = distinct !{!2629, !2617, !"iree_uk_memcpy: argument 1:It2"}
!2630 = distinct !{!2630, !2617, !"iree_uk_memcpy: argument 0:It1"}
!2631 = distinct !{!2631, !2617, !"iree_uk_memcpy: argument 1:It1"}
!2632 = distinct !{!2632, !2617, !"iree_uk_memcpy: argument 0"}
!2633 = distinct !{!2633, !2617, !"iree_uk_memcpy: argument 1"}
!2634 = distinct !{!2634, !"iree_uk_unpack_tile_8x8_x32_x86_64_avx2_fma_direct"}
!2635 = distinct !{!2635, !2634, !"iree_uk_unpack_tile_8x8_x32_x86_64_avx2_fma_direct: argument 0"}
!2637 = distinct !{!2637, !2634, !"iree_uk_unpack_tile_8x8_x32_x86_64_avx2_fma_direct: argument 1"}
!2639 = !{!2630, !2615, !2635}
!2640 = !{!2631, !2619, !2637}
!2641 = !{!2625, !2619, !2637}
!2642 = !{!2624, !2615, !2635}
!2643 = !{!2632, !2615, !2635}
!2644 = !{!2633, !2619, !2637}
!2645 = !{!2623, !2619, !2637}
!2646 = !{!2622, !2615, !2635}
!2647 = !{!2628, !2615, !2635}
!2648 = !{!2629, !2619, !2637}
!2649 = !{!2627, !2619, !2637}
!2650 = !{!2626, !2615, !2635}
!2651 = !{!2614, !2615, !2635}
!2652 = !{!2618, !2619, !2637}
!2653 = !{!2620, !2615, !2635}
!2654 = !{!2621, !2619, !2637}
