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
  %"12" = call i64 @__VERIFIER_nondet_int(), !dbg !38
  call void @llvm.dbg.value(metadata !{i64 %"12"}, i64 0, metadata !39), !dbg !40
  %"13" = srem i64 %"12", 1000, !dbg !41
  call void @llvm.dbg.value(metadata !{i64 %"13"}, i64 0, metadata !42), !dbg !43
  call void @llvm.dbg.value(metadata !44, i64 0, metadata !45), !dbg !46
  call void @llvm.dbg.value(metadata !47, i64 0, metadata !48), !dbg !49
  call void @llvm.dbg.value(metadata !50, i64 0, metadata !51), !dbg !52
  call void @llvm.dbg.value(metadata !{i64 %"13"}, i64 0, metadata !39), !dbg !40
  %"14" = load i64* @"'flag", align 8, !dbg !53
  %"15" = icmp eq i64 %"14", 1, !dbg !53
  br i1 %"15", label %ff_subtitles_next_line_slice_1_wrap_around.exit, label %ff_subtitles_next_line_slice_1_bb6, !dbg !53

ff_subtitles_next_line_slice_1_bb6:               ; preds = %ff_subtitles_next_line_slice_1_bb5
  %"16" = icmp eq i64 %"13", 0, !dbg !55
  br i1 %"16", label %ff_subtitles_next_line_slice_1_bb7, label %ff_subtitles_next_line_slice_1_bb8, !dbg !55

ff_subtitles_next_line_slice_1_bb7:               ; preds = %ff_subtitles_next_line_slice_1_bb6
  store i64 1, i64* @"'flag", align 8, !dbg !57
  call void @llvm.dbg.value(metadata !59, i64 0, metadata !60), !dbg !61
  br label %ff_subtitles_next_line_slice_1_wrap_around.exit, !dbg !62

ff_subtitles_next_line_slice_1_bb8:               ; preds = %ff_subtitles_next_line_slice_1_bb6
  %"17" = icmp slt i64 %"13", 0, !dbg !63
  br i1 %"17", label %ff_subtitles_next_line_slice_1_bb9, label %ff_subtitles_next_line_slice_1_wrap_around.exit, !dbg !63

ff_subtitles_next_line_slice_1_bb9:               ; preds = %ff_subtitles_next_line_slice_1_bb8
  %"18" = sub nsw i64 0, %"13", !dbg !65
  call void @llvm.dbg.value(metadata !{i64 %"18"}, i64 0, metadata !67), !dbg !68
  call void @llvm.dbg.value(metadata !44, i64 0, metadata !69), !dbg !70
  call void @llvm.dbg.value(metadata !47, i64 0, metadata !71), !dbg !72
  call void @llvm.dbg.value(metadata !50, i64 0, metadata !73), !dbg !74
  %"19" = icmp sgt i64 %"18", 2147483647, !dbg !75
  br i1 %"19", label %ff_subtitles_next_line_slice_1_bb10, label %ff_subtitles_next_line_slice_1_bb11, !dbg !75

ff_subtitles_next_line_slice_1_bb10:              ; preds = %ff_subtitles_next_line_slice_1_bb9
  %"20" = sub nsw i64 %"18", 2147483647, !dbg !76
  %"21" = sub nsw i64 %"20", 1, !dbg !76
  %"22" = srem i64 %"21", 4294967296, !dbg !76
  %"23" = add nsw i64 -2147483648, %"22", !dbg !76
  br label %ff_subtitles_next_line_slice_1_wrap_around.exit, !dbg !76

ff_subtitles_next_line_slice_1_bb11:              ; preds = %ff_subtitles_next_line_slice_1_bb9
  %"24" = icmp slt i64 %"18", -2147483648, !dbg !77
  br i1 %"24", label %ff_subtitles_next_line_slice_1_bb12, label %ff_subtitles_next_line_slice_1_wrap_around.exit, !dbg !77

ff_subtitles_next_line_slice_1_bb12:              ; preds = %ff_subtitles_next_line_slice_1_bb11
  %"25" = sub nsw i64 -2147483648, %"18", !dbg !78
  %"26" = sub nsw i64 %"25", 1, !dbg !78
  %"27" = srem i64 %"26", 4294967296, !dbg !78
  %"28" = sub nsw i64 2147483647, %"27", !dbg !78
  br label %ff_subtitles_next_line_slice_1_wrap_around.exit, !dbg !78

