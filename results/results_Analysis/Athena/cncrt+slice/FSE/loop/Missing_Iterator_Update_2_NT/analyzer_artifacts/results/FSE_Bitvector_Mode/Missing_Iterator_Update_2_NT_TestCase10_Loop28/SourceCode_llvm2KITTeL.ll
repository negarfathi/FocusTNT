; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@"'flag" = global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @mdb_cursor_get_slice_1() #0 {
mdb_cursor_get_slice_1_bb0:
  %"0" = load i32* @"'flag", align 4, !dbg !17
  %"1" = add nsw i32 %"0", 1, !dbg !17
  store i32 %"1", i32* @"'flag", align 4, !dbg !17
  %"2" = load i32* @"'flag", align 4, !dbg !18
  %"3" = icmp sgt i32 %"2", 1000, !dbg !18
  %. = select i1 %"3", i32 1, i32 0, !dbg !20
  ret i32 %., !dbg !22
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb1:
  %"4" = load i32* @"'flag", align 4, !dbg !23
  %"5" = add nsw i32 %"4", 1, !dbg !23
  store i32 %"5", i32* @"'flag", align 4, !dbg !23
  %"6" = load i32* @"'flag", align 4, !dbg !25
  call void @llvm.dbg.value(metadata !{i32 %..i}, i64 0, metadata !26), !dbg !27
  br label %main_bb2, !dbg !28

main_bb2:                                         ; preds = %main_bb3, %main_bb1
  %.sink2 = phi i32 [ %"6", %main_bb1 ], [ %"11", %main_bb3 ]
  %"7" = icmp sgt i32 %.sink2, 1000, !dbg !25
  %..i = select i1 %"7", i32 1, i32 0, !dbg !29
  %"8" = icmp eq i32 %..i, 0, !dbg !30
  br i1 %"8", label %main_bb3, label %main_bb4, !dbg !30

main_bb3:                                         ; preds = %main_bb2
  %"9" = load i32* @"'flag", align 4, !dbg !33
  %"10" = add nsw i32 %"9", 1, !dbg !33
  store i32 %"10", i32* @"'flag", align 4, !dbg !33
  %"11" = load i32* @"'flag", align 4, !dbg !36
  br label %main_bb2, !dbg !34

main_bb4:                                         ; preds = %main_bb2
  ret void, !dbg !37
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
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"mdb_cursor_get_slice_1", metadata !"mdb_cursor_get_slice_1", metadata !"", i32 3, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @mdb_cursor_get_slice_1, null, null, metadata !2, i32 4} ; [ DW_TAG_subprogram ] [line 3] [def] [scope 4] [mdb_cursor_get_slice_1]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 15, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @main, null, null, metadata !2, i32 16} ; [ DW_TAG_subprogram ] [line 15] [def] [scope 16] [main]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{null}
!12 = metadata !{metadata !13}
!13 = metadata !{i32 786484, i32 0, null, metadata !"flag", metadata !"flag", metadata !"", metadata !5, i32 2, metadata !8, i32 0, i32 1, i32* @"'flag", null} ; [ DW_TAG_variable ] [flag] [line 2] [def]
!14 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!15 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!16 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!17 = metadata !{i32 6, i32 3, metadata !4, null}
!18 = metadata !{i32 7, i32 7, metadata !19, null}
!19 = metadata !{i32 786443, metadata !1, metadata !4, i32 7, i32 7, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!20 = metadata !{i32 9, i32 5, metadata !21, null}
!21 = metadata !{i32 786443, metadata !1, metadata !19, i32 7, i32 20, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!22 = metadata !{i32 12, i32 17, metadata !4, null}
!23 = metadata !{i32 6, i32 3, metadata !4, metadata !24}
!24 = metadata !{i32 18, i32 8, metadata !9, null}
!25 = metadata !{i32 7, i32 7, metadata !19, metadata !24}
!26 = metadata !{i32 786688, metadata !9, metadata !"rc", metadata !5, i32 17, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rc] [line 17]
!27 = metadata !{i32 17, i32 7, metadata !9, null}
!28 = metadata !{i32 19, i32 3, metadata !9, null}
!29 = metadata !{i32 9, i32 5, metadata !21, metadata !24}
!30 = metadata !{i32 19, i32 3, metadata !31, null}
!31 = metadata !{i32 786443, metadata !1, metadata !32, i32 19, i32 3, i32 3, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!32 = metadata !{i32 786443, metadata !1, metadata !9, i32 19, i32 3, i32 1, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!33 = metadata !{i32 6, i32 3, metadata !4, metadata !34}
!34 = metadata !{i32 19, i32 24, metadata !35, null}
!35 = metadata !{i32 786443, metadata !1, metadata !9, i32 19, i32 24, i32 2, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!36 = metadata !{i32 7, i32 7, metadata !19, metadata !34}
!37 = metadata !{i32 20, i32 3, metadata !9, null}

