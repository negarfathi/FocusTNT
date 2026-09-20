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
  %"12" = call i64 @__VERIFIER_nondet_int(), !dbg !38
  call void @llvm.dbg.value(metadata !{i64 %"12"}, i64 0, metadata !39), !dbg !40
  %"13" = load i64* @"'flag", align 8, !dbg !41
  %"14" = add nsw i64 %"13", 1, !dbg !41
  call void @llvm.dbg.value(metadata !{i64 %"14"}, i64 0, metadata !42), !dbg !43
  call void @llvm.dbg.value(metadata !44, i64 0, metadata !45), !dbg !46
  call void @llvm.dbg.value(metadata !47, i64 0, metadata !48), !dbg !49
  call void @llvm.dbg.value(metadata !50, i64 0, metadata !51), !dbg !52
  %"15" = icmp sgt i64 %"14", 2147483647, !dbg !53
  br i1 %"15", label %mdb_cursor_get_slice_1_bb6, label %mdb_cursor_get_slice_1_bb7, !dbg !53

mdb_cursor_get_slice_1_bb6:                       ; preds = %mdb_cursor_get_slice_1_bb5
  %"16" = sub nsw i64 %"14", 2147483647, !dbg !54
  %"17" = sub nsw i64 %"16", 1, !dbg !54
  %"18" = srem i64 %"17", 4294967296, !dbg !54
  %"19" = add nsw i64 -2147483648, %"18", !dbg !54
  br label %mdb_cursor_get_slice_1_wrap_around.exit, !dbg !54

mdb_cursor_get_slice_1_bb7:                       ; preds = %mdb_cursor_get_slice_1_bb5
  %"20" = icmp slt i64 %"14", -2147483648, !dbg !55
  br i1 %"20", label %mdb_cursor_get_slice_1_bb8, label %mdb_cursor_get_slice_1_wrap_around.exit, !dbg !55

mdb_cursor_get_slice_1_bb8:                       ; preds = %mdb_cursor_get_slice_1_bb7
  %"21" = sub nsw i64 -2147483648, %"14", !dbg !56
  %"22" = sub nsw i64 %"21", 1, !dbg !56
  %"23" = srem i64 %"22", 4294967296, !dbg !56
  %"24" = sub nsw i64 2147483647, %"23", !dbg !56
  br label %mdb_cursor_get_slice_1_wrap_around.exit, !dbg !56

mdb_cursor_get_slice_1_wrap_around.exit:          ; preds = %mdb_cursor_get_slice_1_bb6, %mdb_cursor_get_slice_1_bb7, %mdb_cursor_get_slice_1_bb8
  %.0.i = phi i64 [ %"19", %mdb_cursor_get_slice_1_bb6 ], [ %"24", %mdb_cursor_get_slice_1_bb8 ], [ %"14", %mdb_cursor_get_slice_1_bb7 ], !dbg !41
  store i64 %.0.i, i64* @"'flag", align 8, !dbg !41
  %"25" = load i64* @"'flag", align 8, !dbg !57
  %"26" = icmp sgt i64 %"25", 1000, !dbg !57
  br i1 %"26", label %mdb_cursor_get_slice_1_bb10, label %mdb_cursor_get_slice_1_bb9, !dbg !57

mdb_cursor_get_slice_1_bb9:                       ; preds = %mdb_cursor_get_slice_1_wrap_around.exit
  %"27" = icmp sge i64 %"12", 0, !dbg !59
  %. = select i1 %"27", i64 0, i64 1, !dbg !61
  br label %mdb_cursor_get_slice_1_bb10, !dbg !63

mdb_cursor_get_slice_1_bb10:                      ; preds = %mdb_cursor_get_slice_1_wrap_around.exit, %mdb_cursor_get_slice_1_bb9
  %__retres.1 = phi i64 [ %., %mdb_cursor_get_slice_1_bb9 ], [ 1, %mdb_cursor_get_slice_1_wrap_around.exit ]
  ret i64 %__retres.1, !dbg !64
}

