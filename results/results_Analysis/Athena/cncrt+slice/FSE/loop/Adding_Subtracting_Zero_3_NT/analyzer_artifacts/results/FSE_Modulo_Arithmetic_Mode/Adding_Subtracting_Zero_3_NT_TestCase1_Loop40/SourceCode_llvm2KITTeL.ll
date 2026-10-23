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
  call void @llvm.dbg.value(metadata !{i64 %"36"}, i64 0, metadata !87), !dbg !90
  call void @llvm.dbg.value(metadata !49, i64 0, metadata !91), !dbg !92
  call void @llvm.dbg.value(metadata !52, i64 0, metadata !93), !dbg !94
  call void @llvm.dbg.value(metadata !55, i64 0, metadata !95), !dbg !96
  call void @llvm.dbg.value(metadata !{i64 %pos.0}, i64 0, metadata !97), !dbg !99
  call void @llvm.dbg.value(metadata !{i64 %.0.i}, i64 0, metadata !100), !dbg !101
  call void @llvm.dbg.value(metadata !42, i64 0, metadata !102), !dbg !103
  call void @llvm.dbg.value(metadata !49, i64 0, metadata !104), !dbg !106
  call void @llvm.dbg.value(metadata !52, i64 0, metadata !107), !dbg !108
  call void @llvm.dbg.value(metadata !55, i64 0, metadata !109), !dbg !110
  call void @llvm.dbg.value(metadata !49, i64 0, metadata !111), !dbg !113
  call void @llvm.dbg.value(metadata !52, i64 0, metadata !114), !dbg !115
  call void @llvm.dbg.value(metadata !55, i64 0, metadata !116), !dbg !117
  br label %main_wrap_around.exit2, !dbg !118

main_wrap_around.exit2:                           ; preds = %main_bb28, %main_bb27, %main_bb26, %main_bb14
  %pos.0 = phi i64 [ 0, %main_bb14 ], [ %"75", %main_bb26 ], [ %"80", %main_bb28 ], [ %"70", %main_bb27 ]
  %"35" = icmp slt i64 %pos.0, 1, !dbg !119
  br i1 %"35", label %main_bb15, label %main_bb29, !dbg !119

main_bb15:                                        ; preds = %main_wrap_around.exit2
  %"36" = sub nsw i64 1, %pos.0, !dbg !88
  %"37" = icmp sgt i64 %"36", 2147483647, !dbg !121
  br i1 %"37", label %main_bb16, label %main_bb17, !dbg !121

main_bb16:                                        ; preds = %main_bb15
  %"38" = sub nsw i64 %"36", 2147483647, !dbg !122
  %"39" = sub nsw i64 %"38", 1, !dbg !122
  %"40" = srem i64 %"39", 4294967296, !dbg !122
  %"41" = add nsw i64 -2147483648, %"40", !dbg !122
  br label %main_wrap_around.exit, !dbg !122

main_bb17:                                        ; preds = %main_bb15
  %"42" = icmp slt i64 %"36", -2147483648, !dbg !123
  br i1 %"42", label %main_bb18, label %main_wrap_around.exit, !dbg !123

main_bb18:                                        ; preds = %main_bb17
  %"43" = sub nsw i64 -2147483648, %"36", !dbg !124
  %"44" = sub nsw i64 %"43", 1, !dbg !124
  %"45" = srem i64 %"44", 4294967296, !dbg !124
  %"46" = sub nsw i64 2147483647, %"45", !dbg !124
  br label %main_wrap_around.exit, !dbg !124

main_wrap_around.exit:                            ; preds = %main_bb16, %main_bb17, %main_bb18
  %.0.i = phi i64 [ %"41", %main_bb16 ], [ %"46", %main_bb18 ], [ %"36", %main_bb17 ], !dbg !88
  br label %main_wrap_around.exit2.i, !dbg !125

main_wrap_around.exit2.i:                         ; preds = %main_bb25, %main_bb24, %main_bb23, %main_wrap_around.exit
  %count.0.i = phi i64 [ 0, %main_wrap_around.exit ], [ %.0.i.i, %main_bb23 ], [ %.0.i.i, %main_bb24 ], [ %.0.i.i, %main_bb25 ], !dbg !98
  %.0.i3 = phi i64 [ %pos.0, %main_wrap_around.exit ], [ %"64", %main_bb23 ], [ %"69", %main_bb25 ], [ %"59", %main_bb24 ], !dbg !98
  %"47" = icmp slt i64 %.0.i3, %.0.i, !dbg !126
  br i1 %"47", label %main_bb19, label %main_read_slice_1.exit, !dbg !126

