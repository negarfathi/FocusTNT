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
  call void @llvm.dbg.value(metadata !45, i64 0, metadata !46), !dbg !48
  call void @llvm.dbg.value(metadata !{i64 %"15"}, i64 0, metadata !49), !dbg !55
  call void @llvm.dbg.value(metadata !56, i64 0, metadata !57), !dbg !58
  call void @llvm.dbg.value(metadata !59, i64 0, metadata !60), !dbg !61
  call void @llvm.dbg.value(metadata !62, i64 0, metadata !63), !dbg !64
  call void @llvm.dbg.value(metadata !{i64 %"26"}, i64 0, metadata !65), !dbg !67
  call void @llvm.dbg.value(metadata !56, i64 0, metadata !68), !dbg !69
  call void @llvm.dbg.value(metadata !59, i64 0, metadata !70), !dbg !71
  call void @llvm.dbg.value(metadata !62, i64 0, metadata !72), !dbg !73
  call void @llvm.dbg.value(metadata !{i64 %"26"}, i64 0, metadata !46), !dbg !48
  call void @llvm.dbg.value(metadata !{i64 %"27"}, i64 0, metadata !74), !dbg !76
  call void @llvm.dbg.value(metadata !56, i64 0, metadata !77), !dbg !78
  call void @llvm.dbg.value(metadata !59, i64 0, metadata !79), !dbg !80
  call void @llvm.dbg.value(metadata !62, i64 0, metadata !81), !dbg !82
  call void @llvm.dbg.value(metadata !{i64 %.0.i3}, i64 0, metadata !43), !dbg !44
  call void @llvm.dbg.value(metadata !{i64 %"39"}, i64 0, metadata !83), !dbg !87
  call void @llvm.dbg.value(metadata !56, i64 0, metadata !88), !dbg !89
  call void @llvm.dbg.value(metadata !59, i64 0, metadata !90), !dbg !91
  call void @llvm.dbg.value(metadata !62, i64 0, metadata !92), !dbg !93
  br label %read_slice_1_wrap_around.exit2, !dbg !94

read_slice_1_wrap_around.exit2:                   ; preds = %read_slice_1_bb18, %read_slice_1_bb17, %read_slice_1_bb16, %read_slice_1_bb5
  %count.0 = phi i64 [ 0, %read_slice_1_bb5 ], [ %.0.i3, %read_slice_1_bb16 ], [ %.0.i3, %read_slice_1_bb17 ], [ %.0.i3, %read_slice_1_bb18 ]
  %.0 = phi i64 [ %loc, %read_slice_1_bb5 ], [ %"44", %read_slice_1_bb16 ], [ %"49", %read_slice_1_bb18 ], [ %"39", %read_slice_1_bb17 ]
  %"12" = icmp slt i64 %.0, %len, !dbg !95
  br i1 %"12", label %read_slice_1_bb6, label %read_slice_1_bb19, !dbg !95

read_slice_1_bb6:                                 ; preds = %read_slice_1_wrap_around.exit2
  %"13" = icmp eq i64 -250, 0, !dbg !97
  br i1 %"13", label %read_slice_1_bb19, label %read_slice_1_bb7, !dbg !97

read_slice_1_bb7:                                 ; preds = %read_slice_1_bb6
  %"14" = icmp slt i64 -250, 0, !dbg !98
  br i1 %"14", label %read_slice_1_bb8, label %read_slice_1_wrap_around.exit, !dbg !98

read_slice_1_bb8:                                 ; preds = %read_slice_1_bb7
  %"15" = sub nsw i64 0, -250, !dbg !50
  %"16" = icmp sgt i64 %"15", 2147483647, !dbg !99
  br i1 %"16", label %read_slice_1_bb9, label %read_slice_1_bb10, !dbg !99

read_slice_1_bb9:                                 ; preds = %read_slice_1_bb8
  %"17" = sub nsw i64 %"15", 2147483647, !dbg !100
  %"18" = sub nsw i64 %"17", 1, !dbg !100
  %"19" = srem i64 %"18", 4294967296, !dbg !100
  %"20" = add nsw i64 -2147483648, %"19", !dbg !100
  br label %read_slice_1_wrap_around.exit, !dbg !100

