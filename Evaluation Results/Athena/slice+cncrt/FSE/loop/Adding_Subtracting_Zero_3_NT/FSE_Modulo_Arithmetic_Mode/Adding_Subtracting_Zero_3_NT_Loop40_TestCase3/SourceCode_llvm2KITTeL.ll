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
  call void @llvm.dbg.value(metadata !42, i64 0, metadata !45), !dbg !47
  call void @llvm.dbg.value(metadata !{i64 %"15"}, i64 0, metadata !48), !dbg !54
  call void @llvm.dbg.value(metadata !55, i64 0, metadata !56), !dbg !57
  call void @llvm.dbg.value(metadata !58, i64 0, metadata !59), !dbg !60
  call void @llvm.dbg.value(metadata !61, i64 0, metadata !62), !dbg !63
  call void @llvm.dbg.value(metadata !{i64 %"26"}, i64 0, metadata !64), !dbg !66
  call void @llvm.dbg.value(metadata !55, i64 0, metadata !67), !dbg !68
  call void @llvm.dbg.value(metadata !58, i64 0, metadata !69), !dbg !70
  call void @llvm.dbg.value(metadata !61, i64 0, metadata !71), !dbg !72
  call void @llvm.dbg.value(metadata !{i64 %"26"}, i64 0, metadata !45), !dbg !47
  call void @llvm.dbg.value(metadata !{i64 %"27"}, i64 0, metadata !73), !dbg !75
  call void @llvm.dbg.value(metadata !55, i64 0, metadata !76), !dbg !77
  call void @llvm.dbg.value(metadata !58, i64 0, metadata !78), !dbg !79
  call void @llvm.dbg.value(metadata !61, i64 0, metadata !80), !dbg !81
  call void @llvm.dbg.value(metadata !{i64 %.0.i3}, i64 0, metadata !43), !dbg !44
  call void @llvm.dbg.value(metadata !{i64 %"39"}, i64 0, metadata !82), !dbg !86
  call void @llvm.dbg.value(metadata !55, i64 0, metadata !87), !dbg !88
  call void @llvm.dbg.value(metadata !58, i64 0, metadata !89), !dbg !90
  call void @llvm.dbg.value(metadata !61, i64 0, metadata !91), !dbg !92
  br label %read_slice_1_wrap_around.exit2, !dbg !93

read_slice_1_wrap_around.exit2:                   ; preds = %read_slice_1_bb18, %read_slice_1_bb17, %read_slice_1_bb16, %read_slice_1_bb5
  %count.0 = phi i64 [ 0, %read_slice_1_bb5 ], [ %.0.i3, %read_slice_1_bb16 ], [ %.0.i3, %read_slice_1_bb17 ], [ %.0.i3, %read_slice_1_bb18 ]
  %.0 = phi i64 [ %loc, %read_slice_1_bb5 ], [ %"44", %read_slice_1_bb16 ], [ %"49", %read_slice_1_bb18 ], [ %"39", %read_slice_1_bb17 ]
  %"12" = icmp slt i64 %.0, %len, !dbg !94
  br i1 %"12", label %read_slice_1_bb6, label %read_slice_1_bb19, !dbg !94

read_slice_1_bb6:                                 ; preds = %read_slice_1_wrap_around.exit2
  %"13" = icmp eq i64 0, 0, !dbg !96
  br i1 %"13", label %read_slice_1_bb19, label %read_slice_1_bb7, !dbg !96

read_slice_1_bb7:                                 ; preds = %read_slice_1_bb6
  %"14" = icmp slt i64 0, 0, !dbg !97
  br i1 %"14", label %read_slice_1_bb8, label %read_slice_1_wrap_around.exit, !dbg !97

read_slice_1_bb8:                                 ; preds = %read_slice_1_bb7
  %"15" = sub nsw i64 0, 0, !dbg !49
  %"16" = icmp sgt i64 %"15", 2147483647, !dbg !98
  br i1 %"16", label %read_slice_1_bb9, label %read_slice_1_bb10, !dbg !98

