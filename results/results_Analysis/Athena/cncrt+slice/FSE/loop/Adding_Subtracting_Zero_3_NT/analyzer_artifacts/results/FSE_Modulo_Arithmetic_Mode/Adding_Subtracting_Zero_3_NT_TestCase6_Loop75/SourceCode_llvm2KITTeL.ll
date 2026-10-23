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
define i64 @read_slice_1(i64 %loc, i64 %len) #0 {
read_slice_1_bb5:
  call void @llvm.dbg.value(metadata !{i64 %loc}, i64 0, metadata !38), !dbg !39
  call void @llvm.dbg.value(metadata !{i64 %len}, i64 0, metadata !40), !dbg !41
  call void @llvm.dbg.value(metadata !42, i64 0, metadata !43), !dbg !44
  call void @llvm.dbg.value(metadata !{i64 %"13"}, i64 0, metadata !45), !dbg !48
  call void @llvm.dbg.value(metadata !49, i64 0, metadata !50), !dbg !51
  call void @llvm.dbg.value(metadata !52, i64 0, metadata !53), !dbg !54
  call void @llvm.dbg.value(metadata !55, i64 0, metadata !56), !dbg !57
  call void @llvm.dbg.value(metadata !{i64 %.0.i}, i64 0, metadata !43), !dbg !44
  call void @llvm.dbg.value(metadata !{i64 %"24"}, i64 0, metadata !58), !dbg !60
  call void @llvm.dbg.value(metadata !49, i64 0, metadata !61), !dbg !62
  call void @llvm.dbg.value(metadata !52, i64 0, metadata !63), !dbg !64
  call void @llvm.dbg.value(metadata !55, i64 0, metadata !65), !dbg !66
  br label %read_slice_1_wrap_around.exit2, !dbg !67

read_slice_1_wrap_around.exit2:                   ; preds = %read_slice_1_bb12, %read_slice_1_bb11, %read_slice_1_bb10, %read_slice_1_bb5
  %count.0 = phi i64 [ 0, %read_slice_1_bb5 ], [ %.0.i, %read_slice_1_bb10 ], [ %.0.i, %read_slice_1_bb11 ], [ %.0.i, %read_slice_1_bb12 ]
  %.0 = phi i64 [ %loc, %read_slice_1_bb5 ], [ %"29", %read_slice_1_bb10 ], [ %"34", %read_slice_1_bb12 ], [ %"24", %read_slice_1_bb11 ]
  %"12" = icmp slt i64 %.0, %len, !dbg !68
  br i1 %"12", label %read_slice_1_bb6, label %read_slice_1_bb13, !dbg !68

read_slice_1_bb6:                                 ; preds = %read_slice_1_wrap_around.exit2
  %"13" = add nsw i64 %count.0, 1, !dbg !46
  %"14" = icmp sgt i64 %"13", 2147483647, !dbg !70
  br i1 %"14", label %read_slice_1_bb7, label %read_slice_1_bb8, !dbg !70

read_slice_1_bb7:                                 ; preds = %read_slice_1_bb6
  %"15" = sub nsw i64 %"13", 2147483647, !dbg !71
  %"16" = sub nsw i64 %"15", 1, !dbg !71
  %"17" = srem i64 %"16", 4294967296, !dbg !71
  %"18" = add nsw i64 -2147483648, %"17", !dbg !71
  br label %read_slice_1_wrap_around.exit, !dbg !71

read_slice_1_bb8:                                 ; preds = %read_slice_1_bb6
  %"19" = icmp slt i64 %"13", -2147483648, !dbg !72
  br i1 %"19", label %read_slice_1_bb9, label %read_slice_1_wrap_around.exit, !dbg !72

read_slice_1_bb9:                                 ; preds = %read_slice_1_bb8
  %"20" = sub nsw i64 -2147483648, %"13", !dbg !73
  %"21" = sub nsw i64 %"20", 1, !dbg !73
  %"22" = srem i64 %"21", 4294967296, !dbg !73
  %"23" = sub nsw i64 2147483647, %"22", !dbg !73
  br label %read_slice_1_wrap_around.exit, !dbg !73

