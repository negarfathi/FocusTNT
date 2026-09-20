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
  %"13" = icmp eq i64 10, 0, !dbg !97
  br i1 %"13", label %read_slice_1_bb19, label %read_slice_1_bb7, !dbg !97

read_slice_1_bb7:                                 ; preds = %read_slice_1_bb6
  %"14" = icmp slt i64 10, 0, !dbg !98
  br i1 %"14", label %read_slice_1_bb8, label %read_slice_1_wrap_around.exit, !dbg !98

read_slice_1_bb8:                                 ; preds = %read_slice_1_bb7
  %"15" = sub nsw i64 0, 10, !dbg !50
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
  %num.0 = phi i64 [ 10, %read_slice_1_bb7 ], [ %"20", %read_slice_1_bb9 ], [ %"25", %read_slice_1_bb11 ], [ %"15", %read_slice_1_bb10 ]
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
  call void @llvm.dbg.value(metadata !42, i64 0, metadata !113), !dbg !114
  call void @llvm.dbg.value(metadata !115, i64 0, metadata !116), !dbg !117
  store i64 0, i64* @"'flag", align 8, !dbg !118
  call void @llvm.dbg.value(metadata !42, i64 0, metadata !119), !dbg !120
  %"50" = icmp sle i64 -1, 0, !dbg !121
  %"51" = icmp sgt i64 -1, 65536, !dbg !123
  %or.cond = or i1 %"50", %"51", !dbg !121
  br i1 %or.cond, label %main_bb40, label %main_wrap_around.exit2, !dbg !121

main_wrap_around.exit2:                           ; preds = %main_bb20, %main_bb39, %main_bb38, %main_bb37, %main_wrap_around.exit4
  %__fc_errno_0.0 = phi i64 [ %.0.i3, %main_wrap_around.exit4 ], [ %__fc_errno_0.0, %main_bb37 ], [ %__fc_errno_0.0, %main_bb38 ], [ %__fc_errno_0.0, %main_bb39 ], [ 0, %main_bb20 ]
  %pos.0 = phi i64 [ %pos.0, %main_wrap_around.exit4 ], [ %"105", %main_bb37 ], [ %"110", %main_bb39 ], [ %"100", %main_bb38 ], [ 0, %main_bb20 ]
  %"52" = icmp slt i64 %pos.0, -1, !dbg !125
  br i1 %"52", label %main_bb21, label %main_bb40, !dbg !125

main_bb21:                                        ; preds = %main_wrap_around.exit2
  %"53" = sub nsw i64 -1, %pos.0, !dbg !127
  %"54" = icmp sgt i64 %"53", 2147483647, !dbg !129
  br i1 %"54", label %main_bb22, label %main_bb23, !dbg !129

main_bb22:                                        ; preds = %main_bb21
  %"55" = sub nsw i64 %"53", 2147483647, !dbg !130
  %"56" = sub nsw i64 %"55", 1, !dbg !130
  %"57" = srem i64 %"56", 4294967296, !dbg !130
  %"58" = add nsw i64 -2147483648, %"57", !dbg !130
  br label %main_wrap_around.exit, !dbg !130

main_bb23:                                        ; preds = %main_bb21
  %"59" = icmp slt i64 %"53", -2147483648, !dbg !131
  br i1 %"59", label %main_bb24, label %main_wrap_around.exit, !dbg !131

main_bb24:                                        ; preds = %main_bb23
  %"60" = sub nsw i64 -2147483648, %"53", !dbg !132
  %"61" = sub nsw i64 %"60", 1, !dbg !132
  %"62" = srem i64 %"61", 4294967296, !dbg !132
  %"63" = sub nsw i64 2147483647, %"62", !dbg !132
  br label %main_wrap_around.exit, !dbg !132

main_wrap_around.exit:                            ; preds = %main_bb22, %main_bb23, %main_bb24
  %.0.i = phi i64 [ %"58", %main_bb22 ], [ %"63", %main_bb24 ], [ %"53", %main_bb23 ], !dbg !127
  br label %main_wrap_around.exit2.i, !dbg !133

main_wrap_around.exit2.i:                         ; preds = %main_bb31, %main_bb30, %main_bb29, %main_wrap_around.exit
  %count.0.i = phi i64 [ 0, %main_wrap_around.exit ], [ %.0.i3.i, %main_bb29 ], [ %.0.i3.i, %main_bb30 ], [ %.0.i3.i, %main_bb31 ], !dbg !134
  %.0.i5 = phi i64 [ %pos.0, %main_wrap_around.exit ], [ %"81", %main_bb29 ], [ %"86", %main_bb31 ], [ %"76", %main_bb30 ], !dbg !134
  %"64" = icmp slt i64 %.0.i5, %.0.i, !dbg !135
  br i1 %"64", label %main_bb25, label %main_read_slice_1.exit, !dbg !135

