; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define i64 @wrap_around(i64 %value, i64 %lower_bound, i64 %upper_bound) #0 {
wrap_around_bb0:
  call void @llvm.dbg.value(metadata !{i64 %value}, i64 0, metadata !18), !dbg !19
  call void @llvm.dbg.value(metadata !{i64 %lower_bound}, i64 0, metadata !20), !dbg !21
  call void @llvm.dbg.value(metadata !{i64 %upper_bound}, i64 0, metadata !22), !dbg !23
  %"0" = sub nsw i64 %upper_bound, %lower_bound, !dbg !24
  %"1" = add nsw i64 %"0", 1, !dbg !24
  call void @llvm.dbg.value(metadata !{i64 %"1"}, i64 0, metadata !25), !dbg !26
  %"2" = icmp sgt i64 %value, %upper_bound, !dbg !27
  br i1 %"2", label %wrap_around_bb1, label %wrap_around_bb2, !dbg !27

wrap_around_bb1:                                  ; preds = %wrap_around_bb0
  %"3" = sub nsw i64 %value, %upper_bound, !dbg !29
  %"4" = sub nsw i64 %"3", 1, !dbg !29
  %"5" = srem i64 %"4", %"1", !dbg !29
  %"6" = add nsw i64 %lower_bound, %"5", !dbg !29
  br label %wrap_around_bb4, !dbg !29

wrap_around_bb2:                                  ; preds = %wrap_around_bb0
  %"7" = icmp slt i64 %value, %lower_bound, !dbg !31
  br i1 %"7", label %wrap_around_bb3, label %wrap_around_bb4, !dbg !31

wrap_around_bb3:                                  ; preds = %wrap_around_bb2
  %"8" = sub nsw i64 %lower_bound, %value, !dbg !33
  %"9" = sub nsw i64 %"8", 1, !dbg !33
  %"10" = srem i64 %"9", %"1", !dbg !33
  %"11" = sub nsw i64 %upper_bound, %"10", !dbg !33
  br label %wrap_around_bb4, !dbg !33

wrap_around_bb4:                                  ; preds = %wrap_around_bb2, %wrap_around_bb3, %wrap_around_bb1
  %.0 = phi i64 [ %"6", %wrap_around_bb1 ], [ %"11", %wrap_around_bb3 ], [ %value, %wrap_around_bb2 ]
  ret i64 %.0, !dbg !35
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i64 @read_slice_1(i64 %loc, i64 %len) #0 {
read_slice_1_bb5:
  call void @llvm.dbg.value(metadata !{i64 %loc}, i64 0, metadata !36), !dbg !37
  call void @llvm.dbg.value(metadata !{i64 %len}, i64 0, metadata !38), !dbg !39
  call void @llvm.dbg.value(metadata !40, i64 0, metadata !41), !dbg !42
  call void @llvm.dbg.value(metadata !{i64 %"13"}, i64 0, metadata !43), !dbg !46
  call void @llvm.dbg.value(metadata !47, i64 0, metadata !48), !dbg !49
  call void @llvm.dbg.value(metadata !50, i64 0, metadata !51), !dbg !52
  call void @llvm.dbg.value(metadata !53, i64 0, metadata !54), !dbg !55
  call void @llvm.dbg.value(metadata !{i64 %.0.i}, i64 0, metadata !41), !dbg !42
  call void @llvm.dbg.value(metadata !{i64 %"24"}, i64 0, metadata !56), !dbg !58
  call void @llvm.dbg.value(metadata !47, i64 0, metadata !59), !dbg !60
  call void @llvm.dbg.value(metadata !50, i64 0, metadata !61), !dbg !62
  call void @llvm.dbg.value(metadata !53, i64 0, metadata !63), !dbg !64
  br label %read_slice_1_wrap_around.exit2, !dbg !65

