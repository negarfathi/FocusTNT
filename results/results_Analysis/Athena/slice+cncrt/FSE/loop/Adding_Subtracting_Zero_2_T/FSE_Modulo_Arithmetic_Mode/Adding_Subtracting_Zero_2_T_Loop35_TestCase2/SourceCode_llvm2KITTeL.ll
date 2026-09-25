; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@"'flag" = global i64 0, align 8

; Function Attrs: nounwind uwtable
define i64 @wrap_around(i64 %value, i64 %lower_bound, i64 %upper_bound) #0 {
wrap_around_bb0:
  call void @llvm.dbg.value(metadata !{i64 %value}, i64 0, metadata !20), !dbg !21
  call void @llvm.dbg.value(metadata !{i64 %lower_bound}, i64 0, metadata !22), !dbg !23
  call void @llvm.dbg.value(metadata !{i64 %upper_bound}, i64 0, metadata !24), !dbg !25
  %"0" = sub nsw i64 %upper_bound, %lower_bound, !dbg !26
  %"1" = add nsw i64 %"0", 1, !dbg !26
  call void @llvm.dbg.value(metadata !{i64 %"1"}, i64 0, metadata !27), !dbg !28
  %"2" = icmp sgt i64 %value, %upper_bound, !dbg !29
  br i1 %"2", label %wrap_around_bb1, label %wrap_around_bb2, !dbg !29

wrap_around_bb1:                                  ; preds = %wrap_around_bb0
  %"3" = sub nsw i64 %value, %upper_bound, !dbg !31
  %"4" = sub nsw i64 %"3", 1, !dbg !31
  %"5" = srem i64 %"4", %"1", !dbg !31
  %"6" = add nsw i64 %lower_bound, %"5", !dbg !31
  br label %wrap_around_bb4, !dbg !31

wrap_around_bb2:                                  ; preds = %wrap_around_bb0
  %"7" = icmp slt i64 %value, %lower_bound, !dbg !33
  br i1 %"7", label %wrap_around_bb3, label %wrap_around_bb4, !dbg !33

wrap_around_bb3:                                  ; preds = %wrap_around_bb2
  %"8" = sub nsw i64 %lower_bound, %value, !dbg !35
  %"9" = sub nsw i64 %"8", 1, !dbg !35
  %"10" = srem i64 %"9", %"1", !dbg !35
  %"11" = sub nsw i64 %upper_bound, %"10", !dbg !35
  br label %wrap_around_bb4, !dbg !35

wrap_around_bb4:                                  ; preds = %wrap_around_bb2, %wrap_around_bb3, %wrap_around_bb1
  %.0 = phi i64 [ %"6", %wrap_around_bb1 ], [ %"11", %wrap_around_bb3 ], [ %value, %wrap_around_bb2 ]
  ret i64 %.0, !dbg !37
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i64 @ff_subtitles_next_line_slice_1() #0 {
ff_subtitles_next_line_slice_1_bb5:
  call void @llvm.dbg.value(metadata !38, i64 0, metadata !39), !dbg !40
  %"12" = srem i64 5, 1000, !dbg !41
  call void @llvm.dbg.value(metadata !{i64 %"12"}, i64 0, metadata !42), !dbg !43
  call void @llvm.dbg.value(metadata !44, i64 0, metadata !45), !dbg !46
  call void @llvm.dbg.value(metadata !47, i64 0, metadata !48), !dbg !49
  call void @llvm.dbg.value(metadata !50, i64 0, metadata !51), !dbg !52
  call void @llvm.dbg.value(metadata !{i64 %"12"}, i64 0, metadata !39), !dbg !40
  %"13" = load i64* @"'flag", align 8, !dbg !53
  %"14" = icmp eq i64 %"13", 1, !dbg !53
  br i1 %"14", label %ff_subtitles_next_line_slice_1_wrap_around.exit, label %ff_subtitles_next_line_slice_1_bb6, !dbg !53

