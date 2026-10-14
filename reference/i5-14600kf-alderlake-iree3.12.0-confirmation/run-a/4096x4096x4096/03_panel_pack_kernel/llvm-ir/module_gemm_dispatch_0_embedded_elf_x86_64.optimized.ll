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
%struct.iree_uk_unpack_tmpbuf_helper_t = type { [4096 x i8], i32, [60 x i8] }
%struct.iree_uk_pack_tmpbuf_helper_t = type { [4096 x i8], i32, i8, [59 x i8] }

@0 = internal constant [16 x i8] c"gemm_dispatch_0\00", align 1
@iree_hal_executable_library_query_v0_header = internal constant %iree_hal_executable_library_header_t { i32 6, ptr @0, i32 0, i32 0 }
@iree_hal_executable_library_query_v0_funcs = internal constant [1 x ptr] [ptr @gemm_dispatch_0_matmul_4096x4096x4096_f32]
@iree_hal_executable_library_query_v0_attrs = internal constant [1 x %iree_hal_executable_dispatch_attrs_v0_t] [%iree_hal_executable_dispatch_attrs_v0_t { i64 0, i16 0, i8 0, i8 3, i32 1, i32 1, i16 1, i16 0, i64 0, i64 0, i64 0, i64 0, i64 0 }]
@1 = internal constant [42 x i8] c"gemm_dispatch_0_matmul_4096x4096x4096_f32\00", align 1
@iree_hal_executable_library_query_v0_names = internal constant [1 x ptr] [ptr @1]
@2 = internal constant [87 x i8] c"/tmp/iree-gemm-bench-confirmation/run-a/4096x4096x4096/03_panel_pack_kernel/final.mlir\00", align 1
@iree_hal_executable_library_query_v0_source_locations = internal constant [1 x %iree_hal_executable_source_location_v0_t] [%iree_hal_executable_source_location_v0_t { i32 5, i32 86, ptr @2 }]
@iree_hal_executable_library_query_v0_gemm_dispatch_0_matmul_4096x4096x4096_f32_stage_names = internal constant [0 x ptr] zeroinitializer
@iree_hal_executable_library_query_v0_gemm_dispatch_0_matmul_4096x4096x4096_f32_stage_source_locations = internal constant [0 x %iree_hal_executable_source_location_v0_t] zeroinitializer
@iree_hal_executable_library_query_v0_stage_location_tables = internal constant [1 x %iree_hal_executable_stage_location_table_v0_t] [%iree_hal_executable_stage_location_table_v0_t { i32 0, ptr @iree_hal_executable_library_query_v0_gemm_dispatch_0_matmul_4096x4096x4096_f32_stage_names, ptr @iree_hal_executable_library_query_v0_gemm_dispatch_0_matmul_4096x4096x4096_f32_stage_source_locations }]
@iree_hal_executable_library_query_v0 = internal constant %iree_hal_executable_library_v0_t { ptr @iree_hal_executable_library_query_v0_header, %iree_hal_executable_import_table_v0_t zeroinitializer, %iree_hal_executable_export_table_v0_t { i32 1, ptr @iree_hal_executable_library_query_v0_funcs, ptr @iree_hal_executable_library_query_v0_attrs, ptr null, ptr null, ptr @iree_hal_executable_library_query_v0_names, ptr null, ptr null, ptr @iree_hal_executable_library_query_v0_source_locations, ptr @iree_hal_executable_library_query_v0_stage_location_tables }, %iree_hal_executable_constant_table_v0_t zeroinitializer, %iree_hal_executable_source_file_table_v0_t zeroinitializer }
@__exp2f_data = internal local_unnamed_addr constant %struct.exp2f_data { [32 x i64] [i64 4607182418800017408, i64 4607140297302181236, i64 4607100335213349135, i64 4607062579818421073, i64 4607027079437701499, i64 4606993883449571754, i64 4606963042313658936, i64 4606934607594512097, i64 4606908631985796885, i64 4606885169335019979, i64 4606864274668794914, i64 4606846004218661165, i64 4606830415447468583, i64 4606817567076339586, i64 4606807519112221737, i64 4606800332876043653, i64 4606796071031487437, i64 4606794797614391156, i64 4606796578062795143, i64 4606801479247646227, i64 4606809569504174299, i64 4606820918663955941, i64 4606835598087680144, i64 4606853680698631517, i64 4606875241016906669, i64 4606900355194379847, i64 4606929101050434204, i64 4606961558108475497, i64 4606997807633245319, i64 4607037932668951391, i64 4607082018078232794, i64 4607130150581978432], double f0x42E8000000000000, [3 x double] [double f0x3FAC6AF84B912394, double f0x3FCEBFCE50FAC4F3, double f0x3FE62E42FF0C52D6], double f0x4338000000000000, double f0x40471547652B82FE, [3 x double] [double f0x3EBC6AF84B912394, double f0x3F2EBFCE50FAC4F3, double f0x3F962E42FF0C52D6] }, align 8
@__powf_log2_data = internal local_unnamed_addr constant %struct.powf_log2_data { [16 x %struct.anon] [%struct.anon { double f0x3FF661EC79F8F3BE, double f0xBFDEFEC65B963019 }, %struct.anon { double f0x3FF571ED4AAF883D, double f0xBFDB0B6832D4FCA4 }, %struct.anon { double f0x3FF49539F0F010B0, double f0xBFD7418B0A1FB77B }, %struct.anon { double f0x3FF3C995B0B80385, double f0xBFD39DE91A6DCF7B }, %struct.anon { double f0x3FF30D190C8864A5, double f0xBFD01D9BF3F2B631 }, %struct.anon { double f0x3FF25E227B0B8EA0, double f0xBFC97C1D1B3B7AF0 }, %struct.anon { double f0x3FF1BB4A4A1A343F, double f0xBFC2F9E393AF3C9F }, %struct.anon { double f0x3FF12358F08AE5BA, double f0xBFB960CBBF788D5C }, %struct.anon { double f0x3FF0953F419900A7, double f0xBFAA6F9DB6475FCE }, %struct.anon { double 1.000000e+00, double 0.000000e+00 }, %struct.anon { double f0x3FEE608CFD9A47AC, double f0x3FB338CA9F24F53D }, %struct.anon { double f0x3FECA4B31F026AA0, double f0x3FC476A9543891BA }, %struct.anon { double f0x3FEB2036576AFCE6, double f0x3FCE840B4AC4E4D2 }, %struct.anon { double f0x3FE9C2D163A1AA2D, double f0x3FD40645F0C6651C }, %struct.anon { double f0x3FE886E6037841ED, double f0x3FD88E9C2C1B9FF8 }, %struct.anon { double f0x3FE767DCF5534862, double f0x3FDCE0A44EB17BCC }], [5 x double] [double f0x3FD27616C9496E0B, double f0xBFD71969A075C67A, double f0x3FDEC70A6CA7BADD, double f0xBFE7154748BEF6C8, double f0x3FF71547652AB82B] }, align 8

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, target_mem: none)
define internal noundef i32 @gemm_dispatch_0_matmul_4096x4096x4096_f32(ptr noalias nofree nonnull readonly align 16 captures(none) %0, ptr noalias nofree noundef nonnull readonly align 16 captures(none) %1, ptr noalias nofree nonnull readnone align 16 captures(none) %2) #0 {
  %4 = alloca %struct.iree_uk_unpack_tmpbuf_helper_t, align 64
  %5 = alloca %struct.iree_uk_pack_tmpbuf_helper_t, align 64
  %.elt20 = getelementptr inbounds nuw i8, ptr %1, i64 32
  %.unpack21 = load ptr, ptr %.elt20, align 16
  %6 = load ptr, ptr %.unpack21, align 8
  call void @llvm.assume(i1 true) [ "align"(ptr %6, i64 64) ]
  %7 = getelementptr i8, ptr %.unpack21, i64 8
  %8 = load ptr, ptr %7, align 8
  call void @llvm.assume(i1 true) [ "align"(ptr %8, i64 64) ]
  %9 = getelementptr i8, ptr %.unpack21, i64 16
  %10 = load ptr, ptr %9, align 8
  call void @llvm.assume(i1 true) [ "align"(ptr %10, i64 64) ]
  %11 = alloca [15360 x float], align 64
  %12 = alloca [32768 x float], align 64
  %13 = alloca [524544 x float], align 64
  %14 = getelementptr inbounds nuw i8, ptr %5, i64 4096
  %15 = getelementptr inbounds nuw i8, ptr %5, i64 4100
  %16 = getelementptr inbounds nuw i8, ptr %4, i64 4096
  br label %.preheader187

.preheader187:                                    ; preds = %3, %iree_uk_unpack_p.exit
  %17 = phi i64 [ 0, %3 ], [ %708, %iree_uk_unpack_p.exit ]
  %18 = shl nuw nsw i64 %17, 2
  %invariant.gep206 = getelementptr i8, ptr %8, i64 %18
  br label %19

19:                                               ; preds = %.preheader187, %609
  %20 = phi i64 [ 0, %.preheader187 ], [ %610, %609 ]
  %21 = shl nuw nsw i64 %20, 14
  %gep207 = getelementptr i8, ptr %invariant.gep206, i64 %21
  br label %iree_uk_pad_and_pack_row_using_tile_func.exit29

iree_uk_pad_and_pack_row_using_tile_func.exit29:  ; preds = %19, %iree_uk_pack_tile_generic_direct.exit
  %22 = phi i64 [ 0, %19 ], [ %45, %iree_uk_pack_tile_generic_direct.exit ]
  %23 = phi ptr [ %12, %19 ], [ %43, %iree_uk_pack_tile_generic_direct.exit ]
  %24 = phi ptr [ %gep207, %19 ], [ %44, %iree_uk_pack_tile_generic_direct.exit ]
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2399)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2401)
  br label %25