read_slice_1_wrap_around.exit2:                   ; preds = %read_slice_1_bb12, %read_slice_1_bb11, %read_slice_1_bb10, %read_slice_1_bb5
  %count.0 = phi i64 [ 0, %read_slice_1_bb5 ], [ %.0.i, %read_slice_1_bb10 ], [ %.0.i, %read_slice_1_bb11 ], [ %.0.i, %read_slice_1_bb12 ]
  %.0 = phi i64 [ %loc, %read_slice_1_bb5 ], [ %"29", %read_slice_1_bb10 ], [ %"34", %read_slice_1_bb12 ], [ %"24", %read_slice_1_bb11 ]
  %"12" = icmp slt i64 %.0, %len, !dbg !66
  br i1 %"12", label %read_slice_1_bb6, label %read_slice_1_bb13, !dbg !66

read_slice_1_bb6:                                 ; preds = %read_slice_1_wrap_around.exit2
  %"13" = add nsw i64 %count.0, 1, !dbg !44
  %"14" = icmp sgt i64 %"13", 2147483647, !dbg !68
  br i1 %"14", label %read_slice_1_bb7, label %read_slice_1_bb8, !dbg !68

read_slice_1_bb7:                                 ; preds = %read_slice_1_bb6
  %"15" = sub nsw i64 %"13", 2147483647, !dbg !69
  %"16" = sub nsw i64 %"15", 1, !dbg !69
  %"17" = srem i64 %"16", 4294967296, !dbg !69
  %"18" = add nsw i64 -2147483648, %"17", !dbg !69
  br label %read_slice_1_wrap_around.exit, !dbg !69

read_slice_1_bb8:                                 ; preds = %read_slice_1_bb6
  %"19" = icmp slt i64 %"13", -2147483648, !dbg !70
  br i1 %"19", label %read_slice_1_bb9, label %read_slice_1_wrap_around.exit, !dbg !70

read_slice_1_bb9:                                 ; preds = %read_slice_1_bb8
  %"20" = sub nsw i64 -2147483648, %"13", !dbg !71
  %"21" = sub nsw i64 %"20", 1, !dbg !71
  %"22" = srem i64 %"21", 4294967296, !dbg !71
  %"23" = sub nsw i64 2147483647, %"22", !dbg !71
  br label %read_slice_1_wrap_around.exit, !dbg !71

read_slice_1_wrap_around.exit:                    ; preds = %read_slice_1_bb7, %read_slice_1_bb8, %read_slice_1_bb9
  %.0.i = phi i64 [ %"18", %read_slice_1_bb7 ], [ %"23", %read_slice_1_bb9 ], [ %"13", %read_slice_1_bb8 ], !dbg !44
  %"24" = add nsw i64 %.0, 1, !dbg !57
  %"25" = icmp sgt i64 %"24", 2147483647, !dbg !72
  br i1 %"25", label %read_slice_1_bb10, label %read_slice_1_bb11, !dbg !72

read_slice_1_bb10:                                ; preds = %read_slice_1_wrap_around.exit
  %"26" = sub nsw i64 %"24", 2147483647, !dbg !73
  %"27" = sub nsw i64 %"26", 1, !dbg !73
  %"28" = srem i64 %"27", 4294967296, !dbg !73
  %"29" = add nsw i64 -2147483648, %"28", !dbg !73
  br label %read_slice_1_wrap_around.exit2, !dbg !73

read_slice_1_bb11:                                ; preds = %read_slice_1_wrap_around.exit
  %"30" = icmp slt i64 %"24", -2147483648, !dbg !74
  br i1 %"30", label %read_slice_1_bb12, label %read_slice_1_wrap_around.exit2, !dbg !74

read_slice_1_bb12:                                ; preds = %read_slice_1_bb11
  %"31" = sub nsw i64 -2147483648, %"24", !dbg !75
  %"32" = sub nsw i64 %"31", 1, !dbg !75
  %"33" = srem i64 %"32", 4294967296, !dbg !75
  %"34" = sub nsw i64 2147483647, %"33", !dbg !75
  br label %read_slice_1_wrap_around.exit2, !dbg !75