ff_subtitles_next_line_slice_1_bb6:               ; preds = %ff_subtitles_next_line_slice_1_bb5
  %"15" = icmp eq i64 %"12", 0, !dbg !55
  br i1 %"15", label %ff_subtitles_next_line_slice_1_bb7, label %ff_subtitles_next_line_slice_1_bb8, !dbg !55

ff_subtitles_next_line_slice_1_bb7:               ; preds = %ff_subtitles_next_line_slice_1_bb6
  store i64 1, i64* @"'flag", align 8, !dbg !57
  call void @llvm.dbg.value(metadata !59, i64 0, metadata !60), !dbg !61
  br label %ff_subtitles_next_line_slice_1_wrap_around.exit, !dbg !62

ff_subtitles_next_line_slice_1_bb8:               ; preds = %ff_subtitles_next_line_slice_1_bb6
  %"16" = icmp slt i64 %"12", 0, !dbg !63
  br i1 %"16", label %ff_subtitles_next_line_slice_1_bb9, label %ff_subtitles_next_line_slice_1_wrap_around.exit, !dbg !63

ff_subtitles_next_line_slice_1_bb9:               ; preds = %ff_subtitles_next_line_slice_1_bb8
  %"17" = sub nsw i64 0, %"12", !dbg !65
  call void @llvm.dbg.value(metadata !{i64 %"17"}, i64 0, metadata !67), !dbg !68
  call void @llvm.dbg.value(metadata !44, i64 0, metadata !69), !dbg !70
  call void @llvm.dbg.value(metadata !47, i64 0, metadata !71), !dbg !72
  call void @llvm.dbg.value(metadata !50, i64 0, metadata !73), !dbg !74
  %"18" = icmp sgt i64 %"17", 2147483647, !dbg !75
  br i1 %"18", label %ff_subtitles_next_line_slice_1_bb10, label %ff_subtitles_next_line_slice_1_bb11, !dbg !75

ff_subtitles_next_line_slice_1_bb10:              ; preds = %ff_subtitles_next_line_slice_1_bb9
  %"19" = sub nsw i64 %"17", 2147483647, !dbg !76
  %"20" = sub nsw i64 %"19", 1, !dbg !76
  %"21" = srem i64 %"20", 4294967296, !dbg !76
  %"22" = add nsw i64 -2147483648, %"21", !dbg !76
  br label %ff_subtitles_next_line_slice_1_wrap_around.exit, !dbg !76

ff_subtitles_next_line_slice_1_bb11:              ; preds = %ff_subtitles_next_line_slice_1_bb9
  %"23" = icmp slt i64 %"17", -2147483648, !dbg !77
  br i1 %"23", label %ff_subtitles_next_line_slice_1_bb12, label %ff_subtitles_next_line_slice_1_wrap_around.exit, !dbg !77

ff_subtitles_next_line_slice_1_bb12:              ; preds = %ff_subtitles_next_line_slice_1_bb11
  %"24" = sub nsw i64 -2147483648, %"17", !dbg !78
  %"25" = sub nsw i64 %"24", 1, !dbg !78
  %"26" = srem i64 %"25", 4294967296, !dbg !78
  %"27" = sub nsw i64 2147483647, %"26", !dbg !78
  br label %ff_subtitles_next_line_slice_1_wrap_around.exit, !dbg !78