25:                                               ; preds = %38, %iree_uk_pad_and_pack_row_using_tile_func.exit29
  %26 = phi i64 [ %41, %38 ], [ 0, %iree_uk_pad_and_pack_row_using_tile_func.exit29 ]
  %27 = phi ptr [ %39, %38 ], [ %23, %iree_uk_pad_and_pack_row_using_tile_func.exit29 ]
  %28 = phi ptr [ %40, %38 ], [ %24, %iree_uk_pad_and_pack_row_using_tile_func.exit29 ]
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2392)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2393)
  br label %.preheader.i

.preheader.i:                                     ; preds = %.preheader.i, %25
  %29 = phi i64 [ %36, %.preheader.i ], [ 0, %25 ]
  %30 = getelementptr inbounds nuw i8, ptr %28, i64 %29
  %31 = getelementptr inbounds nuw i8, ptr %30, i64 16
  %32 = load <16 x i8>, ptr %30, align 32, !tbaa !16, !alias.scope !2402, !noalias !2403
  %33 = load <16 x i8>, ptr %31, align 16, !tbaa !16, !alias.scope !2402, !noalias !2403
  %34 = getelementptr inbounds nuw i8, ptr %27, i64 %29
  %35 = getelementptr inbounds nuw i8, ptr %34, i64 16
  store <16 x i8> %32, ptr %34, align 1, !tbaa !16, !alias.scope !2403, !noalias !2402
  store <16 x i8> %33, ptr %35, align 1, !tbaa !16, !alias.scope !2403, !noalias !2402
  %36 = add nuw nsw i64 %29, 32
  %37 = icmp eq i64 %36, 64
  br i1 %37, label %38, label %.preheader.i, !llvm.loop !1437

38:                                               ; preds = %.preheader.i
  %39 = getelementptr inbounds nuw i8, ptr %27, i64 16384
  %40 = getelementptr inbounds nuw i8, ptr %28, i64 64
  %41 = add nuw nsw i64 %26, 1
  %42 = icmp eq i64 %41, 8
  br i1 %42, label %iree_uk_pack_tile_generic_direct.exit, label %25, !llvm.loop !1441

iree_uk_pack_tile_generic_direct.exit:            ; preds = %38
  %43 = getelementptr inbounds nuw i8, ptr %23, i64 64
  %44 = getelementptr inbounds nuw i8, ptr %24, i64 16384
  %45 = add nuw nsw i64 %22, 1
  %exitcond = icmp eq i64 %45, 256
  br i1 %exitcond, label %iree_uk_pack_p.exit, label %iree_uk_pad_and_pack_row_using_tile_func.exit29, !llvm.loop !1363

iree_uk_pack_p.exit:                              ; preds = %iree_uk_pack_tile_generic_direct.exit
  %46 = icmp eq i64 %20, 0
  %47 = shl nuw nsw i64 %20, 2
  %invariant.gep = getelementptr inbounds nuw i8, ptr %6, i64 %47
  br label %iree_uk_pad_and_pack_row_using_tile_func.exit26.preheader

iree_uk_pad_and_pack_row_using_tile_func.exit26.preheader: ; preds = %custom_mmt4d_6x16x8.exit, %iree_uk_pack_p.exit
  %indvars.iv = phi i64 [ 4096, %iree_uk_pack_p.exit ], [ %indvars.iv.next, %custom_mmt4d_6x16x8.exit ]
  %48 = phi i64 [ 0, %iree_uk_pack_p.exit ], [ %607, %custom_mmt4d_6x16x8.exit ]
  %49 = sub nuw nsw i64 4096, %48
  %50 = tail call i64 @llvm.umin.i64(i64 %49, i64 60)
  call void @llvm.lifetime.start.p0(ptr nonnull %5) #14
  store i32 128, ptr %14, align 64, !tbaa !131
  store i8 1, ptr %15, align 4, !tbaa !132
  %51 = shl nuw nsw i64 %48, 14
  %gep = getelementptr inbounds nuw i8, ptr %invariant.gep, i64 %51
  %52 = add nsw i64 %50, -6
  br label %iree_uk_pad_and_pack_row_using_tile_func.exit26

53:                                               ; preds = %iree_uk_pack_tile_generic_transpose.exit
  %umin = tail call i64 @llvm.umin.i64(i64 %indvars.iv, i64 60)
  %54 = add nsw i64 %umin, -6
  %55 = urem i64 %54, 6
  %56 = sub nsw i64 %54, %55
  %57 = add nsw i64 %50, -2
  %58 = udiv i64 %57, 6
  %59 = mul nuw i64 %58, 6
  %60 = icmp ult i64 %56, %59
  br i1 %60, label %.preheader268, label %iree_uk_pack_p.exit24

iree_uk_pad_and_pack_row_using_tile_func.exit26:  ; preds = %iree_uk_pad_and_pack_row_using_tile_func.exit26.preheader, %iree_uk_pack_tile_generic_transpose.exit
  %61 = phi i64 [ %84, %iree_uk_pack_tile_generic_transpose.exit ], [ 0, %iree_uk_pad_and_pack_row_using_tile_func.exit26.preheader ]
  %62 = phi ptr [ %82, %iree_uk_pack_tile_generic_transpose.exit ], [ %11, %iree_uk_pad_and_pack_row_using_tile_func.exit26.preheader ]
  %63 = phi ptr [ %83, %iree_uk_pack_tile_generic_transpose.exit ], [ %gep, %iree_uk_pad_and_pack_row_using_tile_func.exit26.preheader ]
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2416)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2418)
  br label %64

64:                                               ; preds = %77, %iree_uk_pad_and_pack_row_using_tile_func.exit26
  %65 = phi i64 [ %80, %77 ], [ 0, %iree_uk_pad_and_pack_row_using_tile_func.exit26 ]
  %66 = phi ptr [ %78, %77 ], [ %62, %iree_uk_pad_and_pack_row_using_tile_func.exit26 ]
  %67 = phi ptr [ %79, %77 ], [ %63, %iree_uk_pad_and_pack_row_using_tile_func.exit26 ]
  br label %68

68:                                               ; preds = %68, %64
  %69 = phi i64 [ 0, %64 ], [ %75, %68 ]
  %70 = phi ptr [ %66, %64 ], [ %73, %68 ]
  %71 = phi ptr [ %67, %64 ], [ %74, %68 ]
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2409)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2410)
  %72 = load <4 x i8>, ptr %71, align 1, !tbaa !16, !alias.scope !2420, !noalias !2419
  store <4 x i8> %72, ptr %70, align 1, !tbaa !16, !alias.scope !2419, !noalias !2420
  %73 = getelementptr inbounds nuw i8, ptr %70, i64 4
  %74 = getelementptr inbounds nuw i8, ptr %71, i64 16384
  %75 = add nuw nsw i64 %69, 1
  %76 = icmp eq i64 %75, 6
  br i1 %76, label %77, label %68, !llvm.loop !1451

77:                                               ; preds = %68
  %78 = getelementptr inbounds nuw i8, ptr %66, i64 24
  %79 = getelementptr inbounds nuw i8, ptr %67, i64 4
  %80 = add nuw nsw i64 %65, 1
  %81 = icmp eq i64 %80, 256
  br i1 %81, label %iree_uk_pack_tile_generic_transpose.exit, label %64, !llvm.loop !1452

iree_uk_pack_tile_generic_transpose.exit:         ; preds = %77
  %82 = getelementptr inbounds nuw i8, ptr %62, i64 6144
  %83 = getelementptr inbounds nuw i8, ptr %63, i64 98304
  %84 = add nuw nsw i64 %61, 6
  %85 = icmp samesign ugt i64 %84, %52
  br i1 %85, label %53, label %iree_uk_pad_and_pack_row_using_tile_func.exit26, !llvm.loop !1363

.preheader268:                                    ; preds = %53, %iree_uk_pad_and_pack_row_using_tile_func.exit
  %.in = phi i64 [ %88, %iree_uk_pad_and_pack_row_using_tile_func.exit ], [ %56, %53 ]
  %86 = phi ptr [ %215, %iree_uk_pad_and_pack_row_using_tile_func.exit ], [ %82, %53 ]
  %87 = phi ptr [ %216, %iree_uk_pad_and_pack_row_using_tile_func.exit ], [ %83, %53 ]
  %88 = add nuw nsw i64 %.in, 6
  %89 = sub nsw i64 %50, %88
  %90 = tail call noundef range(i64 0, -9223372036854775808) i64 @llvm.smax.i64(i64 %89, i64 0)
  %91 = tail call i64 @llvm.umin.i64(i64 %90, i64 6)
  %.not171 = icmp slt i64 %89, 1
  br label %92

92:                                               ; preds = %iree_uk_pack_tile_generic_transpose.exit261, %.preheader268
  %93 = phi i64 [ 0, %.preheader268 ], [ %213, %iree_uk_pack_tile_generic_transpose.exit261 ]
  %94 = sub nsw i64 256, %93
  %95 = load i32, ptr %14, align 64, !tbaa !131
  %96 = sext i32 %95 to i64
  %97 = tail call noundef i64 @llvm.smin.i64(i64 %96, i64 %94)
  %98 = shl i64 %93, 2
  %99 = getelementptr inbounds i8, ptr %87, i64 %98
  %100 = load i8, ptr %15, align 4, !tbaa !132, !range !1410, !noundef !72
  %101 = trunc nuw i8 %100 to i1
  %102 = mul nuw nsw i64 %97, 6
  br i1 %101, label %103, label %130