read_slice_1_bb10:                                ; preds = %read_slice_1_bb8
  %"21" = icmp slt i64 %"15", -2147483648, !dbg !101
  br i1 %"21", label %read_slice_1_bb11, label %read_slice_1_wrap_around.exit, !dbg !101

read_slice_1_bb11:                                ; preds = %read_slice_1_bb10
  %"22" = sub nsw i64 -2147483648, %"15", !dbg !102
  %"23" = sub nsw i64 %"22", 1, !dbg !102
  %"24" = srem i64 %"23", 4294967296, !dbg !102
  %"25" = sub nsw i64 2147483647, %"24", !dbg !102
  br label %read_slice_1_wrap_around.exit, !dbg !102

read_slice_1_wrap_around.exit:                    ; preds = %read_slice_1_bb11, %read_slice_1_bb10, %read_slice_1_bb9, %read_slice_1_bb7
  %num.0 = phi i64 [ -250, %read_slice_1_bb7 ], [ %"20", %read_slice_1_bb9 ], [ %"25", %read_slice_1_bb11 ], [ %"15", %read_slice_1_bb10 ]
  %"26" = srem i64 %num.0, 1000, !dbg !66
  %"27" = add nsw i64 %count.0, 1, !dbg !75
  %"28" = icmp sgt i64 %"27", 2147483647, !dbg !103
  br i1 %"28", label %read_slice_1_bb12, label %read_slice_1_bb13, !dbg !103

read_slice_1_bb12:                                ; preds = %read_slice_1_wrap_around.exit
  %"29" = sub nsw i64 %"27", 2147483647, !dbg !104
  %"30" = sub nsw i64 %"29", 1, !dbg !104
  %"31" = srem i64 %"30", 4294967296, !dbg !104
  %"32" = add nsw i64 -2147483648, %"31", !dbg !104
  br label %read_slice_1_wrap_around.exit4, !dbg !104

read_slice_1_bb13:                                ; preds = %read_slice_1_wrap_around.exit
  %"33" = icmp slt i64 %"27", -2147483648, !dbg !105
  br i1 %"33", label %read_slice_1_bb14, label %read_slice_1_wrap_around.exit4, !dbg !105

read_slice_1_bb14:                                ; preds = %read_slice_1_bb13
  %"34" = sub nsw i64 -2147483648, %"27", !dbg !106
  %"35" = sub nsw i64 %"34", 1, !dbg !106
  %"36" = srem i64 %"35", 4294967296, !dbg !106
  %"37" = sub nsw i64 2147483647, %"36", !dbg !106
  br label %read_slice_1_wrap_around.exit4, !dbg !106

read_slice_1_wrap_around.exit4:                   ; preds = %read_slice_1_bb12, %read_slice_1_bb13, %read_slice_1_bb14
  %.0.i3 = phi i64 [ %"32", %read_slice_1_bb12 ], [ %"37", %read_slice_1_bb14 ], [ %"27", %read_slice_1_bb13 ], !dbg !75
  %"38" = icmp slt i64 %"26", 995, !dbg !107
  br i1 %"38", label %read_slice_1_bb15, label %read_slice_1_bb19, !dbg !107

read_slice_1_bb15:                                ; preds = %read_slice_1_wrap_around.exit4
  %"39" = add nsw i64 %.0, 1, !dbg !84
  %"40" = icmp sgt i64 %"39", 2147483647, !dbg !108
  br i1 %"40", label %read_slice_1_bb16, label %read_slice_1_bb17, !dbg !108

read_slice_1_bb16:                                ; preds = %read_slice_1_bb15
  %"41" = sub nsw i64 %"39", 2147483647, !dbg !109
  %"42" = sub nsw i64 %"41", 1, !dbg !109
  %"43" = srem i64 %"42", 4294967296, !dbg !109
  %"44" = add nsw i64 -2147483648, %"43", !dbg !109
  br label %read_slice_1_wrap_around.exit2, !dbg !109

read_slice_1_bb17:                                ; preds = %read_slice_1_bb15
  %"45" = icmp slt i64 %"39", -2147483648, !dbg !110
  br i1 %"45", label %read_slice_1_bb18, label %read_slice_1_wrap_around.exit2, !dbg !110