main_bb25:                                        ; preds = %main_wrap_around.exit2.i
  %"65" = add nsw i64 %count.0.i, 1, !dbg !136
  %"66" = icmp sgt i64 %"65", 2147483647, !dbg !137
  br i1 %"66", label %main_bb26, label %main_bb27, !dbg !137

main_bb26:                                        ; preds = %main_bb25
  %"67" = sub nsw i64 %"65", 2147483647, !dbg !138
  %"68" = sub nsw i64 %"67", 1, !dbg !138
  %"69" = srem i64 %"68", 4294967296, !dbg !138
  %"70" = add nsw i64 -2147483648, %"69", !dbg !138
  br label %main_wrap_around.exit4.i, !dbg !138

main_bb27:                                        ; preds = %main_bb25
  %"71" = icmp slt i64 %"65", -2147483648, !dbg !139
  br i1 %"71", label %main_bb28, label %main_wrap_around.exit4.i, !dbg !139

main_bb28:                                        ; preds = %main_bb27
  %"72" = sub nsw i64 -2147483648, %"65", !dbg !140
  %"73" = sub nsw i64 %"72", 1, !dbg !140
  %"74" = srem i64 %"73", 4294967296, !dbg !140
  %"75" = sub nsw i64 2147483647, %"74", !dbg !140
  br label %main_wrap_around.exit4.i, !dbg !140

main_wrap_around.exit4.i:                         ; preds = %main_bb28, %main_bb27, %main_bb26
  %.0.i3.i = phi i64 [ %"70", %main_bb26 ], [ %"75", %main_bb28 ], [ %"65", %main_bb27 ], !dbg !136
  %"76" = add nsw i64 %.0.i5, 1, !dbg !141
  %"77" = icmp sgt i64 %"76", 2147483647, !dbg !142
  br i1 %"77", label %main_bb29, label %main_bb30, !dbg !142

main_bb29:                                        ; preds = %main_wrap_around.exit4.i
  %"78" = sub nsw i64 %"76", 2147483647, !dbg !143
  %"79" = sub nsw i64 %"78", 1, !dbg !143
  %"80" = srem i64 %"79", 4294967296, !dbg !143
  %"81" = add nsw i64 -2147483648, %"80", !dbg !143
  br label %main_wrap_around.exit2.i, !dbg !143

main_bb30:                                        ; preds = %main_wrap_around.exit4.i
  %"82" = icmp slt i64 %"76", -2147483648, !dbg !144
  br i1 %"82", label %main_bb31, label %main_wrap_around.exit2.i, !dbg !144

main_bb31:                                        ; preds = %main_bb30
  %"83" = sub nsw i64 -2147483648, %"76", !dbg !145
  %"84" = sub nsw i64 %"83", 1, !dbg !145
  %"85" = srem i64 %"84", 4294967296, !dbg !145
  %"86" = sub nsw i64 2147483647, %"85", !dbg !145
  br label %main_wrap_around.exit2.i, !dbg !145

main_read_slice_1.exit:                           ; preds = %main_wrap_around.exit2.i
  call void @llvm.dbg.value(metadata !{i64 %count.0.i}, i64 0, metadata !146), !dbg !147
  %"87" = icmp eq i64 %count.0.i, -1, !dbg !148
  br i1 %"87", label %main_bb32, label %main_bb36, !dbg !148

main_bb32:                                        ; preds = %main_read_slice_1.exit
  %"88" = add nsw i64 %__fc_errno_0.0, 1, !dbg !150
  call void @llvm.dbg.value(metadata !{i64 %"88"}, i64 0, metadata !152), !dbg !153
  call void @llvm.dbg.value(metadata !56, i64 0, metadata !154), !dbg !155
  call void @llvm.dbg.value(metadata !59, i64 0, metadata !156), !dbg !157
  call void @llvm.dbg.value(metadata !62, i64 0, metadata !158), !dbg !159
  %"89" = icmp sgt i64 %"88", 2147483647, !dbg !160
  br i1 %"89", label %main_bb33, label %main_bb34, !dbg !160

main_bb33:                                        ; preds = %main_bb32
  %"90" = sub nsw i64 %"88", 2147483647, !dbg !161
  %"91" = sub nsw i64 %"90", 1, !dbg !161
  %"92" = srem i64 %"91", 4294967296, !dbg !161
  %"93" = add nsw i64 -2147483648, %"92", !dbg !161
  br label %main_wrap_around.exit4, !dbg !161