ff_subtitles_next_line_slice_1_wrap_around.exit:  ; preds = %ff_subtitles_next_line_slice_1_bb7, %ff_subtitles_next_line_slice_1_bb8, %ff_subtitles_next_line_slice_1_bb12, %ff_subtitles_next_line_slice_1_bb11, %ff_subtitles_next_line_slice_1_bb10, %ff_subtitles_next_line_slice_1_bb5
  %__retres.2 = phi i64 [ 0, %ff_subtitles_next_line_slice_1_bb5 ], [ 0, %ff_subtitles_next_line_slice_1_bb7 ], [ %"23", %ff_subtitles_next_line_slice_1_bb10 ], [ %"28", %ff_subtitles_next_line_slice_1_bb12 ], [ %"18", %ff_subtitles_next_line_slice_1_bb11 ], [ %"13", %ff_subtitles_next_line_slice_1_bb8 ]
  ret i64 %__retres.2, !dbg !79
}

declare i64 @__VERIFIER_nondet_int() #2

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb13:
  %"29" = call i64 @__VERIFIER_nondet_int(), !dbg !80
  call void @llvm.dbg.value(metadata !{i64 %"29"}, i64 0, metadata !81), !dbg !82
  %"30" = call i64 @__VERIFIER_nondet_int(), !dbg !83
  call void @llvm.dbg.value(metadata !{i64 %"30"}, i64 0, metadata !84), !dbg !85
  %"31" = icmp slt i64 %"29", 0, !dbg !86
  %"32" = icmp slt i64 %"30", 0, !dbg !88
  %or.cond = or i1 %"31", %"32", !dbg !86
  br i1 %or.cond, label %main_bb30, label %main_bb14, !dbg !86

main_bb14:                                        ; preds = %main_bb13, %main_wrap_around.exit2
  %b.0 = phi i64 [ %.0.i, %main_wrap_around.exit2 ], [ %"29", %main_bb13 ]
  %"33" = icmp slt i64 %b.0, %"30", !dbg !90
  br i1 %"33", label %main_bb15, label %main_bb30, !dbg !90

main_bb15:                                        ; preds = %main_bb14
  %"34" = call i64 @__VERIFIER_nondet_int() #3, !dbg !92
  %"35" = srem i64 %"34", 1000, !dbg !95
  %"36" = load i64* @"'flag", align 8, !dbg !96
  %"37" = icmp eq i64 %"36", 1, !dbg !96
  br i1 %"37", label %main_ff_subtitles_next_line_slice_1.exit, label %main_bb16, !dbg !96

main_bb16:                                        ; preds = %main_bb15
  %"38" = icmp eq i64 %"35", 0, !dbg !97
  br i1 %"38", label %main_bb17, label %main_bb18, !dbg !97

main_bb17:                                        ; preds = %main_bb16
  store i64 1, i64* @"'flag", align 8, !dbg !98
  br label %main_ff_subtitles_next_line_slice_1.exit, !dbg !99

main_bb18:                                        ; preds = %main_bb16
  %"39" = icmp slt i64 %"35", 0, !dbg !100
  br i1 %"39", label %main_bb19, label %main_ff_subtitles_next_line_slice_1.exit, !dbg !100

main_bb19:                                        ; preds = %main_bb18
  %"40" = sub nsw i64 0, %"35", !dbg !101
  %"41" = icmp sgt i64 %"40", 2147483647, !dbg !102
  br i1 %"41", label %main_bb20, label %main_bb21, !dbg !102

main_bb20:                                        ; preds = %main_bb19
  %"42" = sub nsw i64 %"40", 2147483647, !dbg !103
  %"43" = sub nsw i64 %"42", 1, !dbg !103
  %"44" = srem i64 %"43", 4294967296, !dbg !103
  %"45" = add nsw i64 -2147483648, %"44", !dbg !103
  br label %main_ff_subtitles_next_line_slice_1.exit, !dbg !103