declare i64 @__VERIFIER_nondet_int() #2

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb11:
  %"28" = call i64 @__VERIFIER_nondet_int() #3, !dbg !65
  call void @llvm.dbg.value(metadata !{i64 %"28"}, i64 0, metadata !67) #3, !dbg !68
  %"29" = load i64* @"'flag", align 8, !dbg !69
  %"30" = add nsw i64 %"29", 1, !dbg !69
  call void @llvm.dbg.value(metadata !{i64 %"30"}, i64 0, metadata !70) #3, !dbg !71
  call void @llvm.dbg.value(metadata !44, i64 0, metadata !72) #3, !dbg !73
  call void @llvm.dbg.value(metadata !47, i64 0, metadata !74) #3, !dbg !75
  call void @llvm.dbg.value(metadata !50, i64 0, metadata !76) #3, !dbg !77
  %"31" = icmp sgt i64 %"30", 2147483647, !dbg !78
  br i1 %"31", label %main_bb12, label %main_bb13, !dbg !78

main_bb12:                                        ; preds = %main_bb11
  %"32" = sub nsw i64 %"30", 2147483647, !dbg !79
  %"33" = sub nsw i64 %"32", 1, !dbg !79
  %"34" = srem i64 %"33", 4294967296, !dbg !79
  %"35" = add nsw i64 -2147483648, %"34", !dbg !79
  br label %main_wrap_around.exit.i, !dbg !79

main_bb13:                                        ; preds = %main_bb11
  %"36" = icmp slt i64 %"30", -2147483648, !dbg !80
  br i1 %"36", label %main_bb14, label %main_wrap_around.exit.i, !dbg !80

main_bb14:                                        ; preds = %main_bb13
  %"37" = sub nsw i64 -2147483648, %"30", !dbg !81
  %"38" = sub nsw i64 %"37", 1, !dbg !81
  %"39" = srem i64 %"38", 4294967296, !dbg !81
  %"40" = sub nsw i64 2147483647, %"39", !dbg !81
  br label %main_wrap_around.exit.i, !dbg !81

main_wrap_around.exit.i:                          ; preds = %main_bb14, %main_bb13, %main_bb12
  %.0.i.i = phi i64 [ %"35", %main_bb12 ], [ %"40", %main_bb14 ], [ %"30", %main_bb13 ], !dbg !69
  store i64 %.0.i.i, i64* @"'flag", align 8, !dbg !69
  %"41" = load i64* @"'flag", align 8, !dbg !82
  %"42" = icmp sgt i64 %"41", 1000, !dbg !82
  br i1 %"42", label %main_mdb_cursor_get_slice_1.exit, label %main_bb15, !dbg !82

main_bb15:                                        ; preds = %main_wrap_around.exit.i
  %"43" = icmp sge i64 %"28", 0, !dbg !83
  %..i = select i1 %"43", i64 0, i64 1, !dbg !84
  br label %main_mdb_cursor_get_slice_1.exit, !dbg !85

main_mdb_cursor_get_slice_1.exit:                 ; preds = %main_wrap_around.exit.i, %main_bb15
  %__retres.1.i = phi i64 [ %..i, %main_bb15 ], [ 1, %main_wrap_around.exit.i ], !dbg !66
  call void @llvm.dbg.value(metadata !{i64 %__retres.1.i}, i64 0, metadata !86), !dbg !87
  %"44" = call i64 @__VERIFIER_nondet_int(), !dbg !88
  call void @llvm.dbg.value(metadata !{i64 %"44"}, i64 0, metadata !89), !dbg !90
  call void @llvm.dbg.value(metadata !{i64 %"47"}, i64 0, metadata !91) #3, !dbg !94
  call void @llvm.dbg.value(metadata !{i64 %"49"}, i64 0, metadata !95) #3, !dbg !97
  call void @llvm.dbg.value(metadata !44, i64 0, metadata !98) #3, !dbg !99
  call void @llvm.dbg.value(metadata !47, i64 0, metadata !100) #3, !dbg !101
  call void @llvm.dbg.value(metadata !50, i64 0, metadata !102) #3, !dbg !103
  br label %main_mdb_cursor_get_slice_1.exit5, !dbg !104

main_mdb_cursor_get_slice_1.exit5:                ; preds = %main_bb21, %main_wrap_around.exit.i2, %main_bb16, %main_mdb_cursor_get_slice_1.exit
  %rc.0 = phi i64 [ %__retres.1.i, %main_mdb_cursor_get_slice_1.exit ], [ %rc.0, %main_bb16 ], [ %..i3, %main_bb21 ], [ 1, %main_wrap_around.exit.i2 ]
  %"45" = icmp eq i64 %rc.0, 0, !dbg !105
  br i1 %"45", label %main_bb16, label %main_bb22, !dbg !105

