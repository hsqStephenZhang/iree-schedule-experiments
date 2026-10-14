; ModuleID = 'gemm_dispatch_0'
source_filename = "gemm_dispatch_0"
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

@0 = internal constant [16 x i8] c"gemm_dispatch_0\00", align 1
@iree_hal_executable_library_query_v0_header = internal constant %iree_hal_executable_library_header_t { i32 6, ptr @0, i32 0, i32 0 }
@iree_hal_executable_library_query_v0_funcs = internal constant [1 x ptr] [ptr @gemm_dispatch_0_matmul_2048x2048x2048_f32]
@iree_hal_executable_library_query_v0_attrs = internal constant [1 x %iree_hal_executable_dispatch_attrs_v0_t] [%iree_hal_executable_dispatch_attrs_v0_t { i64 0, i16 0, i8 0, i8 3, i32 1, i32 1, i16 1, i16 0, i64 0, i64 0, i64 0, i64 0, i64 0 }]
@1 = internal constant [42 x i8] c"gemm_dispatch_0_matmul_2048x2048x2048_f32\00", align 1
@iree_hal_executable_library_query_v0_names = internal constant [1 x ptr] [ptr @1]
@2 = internal constant [103 x i8] c"/workspaces/ml-compiler/iree/.local/gemm-four-versions/results/2048x2048x2048/02_panel_pack/final.mlir\00", align 1
@iree_hal_executable_library_query_v0_source_locations = internal constant [1 x %iree_hal_executable_source_location_v0_t] [%iree_hal_executable_source_location_v0_t { i32 5, i32 102, ptr @2 }]
@iree_hal_executable_library_query_v0_gemm_dispatch_0_matmul_2048x2048x2048_f32_stage_names = internal constant [0 x ptr] zeroinitializer
@iree_hal_executable_library_query_v0_gemm_dispatch_0_matmul_2048x2048x2048_f32_stage_source_locations = internal constant [0 x %iree_hal_executable_source_location_v0_t] zeroinitializer
@iree_hal_executable_library_query_v0_stage_location_tables = internal constant [1 x %iree_hal_executable_stage_location_table_v0_t] [%iree_hal_executable_stage_location_table_v0_t { i32 0, ptr @iree_hal_executable_library_query_v0_gemm_dispatch_0_matmul_2048x2048x2048_f32_stage_names, ptr @iree_hal_executable_library_query_v0_gemm_dispatch_0_matmul_2048x2048x2048_f32_stage_source_locations }]
@iree_hal_executable_library_query_v0 = internal constant %iree_hal_executable_library_v0_t { ptr @iree_hal_executable_library_query_v0_header, %iree_hal_executable_import_table_v0_t zeroinitializer, %iree_hal_executable_export_table_v0_t { i32 1, ptr @iree_hal_executable_library_query_v0_funcs, ptr @iree_hal_executable_library_query_v0_attrs, ptr null, ptr null, ptr @iree_hal_executable_library_query_v0_names, ptr null, ptr null, ptr @iree_hal_executable_library_query_v0_source_locations, ptr @iree_hal_executable_library_query_v0_stage_location_tables }, %iree_hal_executable_constant_table_v0_t zeroinitializer, %iree_hal_executable_source_file_table_v0_t zeroinitializer }
@__exp2f_data = internal local_unnamed_addr constant %struct.exp2f_data { [32 x i64] [i64 4607182418800017408, i64 4607140297302181236, i64 4607100335213349135, i64 4607062579818421073, i64 4607027079437701499, i64 4606993883449571754, i64 4606963042313658936, i64 4606934607594512097, i64 4606908631985796885, i64 4606885169335019979, i64 4606864274668794914, i64 4606846004218661165, i64 4606830415447468583, i64 4606817567076339586, i64 4606807519112221737, i64 4606800332876043653, i64 4606796071031487437, i64 4606794797614391156, i64 4606796578062795143, i64 4606801479247646227, i64 4606809569504174299, i64 4606820918663955941, i64 4606835598087680144, i64 4606853680698631517, i64 4606875241016906669, i64 4606900355194379847, i64 4606929101050434204, i64 4606961558108475497, i64 4606997807633245319, i64 4607037932668951391, i64 4607082018078232794, i64 4607130150581978432], double f0x42E8000000000000, [3 x double] [double f0x3FAC6AF84B912394, double f0x3FCEBFCE50FAC4F3, double f0x3FE62E42FF0C52D6], double f0x4338000000000000, double f0x40471547652B82FE, [3 x double] [double f0x3EBC6AF84B912394, double f0x3F2EBFCE50FAC4F3, double f0x3F962E42FF0C52D6] }, align 8
@__powf_log2_data = internal local_unnamed_addr constant %struct.powf_log2_data { [16 x %struct.anon] [%struct.anon { double f0x3FF661EC79F8F3BE, double f0xBFDEFEC65B963019 }, %struct.anon { double f0x3FF571ED4AAF883D, double f0xBFDB0B6832D4FCA4 }, %struct.anon { double f0x3FF49539F0F010B0, double f0xBFD7418B0A1FB77B }, %struct.anon { double f0x3FF3C995B0B80385, double f0xBFD39DE91A6DCF7B }, %struct.anon { double f0x3FF30D190C8864A5, double f0xBFD01D9BF3F2B631 }, %struct.anon { double f0x3FF25E227B0B8EA0, double f0xBFC97C1D1B3B7AF0 }, %struct.anon { double f0x3FF1BB4A4A1A343F, double f0xBFC2F9E393AF3C9F }, %struct.anon { double f0x3FF12358F08AE5BA, double f0xBFB960CBBF788D5C }, %struct.anon { double f0x3FF0953F419900A7, double f0xBFAA6F9DB6475FCE }, %struct.anon { double 1.000000e+00, double 0.000000e+00 }, %struct.anon { double f0x3FEE608CFD9A47AC, double f0x3FB338CA9F24F53D }, %struct.anon { double f0x3FECA4B31F026AA0, double f0x3FC476A9543891BA }, %struct.anon { double f0x3FEB2036576AFCE6, double f0x3FCE840B4AC4E4D2 }, %struct.anon { double f0x3FE9C2D163A1AA2D, double f0x3FD40645F0C6651C }, %struct.anon { double f0x3FE886E6037841ED, double f0x3FD88E9C2C1B9FF8 }, %struct.anon { double f0x3FE767DCF5534862, double f0x3FDCE0A44EB17BCC }], [5 x double] [double f0x3FD27616C9496E0B, double f0xBFD71969A075C67A, double f0x3FDEC70A6CA7BADD, double f0xBFE7154748BEF6C8, double f0x3FF71547652AB82B] }, align 8

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, target_mem: none)
define internal noundef i32 @gemm_dispatch_0_matmul_2048x2048x2048_f32(ptr noalias nofree nonnull readonly align 16 captures(none) %0, ptr noalias nofree noundef nonnull readonly align 16 captures(none) %1, ptr noalias nofree nonnull readnone align 16 captures(none) %2) #0 {
  %.elt20 = getelementptr inbounds nuw i8, ptr %1, i64 32
  %.unpack21 = load ptr, ptr %.elt20, align 16
  %4 = load ptr, ptr %.unpack21, align 8
  call void @llvm.assume(i1 true) [ "align"(ptr %4, i64 64) ]
  %5 = getelementptr i8, ptr %.unpack21, i64 8
  %6 = load ptr, ptr %5, align 8
  call void @llvm.assume(i1 true) [ "align"(ptr %6, i64 64) ]
  %7 = getelementptr i8, ptr %.unpack21, i64 16
  %8 = load ptr, ptr %7, align 8
  call void @llvm.assume(i1 true) [ "align"(ptr %8, i64 64) ]
  %9 = alloca [16384 x float], align 64
  %10 = alloca [32768 x float], align 64
  %11 = alloca [262144 x float], align 64
  br label %.preheader

.preheader:                                       ; preds = %3, %iree_uk_unpack_p.exit
  %12 = phi i64 [ 0, %3 ], [ %255, %iree_uk_unpack_p.exit ]
  %13 = shl nuw nsw i64 %12, 2
  %invariant.gep181 = getelementptr i8, ptr %6, i64 %13
  br label %14

14:                                               ; preds = %.preheader, %213
  %15 = phi i64 [ 0, %.preheader ], [ %214, %213 ]
  %16 = shl nuw nsw i64 %15, 13
  %gep182 = getelementptr i8, ptr %invariant.gep181, i64 %16
  br label %iree_uk_pad_and_pack_row_using_tile_func.exit29