read_slice_1_bb9:                                 ; preds = %read_slice_1_bb8
  %"17" = sub nsw i64 %"15", 2147483647, !dbg !99
  %"18" = sub nsw i64 %"17", 1, !dbg !99
  %"19" = srem i64 %"18", 4294967296, !dbg !99
  %"20" = add nsw i64 -2147483648, %"19", !dbg !99
  br label %read_slice_1_wrap_around.exit, !dbg !99

read_slice_1_bb10:                                ; preds = %read_slice_1_bb8
  %"21" = icmp slt i64 %"15", -2147483648, !dbg !100
  br i1 %"21", label %read_slice_1_bb11, label %read_slice_1_wrap_around.exit, !dbg !100

read_slice_1_bb11:                                ; preds = %read_slice_1_bb10
  %"22" = sub nsw i64 -2147483648, %"15", !dbg !101
  %"23" = sub nsw i64 %"22", 1, !dbg !101
  %"24" = srem i64 %"23", 4294967296, !dbg !101
  %"25" = sub nsw i64 2147483647, %"24", !dbg !101
  br label %read_slice_1_wrap_around.exit, !dbg !101

read_slice_1_wrap_around.exit:                    ; preds = %read_slice_1_bb11, %read_slice_1_bb10, %read_slice_1_bb9, %read_slice_1_bb7
  %num.0 = phi i64 [ 0, %read_slice_1_bb7 ], [ %"20", %read_slice_1_bb9 ], [ %"25", %read_slice_1_bb11 ], [ %"15", %read_slice_1_bb10 ]
  %"26" = srem i64 %num.0, 1000, !dbg !65
  %"27" = add nsw i64 %count.0, 1, !dbg !74
  %"28" = icmp sgt i64 %"27", 2147483647, !dbg !102
  br i1 %"28", label %read_slice_1_bb12, label %read_slice_1_bb13, !dbg !102

read_slice_1_bb12:                                ; preds = %read_slice_1_wrap_around.exit
  %"29" = sub nsw i64 %"27", 2147483647, !dbg !103
  %"30" = sub nsw i64 %"29", 1, !dbg !103
  %"31" = srem i64 %"30", 4294967296, !dbg !103
  %"32" = add nsw i64 -2147483648, %"31", !dbg !103
  br label %read_slice_1_wrap_around.exit4, !dbg !103

read_slice_1_bb13:                                ; preds = %read_slice_1_wrap_around.exit
  %"33" = icmp slt i64 %"27", -2147483648, !dbg !104
  br i1 %"33", label %read_slice_1_bb14, label %read_slice_1_wrap_around.exit4, !dbg !104

read_slice_1_bb14:                                ; preds = %read_slice_1_bb13
  %"34" = sub nsw i64 -2147483648, %"27", !dbg !105
  %"35" = sub nsw i64 %"34", 1, !dbg !105
  %"36" = srem i64 %"35", 4294967296, !dbg !105
  %"37" = sub nsw i64 2147483647, %"36", !dbg !105
  br label %read_slice_1_wrap_around.exit4, !dbg !105

read_slice_1_wrap_around.exit4:                   ; preds = %read_slice_1_bb12, %read_slice_1_bb13, %read_slice_1_bb14
  %.0.i3 = phi i64 [ %"32", %read_slice_1_bb12 ], [ %"37", %read_slice_1_bb14 ], [ %"27", %read_slice_1_bb13 ], !dbg !74
  %"38" = icmp slt i64 %"26", 995, !dbg !106
  br i1 %"38", label %read_slice_1_bb15, label %read_slice_1_bb19, !dbg !106

read_slice_1_bb15:                                ; preds = %read_slice_1_wrap_around.exit4
  %"39" = add nsw i64 %.0, 1, !dbg !83
  %"40" = icmp sgt i64 %"39", 2147483647, !dbg !107
  br i1 %"40", label %read_slice_1_bb16, label %read_slice_1_bb17, !dbg !107