read_slice_1_bb13:                                ; preds = %read_slice_1_wrap_around.exit2
  call void @llvm.dbg.value(metadata !{i64 %count.0}, i64 0, metadata !76), !dbg !77
  ret i64 %count.0, !dbg !78
}

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb14:
  call void @llvm.dbg.value(metadata !79, i64 0, metadata !80), !dbg !81
  %"35" = icmp sle i64 12, 0, !dbg !82
  br i1 %"35", label %main_bb28, label %main_wrap_around.exit, !dbg !82

main_wrap_around.exit:                            ; preds = %main_bb27, %main_bb26, %main_bb25, %main_bb14
  %buf.0 = phi i64 [ 0, %main_bb14 ], [ %"76", %main_bb25 ], [ %"81", %main_bb27 ], [ %"71", %main_bb26 ]
  %count.0 = phi i64 [ 12, %main_bb14 ], [ %.0.i2, %main_bb25 ], [ %.0.i2, %main_bb26 ], [ %.0.i2, %main_bb27 ]
  %"36" = icmp sgt i64 %count.0, 0, !dbg !84
  br i1 %"36", label %main_wrap_around.exit2.i, label %main_bb28, !dbg !84

main_wrap_around.exit2.i:                         ; preds = %main_wrap_around.exit, %main_bb21, %main_bb20, %main_bb19
  %count.0.i = phi i64 [ %.0.i.i, %main_bb19 ], [ %.0.i.i, %main_bb20 ], [ %.0.i.i, %main_bb21 ], [ 0, %main_wrap_around.exit ], !dbg !86
  %.0.i = phi i64 [ %"54", %main_bb19 ], [ %"59", %main_bb21 ], [ %"49", %main_bb20 ], [ %buf.0, %main_wrap_around.exit ], !dbg !86
  %"37" = icmp slt i64 %.0.i, %count.0, !dbg !88
  br i1 %"37", label %main_bb15, label %main_read_slice_1.exit, !dbg !88

main_bb15:                                        ; preds = %main_wrap_around.exit2.i
  %"38" = add nsw i64 %count.0.i, 1, !dbg !89
  %"39" = icmp sgt i64 %"38", 2147483647, !dbg !90
  br i1 %"39", label %main_bb16, label %main_bb17, !dbg !90

main_bb16:                                        ; preds = %main_bb15
  %"40" = sub nsw i64 %"38", 2147483647, !dbg !91
  %"41" = sub nsw i64 %"40", 1, !dbg !91
  %"42" = srem i64 %"41", 4294967296, !dbg !91
  %"43" = add nsw i64 -2147483648, %"42", !dbg !91
  br label %main_wrap_around.exit.i, !dbg !91

main_bb17:                                        ; preds = %main_bb15
  %"44" = icmp slt i64 %"38", -2147483648, !dbg !92
  br i1 %"44", label %main_bb18, label %main_wrap_around.exit.i, !dbg !92

main_bb18:                                        ; preds = %main_bb17
  %"45" = sub nsw i64 -2147483648, %"38", !dbg !93
  %"46" = sub nsw i64 %"45", 1, !dbg !93
  %"47" = srem i64 %"46", 4294967296, !dbg !93
  %"48" = sub nsw i64 2147483647, %"47", !dbg !93
  br label %main_wrap_around.exit.i, !dbg !93

main_wrap_around.exit.i:                          ; preds = %main_bb18, %main_bb17, %main_bb16
  %.0.i.i = phi i64 [ %"43", %main_bb16 ], [ %"48", %main_bb18 ], [ %"38", %main_bb17 ], !dbg !89
  %"49" = add nsw i64 %.0.i, 1, !dbg !94
  %"50" = icmp sgt i64 %"49", 2147483647, !dbg !95
  br i1 %"50", label %main_bb19, label %main_bb20, !dbg !95

main_bb19:                                        ; preds = %main_wrap_around.exit.i
  %"51" = sub nsw i64 %"49", 2147483647, !dbg !96
  %"52" = sub nsw i64 %"51", 1, !dbg !96
  %"53" = srem i64 %"52", 4294967296, !dbg !96
  %"54" = add nsw i64 -2147483648, %"53", !dbg !96
  br label %main_wrap_around.exit2.i, !dbg !96