read_slice_1_wrap_around.exit:                    ; preds = %read_slice_1_bb7, %read_slice_1_bb8, %read_slice_1_bb9
  %.0.i = phi i64 [ %"18", %read_slice_1_bb7 ], [ %"23", %read_slice_1_bb9 ], [ %"13", %read_slice_1_bb8 ], !dbg !46
  %"24" = add nsw i64 %.0, 1, !dbg !59
  %"25" = icmp sgt i64 %"24", 2147483647, !dbg !74
  br i1 %"25", label %read_slice_1_bb10, label %read_slice_1_bb11, !dbg !74

read_slice_1_bb10:                                ; preds = %read_slice_1_wrap_around.exit
  %"26" = sub nsw i64 %"24", 2147483647, !dbg !75
  %"27" = sub nsw i64 %"26", 1, !dbg !75
  %"28" = srem i64 %"27", 4294967296, !dbg !75
  %"29" = add nsw i64 -2147483648, %"28", !dbg !75
  br label %read_slice_1_wrap_around.exit2, !dbg !75

read_slice_1_bb11:                                ; preds = %read_slice_1_wrap_around.exit
  %"30" = icmp slt i64 %"24", -2147483648, !dbg !76
  br i1 %"30", label %read_slice_1_bb12, label %read_slice_1_wrap_around.exit2, !dbg !76

read_slice_1_bb12:                                ; preds = %read_slice_1_bb11
  %"31" = sub nsw i64 -2147483648, %"24", !dbg !77
  %"32" = sub nsw i64 %"31", 1, !dbg !77
  %"33" = srem i64 %"32", 4294967296, !dbg !77
  %"34" = sub nsw i64 2147483647, %"33", !dbg !77
  br label %read_slice_1_wrap_around.exit2, !dbg !77

read_slice_1_bb13:                                ; preds = %read_slice_1_wrap_around.exit2
  call void @llvm.dbg.value(metadata !{i64 %count.0}, i64 0, metadata !78), !dbg !79
  ret i64 %count.0, !dbg !80
}

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb14:
  call void @llvm.dbg.value(metadata !42, i64 0, metadata !81), !dbg !82
  call void @llvm.dbg.value(metadata !83, i64 0, metadata !84), !dbg !85
  store i64 0, i64* @"'flag", align 8, !dbg !86
  %"35" = icmp sle i64 4000, 0, !dbg !87
  %"36" = icmp sgt i64 4000, 65536, !dbg !89
  %or.cond = or i1 %"35", %"36", !dbg !87
  br i1 %or.cond, label %main_bb29, label %main_wrap_around.exit2, !dbg !87

main_wrap_around.exit2:                           ; preds = %main_bb14, %main_bb28, %main_bb27, %main_bb26
  %pos.0 = phi i64 [ %"77", %main_bb26 ], [ %"82", %main_bb28 ], [ %"72", %main_bb27 ], [ 0, %main_bb14 ]
  %"37" = icmp slt i64 %pos.0, 4000, !dbg !91
  br i1 %"37", label %main_bb15, label %main_bb29, !dbg !91

main_bb15:                                        ; preds = %main_wrap_around.exit2
  %"38" = sub nsw i64 4000, %pos.0, !dbg !93
  %"39" = icmp sgt i64 %"38", 2147483647, !dbg !95
  br i1 %"39", label %main_bb16, label %main_bb17, !dbg !95

main_bb16:                                        ; preds = %main_bb15
  %"40" = sub nsw i64 %"38", 2147483647, !dbg !96
  %"41" = sub nsw i64 %"40", 1, !dbg !96
  %"42" = srem i64 %"41", 4294967296, !dbg !96
  %"43" = add nsw i64 -2147483648, %"42", !dbg !96
  br label %main_wrap_around.exit, !dbg !96

main_bb17:                                        ; preds = %main_bb15
  %"44" = icmp slt i64 %"38", -2147483648, !dbg !97
  br i1 %"44", label %main_bb18, label %main_wrap_around.exit, !dbg !97

main_bb18:                                        ; preds = %main_bb17
  %"45" = sub nsw i64 -2147483648, %"38", !dbg !98
  %"46" = sub nsw i64 %"45", 1, !dbg !98
  %"47" = srem i64 %"46", 4294967296, !dbg !98
  %"48" = sub nsw i64 2147483647, %"47", !dbg !98
  br label %main_wrap_around.exit, !dbg !98

