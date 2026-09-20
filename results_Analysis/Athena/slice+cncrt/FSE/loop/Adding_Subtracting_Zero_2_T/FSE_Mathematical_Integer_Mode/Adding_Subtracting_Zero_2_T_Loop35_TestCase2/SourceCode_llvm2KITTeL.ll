; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@"'flag" = global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @ff_subtitles_next_line_slice_1() #0 {
ff_subtitles_next_line_slice_1_bb0:
  call void @llvm.dbg.value(metadata !17, i64 0, metadata !18), !dbg !19
  %"0" = srem i32 5, 1000, !dbg !20
  call void @llvm.dbg.value(metadata !{i32 %"0"}, i64 0, metadata !18), !dbg !19
  %"1" = load i32* @"'flag", align 4, !dbg !21
  %"2" = icmp eq i32 %"1", 1, !dbg !21
  br i1 %"2", label %ff_subtitles_next_line_slice_1_bb4, label %ff_subtitles_next_line_slice_1_bb1, !dbg !21

ff_subtitles_next_line_slice_1_bb1:               ; preds = %ff_subtitles_next_line_slice_1_bb0
  %"3" = icmp eq i32 %"0", 0, !dbg !23
  br i1 %"3", label %ff_subtitles_next_line_slice_1_bb2, label %ff_subtitles_next_line_slice_1_bb3, !dbg !23

ff_subtitles_next_line_slice_1_bb2:               ; preds = %ff_subtitles_next_line_slice_1_bb1
  store i32 1, i32* @"'flag", align 4, !dbg !25
  call void @llvm.dbg.value(metadata !27, i64 0, metadata !28), !dbg !29
  br label %ff_subtitles_next_line_slice_1_bb4, !dbg !30

ff_subtitles_next_line_slice_1_bb3:               ; preds = %ff_subtitles_next_line_slice_1_bb1
  %"4" = icmp slt i32 %"0", 0, !dbg !31
  %"5" = sub nsw i32 0, %"0", !dbg !33
  call void @llvm.dbg.value(metadata !{i32 %"5"}, i64 0, metadata !28), !dbg !29
  %__retres.0 = select i1 %"4", i32 %"5", i32 %"0", !dbg !31
  br label %ff_subtitles_next_line_slice_1_bb4, !dbg !31

ff_subtitles_next_line_slice_1_bb4:               ; preds = %ff_subtitles_next_line_slice_1_bb2, %ff_subtitles_next_line_slice_1_bb3, %ff_subtitles_next_line_slice_1_bb0
  %__retres.2 = phi i32 [ 0, %ff_subtitles_next_line_slice_1_bb0 ], [ 0, %ff_subtitles_next_line_slice_1_bb2 ], [ %__retres.0, %ff_subtitles_next_line_slice_1_bb3 ]
  ret i32 %__retres.2, !dbg !35
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb5:
  call void @llvm.dbg.value(metadata !36, i64 0, metadata !37), !dbg !38
  call void @llvm.dbg.value(metadata !17, i64 0, metadata !39), !dbg !40
  %"6" = icmp slt i32 10, 0, !dbg !41
  %"7" = icmp slt i32 5, 0, !dbg !43
  %or.cond = or i1 %"6", %"7", !dbg !41
  br i1 %or.cond, label %main_bb9, label %main_bb6, !dbg !41

main_bb6:                                         ; preds = %main_bb5
  call void @llvm.dbg.value(metadata !17, i64 0, metadata !45), !dbg !48
  call void @llvm.dbg.value(metadata !17, i64 0, metadata !45), !dbg !48
  %"8" = load i32* @"'flag", align 4, !dbg !49
  call void @llvm.dbg.value(metadata !{i32 %.}, i64 0, metadata !50), !dbg !51
  call void @llvm.dbg.value(metadata !{i32 %"12"}, i64 0, metadata !37), !dbg !38
  call void @llvm.dbg.value(metadata !52, i64 0, metadata !53), !dbg !54
  br label %main_bb7, !dbg !55

main_bb7:                                         ; preds = %main_bb8, %main_bb6
  %b.0 = phi i32 [ 10, %main_bb6 ], [ %"12", %main_bb8 ]
  %"9" = icmp slt i32 %b.0, 5, !dbg !56
  br i1 %"9", label %main_ff_subtitles_next_line_slice_1.exit, label %main_bb9, !dbg !56

main_ff_subtitles_next_line_slice_1.exit:         ; preds = %main_bb7
  %"10" = icmp eq i32 %"8", 1, !dbg !49
  %. = select i1 %"10", i32 0, i32 5, !dbg !49
  %"11" = icmp ne i32 %., 0, !dbg !58
  br i1 %"11", label %main_bb8, label %main_bb9, !dbg !58

main_bb8:                                         ; preds = %main_ff_subtitles_next_line_slice_1.exit
  %"12" = add nsw i32 %b.0, %., !dbg !60
  %"13" = sub nsw i32 5, 4, !dbg !61
  %"14" = icmp sge i32 %"12", %"13", !dbg !61
  br i1 %"14", label %main_bb9, label %main_bb7, !dbg !61