103:                                              ; preds = %92
  %104 = mul nsw i64 %97, 24
  %105 = icmp sgt i64 %97, 0
  br i1 %105, label %106, label %.loopexit178

106:                                              ; preds = %103
  %107 = icmp samesign ult i64 %104, 32
  br i1 %107, label %.preheader377, label %108

108:                                              ; preds = %106
  %109 = and i64 %104, 9223372036854775776
  br label %110

110:                                              ; preds = %110, %108
  %111 = phi i64 [ 0, %108 ], [ %114, %110 ]
  %112 = getelementptr inbounds nuw i8, ptr %5, i64 %111
  %113 = getelementptr inbounds nuw i8, ptr %112, i64 16
  store <16 x i8> zeroinitializer, ptr %112, align 32, !tbaa !16, !alias.scope !1587
  store <16 x i8> zeroinitializer, ptr %113, align 16, !tbaa !16, !alias.scope !1587
  %114 = add nuw nsw i64 %111, 32
  %115 = icmp eq i64 %114, %109
  br i1 %115, label %116, label %110, !llvm.loop !1367

116:                                              ; preds = %110
  %117 = icmp eq i64 %104, %109
  br i1 %117, label %.loopexit178, label %118

118:                                              ; preds = %116
  %119 = and i64 %104, 24
  %120 = icmp eq i64 %119, 0
  br i1 %120, label %.preheader179, label %.preheader377, !prof !137

.preheader377:                                    ; preds = %118, %106
  %.ph378 = phi i64 [ 0, %106 ], [ %109, %118 ]
  br label %121

121:                                              ; preds = %.preheader377, %121
  %122 = phi i64 [ %124, %121 ], [ %.ph378, %.preheader377 ]
  %123 = getelementptr inbounds nuw i8, ptr %5, i64 %122
  store <4 x i8> zeroinitializer, ptr %123, align 4, !tbaa !16, !alias.scope !1587
  %124 = add nuw nsw i64 %122, 4
  %125 = icmp eq i64 %124, %104
  br i1 %125, label %.loopexit178, label %121, !llvm.loop !1368

.preheader179:                                    ; preds = %118, %.preheader179
  %126 = phi i64 [ %128, %.preheader179 ], [ %109, %118 ]
  %127 = getelementptr inbounds nuw i8, ptr %5, i64 %126
  store i8 0, ptr %127, align 1, !tbaa !16, !alias.scope !1587
  %128 = add nuw nsw i64 %126, 1
  %129 = icmp eq i64 %128, %104
  br i1 %129, label %.loopexit178, label %.preheader179, !llvm.loop !1369

130:                                              ; preds = %92
  %131 = icmp sgt i64 %97, 0
  br i1 %131, label %132, label %.loopexit178

132:                                              ; preds = %130
  %133 = icmp eq i64 %97, 1
  br i1 %133, label %.preheader380, label %134

134:                                              ; preds = %132
  %135 = and i64 %102, 9223372036854775800
  br label %136

136:                                              ; preds = %136, %134
  %137 = phi i64 [ 0, %134 ], [ %140, %136 ]
  %138 = getelementptr inbounds nuw [4 x i8], ptr %5, i64 %137
  %139 = getelementptr inbounds nuw i8, ptr %138, i64 16
  store <4 x i32> zeroinitializer, ptr %138, align 32, !tbaa !9, !alias.scope !1587
  store <4 x i32> zeroinitializer, ptr %139, align 16, !tbaa !9, !alias.scope !1587
  %140 = add nuw nsw i64 %137, 8
  %141 = icmp eq i64 %140, %135
  br i1 %141, label %142, label %136, !llvm.loop !1374

142:                                              ; preds = %136
  %143 = icmp eq i64 %102, %135
  br i1 %143, label %.loopexit178, label %.preheader380

.preheader380:                                    ; preds = %142, %132
  %.ph381 = phi i64 [ %135, %142 ], [ 0, %132 ]
  br label %144

144:                                              ; preds = %.preheader380, %144
  %145 = phi i64 [ %147, %144 ], [ %.ph381, %.preheader380 ]
  %146 = getelementptr inbounds nuw [4 x i8], ptr %5, i64 %145
  store i32 0, ptr %146, align 4, !tbaa !9, !alias.scope !1587
  %147 = add nuw nsw i64 %145, 1
  %148 = icmp eq i64 %147, %102
  br i1 %148, label %.loopexit178, label %144, !llvm.loop !1375

.loopexit178:                                     ; preds = %144, %.preheader179, %121, %142, %130, %116, %103
  br i1 %.not171, label %.loopexit177, label %149

149:                                              ; preds = %.loopexit178
  %150 = shl nsw i64 %97, 2
  %151 = icmp sgt i64 %97, 0
  br i1 %151, label %152, label %iree_uk_pack_tile_generic_transpose.exit261

152:                                              ; preds = %149
  %153 = icmp samesign ult i64 %150, 32
  %154 = and i64 %150, 9223372036854775776
  %155 = icmp eq i64 %150, %154
  %156 = and i64 %97, 7
  %157 = icmp eq i64 %156, 0
  br label %158

158:                                              ; preds = %.loopexit, %152
  %159 = phi i64 [ %188, %.loopexit ], [ 0, %152 ]
  %160 = phi ptr [ %187, %.loopexit ], [ %99, %152 ]
  %161 = phi ptr [ %186, %.loopexit ], [ %5, %152 ]
  tail call void @llvm.experimental.noalias.scope.decl(metadata !1588)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !1589)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !1590)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !1591)
  br i1 %153, label %.preheader362, label %.preheader176

.preheader176:                                    ; preds = %158, %.preheader176
  %162 = phi i64 [ %169, %.preheader176 ], [ 0, %158 ]
  %163 = getelementptr inbounds nuw i8, ptr %160, i64 %162
  %164 = getelementptr inbounds nuw i8, ptr %163, i64 16
  %165 = load <16 x i8>, ptr %163, align 1, !tbaa !16, !alias.scope !1592, !noalias !1593
  %166 = load <16 x i8>, ptr %164, align 1, !tbaa !16, !alias.scope !1592, !noalias !1593
  %167 = getelementptr inbounds nuw i8, ptr %161, i64 %162
  %168 = getelementptr inbounds nuw i8, ptr %167, i64 16
  store <16 x i8> %165, ptr %167, align 1, !tbaa !16, !alias.scope !1593, !noalias !1592
  store <16 x i8> %166, ptr %168, align 1, !tbaa !16, !alias.scope !1593, !noalias !1592
  %169 = add nuw i64 %162, 32
  %170 = icmp eq i64 %169, %154
  br i1 %170, label %171, label %.preheader176, !llvm.loop !1383

171:                                              ; preds = %.preheader176
  br i1 %155, label %.loopexit, label %172

172:                                              ; preds = %171
  br i1 %157, label %.preheader, label %.preheader362, !prof !137

.preheader362:                                    ; preds = %172, %158
  %.ph = phi i64 [ 0, %158 ], [ %154, %172 ]
  br label %173

173:                                              ; preds = %.preheader362, %173
  %174 = phi i64 [ %178, %173 ], [ %.ph, %.preheader362 ]
  %175 = getelementptr inbounds nuw i8, ptr %160, i64 %174
  %176 = load <4 x i8>, ptr %175, align 1, !tbaa !16, !alias.scope !1592, !noalias !1593
  %177 = getelementptr inbounds nuw i8, ptr %161, i64 %174
  store <4 x i8> %176, ptr %177, align 1, !tbaa !16, !alias.scope !1593, !noalias !1592
  %178 = add nuw i64 %174, 4
  %179 = icmp eq i64 %178, %150
  br i1 %179, label %.loopexit, label %173, !llvm.loop !1384

.preheader:                                       ; preds = %172, %.preheader
  %180 = phi i64 [ %184, %.preheader ], [ %154, %172 ]
  %181 = getelementptr inbounds nuw i8, ptr %160, i64 %180
  %182 = load i8, ptr %181, align 1, !tbaa !16, !alias.scope !1592, !noalias !1593
  %183 = getelementptr inbounds nuw i8, ptr %161, i64 %180
  store i8 %182, ptr %183, align 1, !tbaa !16, !alias.scope !1593, !noalias !1592
  %184 = add nuw nsw i64 %180, 1
  %185 = icmp eq i64 %184, %150
  br i1 %185, label %.loopexit, label %.preheader, !llvm.loop !1385

.loopexit:                                        ; preds = %.preheader, %173, %171
  %186 = getelementptr inbounds nuw i8, ptr %161, i64 %150
  %187 = getelementptr inbounds nuw i8, ptr %160, i64 16384
  %188 = add nuw nsw i64 %159, 1
  %189 = icmp eq i64 %188, %91
  br i1 %189, label %.loopexit177, label %158, !llvm.loop !1386

.loopexit177:                                     ; preds = %.loopexit, %.loopexit178
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2433)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2435)
  %190 = icmp sgt i64 %97, 0
  br i1 %190, label %191, label %iree_uk_pack_tile_generic_transpose.exit261

191:                                              ; preds = %.loopexit177
  %192 = mul i64 %93, 24
  %193 = getelementptr inbounds i8, ptr %86, i64 %192
  %194 = shl nuw nsw i64 %97, 2
  br label %195

195:                                              ; preds = %208, %191
  %196 = phi i64 [ %211, %208 ], [ 0, %191 ]
  %197 = phi ptr [ %209, %208 ], [ %193, %191 ]
  %198 = phi ptr [ %210, %208 ], [ %5, %191 ]
  br label %199