main_wrap_around.exit:                            ; preds = %main_bb16, %main_bb17, %main_bb18
  %.0.i = phi i64 [ %"43", %main_bb16 ], [ %"48", %main_bb18 ], [ %"38", %main_bb17 ], !dbg !93
  br label %main_wrap_around.exit2.i, !dbg !99

main_wrap_around.exit2.i:                         ; preds = %main_bb25, %main_bb24, %main_bb23, %main_wrap_around.exit
  %count.0.i = phi i64 [ 0, %main_wrap_around.exit ], [ %.0.i.i, %main_bb23 ], [ %.0.i.i, %main_bb24 ], [ %.0.i.i, %main_bb25 ], !dbg !100
  %.0.i3 = phi i64 [ %pos.0, %main_wrap_around.exit ], [ %"66", %main_bb23 ], [ %"71", %main_bb25 ], [ %"61", %main_bb24 ], !dbg !100
  %"49" = icmp slt i64 %.0.i3, %.0.i, !dbg !101
  br i1 %"49", label %main_bb19, label %main_read_slice_1.exit, !dbg !101

main_bb19:                                        ; preds = %main_wrap_around.exit2.i
  %"50" = add nsw i64 %count.0.i, 1, !dbg !102
  %"51" = icmp sgt i64 %"50", 2147483647, !dbg !103
  br i1 %"51", label %main_bb20, label %main_bb21, !dbg !103

main_bb20:                                        ; preds = %main_bb19
  %"52" = sub nsw i64 %"50", 2147483647, !dbg !104
  %"53" = sub nsw i64 %"52", 1, !dbg !104
  %"54" = srem i64 %"53", 4294967296, !dbg !104
  %"55" = add nsw i64 -2147483648, %"54", !dbg !104
  br label %main_wrap_around.exit.i, !dbg !104

main_bb21:                                        ; preds = %main_bb19
  %"56" = icmp slt i64 %"50", -2147483648, !dbg !105
  br i1 %"56", label %main_bb22, label %main_wrap_around.exit.i, !dbg !105

main_bb22:                                        ; preds = %main_bb21
  %"57" = sub nsw i64 -2147483648, %"50", !dbg !106
  %"58" = sub nsw i64 %"57", 1, !dbg !106
  %"59" = srem i64 %"58", 4294967296, !dbg !106
  %"60" = sub nsw i64 2147483647, %"59", !dbg !106
  br label %main_wrap_around.exit.i, !dbg !106

main_wrap_around.exit.i:                          ; preds = %main_bb22, %main_bb21, %main_bb20
  %.0.i.i = phi i64 [ %"55", %main_bb20 ], [ %"60", %main_bb22 ], [ %"50", %main_bb21 ], !dbg !102
  %"61" = add nsw i64 %.0.i3, 1, !dbg !107
  %"62" = icmp sgt i64 %"61", 2147483647, !dbg !108
  br i1 %"62", label %main_bb23, label %main_bb24, !dbg !108

main_bb23:                                        ; preds = %main_wrap_around.exit.i
  %"63" = sub nsw i64 %"61", 2147483647, !dbg !109
  %"64" = sub nsw i64 %"63", 1, !dbg !109
  %"65" = srem i64 %"64", 4294967296, !dbg !109
  %"66" = add nsw i64 -2147483648, %"65", !dbg !109
  br label %main_wrap_around.exit2.i, !dbg !109

main_bb24:                                        ; preds = %main_wrap_around.exit.i
  %"67" = icmp slt i64 %"61", -2147483648, !dbg !110
  br i1 %"67", label %main_bb25, label %main_wrap_around.exit2.i, !dbg !110

main_bb25:                                        ; preds = %main_bb24
  %"68" = sub nsw i64 -2147483648, %"61", !dbg !111
  %"69" = sub nsw i64 %"68", 1, !dbg !111
  %"70" = srem i64 %"69", 4294967296, !dbg !111
  %"71" = sub nsw i64 2147483647, %"70", !dbg !111
  br label %main_wrap_around.exit2.i, !dbg !111