read_slice_1_bb16:                                ; preds = %read_slice_1_bb15
  %"41" = sub nsw i64 %"39", 2147483647, !dbg !108
  %"42" = sub nsw i64 %"41", 1, !dbg !108
  %"43" = srem i64 %"42", 4294967296, !dbg !108
  %"44" = add nsw i64 -2147483648, %"43", !dbg !108
  br label %read_slice_1_wrap_around.exit2, !dbg !108

read_slice_1_bb17:                                ; preds = %read_slice_1_bb15
  %"45" = icmp slt i64 %"39", -2147483648, !dbg !109
  br i1 %"45", label %read_slice_1_bb18, label %read_slice_1_wrap_around.exit2, !dbg !109

read_slice_1_bb18:                                ; preds = %read_slice_1_bb17
  %"46" = sub nsw i64 -2147483648, %"39", !dbg !110
  %"47" = sub nsw i64 %"46", 1, !dbg !110
  %"48" = srem i64 %"47", 4294967296, !dbg !110
  %"49" = sub nsw i64 2147483647, %"48", !dbg !110
  br label %read_slice_1_wrap_around.exit2, !dbg !110

read_slice_1_bb19:                                ; preds = %read_slice_1_wrap_around.exit2, %read_slice_1_wrap_around.exit4, %read_slice_1_bb6
  %__retres.0 = phi i64 [ -1, %read_slice_1_bb6 ], [ %.0.i3, %read_slice_1_wrap_around.exit4 ], [ %count.0, %read_slice_1_wrap_around.exit2 ]
  ret i64 %__retres.0, !dbg !111
}

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb20:
  call void @llvm.dbg.value(metadata !42, i64 0, metadata !112), !dbg !113
  call void @llvm.dbg.value(metadata !114, i64 0, metadata !115), !dbg !116
  store i64 0, i64* @"'flag", align 8, !dbg !117
  call void @llvm.dbg.value(metadata !42, i64 0, metadata !118), !dbg !119
  %"50" = icmp sle i64 10, 0, !dbg !120
  %"51" = icmp sgt i64 10, 65536, !dbg !122
  %or.cond = or i1 %"50", %"51", !dbg !120
  br i1 %or.cond, label %main_bb33, label %main_wrap_around.exit2, !dbg !120

main_wrap_around.exit2:                           ; preds = %main_bb20, %main_bb32, %main_bb31, %main_bb30, %main_wrap_around.exit4
  %__fc_errno_0.0 = phi i64 [ %.0.i3, %main_wrap_around.exit4 ], [ %__fc_errno_0.0, %main_bb30 ], [ %__fc_errno_0.0, %main_bb31 ], [ %__fc_errno_0.0, %main_bb32 ], [ 0, %main_bb20 ]
  %pos.0 = phi i64 [ %pos.0, %main_wrap_around.exit4 ], [ %"83", %main_bb30 ], [ %"88", %main_bb32 ], [ %"78", %main_bb31 ], [ 0, %main_bb20 ]
  %"52" = icmp slt i64 %pos.0, 10, !dbg !124
  br i1 %"52", label %main_bb21, label %main_bb33, !dbg !124

main_bb21:                                        ; preds = %main_wrap_around.exit2
  %"53" = sub nsw i64 10, %pos.0, !dbg !126
  %"54" = icmp sgt i64 %"53", 2147483647, !dbg !128
  br i1 %"54", label %main_bb22, label %main_bb23, !dbg !128

main_bb22:                                        ; preds = %main_bb21
  %"55" = sub nsw i64 %"53", 2147483647, !dbg !129
  %"56" = sub nsw i64 %"55", 1, !dbg !129
  %"57" = srem i64 %"56", 4294967296, !dbg !129
  %"58" = add nsw i64 -2147483648, %"57", !dbg !129
  br label %main_wrap_around.exit, !dbg !129