199:                                              ; preds = %199, %195
  %200 = phi i64 [ 0, %195 ], [ %206, %199 ]
  %201 = phi ptr [ %197, %195 ], [ %204, %199 ]
  %202 = phi ptr [ %198, %195 ], [ %205, %199 ]
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2426)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2427)
  %203 = load <4 x i8>, ptr %202, align 1, !tbaa !16, !alias.scope !2437, !noalias !2436
  store <4 x i8> %203, ptr %201, align 1, !tbaa !16, !alias.scope !2436, !noalias !2437
  %204 = getelementptr inbounds nuw i8, ptr %201, i64 4
  %205 = getelementptr inbounds nuw i8, ptr %202, i64 %194
  %206 = add nuw nsw i64 %200, 1
  %207 = icmp eq i64 %206, 6
  br i1 %207, label %208, label %199, !llvm.loop !1451

208:                                              ; preds = %199
  %209 = getelementptr inbounds nuw i8, ptr %197, i64 24
  %210 = getelementptr inbounds nuw i8, ptr %198, i64 4
  %211 = add nuw nsw i64 %196, 1
  %212 = icmp eq i64 %211, %97
  br i1 %212, label %iree_uk_pack_tile_generic_transpose.exit261, label %195, !llvm.loop !1452

iree_uk_pack_tile_generic_transpose.exit261:      ; preds = %208, %149, %.loopexit177
  %213 = add nsw i64 %97, %93
  %214 = icmp slt i64 %213, 256
  br i1 %214, label %92, label %iree_uk_pad_and_pack_row_using_tile_func.exit, !llvm.loop !1409

iree_uk_pad_and_pack_row_using_tile_func.exit:    ; preds = %iree_uk_pack_tile_generic_transpose.exit261
  %215 = getelementptr inbounds nuw i8, ptr %86, i64 6144
  %216 = getelementptr inbounds nuw i8, ptr %87, i64 98304
  %217 = icmp samesign ult i64 %88, %59
  br i1 %217, label %.preheader268, label %iree_uk_pack_p.exit24, !llvm.loop !1364

iree_uk_pack_p.exit24:                            ; preds = %iree_uk_pad_and_pack_row_using_tile_func.exit, %53
  call void @llvm.lifetime.end.p0(ptr nonnull %5) #14
  %.idx = shl nuw nsw i64 %48, 9
  %218 = getelementptr inbounds nuw i8, ptr %13, i64 %.idx
  br label %219

219:                                              ; preds = %604, %iree_uk_pack_p.exit24
  %220 = phi i64 [ %605, %604 ], [ 0, %iree_uk_pack_p.exit24 ]
  %.idx172 = mul nuw nsw i64 %220, 3072
  %221 = getelementptr inbounds nuw i8, ptr %218, i64 %.idx172
  %.idx173 = mul nuw nsw i64 %220, 6144
  %222 = getelementptr inbounds nuw i8, ptr %11, i64 %.idx173
  br label %223

223:                                              ; preds = %590, %219
  %224 = phi i64 [ 0, %219 ], [ %602, %590 ]
  %225 = mul nuw nsw i64 %224, 384
  %226 = getelementptr inbounds nuw i8, ptr %221, i64 %225
  %.idx174 = shl nuw nsw i64 %224, 14
  %227 = getelementptr inbounds nuw i8, ptr %12, i64 %.idx174
  br i1 %46, label %.preheader364, label %228

228:                                              ; preds = %223
  %229 = load <8 x float>, ptr %226, align 64, !tbaa !16, !noalias !1540
  %230 = getelementptr inbounds nuw i8, ptr %226, i64 32
  %231 = load <8 x float>, ptr %230, align 32, !tbaa !16, !noalias !1540
  %232 = getelementptr inbounds nuw i8, ptr %226, i64 64
  %233 = load <8 x float>, ptr %232, align 64, !tbaa !16, !noalias !1540
  %234 = getelementptr inbounds nuw i8, ptr %226, i64 96
  %235 = load <8 x float>, ptr %234, align 32, !tbaa !16, !noalias !1540
  %236 = getelementptr inbounds nuw i8, ptr %226, i64 128
  %237 = load <8 x float>, ptr %236, align 64, !tbaa !16, !noalias !1540
  %238 = getelementptr inbounds nuw i8, ptr %226, i64 160
  %239 = load <8 x float>, ptr %238, align 32, !tbaa !16, !noalias !1540
  %240 = getelementptr inbounds nuw i8, ptr %226, i64 192
  %241 = load <8 x float>, ptr %240, align 64, !tbaa !16, !noalias !1540
  %242 = getelementptr inbounds nuw i8, ptr %226, i64 224
  %243 = load <8 x float>, ptr %242, align 32, !tbaa !16, !noalias !1540
  %244 = getelementptr inbounds nuw i8, ptr %226, i64 256
  %245 = load <8 x float>, ptr %244, align 64, !tbaa !16, !noalias !1540
  %246 = getelementptr inbounds nuw i8, ptr %226, i64 288
  %247 = load <8 x float>, ptr %246, align 32, !tbaa !16, !noalias !1540
  %248 = getelementptr inbounds nuw i8, ptr %226, i64 320
  %249 = load <8 x float>, ptr %248, align 64, !tbaa !16, !noalias !1540
  %250 = getelementptr inbounds nuw i8, ptr %226, i64 352
  %251 = load <8 x float>, ptr %250, align 32, !tbaa !16, !noalias !1540
  br label %.preheader364

.preheader364:                                    ; preds = %228, %223
  %.ph365 = phi <8 x float> [ zeroinitializer, %223 ], [ %229, %228 ]
  %.ph366 = phi <8 x float> [ zeroinitializer, %223 ], [ %231, %228 ]
  %.ph367 = phi <8 x float> [ zeroinitializer, %223 ], [ %233, %228 ]
  %.ph368 = phi <8 x float> [ zeroinitializer, %223 ], [ %235, %228 ]
  %.ph369 = phi <8 x float> [ zeroinitializer, %223 ], [ %237, %228 ]
  %.ph370 = phi <8 x float> [ zeroinitializer, %223 ], [ %239, %228 ]
  %.ph371 = phi <8 x float> [ zeroinitializer, %223 ], [ %241, %228 ]
  %.ph372 = phi <8 x float> [ zeroinitializer, %223 ], [ %243, %228 ]
  %.ph373 = phi <8 x float> [ zeroinitializer, %223 ], [ %245, %228 ]
  %.ph374 = phi <8 x float> [ zeroinitializer, %223 ], [ %247, %228 ]
  %.ph375 = phi <8 x float> [ zeroinitializer, %223 ], [ %249, %228 ]
  %.ph376 = phi <8 x float> [ zeroinitializer, %223 ], [ %251, %228 ]
  br label %252