read_slice_1_bb18:                                ; preds = %read_slice_1_bb17
  %"46" = sub nsw i64 -2147483648, %"39", !dbg !111
  %"47" = sub nsw i64 %"46", 1, !dbg !111
  %"48" = srem i64 %"47", 4294967296, !dbg !111
  %"49" = sub nsw i64 2147483647, %"48", !dbg !111
  br label %read_slice_1_wrap_around.exit2, !dbg !111

read_slice_1_bb19:                                ; preds = %read_slice_1_wrap_around.exit2, %read_slice_1_wrap_around.exit4, %read_slice_1_bb6
  %__retres.0 = phi i64 [ -1, %read_slice_1_bb6 ], [ %.0.i3, %read_slice_1_wrap_around.exit4 ], [ %count.0, %read_slice_1_wrap_around.exit2 ]
  ret i64 %__retres.0, !dbg !112
}

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb20:
  call void @llvm.dbg.value(metadata !113, i64 0, metadata !114), !dbg !115
  %"50" = icmp sle i64 6, 0, !dbg !116
  br i1 %"50", label %main_bb35, label %main_wrap_around.exit, !dbg !116

main_wrap_around.exit:                            ; preds = %main_bb34, %main_bb33, %main_bb32, %main_bb20
  %buf.0 = phi i64 [ 0, %main_bb20 ], [ %"92", %main_bb32 ], [ %"97", %main_bb34 ], [ %"87", %main_bb33 ]
  %count.0 = phi i64 [ 6, %main_bb20 ], [ %.0.i2, %main_bb32 ], [ %.0.i2, %main_bb33 ], [ %.0.i2, %main_bb34 ]
  %"51" = icmp sgt i64 %count.0, 0, !dbg !118
  br i1 %"51", label %main_wrap_around.exit2.i, label %main_bb35, !dbg !118

main_wrap_around.exit2.i:                         ; preds = %main_wrap_around.exit, %main_bb27, %main_bb26, %main_bb25
  %count.0.i = phi i64 [ %.0.i3.i, %main_bb25 ], [ %.0.i3.i, %main_bb26 ], [ %.0.i3.i, %main_bb27 ], [ 0, %main_wrap_around.exit ], !dbg !120
  %.0.i = phi i64 [ %"69", %main_bb25 ], [ %"74", %main_bb27 ], [ %"64", %main_bb26 ], [ %buf.0, %main_wrap_around.exit ], !dbg !120
  %"52" = icmp slt i64 %.0.i, %count.0, !dbg !122
  br i1 %"52", label %main_bb21, label %main_read_slice_1.exit, !dbg !122

main_bb21:                                        ; preds = %main_wrap_around.exit2.i
  %"53" = add nsw i64 %count.0.i, 1, !dbg !123
  %"54" = icmp sgt i64 %"53", 2147483647, !dbg !124
  br i1 %"54", label %main_bb22, label %main_bb23, !dbg !124

main_bb22:                                        ; preds = %main_bb21
  %"55" = sub nsw i64 %"53", 2147483647, !dbg !125
  %"56" = sub nsw i64 %"55", 1, !dbg !125
  %"57" = srem i64 %"56", 4294967296, !dbg !125
  %"58" = add nsw i64 -2147483648, %"57", !dbg !125
  br label %main_wrap_around.exit4.i, !dbg !125

main_bb23:                                        ; preds = %main_bb21
  %"59" = icmp slt i64 %"53", -2147483648, !dbg !126
  br i1 %"59", label %main_bb24, label %main_wrap_around.exit4.i, !dbg !126

main_bb24:                                        ; preds = %main_bb23
  %"60" = sub nsw i64 -2147483648, %"53", !dbg !127
  %"61" = sub nsw i64 %"60", 1, !dbg !127
  %"62" = srem i64 %"61", 4294967296, !dbg !127
  %"63" = sub nsw i64 2147483647, %"62", !dbg !127
  br label %main_wrap_around.exit4.i, !dbg !127

main_wrap_around.exit4.i:                         ; preds = %main_bb24, %main_bb23, %main_bb22
  %.0.i3.i = phi i64 [ %"58", %main_bb22 ], [ %"63", %main_bb24 ], [ %"53", %main_bb23 ], !dbg !123
  %"64" = add nsw i64 %.0.i, 1, !dbg !128
  %"65" = icmp sgt i64 %"64", 2147483647, !dbg !129
  br i1 %"65", label %main_bb25, label %main_bb26, !dbg !129