iree_uk_pad_and_pack_row_using_tile_func.exit29:  ; preds = %14, %iree_uk_pack_tile_8x1_x32_x86_64_avx2_fma_transpose.exit
  %17 = phi ptr [ %gep182, %14 ], [ %50, %iree_uk_pack_tile_8x1_x32_x86_64_avx2_fma_transpose.exit ]
  %18 = phi i64 [ 0, %14 ], [ %51, %iree_uk_pack_tile_8x1_x32_x86_64_avx2_fma_transpose.exit ]
  %19 = phi ptr [ %10, %14 ], [ %49, %iree_uk_pack_tile_8x1_x32_x86_64_avx2_fma_transpose.exit ]
  tail call void @llvm.experimental.noalias.scope.decl(metadata !8)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !11)
  br label %.preheader.i

.preheader.i:                                     ; preds = %.preheader.i, %iree_uk_pad_and_pack_row_using_tile_func.exit29
  %20 = phi ptr [ %45, %.preheader.i ], [ %19, %iree_uk_pad_and_pack_row_using_tile_func.exit29 ]
  %21 = phi ptr [ %46, %.preheader.i ], [ %17, %iree_uk_pad_and_pack_row_using_tile_func.exit29 ]
  %22 = phi i64 [ %47, %.preheader.i ], [ 16, %iree_uk_pad_and_pack_row_using_tile_func.exit29 ]
  tail call void @llvm.experimental.noalias.scope.decl(metadata !13)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !16)
  %23 = load <32 x i8>, ptr %21, align 64, !tbaa !18, !alias.scope !19, !noalias !20
  store <32 x i8> %23, ptr %20, align 1, !tbaa !18, !alias.scope !20, !noalias !19
  %24 = getelementptr inbounds nuw i8, ptr %20, i64 8192
  %25 = getelementptr inbounds nuw i8, ptr %21, i64 32
  tail call void @llvm.experimental.noalias.scope.decl(metadata !21)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !23)
  %26 = load <32 x i8>, ptr %25, align 32, !tbaa !18, !alias.scope !25, !noalias !26
  store <32 x i8> %26, ptr %24, align 1, !tbaa !18, !alias.scope !26, !noalias !25
  %27 = getelementptr inbounds nuw i8, ptr %20, i64 16384
  %28 = getelementptr inbounds nuw i8, ptr %21, i64 64
  tail call void @llvm.experimental.noalias.scope.decl(metadata !27)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !29)
  %29 = load <32 x i8>, ptr %28, align 64, !tbaa !18, !alias.scope !31, !noalias !32
  store <32 x i8> %29, ptr %27, align 1, !tbaa !18, !alias.scope !32, !noalias !31
  %30 = getelementptr inbounds nuw i8, ptr %20, i64 24576
  %31 = getelementptr inbounds nuw i8, ptr %21, i64 96
  tail call void @llvm.experimental.noalias.scope.decl(metadata !33)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !35)
  %32 = load <32 x i8>, ptr %31, align 32, !tbaa !18, !alias.scope !37, !noalias !38
  store <32 x i8> %32, ptr %30, align 1, !tbaa !18, !alias.scope !38, !noalias !37
  %33 = getelementptr inbounds nuw i8, ptr %20, i64 32768
  %34 = getelementptr inbounds nuw i8, ptr %21, i64 128
  tail call void @llvm.experimental.noalias.scope.decl(metadata !39)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !41)
  %35 = load <32 x i8>, ptr %34, align 64, !tbaa !18, !alias.scope !43, !noalias !44
  store <32 x i8> %35, ptr %33, align 1, !tbaa !18, !alias.scope !44, !noalias !43
  %36 = getelementptr inbounds nuw i8, ptr %20, i64 40960
  %37 = getelementptr inbounds nuw i8, ptr %21, i64 160
  tail call void @llvm.experimental.noalias.scope.decl(metadata !45)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !47)
  %38 = load <32 x i8>, ptr %37, align 32, !tbaa !18, !alias.scope !49, !noalias !50
  store <32 x i8> %38, ptr %36, align 1, !tbaa !18, !alias.scope !50, !noalias !49
  %39 = getelementptr inbounds nuw i8, ptr %20, i64 49152
  %40 = getelementptr inbounds nuw i8, ptr %21, i64 192
  tail call void @llvm.experimental.noalias.scope.decl(metadata !51)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !53)
  %41 = load <32 x i8>, ptr %40, align 64, !tbaa !18, !alias.scope !55, !noalias !56
  store <32 x i8> %41, ptr %39, align 1, !tbaa !18, !alias.scope !56, !noalias !55
  %42 = getelementptr inbounds nuw i8, ptr %20, i64 57344
  %43 = getelementptr inbounds nuw i8, ptr %21, i64 224
  tail call void @llvm.experimental.noalias.scope.decl(metadata !57)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !59)
  %44 = load <32 x i8>, ptr %43, align 32, !tbaa !18, !alias.scope !61, !noalias !62
  store <32 x i8> %44, ptr %42, align 1, !tbaa !18, !alias.scope !62, !noalias !61
  %45 = getelementptr inbounds nuw i8, ptr %20, i64 65536
  %46 = getelementptr inbounds nuw i8, ptr %21, i64 256
  %47 = add nsw i64 %22, -8
  %48 = icmp samesign ugt i64 %22, 8
  br i1 %48, label %.preheader.i, label %iree_uk_pack_tile_8x1_x32_x86_64_avx2_fma_transpose.exit, !llvm.loop !63

iree_uk_pack_tile_8x1_x32_x86_64_avx2_fma_transpose.exit: ; preds = %.preheader.i
  %49 = getelementptr inbounds nuw i8, ptr %19, i64 32
  %50 = getelementptr inbounds nuw i8, ptr %17, i64 8192
  %51 = add nuw nsw i64 %18, 1
  %exitcond = icmp eq i64 %51, 256
  br i1 %exitcond, label %iree_uk_pack_p.exit, label %iree_uk_pad_and_pack_row_using_tile_func.exit29, !llvm.loop !65

iree_uk_pack_p.exit:                              ; preds = %iree_uk_pack_tile_8x1_x32_x86_64_avx2_fma_transpose.exit
  %52 = icmp eq i64 %15, 0
  %53 = shl nuw nsw i64 %15, 2
  %invariant.gep = getelementptr inbounds nuw i8, ptr %4, i64 %53
  br label %54

54:                                               ; preds = %iree_uk_pack_p.exit, %iree_uk_mmt4d_p.exit
  %55 = phi i64 [ 0, %iree_uk_pack_p.exit ], [ %211, %iree_uk_mmt4d_p.exit ]
  %56 = shl nuw nsw i64 %55, 13
  %gep = getelementptr inbounds nuw i8, ptr %invariant.gep, i64 %56
  br label %iree_uk_pad_and_pack_row_using_tile_func.exit26

iree_uk_pad_and_pack_row_using_tile_func.exit26:  ; preds = %54, %iree_uk_pack_tile_8x1_x32_x86_64_avx2_fma_direct.exit
  %57 = phi ptr [ %gep, %54 ], [ %111, %iree_uk_pack_tile_8x1_x32_x86_64_avx2_fma_direct.exit ]
  %58 = phi i64 [ 0, %54 ], [ %112, %iree_uk_pack_tile_8x1_x32_x86_64_avx2_fma_direct.exit ]
  %59 = phi ptr [ %9, %54 ], [ %110, %iree_uk_pack_tile_8x1_x32_x86_64_avx2_fma_direct.exit ]
  tail call void @llvm.experimental.noalias.scope.decl(metadata !66)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !69)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !71)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !74)
  br label %60