main_bb34:                                        ; preds = %main_bb32
  %"94" = icmp slt i64 %"88", -2147483648, !dbg !162
  br i1 %"94", label %main_bb35, label %main_wrap_around.exit4, !dbg !162

main_bb35:                                        ; preds = %main_bb34
  %"95" = sub nsw i64 -2147483648, %"88", !dbg !163
  %"96" = sub nsw i64 %"95", 1, !dbg !163
  %"97" = srem i64 %"96", 4294967296, !dbg !163
  %"98" = sub nsw i64 2147483647, %"97", !dbg !163
  br label %main_wrap_around.exit4, !dbg !163

main_wrap_around.exit4:                           ; preds = %main_bb33, %main_bb34, %main_bb35
  %.0.i3 = phi i64 [ %"93", %main_bb33 ], [ %"98", %main_bb35 ], [ %"88", %main_bb34 ], !dbg !150
  call void @llvm.dbg.value(metadata !{i64 %.0.i3}, i64 0, metadata !119), !dbg !120
  %"99" = icmp eq i64 %.0.i3, 5, !dbg !164
  br i1 %"99", label %main_bb40, label %main_wrap_around.exit2, !dbg !164

main_bb36:                                        ; preds = %main_read_slice_1.exit
  %"100" = add nsw i64 %pos.0, %count.0.i, !dbg !166
  call void @llvm.dbg.value(metadata !{i64 %"100"}, i64 0, metadata !167), !dbg !168
  call void @llvm.dbg.value(metadata !56, i64 0, metadata !169), !dbg !170
  call void @llvm.dbg.value(metadata !59, i64 0, metadata !171), !dbg !172
  call void @llvm.dbg.value(metadata !62, i64 0, metadata !173), !dbg !174
  %"101" = icmp sgt i64 %"100", 2147483647, !dbg !175
  br i1 %"101", label %main_bb37, label %main_bb38, !dbg !175

main_bb37:                                        ; preds = %main_bb36
  %"102" = sub nsw i64 %"100", 2147483647, !dbg !176
  %"103" = sub nsw i64 %"102", 1, !dbg !176
  %"104" = srem i64 %"103", 4294967296, !dbg !176
  %"105" = add nsw i64 -2147483648, %"104", !dbg !176
  br label %main_wrap_around.exit2, !dbg !176

main_bb38:                                        ; preds = %main_bb36
  %"106" = icmp slt i64 %"100", -2147483648, !dbg !177
  br i1 %"106", label %main_bb39, label %main_wrap_around.exit2, !dbg !177

main_bb39:                                        ; preds = %main_bb38
  %"107" = sub nsw i64 -2147483648, %"100", !dbg !178
  %"108" = sub nsw i64 %"107", 1, !dbg !178
  %"109" = srem i64 %"108", 4294967296, !dbg !178
  %"110" = sub nsw i64 2147483647, %"109", !dbg !178
  br label %main_wrap_around.exit2, !dbg !178