ff_subtitles_next_line_slice_1_wrap_around.exit:  ; preds = %ff_subtitles_next_line_slice_1_bb7, %ff_subtitles_next_line_slice_1_bb8, %ff_subtitles_next_line_slice_1_bb12, %ff_subtitles_next_line_slice_1_bb11, %ff_subtitles_next_line_slice_1_bb10, %ff_subtitles_next_line_slice_1_bb5
  %__retres.2 = phi i64 [ 0, %ff_subtitles_next_line_slice_1_bb5 ], [ 0, %ff_subtitles_next_line_slice_1_bb7 ], [ %"22", %ff_subtitles_next_line_slice_1_bb10 ], [ %"27", %ff_subtitles_next_line_slice_1_bb12 ], [ %"17", %ff_subtitles_next_line_slice_1_bb11 ], [ %"12", %ff_subtitles_next_line_slice_1_bb8 ]
  ret i64 %__retres.2, !dbg !79
}

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb13:
  call void @llvm.dbg.value(metadata !80, i64 0, metadata !81), !dbg !82
  call void @llvm.dbg.value(metadata !38, i64 0, metadata !83), !dbg !84
  %"28" = icmp slt i64 10, 0, !dbg !85
  %"29" = icmp slt i64 5, 0, !dbg !87
  %or.cond = or i1 %"28", %"29", !dbg !85
  br i1 %or.cond, label %main_bb23, label %main_bb14, !dbg !85

main_bb14:                                        ; preds = %main_bb13
  call void @llvm.dbg.value(metadata !38, i64 0, metadata !89), !dbg !92
  call void @llvm.dbg.value(metadata !38, i64 0, metadata !93), !dbg !95
  call void @llvm.dbg.value(metadata !44, i64 0, metadata !96), !dbg !97
  call void @llvm.dbg.value(metadata !47, i64 0, metadata !98), !dbg !99
  call void @llvm.dbg.value(metadata !50, i64 0, metadata !100), !dbg !101
  call void @llvm.dbg.value(metadata !38, i64 0, metadata !89), !dbg !92
  %"30" = load i64* @"'flag", align 8, !dbg !102
  call void @llvm.dbg.value(metadata !{i64 %.}, i64 0, metadata !103), !dbg !104
  call void @llvm.dbg.value(metadata !{i64 %"34"}, i64 0, metadata !105), !dbg !107
  call void @llvm.dbg.value(metadata !44, i64 0, metadata !108), !dbg !109
  call void @llvm.dbg.value(metadata !47, i64 0, metadata !110), !dbg !111
  call void @llvm.dbg.value(metadata !50, i64 0, metadata !112), !dbg !113
  call void @llvm.dbg.value(metadata !{i64 %.0.i1}, i64 0, metadata !81), !dbg !82
  call void @llvm.dbg.value(metadata !{i64 %"45"}, i64 0, metadata !114), !dbg !117
  call void @llvm.dbg.value(metadata !44, i64 0, metadata !118), !dbg !119
  call void @llvm.dbg.value(metadata !47, i64 0, metadata !120), !dbg !121
  call void @llvm.dbg.value(metadata !50, i64 0, metadata !122), !dbg !123
  br label %main_bb15, !dbg !124

main_bb15:                                        ; preds = %main_wrap_around.exit, %main_bb14
  %b.0 = phi i64 [ 10, %main_bb14 ], [ %.0.i1, %main_wrap_around.exit ]
  %"31" = icmp slt i64 %b.0, 5, !dbg !125
  br i1 %"31", label %main_ff_subtitles_next_line_slice_1.exit, label %main_bb23, !dbg !125

main_ff_subtitles_next_line_slice_1.exit:         ; preds = %main_bb15
  %"32" = icmp eq i64 %"30", 1, !dbg !102
  %. = select i1 %"32", i64 0, i64 5, !dbg !102
  %"33" = icmp ne i64 %., 0, !dbg !127
  br i1 %"33", label %main_bb16, label %main_bb23, !dbg !127

main_bb16:                                        ; preds = %main_ff_subtitles_next_line_slice_1.exit
  %"34" = add nsw i64 %b.0, %., !dbg !106
  %"35" = icmp sgt i64 %"34", 2147483647, !dbg !129
  br i1 %"35", label %main_bb17, label %main_bb18, !dbg !129

main_bb17:                                        ; preds = %main_bb16
  %"36" = sub nsw i64 %"34", 2147483647, !dbg !130
  %"37" = sub nsw i64 %"36", 1, !dbg !130
  %"38" = srem i64 %"37", 4294967296, !dbg !130
  %"39" = add nsw i64 -2147483648, %"38", !dbg !130
  br label %main_wrap_around.exit2, !dbg !130