252:                                              ; preds = %.preheader364, %252
  %253 = phi ptr [ %586, %252 ], [ %222, %.preheader364 ]
  %254 = phi ptr [ %587, %252 ], [ %227, %.preheader364 ]
  %255 = phi <8 x float> [ %554, %252 ], [ %.ph365, %.preheader364 ]
  %256 = phi <8 x float> [ %555, %252 ], [ %.ph366, %.preheader364 ]
  %257 = phi <8 x float> [ %560, %252 ], [ %.ph367, %.preheader364 ]
  %258 = phi <8 x float> [ %561, %252 ], [ %.ph368, %.preheader364 ]
  %259 = phi <8 x float> [ %566, %252 ], [ %.ph369, %.preheader364 ]
  %260 = phi <8 x float> [ %567, %252 ], [ %.ph370, %.preheader364 ]
  %261 = phi <8 x float> [ %572, %252 ], [ %.ph371, %.preheader364 ]
  %262 = phi <8 x float> [ %573, %252 ], [ %.ph372, %.preheader364 ]
  %263 = phi <8 x float> [ %578, %252 ], [ %.ph373, %.preheader364 ]
  %264 = phi <8 x float> [ %579, %252 ], [ %.ph374, %.preheader364 ]
  %265 = phi <8 x float> [ %584, %252 ], [ %.ph375, %.preheader364 ]
  %266 = phi <8 x float> [ %585, %252 ], [ %.ph376, %.preheader364 ]
  %267 = phi i64 [ %588, %252 ], [ 0, %.preheader364 ]
  %268 = load <8 x float>, ptr %254, align 1, !tbaa !16
  %269 = getelementptr inbounds nuw i8, ptr %254, i64 32
  %270 = load <8 x float>, ptr %269, align 1, !tbaa !16
  %271 = load float, ptr %253, align 1, !tbaa !16
  %272 = insertelement <8 x float> poison, float %271, i64 0
  %273 = shufflevector <8 x float> %272, <8 x float> poison, <8 x i32> zeroinitializer
  %274 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %273, <8 x float> %268, <8 x float> %255)
  %275 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %273, <8 x float> %270, <8 x float> %256)
  %276 = getelementptr inbounds nuw i8, ptr %253, i64 4
  %277 = load float, ptr %276, align 1, !tbaa !16
  %278 = insertelement <8 x float> poison, float %277, i64 0
  %279 = shufflevector <8 x float> %278, <8 x float> poison, <8 x i32> zeroinitializer
  %280 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %279, <8 x float> %268, <8 x float> %257)
  %281 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %279, <8 x float> %270, <8 x float> %258)
  %282 = getelementptr inbounds nuw i8, ptr %253, i64 8
  %283 = load float, ptr %282, align 1, !tbaa !16
  %284 = insertelement <8 x float> poison, float %283, i64 0
  %285 = shufflevector <8 x float> %284, <8 x float> poison, <8 x i32> zeroinitializer
  %286 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %285, <8 x float> %268, <8 x float> %259)
  %287 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %285, <8 x float> %270, <8 x float> %260)
  %288 = getelementptr inbounds nuw i8, ptr %253, i64 12
  %289 = load float, ptr %288, align 1, !tbaa !16
  %290 = insertelement <8 x float> poison, float %289, i64 0
  %291 = shufflevector <8 x float> %290, <8 x float> poison, <8 x i32> zeroinitializer
  %292 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %291, <8 x float> %268, <8 x float> %261)
  %293 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %291, <8 x float> %270, <8 x float> %262)
  %294 = getelementptr inbounds nuw i8, ptr %253, i64 16
  %295 = load float, ptr %294, align 1, !tbaa !16
  %296 = insertelement <8 x float> poison, float %295, i64 0
  %297 = shufflevector <8 x float> %296, <8 x float> poison, <8 x i32> zeroinitializer
  %298 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %297, <8 x float> %268, <8 x float> %263)
  %299 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %297, <8 x float> %270, <8 x float> %264)
  %300 = getelementptr inbounds nuw i8, ptr %253, i64 20
  %301 = load float, ptr %300, align 1, !tbaa !16
  %302 = insertelement <8 x float> poison, float %301, i64 0
  %303 = shufflevector <8 x float> %302, <8 x float> poison, <8 x i32> zeroinitializer
  %304 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %303, <8 x float> %268, <8 x float> %265)
  %305 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %303, <8 x float> %270, <8 x float> %266)
  %306 = getelementptr inbounds nuw i8, ptr %254, i64 64
  %307 = load <8 x float>, ptr %306, align 1, !tbaa !16
  %308 = getelementptr inbounds nuw i8, ptr %254, i64 96
  %309 = load <8 x float>, ptr %308, align 1, !tbaa !16
  %310 = getelementptr inbounds nuw i8, ptr %253, i64 24
  %311 = load float, ptr %310, align 1, !tbaa !16
  %312 = insertelement <8 x float> poison, float %311, i64 0
  %313 = shufflevector <8 x float> %312, <8 x float> poison, <8 x i32> zeroinitializer
  %314 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %313, <8 x float> %307, <8 x float> %274)
  %315 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %313, <8 x float> %309, <8 x float> %275)
  %316 = getelementptr inbounds nuw i8, ptr %253, i64 28
  %317 = load float, ptr %316, align 1, !tbaa !16
  %318 = insertelement <8 x float> poison, float %317, i64 0
  %319 = shufflevector <8 x float> %318, <8 x float> poison, <8 x i32> zeroinitializer
  %320 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %319, <8 x float> %307, <8 x float> %280)
  %321 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %319, <8 x float> %309, <8 x float> %281)
  %322 = getelementptr inbounds nuw i8, ptr %253, i64 32
  %323 = load float, ptr %322, align 1, !tbaa !16
  %324 = insertelement <8 x float> poison, float %323, i64 0
  %325 = shufflevector <8 x float> %324, <8 x float> poison, <8 x i32> zeroinitializer
  %326 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %325, <8 x float> %307, <8 x float> %286)
  %327 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %325, <8 x float> %309, <8 x float> %287)
  %328 = getelementptr inbounds nuw i8, ptr %253, i64 36
  %329 = load float, ptr %328, align 1, !tbaa !16
  %330 = insertelement <8 x float> poison, float %329, i64 0
  %331 = shufflevector <8 x float> %330, <8 x float> poison, <8 x i32> zeroinitializer
  %332 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %331, <8 x float> %307, <8 x float> %292)
  %333 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %331, <8 x float> %309, <8 x float> %293)
  %334 = getelementptr inbounds nuw i8, ptr %253, i64 40
  %335 = load float, ptr %334, align 1, !tbaa !16
  %336 = insertelement <8 x float> poison, float %335, i64 0
  %337 = shufflevector <8 x float> %336, <8 x float> poison, <8 x i32> zeroinitializer
  %338 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %337, <8 x float> %307, <8 x float> %298)
  %339 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %337, <8 x float> %309, <8 x float> %299)
  %340 = getelementptr inbounds nuw i8, ptr %253, i64 44
  %341 = load float, ptr %340, align 1, !tbaa !16
  %342 = insertelement <8 x float> poison, float %341, i64 0
  %343 = shufflevector <8 x float> %342, <8 x float> poison, <8 x i32> zeroinitializer
  %344 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %343, <8 x float> %307, <8 x float> %304)
  %345 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %343, <8 x float> %309, <8 x float> %305)
  %346 = getelementptr inbounds nuw i8, ptr %254, i64 128
  %347 = load <8 x float>, ptr %346, align 1, !tbaa !16
  %348 = getelementptr inbounds nuw i8, ptr %254, i64 160
  %349 = load <8 x float>, ptr %348, align 1, !tbaa !16
  %350 = getelementptr inbounds nuw i8, ptr %253, i64 48
  %351 = load float, ptr %350, align 1, !tbaa !16
  %352 = insertelement <8 x float> poison, float %351, i64 0
  %353 = shufflevector <8 x float> %352, <8 x float> poison, <8 x i32> zeroinitializer
  %354 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %353, <8 x float> %347, <8 x float> %314)
  %355 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %353, <8 x float> %349, <8 x float> %315)
  %356 = getelementptr inbounds nuw i8, ptr %253, i64 52
  %357 = load float, ptr %356, align 1, !tbaa !16
  %358 = insertelement <8 x float> poison, float %357, i64 0
  %359 = shufflevector <8 x float> %358, <8 x float> poison, <8 x i32> zeroinitializer
  %360 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %359, <8 x float> %347, <8 x float> %320)
  %361 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %359, <8 x float> %349, <8 x float> %321)
  %362 = getelementptr inbounds nuw i8, ptr %253, i64 56
  %363 = load float, ptr %362, align 1, !tbaa !16
  %364 = insertelement <8 x float> poison, float %363, i64 0
  %365 = shufflevector <8 x float> %364, <8 x float> poison, <8 x i32> zeroinitializer
  %366 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %365, <8 x float> %347, <8 x float> %326)
  %367 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %365, <8 x float> %349, <8 x float> %327)
  %368 = getelementptr inbounds nuw i8, ptr %253, i64 60
  %369 = load float, ptr %368, align 1, !tbaa !16
  %370 = insertelement <8 x float> poison, float %369, i64 0
  %371 = shufflevector <8 x float> %370, <8 x float> poison, <8 x i32> zeroinitializer
  %372 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %371, <8 x float> %347, <8 x float> %332)
  %373 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %371, <8 x float> %349, <8 x float> %333)
  %374 = getelementptr inbounds nuw i8, ptr %253, i64 64
  %375 = load float, ptr %374, align 1, !tbaa !16
  %376 = insertelement <8 x float> poison, float %375, i64 0
  %377 = shufflevector <8 x float> %376, <8 x float> poison, <8 x i32> zeroinitializer
  %378 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %377, <8 x float> %347, <8 x float> %338)
  %379 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %377, <8 x float> %349, <8 x float> %339)
  %380 = getelementptr inbounds nuw i8, ptr %253, i64 68
  %381 = load float, ptr %380, align 1, !tbaa !16
  %382 = insertelement <8 x float> poison, float %381, i64 0
  %383 = shufflevector <8 x float> %382, <8 x float> poison, <8 x i32> zeroinitializer
  %384 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %383, <8 x float> %347, <8 x float> %344)
  %385 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %383, <8 x float> %349, <8 x float> %345)
  %386 = getelementptr inbounds nuw i8, ptr %254, i64 192
  %387 = load <8 x float>, ptr %386, align 1, !tbaa !16
  %388 = getelementptr inbounds nuw i8, ptr %254, i64 224
  %389 = load <8 x float>, ptr %388, align 1, !tbaa !16
  %390 = getelementptr inbounds nuw i8, ptr %253, i64 72
  %391 = load float, ptr %390, align 1, !tbaa !16
  %392 = insertelement <8 x float> poison, float %391, i64 0
  %393 = shufflevector <8 x float> %392, <8 x float> poison, <8 x i32> zeroinitializer
  %394 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %393, <8 x float> %387, <8 x float> %354)
  %395 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %393, <8 x float> %389, <8 x float> %355)
  %396 = getelementptr inbounds nuw i8, ptr %253, i64 76
  %397 = load float, ptr %396, align 1, !tbaa !16
  %398 = insertelement <8 x float> poison, float %397, i64 0
  %399 = shufflevector <8 x float> %398, <8 x float> poison, <8 x i32> zeroinitializer
  %400 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %399, <8 x float> %387, <8 x float> %360)
  %401 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %399, <8 x float> %389, <8 x float> %361)
  %402 = getelementptr inbounds nuw i8, ptr %253, i64 80
  %403 = load float, ptr %402, align 1, !tbaa !16
  %404 = insertelement <8 x float> poison, float %403, i64 0
  %405 = shufflevector <8 x float> %404, <8 x float> poison, <8 x i32> zeroinitializer
  %406 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %405, <8 x float> %387, <8 x float> %366)
  %407 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %405, <8 x float> %389, <8 x float> %367)
  %408 = getelementptr inbounds nuw i8, ptr %253, i64 84
  %409 = load float, ptr %408, align 1, !tbaa !16
  %410 = insertelement <8 x float> poison, float %409, i64 0
  %411 = shufflevector <8 x float> %410, <8 x float> poison, <8 x i32> zeroinitializer
  %412 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %411, <8 x float> %387, <8 x float> %372)
  %413 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %411, <8 x float> %389, <8 x float> %373)
  %414 = getelementptr inbounds nuw i8, ptr %253, i64 88
  %415 = load float, ptr %414, align 1, !tbaa !16
  %416 = insertelement <8 x float> poison, float %415, i64 0
  %417 = shufflevector <8 x float> %416, <8 x float> poison, <8 x i32> zeroinitializer
  %418 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %417, <8 x float> %387, <8 x float> %378)
  %419 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %417, <8 x float> %389, <8 x float> %379)
  %420 = getelementptr inbounds nuw i8, ptr %253, i64 92
  %421 = load float, ptr %420, align 1, !tbaa !16
  %422 = insertelement <8 x float> poison, float %421, i64 0
  %423 = shufflevector <8 x float> %422, <8 x float> poison, <8 x i32> zeroinitializer
  %424 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %423, <8 x float> %387, <8 x float> %384)
  %425 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %423, <8 x float> %389, <8 x float> %385)
  %426 = getelementptr inbounds nuw i8, ptr %254, i64 256
  %427 = load <8 x float>, ptr %426, align 1, !tbaa !16
  %428 = getelementptr inbounds nuw i8, ptr %254, i64 288
  %429 = load <8 x float>, ptr %428, align 1, !tbaa !16
  %430 = getelementptr inbounds nuw i8, ptr %253, i64 96
  %431 = load float, ptr %430, align 1, !tbaa !16
  %432 = insertelement <8 x float> poison, float %431, i64 0
  %433 = shufflevector <8 x float> %432, <8 x float> poison, <8 x i32> zeroinitializer
  %434 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %433, <8 x float> %427, <8 x float> %394)
  %435 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %433, <8 x float> %429, <8 x float> %395)
  %436 = getelementptr inbounds nuw i8, ptr %253, i64 100
  %437 = load float, ptr %436, align 1, !tbaa !16
  %438 = insertelement <8 x float> poison, float %437, i64 0
  %439 = shufflevector <8 x float> %438, <8 x float> poison, <8 x i32> zeroinitializer
  %440 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %439, <8 x float> %427, <8 x float> %400)
  %441 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %439, <8 x float> %429, <8 x float> %401)
  %442 = getelementptr inbounds nuw i8, ptr %253, i64 104
  %443 = load float, ptr %442, align 1, !tbaa !16
  %444 = insertelement <8 x float> poison, float %443, i64 0
  %445 = shufflevector <8 x float> %444, <8 x float> poison, <8 x i32> zeroinitializer
  %446 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %445, <8 x float> %427, <8 x float> %406)
  %447 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %445, <8 x float> %429, <8 x float> %407)
  %448 = getelementptr inbounds nuw i8, ptr %253, i64 108
  %449 = load float, ptr %448, align 1, !tbaa !16
  %450 = insertelement <8 x float> poison, float %449, i64 0
  %451 = shufflevector <8 x float> %450, <8 x float> poison, <8 x i32> zeroinitializer
  %452 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %451, <8 x float> %427, <8 x float> %412)
  %453 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %451, <8 x float> %429, <8 x float> %413)
  %454 = getelementptr inbounds nuw i8, ptr %253, i64 112
  %455 = load float, ptr %454, align 1, !tbaa !16
  %456 = insertelement <8 x float> poison, float %455, i64 0
  %457 = shufflevector <8 x float> %456, <8 x float> poison, <8 x i32> zeroinitializer
  %458 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %457, <8 x float> %427, <8 x float> %418)
  %459 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %457, <8 x float> %429, <8 x float> %419)
  %460 = getelementptr inbounds nuw i8, ptr %253, i64 116
  %461 = load float, ptr %460, align 1, !tbaa !16
  %462 = insertelement <8 x float> poison, float %461, i64 0
  %463 = shufflevector <8 x float> %462, <8 x float> poison, <8 x i32> zeroinitializer
  %464 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %463, <8 x float> %427, <8 x float> %424)
  %465 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %463, <8 x float> %429, <8 x float> %425)
  %466 = getelementptr inbounds nuw i8, ptr %254, i64 320
  %467 = load <8 x float>, ptr %466, align 1, !tbaa !16
  %468 = getelementptr inbounds nuw i8, ptr %254, i64 352
  %469 = load <8 x float>, ptr %468, align 1, !tbaa !16
  %470 = getelementptr inbounds nuw i8, ptr %253, i64 120
  %471 = load float, ptr %470, align 1, !tbaa !16
  %472 = insertelement <8 x float> poison, float %471, i64 0
  %473 = shufflevector <8 x float> %472, <8 x float> poison, <8 x i32> zeroinitializer
  %474 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %473, <8 x float> %467, <8 x float> %434)
  %475 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %473, <8 x float> %469, <8 x float> %435)
  %476 = getelementptr inbounds nuw i8, ptr %253, i64 124
  %477 = load float, ptr %476, align 1, !tbaa !16
  %478 = insertelement <8 x float> poison, float %477, i64 0
  %479 = shufflevector <8 x float> %478, <8 x float> poison, <8 x i32> zeroinitializer
  %480 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %479, <8 x float> %467, <8 x float> %440)
  %481 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %479, <8 x float> %469, <8 x float> %441)
  %482 = getelementptr inbounds nuw i8, ptr %253, i64 128
  %483 = load float, ptr %482, align 1, !tbaa !16
  %484 = insertelement <8 x float> poison, float %483, i64 0
  %485 = shufflevector <8 x float> %484, <8 x float> poison, <8 x i32> zeroinitializer
  %486 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %485, <8 x float> %467, <8 x float> %446)
  %487 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %485, <8 x float> %469, <8 x float> %447)
  %488 = getelementptr inbounds nuw i8, ptr %253, i64 132
  %489 = load float, ptr %488, align 1, !tbaa !16
  %490 = insertelement <8 x float> poison, float %489, i64 0
  %491 = shufflevector <8 x float> %490, <8 x float> poison, <8 x i32> zeroinitializer
  %492 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %491, <8 x float> %467, <8 x float> %452)
  %493 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %491, <8 x float> %469, <8 x float> %453)
  %494 = getelementptr inbounds nuw i8, ptr %253, i64 136
  %495 = load float, ptr %494, align 1, !tbaa !16
  %496 = insertelement <8 x float> poison, float %495, i64 0
  %497 = shufflevector <8 x float> %496, <8 x float> poison, <8 x i32> zeroinitializer
  %498 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %497, <8 x float> %467, <8 x float> %458)
  %499 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %497, <8 x float> %469, <8 x float> %459)
  %500 = getelementptr inbounds nuw i8, ptr %253, i64 140
  %501 = load float, ptr %500, align 1, !tbaa !16
  %502 = insertelement <8 x float> poison, float %501, i64 0
  %503 = shufflevector <8 x float> %502, <8 x float> poison, <8 x i32> zeroinitializer
  %504 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %503, <8 x float> %467, <8 x float> %464)
  %505 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %503, <8 x float> %469, <8 x float> %465)
  %506 = getelementptr inbounds nuw i8, ptr %254, i64 384
  %507 = load <8 x float>, ptr %506, align 1, !tbaa !16
  %508 = getelementptr inbounds nuw i8, ptr %254, i64 416
  %509 = load <8 x float>, ptr %508, align 1, !tbaa !16
  %510 = getelementptr inbounds nuw i8, ptr %253, i64 144
  %511 = load float, ptr %510, align 1, !tbaa !16
  %512 = insertelement <8 x float> poison, float %511, i64 0
  %513 = shufflevector <8 x float> %512, <8 x float> poison, <8 x i32> zeroinitializer
  %514 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %513, <8 x float> %507, <8 x float> %474)
  %515 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %513, <8 x float> %509, <8 x float> %475)
  %516 = getelementptr inbounds nuw i8, ptr %253, i64 148
  %517 = load float, ptr %516, align 1, !tbaa !16
  %518 = insertelement <8 x float> poison, float %517, i64 0
  %519 = shufflevector <8 x float> %518, <8 x float> poison, <8 x i32> zeroinitializer
  %520 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %519, <8 x float> %507, <8 x float> %480)
  %521 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %519, <8 x float> %509, <8 x float> %481)
  %522 = getelementptr inbounds nuw i8, ptr %253, i64 152
  %523 = load float, ptr %522, align 1, !tbaa !16
  %524 = insertelement <8 x float> poison, float %523, i64 0
  %525 = shufflevector <8 x float> %524, <8 x float> poison, <8 x i32> zeroinitializer
  %526 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %525, <8 x float> %507, <8 x float> %486)
  %527 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %525, <8 x float> %509, <8 x float> %487)
  %528 = getelementptr inbounds nuw i8, ptr %253, i64 156
  %529 = load float, ptr %528, align 1, !tbaa !16
  %530 = insertelement <8 x float> poison, float %529, i64 0
  %531 = shufflevector <8 x float> %530, <8 x float> poison, <8 x i32> zeroinitializer
  %532 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %531, <8 x float> %507, <8 x float> %492)
  %533 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %531, <8 x float> %509, <8 x float> %493)
  %534 = getelementptr inbounds nuw i8, ptr %253, i64 160
  %535 = load float, ptr %534, align 1, !tbaa !16
  %536 = insertelement <8 x float> poison, float %535, i64 0
  %537 = shufflevector <8 x float> %536, <8 x float> poison, <8 x i32> zeroinitializer
  %538 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %537, <8 x float> %507, <8 x float> %498)
  %539 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %537, <8 x float> %509, <8 x float> %499)
  %540 = getelementptr inbounds nuw i8, ptr %253, i64 164
  %541 = load float, ptr %540, align 1, !tbaa !16
  %542 = insertelement <8 x float> poison, float %541, i64 0
  %543 = shufflevector <8 x float> %542, <8 x float> poison, <8 x i32> zeroinitializer
  %544 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %543, <8 x float> %507, <8 x float> %504)
  %545 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %543, <8 x float> %509, <8 x float> %505)
  %546 = getelementptr inbounds nuw i8, ptr %254, i64 448
  %547 = load <8 x float>, ptr %546, align 1, !tbaa !16
  %548 = getelementptr inbounds nuw i8, ptr %254, i64 480
  %549 = load <8 x float>, ptr %548, align 1, !tbaa !16
  %550 = getelementptr inbounds nuw i8, ptr %253, i64 168
  %551 = load float, ptr %550, align 1, !tbaa !16
  %552 = insertelement <8 x float> poison, float %551, i64 0
  %553 = shufflevector <8 x float> %552, <8 x float> poison, <8 x i32> zeroinitializer
  %554 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %553, <8 x float> %547, <8 x float> %514)
  %555 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %553, <8 x float> %549, <8 x float> %515)
  %556 = getelementptr inbounds nuw i8, ptr %253, i64 172
  %557 = load float, ptr %556, align 1, !tbaa !16
  %558 = insertelement <8 x float> poison, float %557, i64 0
  %559 = shufflevector <8 x float> %558, <8 x float> poison, <8 x i32> zeroinitializer
  %560 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %559, <8 x float> %547, <8 x float> %520)
  %561 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %559, <8 x float> %549, <8 x float> %521)
  %562 = getelementptr inbounds nuw i8, ptr %253, i64 176
  %563 = load float, ptr %562, align 1, !tbaa !16
  %564 = insertelement <8 x float> poison, float %563, i64 0
  %565 = shufflevector <8 x float> %564, <8 x float> poison, <8 x i32> zeroinitializer
  %566 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %565, <8 x float> %547, <8 x float> %526)
  %567 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %565, <8 x float> %549, <8 x float> %527)
  %568 = getelementptr inbounds nuw i8, ptr %253, i64 180
  %569 = load float, ptr %568, align 1, !tbaa !16
  %570 = insertelement <8 x float> poison, float %569, i64 0
  %571 = shufflevector <8 x float> %570, <8 x float> poison, <8 x i32> zeroinitializer
  %572 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %571, <8 x float> %547, <8 x float> %532)
  %573 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %571, <8 x float> %549, <8 x float> %533)
  %574 = getelementptr inbounds nuw i8, ptr %253, i64 184
  %575 = load float, ptr %574, align 1, !tbaa !16
  %576 = insertelement <8 x float> poison, float %575, i64 0
  %577 = shufflevector <8 x float> %576, <8 x float> poison, <8 x i32> zeroinitializer
  %578 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %577, <8 x float> %547, <8 x float> %538)
  %579 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %577, <8 x float> %549, <8 x float> %539)
  %580 = getelementptr inbounds nuw i8, ptr %253, i64 188
  %581 = load float, ptr %580, align 1, !tbaa !16
  %582 = insertelement <8 x float> poison, float %581, i64 0
  %583 = shufflevector <8 x float> %582, <8 x float> poison, <8 x i32> zeroinitializer
  %584 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %583, <8 x float> %547, <8 x float> %544)
  %585 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %583, <8 x float> %549, <8 x float> %545)
  %586 = getelementptr inbounds nuw i8, ptr %253, i64 192
  %587 = getelementptr inbounds nuw i8, ptr %254, i64 512
  %588 = add nuw nsw i64 %267, 1
  %589 = icmp eq i64 %588, 32
  br i1 %589, label %590, label %252, !llvm.loop !13