main_bb21:                                        ; preds = %main_bb19
  %"46" = icmp slt i64 %"40", -2147483648, !dbg !104
  br i1 %"46", label %main_bb22, label %main_ff_subtitles_next_line_slice_1.exit, !dbg !104

main_bb22:                                        ; preds = %main_bb21
  %"47" = sub nsw i64 -2147483648, %"40", !dbg !105
  %"48" = sub nsw i64 %"47", 1, !dbg !105
  %"49" = srem i64 %"48", 4294967296, !dbg !105
  %"50" = sub nsw i64 2147483647, %"49", !dbg !105
  br label %main_ff_subtitles_next_line_slice_1.exit, !dbg !105

main_ff_subtitles_next_line_slice_1.exit:         ; preds = %main_bb15, %main_bb17, %main_bb18, %main_bb20, %main_bb21, %main_bb22
  %__retres.2.i = phi i64 [ 0, %main_bb15 ], [ 0, %main_bb17 ], [ %"45", %main_bb20 ], [ %"50", %main_bb22 ], [ %"40", %main_bb21 ], [ %"35", %main_bb18 ], !dbg !93
  %"51" = icmp ne i64 %__retres.2.i, 0, !dbg !106
  br i1 %"51", label %main_bb23, label %main_bb30, !dbg !106

main_bb23:                                        ; preds = %main_ff_subtitles_next_line_slice_1.exit
  %"52" = add nsw i64 %b.0, %__retres.2.i, !dbg !108
  %"53" = icmp sgt i64 %"52", 2147483647, !dbg !109
  br i1 %"53", label %main_bb24, label %main_bb25, !dbg !109

main_bb24:                                        ; preds = %main_bb23
  %"54" = sub nsw i64 %"52", 2147483647, !dbg !110
  %"55" = sub nsw i64 %"54", 1, !dbg !110
  %"56" = srem i64 %"55", 4294967296, !dbg !110
  %"57" = add nsw i64 -2147483648, %"56", !dbg !110
  br label %main_wrap_around.exit, !dbg !110

main_bb25:                                        ; preds = %main_bb23
  %"58" = icmp slt i64 %"52", -2147483648, !dbg !111
  br i1 %"58", label %main_bb26, label %main_wrap_around.exit, !dbg !111

main_bb26:                                        ; preds = %main_bb25
  %"59" = sub nsw i64 -2147483648, %"52", !dbg !112
  %"60" = sub nsw i64 %"59", 1, !dbg !112
  %"61" = srem i64 %"60", 4294967296, !dbg !112
  %"62" = sub nsw i64 2147483647, %"61", !dbg !112
  br label %main_wrap_around.exit, !dbg !112

main_wrap_around.exit:                            ; preds = %main_bb24, %main_bb25, %main_bb26
  %.0.i = phi i64 [ %"57", %main_bb24 ], [ %"62", %main_bb26 ], [ %"52", %main_bb25 ], !dbg !108
  %"63" = sub nsw i64 %"30", 4, !dbg !113
  %"64" = icmp sgt i64 %"63", 2147483647, !dbg !115
  br i1 %"64", label %main_bb27, label %main_bb28, !dbg !115

main_bb27:                                        ; preds = %main_wrap_around.exit
  %"65" = sub nsw i64 %"63", 2147483647, !dbg !116
  %"66" = sub nsw i64 %"65", 1, !dbg !116
  %"67" = srem i64 %"66", 4294967296, !dbg !116
  %"68" = add nsw i64 -2147483648, %"67", !dbg !116
  br label %main_wrap_around.exit2, !dbg !116

main_bb28:                                        ; preds = %main_wrap_around.exit
  %"69" = icmp slt i64 %"63", -2147483648, !dbg !117
  br i1 %"69", label %main_bb29, label %main_wrap_around.exit2, !dbg !117

main_bb29:                                        ; preds = %main_bb28
  %"70" = sub nsw i64 -2147483648, %"63", !dbg !118
  %"71" = sub nsw i64 %"70", 1, !dbg !118
  %"72" = srem i64 %"71", 4294967296, !dbg !118
  %"73" = sub nsw i64 2147483647, %"72", !dbg !118
  br label %main_wrap_around.exit2, !dbg !118

