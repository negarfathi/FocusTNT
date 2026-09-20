; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@"'flag" = global i64 0, align 8

; Function Attrs: nounwind uwtable
define i64 @wrap_around(i64 %value, i64 %lower_bound, i64 %upper_bound) #0 {
wrap_around_bb0:
  call void @llvm.dbg.value(metadata !{i64 %value}, i64 0, metadata !21), !dbg !22
  call void @llvm.dbg.value(metadata !{i64 %lower_bound}, i64 0, metadata !23), !dbg !24
  call void @llvm.dbg.value(metadata !{i64 %upper_bound}, i64 0, metadata !25), !dbg !26
  %"0" = sub nsw i64 %upper_bound, %lower_bound, !dbg !27
  %"1" = add nsw i64 %"0", 1, !dbg !27
  call void @llvm.dbg.value(metadata !{i64 %"1"}, i64 0, metadata !28), !dbg !29
  %"2" = icmp sgt i64 %value, %upper_bound, !dbg !30
  br i1 %"2", label %wrap_around_bb1, label %wrap_around_bb2, !dbg !30

wrap_around_bb1:                                  ; preds = %wrap_around_bb0
  %"3" = sub nsw i64 %value, %upper_bound, !dbg !32
  %"4" = sub nsw i64 %"3", 1, !dbg !32
  %"5" = srem i64 %"4", %"1", !dbg !32
  %"6" = add nsw i64 %lower_bound, %"5", !dbg !32
  br label %wrap_around_bb4, !dbg !32

wrap_around_bb2:                                  ; preds = %wrap_around_bb0
  %"7" = icmp slt i64 %value, %lower_bound, !dbg !34
  br i1 %"7", label %wrap_around_bb3, label %wrap_around_bb4, !dbg !34

wrap_around_bb3:                                  ; preds = %wrap_around_bb2
  %"8" = sub nsw i64 %lower_bound, %value, !dbg !36
  %"9" = sub nsw i64 %"8", 1, !dbg !36
  %"10" = srem i64 %"9", %"1", !dbg !36
  %"11" = sub nsw i64 %upper_bound, %"10", !dbg !36
  br label %wrap_around_bb4, !dbg !36

wrap_around_bb4:                                  ; preds = %wrap_around_bb2, %wrap_around_bb3, %wrap_around_bb1
  %.0 = phi i64 [ %"6", %wrap_around_bb1 ], [ %"11", %wrap_around_bb3 ], [ %value, %wrap_around_bb2 ]
  ret i64 %.0, !dbg !38
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i64 @ff_subtitles_next_line() #0 {
ff_subtitles_next_line_bb5:
  call void @llvm.dbg.value(metadata !39, i64 0, metadata !40), !dbg !41
  %"12" = srem i64 5, 1000, !dbg !42
  call void @llvm.dbg.value(metadata !{i64 %"12"}, i64 0, metadata !43), !dbg !44
  call void @llvm.dbg.value(metadata !45, i64 0, metadata !46), !dbg !47
  call void @llvm.dbg.value(metadata !48, i64 0, metadata !49), !dbg !50
  call void @llvm.dbg.value(metadata !51, i64 0, metadata !52), !dbg !53
  call void @llvm.dbg.value(metadata !{i64 %"12"}, i64 0, metadata !40), !dbg !41
  %"13" = load i64* @"'flag", align 8, !dbg !54
  %"14" = icmp eq i64 %"13", 1, !dbg !54
  br i1 %"14", label %ff_subtitles_next_line_wrap_around.exit, label %ff_subtitles_next_line_bb6, !dbg !54

ff_subtitles_next_line_bb6:                       ; preds = %ff_subtitles_next_line_bb5
  %"15" = icmp eq i64 %"12", 0, !dbg !56
  br i1 %"15", label %ff_subtitles_next_line_bb7, label %ff_subtitles_next_line_bb8, !dbg !56

ff_subtitles_next_line_bb7:                       ; preds = %ff_subtitles_next_line_bb6
  store i64 1, i64* @"'flag", align 8, !dbg !58
  br label %ff_subtitles_next_line_wrap_around.exit, !dbg !60