590:                                              ; preds = %252
  store <8 x float> %554, ptr %226, align 64, !tbaa !16
  %591 = getelementptr inbounds nuw i8, ptr %226, i64 32
  store <8 x float> %555, ptr %591, align 32, !tbaa !16
  %592 = getelementptr inbounds nuw i8, ptr %226, i64 64
  store <8 x float> %560, ptr %592, align 64, !tbaa !16
  %593 = getelementptr inbounds nuw i8, ptr %226, i64 96
  store <8 x float> %561, ptr %593, align 32, !tbaa !16
  %594 = getelementptr inbounds nuw i8, ptr %226, i64 128
  store <8 x float> %566, ptr %594, align 64, !tbaa !16
  %595 = getelementptr inbounds nuw i8, ptr %226, i64 160
  store <8 x float> %567, ptr %595, align 32, !tbaa !16
  %596 = getelementptr inbounds nuw i8, ptr %226, i64 192
  store <8 x float> %572, ptr %596, align 64, !tbaa !16
  %597 = getelementptr inbounds nuw i8, ptr %226, i64 224
  store <8 x float> %573, ptr %597, align 32, !tbaa !16
  %598 = getelementptr inbounds nuw i8, ptr %226, i64 256
  store <8 x float> %578, ptr %598, align 64, !tbaa !16
  %599 = getelementptr inbounds nuw i8, ptr %226, i64 288
  store <8 x float> %579, ptr %599, align 32, !tbaa !16
  %600 = getelementptr inbounds nuw i8, ptr %226, i64 320
  store <8 x float> %584, ptr %600, align 64, !tbaa !16
  %601 = getelementptr inbounds nuw i8, ptr %226, i64 352
  store <8 x float> %585, ptr %601, align 32, !tbaa !16
  %602 = add nuw nsw i64 %224, 1
  %603 = icmp eq i64 %602, 8
  br i1 %603, label %604, label %223, !llvm.loop !14