main_bb19:                                        ; preds = %main_wrap_around.exit2.i
  %"48" = add nsw i64 %count.0.i, 1, !dbg !105
  %"49" = icmp sgt i64 %"48", 2147483647, !dbg !127
  br i1 %"49", label %main_bb20, label %main_bb21, !dbg !127

main_bb20:                                        ; preds = %main_bb19
  %"50" = sub nsw i64 %"48", 2147483647, !dbg !128
  %"51" = sub nsw i64 %"50", 1, !dbg !128
  %"52" = srem i64 %"51", 4294967296, !dbg !128
  %"53" = add nsw i64 -2147483648, %"52", !dbg !128
  br label %main_wrap_around.exit.i, !dbg !128

main_bb21:                                        ; preds = %main_bb19
  %"54" = icmp slt i64 %"48", -2147483648, !dbg !129
  br i1 %"54", label %main_bb22, label %main_wrap_around.exit.i, !dbg !129

main_bb22:                                        ; preds = %main_bb21
  %"55" = sub nsw i64 -2147483648, %"48", !dbg !130
  %"56" = sub nsw i64 %"55", 1, !dbg !130
  %"57" = srem i64 %"56", 4294967296, !dbg !130
  %"58" = sub nsw i64 2147483647, %"57", !dbg !130
  br label %main_wrap_around.exit.i, !dbg !130

main_wrap_around.exit.i:                          ; preds = %main_bb22, %main_bb21, %main_bb20
  %.0.i.i = phi i64 [ %"53", %main_bb20 ], [ %"58", %main_bb22 ], [ %"48", %main_bb21 ], !dbg !105
  %"59" = add nsw i64 %.0.i3, 1, !dbg !112
  %"60" = icmp sgt i64 %"59", 2147483647, !dbg !131
  br i1 %"60", label %main_bb23, label %main_bb24, !dbg !131

main_bb23:                                        ; preds = %main_wrap_around.exit.i
  %"61" = sub nsw i64 %"59", 2147483647, !dbg !132
  %"62" = sub nsw i64 %"61", 1, !dbg !132
  %"63" = srem i64 %"62", 4294967296, !dbg !132
  %"64" = add nsw i64 -2147483648, %"63", !dbg !132
  br label %main_wrap_around.exit2.i, !dbg !132

main_bb24:                                        ; preds = %main_wrap_around.exit.i
  %"65" = icmp slt i64 %"59", -2147483648, !dbg !133
  br i1 %"65", label %main_bb25, label %main_wrap_around.exit2.i, !dbg !133

main_bb25:                                        ; preds = %main_bb24
  %"66" = sub nsw i64 -2147483648, %"59", !dbg !134
  %"67" = sub nsw i64 %"66", 1, !dbg !134
  %"68" = srem i64 %"67", 4294967296, !dbg !134
  %"69" = sub nsw i64 2147483647, %"68", !dbg !134
  br label %main_wrap_around.exit2.i, !dbg !134

main_read_slice_1.exit:                           ; preds = %main_wrap_around.exit2.i
  call void @llvm.dbg.value(metadata !{i64 %count.0.i}, i64 0, metadata !135), !dbg !136
  call void @llvm.dbg.value(metadata !{i64 %count.0.i}, i64 0, metadata !137), !dbg !138
  %"70" = add nsw i64 %pos.0, %count.0.i, !dbg !139
  call void @llvm.dbg.value(metadata !{i64 %"70"}, i64 0, metadata !140), !dbg !141
  call void @llvm.dbg.value(metadata !49, i64 0, metadata !142), !dbg !143
  call void @llvm.dbg.value(metadata !52, i64 0, metadata !144), !dbg !145
  call void @llvm.dbg.value(metadata !55, i64 0, metadata !146), !dbg !147
  %"71" = icmp sgt i64 %"70", 2147483647, !dbg !148
  br i1 %"71", label %main_bb26, label %main_bb27, !dbg !148

