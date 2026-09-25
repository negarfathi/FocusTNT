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
define i64 @mdb_cursor_get_slice_1() #0 {
mdb_cursor_get_slice_1_bb5:
  call void @llvm.dbg.value(metadata !38, i64 0, metadata !39), !dbg !40
  %"12" = load i64* @"'flag", align 8, !dbg !41
  %"13" = add nsw i64 %"12", 1, !dbg !41
  call void @llvm.dbg.value(metadata !{i64 %"13"}, i64 0, metadata !42), !dbg !43
  call void @llvm.dbg.value(metadata !44, i64 0, metadata !45), !dbg !46
  call void @llvm.dbg.value(metadata !47, i64 0, metadata !48), !dbg !49
  call void @llvm.dbg.value(metadata !50, i64 0, metadata !51), !dbg !52
  %"14" = icmp sgt i64 %"13", 2147483647, !dbg !53
  br i1 %"14", label %mdb_cursor_get_slice_1_bb6, label %mdb_cursor_get_slice_1_bb7, !dbg !53

mdb_cursor_get_slice_1_bb6:                       ; preds = %mdb_cursor_get_slice_1_bb5
  %"15" = sub nsw i64 %"13", 2147483647, !dbg !54
  %"16" = sub nsw i64 %"15", 1, !dbg !54
  %"17" = srem i64 %"16", 4294967296, !dbg !54
  %"18" = add nsw i64 -2147483648, %"17", !dbg !54
  br label %mdb_cursor_get_slice_1_wrap_around.exit, !dbg !54

mdb_cursor_get_slice_1_bb7:                       ; preds = %mdb_cursor_get_slice_1_bb5
  %"19" = icmp slt i64 %"13", -2147483648, !dbg !55
  br i1 %"19", label %mdb_cursor_get_slice_1_bb8, label %mdb_cursor_get_slice_1_wrap_around.exit, !dbg !55

mdb_cursor_get_slice_1_bb8:                       ; preds = %mdb_cursor_get_slice_1_bb7
  %"20" = sub nsw i64 -2147483648, %"13", !dbg !56
  %"21" = sub nsw i64 %"20", 1, !dbg !56
  %"22" = srem i64 %"21", 4294967296, !dbg !56
  %"23" = sub nsw i64 2147483647, %"22", !dbg !56
  br label %mdb_cursor_get_slice_1_wrap_around.exit, !dbg !56

mdb_cursor_get_slice_1_wrap_around.exit:          ; preds = %mdb_cursor_get_slice_1_bb6, %mdb_cursor_get_slice_1_bb7, %mdb_cursor_get_slice_1_bb8
  %.0.i = phi i64 [ %"18", %mdb_cursor_get_slice_1_bb6 ], [ %"23", %mdb_cursor_get_slice_1_bb8 ], [ %"13", %mdb_cursor_get_slice_1_bb7 ], !dbg !41
  store i64 %.0.i, i64* @"'flag", align 8, !dbg !41
  %"24" = load i64* @"'flag", align 8, !dbg !57
  %"25" = icmp sgt i64 %"24", 1000, !dbg !57
  br i1 %"25", label %mdb_cursor_get_slice_1_bb10, label %mdb_cursor_get_slice_1_bb9, !dbg !57

mdb_cursor_get_slice_1_bb9:                       ; preds = %mdb_cursor_get_slice_1_wrap_around.exit
  %"26" = icmp sge i64 0, 0, !dbg !59
  %. = select i1 %"26", i64 0, i64 1, !dbg !61
  br label %mdb_cursor_get_slice_1_bb10, !dbg !63

mdb_cursor_get_slice_1_bb10:                      ; preds = %mdb_cursor_get_slice_1_wrap_around.exit, %mdb_cursor_get_slice_1_bb9
  %__retres.1 = phi i64 [ %., %mdb_cursor_get_slice_1_bb9 ], [ 1, %mdb_cursor_get_slice_1_wrap_around.exit ]
  ret i64 %__retres.1, !dbg !64
}

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb11:
  call void @llvm.dbg.value(metadata !38, i64 0, metadata !65), !dbg !67
  %"27" = load i64* @"'flag", align 8, !dbg !68
  %"28" = add nsw i64 %"27", 1, !dbg !68
  call void @llvm.dbg.value(metadata !{i64 %"28"}, i64 0, metadata !69), !dbg !70
  call void @llvm.dbg.value(metadata !44, i64 0, metadata !71), !dbg !72
  call void @llvm.dbg.value(metadata !47, i64 0, metadata !73), !dbg !74
  call void @llvm.dbg.value(metadata !50, i64 0, metadata !75), !dbg !76
  %"29" = icmp sgt i64 %"28", 2147483647, !dbg !77
  br i1 %"29", label %main_bb12, label %main_bb13, !dbg !77