main_bb23:                                        ; preds = %main_bb21
  %"59" = icmp slt i64 %"53", -2147483648, !dbg !130
  br i1 %"59", label %main_bb24, label %main_wrap_around.exit, !dbg !130

main_bb24:                                        ; preds = %main_bb23
  %"60" = sub nsw i64 -2147483648, %"53", !dbg !131
  %"61" = sub nsw i64 %"60", 1, !dbg !131
  %"62" = srem i64 %"61", 4294967296, !dbg !131
  %"63" = sub nsw i64 2147483647, %"62", !dbg !131
  br label %main_wrap_around.exit, !dbg !131

main_wrap_around.exit:                            ; preds = %main_bb22, %main_bb23, %main_bb24
  %.0.i = phi i64 [ %"58", %main_bb22 ], [ %"63", %main_bb24 ], [ %"53", %main_bb23 ], !dbg !126
  %"64" = icmp slt i64 %pos.0, %.0.i, !dbg !132
  %. = select i1 %"64", i64 -1, i64 0, !dbg !132
  %"65" = icmp eq i64 %., -1, !dbg !134
  br i1 %"65", label %main_bb25, label %main_bb29, !dbg !134

main_bb25:                                        ; preds = %main_wrap_around.exit
  %"66" = add nsw i64 %__fc_errno_0.0, 1, !dbg !136
  %"67" = icmp sgt i64 %"66", 2147483647, !dbg !138
  br i1 %"67", label %main_bb26, label %main_bb27, !dbg !138

main_bb26:                                        ; preds = %main_bb25
  %"68" = sub nsw i64 %"66", 2147483647, !dbg !139
  %"69" = sub nsw i64 %"68", 1, !dbg !139
  %"70" = srem i64 %"69", 4294967296, !dbg !139
  %"71" = add nsw i64 -2147483648, %"70", !dbg !139
  br label %main_wrap_around.exit4, !dbg !139

main_bb27:                                        ; preds = %main_bb25
  %"72" = icmp slt i64 %"66", -2147483648, !dbg !140
  br i1 %"72", label %main_bb28, label %main_wrap_around.exit4, !dbg !140

main_bb28:                                        ; preds = %main_bb27
  %"73" = sub nsw i64 -2147483648, %"66", !dbg !141
  %"74" = sub nsw i64 %"73", 1, !dbg !141
  %"75" = srem i64 %"74", 4294967296, !dbg !141
  %"76" = sub nsw i64 2147483647, %"75", !dbg !141
  br label %main_wrap_around.exit4, !dbg !141

main_wrap_around.exit4:                           ; preds = %main_bb26, %main_bb27, %main_bb28
  %.0.i3 = phi i64 [ %"71", %main_bb26 ], [ %"76", %main_bb28 ], [ %"66", %main_bb27 ], !dbg !136
  %"77" = icmp eq i64 %.0.i3, 5, !dbg !142
  br i1 %"77", label %main_bb33, label %main_wrap_around.exit2, !dbg !142

main_bb29:                                        ; preds = %main_wrap_around.exit
  %"78" = add nsw i64 %pos.0, %., !dbg !144
  %"79" = icmp sgt i64 %"78", 2147483647, !dbg !145
  br i1 %"79", label %main_bb30, label %main_bb31, !dbg !145

main_bb30:                                        ; preds = %main_bb29
  %"80" = sub nsw i64 %"78", 2147483647, !dbg !146
  %"81" = sub nsw i64 %"80", 1, !dbg !146
  %"82" = srem i64 %"81", 4294967296, !dbg !146
  %"83" = add nsw i64 -2147483648, %"82", !dbg !146
  br label %main_wrap_around.exit2, !dbg !146