main_read_slice_1.exit:                           ; preds = %main_wrap_around.exit2.i
  call void @llvm.dbg.value(metadata !{i64 %count.0.i}, i64 0, metadata !112), !dbg !113
  call void @llvm.dbg.value(metadata !{i64 %count.0.i}, i64 0, metadata !114), !dbg !115
  %"72" = add nsw i64 %pos.0, %count.0.i, !dbg !116
  call void @llvm.dbg.value(metadata !{i64 %"72"}, i64 0, metadata !117), !dbg !118
  call void @llvm.dbg.value(metadata !49, i64 0, metadata !119), !dbg !120
  call void @llvm.dbg.value(metadata !52, i64 0, metadata !121), !dbg !122
  call void @llvm.dbg.value(metadata !55, i64 0, metadata !123), !dbg !124
  %"73" = icmp sgt i64 %"72", 2147483647, !dbg !125
  br i1 %"73", label %main_bb26, label %main_bb27, !dbg !125

main_bb26:                                        ; preds = %main_read_slice_1.exit
  %"74" = sub nsw i64 %"72", 2147483647, !dbg !126
  %"75" = sub nsw i64 %"74", 1, !dbg !126
  %"76" = srem i64 %"75", 4294967296, !dbg !126
  %"77" = add nsw i64 -2147483648, %"76", !dbg !126
  br label %main_wrap_around.exit2, !dbg !126

main_bb27:                                        ; preds = %main_read_slice_1.exit
  %"78" = icmp slt i64 %"72", -2147483648, !dbg !127
  br i1 %"78", label %main_bb28, label %main_wrap_around.exit2, !dbg !127

main_bb28:                                        ; preds = %main_bb27
  %"79" = sub nsw i64 -2147483648, %"72", !dbg !128
  %"80" = sub nsw i64 %"79", 1, !dbg !128
  %"81" = srem i64 %"80", 4294967296, !dbg !128
  %"82" = sub nsw i64 2147483647, %"81", !dbg !128
  br label %main_wrap_around.exit2, !dbg !128