main_bb12:                                        ; preds = %main_bb11
  %"30" = sub nsw i64 %"28", 2147483647, !dbg !78
  %"31" = sub nsw i64 %"30", 1, !dbg !78
  %"32" = srem i64 %"31", 4294967296, !dbg !78
  %"33" = add nsw i64 -2147483648, %"32", !dbg !78
  br label %main_wrap_around.exit.i, !dbg !78

main_bb13:                                        ; preds = %main_bb11
  %"34" = icmp slt i64 %"28", -2147483648, !dbg !79
  br i1 %"34", label %main_bb14, label %main_wrap_around.exit.i, !dbg !79

main_bb14:                                        ; preds = %main_bb13
  %"35" = sub nsw i64 -2147483648, %"28", !dbg !80
  %"36" = sub nsw i64 %"35", 1, !dbg !80
  %"37" = srem i64 %"36", 4294967296, !dbg !80
  %"38" = sub nsw i64 2147483647, %"37", !dbg !80
  br label %main_wrap_around.exit.i, !dbg !80

main_wrap_around.exit.i:                          ; preds = %main_bb14, %main_bb13, %main_bb12
  %.0.i.i = phi i64 [ %"33", %main_bb12 ], [ %"38", %main_bb14 ], [ %"28", %main_bb13 ], !dbg !68
  store i64 %.0.i.i, i64* @"'flag", align 8, !dbg !68
  %"39" = load i64* @"'flag", align 8, !dbg !81
  %"40" = icmp sgt i64 %"39", 1000, !dbg !81
  %. = select i1 %"40", i64 1, i64 0, !dbg !81
  call void @llvm.dbg.value(metadata !{i64 %.}, i64 0, metadata !82), !dbg !83
  call void @llvm.dbg.value(metadata !38, i64 0, metadata !84), !dbg !85
  call void @llvm.dbg.value(metadata !38, i64 0, metadata !86), !dbg !91
  call void @llvm.dbg.value(metadata !{i64 %"44"}, i64 0, metadata !92), !dbg !94
  call void @llvm.dbg.value(metadata !44, i64 0, metadata !95), !dbg !96
  call void @llvm.dbg.value(metadata !47, i64 0, metadata !97), !dbg !98
  call void @llvm.dbg.value(metadata !50, i64 0, metadata !99), !dbg !100
  call void @llvm.dbg.value(metadata !{i64 %.9}, i64 0, metadata !82), !dbg !83
  call void @llvm.dbg.value(metadata !38, i64 0, metadata !101), !dbg !103
  call void @llvm.dbg.value(metadata !{i64 %"44"}, i64 0, metadata !104), !dbg !106
  call void @llvm.dbg.value(metadata !44, i64 0, metadata !107), !dbg !108
  call void @llvm.dbg.value(metadata !47, i64 0, metadata !109), !dbg !110
  call void @llvm.dbg.value(metadata !50, i64 0, metadata !111), !dbg !112
  call void @llvm.dbg.value(metadata !{i64 %.10}, i64 0, metadata !82), !dbg !83
  br label %main_bb15, !dbg !113

main_bb15:                                        ; preds = %main_wrap_around.exit.i2, %main_wrap_around.exit.i6, %main_wrap_around.exit.i
  %rc.0 = phi i64 [ %., %main_wrap_around.exit.i ], [ %.9, %main_wrap_around.exit.i6 ], [ %.10, %main_wrap_around.exit.i2 ]
  %"41" = icmp eq i64 %rc.0, 0, !dbg !114
  br i1 %"41", label %main_bb16, label %main_bb25, !dbg !114