604:                                              ; preds = %590
  %605 = add nuw nsw i64 %220, 1
  %606 = icmp eq i64 %220, %58
  br i1 %606, label %custom_mmt4d_6x16x8.exit, label %219, !llvm.loop !15

custom_mmt4d_6x16x8.exit:                         ; preds = %604
  %607 = add nuw nsw i64 %48, 60
  %608 = icmp samesign ult i64 %48, 4036
  %indvars.iv.next = add nsw i64 %indvars.iv, -60
  br i1 %608, label %iree_uk_pad_and_pack_row_using_tile_func.exit26.preheader, label %609

609:                                              ; preds = %custom_mmt4d_6x16x8.exit
  %610 = add nuw nsw i64 %20, 256
  %611 = icmp samesign ult i64 %20, 3840
  br i1 %611, label %19, label %612

612:                                              ; preds = %609
  %613 = getelementptr inbounds nuw i8, ptr %10, i64 %18
  call void @llvm.lifetime.start.p0(ptr nonnull %4) #14
  store i32 8, ptr %16, align 64, !tbaa !148
  br label %iree_uk_unpack_row_using_tile_func.exit32

iree_uk_unpack_row_using_tile_func.exit32:        ; preds = %612, %iree_uk_unpack_tile_generic_direct.exit
  %614 = phi i64 [ 0, %612 ], [ %646, %iree_uk_unpack_tile_generic_direct.exit ]
  %615 = phi ptr [ %613, %612 ], [ %644, %iree_uk_unpack_tile_generic_direct.exit ]
  %616 = phi ptr [ %13, %612 ], [ %645, %iree_uk_unpack_tile_generic_direct.exit ]
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2450)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2452)
  br label %617

617:                                              ; preds = %639, %iree_uk_unpack_row_using_tile_func.exit32
  %618 = phi i64 [ %642, %639 ], [ 0, %iree_uk_unpack_row_using_tile_func.exit32 ]
  %619 = phi ptr [ %641, %639 ], [ %615, %iree_uk_unpack_row_using_tile_func.exit32 ]
  %620 = phi ptr [ %640, %639 ], [ %616, %iree_uk_unpack_row_using_tile_func.exit32 ]
  br label %621

621:                                              ; preds = %634, %617
  %622 = phi i64 [ 0, %617 ], [ %637, %634 ]
  %623 = phi ptr [ %619, %617 ], [ %636, %634 ]
  %624 = phi ptr [ %620, %617 ], [ %635, %634 ]
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2443)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2444)
  br label %.preheader.i262

.preheader.i262:                                  ; preds = %.preheader.i262, %621
  %625 = phi i64 [ %632, %.preheader.i262 ], [ 0, %621 ]
  %626 = getelementptr inbounds nuw i8, ptr %624, i64 %625
  %627 = getelementptr inbounds nuw i8, ptr %626, i64 16
  %628 = load <16 x i8>, ptr %626, align 1, !tbaa !16, !alias.scope !2453, !noalias !2454
  %629 = load <16 x i8>, ptr %627, align 1, !tbaa !16, !alias.scope !2453, !noalias !2454
  %630 = getelementptr inbounds nuw i8, ptr %623, i64 %625
  %631 = getelementptr inbounds nuw i8, ptr %630, i64 16
  store <16 x i8> %628, ptr %630, align 32, !tbaa !16, !alias.scope !2454, !noalias !2453
  store <16 x i8> %629, ptr %631, align 16, !tbaa !16, !alias.scope !2454, !noalias !2453
  %632 = add nuw nsw i64 %625, 32
  %633 = icmp eq i64 %632, 64
  br i1 %633, label %634, label %.preheader.i262, !llvm.loop !1516

634:                                              ; preds = %.preheader.i262
  %635 = getelementptr inbounds nuw i8, ptr %624, i64 64
  %636 = getelementptr inbounds nuw i8, ptr %623, i64 16384
  %637 = add nuw nsw i64 %622, 1
  %638 = icmp eq i64 %637, 6
  br i1 %638, label %639, label %621, !llvm.loop !1519

639:                                              ; preds = %634
  %640 = getelementptr inbounds nuw i8, ptr %620, i64 384
  %641 = getelementptr inbounds nuw i8, ptr %619, i64 64
  %642 = add nuw nsw i64 %618, 1
  %643 = icmp eq i64 %642, 8
  br i1 %643, label %iree_uk_unpack_tile_generic_direct.exit, label %617, !llvm.loop !1520

iree_uk_unpack_tile_generic_direct.exit:          ; preds = %639
  %644 = getelementptr inbounds nuw i8, ptr %615, i64 98304
  %645 = getelementptr inbounds nuw i8, ptr %616, i64 3072
  %646 = add nuw nsw i64 %614, 6
  %647 = icmp samesign ugt i64 %614, 4084
  br i1 %647, label %.preheader184, label %iree_uk_unpack_row_using_tile_func.exit32, !llvm.loop !1456