60:                                               ; preds = %60, %iree_uk_pad_and_pack_row_using_tile_func.exit26
  %61 = phi ptr [ %57, %iree_uk_pad_and_pack_row_using_tile_func.exit26 ], [ %107, %60 ]
  %62 = phi ptr [ %59, %iree_uk_pad_and_pack_row_using_tile_func.exit26 ], [ %106, %60 ]
  %63 = phi i64 [ 256, %iree_uk_pad_and_pack_row_using_tile_func.exit26 ], [ %108, %60 ]
  tail call void @llvm.experimental.noalias.scope.decl(metadata !76)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !79)
  %64 = getelementptr inbounds nuw i8, ptr %61, i64 32768
  %65 = load <2 x i64>, ptr %61, align 16, !tbaa !18, !alias.scope !81, !noalias !82
  %66 = load <2 x i64>, ptr %64, align 16, !tbaa !18, !alias.scope !81, !noalias !82
  %67 = shufflevector <2 x i64> %65, <2 x i64> %66, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %68 = getelementptr inbounds nuw i8, ptr %61, i64 8192
  %69 = getelementptr inbounds nuw i8, ptr %61, i64 40960
  %70 = load <2 x i64>, ptr %68, align 16, !tbaa !18, !alias.scope !81, !noalias !82
  %71 = load <2 x i64>, ptr %69, align 16, !tbaa !18, !alias.scope !81, !noalias !82
  %72 = shufflevector <2 x i64> %70, <2 x i64> %71, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %73 = getelementptr inbounds nuw i8, ptr %61, i64 16384
  %74 = getelementptr inbounds nuw i8, ptr %61, i64 49152
  %75 = load <2 x i64>, ptr %73, align 16, !tbaa !18, !alias.scope !81, !noalias !82
  %76 = load <2 x i64>, ptr %74, align 16, !tbaa !18, !alias.scope !81, !noalias !82
  %77 = shufflevector <2 x i64> %75, <2 x i64> %76, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %78 = getelementptr inbounds nuw i8, ptr %61, i64 24576
  %79 = getelementptr inbounds nuw i8, ptr %61, i64 57344
  %80 = load <2 x i64>, ptr %78, align 16, !tbaa !18, !alias.scope !81, !noalias !82
  %81 = load <2 x i64>, ptr %79, align 16, !tbaa !18, !alias.scope !81, !noalias !82
  %82 = shufflevector <2 x i64> %80, <2 x i64> %81, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %83 = shufflevector <4 x i64> %67, <4 x i64> %77, <4 x i32> <i32 0, i32 4, i32 2, i32 6>
  %84 = shufflevector <4 x i64> %67, <4 x i64> %77, <4 x i32> <i32 1, i32 5, i32 3, i32 7>
  %85 = shufflevector <4 x i64> %72, <4 x i64> %82, <4 x i32> <i32 0, i32 4, i32 2, i32 6>
  %86 = shufflevector <4 x i64> %72, <4 x i64> %82, <4 x i32> <i32 1, i32 5, i32 3, i32 7>
  %87 = bitcast <4 x i64> %83 to <8 x i32>
  %88 = bitcast <4 x i64> %85 to <8 x i32>
  %89 = shufflevector <8 x i32> %87, <8 x i32> %88, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 4, i32 12, i32 5, i32 13>
  %90 = bitcast <8 x i32> %89 to <4 x i64>
  %91 = bitcast <4 x i64> %84 to <8 x i32>
  %92 = bitcast <4 x i64> %86 to <8 x i32>
  %93 = shufflevector <8 x i32> %91, <8 x i32> %92, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 4, i32 12, i32 5, i32 13>
  %94 = bitcast <8 x i32> %93 to <4 x i64>
  %95 = shufflevector <8 x i32> %87, <8 x i32> %88, <8 x i32> <i32 2, i32 10, i32 3, i32 11, i32 6, i32 14, i32 7, i32 15>
  %96 = bitcast <8 x i32> %95 to <4 x i64>
  %97 = shufflevector <8 x i32> %91, <8 x i32> %92, <8 x i32> <i32 2, i32 10, i32 3, i32 11, i32 6, i32 14, i32 7, i32 15>
  %98 = bitcast <8 x i32> %97 to <4 x i64>
  %99 = shufflevector <4 x i64> %90, <4 x i64> %96, <4 x i32> <i32 0, i32 4, i32 2, i32 6>
  %100 = shufflevector <4 x i64> %90, <4 x i64> %96, <4 x i32> <i32 1, i32 5, i32 3, i32 7>
  %101 = shufflevector <4 x i64> %94, <4 x i64> %98, <4 x i32> <i32 0, i32 4, i32 2, i32 6>
  %102 = shufflevector <4 x i64> %94, <4 x i64> %98, <4 x i32> <i32 1, i32 5, i32 3, i32 7>
  store <4 x i64> %99, ptr %62, align 1, !tbaa !18, !alias.scope !82, !noalias !81
  %103 = getelementptr inbounds nuw i8, ptr %62, i64 32
  store <4 x i64> %100, ptr %103, align 1, !tbaa !18, !alias.scope !82, !noalias !81
  %104 = getelementptr inbounds nuw i8, ptr %62, i64 64
  store <4 x i64> %101, ptr %104, align 1, !tbaa !18, !alias.scope !82, !noalias !81
  %105 = getelementptr inbounds nuw i8, ptr %62, i64 96
  store <4 x i64> %102, ptr %105, align 1, !tbaa !18, !alias.scope !82, !noalias !81
  %106 = getelementptr inbounds nuw i8, ptr %62, i64 128
  %107 = getelementptr inbounds nuw i8, ptr %61, i64 16
  %108 = add nsw i64 %63, -4
  %109 = icmp samesign ugt i64 %63, 7
  br i1 %109, label %60, label %iree_uk_pack_tile_8x1_x32_x86_64_avx2_fma_direct.exit, !llvm.loop !83

iree_uk_pack_tile_8x1_x32_x86_64_avx2_fma_direct.exit: ; preds = %60
  %110 = getelementptr inbounds nuw i8, ptr %59, i64 8192
  %111 = getelementptr inbounds nuw i8, ptr %57, i64 65536
  %112 = add nuw nsw i64 %58, 8
  %113 = icmp samesign ugt i64 %58, 55
  br i1 %113, label %iree_uk_mmt4d_select_tile_func_arch.exit.thread173, label %iree_uk_pad_and_pack_row_using_tile_func.exit26, !llvm.loop !65

iree_uk_mmt4d_select_tile_func_arch.exit.thread173: ; preds = %iree_uk_pack_tile_8x1_x32_x86_64_avx2_fma_direct.exit
  %114 = shl nuw nsw i64 %55, 9
  %115 = getelementptr inbounds nuw i8, ptr %11, i64 %114
  br label %116

116:                                              ; preds = %iree_uk_mmt4d_select_tile_func_arch.exit.thread173, %206
  %117 = phi i32 [ %209, %206 ], [ 0, %iree_uk_mmt4d_select_tile_func_arch.exit.thread173 ]
  %118 = phi ptr [ %207, %206 ], [ %115, %iree_uk_mmt4d_select_tile_func_arch.exit.thread173 ]
  %119 = phi ptr [ %208, %206 ], [ %9, %iree_uk_mmt4d_select_tile_func_arch.exit.thread173 ]
  call void @llvm.prefetch.p0(ptr nonnull %118, i32 1, i32 1, i32 1)
  call void @llvm.prefetch.p0(ptr nonnull %119, i32 0, i32 3, i32 1)
  call void @llvm.prefetch.p0(ptr nonnull %10, i32 0, i32 3, i32 1)
  br label %120

120:                                              ; preds = %iree_uk_mmt4d_tile_f32f32f32_8x8x1_x86_64_avx2_fma.exit, %116
  %121 = phi i32 [ 0, %116 ], [ %204, %iree_uk_mmt4d_tile_f32f32f32_8x8x1_x86_64_avx2_fma.exit ]
  %122 = phi ptr [ %10, %116 ], [ %203, %iree_uk_mmt4d_tile_f32f32f32_8x8x1_x86_64_avx2_fma.exit ]
  %123 = phi ptr [ %118, %116 ], [ %202, %iree_uk_mmt4d_tile_f32f32f32_8x8x1_x86_64_avx2_fma.exit ]
  tail call void @llvm.experimental.noalias.scope.decl(metadata !84)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !87)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !89)
  br i1 %52, label %.preheader.i184.preheader, label %124

124:                                              ; preds = %120
  %125 = load <8 x float>, ptr %123, align 1, !tbaa !18, !alias.scope !84, !noalias !91
  %126 = getelementptr inbounds nuw i8, ptr %123, i64 32
  %127 = load <8 x float>, ptr %126, align 1, !tbaa !18, !alias.scope !84, !noalias !91
  %128 = getelementptr inbounds nuw i8, ptr %123, i64 64
  %129 = load <8 x float>, ptr %128, align 1, !tbaa !18, !alias.scope !84, !noalias !91
  %130 = getelementptr inbounds nuw i8, ptr %123, i64 96
  %131 = load <8 x float>, ptr %130, align 1, !tbaa !18, !alias.scope !84, !noalias !91
  %132 = getelementptr inbounds nuw i8, ptr %123, i64 128
  %133 = load <8 x float>, ptr %132, align 1, !tbaa !18, !alias.scope !84, !noalias !91
  %134 = getelementptr inbounds nuw i8, ptr %123, i64 160
  %135 = load <8 x float>, ptr %134, align 1, !tbaa !18, !alias.scope !84, !noalias !91
  %136 = getelementptr inbounds nuw i8, ptr %123, i64 192
  %137 = load <8 x float>, ptr %136, align 1, !tbaa !18, !alias.scope !84, !noalias !91
  %138 = getelementptr inbounds nuw i8, ptr %123, i64 224
  %139 = load <8 x float>, ptr %138, align 1, !tbaa !18, !alias.scope !84, !noalias !91
  br label %.preheader.i184.preheader