main_bb18:                                        ; preds = %main_bb16
  %"40" = icmp slt i64 %"34", -2147483648, !dbg !131
  br i1 %"40", label %main_bb19, label %main_wrap_around.exit2, !dbg !131

main_bb19:                                        ; preds = %main_bb18
  %"41" = sub nsw i64 -2147483648, %"34", !dbg !132
  %"42" = sub nsw i64 %"41", 1, !dbg !132
  %"43" = srem i64 %"42", 4294967296, !dbg !132
  %"44" = sub nsw i64 2147483647, %"43", !dbg !132
  br label %main_wrap_around.exit2, !dbg !132

main_wrap_around.exit2:                           ; preds = %main_bb17, %main_bb18, %main_bb19
  %.0.i1 = phi i64 [ %"39", %main_bb17 ], [ %"44", %main_bb19 ], [ %"34", %main_bb18 ], !dbg !106
  %"45" = sub nsw i64 5, 4, !dbg !115
  %"46" = icmp sgt i64 %"45", 2147483647, !dbg !133
  br i1 %"46", label %main_bb20, label %main_bb21, !dbg !133

main_bb20:                                        ; preds = %main_wrap_around.exit2
  %"47" = sub nsw i64 %"45", 2147483647, !dbg !134
  %"48" = sub nsw i64 %"47", 1, !dbg !134
  %"49" = srem i64 %"48", 4294967296, !dbg !134
  %"50" = add nsw i64 -2147483648, %"49", !dbg !134
  br label %main_wrap_around.exit, !dbg !134

main_bb21:                                        ; preds = %main_wrap_around.exit2
  %"51" = icmp slt i64 %"45", -2147483648, !dbg !135
  br i1 %"51", label %main_bb22, label %main_wrap_around.exit, !dbg !135

main_bb22:                                        ; preds = %main_bb21
  %"52" = sub nsw i64 -2147483648, %"45", !dbg !136
  %"53" = sub nsw i64 %"52", 1, !dbg !136
  %"54" = srem i64 %"53", 4294967296, !dbg !136
  %"55" = sub nsw i64 2147483647, %"54", !dbg !136
  br label %main_wrap_around.exit, !dbg !136

main_wrap_around.exit:                            ; preds = %main_bb20, %main_bb21, %main_bb22
  %.0.i = phi i64 [ %"50", %main_bb20 ], [ %"55", %main_bb22 ], [ %"45", %main_bb21 ], !dbg !115
  %"56" = icmp sge i64 %.0.i1, %.0.i, !dbg !115
  br i1 %"56", label %main_bb23, label %main_bb15, !dbg !115

main_bb23:                                        ; preds = %main_bb15, %main_ff_subtitles_next_line_slice_1.exit, %main_wrap_around.exit, %main_bb13
  ret void, !dbg !137
}