ff_subtitles_next_line_bb8:                       ; preds = %ff_subtitles_next_line_bb6
  %"16" = icmp slt i64 %"12", 0, !dbg !61
  br i1 %"16", label %ff_subtitles_next_line_bb9, label %ff_subtitles_next_line_wrap_around.exit, !dbg !61

ff_subtitles_next_line_bb9:                       ; preds = %ff_subtitles_next_line_bb8
  %"17" = sub nsw i64 0, %"12", !dbg !63
  call void @llvm.dbg.value(metadata !{i64 %"17"}, i64 0, metadata !65), !dbg !66
  call void @llvm.dbg.value(metadata !45, i64 0, metadata !67), !dbg !68
  call void @llvm.dbg.value(metadata !48, i64 0, metadata !69), !dbg !70
  call void @llvm.dbg.value(metadata !51, i64 0, metadata !71), !dbg !72
  %"18" = icmp sgt i64 %"17", 2147483647, !dbg !73
  br i1 %"18", label %ff_subtitles_next_line_bb10, label %ff_subtitles_next_line_bb11, !dbg !73

ff_subtitles_next_line_bb10:                      ; preds = %ff_subtitles_next_line_bb9
  %"19" = sub nsw i64 %"17", 2147483647, !dbg !74
  %"20" = sub nsw i64 %"19", 1, !dbg !74
  %"21" = srem i64 %"20", 4294967296, !dbg !74
  %"22" = add nsw i64 -2147483648, %"21", !dbg !74
  br label %ff_subtitles_next_line_wrap_around.exit, !dbg !74

ff_subtitles_next_line_bb11:                      ; preds = %ff_subtitles_next_line_bb9
  %"23" = icmp slt i64 %"17", -2147483648, !dbg !75
  br i1 %"23", label %ff_subtitles_next_line_bb12, label %ff_subtitles_next_line_wrap_around.exit, !dbg !75

ff_subtitles_next_line_bb12:                      ; preds = %ff_subtitles_next_line_bb11
  %"24" = sub nsw i64 -2147483648, %"17", !dbg !76
  %"25" = sub nsw i64 %"24", 1, !dbg !76
  %"26" = srem i64 %"25", 4294967296, !dbg !76
  %"27" = sub nsw i64 2147483647, %"26", !dbg !76
  br label %ff_subtitles_next_line_wrap_around.exit, !dbg !76

ff_subtitles_next_line_wrap_around.exit:          ; preds = %ff_subtitles_next_line_bb8, %ff_subtitles_next_line_bb12, %ff_subtitles_next_line_bb11, %ff_subtitles_next_line_bb10, %ff_subtitles_next_line_bb5, %ff_subtitles_next_line_bb7
  %.0 = phi i64 [ 0, %ff_subtitles_next_line_bb7 ], [ 0, %ff_subtitles_next_line_bb5 ], [ %"22", %ff_subtitles_next_line_bb10 ], [ %"27", %ff_subtitles_next_line_bb12 ], [ %"17", %ff_subtitles_next_line_bb11 ], [ %"12", %ff_subtitles_next_line_bb8 ]
  ret i64 %.0, !dbg !77
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
main_bb13:
  call void @llvm.dbg.value(metadata !78, i64 0, metadata !79), !dbg !80
  call void @llvm.dbg.value(metadata !81, i64 0, metadata !82), !dbg !83
  %"28" = icmp slt i64 -1, 0, !dbg !84
  %"29" = icmp slt i64 10, 0, !dbg !86
  %or.cond = or i1 %"28", %"29", !dbg !84
  br i1 %or.cond, label %main_bb23, label %main_bb14, !dbg !84