.preheader.i184.preheader:                        ; preds = %124, %120
  %.ph = phi <8 x float> [ zeroinitializer, %120 ], [ %139, %124 ]
  %.ph222 = phi <8 x float> [ zeroinitializer, %120 ], [ %137, %124 ]
  %.ph223 = phi <8 x float> [ zeroinitializer, %120 ], [ %135, %124 ]
  %.ph224 = phi <8 x float> [ zeroinitializer, %120 ], [ %133, %124 ]
  %.ph225 = phi <8 x float> [ zeroinitializer, %120 ], [ %131, %124 ]
  %.ph226 = phi <8 x float> [ zeroinitializer, %120 ], [ %129, %124 ]
  %.ph227 = phi <8 x float> [ zeroinitializer, %120 ], [ %127, %124 ]
  %.ph228 = phi <8 x float> [ zeroinitializer, %120 ], [ %125, %124 ]
  br label %.preheader.i184

.preheader.i184:                                  ; preds = %.preheader.i184.preheader, %.preheader.i184
  %140 = phi <8 x float> [ %190, %.preheader.i184 ], [ %.ph, %.preheader.i184.preheader ]
  %141 = phi <8 x float> [ %185, %.preheader.i184 ], [ %.ph222, %.preheader.i184.preheader ]
  %142 = phi <8 x float> [ %180, %.preheader.i184 ], [ %.ph223, %.preheader.i184.preheader ]
  %143 = phi <8 x float> [ %175, %.preheader.i184 ], [ %.ph224, %.preheader.i184.preheader ]
  %144 = phi <8 x float> [ %170, %.preheader.i184 ], [ %.ph225, %.preheader.i184.preheader ]
  %145 = phi <8 x float> [ %165, %.preheader.i184 ], [ %.ph226, %.preheader.i184.preheader ]
  %146 = phi <8 x float> [ %160, %.preheader.i184 ], [ %.ph227, %.preheader.i184.preheader ]
  %147 = phi <8 x float> [ %155, %.preheader.i184 ], [ %.ph228, %.preheader.i184.preheader ]
  %148 = phi i64 [ %193, %.preheader.i184 ], [ 0, %.preheader.i184.preheader ]
  %149 = phi ptr [ %192, %.preheader.i184 ], [ %119, %.preheader.i184.preheader ]
  %150 = phi ptr [ %191, %.preheader.i184 ], [ %122, %.preheader.i184.preheader ]
  %151 = load <8 x float>, ptr %150, align 1, !tbaa !18, !alias.scope !89, !noalias !95
  %152 = load float, ptr %149, align 1, !tbaa !18, !alias.scope !87, !noalias !96
  %153 = insertelement <8 x float> poison, float %152, i64 0
  %154 = shufflevector <8 x float> %153, <8 x float> poison, <8 x i32> zeroinitializer
  %155 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %154, <8 x float> %151, <8 x float> %147)
  %156 = getelementptr inbounds nuw i8, ptr %149, i64 4
  %157 = load float, ptr %156, align 1, !tbaa !18, !alias.scope !87, !noalias !96
  %158 = insertelement <8 x float> poison, float %157, i64 0
  %159 = shufflevector <8 x float> %158, <8 x float> poison, <8 x i32> zeroinitializer
  %160 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %159, <8 x float> %151, <8 x float> %146)
  %161 = getelementptr inbounds nuw i8, ptr %149, i64 8
  %162 = load float, ptr %161, align 1, !tbaa !18, !alias.scope !87, !noalias !96
  %163 = insertelement <8 x float> poison, float %162, i64 0
  %164 = shufflevector <8 x float> %163, <8 x float> poison, <8 x i32> zeroinitializer
  %165 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %164, <8 x float> %151, <8 x float> %145)
  %166 = getelementptr inbounds nuw i8, ptr %149, i64 12
  %167 = load float, ptr %166, align 1, !tbaa !18, !alias.scope !87, !noalias !96
  %168 = insertelement <8 x float> poison, float %167, i64 0
  %169 = shufflevector <8 x float> %168, <8 x float> poison, <8 x i32> zeroinitializer
  %170 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %169, <8 x float> %151, <8 x float> %144)
  %171 = getelementptr inbounds nuw i8, ptr %149, i64 16
  %172 = load float, ptr %171, align 1, !tbaa !18, !alias.scope !87, !noalias !96
  %173 = insertelement <8 x float> poison, float %172, i64 0
  %174 = shufflevector <8 x float> %173, <8 x float> poison, <8 x i32> zeroinitializer
  %175 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %174, <8 x float> %151, <8 x float> %143)
  %176 = getelementptr inbounds nuw i8, ptr %149, i64 20
  %177 = load float, ptr %176, align 1, !tbaa !18, !alias.scope !87, !noalias !96
  %178 = insertelement <8 x float> poison, float %177, i64 0
  %179 = shufflevector <8 x float> %178, <8 x float> poison, <8 x i32> zeroinitializer
  %180 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %179, <8 x float> %151, <8 x float> %142)
  %181 = getelementptr inbounds nuw i8, ptr %149, i64 24
  %182 = load float, ptr %181, align 1, !tbaa !18, !alias.scope !87, !noalias !96
  %183 = insertelement <8 x float> poison, float %182, i64 0
  %184 = shufflevector <8 x float> %183, <8 x float> poison, <8 x i32> zeroinitializer
  %185 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %184, <8 x float> %151, <8 x float> %141)
  %186 = getelementptr inbounds nuw i8, ptr %149, i64 28
  %187 = load float, ptr %186, align 1, !tbaa !18, !alias.scope !87, !noalias !96
  %188 = insertelement <8 x float> poison, float %187, i64 0
  %189 = shufflevector <8 x float> %188, <8 x float> poison, <8 x i32> zeroinitializer
  %190 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %189, <8 x float> %151, <8 x float> %140)
  %191 = getelementptr inbounds nuw i8, ptr %150, i64 32
  %192 = getelementptr inbounds nuw i8, ptr %149, i64 32
  %193 = add nuw nsw i64 %148, 1
  %194 = icmp eq i64 %193, 256
  br i1 %194, label %iree_uk_mmt4d_tile_f32f32f32_8x8x1_x86_64_avx2_fma.exit, label %.preheader.i184, !llvm.loop !97

iree_uk_mmt4d_tile_f32f32f32_8x8x1_x86_64_avx2_fma.exit: ; preds = %.preheader.i184
  store <8 x float> %155, ptr %123, align 1, !tbaa !18, !alias.scope !84, !noalias !98
  %195 = getelementptr inbounds nuw i8, ptr %123, i64 32
  store <8 x float> %160, ptr %195, align 1, !tbaa !18, !alias.scope !84, !noalias !98
  %196 = getelementptr inbounds nuw i8, ptr %123, i64 64
  store <8 x float> %165, ptr %196, align 1, !tbaa !18, !alias.scope !84, !noalias !98
  %197 = getelementptr inbounds nuw i8, ptr %123, i64 96
  store <8 x float> %170, ptr %197, align 1, !tbaa !18, !alias.scope !84, !noalias !98
  %198 = getelementptr inbounds nuw i8, ptr %123, i64 128
  store <8 x float> %175, ptr %198, align 1, !tbaa !18, !alias.scope !84, !noalias !98
  %199 = getelementptr inbounds nuw i8, ptr %123, i64 160
  store <8 x float> %180, ptr %199, align 1, !tbaa !18, !alias.scope !84, !noalias !98
  %200 = getelementptr inbounds nuw i8, ptr %123, i64 192
  store <8 x float> %185, ptr %200, align 1, !tbaa !18, !alias.scope !84, !noalias !98
  %201 = getelementptr inbounds nuw i8, ptr %123, i64 224
  store <8 x float> %190, ptr %201, align 1, !tbaa !18, !alias.scope !84, !noalias !98
  %202 = getelementptr inbounds nuw i8, ptr %123, i64 256
  %203 = getelementptr inbounds nuw i8, ptr %122, i64 8192
  %204 = add nuw nsw i32 %121, 1
  %205 = icmp eq i32 %204, 16
  br i1 %205, label %206, label %120, !llvm.loop !99

