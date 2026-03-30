; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@"'flag" = global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @mdb_cursor_get_slice_1() #0 {
mdb_cursor_get_slice_1_bb0:
  call void @llvm.dbg.value(metadata !17, i64 0, metadata !18), !dbg !19
  %"0" = load i32* @"'flag", align 4, !dbg !20
  %"1" = add nsw i32 %"0", 1, !dbg !20
  store i32 %"1", i32* @"'flag", align 4, !dbg !20
  %"2" = load i32* @"'flag", align 4, !dbg !21
  %"3" = icmp sgt i32 %"2", 1000, !dbg !21
  br i1 %"3", label %mdb_cursor_get_slice_1_bb2, label %mdb_cursor_get_slice_1_bb1, !dbg !21

mdb_cursor_get_slice_1_bb1:                       ; preds = %mdb_cursor_get_slice_1_bb0
  %"4" = icmp sge i32 0, 0, !dbg !23
  %. = select i1 %"4", i32 0, i32 1, !dbg !25
  br label %mdb_cursor_get_slice_1_bb2, !dbg !27

mdb_cursor_get_slice_1_bb2:                       ; preds = %mdb_cursor_get_slice_1_bb0, %mdb_cursor_get_slice_1_bb1
  %__retres.1 = phi i32 [ %., %mdb_cursor_get_slice_1_bb1 ], [ 1, %mdb_cursor_get_slice_1_bb0 ]
  ret i32 %__retres.1, !dbg !29
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_mdb_cursor_get_slice_1.exit:
  call void @llvm.dbg.value(metadata !17, i64 0, metadata !30), !dbg !32
  %"5" = load i32* @"'flag", align 4, !dbg !33
  %"6" = add nsw i32 %"5", 1, !dbg !33
  store i32 %"6", i32* @"'flag", align 4, !dbg !33
  %"7" = load i32* @"'flag", align 4, !dbg !34
  call void @llvm.dbg.value(metadata !{i32 %.}, i64 0, metadata !35), !dbg !36
  call void @llvm.dbg.value(metadata !37, i64 0, metadata !38), !dbg !39
  call void @llvm.dbg.value(metadata !17, i64 0, metadata !40), !dbg !45
  call void @llvm.dbg.value(metadata !17, i64 0, metadata !46), !dbg !48
  br label %main_bb3, !dbg !49

main_bb3:                                         ; preds = %main_bb4, %main_mdb_cursor_get_slice_1.exit
  %.sink7 = phi i32 [ %"7", %main_mdb_cursor_get_slice_1.exit ], [ %"12", %main_bb4 ]
  %"8" = icmp sgt i32 %.sink7, 1000, !dbg !34
  %. = select i1 %"8", i32 1, i32 0, !dbg !34
  %"9" = icmp eq i32 %., 0, !dbg !50
  br i1 %"9", label %main_bb4, label %main_bb5, !dbg !50

main_bb4:                                         ; preds = %main_bb3
  %"10" = load i32* @"'flag", align 4, !dbg !52
  %"11" = add nsw i32 %"10", 1, !dbg !52
  store i32 %"11", i32* @"'flag", align 4, !dbg !52
  %"12" = load i32* @"'flag", align 4, !dbg !53
  br label %main_bb3, !dbg !54

main_bb5:                                         ; preds = %main_bb3
  ret void, !dbg !55
}

