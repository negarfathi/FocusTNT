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
  call void @llvm.dbg.value(metadata !40, i64 0, metadata !82), !dbg !83
  call void @llvm.dbg.value(metadata !{i64 %buf.0}, i64 0, metadata !84), !dbg !87
  call void @llvm.dbg.value(metadata !{i64 %count.0}, i64 0, metadata !88), !dbg !89
  call void @llvm.dbg.value(metadata !40, i64 0, metadata !90), !dbg !91
  call void @llvm.dbg.value(metadata !47, i64 0, metadata !92), !dbg !94
  call void @llvm.dbg.value(metadata !50, i64 0, metadata !95), !dbg !96
  call void @llvm.dbg.value(metadata !53, i64 0, metadata !97), !dbg !98
  call void @llvm.dbg.value(metadata !47, i64 0, metadata !99), !dbg !101
  call void @llvm.dbg.value(metadata !50, i64 0, metadata !102), !dbg !103
  call void @llvm.dbg.value(metadata !53, i64 0, metadata !104), !dbg !105
  br label %main_wrap_around.exit, !dbg !106

main_wrap_around.exit:                            ; preds = %main_bb27, %main_bb26, %main_bb25, %main_bb14
  %buf.0 = phi i64 [ 0, %main_bb14 ], [ %"75", %main_bb25 ], [ %"80", %main_bb27 ], [ %"70", %main_bb26 ]
  %count.0 = phi i64 [ 1, %main_bb14 ], [ %.0.i2, %main_bb25 ], [ %.0.i2, %main_bb26 ], [ %.0.i2, %main_bb27 ]
  %"35" = icmp sgt i64 %count.0, 0, !dbg !107
  br i1 %"35", label %main_wrap_around.exit2.i, label %main_bb28, !dbg !107

main_wrap_around.exit2.i:                         ; preds = %main_wrap_around.exit, %main_bb21, %main_bb20, %main_bb19
  %count.0.i = phi i64 [ %.0.i.i, %main_bb19 ], [ %.0.i.i, %main_bb20 ], [ %.0.i.i, %main_bb21 ], [ 0, %main_wrap_around.exit ], !dbg !85
  %.0.i = phi i64 [ %"53", %main_bb19 ], [ %"58", %main_bb21 ], [ %"48", %main_bb20 ], [ %buf.0, %main_wrap_around.exit ], !dbg !85
  %"36" = icmp slt i64 %.0.i, %count.0, !dbg !109
  br i1 %"36", label %main_bb15, label %main_read_slice_1.exit, !dbg !109

main_bb15:                                        ; preds = %main_wrap_around.exit2.i
  %"37" = add nsw i64 %count.0.i, 1, !dbg !93
  %"38" = icmp sgt i64 %"37", 2147483647, !dbg !110
  br i1 %"38", label %main_bb16, label %main_bb17, !dbg !110

main_bb16:                                        ; preds = %main_bb15
  %"39" = sub nsw i64 %"37", 2147483647, !dbg !111
  %"40" = sub nsw i64 %"39", 1, !dbg !111
  %"41" = srem i64 %"40", 4294967296, !dbg !111
  %"42" = add nsw i64 -2147483648, %"41", !dbg !111
  br label %main_wrap_around.exit.i, !dbg !111

main_bb17:                                        ; preds = %main_bb15
  %"43" = icmp slt i64 %"37", -2147483648, !dbg !112
  br i1 %"43", label %main_bb18, label %main_wrap_around.exit.i, !dbg !112

main_bb18:                                        ; preds = %main_bb17
  %"44" = sub nsw i64 -2147483648, %"37", !dbg !113
  %"45" = sub nsw i64 %"44", 1, !dbg !113
  %"46" = srem i64 %"45", 4294967296, !dbg !113
  %"47" = sub nsw i64 2147483647, %"46", !dbg !113
  br label %main_wrap_around.exit.i, !dbg !113

main_wrap_around.exit.i:                          ; preds = %main_bb18, %main_bb17, %main_bb16
  %.0.i.i = phi i64 [ %"42", %main_bb16 ], [ %"47", %main_bb18 ], [ %"37", %main_bb17 ], !dbg !93
  %"48" = add nsw i64 %.0.i, 1, !dbg !100
  %"49" = icmp sgt i64 %"48", 2147483647, !dbg !114
  br i1 %"49", label %main_bb19, label %main_bb20, !dbg !114