main_bb29:                                        ; preds = %main_wrap_around.exit2, %main_bb14
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
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"wrap_around", metadata !"wrap_around", metadata !"", i32 5, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i64, i64, i64)* @wrap_around, null, null, metadata !2, i32 5} ; [ DW_TAG_subprogram ] [line 5] [def] [wrap_around]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"read_slice_1", metadata !"read_slice_1", metadata !"", i32 15, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i64, i64)* @read_slice_1, null, null, metadata !2, i32 16} ; [ DW_TAG_subprogram ] [line 15] [def] [scope 16] [read_slice_1]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !8, metadata !8, metadata !8}
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 27, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @main, null, null, metadata !2, i32 28} ; [ DW_TAG_subprogram ] [line 27] [def] [scope 28] [main]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{null}
!15 = metadata !{metadata !16}
!16 = metadata !{i32 786484, i32 0, null, metadata !"flag", metadata !"flag", metadata !"", metadata !5, i32 4, metadata !8, i32 0, i32 1, i64* @"'flag", null} ; [ DW_TAG_variable ] [flag] [line 4] [def]
!17 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!18 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!19 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!20 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777221, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 5]
!21 = metadata !{i32 5, i32 33, metadata !4, null}
!22 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554437, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [lower_bound] [line 5]
!23 = metadata !{i32 5, i32 50, metadata !4, null}
!24 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331653, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [upper_bound] [line 5]
!25 = metadata !{i32 5, i32 73, metadata !4, null}
!26 = metadata !{i32 6, i32 5, metadata !4, null}
!27 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 6, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [range] [line 6]
!28 = metadata !{i32 6, i32 15, metadata !4, null}
!29 = metadata !{i32 7, i32 9, metadata !30, null}
!30 = metadata !{i32 786443, metadata !1, metadata !4, i32 7, i32 9, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!31 = metadata !{i32 8, i32 9, metadata !32, null} ; [ DW_TAG_imported_declaration ]
!32 = metadata !{i32 786443, metadata !1, metadata !30, i32 7, i32 30, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!33 = metadata !{i32 10, i32 14, metadata !34, null}
!34 = metadata !{i32 786443, metadata !1, metadata !30, i32 10, i32 14, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!35 = metadata !{i32 11, i32 9, metadata !36, null}
!36 = metadata !{i32 786443, metadata !1, metadata !34, i32 10, i32 35, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!37 = metadata !{i32 14, i32 1, metadata !4, null}
!38 = metadata !{i32 786689, metadata !9, metadata !"loc", metadata !5, i32 16777231, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [loc] [line 15]
!39 = metadata !{i32 15, i32 34, metadata !9, null}
!40 = metadata !{i32 786689, metadata !9, metadata !"len", metadata !5, i32 33554447, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 15]
!41 = metadata !{i32 15, i32 49, metadata !9, null}
!42 = metadata !{i64 0}
!43 = metadata !{i32 786688, metadata !9, metadata !"count", metadata !5, i32 18, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 18]
!44 = metadata !{i32 18, i32 13, metadata !9, null}
!45 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777221, metadata !8, i32 0, metadata !46} ; [ DW_TAG_arg_variable ] [value] [line 5]
!46 = metadata !{i32 20, i32 14, metadata !47, null}
!47 = metadata !{i32 786443, metadata !1, metadata !9, i32 19, i32 21, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!48 = metadata !{i32 5, i32 33, metadata !4, metadata !46}
!49 = metadata !{i64 -2147483648}
!50 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554437, metadata !8, i32 0, metadata !46} ; [ DW_TAG_arg_variable ] [lower_bound] [line 5]
!51 = metadata !{i32 5, i32 50, metadata !4, metadata !46}
!52 = metadata !{i64 2147483647}
!53 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331653, metadata !8, i32 0, metadata !46} ; [ DW_TAG_arg_variable ] [upper_bound] [line 5]
!54 = metadata !{i32 5, i32 73, metadata !4, metadata !46}
!55 = metadata !{i64 4294967296}
!56 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 6, metadata !8, i32 0, metadata !46} ; [ DW_TAG_auto_variable ] [range] [line 6]
!57 = metadata !{i32 6, i32 15, metadata !4, metadata !46}
!58 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777221, metadata !8, i32 0, metadata !59} ; [ DW_TAG_arg_variable ] [value] [line 5]
!59 = metadata !{i32 21, i32 12, metadata !47, null}
!60 = metadata !{i32 5, i32 33, metadata !4, metadata !59}
!61 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554437, metadata !8, i32 0, metadata !59} ; [ DW_TAG_arg_variable ] [lower_bound] [line 5]
!62 = metadata !{i32 5, i32 50, metadata !4, metadata !59}
!63 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331653, metadata !8, i32 0, metadata !59} ; [ DW_TAG_arg_variable ] [upper_bound] [line 5]
!64 = metadata !{i32 5, i32 73, metadata !4, metadata !59}
!65 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 6, metadata !8, i32 0, metadata !59} ; [ DW_TAG_auto_variable ] [range] [line 6]
!66 = metadata !{i32 6, i32 15, metadata !4, metadata !59}
!67 = metadata !{i32 19, i32 3, metadata !9, null}
!68 = metadata !{i32 19, i32 3, metadata !69, null}
!69 = metadata !{i32 786443, metadata !1, metadata !9, i32 19, i32 3, i32 1, i32 10} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!70 = metadata !{i32 7, i32 9, metadata !30, metadata !46}
!71 = metadata !{i32 8, i32 9, metadata !32, metadata !46} ; [ DW_TAG_imported_declaration ]
!72 = metadata !{i32 10, i32 14, metadata !34, metadata !46}
!73 = metadata !{i32 11, i32 9, metadata !36, metadata !46}
!74 = metadata !{i32 7, i32 9, metadata !30, metadata !59}
!75 = metadata !{i32 8, i32 9, metadata !32, metadata !59} ; [ DW_TAG_imported_declaration ]
!76 = metadata !{i32 10, i32 14, metadata !34, metadata !59}
!77 = metadata !{i32 11, i32 9, metadata !36, metadata !59}
!78 = metadata !{i32 786688, metadata !9, metadata !"__retres", metadata !5, i32 17, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__retres] [line 17]
!79 = metadata !{i32 17, i32 13, metadata !9, null}
!80 = metadata !{i32 24, i32 3, metadata !9, null}
!81 = metadata !{i32 786688, metadata !12, metadata !"pos", metadata !5, i32 29, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pos] [line 29]
!82 = metadata !{i32 29, i32 13, metadata !12, null}
!83 = metadata !{i64 4000}
!84 = metadata !{i32 786688, metadata !12, metadata !"size", metadata !5, i32 30, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [size] [line 30]
!85 = metadata !{i32 30, i32 13, metadata !12, null}
!86 = metadata !{i32 31, i32 3, metadata !12, null}
!87 = metadata !{i32 32, i32 7, metadata !88, null}
!88 = metadata !{i32 786443, metadata !1, metadata !12, i32 32, i32 7, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!89 = metadata !{i32 36, i32 9, metadata !90, null}
!90 = metadata !{i32 786443, metadata !1, metadata !88, i32 36, i32 9, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!91 = metadata !{i32 39, i32 3, metadata !92, null}
!92 = metadata !{i32 786443, metadata !1, metadata !12, i32 39, i32 3, i32 1, i32 11} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!93 = metadata !{i32 40, i32 37, metadata !94, null}
!94 = metadata !{i32 786443, metadata !1, metadata !12, i32 39, i32 22, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!95 = metadata !{i32 7, i32 9, metadata !30, metadata !93}
!96 = metadata !{i32 8, i32 9, metadata !32, metadata !93} ; [ DW_TAG_imported_declaration ]
!97 = metadata !{i32 10, i32 14, metadata !34, metadata !93}
!98 = metadata !{i32 11, i32 9, metadata !36, metadata !93}
!99 = metadata !{i32 19, i32 3, metadata !9, metadata !100}
!100 = metadata !{i32 40, i32 20, metadata !94, null}
!101 = metadata !{i32 19, i32 3, metadata !69, metadata !100}
!102 = metadata !{i32 20, i32 14, metadata !47, metadata !100}
!103 = metadata !{i32 7, i32 9, metadata !30, metadata !102}
!104 = metadata !{i32 8, i32 9, metadata !32, metadata !102} ; [ DW_TAG_imported_declaration ]
!105 = metadata !{i32 10, i32 14, metadata !34, metadata !102}
!106 = metadata !{i32 11, i32 9, metadata !36, metadata !102}
!107 = metadata !{i32 21, i32 12, metadata !47, metadata !100}
!108 = metadata !{i32 7, i32 9, metadata !30, metadata !107}
!109 = metadata !{i32 8, i32 9, metadata !32, metadata !107} ; [ DW_TAG_imported_declaration ]
!110 = metadata !{i32 10, i32 14, metadata !34, metadata !107}
!111 = metadata !{i32 11, i32 9, metadata !36, metadata !107}
!112 = metadata !{i32 786688, metadata !9, metadata !"__retres", metadata !5, i32 17, metadata !8, i32 0, metadata !100} ; [ DW_TAG_auto_variable ] [__retres] [line 17]
!113 = metadata !{i32 17, i32 13, metadata !9, metadata !100}
!114 = metadata !{i32 786688, metadata !94, metadata !"rc", metadata !5, i32 40, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rc] [line 40]
!115 = metadata !{i32 40, i32 15, metadata !94, null}
!116 = metadata !{i32 41, i32 11, metadata !94, null}
!117 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777221, metadata !8, i32 0, metadata !116} ; [ DW_TAG_arg_variable ] [value] [line 5]
!118 = metadata !{i32 5, i32 33, metadata !4, metadata !116}
!119 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554437, metadata !8, i32 0, metadata !116} ; [ DW_TAG_arg_variable ] [lower_bound] [line 5]
!120 = metadata !{i32 5, i32 50, metadata !4, metadata !116}
!121 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331653, metadata !8, i32 0, metadata !116} ; [ DW_TAG_arg_variable ] [upper_bound] [line 5]
!122 = metadata !{i32 5, i32 73, metadata !4, metadata !116}
!123 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 6, metadata !8, i32 0, metadata !116} ; [ DW_TAG_auto_variable ] [range] [line 6]
!124 = metadata !{i32 6, i32 15, metadata !4, metadata !116}
!125 = metadata !{i32 7, i32 9, metadata !30, metadata !116}
!126 = metadata !{i32 8, i32 9, metadata !32, metadata !116} ; [ DW_TAG_imported_declaration ]
!127 = metadata !{i32 10, i32 14, metadata !34, metadata !116}
!128 = metadata !{i32 11, i32 9, metadata !36, metadata !116}
!129 = metadata !{i32 43, i32 17, metadata !12, null}