main_bb16:                                        ; preds = %main_mdb_cursor_get_slice_1.exit5
  %"46" = icmp sle i64 %"44", 0, !dbg !107
  br i1 %"46", label %main_mdb_cursor_get_slice_1.exit5, label %main_bb17, !dbg !107

main_bb17:                                        ; preds = %main_bb16
  %"47" = call i64 @__VERIFIER_nondet_int() #3, !dbg !109
  %"48" = load i64* @"'flag", align 8, !dbg !96
  %"49" = add nsw i64 %"48", 1, !dbg !96
  %"50" = icmp sgt i64 %"49", 2147483647, !dbg !110
  br i1 %"50", label %main_bb18, label %main_bb19, !dbg !110

main_bb18:                                        ; preds = %main_bb17
  %"51" = sub nsw i64 %"49", 2147483647, !dbg !111
  %"52" = sub nsw i64 %"51", 1, !dbg !111
  %"53" = srem i64 %"52", 4294967296, !dbg !111
  %"54" = add nsw i64 -2147483648, %"53", !dbg !111
  br label %main_wrap_around.exit.i2, !dbg !111

main_bb19:                                        ; preds = %main_bb17
  %"55" = icmp slt i64 %"49", -2147483648, !dbg !112
  br i1 %"55", label %main_bb20, label %main_wrap_around.exit.i2, !dbg !112

main_bb20:                                        ; preds = %main_bb19
  %"56" = sub nsw i64 -2147483648, %"49", !dbg !113
  %"57" = sub nsw i64 %"56", 1, !dbg !113
  %"58" = srem i64 %"57", 4294967296, !dbg !113
  %"59" = sub nsw i64 2147483647, %"58", !dbg !113
  br label %main_wrap_around.exit.i2, !dbg !113

main_wrap_around.exit.i2:                         ; preds = %main_bb20, %main_bb19, %main_bb18
  %.0.i.i1 = phi i64 [ %"54", %main_bb18 ], [ %"59", %main_bb20 ], [ %"49", %main_bb19 ], !dbg !96
  store i64 %.0.i.i1, i64* @"'flag", align 8, !dbg !96
  %"60" = load i64* @"'flag", align 8, !dbg !114
  %"61" = icmp sgt i64 %"60", 1000, !dbg !114
  br i1 %"61", label %main_mdb_cursor_get_slice_1.exit5, label %main_bb21, !dbg !114

main_bb21:                                        ; preds = %main_wrap_around.exit.i2
  %"62" = icmp sge i64 %"47", 0, !dbg !115
  %..i3 = select i1 %"62", i64 0, i64 1, !dbg !116
  br label %main_mdb_cursor_get_slice_1.exit5, !dbg !117