main_bb20:                                        ; preds = %main_wrap_around.exit.i
  %"55" = icmp slt i64 %"49", -2147483648, !dbg !97
  br i1 %"55", label %main_bb21, label %main_wrap_around.exit2.i, !dbg !97

main_bb21:                                        ; preds = %main_bb20
  %"56" = sub nsw i64 -2147483648, %"49", !dbg !98
  %"57" = sub nsw i64 %"56", 1, !dbg !98
  %"58" = srem i64 %"57", 4294967296, !dbg !98
  %"59" = sub nsw i64 2147483647, %"58", !dbg !98
  br label %main_wrap_around.exit2.i, !dbg !98

main_read_slice_1.exit:                           ; preds = %main_wrap_around.exit2.i
  call void @llvm.dbg.value(metadata !{i64 %count.0.i}, i64 0, metadata !99), !dbg !100
  call void @llvm.dbg.value(metadata !{i64 %count.0.i}, i64 0, metadata !101), !dbg !102
  %"60" = sub nsw i64 %count.0, %count.0.i, !dbg !103
  call void @llvm.dbg.value(metadata !{i64 %"60"}, i64 0, metadata !104), !dbg !105
  call void @llvm.dbg.value(metadata !47, i64 0, metadata !106), !dbg !107
  call void @llvm.dbg.value(metadata !50, i64 0, metadata !108), !dbg !109
  call void @llvm.dbg.value(metadata !53, i64 0, metadata !110), !dbg !111
  %"61" = icmp sgt i64 %"60", 2147483647, !dbg !112
  br i1 %"61", label %main_bb22, label %main_bb23, !dbg !112

main_bb22:                                        ; preds = %main_read_slice_1.exit
  %"62" = sub nsw i64 %"60", 2147483647, !dbg !113
  %"63" = sub nsw i64 %"62", 1, !dbg !113
  %"64" = srem i64 %"63", 4294967296, !dbg !113
  %"65" = add nsw i64 -2147483648, %"64", !dbg !113
  br label %main_wrap_around.exit3, !dbg !113

main_bb23:                                        ; preds = %main_read_slice_1.exit
  %"66" = icmp slt i64 %"60", -2147483648, !dbg !114
  br i1 %"66", label %main_bb24, label %main_wrap_around.exit3, !dbg !114

main_bb24:                                        ; preds = %main_bb23
  %"67" = sub nsw i64 -2147483648, %"60", !dbg !115
  %"68" = sub nsw i64 %"67", 1, !dbg !115
  %"69" = srem i64 %"68", 4294967296, !dbg !115
  %"70" = sub nsw i64 2147483647, %"69", !dbg !115
  br label %main_wrap_around.exit3, !dbg !115

main_wrap_around.exit3:                           ; preds = %main_bb22, %main_bb23, %main_bb24
  %.0.i2 = phi i64 [ %"65", %main_bb22 ], [ %"70", %main_bb24 ], [ %"60", %main_bb23 ], !dbg !103
  call void @llvm.dbg.value(metadata !{i64 %.0.i2}, i64 0, metadata !80), !dbg !81
  %"71" = add nsw i64 %buf.0, %count.0.i, !dbg !116
  call void @llvm.dbg.value(metadata !{i64 %"71"}, i64 0, metadata !117), !dbg !118
  call void @llvm.dbg.value(metadata !47, i64 0, metadata !119), !dbg !120
  call void @llvm.dbg.value(metadata !50, i64 0, metadata !121), !dbg !122
  call void @llvm.dbg.value(metadata !53, i64 0, metadata !123), !dbg !124
  %"72" = icmp sgt i64 %"71", 2147483647, !dbg !125
  br i1 %"72", label %main_bb25, label %main_bb26, !dbg !125