main_bb9:                                         ; preds = %main_bb7, %main_ff_subtitles_next_line_slice_1.exit, %main_bb8, %main_bb5
  ret void, !dbg !63
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
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"ff_subtitles_next_line_slice_1", metadata !"ff_subtitles_next_line_slice_1", metadata !"", i32 6, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @ff_subtitles_next_line_slice_1, null, null, metadata !2, i32 7} ; [ DW_TAG_subprogram ] [line 6] [def] [scope 7] [ff_subtitles_next_line_slice_1]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 24, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @main, null, null, metadata !2, i32 25} ; [ DW_TAG_subprogram ] [line 24] [def] [scope 25] [main]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{null}
!12 = metadata !{metadata !13}
!13 = metadata !{i32 786484, i32 0, null, metadata !"flag", metadata !"flag", metadata !"", metadata !5, i32 5, metadata !8, i32 0, i32 1, i32* @"'flag", null} ; [ DW_TAG_variable ] [flag] [line 5] [def]
!14 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!15 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!16 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!17 = metadata !{i32 5}
!18 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 9, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 9]
!19 = metadata !{i32 9, i32 7, metadata !4, null}
!20 = metadata !{i32 10, i32 3, metadata !4, null}
!21 = metadata !{i32 11, i32 7, metadata !22, null}
!22 = metadata !{i32 786443, metadata !1, metadata !4, i32 11, i32 7, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!23 = metadata !{i32 15, i32 7, metadata !24, null}
!24 = metadata !{i32 786443, metadata !1, metadata !4, i32 15, i32 7, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!25 = metadata !{i32 16, i32 5, metadata !26, null}
!26 = metadata !{i32 786443, metadata !1, metadata !24, i32 15, i32 15, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!27 = metadata !{i32 0}
!28 = metadata !{i32 786688, metadata !4, metadata !"__retres", metadata !5, i32 8, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__retres] [line 8]
!29 = metadata !{i32 8, i32 7, metadata !4, null} ; [ DW_TAG_imported_declaration ]
!30 = metadata !{i32 18, i32 3, metadata !26, null}
!31 = metadata !{i32 20, i32 9, metadata !32, null}
!32 = metadata !{i32 786443, metadata !1, metadata !24, i32 20, i32 9, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!33 = metadata !{i32 20, i32 16, metadata !34, null}
!34 = metadata !{i32 786443, metadata !1, metadata !32, i32 20, i32 16, i32 1, i32 14} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!35 = metadata !{i32 21, i32 17, metadata !4, null}
!36 = metadata !{i32 10}
!37 = metadata !{i32 786688, metadata !9, metadata !"b", metadata !5, i32 27, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 27]
!38 = metadata !{i32 27, i32 7, metadata !9, null}
!39 = metadata !{i32 786688, metadata !9, metadata !"end", metadata !5, i32 28, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [end] [line 28]
!40 = metadata !{i32 28, i32 7, metadata !9, null}
!41 = metadata !{i32 29, i32 7, metadata !42, null}
!42 = metadata !{i32 786443, metadata !1, metadata !9, i32 29, i32 7, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!43 = metadata !{i32 34, i32 9, metadata !44, null}
!44 = metadata !{i32 786443, metadata !1, metadata !42, i32 34, i32 9, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!45 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 9, metadata !8, i32 0, metadata !46} ; [ DW_TAG_auto_variable ] [i] [line 9]
!46 = metadata !{i32 39, i32 15, metadata !47, null}
!47 = metadata !{i32 786443, metadata !1, metadata !9, i32 38, i32 19, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!48 = metadata !{i32 9, i32 7, metadata !4, metadata !46}
!49 = metadata !{i32 11, i32 7, metadata !22, metadata !46}
!50 = metadata !{i32 786688, metadata !47, metadata !"inc", metadata !5, i32 39, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [inc] [line 39]
!51 = metadata !{i32 39, i32 9, metadata !47, null}
!52 = metadata !{i32 -5}
!53 = metadata !{i32 786688, metadata !4, metadata !"__retres", metadata !5, i32 8, metadata !8, i32 0, metadata !46} ; [ DW_TAG_auto_variable ] [__retres] [line 8]
!54 = metadata !{i32 8, i32 7, metadata !4, metadata !46} ; [ DW_TAG_imported_declaration ]
!55 = metadata !{i32 38, i32 3, metadata !9, null}
!56 = metadata !{i32 38, i32 3, metadata !57, null}
!57 = metadata !{i32 786443, metadata !1, metadata !9, i32 38, i32 3, i32 1, i32 16} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!58 = metadata !{i32 40, i32 9, metadata !59, null}
!59 = metadata !{i32 786443, metadata !1, metadata !47, i32 40, i32 9, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!60 = metadata !{i32 44, i32 5, metadata !47, null}
!61 = metadata !{i32 45, i32 9, metadata !62, null}
!62 = metadata !{i32 786443, metadata !1, metadata !47, i32 45, i32 9, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!63 = metadata !{i32 51, i32 17, metadata !9, null}