main_bb22:                                        ; preds = %main_mdb_cursor_get_slice_1.exit5
  ret void, !dbg !118
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
!38 = metadata !{i32 21, i32 17, metadata !9, null}
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
!65 = metadata !{i32 21, i32 17, metadata !9, metadata !66}
!66 = metadata !{i32 36, i32 8, metadata !12, null}
!67 = metadata !{i32 786688, metadata !9, metadata !"i", metadata !5, i32 21, metadata !8, i32 0, metadata !66} ; [ DW_TAG_auto_variable ] [i] [line 21]
!68 = metadata !{i32 21, i32 13, metadata !9, metadata !66}
!69 = metadata !{i32 22, i32 11, metadata !9, metadata !66}
!70 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777224, metadata !8, i32 0, metadata !69} ; [ DW_TAG_arg_variable ] [value] [line 8]
!71 = metadata !{i32 8, i32 33, metadata !4, metadata !69} ; [ DW_TAG_imported_declaration ]
!72 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554440, metadata !8, i32 0, metadata !69} ; [ DW_TAG_arg_variable ] [lower_bound] [line 8]
!73 = metadata !{i32 8, i32 50, metadata !4, metadata !69} ; [ DW_TAG_imported_declaration ]
!74 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331656, metadata !8, i32 0, metadata !69} ; [ DW_TAG_arg_variable ] [upper_bound] [line 8]
!75 = metadata !{i32 8, i32 73, metadata !4, metadata !69} ; [ DW_TAG_imported_declaration ]
!76 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 9, metadata !8, i32 0, metadata !69} ; [ DW_TAG_auto_variable ] [range] [line 9]
!77 = metadata !{i32 9, i32 15, metadata !4, metadata !69}
!78 = metadata !{i32 10, i32 9, metadata !30, metadata !69}
!79 = metadata !{i32 11, i32 9, metadata !32, metadata !69}
!80 = metadata !{i32 13, i32 14, metadata !34, metadata !69}
!81 = metadata !{i32 14, i32 9, metadata !36, metadata !69}
!82 = metadata !{i32 23, i32 7, metadata !58, metadata !66}
!83 = metadata !{i32 27, i32 7, metadata !60, metadata !66}
!84 = metadata !{i32 29, i32 1, metadata !62, metadata !66}
!85 = metadata !{i32 27, i32 12, metadata !60, metadata !66}
!86 = metadata !{i32 786688, metadata !12, metadata !"rc", metadata !5, i32 35, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rc] [line 35]
!87 = metadata !{i32 35, i32 13, metadata !12, null}
!88 = metadata !{i32 37, i32 28, metadata !12, null}
!89 = metadata !{i32 786688, metadata !12, metadata !"dval_mv_size", metadata !5, i32 37, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dval_mv_size] [line 37]
!90 = metadata !{i32 37, i32 13, metadata !12, null}
!91 = metadata !{i32 786688, metadata !9, metadata !"i", metadata !5, i32 21, metadata !8, i32 0, metadata !92} ; [ DW_TAG_auto_variable ] [i] [line 21]
!92 = metadata !{i32 42, i32 10, metadata !93, null}
!93 = metadata !{i32 786443, metadata !1, metadata !12, i32 38, i32 19, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!94 = metadata !{i32 21, i32 13, metadata !9, metadata !92}
!95 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777224, metadata !8, i32 0, metadata !96} ; [ DW_TAG_arg_variable ] [value] [line 8]
!96 = metadata !{i32 22, i32 11, metadata !9, metadata !92}
!97 = metadata !{i32 8, i32 33, metadata !4, metadata !96} ; [ DW_TAG_imported_declaration ]
!98 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554440, metadata !8, i32 0, metadata !96} ; [ DW_TAG_arg_variable ] [lower_bound] [line 8]
!99 = metadata !{i32 8, i32 50, metadata !4, metadata !96} ; [ DW_TAG_imported_declaration ]
!100 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331656, metadata !8, i32 0, metadata !96} ; [ DW_TAG_arg_variable ] [upper_bound] [line 8]
!101 = metadata !{i32 8, i32 73, metadata !4, metadata !96} ; [ DW_TAG_imported_declaration ]
!102 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 9, metadata !8, i32 0, metadata !96} ; [ DW_TAG_auto_variable ] [range] [line 9]
!103 = metadata !{i32 9, i32 15, metadata !4, metadata !96}
!104 = metadata !{i32 38, i32 3, metadata !12, null}
!105 = metadata !{i32 38, i32 3, metadata !106, null}
!106 = metadata !{i32 786443, metadata !1, metadata !12, i32 38, i32 3, i32 1, i32 11} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!107 = metadata !{i32 39, i32 9, metadata !108, null}
!108 = metadata !{i32 786443, metadata !1, metadata !93, i32 39, i32 9, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!109 = metadata !{i32 21, i32 17, metadata !9, metadata !92}
!110 = metadata !{i32 10, i32 9, metadata !30, metadata !96}
!111 = metadata !{i32 11, i32 9, metadata !32, metadata !96}
!112 = metadata !{i32 13, i32 14, metadata !34, metadata !96}
!113 = metadata !{i32 14, i32 9, metadata !36, metadata !96}
!114 = metadata !{i32 23, i32 7, metadata !58, metadata !92}
!115 = metadata !{i32 27, i32 7, metadata !60, metadata !92}
!116 = metadata !{i32 29, i32 1, metadata !62, metadata !92}
!117 = metadata !{i32 27, i32 12, metadata !60, metadata !92}
!118 = metadata !{i32 44, i32 3, metadata !12, null}