main_bb25:                                        ; preds = %main_wrap_around.exit3
  %"73" = sub nsw i64 %"71", 2147483647, !dbg !126
  %"74" = sub nsw i64 %"73", 1, !dbg !126
  %"75" = srem i64 %"74", 4294967296, !dbg !126
  %"76" = add nsw i64 -2147483648, %"75", !dbg !126
  br label %main_wrap_around.exit, !dbg !126

main_bb26:                                        ; preds = %main_wrap_around.exit3
  %"77" = icmp slt i64 %"71", -2147483648, !dbg !127
  br i1 %"77", label %main_bb27, label %main_wrap_around.exit, !dbg !127

main_bb27:                                        ; preds = %main_bb26
  %"78" = sub nsw i64 -2147483648, %"71", !dbg !128
  %"79" = sub nsw i64 %"78", 1, !dbg !128
  %"80" = srem i64 %"79", 4294967296, !dbg !128
  %"81" = sub nsw i64 2147483647, %"80", !dbg !128
  br label %main_wrap_around.exit, !dbg !128

main_bb28:                                        ; preds = %main_wrap_around.exit, %main_bb14
  ret void, !dbg !129
}

declare i64 @__kittel_nondef.0()

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!15, !16}
!llvm.ident = !{!17}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [//FILES_DIR/SourceCode_SemanticAugmentor.c] [DW_LANG_C99]
!1 = metadata !{metadata !"FILES_DIR/SourceCode_SemanticAugmentor.c", metadata !"/"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9, metadata !12}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"wrap_around", metadata !"wrap_around", metadata !"", i32 4, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i64, i64, i64)* @wrap_around, null, null, metadata !2, i32 4} ; [ DW_TAG_subprogram ] [line 4] [def] [wrap_around]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"read_slice_1", metadata !"read_slice_1", metadata !"", i32 14, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i64, i64)* @read_slice_1, null, null, metadata !2, i32 15} ; [ DW_TAG_subprogram ] [line 14] [def] [scope 15] [read_slice_1]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !8, metadata !8, metadata !8}
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 26, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @main, null, null, metadata !2, i32 27} ; [ DW_TAG_subprogram ] [line 26] [def] [scope 27] [main]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{null}
!15 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!16 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!17 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!18 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777220, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 4]
!19 = metadata !{i32 4, i32 33, metadata !4, null}
!20 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554436, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [lower_bound] [line 4]
!21 = metadata !{i32 4, i32 50, metadata !4, null}
!22 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331652, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [upper_bound] [line 4]
!23 = metadata !{i32 4, i32 73, metadata !4, null}
!24 = metadata !{i32 5, i32 5, metadata !4, null}
!25 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 5, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [range] [line 5]
!26 = metadata !{i32 5, i32 15, metadata !4, null}
!27 = metadata !{i32 6, i32 9, metadata !28, null}
!28 = metadata !{i32 786443, metadata !1, metadata !4, i32 6, i32 9, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!29 = metadata !{i32 7, i32 9, metadata !30, null}
!30 = metadata !{i32 786443, metadata !1, metadata !28, i32 6, i32 30, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!31 = metadata !{i32 9, i32 14, metadata !32, null}
!32 = metadata !{i32 786443, metadata !1, metadata !28, i32 9, i32 14, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!33 = metadata !{i32 10, i32 9, metadata !34, null}
!34 = metadata !{i32 786443, metadata !1, metadata !32, i32 9, i32 35, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!35 = metadata !{i32 13, i32 1, metadata !4, null}
!36 = metadata !{i32 786689, metadata !9, metadata !"loc", metadata !5, i32 16777230, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [loc] [line 14]
!37 = metadata !{i32 14, i32 34, metadata !9, null}
!38 = metadata !{i32 786689, metadata !9, metadata !"len", metadata !5, i32 33554446, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 14]
!39 = metadata !{i32 14, i32 49, metadata !9, null}
!40 = metadata !{i64 0}
!41 = metadata !{i32 786688, metadata !9, metadata !"count", metadata !5, i32 17, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 17]
!42 = metadata !{i32 17, i32 13, metadata !9, null}
!43 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777220, metadata !8, i32 0, metadata !44} ; [ DW_TAG_arg_variable ] [value] [line 4]
!44 = metadata !{i32 19, i32 14, metadata !45, null}
!45 = metadata !{i32 786443, metadata !1, metadata !9, i32 18, i32 21, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!46 = metadata !{i32 4, i32 33, metadata !4, metadata !44}
!47 = metadata !{i64 -2147483648}
!48 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554436, metadata !8, i32 0, metadata !44} ; [ DW_TAG_arg_variable ] [lower_bound] [line 4]
!49 = metadata !{i32 4, i32 50, metadata !4, metadata !44}
!50 = metadata !{i64 2147483647}
!51 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331652, metadata !8, i32 0, metadata !44} ; [ DW_TAG_arg_variable ] [upper_bound] [line 4]
!52 = metadata !{i32 4, i32 73, metadata !4, metadata !44}
!53 = metadata !{i64 4294967296}
!54 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 5, metadata !8, i32 0, metadata !44} ; [ DW_TAG_auto_variable ] [range] [line 5]
!55 = metadata !{i32 5, i32 15, metadata !4, metadata !44}
!56 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777220, metadata !8, i32 0, metadata !57} ; [ DW_TAG_arg_variable ] [value] [line 4]
!57 = metadata !{i32 20, i32 12, metadata !45, null}
!58 = metadata !{i32 4, i32 33, metadata !4, metadata !57}
!59 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554436, metadata !8, i32 0, metadata !57} ; [ DW_TAG_arg_variable ] [lower_bound] [line 4]
!60 = metadata !{i32 4, i32 50, metadata !4, metadata !57}
!61 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331652, metadata !8, i32 0, metadata !57} ; [ DW_TAG_arg_variable ] [upper_bound] [line 4]
!62 = metadata !{i32 4, i32 73, metadata !4, metadata !57}
!63 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 5, metadata !8, i32 0, metadata !57} ; [ DW_TAG_auto_variable ] [range] [line 5]
!64 = metadata !{i32 5, i32 15, metadata !4, metadata !57}
!65 = metadata !{i32 18, i32 3, metadata !9, null}
!66 = metadata !{i32 18, i32 3, metadata !67, null}
!67 = metadata !{i32 786443, metadata !1, metadata !9, i32 18, i32 3, i32 1, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!68 = metadata !{i32 6, i32 9, metadata !28, metadata !44}
!69 = metadata !{i32 7, i32 9, metadata !30, metadata !44}
!70 = metadata !{i32 9, i32 14, metadata !32, metadata !44}
!71 = metadata !{i32 10, i32 9, metadata !34, metadata !44}
!72 = metadata !{i32 6, i32 9, metadata !28, metadata !57}
!73 = metadata !{i32 7, i32 9, metadata !30, metadata !57}
!74 = metadata !{i32 9, i32 14, metadata !32, metadata !57}
!75 = metadata !{i32 10, i32 9, metadata !34, metadata !57}
!76 = metadata !{i32 786688, metadata !9, metadata !"__retres", metadata !5, i32 16, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__retres] [line 16]
!77 = metadata !{i32 16, i32 13, metadata !9, null}
!78 = metadata !{i32 23, i32 3, metadata !9, null}
!79 = metadata !{i64 12}
!80 = metadata !{i32 786688, metadata !12, metadata !"count", metadata !5, i32 29, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 29]
!81 = metadata !{i32 29, i32 13, metadata !12, null}
!82 = metadata !{i32 30, i32 7, metadata !83, null}
!83 = metadata !{i32 786443, metadata !1, metadata !12, i32 30, i32 7, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!84 = metadata !{i32 34, i32 3, metadata !85, null}
!85 = metadata !{i32 786443, metadata !1, metadata !12, i32 34, i32 3, i32 1, i32 9} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!86 = metadata !{i32 35, i32 11, metadata !87, null}
!87 = metadata !{i32 786443, metadata !1, metadata !12, i32 34, i32 21, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!88 = metadata !{i32 18, i32 3, metadata !67, metadata !86}
!89 = metadata !{i32 19, i32 14, metadata !45, metadata !86}
!90 = metadata !{i32 6, i32 9, metadata !28, metadata !89}
!91 = metadata !{i32 7, i32 9, metadata !30, metadata !89}
!92 = metadata !{i32 9, i32 14, metadata !32, metadata !89}
!93 = metadata !{i32 10, i32 9, metadata !34, metadata !89}
!94 = metadata !{i32 20, i32 12, metadata !45, metadata !86}
!95 = metadata !{i32 6, i32 9, metadata !28, metadata !94}
!96 = metadata !{i32 7, i32 9, metadata !30, metadata !94}
!97 = metadata !{i32 9, i32 14, metadata !32, metadata !94}
!98 = metadata !{i32 10, i32 9, metadata !34, metadata !94}
!99 = metadata !{i32 786688, metadata !9, metadata !"__retres", metadata !5, i32 16, metadata !8, i32 0, metadata !86} ; [ DW_TAG_auto_variable ] [__retres] [line 16]
!100 = metadata !{i32 16, i32 13, metadata !9, metadata !86}
!101 = metadata !{i32 786688, metadata !12, metadata !"ret", metadata !5, i32 28, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ret] [line 28]
!102 = metadata !{i32 28, i32 13, metadata !12, null}
!103 = metadata !{i32 36, i32 13, metadata !87, null}
!104 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777220, metadata !8, i32 0, metadata !103} ; [ DW_TAG_arg_variable ] [value] [line 4]
!105 = metadata !{i32 4, i32 33, metadata !4, metadata !103}
!106 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554436, metadata !8, i32 0, metadata !103} ; [ DW_TAG_arg_variable ] [lower_bound] [line 4]
!107 = metadata !{i32 4, i32 50, metadata !4, metadata !103}
!108 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331652, metadata !8, i32 0, metadata !103} ; [ DW_TAG_arg_variable ] [upper_bound] [line 4]
!109 = metadata !{i32 4, i32 73, metadata !4, metadata !103}
!110 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 5, metadata !8, i32 0, metadata !103} ; [ DW_TAG_auto_variable ] [range] [line 5]
!111 = metadata !{i32 5, i32 15, metadata !4, metadata !103}
!112 = metadata !{i32 6, i32 9, metadata !28, metadata !103}
!113 = metadata !{i32 7, i32 9, metadata !30, metadata !103}
!114 = metadata !{i32 9, i32 14, metadata !32, metadata !103}
!115 = metadata !{i32 10, i32 9, metadata !34, metadata !103}
!116 = metadata !{i32 37, i32 11, metadata !87, null}
!117 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777220, metadata !8, i32 0, metadata !116} ; [ DW_TAG_arg_variable ] [value] [line 4]
!118 = metadata !{i32 4, i32 33, metadata !4, metadata !116}
!119 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554436, metadata !8, i32 0, metadata !116} ; [ DW_TAG_arg_variable ] [lower_bound] [line 4]
!120 = metadata !{i32 4, i32 50, metadata !4, metadata !116}
!121 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331652, metadata !8, i32 0, metadata !116} ; [ DW_TAG_arg_variable ] [upper_bound] [line 4]
!122 = metadata !{i32 4, i32 73, metadata !4, metadata !116}
!123 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 5, metadata !8, i32 0, metadata !116} ; [ DW_TAG_auto_variable ] [range] [line 5]
!124 = metadata !{i32 5, i32 15, metadata !4, metadata !116}
!125 = metadata !{i32 6, i32 9, metadata !28, metadata !116}
!126 = metadata !{i32 7, i32 9, metadata !30, metadata !116}
!127 = metadata !{i32 9, i32 14, metadata !32, metadata !116}
!128 = metadata !{i32 10, i32 9, metadata !34, metadata !116}
!129 = metadata !{i32 39, i32 17, metadata !12, null}