main_bb26:                                        ; preds = %main_read_slice_1.exit
  %"72" = sub nsw i64 %"70", 2147483647, !dbg !149
  %"73" = sub nsw i64 %"72", 1, !dbg !149
  %"74" = srem i64 %"73", 4294967296, !dbg !149
  %"75" = add nsw i64 -2147483648, %"74", !dbg !149
  br label %main_wrap_around.exit2, !dbg !149

main_bb27:                                        ; preds = %main_read_slice_1.exit
  %"76" = icmp slt i64 %"70", -2147483648, !dbg !150
  br i1 %"76", label %main_bb28, label %main_wrap_around.exit2, !dbg !150

main_bb28:                                        ; preds = %main_bb27
  %"77" = sub nsw i64 -2147483648, %"70", !dbg !151
  %"78" = sub nsw i64 %"77", 1, !dbg !151
  %"79" = srem i64 %"78", 4294967296, !dbg !151
  %"80" = sub nsw i64 2147483647, %"79", !dbg !151
  br label %main_wrap_around.exit2, !dbg !151

main_bb29:                                        ; preds = %main_wrap_around.exit2
  ret void, !dbg !152
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
!69 = metadata !{i32 786443, metadata !1, metadata !9, i32 19, i32 3, i32 1, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
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
!83 = metadata !{i64 1}
!84 = metadata !{i32 786688, metadata !12, metadata !"size", metadata !5, i32 30, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [size] [line 30]
!85 = metadata !{i32 30, i32 13, metadata !12, null}
!86 = metadata !{i32 31, i32 3, metadata !12, null}
!87 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777221, metadata !8, i32 0, metadata !88} ; [ DW_TAG_arg_variable ] [value] [line 5]
!88 = metadata !{i32 33, i32 37, metadata !89, null}
!89 = metadata !{i32 786443, metadata !1, metadata !12, i32 32, i32 22, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!90 = metadata !{i32 5, i32 33, metadata !4, metadata !88}
!91 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554437, metadata !8, i32 0, metadata !88} ; [ DW_TAG_arg_variable ] [lower_bound] [line 5]
!92 = metadata !{i32 5, i32 50, metadata !4, metadata !88}
!93 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331653, metadata !8, i32 0, metadata !88} ; [ DW_TAG_arg_variable ] [upper_bound] [line 5]
!94 = metadata !{i32 5, i32 73, metadata !4, metadata !88}
!95 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 6, metadata !8, i32 0, metadata !88} ; [ DW_TAG_auto_variable ] [range] [line 6]
!96 = metadata !{i32 6, i32 15, metadata !4, metadata !88}
!97 = metadata !{i32 786689, metadata !9, metadata !"loc", metadata !5, i32 16777231, metadata !8, i32 0, metadata !98} ; [ DW_TAG_arg_variable ] [loc] [line 15]
!98 = metadata !{i32 33, i32 20, metadata !89, null}
!99 = metadata !{i32 15, i32 34, metadata !9, metadata !98}
!100 = metadata !{i32 786689, metadata !9, metadata !"len", metadata !5, i32 33554447, metadata !8, i32 0, metadata !98} ; [ DW_TAG_arg_variable ] [len] [line 15]
!101 = metadata !{i32 15, i32 49, metadata !9, metadata !98}
!102 = metadata !{i32 786688, metadata !9, metadata !"count", metadata !5, i32 18, metadata !8, i32 0, metadata !98} ; [ DW_TAG_auto_variable ] [count] [line 18]
!103 = metadata !{i32 18, i32 13, metadata !9, metadata !98}
!104 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554437, metadata !8, i32 0, metadata !105} ; [ DW_TAG_arg_variable ] [lower_bound] [line 5]
!105 = metadata !{i32 20, i32 14, metadata !47, metadata !98}
!106 = metadata !{i32 5, i32 50, metadata !4, metadata !105}
!107 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331653, metadata !8, i32 0, metadata !105} ; [ DW_TAG_arg_variable ] [upper_bound] [line 5]
!108 = metadata !{i32 5, i32 73, metadata !4, metadata !105}
!109 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 6, metadata !8, i32 0, metadata !105} ; [ DW_TAG_auto_variable ] [range] [line 6]
!110 = metadata !{i32 6, i32 15, metadata !4, metadata !105}
!111 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554437, metadata !8, i32 0, metadata !112} ; [ DW_TAG_arg_variable ] [lower_bound] [line 5]
!112 = metadata !{i32 21, i32 12, metadata !47, metadata !98}
!113 = metadata !{i32 5, i32 50, metadata !4, metadata !112}
!114 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331653, metadata !8, i32 0, metadata !112} ; [ DW_TAG_arg_variable ] [upper_bound] [line 5]
!115 = metadata !{i32 5, i32 73, metadata !4, metadata !112}
!116 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 6, metadata !8, i32 0, metadata !112} ; [ DW_TAG_auto_variable ] [range] [line 6]
!117 = metadata !{i32 6, i32 15, metadata !4, metadata !112}
!118 = metadata !{i32 32, i32 3, metadata !12, null}
!119 = metadata !{i32 32, i32 3, metadata !120, null}
!120 = metadata !{i32 786443, metadata !1, metadata !12, i32 32, i32 3, i32 1, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!121 = metadata !{i32 7, i32 9, metadata !30, metadata !88}
!122 = metadata !{i32 8, i32 9, metadata !32, metadata !88} ; [ DW_TAG_imported_declaration ]
!123 = metadata !{i32 10, i32 14, metadata !34, metadata !88}
!124 = metadata !{i32 11, i32 9, metadata !36, metadata !88}
!125 = metadata !{i32 19, i32 3, metadata !9, metadata !98}
!126 = metadata !{i32 19, i32 3, metadata !69, metadata !98}
!127 = metadata !{i32 7, i32 9, metadata !30, metadata !105}
!128 = metadata !{i32 8, i32 9, metadata !32, metadata !105} ; [ DW_TAG_imported_declaration ]
!129 = metadata !{i32 10, i32 14, metadata !34, metadata !105}
!130 = metadata !{i32 11, i32 9, metadata !36, metadata !105}
!131 = metadata !{i32 7, i32 9, metadata !30, metadata !112}
!132 = metadata !{i32 8, i32 9, metadata !32, metadata !112} ; [ DW_TAG_imported_declaration ]
!133 = metadata !{i32 10, i32 14, metadata !34, metadata !112}
!134 = metadata !{i32 11, i32 9, metadata !36, metadata !112}
!135 = metadata !{i32 786688, metadata !9, metadata !"__retres", metadata !5, i32 17, metadata !8, i32 0, metadata !98} ; [ DW_TAG_auto_variable ] [__retres] [line 17]
!136 = metadata !{i32 17, i32 13, metadata !9, metadata !98}
!137 = metadata !{i32 786688, metadata !89, metadata !"rc", metadata !5, i32 33, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rc] [line 33]
!138 = metadata !{i32 33, i32 15, metadata !89, null}
!139 = metadata !{i32 34, i32 11, metadata !89, null}
!140 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777221, metadata !8, i32 0, metadata !139} ; [ DW_TAG_arg_variable ] [value] [line 5]
!141 = metadata !{i32 5, i32 33, metadata !4, metadata !139}
!142 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554437, metadata !8, i32 0, metadata !139} ; [ DW_TAG_arg_variable ] [lower_bound] [line 5]
!143 = metadata !{i32 5, i32 50, metadata !4, metadata !139}
!144 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331653, metadata !8, i32 0, metadata !139} ; [ DW_TAG_arg_variable ] [upper_bound] [line 5]
!145 = metadata !{i32 5, i32 73, metadata !4, metadata !139}
!146 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 6, metadata !8, i32 0, metadata !139} ; [ DW_TAG_auto_variable ] [range] [line 6]
!147 = metadata !{i32 6, i32 15, metadata !4, metadata !139}
!148 = metadata !{i32 7, i32 9, metadata !30, metadata !139}
!149 = metadata !{i32 8, i32 9, metadata !32, metadata !139} ; [ DW_TAG_imported_declaration ]
!150 = metadata !{i32 10, i32 14, metadata !34, metadata !139}
!151 = metadata !{i32 11, i32 9, metadata !36, metadata !139}
!152 = metadata !{i32 36, i32 3, metadata !12, null}