.preheader184:                                    ; preds = %iree_uk_unpack_tile_generic_direct.exit, %.loopexit182
  %648 = phi i64 [ %706, %.loopexit182 ], [ 0, %iree_uk_unpack_tile_generic_direct.exit ]
  %649 = sub nsw i64 8, %648
  %650 = load i32, ptr %16, align 64, !tbaa !148
  %651 = sext i32 %650 to i64
  %652 = tail call noundef i64 @llvm.smin.i64(i64 %651, i64 %649)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2467)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2469)
  %653 = icmp sgt i64 %652, 0
  br i1 %653, label %654, label %.loopexit182

654:                                              ; preds = %.preheader184
  %655 = mul i64 %648, 384
  %656 = getelementptr inbounds i8, ptr %645, i64 %655
  %657 = shl nuw nsw i64 %652, 6
  br label %658

658:                                              ; preds = %680, %654
  %659 = phi i64 [ %683, %680 ], [ 0, %654 ]
  %660 = phi ptr [ %682, %680 ], [ %4, %654 ]
  %661 = phi ptr [ %681, %680 ], [ %656, %654 ]
  br label %662

662:                                              ; preds = %675, %658
  %663 = phi i64 [ 0, %658 ], [ %678, %675 ]
  %664 = phi ptr [ %660, %658 ], [ %677, %675 ]
  %665 = phi ptr [ %661, %658 ], [ %676, %675 ]
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2460)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2461)
  br label %.preheader.i263

.preheader.i263:                                  ; preds = %.preheader.i263, %662
  %666 = phi i64 [ %673, %.preheader.i263 ], [ 0, %662 ]
  %667 = getelementptr inbounds nuw i8, ptr %665, i64 %666
  %668 = getelementptr inbounds nuw i8, ptr %667, i64 16
  %669 = load <16 x i8>, ptr %667, align 1, !tbaa !16, !alias.scope !2470, !noalias !2471
  %670 = load <16 x i8>, ptr %668, align 1, !tbaa !16, !alias.scope !2470, !noalias !2471
  %671 = getelementptr inbounds nuw i8, ptr %664, i64 %666
  %672 = getelementptr inbounds nuw i8, ptr %671, i64 16
  store <16 x i8> %669, ptr %671, align 1, !tbaa !16, !alias.scope !2471, !noalias !2470
  store <16 x i8> %670, ptr %672, align 1, !tbaa !16, !alias.scope !2471, !noalias !2470
  %673 = add nuw nsw i64 %666, 32
  %674 = icmp eq i64 %673, 64
  br i1 %674, label %675, label %.preheader.i263, !llvm.loop !1516

675:                                              ; preds = %.preheader.i263
  %676 = getelementptr inbounds nuw i8, ptr %665, i64 64
  %677 = getelementptr inbounds nuw i8, ptr %664, i64 %657
  %678 = add nuw nsw i64 %663, 1
  %679 = icmp eq i64 %678, 6
  br i1 %679, label %680, label %662, !llvm.loop !1519

680:                                              ; preds = %675
  %681 = getelementptr inbounds nuw i8, ptr %661, i64 384
  %682 = getelementptr inbounds nuw i8, ptr %660, i64 64
  %683 = add nuw nsw i64 %659, 1
  %684 = icmp eq i64 %683, %652
  br i1 %684, label %iree_uk_unpack_tile_generic_direct.exit264, label %658, !llvm.loop !1520

iree_uk_unpack_tile_generic_direct.exit264:       ; preds = %680
  %685 = shl i64 %648, 6
  %686 = getelementptr inbounds i8, ptr %644, i64 %685
  br label %687

687:                                              ; preds = %701, %iree_uk_unpack_tile_generic_direct.exit264
  %688 = phi i64 [ %704, %701 ], [ 0, %iree_uk_unpack_tile_generic_direct.exit264 ]
  %689 = phi ptr [ %703, %701 ], [ %4, %iree_uk_unpack_tile_generic_direct.exit264 ]
  %690 = phi ptr [ %702, %701 ], [ %686, %iree_uk_unpack_tile_generic_direct.exit264 ]
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2186)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2187)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2188)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2189)
  br label %691

691:                                              ; preds = %687, %691
  %692 = phi i64 [ %699, %691 ], [ 0, %687 ]
  %693 = getelementptr inbounds nuw i8, ptr %689, i64 %692
  %694 = getelementptr inbounds nuw i8, ptr %693, i64 16
  %695 = load <16 x i8>, ptr %693, align 1, !tbaa !16, !alias.scope !2190, !noalias !2191
  %696 = load <16 x i8>, ptr %694, align 1, !tbaa !16, !alias.scope !2190, !noalias !2191
  %697 = getelementptr inbounds nuw i8, ptr %690, i64 %692
  %698 = getelementptr inbounds nuw i8, ptr %697, i64 16
  store <16 x i8> %695, ptr %697, align 32, !tbaa !16, !alias.scope !2191, !noalias !2190
  store <16 x i8> %696, ptr %698, align 16, !tbaa !16, !alias.scope !2191, !noalias !2190
  %699 = add nuw nsw i64 %692, 32
  %700 = icmp eq i64 %699, %657
  br i1 %700, label %701, label %691, !llvm.loop !1464

701:                                              ; preds = %691
  %702 = getelementptr inbounds nuw i8, ptr %690, i64 16384
  %703 = getelementptr inbounds nuw i8, ptr %689, i64 %657
  %704 = add nuw nsw i64 %688, 1
  %705 = icmp eq i64 %704, 4
  br i1 %705, label %.loopexit182, label %687, !llvm.loop !1467

.loopexit182:                                     ; preds = %701, %.preheader184
  %706 = add nsw i64 %652, %648
  %707 = icmp slt i64 %706, 8
  br i1 %707, label %.preheader184, label %iree_uk_unpack_p.exit, !llvm.loop !1468

iree_uk_unpack_p.exit:                            ; preds = %.loopexit182
  call void @llvm.lifetime.end.p0(ptr nonnull %4) #14
  %708 = add nuw nsw i64 %17, 128
  %709 = icmp samesign ult i64 %17, 3968
  br i1 %709, label %.preheader187, label %710

710:                                              ; preds = %iree_uk_unpack_p.exit
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
!1456 = distinct !{!1456, !18}
!1464 = distinct !{!1464, !18, !107, !108}
!1467 = distinct !{!1467, !18}
!1468 = distinct !{!1468, !18}
!1516 = distinct !{!1516, !18, !107, !108}
!1519 = distinct !{!1519, !18}
!1520 = distinct !{!1520, !18}
!1540 = !{!1541, !1542}
!1541 = distinct !{!1541, !1543, !"tile: argument 1"}
!1542 = distinct !{!1542, !1543, !"tile: argument 2"}
!1543 = distinct !{!1543, !"tile"}
!1587 = !{!1628}
!1588 = !{!1611}
!1589 = !{!1615}
!1590 = !{!1625}
!1591 = !{!1627}
!1592 = !{!1627, !1615}
!1593 = !{!1625, !1611}
!1611 = distinct !{!1611, !1612, !"iree_uk_copy_1d_strided_to_unstrided: argument 0"}
!1612 = distinct !{!1612, !"iree_uk_copy_1d_strided_to_unstrided"}
!1615 = distinct !{!1615, !1612, !"iree_uk_copy_1d_strided_to_unstrided: argument 1"}
!1625 = distinct !{!1625, !1626, !"iree_uk_memcpy: argument 0"}
!1626 = distinct !{!1626, !"iree_uk_memcpy"}
!1627 = distinct !{!1627, !1626, !"iree_uk_memcpy: argument 1"}
!1628 = distinct !{!1628, !1629, !"iree_uk_fill: argument 0"}
!1629 = distinct !{!1629, !"iree_uk_fill"}
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
!2402 = !{!2394, !2400}
!2403 = !{!2396, !2398}
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
!2419 = !{!2413, !2415}
!2420 = !{!2411, !2417}
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
!2436 = !{!2430, !2432}
!2437 = !{!2428, !2434}
!2443 = !{!2447}
!2444 = !{!2445}
!2445 = distinct !{!2445, !2446, !"iree_uk_memcpy: argument 1"}
!2446 = distinct !{!2446, !"iree_uk_memcpy"}
!2447 = distinct !{!2447, !2446, !"iree_uk_memcpy: argument 0"}
!2448 = distinct !{!2448, !"iree_uk_unpack_tile_generic_direct"}
!2449 = distinct !{!2449, !2448, !"iree_uk_unpack_tile_generic_direct: argument 0"}
!2450 = !{!2449}
!2451 = distinct !{!2451, !2448, !"iree_uk_unpack_tile_generic_direct: argument 1"}
!2452 = !{!2451}
!2453 = !{!2445, !2451}
!2454 = !{!2447, !2449}
!2460 = !{!2464}
!2461 = !{!2462}
!2462 = distinct !{!2462, !2463, !"iree_uk_memcpy: argument 1"}
!2463 = distinct !{!2463, !"iree_uk_memcpy"}
!2464 = distinct !{!2464, !2463, !"iree_uk_memcpy: argument 0"}
!2465 = distinct !{!2465, !"iree_uk_unpack_tile_generic_direct"}
!2466 = distinct !{!2466, !2465, !"iree_uk_unpack_tile_generic_direct: argument 0"}
!2467 = !{!2466}
!2468 = distinct !{!2468, !2465, !"iree_uk_unpack_tile_generic_direct: argument 1"}
!2469 = !{!2468}
!2470 = !{!2462, !2468}
!2471 = !{!2464, !2466}