main_bb14:                                        ; preds = %main_bb13
  call void @llvm.dbg.value(metadata !39, i64 0, metadata !88), !dbg !91
  call void @llvm.dbg.value(metadata !39, i64 0, metadata !92), !dbg !94
  call void @llvm.dbg.value(metadata !45, i64 0, metadata !95), !dbg !96
  call void @llvm.dbg.value(metadata !48, i64 0, metadata !97), !dbg !98
  call void @llvm.dbg.value(metadata !51, i64 0, metadata !99), !dbg !100
  call void @llvm.dbg.value(metadata !39, i64 0, metadata !88), !dbg !91
  %"30" = load i64* @"'flag", align 8, !dbg !101
  call void @llvm.dbg.value(metadata !{i64 %.}, i64 0, metadata !102), !dbg !103
  call void @llvm.dbg.value(metadata !{i64 %"34"}, i64 0, metadata !104), !dbg !106
  call void @llvm.dbg.value(metadata !45, i64 0, metadata !107), !dbg !108
  call void @llvm.dbg.value(metadata !48, i64 0, metadata !109), !dbg !110
  call void @llvm.dbg.value(metadata !51, i64 0, metadata !111), !dbg !112
  call void @llvm.dbg.value(metadata !{i64 %.0.i2}, i64 0, metadata !79), !dbg !80
  call void @llvm.dbg.value(metadata !{i64 %"45"}, i64 0, metadata !113), !dbg !116
  call void @llvm.dbg.value(metadata !45, i64 0, metadata !117), !dbg !118
  call void @llvm.dbg.value(metadata !48, i64 0, metadata !119), !dbg !120
  call void @llvm.dbg.value(metadata !51, i64 0, metadata !121), !dbg !122
  br label %main_bb15, !dbg !123

main_bb15:                                        ; preds = %main_wrap_around.exit, %main_bb14
  %b.0 = phi i64 [ -1, %main_bb14 ], [ %.0.i2, %main_wrap_around.exit ]
  %"31" = icmp slt i64 %b.0, 10, !dbg !124
  br i1 %"31", label %main_ff_subtitles_next_line.exit, label %main_bb23, !dbg !124

main_ff_subtitles_next_line.exit:                 ; preds = %main_bb15
  %"32" = icmp eq i64 %"30", 1, !dbg !101
  %. = select i1 %"32", i64 0, i64 5, !dbg !101
  %"33" = icmp ne i64 %., 0, !dbg !126
  br i1 %"33", label %main_bb16, label %main_bb23, !dbg !126

main_bb16:                                        ; preds = %main_ff_subtitles_next_line.exit
  %"34" = add nsw i64 %b.0, %., !dbg !105
  %"35" = icmp sgt i64 %"34", 2147483647, !dbg !128
  br i1 %"35", label %main_bb17, label %main_bb18, !dbg !128

main_bb17:                                        ; preds = %main_bb16
  %"36" = sub nsw i64 %"34", 2147483647, !dbg !129
  %"37" = sub nsw i64 %"36", 1, !dbg !129
  %"38" = srem i64 %"37", 4294967296, !dbg !129
  %"39" = add nsw i64 -2147483648, %"38", !dbg !129
  br label %main_wrap_around.exit3, !dbg !129

main_bb18:                                        ; preds = %main_bb16
  %"40" = icmp slt i64 %"34", -2147483648, !dbg !130
  br i1 %"40", label %main_bb19, label %main_wrap_around.exit3, !dbg !130

main_bb19:                                        ; preds = %main_bb18
  %"41" = sub nsw i64 -2147483648, %"34", !dbg !131
  %"42" = sub nsw i64 %"41", 1, !dbg !131
  %"43" = srem i64 %"42", 4294967296, !dbg !131
  %"44" = sub nsw i64 2147483647, %"43", !dbg !131
  br label %main_wrap_around.exit3, !dbg !131

main_wrap_around.exit3:                           ; preds = %main_bb17, %main_bb18, %main_bb19
  %.0.i2 = phi i64 [ %"39", %main_bb17 ], [ %"44", %main_bb19 ], [ %"34", %main_bb18 ], !dbg !105
  %"45" = sub nsw i64 10, 4, !dbg !114
  %"46" = icmp sgt i64 %"45", 2147483647, !dbg !132
  br i1 %"46", label %main_bb20, label %main_bb21, !dbg !132

main_bb20:                                        ; preds = %main_wrap_around.exit3
  %"47" = sub nsw i64 %"45", 2147483647, !dbg !133
  %"48" = sub nsw i64 %"47", 1, !dbg !133
  %"49" = srem i64 %"48", 4294967296, !dbg !133
  %"50" = add nsw i64 -2147483648, %"49", !dbg !133
  br label %main_wrap_around.exit, !dbg !133

main_bb21:                                        ; preds = %main_wrap_around.exit3
  %"51" = icmp slt i64 %"45", -2147483648, !dbg !134
  br i1 %"51", label %main_bb22, label %main_wrap_around.exit, !dbg !134