main_bb16:                                        ; preds = %main_bb15
  %"42" = icmp sle i64 0, 0, !dbg !116
  %"43" = load i64* @"'flag", align 8, !dbg !93
  %"44" = add nsw i64 %"43", 1, !dbg !93
  %"45" = icmp sgt i64 %"44", 2147483647, !dbg !117
  br i1 %"42", label %main_bb17, label %main_bb21, !dbg !116

main_bb17:                                        ; preds = %main_bb16
  br i1 %"45", label %main_bb18, label %main_bb19, !dbg !117

main_bb18:                                        ; preds = %main_bb17
  %"46" = sub nsw i64 %"44", 2147483647, !dbg !118
  %"47" = sub nsw i64 %"46", 1, !dbg !118
  %"48" = srem i64 %"47", 4294967296, !dbg !118
  %"49" = add nsw i64 -2147483648, %"48", !dbg !118
  br label %main_wrap_around.exit.i6, !dbg !118

main_bb19:                                        ; preds = %main_bb17
  %"50" = icmp slt i64 %"44", -2147483648, !dbg !119
  br i1 %"50", label %main_bb20, label %main_wrap_around.exit.i6, !dbg !119

main_bb20:                                        ; preds = %main_bb19
  %"51" = sub nsw i64 -2147483648, %"44", !dbg !120
  %"52" = sub nsw i64 %"51", 1, !dbg !120
  %"53" = srem i64 %"52", 4294967296, !dbg !120
  %"54" = sub nsw i64 2147483647, %"53", !dbg !120
  br label %main_wrap_around.exit.i6, !dbg !120

main_wrap_around.exit.i6:                         ; preds = %main_bb20, %main_bb19, %main_bb18
  %.0.i.i5 = phi i64 [ %"49", %main_bb18 ], [ %"54", %main_bb20 ], [ %"44", %main_bb19 ], !dbg !93
  store i64 %.0.i.i5, i64* @"'flag", align 8, !dbg !93
  %"55" = load i64* @"'flag", align 8, !dbg !121
  %"56" = icmp sgt i64 %"55", 1000, !dbg !121
  %.9 = select i1 %"56", i64 1, i64 0, !dbg !121
  br label %main_bb15, !dbg !122

main_bb21:                                        ; preds = %main_bb16
  br i1 %"45", label %main_bb22, label %main_bb23, !dbg !123

main_bb22:                                        ; preds = %main_bb21
  %"57" = sub nsw i64 %"44", 2147483647, !dbg !124
  %"58" = sub nsw i64 %"57", 1, !dbg !124
  %"59" = srem i64 %"58", 4294967296, !dbg !124
  %"60" = add nsw i64 -2147483648, %"59", !dbg !124
  br label %main_wrap_around.exit.i2, !dbg !124

main_bb23:                                        ; preds = %main_bb21
  %"61" = icmp slt i64 %"44", -2147483648, !dbg !125
  br i1 %"61", label %main_bb24, label %main_wrap_around.exit.i2, !dbg !125

main_bb24:                                        ; preds = %main_bb23
  %"62" = sub nsw i64 -2147483648, %"44", !dbg !126
  %"63" = sub nsw i64 %"62", 1, !dbg !126
  %"64" = srem i64 %"63", 4294967296, !dbg !126
  %"65" = sub nsw i64 2147483647, %"64", !dbg !126
  br label %main_wrap_around.exit.i2, !dbg !126

main_wrap_around.exit.i2:                         ; preds = %main_bb24, %main_bb23, %main_bb22
  %.0.i.i1 = phi i64 [ %"60", %main_bb22 ], [ %"65", %main_bb24 ], [ %"44", %main_bb23 ], !dbg !105
  store i64 %.0.i.i1, i64* @"'flag", align 8, !dbg !105
  %"66" = load i64* @"'flag", align 8, !dbg !127
  %"67" = icmp sgt i64 %"66", 1000, !dbg !127
  %.10 = select i1 %"67", i64 1, i64 0, !dbg !127
  br label %main_bb15, !dbg !128

