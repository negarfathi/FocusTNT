; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@"'flag" = global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @ff_subtitles_next_line_slice_1() #0 {
ff_subtitles_next_line_slice_1_bb0:
  %"0" = load i32* @"'flag", align 4, !dbg !17
  %"1" = icmp eq i32 %"0", 1, !dbg !17
  br i1 %"1", label %ff_subtitles_next_line_slice_1_bb2, label %ff_subtitles_next_line_slice_1_bb1, !dbg !17

ff_subtitles_next_line_slice_1_bb1:               ; preds = %ff_subtitles_next_line_slice_1_bb0
  store i32 1, i32* @"'flag", align 4, !dbg !19
  call void @llvm.dbg.value(metadata !20, i64 0, metadata !21), !dbg !22
  br label %ff_subtitles_next_line_slice_1_bb2, !dbg !23

ff_subtitles_next_line_slice_1_bb2:               ; preds = %ff_subtitles_next_line_slice_1_bb0, %ff_subtitles_next_line_slice_1_bb1
  ret i32 0, !dbg !24
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb3:
  call void @llvm.dbg.value(metadata !25, i64 0, metadata !26), !dbg !27
  call void @llvm.dbg.value(metadata !28, i64 0, metadata !29), !dbg !30
  %"2" = icmp slt i32 1, 0, !dbg !31
  %"3" = icmp slt i32 10, 0, !dbg !33
  %or.cond = or i1 %"2", %"3", !dbg !31
  br i1 %or.cond, label %main_bb7, label %main_bb4, !dbg !31

main_bb4:                                         ; preds = %main_bb3, %main_ff_subtitles_next_line_slice_1.exit
  %b.0 = phi i32 [ %"7", %main_ff_subtitles_next_line_slice_1.exit ], [ 1, %main_bb3 ]
  %"4" = icmp slt i32 %b.0, 10, !dbg !35
  br i1 %"4", label %main_bb5, label %main_bb7, !dbg !35

main_bb5:                                         ; preds = %main_bb4
  %"5" = load i32* @"'flag", align 4, !dbg !37
  %"6" = icmp eq i32 %"5", 1, !dbg !37
  br i1 %"6", label %main_ff_subtitles_next_line_slice_1.exit, label %main_bb6, !dbg !37

main_bb6:                                         ; preds = %main_bb5
  store i32 1, i32* @"'flag", align 4, !dbg !40
  br label %main_ff_subtitles_next_line_slice_1.exit, !dbg !41

main_ff_subtitles_next_line_slice_1.exit:         ; preds = %main_bb5, %main_bb6
  %"7" = add nsw i32 %b.0, 0, !dbg !42
  %"8" = sub nsw i32 10, 4, !dbg !43
  %"9" = icmp sge i32 %"7", %"8", !dbg !43
  br i1 %"9", label %main_bb7, label %main_bb4, !dbg !43

main_bb7:                                         ; preds = %main_bb4, %main_ff_subtitles_next_line_slice_1.exit, %main_bb3
  ret void, !dbg !45
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
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"ff_subtitles_next_line_slice_1", metadata !"ff_subtitles_next_line_slice_1", metadata !"", i32 3, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @ff_subtitles_next_line_slice_1, null, null, metadata !2, i32 4} ; [ DW_TAG_subprogram ] [line 3] [def] [scope 4] [ff_subtitles_next_line_slice_1]
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
!17 = metadata !{i32 6, i32 7, metadata !18, null}
!18 = metadata !{i32 786443, metadata !1, metadata !4, i32 6, i32 7, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!19 = metadata !{i32 10, i32 3, metadata !4, null}
!20 = metadata !{i32 0}
!21 = metadata !{i32 786688, metadata !4, metadata !"__retres", metadata !5, i32 5, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__retres] [line 5]
!22 = metadata !{i32 5, i32 7, metadata !4, null}
!23 = metadata !{i32 11, i32 3, metadata !4, null}
!24 = metadata !{i32 12, i32 17, metadata !4, null}
!25 = metadata !{i32 1}
!26 = metadata !{i32 786688, metadata !9, metadata !"b", metadata !5, i32 17, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 17]
!27 = metadata !{i32 17, i32 7, metadata !9, null}
!28 = metadata !{i32 10}
!29 = metadata !{i32 786688, metadata !9, metadata !"end", metadata !5, i32 18, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [end] [line 18]
!30 = metadata !{i32 18, i32 7, metadata !9, null}
!31 = metadata !{i32 19, i32 7, metadata !32, null}
!32 = metadata !{i32 786443, metadata !1, metadata !9, i32 19, i32 7, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!33 = metadata !{i32 21, i32 9, metadata !34, null}
!34 = metadata !{i32 786443, metadata !1, metadata !32, i32 21, i32 9, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!35 = metadata !{i32 22, i32 3, metadata !36, null}
!36 = metadata !{i32 786443, metadata !1, metadata !9, i32 22, i32 3, i32 1, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!37 = metadata !{i32 6, i32 7, metadata !18, metadata !38}
!38 = metadata !{i32 24, i32 11, metadata !39, null}
!39 = metadata !{i32 786443, metadata !1, metadata !9, i32 22, i32 19, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!40 = metadata !{i32 10, i32 3, metadata !4, metadata !38}
!41 = metadata !{i32 11, i32 3, metadata !4, metadata !38}
!42 = metadata !{i32 25, i32 5, metadata !39, null}
!43 = metadata !{i32 26, i32 9, metadata !44, null}
!44 = metadata !{i32 786443, metadata !1, metadata !39, i32 26, i32 9, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!45 = metadata !{i32 28, i32 17, metadata !9, null}