main_bb25:                                        ; preds = %main_wrap_around.exit4.i
  %"66" = sub nsw i64 %"64", 2147483647, !dbg !130
  %"67" = sub nsw i64 %"66", 1, !dbg !130
  %"68" = srem i64 %"67", 4294967296, !dbg !130
  %"69" = add nsw i64 -2147483648, %"68", !dbg !130
  br label %main_wrap_around.exit2.i, !dbg !130

main_bb26:                                        ; preds = %main_wrap_around.exit4.i
  %"70" = icmp slt i64 %"64", -2147483648, !dbg !131
  br i1 %"70", label %main_bb27, label %main_wrap_around.exit2.i, !dbg !131

main_bb27:                                        ; preds = %main_bb26
  %"71" = sub nsw i64 -2147483648, %"64", !dbg !132
  %"72" = sub nsw i64 %"71", 1, !dbg !132
  %"73" = srem i64 %"72", 4294967296, !dbg !132
  %"74" = sub nsw i64 2147483647, %"73", !dbg !132
  br label %main_wrap_around.exit2.i, !dbg !132

main_read_slice_1.exit:                           ; preds = %main_wrap_around.exit2.i
  call void @llvm.dbg.value(metadata !{i64 %count.0.i}, i64 0, metadata !133), !dbg !134
  %"75" = icmp slt i64 %count.0.i, 0, !dbg !135
  br i1 %"75", label %main_bb35, label %main_bb28, !dbg !135

main_bb28:                                        ; preds = %main_read_slice_1.exit
  %"76" = sub nsw i64 %count.0, %count.0.i, !dbg !137
  call void @llvm.dbg.value(metadata !{i64 %"76"}, i64 0, metadata !138), !dbg !139
  call void @llvm.dbg.value(metadata !56, i64 0, metadata !140), !dbg !141
  call void @llvm.dbg.value(metadata !59, i64 0, metadata !142), !dbg !143
  call void @llvm.dbg.value(metadata !62, i64 0, metadata !144), !dbg !145
  %"77" = icmp sgt i64 %"76", 2147483647, !dbg !146
  br i1 %"77", label %main_bb29, label %main_bb30, !dbg !146

main_bb29:                                        ; preds = %main_bb28
  %"78" = sub nsw i64 %"76", 2147483647, !dbg !147
  %"79" = sub nsw i64 %"78", 1, !dbg !147
  %"80" = srem i64 %"79", 4294967296, !dbg !147
  %"81" = add nsw i64 -2147483648, %"80", !dbg !147
  br label %main_wrap_around.exit3, !dbg !147

main_bb30:                                        ; preds = %main_bb28
  %"82" = icmp slt i64 %"76", -2147483648, !dbg !148
  br i1 %"82", label %main_bb31, label %main_wrap_around.exit3, !dbg !148

main_bb31:                                        ; preds = %main_bb30
  %"83" = sub nsw i64 -2147483648, %"76", !dbg !149
  %"84" = sub nsw i64 %"83", 1, !dbg !149
  %"85" = srem i64 %"84", 4294967296, !dbg !149
  %"86" = sub nsw i64 2147483647, %"85", !dbg !149
  br label %main_wrap_around.exit3, !dbg !149

main_wrap_around.exit3:                           ; preds = %main_bb29, %main_bb30, %main_bb31
  %.0.i2 = phi i64 [ %"81", %main_bb29 ], [ %"86", %main_bb31 ], [ %"76", %main_bb30 ], !dbg !137
  call void @llvm.dbg.value(metadata !{i64 %.0.i2}, i64 0, metadata !114), !dbg !115
  %"87" = add nsw i64 %buf.0, %count.0.i, !dbg !150
  call void @llvm.dbg.value(metadata !{i64 %"87"}, i64 0, metadata !151), !dbg !152
  call void @llvm.dbg.value(metadata !56, i64 0, metadata !153), !dbg !154
  call void @llvm.dbg.value(metadata !59, i64 0, metadata !155), !dbg !156
  call void @llvm.dbg.value(metadata !62, i64 0, metadata !157), !dbg !158
  %"88" = icmp sgt i64 %"87", 2147483647, !dbg !159
  br i1 %"88", label %main_bb32, label %main_bb33, !dbg !159