declare i32 @__kittel_nondef.0()

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!14, !15}
!llvm.ident = !{!16}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !12, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [//FILES_DIR/SourceCode_SemanticAugmentor.c] [DW_LANG_C99]
!1 = metadata !{metadata !"FILES_DIR/SourceCode_SemanticAugmentor.c", metadata !"/"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"mdb_cursor_get_slice_1", metadata !"mdb_cursor_get_slice_1", metadata !"", i32 6, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @mdb_cursor_get_slice_1, null, null, metadata !2, i32 7} ; [ DW_TAG_subprogram ] [line 6] [def] [scope 7] [mdb_cursor_get_slice_1]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 19, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @main, null, null, metadata !2, i32 20} ; [ DW_TAG_subprogram ] [line 19] [def] [scope 20] [main]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{null}
!12 = metadata !{metadata !13}
!13 = metadata !{i32 786484, i32 0, null, metadata !"flag", metadata !"flag", metadata !"", metadata !5, i32 5, metadata !8, i32 0, i32 1, i32* @"'flag", null} ; [ DW_TAG_variable ] [flag] [line 5] [def]
!14 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!15 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!16 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!17 = metadata !{i32 0}
!18 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 9, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 9]
!19 = metadata !{i32 9, i32 7, metadata !4, null}
!20 = metadata !{i32 10, i32 3, metadata !4, null}
!21 = metadata !{i32 11, i32 7, metadata !22, null}
!22 = metadata !{i32 786443, metadata !1, metadata !4, i32 11, i32 7, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!23 = metadata !{i32 15, i32 7, metadata !24, null}
!24 = metadata !{i32 786443, metadata !1, metadata !4, i32 15, i32 7, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!25 = metadata !{i32 15, i32 15, metadata !26, null}
!26 = metadata !{i32 786443, metadata !1, metadata !24, i32 15, i32 15, i32 1, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!27 = metadata !{i32 15, i32 12, metadata !28, null}
!28 = metadata !{i32 786443, metadata !1, metadata !24, i32 15, i32 12, i32 3, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!29 = metadata !{i32 16, i32 17, metadata !4, null}
!30 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 9, metadata !8, i32 0, metadata !31} ; [ DW_TAG_auto_variable ] [i] [line 9]
!31 = metadata !{i32 22, i32 8, metadata !9, null}
!32 = metadata !{i32 9, i32 7, metadata !4, metadata !31}
!33 = metadata !{i32 10, i32 3, metadata !4, metadata !31}
!34 = metadata !{i32 11, i32 7, metadata !22, metadata !31}
!35 = metadata !{i32 786688, metadata !9, metadata !"rc", metadata !5, i32 21, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rc] [line 21]
!36 = metadata !{i32 21, i32 7, metadata !9, null}
!37 = metadata !{i32 1}
!38 = metadata !{i32 786688, metadata !9, metadata !"dval_mv_size", metadata !5, i32 23, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dval_mv_size] [line 23]
!39 = metadata !{i32 23, i32 7, metadata !9, null}
!40 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 9, metadata !8, i32 0, metadata !41} ; [ DW_TAG_auto_variable ] [i] [line 9]
!41 = metadata !{i32 26, i32 12, metadata !42, null}
!42 = metadata !{i32 786443, metadata !1, metadata !43, i32 25, i32 28, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!43 = metadata !{i32 786443, metadata !1, metadata !44, i32 25, i32 9, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!44 = metadata !{i32 786443, metadata !1, metadata !9, i32 24, i32 19, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!45 = metadata !{i32 9, i32 7, metadata !4, metadata !41}
!46 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 9, metadata !8, i32 0, metadata !47} ; [ DW_TAG_auto_variable ] [i] [line 9]
!47 = metadata !{i32 29, i32 10, metadata !44, null}
!48 = metadata !{i32 9, i32 7, metadata !4, metadata !47}
!49 = metadata !{i32 24, i32 3, metadata !9, null}
!50 = metadata !{i32 24, i32 3, metadata !51, null}
!51 = metadata !{i32 786443, metadata !1, metadata !9, i32 24, i32 3, i32 1, i32 9} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!52 = metadata !{i32 10, i32 3, metadata !4, metadata !41}
!53 = metadata !{i32 11, i32 7, metadata !22, metadata !41}
!54 = metadata !{i32 27, i32 7, metadata !42, null}
!55 = metadata !{i32 31, i32 3, metadata !9, null}