declare i64 @__kittel_nondef.0()

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!17, !18}
!llvm.ident = !{!19}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !15, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [//FILES_DIR/SourceCode_SemanticAugmentor.c] [DW_LANG_C99]
!1 = metadata !{metadata !"FILES_DIR/SourceCode_SemanticAugmentor.c", metadata !"/"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9, metadata !12}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"wrap_around", metadata !"wrap_around", metadata !"", i32 8, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i64, i64, i64)* @wrap_around, null, null, metadata !2, i32 8} ; [ DW_TAG_subprogram ] [line 8] [def] [wrap_around]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"ff_subtitles_next_line_slice_1", metadata !"ff_subtitles_next_line_slice_1", metadata !"", i32 18, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 ()* @ff_subtitles_next_line_slice_1, null, null, metadata !2, i32 19} ; [ DW_TAG_subprogram ] [line 18] [def] [scope 19] [ff_subtitles_next_line_slice_1]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !8}
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 38, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @main, null, null, metadata !2, i32 39} ; [ DW_TAG_subprogram ] [line 38] [def] [scope 39] [main]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{null}
!15 = metadata !{metadata !16}
!16 = metadata !{i32 786484, i32 0, null, metadata !"flag", metadata !"flag", metadata !"", metadata !5, i32 7, metadata !8, i32 0, i32 1, i64* @"'flag", null} ; [ DW_TAG_variable ] [flag] [line 7] [def]
!17 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!18 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!19 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!20 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777224, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 8]
!21 = metadata !{i32 8, i32 33, metadata !4, null} ; [ DW_TAG_imported_declaration ]
!22 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554440, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [lower_bound] [line 8]
!23 = metadata !{i32 8, i32 50, metadata !4, null} ; [ DW_TAG_imported_declaration ]
!24 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331656, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [upper_bound] [line 8]
!25 = metadata !{i32 8, i32 73, metadata !4, null} ; [ DW_TAG_imported_declaration ]
!26 = metadata !{i32 9, i32 5, metadata !4, null}
!27 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 9, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [range] [line 9]
!28 = metadata !{i32 9, i32 15, metadata !4, null}
!29 = metadata !{i32 10, i32 9, metadata !30, null}
!30 = metadata !{i32 786443, metadata !1, metadata !4, i32 10, i32 9, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!31 = metadata !{i32 11, i32 9, metadata !32, null}
!32 = metadata !{i32 786443, metadata !1, metadata !30, i32 10, i32 30, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!33 = metadata !{i32 13, i32 14, metadata !34, null}
!34 = metadata !{i32 786443, metadata !1, metadata !30, i32 13, i32 14, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!35 = metadata !{i32 14, i32 9, metadata !36, null}
!36 = metadata !{i32 786443, metadata !1, metadata !34, i32 13, i32 35, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!37 = metadata !{i32 17, i32 1, metadata !4, null}
!38 = metadata !{i64 5}
!39 = metadata !{i32 786688, metadata !9, metadata !"i", metadata !5, i32 21, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 21]
!40 = metadata !{i32 21, i32 13, metadata !9, null}
!41 = metadata !{i32 22, i32 7, metadata !9, null}
!42 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777224, metadata !8, i32 0, metadata !41} ; [ DW_TAG_arg_variable ] [value] [line 8]
!43 = metadata !{i32 8, i32 33, metadata !4, metadata !41} ; [ DW_TAG_imported_declaration ]
!44 = metadata !{i64 -2147483648}
!45 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554440, metadata !8, i32 0, metadata !41} ; [ DW_TAG_arg_variable ] [lower_bound] [line 8]
!46 = metadata !{i32 8, i32 50, metadata !4, metadata !41} ; [ DW_TAG_imported_declaration ]
!47 = metadata !{i64 2147483647}
!48 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331656, metadata !8, i32 0, metadata !41} ; [ DW_TAG_arg_variable ] [upper_bound] [line 8]
!49 = metadata !{i32 8, i32 73, metadata !4, metadata !41} ; [ DW_TAG_imported_declaration ]
!50 = metadata !{i64 4294967296}
!51 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 9, metadata !8, i32 0, metadata !41} ; [ DW_TAG_auto_variable ] [range] [line 9]
!52 = metadata !{i32 9, i32 15, metadata !4, metadata !41}
!53 = metadata !{i32 23, i32 7, metadata !54, null}
!54 = metadata !{i32 786443, metadata !1, metadata !9, i32 23, i32 7, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!55 = metadata !{i32 27, i32 7, metadata !56, null}
!56 = metadata !{i32 786443, metadata !1, metadata !9, i32 27, i32 7, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!57 = metadata !{i32 28, i32 5, metadata !58, null}
!58 = metadata !{i32 786443, metadata !1, metadata !56, i32 27, i32 15, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!59 = metadata !{i64 0}
!60 = metadata !{i32 786688, metadata !9, metadata !"__retres", metadata !5, i32 20, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__retres] [line 20]
!61 = metadata !{i32 20, i32 13, metadata !9, null}
!62 = metadata !{i32 30, i32 3, metadata !58, null}
!63 = metadata !{i32 32, i32 9, metadata !64, null}
!64 = metadata !{i32 786443, metadata !1, metadata !56, i32 32, i32 9, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!65 = metadata !{i32 33, i32 14, metadata !66, null}
!66 = metadata !{i32 786443, metadata !1, metadata !64, i32 33, i32 1, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!67 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777224, metadata !8, i32 0, metadata !65} ; [ DW_TAG_arg_variable ] [value] [line 8]
!68 = metadata !{i32 8, i32 33, metadata !4, metadata !65} ; [ DW_TAG_imported_declaration ]
!69 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554440, metadata !8, i32 0, metadata !65} ; [ DW_TAG_arg_variable ] [lower_bound] [line 8]
!70 = metadata !{i32 8, i32 50, metadata !4, metadata !65} ; [ DW_TAG_imported_declaration ]
!71 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331656, metadata !8, i32 0, metadata !65} ; [ DW_TAG_arg_variable ] [upper_bound] [line 8]
!72 = metadata !{i32 8, i32 73, metadata !4, metadata !65} ; [ DW_TAG_imported_declaration ]
!73 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 9, metadata !8, i32 0, metadata !65} ; [ DW_TAG_auto_variable ] [range] [line 9]
!74 = metadata !{i32 9, i32 15, metadata !4, metadata !65}
!75 = metadata !{i32 10, i32 9, metadata !30, metadata !65}
!76 = metadata !{i32 11, i32 9, metadata !32, metadata !65}
!77 = metadata !{i32 13, i32 14, metadata !34, metadata !65}
!78 = metadata !{i32 14, i32 9, metadata !36, metadata !65}
!79 = metadata !{i32 35, i32 17, metadata !9, null}
!80 = metadata !{i64 10}
!81 = metadata !{i32 786688, metadata !12, metadata !"b", metadata !5, i32 41, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 41]
!82 = metadata !{i32 41, i32 13, metadata !12, null}
!83 = metadata !{i32 786688, metadata !12, metadata !"end", metadata !5, i32 42, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [end] [line 42]
!84 = metadata !{i32 42, i32 13, metadata !12, null}
!85 = metadata !{i32 43, i32 7, metadata !86, null}
!86 = metadata !{i32 786443, metadata !1, metadata !12, i32 43, i32 7, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!87 = metadata !{i32 48, i32 9, metadata !88, null}
!88 = metadata !{i32 786443, metadata !1, metadata !86, i32 48, i32 9, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!89 = metadata !{i32 786688, metadata !9, metadata !"i", metadata !5, i32 21, metadata !8, i32 0, metadata !90} ; [ DW_TAG_auto_variable ] [i] [line 21]
!90 = metadata !{i32 53, i32 21, metadata !91, null}
!91 = metadata !{i32 786443, metadata !1, metadata !12, i32 52, i32 19, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!92 = metadata !{i32 21, i32 13, metadata !9, metadata !90}
!93 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777224, metadata !8, i32 0, metadata !94} ; [ DW_TAG_arg_variable ] [value] [line 8]
!94 = metadata !{i32 22, i32 7, metadata !9, metadata !90}
!95 = metadata !{i32 8, i32 33, metadata !4, metadata !94} ; [ DW_TAG_imported_declaration ]
!96 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554440, metadata !8, i32 0, metadata !94} ; [ DW_TAG_arg_variable ] [lower_bound] [line 8]
!97 = metadata !{i32 8, i32 50, metadata !4, metadata !94} ; [ DW_TAG_imported_declaration ]
!98 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331656, metadata !8, i32 0, metadata !94} ; [ DW_TAG_arg_variable ] [upper_bound] [line 8]
!99 = metadata !{i32 8, i32 73, metadata !4, metadata !94} ; [ DW_TAG_imported_declaration ]
!100 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 9, metadata !8, i32 0, metadata !94} ; [ DW_TAG_auto_variable ] [range] [line 9]
!101 = metadata !{i32 9, i32 15, metadata !4, metadata !94}
!102 = metadata !{i32 23, i32 7, metadata !54, metadata !90}
!103 = metadata !{i32 786688, metadata !91, metadata !"inc", metadata !5, i32 53, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [inc] [line 53]
!104 = metadata !{i32 53, i32 15, metadata !91, null}
!105 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777224, metadata !8, i32 0, metadata !106} ; [ DW_TAG_arg_variable ] [value] [line 8]
!106 = metadata !{i32 58, i32 9, metadata !91, null} ; [ DW_TAG_imported_module ]
!107 = metadata !{i32 8, i32 33, metadata !4, metadata !106} ; [ DW_TAG_imported_declaration ]
!108 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554440, metadata !8, i32 0, metadata !106} ; [ DW_TAG_arg_variable ] [lower_bound] [line 8]
!109 = metadata !{i32 8, i32 50, metadata !4, metadata !106} ; [ DW_TAG_imported_declaration ]
!110 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331656, metadata !8, i32 0, metadata !106} ; [ DW_TAG_arg_variable ] [upper_bound] [line 8]
!111 = metadata !{i32 8, i32 73, metadata !4, metadata !106} ; [ DW_TAG_imported_declaration ]
!112 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 9, metadata !8, i32 0, metadata !106} ; [ DW_TAG_auto_variable ] [range] [line 9]
!113 = metadata !{i32 9, i32 15, metadata !4, metadata !106}
!114 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777224, metadata !8, i32 0, metadata !115} ; [ DW_TAG_arg_variable ] [value] [line 8]
!115 = metadata !{i32 59, i32 14, metadata !116, null}
!116 = metadata !{i32 786443, metadata !1, metadata !91, i32 59, i32 9, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!117 = metadata !{i32 8, i32 33, metadata !4, metadata !115} ; [ DW_TAG_imported_declaration ]
!118 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554440, metadata !8, i32 0, metadata !115} ; [ DW_TAG_arg_variable ] [lower_bound] [line 8]
!119 = metadata !{i32 8, i32 50, metadata !4, metadata !115} ; [ DW_TAG_imported_declaration ]
!120 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331656, metadata !8, i32 0, metadata !115} ; [ DW_TAG_arg_variable ] [upper_bound] [line 8]
!121 = metadata !{i32 8, i32 73, metadata !4, metadata !115} ; [ DW_TAG_imported_declaration ]
!122 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 9, metadata !8, i32 0, metadata !115} ; [ DW_TAG_auto_variable ] [range] [line 9]
!123 = metadata !{i32 9, i32 15, metadata !4, metadata !115}
!124 = metadata !{i32 52, i32 3, metadata !12, null}
!125 = metadata !{i32 52, i32 3, metadata !126, null}
!126 = metadata !{i32 786443, metadata !1, metadata !12, i32 52, i32 3, i32 1, i32 19} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!127 = metadata !{i32 54, i32 9, metadata !128, null}
!128 = metadata !{i32 786443, metadata !1, metadata !91, i32 54, i32 9, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!129 = metadata !{i32 10, i32 9, metadata !30, metadata !106}
!130 = metadata !{i32 11, i32 9, metadata !32, metadata !106}
!131 = metadata !{i32 13, i32 14, metadata !34, metadata !106}
!132 = metadata !{i32 14, i32 9, metadata !36, metadata !106}
!133 = metadata !{i32 10, i32 9, metadata !30, metadata !115}
!134 = metadata !{i32 11, i32 9, metadata !32, metadata !115}
!135 = metadata !{i32 13, i32 14, metadata !34, metadata !115}
!136 = metadata !{i32 14, i32 9, metadata !36, metadata !115}
!137 = metadata !{i32 65, i32 17, metadata !12, null}