main_bb19:                                        ; preds = %main_wrap_around.exit.i
  %"50" = sub nsw i64 %"48", 2147483647, !dbg !115
  %"51" = sub nsw i64 %"50", 1, !dbg !115
  %"52" = srem i64 %"51", 4294967296, !dbg !115
  %"53" = add nsw i64 -2147483648, %"52", !dbg !115
  br label %main_wrap_around.exit2.i, !dbg !115

main_bb20:                                        ; preds = %main_wrap_around.exit.i
  %"54" = icmp slt i64 %"48", -2147483648, !dbg !116
  br i1 %"54", label %main_bb21, label %main_wrap_around.exit2.i, !dbg !116

main_bb21:                                        ; preds = %main_bb20
  %"55" = sub nsw i64 -2147483648, %"48", !dbg !117
  %"56" = sub nsw i64 %"55", 1, !dbg !117
  %"57" = srem i64 %"56", 4294967296, !dbg !117
  %"58" = sub nsw i64 2147483647, %"57", !dbg !117
  br label %main_wrap_around.exit2.i, !dbg !117

main_read_slice_1.exit:                           ; preds = %main_wrap_around.exit2.i
  call void @llvm.dbg.value(metadata !{i64 %count.0.i}, i64 0, metadata !118), !dbg !119
  call void @llvm.dbg.value(metadata !{i64 %count.0.i}, i64 0, metadata !120), !dbg !121
  %"59" = sub nsw i64 %count.0, %count.0.i, !dbg !122
  call void @llvm.dbg.value(metadata !{i64 %"59"}, i64 0, metadata !123), !dbg !124
  call void @llvm.dbg.value(metadata !47, i64 0, metadata !125), !dbg !126
  call void @llvm.dbg.value(metadata !50, i64 0, metadata !127), !dbg !128
  call void @llvm.dbg.value(metadata !53, i64 0, metadata !129), !dbg !130
  %"60" = icmp sgt i64 %"59", 2147483647, !dbg !131
  br i1 %"60", label %main_bb22, label %main_bb23, !dbg !131

main_bb22:                                        ; preds = %main_read_slice_1.exit
  %"61" = sub nsw i64 %"59", 2147483647, !dbg !132
  %"62" = sub nsw i64 %"61", 1, !dbg !132
  %"63" = srem i64 %"62", 4294967296, !dbg !132
  %"64" = add nsw i64 -2147483648, %"63", !dbg !132
  br label %main_wrap_around.exit3, !dbg !132

main_bb23:                                        ; preds = %main_read_slice_1.exit
  %"65" = icmp slt i64 %"59", -2147483648, !dbg !133
  br i1 %"65", label %main_bb24, label %main_wrap_around.exit3, !dbg !133

main_bb24:                                        ; preds = %main_bb23
  %"66" = sub nsw i64 -2147483648, %"59", !dbg !134
  %"67" = sub nsw i64 %"66", 1, !dbg !134
  %"68" = srem i64 %"67", 4294967296, !dbg !134
  %"69" = sub nsw i64 2147483647, %"68", !dbg !134
  br label %main_wrap_around.exit3, !dbg !134

main_wrap_around.exit3:                           ; preds = %main_bb22, %main_bb23, %main_bb24
  %.0.i2 = phi i64 [ %"64", %main_bb22 ], [ %"69", %main_bb24 ], [ %"59", %main_bb23 ], !dbg !122
  call void @llvm.dbg.value(metadata !{i64 %.0.i2}, i64 0, metadata !80), !dbg !81
  %"70" = add nsw i64 %buf.0, %count.0.i, !dbg !135
  call void @llvm.dbg.value(metadata !{i64 %"70"}, i64 0, metadata !136), !dbg !137
  call void @llvm.dbg.value(metadata !47, i64 0, metadata !138), !dbg !139
  call void @llvm.dbg.value(metadata !50, i64 0, metadata !140), !dbg !141
  call void @llvm.dbg.value(metadata !53, i64 0, metadata !142), !dbg !143
  %"71" = icmp sgt i64 %"70", 2147483647, !dbg !144
  br i1 %"71", label %main_bb25, label %main_bb26, !dbg !144