main_bb31:                                        ; preds = %main_bb29
  %"84" = icmp slt i64 %"78", -2147483648, !dbg !147
  br i1 %"84", label %main_bb32, label %main_wrap_around.exit2, !dbg !147

main_bb32:                                        ; preds = %main_bb31
  %"85" = sub nsw i64 -2147483648, %"78", !dbg !148
  %"86" = sub nsw i64 %"85", 1, !dbg !148
  %"87" = srem i64 %"86", 4294967296, !dbg !148
  %"88" = sub nsw i64 2147483647, %"87", !dbg !148
  br label %main_wrap_around.exit2, !dbg !148

main_bb33:                                        ; preds = %main_wrap_around.exit2, %main_wrap_around.exit4, %main_bb20
  ret void, !dbg !149
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
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"read_slice_1", metadata !"read_slice_1", metadata !"", i32 18, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i64, i64)* @read_slice_1, null, null, metadata !2, i32 19} ; [ DW_TAG_subprogram ] [line 18] [def] [scope 19] [read_slice_1]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !8, metadata !8, metadata !8}
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 49, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @main, null, null, metadata !2, i32 50} ; [ DW_TAG_subprogram ] [line 49] [def] [scope 50] [main]
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
!38 = metadata !{i32 786689, metadata !9, metadata !"loc", metadata !5, i32 16777234, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [loc] [line 18]
!39 = metadata !{i32 18, i32 34, metadata !9, null}
!40 = metadata !{i32 786689, metadata !9, metadata !"len", metadata !5, i32 33554450, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 18]
!41 = metadata !{i32 18, i32 49, metadata !9, null}
!42 = metadata !{i64 0}
!43 = metadata !{i32 786688, metadata !9, metadata !"count", metadata !5, i32 21, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 21]
!44 = metadata !{i32 21, i32 13, metadata !9, null}
!45 = metadata !{i32 786688, metadata !46, metadata !"num", metadata !5, i32 23, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [num] [line 23]
!46 = metadata !{i32 786443, metadata !1, metadata !9, i32 22, i32 21, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!47 = metadata !{i32 23, i32 15, metadata !46, null}
!48 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777224, metadata !8, i32 0, metadata !49} ; [ DW_TAG_arg_variable ] [value] [line 8]
!49 = metadata !{i32 31, i32 9, metadata !50, null}
!50 = metadata !{i32 786443, metadata !1, metadata !51, i32 31, i32 1, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!51 = metadata !{i32 786443, metadata !1, metadata !52, i32 30, i32 11, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!52 = metadata !{i32 786443, metadata !1, metadata !53, i32 29, i32 10, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!53 = metadata !{i32 786443, metadata !1, metadata !46, i32 24, i32 9, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!54 = metadata !{i32 8, i32 33, metadata !4, metadata !49} ; [ DW_TAG_imported_declaration ]
!55 = metadata !{i64 -2147483648}
!56 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554440, metadata !8, i32 0, metadata !49} ; [ DW_TAG_arg_variable ] [lower_bound] [line 8]
!57 = metadata !{i32 8, i32 50, metadata !4, metadata !49} ; [ DW_TAG_imported_declaration ]
!58 = metadata !{i64 2147483647}
!59 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331656, metadata !8, i32 0, metadata !49} ; [ DW_TAG_arg_variable ] [upper_bound] [line 8]
!60 = metadata !{i32 8, i32 73, metadata !4, metadata !49} ; [ DW_TAG_imported_declaration ]
!61 = metadata !{i64 4294967296}
!62 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 9, metadata !8, i32 0, metadata !49} ; [ DW_TAG_auto_variable ] [range] [line 9]
!63 = metadata !{i32 9, i32 15, metadata !4, metadata !49}
!64 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777224, metadata !8, i32 0, metadata !65} ; [ DW_TAG_arg_variable ] [value] [line 8]
!65 = metadata !{i32 33, i32 13, metadata !52, null}
!66 = metadata !{i32 8, i32 33, metadata !4, metadata !65} ; [ DW_TAG_imported_declaration ]
!67 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554440, metadata !8, i32 0, metadata !65} ; [ DW_TAG_arg_variable ] [lower_bound] [line 8]
!68 = metadata !{i32 8, i32 50, metadata !4, metadata !65} ; [ DW_TAG_imported_declaration ]
!69 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331656, metadata !8, i32 0, metadata !65} ; [ DW_TAG_arg_variable ] [upper_bound] [line 8]
!70 = metadata !{i32 8, i32 73, metadata !4, metadata !65} ; [ DW_TAG_imported_declaration ]
!71 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 9, metadata !8, i32 0, metadata !65} ; [ DW_TAG_auto_variable ] [range] [line 9]
!72 = metadata !{i32 9, i32 15, metadata !4, metadata !65}
!73 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777224, metadata !8, i32 0, metadata !74} ; [ DW_TAG_arg_variable ] [value] [line 8]
!74 = metadata !{i32 34, i32 16, metadata !52, null}
!75 = metadata !{i32 8, i32 33, metadata !4, metadata !74} ; [ DW_TAG_imported_declaration ]
!76 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554440, metadata !8, i32 0, metadata !74} ; [ DW_TAG_arg_variable ] [lower_bound] [line 8]
!77 = metadata !{i32 8, i32 50, metadata !4, metadata !74} ; [ DW_TAG_imported_declaration ]
!78 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331656, metadata !8, i32 0, metadata !74} ; [ DW_TAG_arg_variable ] [upper_bound] [line 8]
!79 = metadata !{i32 8, i32 73, metadata !4, metadata !74} ; [ DW_TAG_imported_declaration ]
!80 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 9, metadata !8, i32 0, metadata !74} ; [ DW_TAG_auto_variable ] [range] [line 9]
!81 = metadata !{i32 9, i32 15, metadata !4, metadata !74}
!82 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777224, metadata !8, i32 0, metadata !83} ; [ DW_TAG_arg_variable ] [value] [line 8]
!83 = metadata !{i32 36, i32 10, metadata !84, null}
!84 = metadata !{i32 786443, metadata !1, metadata !85, i32 36, i32 1, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!85 = metadata !{i32 786443, metadata !1, metadata !52, i32 35, i32 11, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!86 = metadata !{i32 8, i32 33, metadata !4, metadata !83} ; [ DW_TAG_imported_declaration ]
!87 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554440, metadata !8, i32 0, metadata !83} ; [ DW_TAG_arg_variable ] [lower_bound] [line 8]
!88 = metadata !{i32 8, i32 50, metadata !4, metadata !83} ; [ DW_TAG_imported_declaration ]
!89 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331656, metadata !8, i32 0, metadata !83} ; [ DW_TAG_arg_variable ] [upper_bound] [line 8]
!90 = metadata !{i32 8, i32 73, metadata !4, metadata !83} ; [ DW_TAG_imported_declaration ]
!91 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 9, metadata !8, i32 0, metadata !83} ; [ DW_TAG_auto_variable ] [range] [line 9]
!92 = metadata !{i32 9, i32 15, metadata !4, metadata !83}
!93 = metadata !{i32 22, i32 3, metadata !9, null}
!94 = metadata !{i32 22, i32 3, metadata !95, null}
!95 = metadata !{i32 786443, metadata !1, metadata !9, i32 22, i32 3, i32 1, i32 22} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!96 = metadata !{i32 24, i32 9, metadata !53, null}
!97 = metadata !{i32 30, i32 11, metadata !51, null}
!98 = metadata !{i32 10, i32 9, metadata !30, metadata !49}
!99 = metadata !{i32 11, i32 9, metadata !32, metadata !49}
!100 = metadata !{i32 13, i32 14, metadata !34, metadata !49}
!101 = metadata !{i32 14, i32 9, metadata !36, metadata !49}
!102 = metadata !{i32 10, i32 9, metadata !30, metadata !74}
!103 = metadata !{i32 11, i32 9, metadata !32, metadata !74}
!104 = metadata !{i32 13, i32 14, metadata !34, metadata !74}
!105 = metadata !{i32 14, i32 9, metadata !36, metadata !74}
!106 = metadata !{i32 35, i32 11, metadata !85, null}
!107 = metadata !{i32 10, i32 9, metadata !30, metadata !83}
!108 = metadata !{i32 11, i32 9, metadata !32, metadata !83}
!109 = metadata !{i32 13, i32 14, metadata !34, metadata !83}
!110 = metadata !{i32 14, i32 9, metadata !36, metadata !83}
!111 = metadata !{i32 46, i32 17, metadata !9, null}
!112 = metadata !{i32 786688, metadata !12, metadata !"pos", metadata !5, i32 51, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pos] [line 51]
!113 = metadata !{i32 51, i32 13, metadata !12, null}
!114 = metadata !{i64 10}
!115 = metadata !{i32 786688, metadata !12, metadata !"size", metadata !5, i32 52, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [size] [line 52]
!116 = metadata !{i32 52, i32 13, metadata !12, null}
!117 = metadata !{i32 53, i32 3, metadata !12, null}
!118 = metadata !{i32 786688, metadata !12, metadata !"__fc_errno_0", metadata !5, i32 54, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__fc_errno_0] [line 54]
!119 = metadata !{i32 54, i32 13, metadata !12, null}
!120 = metadata !{i32 55, i32 7, metadata !121, null}
!121 = metadata !{i32 786443, metadata !1, metadata !12, i32 55, i32 7, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!122 = metadata !{i32 59, i32 9, metadata !123, null}
!123 = metadata !{i32 786443, metadata !1, metadata !121, i32 59, i32 9, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!124 = metadata !{i32 62, i32 3, metadata !125, null}
!125 = metadata !{i32 786443, metadata !1, metadata !12, i32 62, i32 3, i32 1, i32 23} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!126 = metadata !{i32 63, i32 37, metadata !127, null}
!127 = metadata !{i32 786443, metadata !1, metadata !12, i32 62, i32 22, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!128 = metadata !{i32 10, i32 9, metadata !30, metadata !126}
!129 = metadata !{i32 11, i32 9, metadata !32, metadata !126}
!130 = metadata !{i32 13, i32 14, metadata !34, metadata !126}
!131 = metadata !{i32 14, i32 9, metadata !36, metadata !126}
!132 = metadata !{i32 22, i32 3, metadata !95, metadata !133}
!133 = metadata !{i32 63, i32 20, metadata !127, null}
!134 = metadata !{i32 64, i32 9, metadata !135, null}
!135 = metadata !{i32 786443, metadata !1, metadata !127, i32 64, i32 9, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!136 = metadata !{i32 65, i32 23, metadata !137, null}
!137 = metadata !{i32 786443, metadata !1, metadata !135, i32 64, i32 19, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!138 = metadata !{i32 10, i32 9, metadata !30, metadata !136}
!139 = metadata !{i32 11, i32 9, metadata !32, metadata !136}
!140 = metadata !{i32 13, i32 14, metadata !34, metadata !136}
!141 = metadata !{i32 14, i32 9, metadata !36, metadata !136}
!142 = metadata !{i32 66, i32 11, metadata !143, null}
!143 = metadata !{i32 786443, metadata !1, metadata !137, i32 66, i32 11, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!144 = metadata !{i32 72, i32 11, metadata !127, null}
!145 = metadata !{i32 10, i32 9, metadata !30, metadata !144}
!146 = metadata !{i32 11, i32 9, metadata !32, metadata !144}
!147 = metadata !{i32 13, i32 14, metadata !34, metadata !144}
!148 = metadata !{i32 14, i32 9, metadata !36, metadata !144}
!149 = metadata !{i32 74, i32 17, metadata !12, null}