main_wrap_around.exit2:                           ; preds = %main_bb27, %main_bb28, %main_bb29
  %.0.i1 = phi i64 [ %"68", %main_bb27 ], [ %"73", %main_bb29 ], [ %"63", %main_bb28 ], !dbg !113
  %"74" = icmp sge i64 %.0.i, %.0.i1, !dbg !113
  br i1 %"74", label %main_bb30, label %main_bb14, !dbg !113

main_bb30:                                        ; preds = %main_bb14, %main_ff_subtitles_next_line_slice_1.exit, %main_wrap_around.exit2, %main_bb13
  ret void, !dbg !119
}

declare i64 @__kittel_nondef.0()

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

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
!38 = metadata !{i32 21, i32 17, metadata !9, null}
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
!80 = metadata !{i32 41, i32 17, metadata !12, null}
!81 = metadata !{i32 786688, metadata !12, metadata !"b", metadata !5, i32 41, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 41]
!82 = metadata !{i32 41, i32 13, metadata !12, null}
!83 = metadata !{i32 42, i32 19, metadata !12, null}
!84 = metadata !{i32 786688, metadata !12, metadata !"end", metadata !5, i32 42, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [end] [line 42]
!85 = metadata !{i32 42, i32 13, metadata !12, null}
!86 = metadata !{i32 43, i32 7, metadata !87, null}
!87 = metadata !{i32 786443, metadata !1, metadata !12, i32 43, i32 7, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!88 = metadata !{i32 48, i32 9, metadata !89, null}
!89 = metadata !{i32 786443, metadata !1, metadata !87, i32 48, i32 9, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!90 = metadata !{i32 52, i32 3, metadata !91, null}
!91 = metadata !{i32 786443, metadata !1, metadata !12, i32 52, i32 3, i32 1, i32 19} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!92 = metadata !{i32 21, i32 17, metadata !9, metadata !93}
!93 = metadata !{i32 53, i32 21, metadata !94, null}
!94 = metadata !{i32 786443, metadata !1, metadata !12, i32 52, i32 19, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!95 = metadata !{i32 22, i32 7, metadata !9, metadata !93}
!96 = metadata !{i32 23, i32 7, metadata !54, metadata !93}
!97 = metadata !{i32 27, i32 7, metadata !56, metadata !93}
!98 = metadata !{i32 28, i32 5, metadata !58, metadata !93}
!99 = metadata !{i32 30, i32 3, metadata !58, metadata !93}
!100 = metadata !{i32 32, i32 9, metadata !64, metadata !93}
!101 = metadata !{i32 33, i32 14, metadata !66, metadata !93}
!102 = metadata !{i32 10, i32 9, metadata !30, metadata !101}
!103 = metadata !{i32 11, i32 9, metadata !32, metadata !101}
!104 = metadata !{i32 13, i32 14, metadata !34, metadata !101}
!105 = metadata !{i32 14, i32 9, metadata !36, metadata !101}
!106 = metadata !{i32 54, i32 9, metadata !107, null}
!107 = metadata !{i32 786443, metadata !1, metadata !94, i32 54, i32 9, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!108 = metadata !{i32 58, i32 9, metadata !94, null} ; [ DW_TAG_imported_module ]
!109 = metadata !{i32 10, i32 9, metadata !30, metadata !108}
!110 = metadata !{i32 11, i32 9, metadata !32, metadata !108}
!111 = metadata !{i32 13, i32 14, metadata !34, metadata !108}
!112 = metadata !{i32 14, i32 9, metadata !36, metadata !108}
!113 = metadata !{i32 59, i32 14, metadata !114, null}
!114 = metadata !{i32 786443, metadata !1, metadata !94, i32 59, i32 9, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!115 = metadata !{i32 10, i32 9, metadata !30, metadata !113}
!116 = metadata !{i32 11, i32 9, metadata !32, metadata !113}
!117 = metadata !{i32 13, i32 14, metadata !34, metadata !113}
!118 = metadata !{i32 14, i32 9, metadata !36, metadata !113}
!119 = metadata !{i32 65, i32 17, metadata !12, null}