main_bb25:                                        ; preds = %main_wrap_around.exit3
  %"72" = sub nsw i64 %"70", 2147483647, !dbg !145
  %"73" = sub nsw i64 %"72", 1, !dbg !145
  %"74" = srem i64 %"73", 4294967296, !dbg !145
  %"75" = add nsw i64 -2147483648, %"74", !dbg !145
  br label %main_wrap_around.exit, !dbg !145

main_bb26:                                        ; preds = %main_wrap_around.exit3
  %"76" = icmp slt i64 %"70", -2147483648, !dbg !146
  br i1 %"76", label %main_bb27, label %main_wrap_around.exit, !dbg !146

main_bb27:                                        ; preds = %main_bb26
  %"77" = sub nsw i64 -2147483648, %"70", !dbg !147
  %"78" = sub nsw i64 %"77", 1, !dbg !147
  %"79" = srem i64 %"78", 4294967296, !dbg !147
  %"80" = sub nsw i64 2147483647, %"79", !dbg !147
  br label %main_wrap_around.exit, !dbg !147

main_bb28:                                        ; preds = %main_wrap_around.exit
  ret void, !dbg !148
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
!67 = metadata !{i32 786443, metadata !1, metadata !9, i32 18, i32 3, i32 1, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
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
!79 = metadata !{i64 1}
!80 = metadata !{i32 786688, metadata !12, metadata !"count", metadata !5, i32 29, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 29]
!81 = metadata !{i32 29, i32 13, metadata !12, null}
!82 = metadata !{i32 786688, metadata !12, metadata !"buf", metadata !5, i32 30, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [buf] [line 30]
!83 = metadata !{i32 30, i32 13, metadata !12, null}
!84 = metadata !{i32 786689, metadata !9, metadata !"loc", metadata !5, i32 16777230, metadata !8, i32 0, metadata !85} ; [ DW_TAG_arg_variable ] [loc] [line 14]
!85 = metadata !{i32 32, i32 11, metadata !86, null}
!86 = metadata !{i32 786443, metadata !1, metadata !12, i32 31, i32 21, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!87 = metadata !{i32 14, i32 34, metadata !9, metadata !85}
!88 = metadata !{i32 786689, metadata !9, metadata !"len", metadata !5, i32 33554446, metadata !8, i32 0, metadata !85} ; [ DW_TAG_arg_variable ] [len] [line 14]
!89 = metadata !{i32 14, i32 49, metadata !9, metadata !85}
!90 = metadata !{i32 786688, metadata !9, metadata !"count", metadata !5, i32 17, metadata !8, i32 0, metadata !85} ; [ DW_TAG_auto_variable ] [count] [line 17]
!91 = metadata !{i32 17, i32 13, metadata !9, metadata !85}
!92 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554436, metadata !8, i32 0, metadata !93} ; [ DW_TAG_arg_variable ] [lower_bound] [line 4]
!93 = metadata !{i32 19, i32 14, metadata !45, metadata !85}
!94 = metadata !{i32 4, i32 50, metadata !4, metadata !93}
!95 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331652, metadata !8, i32 0, metadata !93} ; [ DW_TAG_arg_variable ] [upper_bound] [line 4]
!96 = metadata !{i32 4, i32 73, metadata !4, metadata !93}
!97 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 5, metadata !8, i32 0, metadata !93} ; [ DW_TAG_auto_variable ] [range] [line 5]
!98 = metadata !{i32 5, i32 15, metadata !4, metadata !93}
!99 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554436, metadata !8, i32 0, metadata !100} ; [ DW_TAG_arg_variable ] [lower_bound] [line 4]
!100 = metadata !{i32 20, i32 12, metadata !45, metadata !85}
!101 = metadata !{i32 4, i32 50, metadata !4, metadata !100}
!102 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331652, metadata !8, i32 0, metadata !100} ; [ DW_TAG_arg_variable ] [upper_bound] [line 4]
!103 = metadata !{i32 4, i32 73, metadata !4, metadata !100}
!104 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 5, metadata !8, i32 0, metadata !100} ; [ DW_TAG_auto_variable ] [range] [line 5]
!105 = metadata !{i32 5, i32 15, metadata !4, metadata !100}
!106 = metadata !{i32 31, i32 3, metadata !12, null}
!107 = metadata !{i32 31, i32 3, metadata !108, null}
!108 = metadata !{i32 786443, metadata !1, metadata !12, i32 31, i32 3, i32 1, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!109 = metadata !{i32 18, i32 3, metadata !67, metadata !85}
!110 = metadata !{i32 6, i32 9, metadata !28, metadata !93}
!111 = metadata !{i32 7, i32 9, metadata !30, metadata !93}
!112 = metadata !{i32 9, i32 14, metadata !32, metadata !93}
!113 = metadata !{i32 10, i32 9, metadata !34, metadata !93}
!114 = metadata !{i32 6, i32 9, metadata !28, metadata !100}
!115 = metadata !{i32 7, i32 9, metadata !30, metadata !100}
!116 = metadata !{i32 9, i32 14, metadata !32, metadata !100}
!117 = metadata !{i32 10, i32 9, metadata !34, metadata !100}
!118 = metadata !{i32 786688, metadata !9, metadata !"__retres", metadata !5, i32 16, metadata !8, i32 0, metadata !85} ; [ DW_TAG_auto_variable ] [__retres] [line 16]
!119 = metadata !{i32 16, i32 13, metadata !9, metadata !85}
!120 = metadata !{i32 786688, metadata !12, metadata !"ret", metadata !5, i32 28, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ret] [line 28]
!121 = metadata !{i32 28, i32 13, metadata !12, null}
!122 = metadata !{i32 33, i32 13, metadata !86, null}
!123 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777220, metadata !8, i32 0, metadata !122} ; [ DW_TAG_arg_variable ] [value] [line 4]
!124 = metadata !{i32 4, i32 33, metadata !4, metadata !122}
!125 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554436, metadata !8, i32 0, metadata !122} ; [ DW_TAG_arg_variable ] [lower_bound] [line 4]
!126 = metadata !{i32 4, i32 50, metadata !4, metadata !122}
!127 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331652, metadata !8, i32 0, metadata !122} ; [ DW_TAG_arg_variable ] [upper_bound] [line 4]
!128 = metadata !{i32 4, i32 73, metadata !4, metadata !122}
!129 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 5, metadata !8, i32 0, metadata !122} ; [ DW_TAG_auto_variable ] [range] [line 5]
!130 = metadata !{i32 5, i32 15, metadata !4, metadata !122}
!131 = metadata !{i32 6, i32 9, metadata !28, metadata !122}
!132 = metadata !{i32 7, i32 9, metadata !30, metadata !122}
!133 = metadata !{i32 9, i32 14, metadata !32, metadata !122}
!134 = metadata !{i32 10, i32 9, metadata !34, metadata !122}
!135 = metadata !{i32 34, i32 11, metadata !86, null}
!136 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777220, metadata !8, i32 0, metadata !135} ; [ DW_TAG_arg_variable ] [value] [line 4]
!137 = metadata !{i32 4, i32 33, metadata !4, metadata !135}
!138 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554436, metadata !8, i32 0, metadata !135} ; [ DW_TAG_arg_variable ] [lower_bound] [line 4]
!139 = metadata !{i32 4, i32 50, metadata !4, metadata !135}
!140 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331652, metadata !8, i32 0, metadata !135} ; [ DW_TAG_arg_variable ] [upper_bound] [line 4]
!141 = metadata !{i32 4, i32 73, metadata !4, metadata !135}
!142 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 5, metadata !8, i32 0, metadata !135} ; [ DW_TAG_auto_variable ] [range] [line 5]
!143 = metadata !{i32 5, i32 15, metadata !4, metadata !135}
!144 = metadata !{i32 6, i32 9, metadata !28, metadata !135}
!145 = metadata !{i32 7, i32 9, metadata !30, metadata !135}
!146 = metadata !{i32 9, i32 14, metadata !32, metadata !135}
!147 = metadata !{i32 10, i32 9, metadata !34, metadata !135}
!148 = metadata !{i32 36, i32 3, metadata !12, null}