206:                                              ; preds = %iree_uk_mmt4d_tile_f32f32f32_8x8x1_x86_64_avx2_fma.exit
  %207 = getelementptr inbounds nuw i8, ptr %118, i64 4096
  %208 = getelementptr inbounds nuw i8, ptr %119, i64 8192
  %209 = add nuw nsw i32 %117, 1
  %210 = icmp eq i32 %209, 8
  br i1 %210, label %iree_uk_mmt4d_p.exit, label %116, !llvm.loop !100

iree_uk_mmt4d_p.exit:                             ; preds = %206
  %211 = add nuw nsw i64 %55, 64
  %212 = icmp samesign ult i64 %55, 1984
  br i1 %212, label %54, label %213

213:                                              ; preds = %iree_uk_mmt4d_p.exit
  %214 = add nuw nsw i64 %15, 256
  %215 = icmp samesign ult i64 %15, 1792
  br i1 %215, label %14, label %216

216:                                              ; preds = %213
  %217 = getelementptr inbounds nuw i8, ptr %8, i64 %13
  br label %iree_uk_unpack_row_using_tile_func.exit32

iree_uk_unpack_row_using_tile_func.exit32:        ; preds = %216, %iree_uk_unpack_tile_8x8_x32_x86_64_avx2_fma_direct.exit
  %218 = phi ptr [ %11, %216 ], [ %252, %iree_uk_unpack_tile_8x8_x32_x86_64_avx2_fma_direct.exit ]
  %219 = phi i64 [ 0, %216 ], [ %253, %iree_uk_unpack_tile_8x8_x32_x86_64_avx2_fma_direct.exit ]
  %220 = phi ptr [ %217, %216 ], [ %251, %iree_uk_unpack_tile_8x8_x32_x86_64_avx2_fma_direct.exit ]
  tail call void @llvm.experimental.noalias.scope.decl(metadata !101)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !104)
  br label %221

221:                                              ; preds = %221, %iree_uk_unpack_row_using_tile_func.exit32
  %222 = phi ptr [ %218, %iree_uk_unpack_row_using_tile_func.exit32 ], [ %248, %221 ]
  %223 = phi ptr [ %220, %iree_uk_unpack_row_using_tile_func.exit32 ], [ %247, %221 ]
  %224 = phi i64 [ 16, %iree_uk_unpack_row_using_tile_func.exit32 ], [ %249, %221 ]
  tail call void @llvm.experimental.noalias.scope.decl(metadata !106)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !109)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !111)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !114)
  %225 = load <32 x i8>, ptr %222, align 1, !tbaa !18, !alias.scope !116, !noalias !117
  store <32 x i8> %225, ptr %223, align 32, !tbaa !18, !alias.scope !117, !noalias !116
  %226 = getelementptr inbounds nuw i8, ptr %223, i64 8192
  %227 = getelementptr inbounds nuw i8, ptr %222, i64 32
  tail call void @llvm.experimental.noalias.scope.decl(metadata !118)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !120)
  %228 = load <32 x i8>, ptr %227, align 1, !tbaa !18, !alias.scope !122, !noalias !123
  store <32 x i8> %228, ptr %226, align 32, !tbaa !18, !alias.scope !123, !noalias !122
  %229 = getelementptr inbounds nuw i8, ptr %223, i64 16384
  %230 = getelementptr inbounds nuw i8, ptr %222, i64 64
  tail call void @llvm.experimental.noalias.scope.decl(metadata !124)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !126)
  %231 = load <32 x i8>, ptr %230, align 1, !tbaa !18, !alias.scope !128, !noalias !129
  store <32 x i8> %231, ptr %229, align 32, !tbaa !18, !alias.scope !129, !noalias !128
  %232 = getelementptr inbounds nuw i8, ptr %223, i64 24576
  %233 = getelementptr inbounds nuw i8, ptr %222, i64 96
  tail call void @llvm.experimental.noalias.scope.decl(metadata !130)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !132)
  %234 = load <32 x i8>, ptr %233, align 1, !tbaa !18, !alias.scope !134, !noalias !135
  store <32 x i8> %234, ptr %232, align 32, !tbaa !18, !alias.scope !135, !noalias !134
  %235 = getelementptr inbounds nuw i8, ptr %223, i64 32768
  %236 = getelementptr inbounds nuw i8, ptr %222, i64 128
  tail call void @llvm.experimental.noalias.scope.decl(metadata !136)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !138)
  %237 = load <32 x i8>, ptr %236, align 1, !tbaa !18, !alias.scope !140, !noalias !141
  store <32 x i8> %237, ptr %235, align 32, !tbaa !18, !alias.scope !141, !noalias !140
  %238 = getelementptr inbounds nuw i8, ptr %223, i64 40960
  %239 = getelementptr inbounds nuw i8, ptr %222, i64 160
  tail call void @llvm.experimental.noalias.scope.decl(metadata !142)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !144)
  %240 = load <32 x i8>, ptr %239, align 1, !tbaa !18, !alias.scope !146, !noalias !147
  store <32 x i8> %240, ptr %238, align 32, !tbaa !18, !alias.scope !147, !noalias !146
  %241 = getelementptr inbounds nuw i8, ptr %223, i64 49152
  %242 = getelementptr inbounds nuw i8, ptr %222, i64 192
  tail call void @llvm.experimental.noalias.scope.decl(metadata !148)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !150)
  %243 = load <32 x i8>, ptr %242, align 1, !tbaa !18, !alias.scope !152, !noalias !153
  store <32 x i8> %243, ptr %241, align 32, !tbaa !18, !alias.scope !153, !noalias !152
  %244 = getelementptr inbounds nuw i8, ptr %223, i64 57344
  %245 = getelementptr inbounds nuw i8, ptr %222, i64 224
  tail call void @llvm.experimental.noalias.scope.decl(metadata !154)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !156)
  %246 = load <32 x i8>, ptr %245, align 1, !tbaa !18, !alias.scope !158, !noalias !159
  store <32 x i8> %246, ptr %244, align 32, !tbaa !18, !alias.scope !159, !noalias !158
  %247 = getelementptr inbounds nuw i8, ptr %223, i64 32
  %248 = getelementptr inbounds nuw i8, ptr %222, i64 256
  %249 = add nsw i64 %224, -1
  %250 = icmp samesign ugt i64 %224, 1
  br i1 %250, label %221, label %iree_uk_unpack_tile_8x8_x32_x86_64_avx2_fma_direct.exit, !llvm.loop !160

iree_uk_unpack_tile_8x8_x32_x86_64_avx2_fma_direct.exit: ; preds = %221
  %251 = getelementptr inbounds nuw i8, ptr %220, i64 65536
  %252 = getelementptr inbounds nuw i8, ptr %218, i64 4096
  %253 = add nuw nsw i64 %219, 8
  %254 = icmp samesign ugt i64 %219, 2039
  br i1 %254, label %iree_uk_unpack_p.exit, label %iree_uk_unpack_row_using_tile_func.exit32, !llvm.loop !161

iree_uk_unpack_p.exit:                            ; preds = %iree_uk_unpack_tile_8x8_x32_x86_64_avx2_fma_direct.exit
  %255 = add nuw nsw i64 %12, 128
  %256 = icmp samesign ult i64 %12, 1920
  br i1 %256, label %.preheader, label %257

257:                                              ; preds = %iree_uk_unpack_p.exit
  ret i32 0
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local dllexport ptr @iree_hal_executable_library_query(i32 %0, ptr nofree readnone captures(none) %1) local_unnamed_addr #2 {
entry:
  %2 = icmp eq i32 %0, 6
  %3 = select i1 %2, ptr @iree_hal_executable_library_query_v0, ptr null
  ret ptr %3
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal float @iree_h2f_ieee(i16 noundef signext %0) local_unnamed_addr #3 {
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
define internal signext i16 @iree_f2h_ieee(float noundef %0) local_unnamed_addr #3 {
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
define internal float @__gnu_h2f_ieee(i16 noundef signext %0) local_unnamed_addr #3 {
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
define internal float @__extendhfsf2(float noundef %0) local_unnamed_addr #3 {
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
define internal signext i16 @__gnu_f2h_ieee(float noundef %0) local_unnamed_addr #3 {
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
define internal float @__truncsfhf2(float noundef %0) local_unnamed_addr #3 {
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
  store i16 %35, ptr %2, align 4, !tbaa !162
  %.0..0..0..0. = load float, ptr %2, align 4, !tbaa !164
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  ret float %.0..0..0..0.
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #4

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal double @__extendhfdf2(float noundef %0) local_unnamed_addr #3 {
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
define internal float @__truncdfhf2(double noundef %0) local_unnamed_addr #3 {
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
  store i16 %36, ptr %2, align 4, !tbaa !162
  %.0..0..0..0. = load float, ptr %2, align 4, !tbaa !164
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  ret float %.0..0..0..0.
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef double @fma(double noundef %0, double noundef %1, double noundef %2) local_unnamed_addr #3 {
  %4 = tail call double @llvm.fmuladd.f64(double %0, double %1, double %2)
  ret double %4
}

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #5

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef float @__math_invalidf(float noundef %0) local_unnamed_addr #6 {
  %2 = fsub float %0, %0
  %3 = fdiv float %2, %2
  ret float %3
}