main_bb40:                                        ; preds = %main_wrap_around.exit2, %main_wrap_around.exit4, %main_bb20
  ret void, !dbg !179
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
!45 = metadata !{i64 10}
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
!96 = metadata !{i32 786443, metadata !1, metadata !9, i32 22, i32 3, i32 1, i32 22} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
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
!113 = metadata !{i32 786688, metadata !12, metadata !"pos", metadata !5, i32 51, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pos] [line 51]
!114 = metadata !{i32 51, i32 13, metadata !12, null}
!115 = metadata !{i64 -1}
!116 = metadata !{i32 786688, metadata !12, metadata !"size", metadata !5, i32 52, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [size] [line 52]
!117 = metadata !{i32 52, i32 13, metadata !12, null}
!118 = metadata !{i32 53, i32 3, metadata !12, null}
!119 = metadata !{i32 786688, metadata !12, metadata !"__fc_errno_0", metadata !5, i32 54, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__fc_errno_0] [line 54]
!120 = metadata !{i32 54, i32 13, metadata !12, null}
!121 = metadata !{i32 55, i32 7, metadata !122, null}
!122 = metadata !{i32 786443, metadata !1, metadata !12, i32 55, i32 7, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!123 = metadata !{i32 59, i32 9, metadata !124, null}
!124 = metadata !{i32 786443, metadata !1, metadata !122, i32 59, i32 9, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!125 = metadata !{i32 62, i32 3, metadata !126, null}
!126 = metadata !{i32 786443, metadata !1, metadata !12, i32 62, i32 3, i32 1, i32 23} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!127 = metadata !{i32 63, i32 37, metadata !128, null}
!128 = metadata !{i32 786443, metadata !1, metadata !12, i32 62, i32 22, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!129 = metadata !{i32 10, i32 9, metadata !30, metadata !127}
!130 = metadata !{i32 11, i32 9, metadata !32, metadata !127}
!131 = metadata !{i32 13, i32 14, metadata !34, metadata !127}
!132 = metadata !{i32 14, i32 9, metadata !36, metadata !127}
!133 = metadata !{i32 22, i32 3, metadata !9, metadata !134}
!134 = metadata !{i32 63, i32 20, metadata !128, null}
!135 = metadata !{i32 22, i32 3, metadata !96, metadata !134}
!136 = metadata !{i32 34, i32 16, metadata !53, metadata !134}
!137 = metadata !{i32 10, i32 9, metadata !30, metadata !136}
!138 = metadata !{i32 11, i32 9, metadata !32, metadata !136}
!139 = metadata !{i32 13, i32 14, metadata !34, metadata !136}
!140 = metadata !{i32 14, i32 9, metadata !36, metadata !136}
!141 = metadata !{i32 36, i32 10, metadata !85, metadata !134}
!142 = metadata !{i32 10, i32 9, metadata !30, metadata !141}
!143 = metadata !{i32 11, i32 9, metadata !32, metadata !141}
!144 = metadata !{i32 13, i32 14, metadata !34, metadata !141}
!145 = metadata !{i32 14, i32 9, metadata !36, metadata !141}
!146 = metadata !{i32 786688, metadata !128, metadata !"rc", metadata !5, i32 63, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rc] [line 63]
!147 = metadata !{i32 63, i32 15, metadata !128, null}
!148 = metadata !{i32 64, i32 9, metadata !149, null}
!149 = metadata !{i32 786443, metadata !1, metadata !128, i32 64, i32 9, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!150 = metadata !{i32 65, i32 23, metadata !151, null}
!151 = metadata !{i32 786443, metadata !1, metadata !149, i32 64, i32 19, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!152 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777224, metadata !8, i32 0, metadata !150} ; [ DW_TAG_arg_variable ] [value] [line 8]
!153 = metadata !{i32 8, i32 33, metadata !4, metadata !150} ; [ DW_TAG_imported_declaration ]
!154 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554440, metadata !8, i32 0, metadata !150} ; [ DW_TAG_arg_variable ] [lower_bound] [line 8]
!155 = metadata !{i32 8, i32 50, metadata !4, metadata !150} ; [ DW_TAG_imported_declaration ]
!156 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331656, metadata !8, i32 0, metadata !150} ; [ DW_TAG_arg_variable ] [upper_bound] [line 8]
!157 = metadata !{i32 8, i32 73, metadata !4, metadata !150} ; [ DW_TAG_imported_declaration ]
!158 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 9, metadata !8, i32 0, metadata !150} ; [ DW_TAG_auto_variable ] [range] [line 9]
!159 = metadata !{i32 9, i32 15, metadata !4, metadata !150}
!160 = metadata !{i32 10, i32 9, metadata !30, metadata !150}
!161 = metadata !{i32 11, i32 9, metadata !32, metadata !150}
!162 = metadata !{i32 13, i32 14, metadata !34, metadata !150}
!163 = metadata !{i32 14, i32 9, metadata !36, metadata !150}
!164 = metadata !{i32 66, i32 11, metadata !165, null}
!165 = metadata !{i32 786443, metadata !1, metadata !151, i32 66, i32 11, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!166 = metadata !{i32 72, i32 11, metadata !128, null}
!167 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777224, metadata !8, i32 0, metadata !166} ; [ DW_TAG_arg_variable ] [value] [line 8]
!168 = metadata !{i32 8, i32 33, metadata !4, metadata !166} ; [ DW_TAG_imported_declaration ]
!169 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554440, metadata !8, i32 0, metadata !166} ; [ DW_TAG_arg_variable ] [lower_bound] [line 8]
!170 = metadata !{i32 8, i32 50, metadata !4, metadata !166} ; [ DW_TAG_imported_declaration ]
!171 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331656, metadata !8, i32 0, metadata !166} ; [ DW_TAG_arg_variable ] [upper_bound] [line 8]
!172 = metadata !{i32 8, i32 73, metadata !4, metadata !166} ; [ DW_TAG_imported_declaration ]
!173 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 9, metadata !8, i32 0, metadata !166} ; [ DW_TAG_auto_variable ] [range] [line 9]
!174 = metadata !{i32 9, i32 15, metadata !4, metadata !166}
!175 = metadata !{i32 10, i32 9, metadata !30, metadata !166}
!176 = metadata !{i32 11, i32 9, metadata !32, metadata !166}
!177 = metadata !{i32 13, i32 14, metadata !34, metadata !166}
!178 = metadata !{i32 14, i32 9, metadata !36, metadata !166}
!179 = metadata !{i32 74, i32 17, metadata !12, null}