main_bb22:                                        ; preds = %main_bb21
  %"52" = sub nsw i64 -2147483648, %"45", !dbg !135
  %"53" = sub nsw i64 %"52", 1, !dbg !135
  %"54" = srem i64 %"53", 4294967296, !dbg !135
  %"55" = sub nsw i64 2147483647, %"54", !dbg !135
  br label %main_wrap_around.exit, !dbg !135

main_wrap_around.exit:                            ; preds = %main_bb20, %main_bb21, %main_bb22
  %.0.i1 = phi i64 [ %"50", %main_bb20 ], [ %"55", %main_bb22 ], [ %"45", %main_bb21 ], !dbg !114
  %"56" = icmp sge i64 %.0.i2, %.0.i1, !dbg !114
  br i1 %"56", label %main_bb23, label %main_bb15, !dbg !114

main_bb23:                                        ; preds = %main_bb15, %main_ff_subtitles_next_line.exit, %main_wrap_around.exit, %main_bb13
  ret i32 0, !dbg !136
}

declare i64 @__kittel_nondef.0()

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

declare i32 @__kittel_nondef.1()

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!18, !19}
!llvm.ident = !{!20}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !16, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [//FILES_DIR/SourceCode_SemanticAugmentor.c] [DW_LANG_C99]
!1 = metadata !{metadata !"FILES_DIR/SourceCode_SemanticAugmentor.c", metadata !"/"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9, metadata !12}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"wrap_around", metadata !"wrap_around", metadata !"", i32 13, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i64, i64, i64)* @wrap_around, null, null, metadata !2, i32 13} ; [ DW_TAG_subprogram ] [line 13] [def] [wrap_around]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"ff_subtitles_next_line", metadata !"ff_subtitles_next_line", metadata !"", i32 23, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i64 ()* @ff_subtitles_next_line, null, null, metadata !2, i32 24} ; [ DW_TAG_subprogram ] [line 23] [def] [scope 24] [ff_subtitles_next_line]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !8}
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 44, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 45} ; [ DW_TAG_subprogram ] [line 44] [def] [scope 45] [main]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{metadata !15}
!15 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!16 = metadata !{metadata !17}
!17 = metadata !{i32 786484, i32 0, null, metadata !"flag", metadata !"flag", metadata !"", metadata !5, i32 12, metadata !8, i32 0, i32 1, i64* @"'flag", null} ; [ DW_TAG_variable ] [flag] [line 12] [def]
!18 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!19 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!20 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!21 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777229, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 13]
!22 = metadata !{i32 13, i32 33, metadata !4, null}
!23 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554445, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [lower_bound] [line 13]
!24 = metadata !{i32 13, i32 50, metadata !4, null}
!25 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331661, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [upper_bound] [line 13]
!26 = metadata !{i32 13, i32 73, metadata !4, null}
!27 = metadata !{i32 14, i32 5, metadata !4, null}
!28 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 14, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [range] [line 14]
!29 = metadata !{i32 14, i32 15, metadata !4, null}
!30 = metadata !{i32 15, i32 9, metadata !31, null}
!31 = metadata !{i32 786443, metadata !1, metadata !4, i32 15, i32 9, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!32 = metadata !{i32 16, i32 9, metadata !33, null}
!33 = metadata !{i32 786443, metadata !1, metadata !31, i32 15, i32 30, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!34 = metadata !{i32 18, i32 14, metadata !35, null}
!35 = metadata !{i32 786443, metadata !1, metadata !31, i32 18, i32 14, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!36 = metadata !{i32 19, i32 9, metadata !37, null}
!37 = metadata !{i32 786443, metadata !1, metadata !35, i32 18, i32 35, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!38 = metadata !{i32 22, i32 1, metadata !4, null}
!39 = metadata !{i64 5}
!40 = metadata !{i32 786688, metadata !9, metadata !"i", metadata !5, i32 25, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 25]
!41 = metadata !{i32 25, i32 15, metadata !9, null}
!42 = metadata !{i32 26, i32 9, metadata !9, null}
!43 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777229, metadata !8, i32 0, metadata !42} ; [ DW_TAG_arg_variable ] [value] [line 13]
!44 = metadata !{i32 13, i32 33, metadata !4, metadata !42}
!45 = metadata !{i64 -2147483648}
!46 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554445, metadata !8, i32 0, metadata !42} ; [ DW_TAG_arg_variable ] [lower_bound] [line 13]
!47 = metadata !{i32 13, i32 50, metadata !4, metadata !42}
!48 = metadata !{i64 2147483647}
!49 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331661, metadata !8, i32 0, metadata !42} ; [ DW_TAG_arg_variable ] [upper_bound] [line 13]
!50 = metadata !{i32 13, i32 73, metadata !4, metadata !42}
!51 = metadata !{i64 4294967296}
!52 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 14, metadata !8, i32 0, metadata !42} ; [ DW_TAG_auto_variable ] [range] [line 14]
!53 = metadata !{i32 14, i32 15, metadata !4, metadata !42}
!54 = metadata !{i32 27, i32 9, metadata !55, null}
!55 = metadata !{i32 786443, metadata !1, metadata !9, i32 27, i32 9, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!56 = metadata !{i32 31, i32 9, metadata !57, null}
!57 = metadata !{i32 786443, metadata !1, metadata !9, i32 31, i32 9, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!58 = metadata !{i32 33, i32 9, metadata !59, null}
!59 = metadata !{i32 786443, metadata !1, metadata !57, i32 32, i32 5, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!60 = metadata !{i32 34, i32 9, metadata !59, null}
!61 = metadata !{i32 36, i32 14, metadata !62, null}
!62 = metadata !{i32 786443, metadata !1, metadata !57, i32 36, i32 14, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!63 = metadata !{i32 38, i32 12, metadata !64, null}
!64 = metadata !{i32 786443, metadata !1, metadata !62, i32 37, i32 1, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!65 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777229, metadata !8, i32 0, metadata !63} ; [ DW_TAG_arg_variable ] [value] [line 13]
!66 = metadata !{i32 13, i32 33, metadata !4, metadata !63}
!67 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554445, metadata !8, i32 0, metadata !63} ; [ DW_TAG_arg_variable ] [lower_bound] [line 13]
!68 = metadata !{i32 13, i32 50, metadata !4, metadata !63}
!69 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331661, metadata !8, i32 0, metadata !63} ; [ DW_TAG_arg_variable ] [upper_bound] [line 13]
!70 = metadata !{i32 13, i32 73, metadata !4, metadata !63}
!71 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 14, metadata !8, i32 0, metadata !63} ; [ DW_TAG_auto_variable ] [range] [line 14]
!72 = metadata !{i32 14, i32 15, metadata !4, metadata !63}
!73 = metadata !{i32 15, i32 9, metadata !31, metadata !63}
!74 = metadata !{i32 16, i32 9, metadata !33, metadata !63}
!75 = metadata !{i32 18, i32 14, metadata !35, metadata !63}
!76 = metadata !{i32 19, i32 9, metadata !37, metadata !63}
!77 = metadata !{i32 42, i32 1, metadata !9, null}
!78 = metadata !{i64 -1}
!79 = metadata !{i32 786688, metadata !12, metadata !"b", metadata !5, i32 46, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 46]
!80 = metadata !{i32 46, i32 15, metadata !12, null}
!81 = metadata !{i64 10}
!82 = metadata !{i32 786688, metadata !12, metadata !"end", metadata !5, i32 47, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [end] [line 47]
!83 = metadata !{i32 47, i32 15, metadata !12, null}
!84 = metadata !{i32 48, i32 9, metadata !85, null}
!85 = metadata !{i32 786443, metadata !1, metadata !12, i32 48, i32 9, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!86 = metadata !{i32 48, i32 9, metadata !87, null}
!87 = metadata !{i32 786443, metadata !1, metadata !85, i32 48, i32 9, i32 1, i32 17} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!88 = metadata !{i32 786688, metadata !9, metadata !"i", metadata !5, i32 25, metadata !8, i32 0, metadata !89} ; [ DW_TAG_auto_variable ] [i] [line 25]
!89 = metadata !{i32 54, i32 25, metadata !90, null}
!90 = metadata !{i32 786443, metadata !1, metadata !12, i32 53, i32 5, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!91 = metadata !{i32 25, i32 15, metadata !9, metadata !89}
!92 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777229, metadata !8, i32 0, metadata !93} ; [ DW_TAG_arg_variable ] [value] [line 13]
!93 = metadata !{i32 26, i32 9, metadata !9, metadata !89}
!94 = metadata !{i32 13, i32 33, metadata !4, metadata !93}
!95 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554445, metadata !8, i32 0, metadata !93} ; [ DW_TAG_arg_variable ] [lower_bound] [line 13]
!96 = metadata !{i32 13, i32 50, metadata !4, metadata !93}
!97 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331661, metadata !8, i32 0, metadata !93} ; [ DW_TAG_arg_variable ] [upper_bound] [line 13]
!98 = metadata !{i32 13, i32 73, metadata !4, metadata !93}
!99 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 14, metadata !8, i32 0, metadata !93} ; [ DW_TAG_auto_variable ] [range] [line 14]
!100 = metadata !{i32 14, i32 15, metadata !4, metadata !93}
!101 = metadata !{i32 27, i32 9, metadata !55, metadata !89}
!102 = metadata !{i32 786688, metadata !90, metadata !"inc", metadata !5, i32 54, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [inc] [line 54]
!103 = metadata !{i32 54, i32 19, metadata !90, null}
!104 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777229, metadata !8, i32 0, metadata !105} ; [ DW_TAG_arg_variable ] [value] [line 13]
!105 = metadata !{i32 59, i32 13, metadata !90, null}
!106 = metadata !{i32 13, i32 33, metadata !4, metadata !105}
!107 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554445, metadata !8, i32 0, metadata !105} ; [ DW_TAG_arg_variable ] [lower_bound] [line 13]
!108 = metadata !{i32 13, i32 50, metadata !4, metadata !105}
!109 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331661, metadata !8, i32 0, metadata !105} ; [ DW_TAG_arg_variable ] [upper_bound] [line 13]
!110 = metadata !{i32 13, i32 73, metadata !4, metadata !105}
!111 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 14, metadata !8, i32 0, metadata !105} ; [ DW_TAG_auto_variable ] [range] [line 14]
!112 = metadata !{i32 14, i32 15, metadata !4, metadata !105}
!113 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777229, metadata !8, i32 0, metadata !114} ; [ DW_TAG_arg_variable ] [value] [line 13]
!114 = metadata !{i32 60, i32 18, metadata !115, null}
!115 = metadata !{i32 786443, metadata !1, metadata !90, i32 60, i32 13, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!116 = metadata !{i32 13, i32 33, metadata !4, metadata !114}
!117 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554445, metadata !8, i32 0, metadata !114} ; [ DW_TAG_arg_variable ] [lower_bound] [line 13]
!118 = metadata !{i32 13, i32 50, metadata !4, metadata !114}
!119 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331661, metadata !8, i32 0, metadata !114} ; [ DW_TAG_arg_variable ] [upper_bound] [line 13]
!120 = metadata !{i32 13, i32 73, metadata !4, metadata !114}
!121 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 14, metadata !8, i32 0, metadata !114} ; [ DW_TAG_auto_variable ] [range] [line 14]
!122 = metadata !{i32 14, i32 15, metadata !4, metadata !114}
!123 = metadata !{i32 52, i32 5, metadata !12, null}
!124 = metadata !{i32 52, i32 5, metadata !125, null}
!125 = metadata !{i32 786443, metadata !1, metadata !12, i32 52, i32 5, i32 1, i32 18} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!126 = metadata !{i32 55, i32 13, metadata !127, null}
!127 = metadata !{i32 786443, metadata !1, metadata !90, i32 55, i32 13, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!128 = metadata !{i32 15, i32 9, metadata !31, metadata !105}
!129 = metadata !{i32 16, i32 9, metadata !33, metadata !105}
!130 = metadata !{i32 18, i32 14, metadata !35, metadata !105}
!131 = metadata !{i32 19, i32 9, metadata !37, metadata !105}
!132 = metadata !{i32 15, i32 9, metadata !31, metadata !114}
!133 = metadata !{i32 16, i32 9, metadata !33, metadata !114}
!134 = metadata !{i32 18, i32 14, metadata !35, metadata !114}
!135 = metadata !{i32 19, i32 9, metadata !37, metadata !114}
!136 = metadata !{i32 66, i32 1, metadata !12, null}

