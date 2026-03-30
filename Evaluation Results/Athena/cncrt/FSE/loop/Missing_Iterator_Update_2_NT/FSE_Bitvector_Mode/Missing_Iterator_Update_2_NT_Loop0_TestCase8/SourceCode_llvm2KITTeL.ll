; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@"'flag" = global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @mdb_cursor_get() #0 {
mdb_cursor_get_bb0:
  call void @llvm.dbg.value(metadata !15, i64 0, metadata !16), !dbg !17
  %"0" = load i32* @"'flag", align 4, !dbg !18
  %"1" = add nsw i32 %"0", 1, !dbg !18
  store i32 %"1", i32* @"'flag", align 4, !dbg !18
  %"2" = load i32* @"'flag", align 4, !dbg !19
  %"3" = icmp sgt i32 %"2", 1000, !dbg !19
  br i1 %"3", label %mdb_cursor_get_bb2, label %mdb_cursor_get_bb1, !dbg !19

mdb_cursor_get_bb1:                               ; preds = %mdb_cursor_get_bb0
  %"4" = icmp sge i32 5, 0, !dbg !21
  %. = select i1 %"4", i32 0, i32 1, !dbg !23
  br label %mdb_cursor_get_bb2, !dbg !23

mdb_cursor_get_bb2:                               ; preds = %mdb_cursor_get_bb1, %mdb_cursor_get_bb0
  %.0 = phi i32 [ 1, %mdb_cursor_get_bb0 ], [ %., %mdb_cursor_get_bb1 ]
  ret i32 %.0, !dbg !24
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
main_mdb_cursor_get.exit:
  call void @llvm.dbg.value(metadata !15, i64 0, metadata !25), !dbg !27
  %"5" = load i32* @"'flag", align 4, !dbg !28
  %"6" = add nsw i32 %"5", 1, !dbg !28
  store i32 %"6", i32* @"'flag", align 4, !dbg !28
  %"7" = load i32* @"'flag", align 4, !dbg !29
  %"8" = icmp sgt i32 %"7", 1000, !dbg !29
  %. = select i1 %"8", i32 1, i32 0, !dbg !29
  call void @llvm.dbg.value(metadata !{i32 %.}, i64 0, metadata !30), !dbg !31
  call void @llvm.dbg.value(metadata !32, i64 0, metadata !33), !dbg !34
  call void @llvm.dbg.value(metadata !15, i64 0, metadata !35), !dbg !38
  call void @llvm.dbg.value(metadata !{i32 %.3}, i64 0, metadata !30), !dbg !31
  br label %main_bb3, !dbg !39

main_bb3:                                         ; preds = %main_bb4, %main_mdb_cursor_get.exit2, %main_mdb_cursor_get.exit
  %rc.0 = phi i32 [ %., %main_mdb_cursor_get.exit ], [ %.3, %main_mdb_cursor_get.exit2 ], [ %rc.0, %main_bb4 ]
  %"9" = icmp eq i32 %rc.0, 0, !dbg !40
  br i1 %"9", label %main_bb4, label %main_bb5, !dbg !40

main_bb4:                                         ; preds = %main_bb3
  %"10" = icmp sle i32 -5, 0, !dbg !42
  br i1 %"10", label %main_bb3, label %main_mdb_cursor_get.exit2, !dbg !42

main_mdb_cursor_get.exit2:                        ; preds = %main_bb4
  %"11" = load i32* @"'flag", align 4, !dbg !44
  %"12" = add nsw i32 %"11", 1, !dbg !44
  store i32 %"12", i32* @"'flag", align 4, !dbg !44
  %"13" = load i32* @"'flag", align 4, !dbg !45
  %"14" = icmp sgt i32 %"13", 1000, !dbg !45
  %.3 = select i1 %"14", i32 1, i32 0, !dbg !45
  br label %main_bb3, !dbg !46

main_bb5:                                         ; preds = %main_bb3
  ret i32 0, !dbg !47
}

declare i32 @__kittel_nondef.0()

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13}
!llvm.ident = !{!14}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !10, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [//FILES_DIR/SourceCode_SemanticAugmentor.c] [DW_LANG_C99]
!1 = metadata !{metadata !"FILES_DIR/SourceCode_SemanticAugmentor.c", metadata !"/"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"mdb_cursor_get", metadata !"mdb_cursor_get", metadata !"", i32 10, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @mdb_cursor_get, null, null, metadata !2, i32 11} ; [ DW_TAG_subprogram ] [line 10] [def] [scope 11] [mdb_cursor_get]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 22, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 23} ; [ DW_TAG_subprogram ] [line 22] [def] [scope 23] [main]
!10 = metadata !{metadata !11}
!11 = metadata !{i32 786484, i32 0, null, metadata !"flag", metadata !"flag", metadata !"", metadata !5, i32 9, metadata !8, i32 0, i32 1, i32* @"'flag", null} ; [ DW_TAG_variable ] [flag] [line 9] [def]
!12 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!13 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!14 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!15 = metadata !{i32 5}
!16 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 12, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 12]
!17 = metadata !{i32 12, i32 9, metadata !4, null}
!18 = metadata !{i32 13, i32 5, metadata !4, null}
!19 = metadata !{i32 14, i32 9, metadata !20, null}
!20 = metadata !{i32 786443, metadata !1, metadata !4, i32 14, i32 9, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!21 = metadata !{i32 16, i32 9, metadata !22, null}
!22 = metadata !{i32 786443, metadata !1, metadata !4, i32 16, i32 9, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!23 = metadata !{i32 17, i32 9, metadata !22, null}
!24 = metadata !{i32 20, i32 1, metadata !4, null}
!25 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 12, metadata !8, i32 0, metadata !26} ; [ DW_TAG_auto_variable ] [i] [line 12]
!26 = metadata !{i32 25, i32 10, metadata !9, null}
!27 = metadata !{i32 12, i32 9, metadata !4, metadata !26}
!28 = metadata !{i32 13, i32 5, metadata !4, metadata !26}
!29 = metadata !{i32 14, i32 9, metadata !20, metadata !26}
!30 = metadata !{i32 786688, metadata !9, metadata !"rc", metadata !5, i32 24, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rc] [line 24]
!31 = metadata !{i32 24, i32 9, metadata !9, null}
!32 = metadata !{i32 -5}
!33 = metadata !{i32 786688, metadata !9, metadata !"dval_mv_size", metadata !5, i32 26, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dval_mv_size] [line 26]
!34 = metadata !{i32 26, i32 9, metadata !9, null}
!35 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 12, metadata !8, i32 0, metadata !36} ; [ DW_TAG_auto_variable ] [i] [line 12]
!36 = metadata !{i32 31, i32 14, metadata !37, null}
!37 = metadata !{i32 786443, metadata !1, metadata !9, i32 28, i32 5, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!38 = metadata !{i32 12, i32 9, metadata !4, metadata !36}
!39 = metadata !{i32 27, i32 5, metadata !9, null}
!40 = metadata !{i32 27, i32 5, metadata !41, null}
!41 = metadata !{i32 786443, metadata !1, metadata !9, i32 27, i32 5, i32 1, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!42 = metadata !{i32 29, i32 13, metadata !43, null}
!43 = metadata !{i32 786443, metadata !1, metadata !37, i32 29, i32 13, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!44 = metadata !{i32 13, i32 5, metadata !4, metadata !36}
!45 = metadata !{i32 14, i32 9, metadata !20, metadata !36}
!46 = metadata !{i32 32, i32 5, metadata !37, null}
!47 = metadata !{i32 33, i32 5, metadata !9, null}