; Function Attrs: inlinehint nofree norecurse nosync nounwind memory(inaccessiblemem: readwrite)
define internal float @__math_oflowf(i32 noundef %0) local_unnamed_addr #7 {
  %2 = alloca float, align 4
  %.not.i = icmp eq i32 %0, 0
  %3 = select i1 %.not.i, float f0x70000000, float f0xF0000000
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
  store volatile float %3, ptr %2, align 4, !tbaa !164
  %.0..0..0..0..0..0..0..0..0..0..0..0..i.i = load volatile float, ptr %2, align 4, !tbaa !164
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  %4 = fmul float %.0..0..0..0..0..0..0..0..0..0..0..0..i.i, f0x70000000
  ret float %4
}

; Function Attrs: inlinehint nofree norecurse nosync nounwind memory(inaccessiblemem: readwrite)
define internal float @__math_xflowf(i32 noundef %0, float noundef %1) local_unnamed_addr #7 {
  %3 = alloca float, align 4
  %.not = icmp eq i32 %0, 0
  %4 = fneg float %1
  %5 = select i1 %.not, float %1, float %4
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  store volatile float %5, ptr %3, align 4, !tbaa !164
  %.0..0..0..0..0..0..0..0..0..0..i = load volatile float, ptr %3, align 4, !tbaa !164
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  %6 = fmul float %1, %.0..0..0..0..0..0..0..0..0..0..i
  ret float %6
}

; Function Attrs: inlinehint nofree norecurse nosync nounwind memory(inaccessiblemem: readwrite)
define internal float @__math_uflowf(i32 noundef %0) local_unnamed_addr #7 {
  %2 = alloca float, align 4
  %.not.i = icmp eq i32 %0, 0
  %3 = select i1 %.not.i, float f0x10000000, float f0x90000000
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
  store volatile float %3, ptr %2, align 4, !tbaa !164
  %.0..0..0..0..0..0..0..0..0..0..0..0..i.i = load volatile float, ptr %2, align 4, !tbaa !164
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  %4 = fmul float %.0..0..0..0..0..0..0..0..0..0..0..0..i.i, f0x10000000
  ret float %4
}

; Function Attrs: inlinehint nofree norecurse nosync nounwind memory(inaccessiblemem: readwrite)
define internal float @ceilf(float noundef %0) local_unnamed_addr #7 {
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
  store volatile float %16, ptr %3, align 4, !tbaa !164
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
  store volatile float %24, ptr %2, align 4, !tbaa !164
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
define internal float @expf(float noundef %0) local_unnamed_addr #7 {
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = fpext float %0 to double
  %5 = bitcast float %0 to i32
  %6 = lshr i32 %5, 20
  %7 = and i32 %6, 2047
  %.not = icmp samesign ult i32 %7, 1067
  br i1 %.not, label %21, label %8, !prof !166

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
  store volatile float f0x70000000, ptr %3, align 4, !tbaa !164
  %.0..0..0..0..0..0..0..0..0..0..0..0..0..0..i.i.i = load volatile float, ptr %3, align 4, !tbaa !164
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  %16 = fmul float %.0..0..0..0..0..0..0..0..0..0..0..0..0..0..i.i.i, f0x70000000
  br label %39

17:                                               ; preds = %13
  %18 = fcmp olt float %0, f0xC2CFF1B4
  br i1 %18, label %19, label %21

19:                                               ; preds = %17
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
  store volatile float f0x10000000, ptr %2, align 4, !tbaa !164
  %.0..0..0..0..0..0..0..0..0..0..0..0..0..0..i.i.i3 = load volatile float, ptr %2, align 4, !tbaa !164
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
  %29 = load i64, ptr %28, align 8, !tbaa !167
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
define internal noundef i32 @feclearexcept(i32 noundef %0) local_unnamed_addr #6 {
  ret i32 0
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef i32 @feraiseexcept(i32 noundef %0) local_unnamed_addr #6 {
  ret i32 0
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef i32 @fetestexcept(i32 noundef %0) local_unnamed_addr #6 {
  ret i32 0
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef i32 @fegetround() local_unnamed_addr #6 {
  ret i32 0
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef i32 @__fesetround(i32 noundef %0) local_unnamed_addr #6 {
  ret i32 0
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef i32 @fegetenv(ptr noundef readnone captures(none) %0) local_unnamed_addr #6 {
  ret i32 0
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef i32 @fesetenv(ptr noundef readnone captures(none) %0) local_unnamed_addr #6 {
  ret i32 0
}

; Function Attrs: inlinehint nofree norecurse nosync nounwind memory(inaccessiblemem: readwrite)
define internal float @floorf(float noundef %0) local_unnamed_addr #7 {
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = bitcast float %0 to i32
  %5 = lshr i32 %4, 23
  %6 = and i32 %5, 255
  %7 = add nsw i32 %6, -127
  %8 = icmp samesign ugt i32 %6, 149
  br i1 %8, label %27, label %9

9:                                                ; preds = %1
  %10 = icmp samesign ugt i32 %6, 126
  br i1 %10, label %11, label %22

11:                                               ; preds = %9
  %12 = lshr i32 8388607, %7
  %13 = and i32 %12, %4
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %27, label %15

15:                                               ; preds = %11
  %16 = fadd float %0, f0x7B800000
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  store volatile float %16, ptr %3, align 4, !tbaa !164
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  %.not1819 = icmp slt i32 %4, 0
  %17 = ashr i32 -8388608, %7
  %18 = select i1 %.not1819, i32 %12, i32 0
  %19 = add nsw i32 %18, %4
  %20 = and i32 %19, %17
  %21 = bitcast i32 %20 to float
  br label %27

22:                                               ; preds = %9
  %23 = fadd float %0, f0x7B800000
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
  store volatile float %23, ptr %2, align 4, !tbaa !164
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  %24 = icmp sgt i32 %4, -1
  br i1 %24, label %27, label %25

25:                                               ; preds = %22
  %.not = fcmp oeq float %0, 0.000000e+00
  br i1 %.not, label %27, label %26

26:                                               ; preds = %25
  br label %27

27:                                               ; preds = %26, %25, %22, %15, %11, %1
  %.0 = phi float [ %0, %1 ], [ %0, %11 ], [ %21, %15 ], [ -1.000000e+00, %26 ], [ %0, %25 ], [ 0.000000e+00, %22 ]
  ret float %.0
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal float @fmaf(float noundef %0, float noundef %1, float noundef %2) local_unnamed_addr #6 {
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
define internal float @fmodf(float noundef %0, float noundef %1) local_unnamed_addr #8 {
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
declare float @llvm.fabs.f32(float) #5

; Function Attrs: inlinehint nofree nosync nounwind memory(argmem: readwrite)
define internal float @frexpf(float noundef %0, ptr nofree noundef captures(none) %1) local_unnamed_addr #9 {
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
  %9 = tail call float @frexpf(float noundef %8, ptr noundef %1) #13
  %10 = load i32, ptr %1, align 4, !tbaa !169
  %11 = add nsw i32 %10, -64
  br label %12

12:                                               ; preds = %7, %5
  %storemerge = phi i32 [ %11, %7 ], [ 0, %5 ]
  %.014 = phi float [ %9, %7 ], [ %0, %5 ]
  store i32 %storemerge, ptr %1, align 4, !tbaa !169
  br label %19

13:                                               ; preds = %2
  %14 = and i32 %4, 255
  %15 = add nsw i32 %14, -126
  store i32 %15, ptr %1, align 4, !tbaa !169
  %16 = and i32 %3, -2139095041
  %17 = or disjoint i32 %16, 1056964608
  %18 = bitcast i32 %17 to float
  br label %19