main_bb32:                                        ; preds = %main_wrap_around.exit3
  %"89" = sub nsw i64 %"87", 2147483647, !dbg !160
  %"90" = sub nsw i64 %"89", 1, !dbg !160
  %"91" = srem i64 %"90", 4294967296, !dbg !160
  %"92" = add nsw i64 -2147483648, %"91", !dbg !160
  br label %main_wrap_around.exit, !dbg !160

main_bb33:                                        ; preds = %main_wrap_around.exit3
  %"93" = icmp slt i64 %"87", -2147483648, !dbg !161
  br i1 %"93", label %main_bb34, label %main_wrap_around.exit, !dbg !161

main_bb34:                                        ; preds = %main_bb33
  %"94" = sub nsw i64 -2147483648, %"87", !dbg !162
  %"95" = sub nsw i64 %"94", 1, !dbg !162
  %"96" = srem i64 %"95", 4294967296, !dbg !162
  %"97" = sub nsw i64 2147483647, %"96", !dbg !162
  br label %main_wrap_around.exit, !dbg !162

main_bb35:                                        ; preds = %main_wrap_around.exit, %main_read_slice_1.exit, %main_bb20
  ret void, !dbg !163
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
!45 = metadata !{i64 -250}
!46 = metadata !{i32 786688, metadata !47, metadata !"num", metadata !5, i32 23, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [num] [line 23]
!47 = metadata !{i32 786443, metadata !1, metadata !9, i32 22, i32 21, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!48 = metadata !{i32 23, i32 15, metadata !47, null}
!49 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777224, metadata !8, i32 0, metadata !50} ; [ DW_TAG_arg_variable ] [value] [line 8]
!50 = metadata !{i32 31, i32 9, metadata !51, null}
!51 = metadata !{i32 786443, metadata !1, metadata !52, i32 31, i32 1, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!52 = metadata !{i32 786443, metadata !1, metadata !53, i32 30, i32 11, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!53 = metadata !{i32 786443, metadata !1, metadata !54, i32 29, i32 10, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!54 = metadata !{i32 786443, metadata !1, metadata !47, i32 24, i32 9, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!55 = metadata !{i32 8, i32 33, metadata !4, metadata !50} ; [ DW_TAG_imported_declaration ]
!56 = metadata !{i64 -2147483648}
!57 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554440, metadata !8, i32 0, metadata !50} ; [ DW_TAG_arg_variable ] [lower_bound] [line 8]
!58 = metadata !{i32 8, i32 50, metadata !4, metadata !50} ; [ DW_TAG_imported_declaration ]
!59 = metadata !{i64 2147483647}
!60 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331656, metadata !8, i32 0, metadata !50} ; [ DW_TAG_arg_variable ] [upper_bound] [line 8]
!61 = metadata !{i32 8, i32 73, metadata !4, metadata !50} ; [ DW_TAG_imported_declaration ]
!62 = metadata !{i64 4294967296}
!63 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 9, metadata !8, i32 0, metadata !50} ; [ DW_TAG_auto_variable ] [range] [line 9]
!64 = metadata !{i32 9, i32 15, metadata !4, metadata !50}
!65 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777224, metadata !8, i32 0, metadata !66} ; [ DW_TAG_arg_variable ] [value] [line 8]
!66 = metadata !{i32 33, i32 13, metadata !53, null}
!67 = metadata !{i32 8, i32 33, metadata !4, metadata !66} ; [ DW_TAG_imported_declaration ]
!68 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554440, metadata !8, i32 0, metadata !66} ; [ DW_TAG_arg_variable ] [lower_bound] [line 8]
!69 = metadata !{i32 8, i32 50, metadata !4, metadata !66} ; [ DW_TAG_imported_declaration ]
!70 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331656, metadata !8, i32 0, metadata !66} ; [ DW_TAG_arg_variable ] [upper_bound] [line 8]
!71 = metadata !{i32 8, i32 73, metadata !4, metadata !66} ; [ DW_TAG_imported_declaration ]
!72 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 9, metadata !8, i32 0, metadata !66} ; [ DW_TAG_auto_variable ] [range] [line 9]
!73 = metadata !{i32 9, i32 15, metadata !4, metadata !66}
!74 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777224, metadata !8, i32 0, metadata !75} ; [ DW_TAG_arg_variable ] [value] [line 8]
!75 = metadata !{i32 34, i32 16, metadata !53, null}
!76 = metadata !{i32 8, i32 33, metadata !4, metadata !75} ; [ DW_TAG_imported_declaration ]
!77 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554440, metadata !8, i32 0, metadata !75} ; [ DW_TAG_arg_variable ] [lower_bound] [line 8]
!78 = metadata !{i32 8, i32 50, metadata !4, metadata !75} ; [ DW_TAG_imported_declaration ]
!79 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331656, metadata !8, i32 0, metadata !75} ; [ DW_TAG_arg_variable ] [upper_bound] [line 8]
!80 = metadata !{i32 8, i32 73, metadata !4, metadata !75} ; [ DW_TAG_imported_declaration ]
!81 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 9, metadata !8, i32 0, metadata !75} ; [ DW_TAG_auto_variable ] [range] [line 9]
!82 = metadata !{i32 9, i32 15, metadata !4, metadata !75}
!83 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777224, metadata !8, i32 0, metadata !84} ; [ DW_TAG_arg_variable ] [value] [line 8]
!84 = metadata !{i32 36, i32 10, metadata !85, null}
!85 = metadata !{i32 786443, metadata !1, metadata !86, i32 36, i32 1, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!86 = metadata !{i32 786443, metadata !1, metadata !53, i32 35, i32 11, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!87 = metadata !{i32 8, i32 33, metadata !4, metadata !84} ; [ DW_TAG_imported_declaration ]
!88 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554440, metadata !8, i32 0, metadata !84} ; [ DW_TAG_arg_variable ] [lower_bound] [line 8]
!89 = metadata !{i32 8, i32 50, metadata !4, metadata !84} ; [ DW_TAG_imported_declaration ]
!90 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331656, metadata !8, i32 0, metadata !84} ; [ DW_TAG_arg_variable ] [upper_bound] [line 8]
!91 = metadata !{i32 8, i32 73, metadata !4, metadata !84} ; [ DW_TAG_imported_declaration ]
!92 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 9, metadata !8, i32 0, metadata !84} ; [ DW_TAG_auto_variable ] [range] [line 9]
!93 = metadata !{i32 9, i32 15, metadata !4, metadata !84}
!94 = metadata !{i32 22, i32 3, metadata !9, null}
!95 = metadata !{i32 22, i32 3, metadata !96, null}
!96 = metadata !{i32 786443, metadata !1, metadata !9, i32 22, i32 3, i32 1, i32 18} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!97 = metadata !{i32 24, i32 9, metadata !54, null}
!98 = metadata !{i32 30, i32 11, metadata !52, null}
!99 = metadata !{i32 10, i32 9, metadata !30, metadata !50}
!100 = metadata !{i32 11, i32 9, metadata !32, metadata !50}
!101 = metadata !{i32 13, i32 14, metadata !34, metadata !50}
!102 = metadata !{i32 14, i32 9, metadata !36, metadata !50}
!103 = metadata !{i32 10, i32 9, metadata !30, metadata !75}
!104 = metadata !{i32 11, i32 9, metadata !32, metadata !75}
!105 = metadata !{i32 13, i32 14, metadata !34, metadata !75}
!106 = metadata !{i32 14, i32 9, metadata !36, metadata !75}
!107 = metadata !{i32 35, i32 11, metadata !86, null}
!108 = metadata !{i32 10, i32 9, metadata !30, metadata !84}
!109 = metadata !{i32 11, i32 9, metadata !32, metadata !84}
!110 = metadata !{i32 13, i32 14, metadata !34, metadata !84}
!111 = metadata !{i32 14, i32 9, metadata !36, metadata !84}
!112 = metadata !{i32 46, i32 17, metadata !9, null}
!113 = metadata !{i64 6}
!114 = metadata !{i32 786688, metadata !12, metadata !"count", metadata !5, i32 52, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 52]
!115 = metadata !{i32 52, i32 13, metadata !12, null}
!116 = metadata !{i32 53, i32 7, metadata !117, null}
!117 = metadata !{i32 786443, metadata !1, metadata !12, i32 53, i32 7, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!118 = metadata !{i32 57, i32 3, metadata !119, null}
!119 = metadata !{i32 786443, metadata !1, metadata !12, i32 57, i32 3, i32 1, i32 19} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!120 = metadata !{i32 58, i32 11, metadata !121, null} ; [ DW_TAG_imported_module ]
!121 = metadata !{i32 786443, metadata !1, metadata !12, i32 57, i32 21, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!122 = metadata !{i32 22, i32 3, metadata !96, metadata !120}
!123 = metadata !{i32 34, i32 16, metadata !53, metadata !120}
!124 = metadata !{i32 10, i32 9, metadata !30, metadata !123}
!125 = metadata !{i32 11, i32 9, metadata !32, metadata !123}
!126 = metadata !{i32 13, i32 14, metadata !34, metadata !123}
!127 = metadata !{i32 14, i32 9, metadata !36, metadata !123}
!128 = metadata !{i32 36, i32 10, metadata !85, metadata !120}
!129 = metadata !{i32 10, i32 9, metadata !30, metadata !128}
!130 = metadata !{i32 11, i32 9, metadata !32, metadata !128}
!131 = metadata !{i32 13, i32 14, metadata !34, metadata !128}
!132 = metadata !{i32 14, i32 9, metadata !36, metadata !128}
!133 = metadata !{i32 786688, metadata !12, metadata !"ret", metadata !5, i32 51, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ret] [line 51]
!134 = metadata !{i32 51, i32 13, metadata !12, null}
!135 = metadata !{i32 59, i32 9, metadata !136, null}
!136 = metadata !{i32 786443, metadata !1, metadata !121, i32 59, i32 9, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!137 = metadata !{i32 63, i32 13, metadata !121, null}
!138 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777224, metadata !8, i32 0, metadata !137} ; [ DW_TAG_arg_variable ] [value] [line 8]
!139 = metadata !{i32 8, i32 33, metadata !4, metadata !137} ; [ DW_TAG_imported_declaration ]
!140 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554440, metadata !8, i32 0, metadata !137} ; [ DW_TAG_arg_variable ] [lower_bound] [line 8]
!141 = metadata !{i32 8, i32 50, metadata !4, metadata !137} ; [ DW_TAG_imported_declaration ]
!142 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331656, metadata !8, i32 0, metadata !137} ; [ DW_TAG_arg_variable ] [upper_bound] [line 8]
!143 = metadata !{i32 8, i32 73, metadata !4, metadata !137} ; [ DW_TAG_imported_declaration ]
!144 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 9, metadata !8, i32 0, metadata !137} ; [ DW_TAG_auto_variable ] [range] [line 9]
!145 = metadata !{i32 9, i32 15, metadata !4, metadata !137}
!146 = metadata !{i32 10, i32 9, metadata !30, metadata !137}
!147 = metadata !{i32 11, i32 9, metadata !32, metadata !137}
!148 = metadata !{i32 13, i32 14, metadata !34, metadata !137}
!149 = metadata !{i32 14, i32 9, metadata !36, metadata !137}
!150 = metadata !{i32 64, i32 11, metadata !121, null}
!151 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777224, metadata !8, i32 0, metadata !150} ; [ DW_TAG_arg_variable ] [value] [line 8]
!152 = metadata !{i32 8, i32 33, metadata !4, metadata !150} ; [ DW_TAG_imported_declaration ]
!153 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554440, metadata !8, i32 0, metadata !150} ; [ DW_TAG_arg_variable ] [lower_bound] [line 8]
!154 = metadata !{i32 8, i32 50, metadata !4, metadata !150} ; [ DW_TAG_imported_declaration ]
!155 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331656, metadata !8, i32 0, metadata !150} ; [ DW_TAG_arg_variable ] [upper_bound] [line 8]
!156 = metadata !{i32 8, i32 73, metadata !4, metadata !150} ; [ DW_TAG_imported_declaration ]
!157 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 9, metadata !8, i32 0, metadata !150} ; [ DW_TAG_auto_variable ] [range] [line 9]
!158 = metadata !{i32 9, i32 15, metadata !4, metadata !150}
!159 = metadata !{i32 10, i32 9, metadata !30, metadata !150}
!160 = metadata !{i32 11, i32 9, metadata !32, metadata !150}
!161 = metadata !{i32 13, i32 14, metadata !34, metadata !150}
!162 = metadata !{i32 14, i32 9, metadata !36, metadata !150}
!163 = metadata !{i32 66, i32 17, metadata !12, null}