main_bb25:                                        ; preds = %main_bb15
  ret void, !dbg !129
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
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"mdb_cursor_get_slice_1", metadata !"mdb_cursor_get_slice_1", metadata !"", i32 18, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 ()* @mdb_cursor_get_slice_1, null, null, metadata !2, i32 19} ; [ DW_TAG_subprogram ] [line 18] [def] [scope 19] [mdb_cursor_get_slice_1]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !8}
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 33, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @main, null, null, metadata !2, i32 34} ; [ DW_TAG_subprogram ] [line 33] [def] [scope 34] [main]
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
!38 = metadata !{i64 0}
!39 = metadata !{i32 786688, metadata !9, metadata !"i", metadata !5, i32 21, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 21]
!40 = metadata !{i32 21, i32 13, metadata !9, null}
!41 = metadata !{i32 22, i32 11, metadata !9, null}
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
!53 = metadata !{i32 10, i32 9, metadata !30, metadata !41}
!54 = metadata !{i32 11, i32 9, metadata !32, metadata !41}
!55 = metadata !{i32 13, i32 14, metadata !34, metadata !41}
!56 = metadata !{i32 14, i32 9, metadata !36, metadata !41}
!57 = metadata !{i32 23, i32 7, metadata !58, null}
!58 = metadata !{i32 786443, metadata !1, metadata !9, i32 23, i32 7, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!59 = metadata !{i32 27, i32 7, metadata !60, null}
!60 = metadata !{i32 786443, metadata !1, metadata !9, i32 27, i32 7, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!61 = metadata !{i32 29, i32 1, metadata !62, null}
!62 = metadata !{i32 786443, metadata !1, metadata !60, i32 28, i32 1, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!63 = metadata !{i32 27, i32 12, metadata !60, null}
!64 = metadata !{i32 30, i32 17, metadata !9, null}
!65 = metadata !{i32 786688, metadata !9, metadata !"i", metadata !5, i32 21, metadata !8, i32 0, metadata !66} ; [ DW_TAG_auto_variable ] [i] [line 21]
!66 = metadata !{i32 36, i32 8, metadata !12, null}
!67 = metadata !{i32 21, i32 13, metadata !9, metadata !66}
!68 = metadata !{i32 22, i32 11, metadata !9, metadata !66}
!69 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777224, metadata !8, i32 0, metadata !68} ; [ DW_TAG_arg_variable ] [value] [line 8]
!70 = metadata !{i32 8, i32 33, metadata !4, metadata !68} ; [ DW_TAG_imported_declaration ]
!71 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554440, metadata !8, i32 0, metadata !68} ; [ DW_TAG_arg_variable ] [lower_bound] [line 8]
!72 = metadata !{i32 8, i32 50, metadata !4, metadata !68} ; [ DW_TAG_imported_declaration ]
!73 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331656, metadata !8, i32 0, metadata !68} ; [ DW_TAG_arg_variable ] [upper_bound] [line 8]
!74 = metadata !{i32 8, i32 73, metadata !4, metadata !68} ; [ DW_TAG_imported_declaration ]
!75 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 9, metadata !8, i32 0, metadata !68} ; [ DW_TAG_auto_variable ] [range] [line 9]
!76 = metadata !{i32 9, i32 15, metadata !4, metadata !68}
!77 = metadata !{i32 10, i32 9, metadata !30, metadata !68}
!78 = metadata !{i32 11, i32 9, metadata !32, metadata !68}
!79 = metadata !{i32 13, i32 14, metadata !34, metadata !68}
!80 = metadata !{i32 14, i32 9, metadata !36, metadata !68}
!81 = metadata !{i32 23, i32 7, metadata !58, metadata !66}
!82 = metadata !{i32 786688, metadata !12, metadata !"rc", metadata !5, i32 35, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rc] [line 35]
!83 = metadata !{i32 35, i32 13, metadata !12, null}
!84 = metadata !{i32 786688, metadata !12, metadata !"dval_mv_size", metadata !5, i32 37, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dval_mv_size] [line 37]
!85 = metadata !{i32 37, i32 13, metadata !12, null}
!86 = metadata !{i32 786688, metadata !9, metadata !"i", metadata !5, i32 21, metadata !8, i32 0, metadata !87} ; [ DW_TAG_auto_variable ] [i] [line 21]
!87 = metadata !{i32 40, i32 12, metadata !88, null}
!88 = metadata !{i32 786443, metadata !1, metadata !89, i32 39, i32 28, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!89 = metadata !{i32 786443, metadata !1, metadata !90, i32 39, i32 9, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!90 = metadata !{i32 786443, metadata !1, metadata !12, i32 38, i32 19, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!91 = metadata !{i32 21, i32 13, metadata !9, metadata !87}
!92 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777224, metadata !8, i32 0, metadata !93} ; [ DW_TAG_arg_variable ] [value] [line 8]
!93 = metadata !{i32 22, i32 11, metadata !9, metadata !87}
!94 = metadata !{i32 8, i32 33, metadata !4, metadata !93} ; [ DW_TAG_imported_declaration ]
!95 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554440, metadata !8, i32 0, metadata !93} ; [ DW_TAG_arg_variable ] [lower_bound] [line 8]
!96 = metadata !{i32 8, i32 50, metadata !4, metadata !93} ; [ DW_TAG_imported_declaration ]
!97 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331656, metadata !8, i32 0, metadata !93} ; [ DW_TAG_arg_variable ] [upper_bound] [line 8]
!98 = metadata !{i32 8, i32 73, metadata !4, metadata !93} ; [ DW_TAG_imported_declaration ]
!99 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 9, metadata !8, i32 0, metadata !93} ; [ DW_TAG_auto_variable ] [range] [line 9]
!100 = metadata !{i32 9, i32 15, metadata !4, metadata !93}
!101 = metadata !{i32 786688, metadata !9, metadata !"i", metadata !5, i32 21, metadata !8, i32 0, metadata !102} ; [ DW_TAG_auto_variable ] [i] [line 21]
!102 = metadata !{i32 43, i32 10, metadata !90, null}
!103 = metadata !{i32 21, i32 13, metadata !9, metadata !102}
!104 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777224, metadata !8, i32 0, metadata !105} ; [ DW_TAG_arg_variable ] [value] [line 8]
!105 = metadata !{i32 22, i32 11, metadata !9, metadata !102}
!106 = metadata !{i32 8, i32 33, metadata !4, metadata !105} ; [ DW_TAG_imported_declaration ]
!107 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554440, metadata !8, i32 0, metadata !105} ; [ DW_TAG_arg_variable ] [lower_bound] [line 8]
!108 = metadata !{i32 8, i32 50, metadata !4, metadata !105} ; [ DW_TAG_imported_declaration ]
!109 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331656, metadata !8, i32 0, metadata !105} ; [ DW_TAG_arg_variable ] [upper_bound] [line 8]
!110 = metadata !{i32 8, i32 73, metadata !4, metadata !105} ; [ DW_TAG_imported_declaration ]
!111 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 9, metadata !8, i32 0, metadata !105} ; [ DW_TAG_auto_variable ] [range] [line 9]
!112 = metadata !{i32 9, i32 15, metadata !4, metadata !105}
!113 = metadata !{i32 38, i32 3, metadata !12, null}
!114 = metadata !{i32 38, i32 3, metadata !115, null}
!115 = metadata !{i32 786443, metadata !1, metadata !12, i32 38, i32 3, i32 1, i32 11} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!116 = metadata !{i32 39, i32 9, metadata !89, null}
!117 = metadata !{i32 10, i32 9, metadata !30, metadata !93}
!118 = metadata !{i32 11, i32 9, metadata !32, metadata !93}
!119 = metadata !{i32 13, i32 14, metadata !34, metadata !93}
!120 = metadata !{i32 14, i32 9, metadata !36, metadata !93}
!121 = metadata !{i32 23, i32 7, metadata !58, metadata !87}
!122 = metadata !{i32 41, i32 7, metadata !88, null}
!123 = metadata !{i32 10, i32 9, metadata !30, metadata !105}
!124 = metadata !{i32 11, i32 9, metadata !32, metadata !105}
!125 = metadata !{i32 13, i32 14, metadata !34, metadata !105}
!126 = metadata !{i32 14, i32 9, metadata !36, metadata !105}
!127 = metadata !{i32 23, i32 7, metadata !58, metadata !102}
!128 = metadata !{i32 44, i32 3, metadata !90, null}
!129 = metadata !{i32 45, i32 3, metadata !12, null}