19:                                               ; preds = %13, %12, %2
  %.0 = phi float [ %18, %13 ], [ %.014, %12 ], [ %0, %2 ]
  ret float %.0
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal float @ldexpf(float noundef %0, i32 noundef %1) local_unnamed_addr #6 {
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
define internal float @scalbnf(float noundef %0, i32 noundef %1) local_unnamed_addr #6 {
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
declare i32 @llvm.umin.i32(i32, i32) #5

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umax.i32(i32, i32) #5

; Function Attrs: inlinehint nofree norecurse nosync nounwind memory(inaccessiblemem: readwrite)
define internal float @powf(float noundef %0, float noundef %1) local_unnamed_addr #7 {
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
  br i1 %or.cond99, label %.critedge, label %76, !prof !170

.critedge:                                        ; preds = %2
  %12 = add i32 %.pre, -1
  %13 = icmp ult i32 %12, -16777217
  br i1 %13, label %30, label %14, !prof !166

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
  br i1 %33, label %49, label %34, !prof !166

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
  store volatile float %48, ptr %5, align 4, !tbaa !164
  %.0..0..0..0..0..0..0..0..0..0..i = load volatile float, ptr %5, align 4, !tbaa !164
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
  %85 = load double, ptr %84, align 8, !tbaa !171
  %86 = getelementptr inbounds nuw i8, ptr %84, i64 8
  %87 = load double, ptr %86, align 8, !tbaa !174
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
  br i1 %104, label %105, label %115, !prof !175

105:                                              ; preds = %76
  %106 = fcmp ogt double %101, f0x405FFFFFFFD1D571
  br i1 %106, label %107, label %110

107:                                              ; preds = %105
  %.not.i.i = icmp eq i32 %.050, 0
  %108 = select i1 %.not.i.i, float f0x70000000, float f0xF0000000
  call void @llvm.lifetime.start.p0(ptr nonnull %4)
  store volatile float %108, ptr %4, align 4, !tbaa !164
  %.0..0..0..0..0..0..0..0..0..0..0..0..0..0..i.i.i = load volatile float, ptr %4, align 4, !tbaa !164
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
  store volatile float %113, ptr %3, align 4, !tbaa !164
  %.0..0..0..0..0..0..0..0..0..0..0..0..0..0..i.i.i6 = load volatile float, ptr %3, align 4, !tbaa !164
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
  %122 = load i64, ptr %121, align 8, !tbaa !167
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
define internal noundef float @rintf(float noundef %0) local_unnamed_addr #6 {
  %2 = bitcast float %0 to i32
  %3 = and i32 %2, 2130706432
  %4 = icmp samesign ugt i32 %3, 1249902592
  br i1 %4, label %13, label %5

5:                                                ; preds = %1
  %.not = icmp sgt i32 %2, -1
  %6 = fadd float %0, f0xCB000000
  %7 = fadd float %6, f0x4B000000
  %8 = fadd float %0, f0x4B000000
  %9 = fadd float %8, f0xCB000000
  %.0 = select i1 %.not, float %9, float %7
  %10 = fcmp oeq float %.0, 0.000000e+00
  br i1 %10, label %11, label %13

11:                                               ; preds = %5
  %12 = select i1 %.not, float 0.000000e+00, float -0.000000e+00
  br label %13

13:                                               ; preds = %11, %5, %1
  %.010 = phi float [ %12, %11 ], [ %0, %1 ], [ %.0, %5 ]
  ret float %.010
}

; Function Attrs: inlinehint nofree norecurse nosync nounwind memory(inaccessiblemem: readwrite)
define internal float @roundf(float noundef %0) local_unnamed_addr #7 {
  %2 = alloca float, align 4
  %3 = bitcast float %0 to i32
  %4 = lshr i32 %3, 23
  %5 = and i32 %4, 255
  %6 = icmp samesign ugt i32 %5, 149
  br i1 %6, label %26, label %7

7:                                                ; preds = %1
  %spec.select = tail call float @llvm.fabs.f32(float %0)
  %8 = icmp samesign ult i32 %5, 126
  %9 = fadd float %spec.select, f0x4B000000
  br i1 %8, label %10, label %12

10:                                               ; preds = %7
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
  store volatile float %9, ptr %2, align 4, !tbaa !164
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  %11 = fmul float %0, 0.000000e+00
  br label %26

12:                                               ; preds = %7
  %13 = fadd float %9, f0xCB000000
  %14 = fsub float %13, %spec.select
  %15 = fcmp ogt float %14, 5.000000e-01
  br i1 %15, label %16, label %19

16:                                               ; preds = %12
  %17 = fadd float %spec.select, %14
  %18 = fadd float %17, -1.000000e+00
  br label %24

19:                                               ; preds = %12
  %20 = fcmp ugt float %14, -5.000000e-01
  %21 = fadd float %spec.select, %14
  br i1 %20, label %24, label %22

22:                                               ; preds = %19
  %23 = fadd float %21, 1.000000e+00
  br label %24

24:                                               ; preds = %22, %19, %16
  %.0 = phi float [ %18, %16 ], [ %23, %22 ], [ %21, %19 ]
  %25 = fneg float %.0
  %.not26 = icmp slt i32 %3, 0
  %spec.select25 = select i1 %.not26, float %25, float %.0
  br label %26

26:                                               ; preds = %24, %10, %1
  %.020 = phi float [ %11, %10 ], [ %spec.select25, %24 ], [ %0, %1 ]
  ret float %.020
}

; Function Attrs: alwaysinline mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite)
declare void @llvm.prefetch.p0(ptr readonly captures(none), i32 immarg range(i32 0, 2), i32 immarg range(i32 0, 4), i32 immarg range(i32 0, 2)) #10

; Function Attrs: alwaysinline mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.experimental.noalias.scope.decl(metadata) #11

; Function Attrs: alwaysinline mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x float> @llvm.fma.v8f32(<8 x float>, <8 x float>, <8 x float>) #12

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, target_mem: none) "frame-pointer"="all" "hot" "no-builtins" "nonlazybind" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) "frame-pointer"="all" "hot" "no-builtins" "nonlazybind" }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable "nonlazybind" }
attributes #3 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #4 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #5 = { mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #6 = { inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none) }
attributes #7 = { inlinehint nofree norecurse nosync nounwind memory(inaccessiblemem: readwrite) }
attributes #8 = { inlinehint nofree norecurse nosync nounwind memory(none) }
attributes #9 = { inlinehint nofree nosync nounwind memory(argmem: readwrite) }
attributes #10 = { alwaysinline mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite) }
attributes #11 = { alwaysinline mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #12 = { alwaysinline mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #13 = { inlinehint }

!llvm.module.flags = !{!0, !1, !2}
!llvm.errno.tbaa = !{!3}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"frame-pointer", i32 2}
!3 = !{!4, !5, i64 0}
!4 = !{!"__libc_errno", !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!9}
!9 = distinct !{!9, !10, !"iree_uk_pack_tile_8x1_x32_x86_64_avx2_fma_transpose: argument 0"}
!10 = distinct !{!10, !"iree_uk_pack_tile_8x1_x32_x86_64_avx2_fma_transpose"}
!11 = !{!12}
!12 = distinct !{!12, !10, !"iree_uk_pack_tile_8x1_x32_x86_64_avx2_fma_transpose: argument 1"}
!13 = !{!14}
!14 = distinct !{!14, !15, !"iree_uk_memcpy: argument 0"}
!15 = distinct !{!15, !"iree_uk_memcpy"}
!16 = !{!17}
!17 = distinct !{!17, !15, !"iree_uk_memcpy: argument 1"}
!18 = !{!6, !6, i64 0}
!19 = !{!17, !12}
!20 = !{!14, !9}
!21 = !{!22}
!22 = distinct !{!22, !15, !"iree_uk_memcpy: argument 0:It1"}
!23 = !{!24}
!24 = distinct !{!24, !15, !"iree_uk_memcpy: argument 1:It1"}
!25 = !{!24, !12}
!26 = !{!22, !9}
!27 = !{!28}
!28 = distinct !{!28, !15, !"iree_uk_memcpy: argument 0:It2"}
!29 = !{!30}
!30 = distinct !{!30, !15, !"iree_uk_memcpy: argument 1:It2"}
!31 = !{!30, !12}
!32 = !{!28, !9}
!33 = !{!34}
!34 = distinct !{!34, !15, !"iree_uk_memcpy: argument 0:It3"}
!35 = !{!36}
!36 = distinct !{!36, !15, !"iree_uk_memcpy: argument 1:It3"}
!37 = !{!36, !12}
!38 = !{!34, !9}
!39 = !{!40}
!40 = distinct !{!40, !15, !"iree_uk_memcpy: argument 0:It4"}
!41 = !{!42}
!42 = distinct !{!42, !15, !"iree_uk_memcpy: argument 1:It4"}
!43 = !{!42, !12}
!44 = !{!40, !9}
!45 = !{!46}
!46 = distinct !{!46, !15, !"iree_uk_memcpy: argument 0:It5"}
!47 = !{!48}
!48 = distinct !{!48, !15, !"iree_uk_memcpy: argument 1:It5"}
!49 = !{!48, !12}
!50 = !{!46, !9}
!51 = !{!52}
!52 = distinct !{!52, !15, !"iree_uk_memcpy: argument 0:It6"}
!53 = !{!54}
!54 = distinct !{!54, !15, !"iree_uk_memcpy: argument 1:It6"}
!55 = !{!54, !12}
!56 = !{!52, !9}
!57 = !{!58}
!58 = distinct !{!58, !15, !"iree_uk_memcpy: argument 0:It7"}
!59 = !{!60}
!60 = distinct !{!60, !15, !"iree_uk_memcpy: argument 1:It7"}
!61 = !{!60, !12}
!62 = !{!58, !9}
!63 = distinct !{!63, !64}
!64 = !{!"llvm.loop.mustprogress"}
!65 = distinct !{!65, !64}
!66 = !{!67}
!67 = distinct !{!67, !68, !"iree_uk_pack_tile_8x1_x32_x86_64_avx2_fma_direct: argument 0"}
!68 = distinct !{!68, !"iree_uk_pack_tile_8x1_x32_x86_64_avx2_fma_direct"}
!69 = !{!70}
!70 = distinct !{!70, !68, !"iree_uk_pack_tile_8x1_x32_x86_64_avx2_fma_direct: argument 1"}
!71 = !{!72}
!72 = distinct !{!72, !73, !"iree_uk_pack_tile_8x4_x8_x86_64_avx2_fma_direct: argument 0"}
!73 = distinct !{!73, !"iree_uk_pack_tile_8x4_x8_x86_64_avx2_fma_direct"}
!74 = !{!75}
!75 = distinct !{!75, !73, !"iree_uk_pack_tile_8x4_x8_x86_64_avx2_fma_direct: argument 1"}
!76 = !{!77}
!77 = distinct !{!77, !78, !"iree_uk_avx2_copy_8x16xi8_tiled_1x4_transpose_strided_to_strided: argument 0"}
!78 = distinct !{!78, !"iree_uk_avx2_copy_8x16xi8_tiled_1x4_transpose_strided_to_strided"}
!79 = !{!80}
!80 = distinct !{!80, !78, !"iree_uk_avx2_copy_8x16xi8_tiled_1x4_transpose_strided_to_strided: argument 1"}
!81 = !{!80, !75, !70}
!82 = !{!77, !72, !67}
!83 = distinct !{!83, !64}
!84 = !{!85}
!85 = distinct !{!85, !86, !"iree_uk_mmt4d_tile_f32f32f32_8x8x1_x86_64_avx2_fma: argument 0"}
!86 = distinct !{!86, !"iree_uk_mmt4d_tile_f32f32f32_8x8x1_x86_64_avx2_fma"}
!87 = !{!88}
!88 = distinct !{!88, !86, !"iree_uk_mmt4d_tile_f32f32f32_8x8x1_x86_64_avx2_fma: argument 1"}
!89 = !{!90}
!90 = distinct !{!90, !86, !"iree_uk_mmt4d_tile_f32f32f32_8x8x1_x86_64_avx2_fma: argument 2"}
!91 = !{!92, !94, !88, !90}
!92 = distinct !{!92, !93, !"iree_uk_mmt4d_tile_f32f32f32_1x8x1_to_8x8x1_x86_64_avx2_fma: argument 1"}
!93 = distinct !{!93, !"iree_uk_mmt4d_tile_f32f32f32_1x8x1_to_8x8x1_x86_64_avx2_fma"}
!94 = distinct !{!94, !93, !"iree_uk_mmt4d_tile_f32f32f32_1x8x1_to_8x8x1_x86_64_avx2_fma: argument 2"}
!95 = !{!85, !88}
!96 = !{!85, !90}
!97 = distinct !{!97, !64}
!98 = !{!88, !90}
!99 = distinct !{!99, !64}
!100 = distinct !{!100, !64}
!101 = !{!102}
!102 = distinct !{!102, !103, !"iree_uk_unpack_tile_8x8_x32_x86_64_avx2_fma_direct: argument 0"}
!103 = distinct !{!103, !"iree_uk_unpack_tile_8x8_x32_x86_64_avx2_fma_direct"}
!104 = !{!105}
!105 = distinct !{!105, !103, !"iree_uk_unpack_tile_8x8_x32_x86_64_avx2_fma_direct: argument 1"}
!106 = !{!107}
!107 = distinct !{!107, !108, !"iree_uk_copy_8x32xi8_strided_to_strided: argument 0"}
!108 = distinct !{!108, !"iree_uk_copy_8x32xi8_strided_to_strided"}
!109 = !{!110}
!110 = distinct !{!110, !108, !"iree_uk_copy_8x32xi8_strided_to_strided: argument 1"}
!111 = !{!112}
!112 = distinct !{!112, !113, !"iree_uk_memcpy: argument 0"}
!113 = distinct !{!113, !"iree_uk_memcpy"}
!114 = !{!115}
!115 = distinct !{!115, !113, !"iree_uk_memcpy: argument 1"}
!116 = !{!115, !110, !105}
!117 = !{!112, !107, !102}
!118 = !{!119}
!119 = distinct !{!119, !113, !"iree_uk_memcpy: argument 0:It1"}
!120 = !{!121}
!121 = distinct !{!121, !113, !"iree_uk_memcpy: argument 1:It1"}
!122 = !{!121, !110, !105}
!123 = !{!119, !107, !102}
!124 = !{!125}
!125 = distinct !{!125, !113, !"iree_uk_memcpy: argument 0:It2"}
!126 = !{!127}
!127 = distinct !{!127, !113, !"iree_uk_memcpy: argument 1:It2"}
!128 = !{!127, !110, !105}
!129 = !{!125, !107, !102}
!130 = !{!131}
!131 = distinct !{!131, !113, !"iree_uk_memcpy: argument 0:It3"}
!132 = !{!133}
!133 = distinct !{!133, !113, !"iree_uk_memcpy: argument 1:It3"}
!134 = !{!133, !110, !105}
!135 = !{!131, !107, !102}
!136 = !{!137}
!137 = distinct !{!137, !113, !"iree_uk_memcpy: argument 0:It4"}
!138 = !{!139}
!139 = distinct !{!139, !113, !"iree_uk_memcpy: argument 1:It4"}
!140 = !{!139, !110, !105}
!141 = !{!137, !107, !102}
!142 = !{!143}
!143 = distinct !{!143, !113, !"iree_uk_memcpy: argument 0:It5"}
!144 = !{!145}
!145 = distinct !{!145, !113, !"iree_uk_memcpy: argument 1:It5"}
!146 = !{!145, !110, !105}
!147 = !{!143, !107, !102}
!148 = !{!149}
!149 = distinct !{!149, !113, !"iree_uk_memcpy: argument 0:It6"}
!150 = !{!151}
!151 = distinct !{!151, !113, !"iree_uk_memcpy: argument 1:It6"}
!152 = !{!151, !110, !105}
!153 = !{!149, !107, !102}
!154 = !{!155}
!155 = distinct !{!155, !113, !"iree_uk_memcpy: argument 0:It7"}
!156 = !{!157}
!157 = distinct !{!157, !113, !"iree_uk_memcpy: argument 1:It7"}
!158 = !{!157, !110, !105}
!159 = !{!155, !107, !102}
!160 = distinct !{!160, !64}
!161 = distinct !{!161, !64}
!162 = !{!163, !163, i64 0}
!163 = !{!"short", !6, i64 0}
!164 = !{!165, !165, i64 0}
!165 = !{!"float", !6, i64 0}
!166 = !{!"branch_weights", !"expected", i32 2000, i32 1}
!167 = !{!168, !168, i64 0}
!168 = !{!"long", !6, i64 0}
!169 = !{!5, !5, i64 0}
!170 = !{!"branch_weights", i32 4001, i32 4000000}
!171 = !{!172, !173, i64 0}
!172 = !{!"", !173, i64 0, !173, i64 8}
!173 = !{!"double", !6, i64 0}
!174 = !{!172, !173, i64 8}
!175 = !{!"branch_weights", !"expected", i32 1, i32 2000}
