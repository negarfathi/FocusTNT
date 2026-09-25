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
  call void @llvm.dbg.value(metadata !{i64 %"13"}, i64 0, metadata !45), !dbg !47
  call void @llvm.dbg.value(metadata !{i64 %"16"}, i64 0, metadata !48), !dbg !54
  call void @llvm.dbg.value(metadata !55, i64 0, metadata !56), !dbg !57
  call void @llvm.dbg.value(metadata !58, i64 0, metadata !59), !dbg !60
  call void @llvm.dbg.value(metadata !61, i64 0, metadata !62), !dbg !63
  call void @llvm.dbg.value(metadata !{i64 %"27"}, i64 0, metadata !64), !dbg !66
  call void @llvm.dbg.value(metadata !55, i64 0, metadata !67), !dbg !68
  call void @llvm.dbg.value(metadata !58, i64 0, metadata !69), !dbg !70
  call void @llvm.dbg.value(metadata !61, i64 0, metadata !71), !dbg !72
  call void @llvm.dbg.value(metadata !{i64 %"27"}, i64 0, metadata !45), !dbg !47
  call void @llvm.dbg.value(metadata !{i64 %"28"}, i64 0, metadata !73), !dbg !75
  call void @llvm.dbg.value(metadata !55, i64 0, metadata !76), !dbg !77
  call void @llvm.dbg.value(metadata !58, i64 0, metadata !78), !dbg !79
  call void @llvm.dbg.value(metadata !61, i64 0, metadata !80), !dbg !81
  call void @llvm.dbg.value(metadata !{i64 %.0.i3}, i64 0, metadata !43), !dbg !44
  call void @llvm.dbg.value(metadata !{i64 %"40"}, i64 0, metadata !82), !dbg !86
  call void @llvm.dbg.value(metadata !55, i64 0, metadata !87), !dbg !88
  call void @llvm.dbg.value(metadata !58, i64 0, metadata !89), !dbg !90
  call void @llvm.dbg.value(metadata !61, i64 0, metadata !91), !dbg !92
  br label %read_slice_1_wrap_around.exit2, !dbg !93

read_slice_1_wrap_around.exit2:                   ; preds = %read_slice_1_bb18, %read_slice_1_bb17, %read_slice_1_bb16, %read_slice_1_bb5
  %count.0 = phi i64 [ 0, %read_slice_1_bb5 ], [ %.0.i3, %read_slice_1_bb16 ], [ %.0.i3, %read_slice_1_bb17 ], [ %.0.i3, %read_slice_1_bb18 ]
  %.0 = phi i64 [ %loc, %read_slice_1_bb5 ], [ %"45", %read_slice_1_bb16 ], [ %"50", %read_slice_1_bb18 ], [ %"40", %read_slice_1_bb17 ]
  %"12" = icmp slt i64 %.0, %len, !dbg !94
  br i1 %"12", label %read_slice_1_bb6, label %read_slice_1_bb19, !dbg !94

read_slice_1_bb6:                                 ; preds = %read_slice_1_wrap_around.exit2
  %"13" = call i64 @__VERIFIER_nondet_int(), !dbg !96
  %"14" = icmp eq i64 %"13", 0, !dbg !97
  br i1 %"14", label %read_slice_1_bb19, label %read_slice_1_bb7, !dbg !97

read_slice_1_bb7:                                 ; preds = %read_slice_1_bb6
  %"15" = icmp slt i64 %"13", 0, !dbg !98
  br i1 %"15", label %read_slice_1_bb8, label %read_slice_1_wrap_around.exit, !dbg !98

read_slice_1_bb8:                                 ; preds = %read_slice_1_bb7
  %"16" = sub nsw i64 0, %"13", !dbg !49
  %"17" = icmp sgt i64 %"16", 2147483647, !dbg !99
  br i1 %"17", label %read_slice_1_bb9, label %read_slice_1_bb10, !dbg !99

read_slice_1_bb9:                                 ; preds = %read_slice_1_bb8
  %"18" = sub nsw i64 %"16", 2147483647, !dbg !100
  %"19" = sub nsw i64 %"18", 1, !dbg !100
  %"20" = srem i64 %"19", 4294967296, !dbg !100
  %"21" = add nsw i64 -2147483648, %"20", !dbg !100
  br label %read_slice_1_wrap_around.exit, !dbg !100

read_slice_1_bb10:                                ; preds = %read_slice_1_bb8
  %"22" = icmp slt i64 %"16", -2147483648, !dbg !101
  br i1 %"22", label %read_slice_1_bb11, label %read_slice_1_wrap_around.exit, !dbg !101

read_slice_1_bb11:                                ; preds = %read_slice_1_bb10
  %"23" = sub nsw i64 -2147483648, %"16", !dbg !102
  %"24" = sub nsw i64 %"23", 1, !dbg !102
  %"25" = srem i64 %"24", 4294967296, !dbg !102
  %"26" = sub nsw i64 2147483647, %"25", !dbg !102
  br label %read_slice_1_wrap_around.exit, !dbg !102

read_slice_1_wrap_around.exit:                    ; preds = %read_slice_1_bb11, %read_slice_1_bb10, %read_slice_1_bb9, %read_slice_1_bb7
  %num.0 = phi i64 [ %"13", %read_slice_1_bb7 ], [ %"21", %read_slice_1_bb9 ], [ %"26", %read_slice_1_bb11 ], [ %"16", %read_slice_1_bb10 ]
  %"27" = srem i64 %num.0, 1000, !dbg !65
  %"28" = add nsw i64 %count.0, 1, !dbg !74
  %"29" = icmp sgt i64 %"28", 2147483647, !dbg !103
  br i1 %"29", label %read_slice_1_bb12, label %read_slice_1_bb13, !dbg !103

read_slice_1_bb12:                                ; preds = %read_slice_1_wrap_around.exit
  %"30" = sub nsw i64 %"28", 2147483647, !dbg !104
  %"31" = sub nsw i64 %"30", 1, !dbg !104
  %"32" = srem i64 %"31", 4294967296, !dbg !104
  %"33" = add nsw i64 -2147483648, %"32", !dbg !104
  br label %read_slice_1_wrap_around.exit4, !dbg !104

read_slice_1_bb13:                                ; preds = %read_slice_1_wrap_around.exit
  %"34" = icmp slt i64 %"28", -2147483648, !dbg !105
  br i1 %"34", label %read_slice_1_bb14, label %read_slice_1_wrap_around.exit4, !dbg !105

read_slice_1_bb14:                                ; preds = %read_slice_1_bb13
  %"35" = sub nsw i64 -2147483648, %"28", !dbg !106
  %"36" = sub nsw i64 %"35", 1, !dbg !106
  %"37" = srem i64 %"36", 4294967296, !dbg !106
  %"38" = sub nsw i64 2147483647, %"37", !dbg !106
  br label %read_slice_1_wrap_around.exit4, !dbg !106

read_slice_1_wrap_around.exit4:                   ; preds = %read_slice_1_bb12, %read_slice_1_bb13, %read_slice_1_bb14
  %.0.i3 = phi i64 [ %"33", %read_slice_1_bb12 ], [ %"38", %read_slice_1_bb14 ], [ %"28", %read_slice_1_bb13 ], !dbg !74
  %"39" = icmp slt i64 %"27", 995, !dbg !107
  br i1 %"39", label %read_slice_1_bb15, label %read_slice_1_bb19, !dbg !107

read_slice_1_bb15:                                ; preds = %read_slice_1_wrap_around.exit4
  %"40" = add nsw i64 %.0, 1, !dbg !83
  %"41" = icmp sgt i64 %"40", 2147483647, !dbg !108
  br i1 %"41", label %read_slice_1_bb16, label %read_slice_1_bb17, !dbg !108

read_slice_1_bb16:                                ; preds = %read_slice_1_bb15
  %"42" = sub nsw i64 %"40", 2147483647, !dbg !109
  %"43" = sub nsw i64 %"42", 1, !dbg !109
  %"44" = srem i64 %"43", 4294967296, !dbg !109
  %"45" = add nsw i64 -2147483648, %"44", !dbg !109
  br label %read_slice_1_wrap_around.exit2, !dbg !109

read_slice_1_bb17:                                ; preds = %read_slice_1_bb15
  %"46" = icmp slt i64 %"40", -2147483648, !dbg !110
  br i1 %"46", label %read_slice_1_bb18, label %read_slice_1_wrap_around.exit2, !dbg !110

read_slice_1_bb18:                                ; preds = %read_slice_1_bb17
  %"47" = sub nsw i64 -2147483648, %"40", !dbg !111
  %"48" = sub nsw i64 %"47", 1, !dbg !111
  %"49" = srem i64 %"48", 4294967296, !dbg !111
  %"50" = sub nsw i64 2147483647, %"49", !dbg !111
  br label %read_slice_1_wrap_around.exit2, !dbg !111

read_slice_1_bb19:                                ; preds = %read_slice_1_wrap_around.exit2, %read_slice_1_wrap_around.exit4, %read_slice_1_bb6
  %__retres.0 = phi i64 [ -1, %read_slice_1_bb6 ], [ %.0.i3, %read_slice_1_wrap_around.exit4 ], [ %count.0, %read_slice_1_wrap_around.exit2 ]
  ret i64 %__retres.0, !dbg !112
}

declare i64 @__VERIFIER_nondet_int() #2

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb20:
  %"51" = call i64 @__VERIFIER_nondet_int(), !dbg !113
  call void @llvm.dbg.value(metadata !{i64 %"51"}, i64 0, metadata !114), !dbg !115
  %"52" = icmp sle i64 %"51", 0, !dbg !116
  br i1 %"52", label %main_bb46, label %main_wrap_around.exit3, !dbg !116

main_wrap_around.exit3:                           ; preds = %main_bb45, %main_bb44, %main_bb43, %main_wrap_around.exit, %main_bb20
  %tries.0 = phi i64 [ 0, %main_bb20 ], [ %.0.i1, %main_wrap_around.exit ], [ %tries.0, %main_bb43 ], [ %tries.0, %main_bb44 ], [ %tries.0, %main_bb45 ]
  %buf.0 = phi i64 [ 0, %main_bb20 ], [ %buf.0, %main_wrap_around.exit ], [ %"123", %main_bb43 ], [ %"128", %main_bb45 ], [ %"118", %main_bb44 ]
  %count.0 = phi i64 [ %"51", %main_bb20 ], [ %count.0, %main_wrap_around.exit ], [ %.0.i4, %main_bb43 ], [ %.0.i4, %main_bb44 ], [ %.0.i4, %main_bb45 ]
  %"53" = icmp sgt i64 %count.0, 0, !dbg !118
  br i1 %"53", label %main_wrap_around.exit2.i, label %main_bb46, !dbg !118

main_wrap_around.exit2.i:                         ; preds = %main_wrap_around.exit3, %main_bb33, %main_bb32, %main_bb31
  %count.0.i = phi i64 [ %.0.i3.i, %main_bb31 ], [ %.0.i3.i, %main_bb32 ], [ %.0.i3.i, %main_bb33 ], [ 0, %main_wrap_around.exit3 ], !dbg !120
  %.0.i = phi i64 [ %"87", %main_bb31 ], [ %"92", %main_bb33 ], [ %"82", %main_bb32 ], [ %buf.0, %main_wrap_around.exit3 ], !dbg !120
  %"54" = icmp slt i64 %.0.i, %count.0, !dbg !122
  br i1 %"54", label %main_bb21, label %main_read_slice_1.exit, !dbg !122

main_bb21:                                        ; preds = %main_wrap_around.exit2.i
  %"55" = call i64 @__VERIFIER_nondet_int() #3, !dbg !123
  %"56" = icmp eq i64 %"55", 0, !dbg !124
  br i1 %"56", label %main_read_slice_1.exit, label %main_bb22, !dbg !124

main_bb22:                                        ; preds = %main_bb21
  %"57" = icmp slt i64 %"55", 0, !dbg !125
  br i1 %"57", label %main_bb23, label %main_wrap_around.exit.i, !dbg !125

main_bb23:                                        ; preds = %main_bb22
  %"58" = sub nsw i64 0, %"55", !dbg !126
  %"59" = icmp sgt i64 %"58", 2147483647, !dbg !127
  br i1 %"59", label %main_bb24, label %main_bb25, !dbg !127

main_bb24:                                        ; preds = %main_bb23
  %"60" = sub nsw i64 %"58", 2147483647, !dbg !128
  %"61" = sub nsw i64 %"60", 1, !dbg !128
  %"62" = srem i64 %"61", 4294967296, !dbg !128
  %"63" = add nsw i64 -2147483648, %"62", !dbg !128
  br label %main_wrap_around.exit.i, !dbg !128

main_bb25:                                        ; preds = %main_bb23
  %"64" = icmp slt i64 %"58", -2147483648, !dbg !129
  br i1 %"64", label %main_bb26, label %main_wrap_around.exit.i, !dbg !129

main_bb26:                                        ; preds = %main_bb25
  %"65" = sub nsw i64 -2147483648, %"58", !dbg !130
  %"66" = sub nsw i64 %"65", 1, !dbg !130
  %"67" = srem i64 %"66", 4294967296, !dbg !130
  %"68" = sub nsw i64 2147483647, %"67", !dbg !130
  br label %main_wrap_around.exit.i, !dbg !130

main_wrap_around.exit.i:                          ; preds = %main_bb26, %main_bb25, %main_bb24, %main_bb22
  %num.0.i = phi i64 [ %"55", %main_bb22 ], [ %"63", %main_bb24 ], [ %"68", %main_bb26 ], [ %"58", %main_bb25 ], !dbg !120
  %"69" = srem i64 %num.0.i, 1000, !dbg !131
  %"70" = add nsw i64 %count.0.i, 1, !dbg !132
  %"71" = icmp sgt i64 %"70", 2147483647, !dbg !133
  br i1 %"71", label %main_bb27, label %main_bb28, !dbg !133

main_bb27:                                        ; preds = %main_wrap_around.exit.i
  %"72" = sub nsw i64 %"70", 2147483647, !dbg !134
  %"73" = sub nsw i64 %"72", 1, !dbg !134
  %"74" = srem i64 %"73", 4294967296, !dbg !134
  %"75" = add nsw i64 -2147483648, %"74", !dbg !134
  br label %main_wrap_around.exit4.i, !dbg !134

main_bb28:                                        ; preds = %main_wrap_around.exit.i
  %"76" = icmp slt i64 %"70", -2147483648, !dbg !135
  br i1 %"76", label %main_bb29, label %main_wrap_around.exit4.i, !dbg !135

main_bb29:                                        ; preds = %main_bb28
  %"77" = sub nsw i64 -2147483648, %"70", !dbg !136
  %"78" = sub nsw i64 %"77", 1, !dbg !136
  %"79" = srem i64 %"78", 4294967296, !dbg !136
  %"80" = sub nsw i64 2147483647, %"79", !dbg !136
  br label %main_wrap_around.exit4.i, !dbg !136

main_wrap_around.exit4.i:                         ; preds = %main_bb29, %main_bb28, %main_bb27
  %.0.i3.i = phi i64 [ %"75", %main_bb27 ], [ %"80", %main_bb29 ], [ %"70", %main_bb28 ], !dbg !132
  %"81" = icmp slt i64 %"69", 995, !dbg !137
  br i1 %"81", label %main_bb30, label %main_read_slice_1.exit, !dbg !137

main_bb30:                                        ; preds = %main_wrap_around.exit4.i
  %"82" = add nsw i64 %.0.i, 1, !dbg !138
  %"83" = icmp sgt i64 %"82", 2147483647, !dbg !139
  br i1 %"83", label %main_bb31, label %main_bb32, !dbg !139

main_bb31:                                        ; preds = %main_bb30
  %"84" = sub nsw i64 %"82", 2147483647, !dbg !140
  %"85" = sub nsw i64 %"84", 1, !dbg !140
  %"86" = srem i64 %"85", 4294967296, !dbg !140
  %"87" = add nsw i64 -2147483648, %"86", !dbg !140
  br label %main_wrap_around.exit2.i, !dbg !140

main_bb32:                                        ; preds = %main_bb30
  %"88" = icmp slt i64 %"82", -2147483648, !dbg !141
  br i1 %"88", label %main_bb33, label %main_wrap_around.exit2.i, !dbg !141

main_bb33:                                        ; preds = %main_bb32
  %"89" = sub nsw i64 -2147483648, %"82", !dbg !142
  %"90" = sub nsw i64 %"89", 1, !dbg !142
  %"91" = srem i64 %"90", 4294967296, !dbg !142
  %"92" = sub nsw i64 2147483647, %"91", !dbg !142
  br label %main_wrap_around.exit2.i, !dbg !142

main_read_slice_1.exit:                           ; preds = %main_wrap_around.exit2.i, %main_bb21, %main_wrap_around.exit4.i
  %__retres.0.i = phi i64 [ -1, %main_bb21 ], [ %.0.i3.i, %main_wrap_around.exit4.i ], [ %count.0.i, %main_wrap_around.exit2.i ], !dbg !120
  call void @llvm.dbg.value(metadata !{i64 %__retres.0.i}, i64 0, metadata !143), !dbg !144
  %"93" = icmp sle i64 %__retres.0.i, 0, !dbg !145
  br i1 %"93", label %main_bb34, label %main_bb39, !dbg !145

main_bb34:                                        ; preds = %main_read_slice_1.exit
  %"94" = icmp eq i64 %__retres.0.i, 0, !dbg !147
  br i1 %"94", label %main_bb35, label %main_bb46, !dbg !147

main_bb35:                                        ; preds = %main_bb34
  call void @llvm.dbg.value(metadata !{i64 %tries.0}, i64 0, metadata !150), !dbg !152
  %"95" = add nsw i64 %tries.0, 1, !dbg !153
  call void @llvm.dbg.value(metadata !{i64 %"95"}, i64 0, metadata !154), !dbg !155
  call void @llvm.dbg.value(metadata !55, i64 0, metadata !156), !dbg !157
  call void @llvm.dbg.value(metadata !58, i64 0, metadata !158), !dbg !159
  call void @llvm.dbg.value(metadata !61, i64 0, metadata !160), !dbg !161
  %"96" = icmp sgt i64 %"95", 2147483647, !dbg !162
  br i1 %"96", label %main_bb36, label %main_bb37, !dbg !162

main_bb36:                                        ; preds = %main_bb35
  %"97" = sub nsw i64 %"95", 2147483647, !dbg !163
  %"98" = sub nsw i64 %"97", 1, !dbg !163
  %"99" = srem i64 %"98", 4294967296, !dbg !163
  %"100" = add nsw i64 -2147483648, %"99", !dbg !163
  br label %main_wrap_around.exit, !dbg !163

main_bb37:                                        ; preds = %main_bb35
  %"101" = icmp slt i64 %"95", -2147483648, !dbg !164
  br i1 %"101", label %main_bb38, label %main_wrap_around.exit, !dbg !164

main_bb38:                                        ; preds = %main_bb37
  %"102" = sub nsw i64 -2147483648, %"95", !dbg !165
  %"103" = sub nsw i64 %"102", 1, !dbg !165
  %"104" = srem i64 %"103", 4294967296, !dbg !165
  %"105" = sub nsw i64 2147483647, %"104", !dbg !165
  br label %main_wrap_around.exit, !dbg !165

main_wrap_around.exit:                            ; preds = %main_bb36, %main_bb37, %main_bb38
  %.0.i1 = phi i64 [ %"100", %main_bb36 ], [ %"105", %main_bb38 ], [ %"95", %main_bb37 ], !dbg !153
  call void @llvm.dbg.value(metadata !{i64 %.0.i1}, i64 0, metadata !166), !dbg !167
  %"106" = icmp slt i64 %tries.0, 5, !dbg !168
  br i1 %"106", label %main_wrap_around.exit3, label %main_bb46, !dbg !168

main_bb39:                                        ; preds = %main_read_slice_1.exit
  %"107" = sub nsw i64 %count.0, %__retres.0.i, !dbg !170
  call void @llvm.dbg.value(metadata !{i64 %"107"}, i64 0, metadata !171), !dbg !172
  call void @llvm.dbg.value(metadata !55, i64 0, metadata !173), !dbg !174
  call void @llvm.dbg.value(metadata !58, i64 0, metadata !175), !dbg !176
  call void @llvm.dbg.value(metadata !61, i64 0, metadata !177), !dbg !178
  %"108" = icmp sgt i64 %"107", 2147483647, !dbg !179
  br i1 %"108", label %main_bb40, label %main_bb41, !dbg !179

main_bb40:                                        ; preds = %main_bb39
  %"109" = sub nsw i64 %"107", 2147483647, !dbg !180
  %"110" = sub nsw i64 %"109", 1, !dbg !180
  %"111" = srem i64 %"110", 4294967296, !dbg !180
  %"112" = add nsw i64 -2147483648, %"111", !dbg !180
  br label %main_wrap_around.exit5, !dbg !180

main_bb41:                                        ; preds = %main_bb39
  %"113" = icmp slt i64 %"107", -2147483648, !dbg !181
  br i1 %"113", label %main_bb42, label %main_wrap_around.exit5, !dbg !181

main_bb42:                                        ; preds = %main_bb41
  %"114" = sub nsw i64 -2147483648, %"107", !dbg !182
  %"115" = sub nsw i64 %"114", 1, !dbg !182
  %"116" = srem i64 %"115", 4294967296, !dbg !182
  %"117" = sub nsw i64 2147483647, %"116", !dbg !182
  br label %main_wrap_around.exit5, !dbg !182

main_wrap_around.exit5:                           ; preds = %main_bb40, %main_bb41, %main_bb42
  %.0.i4 = phi i64 [ %"112", %main_bb40 ], [ %"117", %main_bb42 ], [ %"107", %main_bb41 ], !dbg !170
  call void @llvm.dbg.value(metadata !{i64 %.0.i4}, i64 0, metadata !114), !dbg !115
  %"118" = add nsw i64 %buf.0, %__retres.0.i, !dbg !183
  call void @llvm.dbg.value(metadata !{i64 %"118"}, i64 0, metadata !184), !dbg !185
  call void @llvm.dbg.value(metadata !55, i64 0, metadata !186), !dbg !187
  call void @llvm.dbg.value(metadata !58, i64 0, metadata !188), !dbg !189
  call void @llvm.dbg.value(metadata !61, i64 0, metadata !190), !dbg !191
  %"119" = icmp sgt i64 %"118", 2147483647, !dbg !192
  br i1 %"119", label %main_bb43, label %main_bb44, !dbg !192

main_bb43:                                        ; preds = %main_wrap_around.exit5
  %"120" = sub nsw i64 %"118", 2147483647, !dbg !193
  %"121" = sub nsw i64 %"120", 1, !dbg !193
  %"122" = srem i64 %"121", 4294967296, !dbg !193
  %"123" = add nsw i64 -2147483648, %"122", !dbg !193
  br label %main_wrap_around.exit3, !dbg !193

main_bb44:                                        ; preds = %main_wrap_around.exit5
  %"124" = icmp slt i64 %"118", -2147483648, !dbg !194
  br i1 %"124", label %main_bb45, label %main_wrap_around.exit3, !dbg !194

main_bb45:                                        ; preds = %main_bb44
  %"125" = sub nsw i64 -2147483648, %"118", !dbg !195
  %"126" = sub nsw i64 %"125", 1, !dbg !195
  %"127" = srem i64 %"126", 4294967296, !dbg !195
  %"128" = sub nsw i64 2147483647, %"127", !dbg !195
  br label %main_wrap_around.exit3, !dbg !195

main_bb46:                                        ; preds = %main_wrap_around.exit3, %main_bb34, %main_wrap_around.exit, %main_bb20
  ret void, !dbg !196
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
!96 = metadata !{i32 23, i32 21, metadata !46, null}
!97 = metadata !{i32 24, i32 9, metadata !53, null}
!98 = metadata !{i32 30, i32 11, metadata !51, null}
!99 = metadata !{i32 10, i32 9, metadata !30, metadata !49}
!100 = metadata !{i32 11, i32 9, metadata !32, metadata !49}
!101 = metadata !{i32 13, i32 14, metadata !34, metadata !49}
!102 = metadata !{i32 14, i32 9, metadata !36, metadata !49}
!103 = metadata !{i32 10, i32 9, metadata !30, metadata !74}
!104 = metadata !{i32 11, i32 9, metadata !32, metadata !74}
!105 = metadata !{i32 13, i32 14, metadata !34, metadata !74}
!106 = metadata !{i32 14, i32 9, metadata !36, metadata !74}
!107 = metadata !{i32 35, i32 11, metadata !85, null}
!108 = metadata !{i32 10, i32 9, metadata !30, metadata !83}
!109 = metadata !{i32 11, i32 9, metadata !32, metadata !83}
!110 = metadata !{i32 13, i32 14, metadata !34, metadata !83}
!111 = metadata !{i32 14, i32 9, metadata !36, metadata !83}
!112 = metadata !{i32 46, i32 17, metadata !9, null}
!113 = metadata !{i32 52, i32 21, metadata !12, null}
!114 = metadata !{i32 786688, metadata !12, metadata !"count", metadata !5, i32 52, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 52]
!115 = metadata !{i32 52, i32 13, metadata !12, null}
!116 = metadata !{i32 53, i32 7, metadata !117, null}
!117 = metadata !{i32 786443, metadata !1, metadata !12, i32 53, i32 7, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!118 = metadata !{i32 58, i32 3, metadata !119, null} ; [ DW_TAG_imported_module ]
!119 = metadata !{i32 786443, metadata !1, metadata !12, i32 58, i32 3, i32 1, i32 23} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!120 = metadata !{i32 59, i32 11, metadata !121, null}
!121 = metadata !{i32 786443, metadata !1, metadata !12, i32 58, i32 21, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!122 = metadata !{i32 22, i32 3, metadata !95, metadata !120}
!123 = metadata !{i32 23, i32 21, metadata !46, metadata !120}
!124 = metadata !{i32 24, i32 9, metadata !53, metadata !120}
!125 = metadata !{i32 30, i32 11, metadata !51, metadata !120}
!126 = metadata !{i32 31, i32 9, metadata !50, metadata !120}
!127 = metadata !{i32 10, i32 9, metadata !30, metadata !126}
!128 = metadata !{i32 11, i32 9, metadata !32, metadata !126}
!129 = metadata !{i32 13, i32 14, metadata !34, metadata !126}
!130 = metadata !{i32 14, i32 9, metadata !36, metadata !126}
!131 = metadata !{i32 33, i32 13, metadata !52, metadata !120}
!132 = metadata !{i32 34, i32 16, metadata !52, metadata !120}
!133 = metadata !{i32 10, i32 9, metadata !30, metadata !132}
!134 = metadata !{i32 11, i32 9, metadata !32, metadata !132}
!135 = metadata !{i32 13, i32 14, metadata !34, metadata !132}
!136 = metadata !{i32 14, i32 9, metadata !36, metadata !132}
!137 = metadata !{i32 35, i32 11, metadata !85, metadata !120}
!138 = metadata !{i32 36, i32 10, metadata !84, metadata !120}
!139 = metadata !{i32 10, i32 9, metadata !30, metadata !138}
!140 = metadata !{i32 11, i32 9, metadata !32, metadata !138}
!141 = metadata !{i32 13, i32 14, metadata !34, metadata !138}
!142 = metadata !{i32 14, i32 9, metadata !36, metadata !138}
!143 = metadata !{i32 786688, metadata !12, metadata !"ret", metadata !5, i32 51, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ret] [line 51]
!144 = metadata !{i32 51, i32 13, metadata !12, null}
!145 = metadata !{i32 60, i32 9, metadata !146, null}
!146 = metadata !{i32 786443, metadata !1, metadata !121, i32 60, i32 9, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!147 = metadata !{i32 61, i32 11, metadata !148, null}
!148 = metadata !{i32 786443, metadata !1, metadata !149, i32 61, i32 11, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!149 = metadata !{i32 786443, metadata !1, metadata !146, i32 60, i32 19, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!150 = metadata !{i32 786688, metadata !151, metadata !"tmp_0", metadata !5, i32 62, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmp_0] [line 62]
!151 = metadata !{i32 786443, metadata !1, metadata !148, i32 61, i32 21, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!152 = metadata !{i32 62, i32 19, metadata !151, null}
!153 = metadata !{i32 64, i32 18, metadata !151, null}
!154 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777224, metadata !8, i32 0, metadata !153} ; [ DW_TAG_arg_variable ] [value] [line 8]
!155 = metadata !{i32 8, i32 33, metadata !4, metadata !153} ; [ DW_TAG_imported_declaration ]
!156 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554440, metadata !8, i32 0, metadata !153} ; [ DW_TAG_arg_variable ] [lower_bound] [line 8]
!157 = metadata !{i32 8, i32 50, metadata !4, metadata !153} ; [ DW_TAG_imported_declaration ]
!158 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331656, metadata !8, i32 0, metadata !153} ; [ DW_TAG_arg_variable ] [upper_bound] [line 8]
!159 = metadata !{i32 8, i32 73, metadata !4, metadata !153} ; [ DW_TAG_imported_declaration ]
!160 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 9, metadata !8, i32 0, metadata !153} ; [ DW_TAG_auto_variable ] [range] [line 9]
!161 = metadata !{i32 9, i32 15, metadata !4, metadata !153}
!162 = metadata !{i32 10, i32 9, metadata !30, metadata !153}
!163 = metadata !{i32 11, i32 9, metadata !32, metadata !153}
!164 = metadata !{i32 13, i32 14, metadata !34, metadata !153}
!165 = metadata !{i32 14, i32 9, metadata !36, metadata !153}
!166 = metadata !{i32 786688, metadata !12, metadata !"tries", metadata !5, i32 57, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tries] [line 57]
!167 = metadata !{i32 57, i32 13, metadata !12, null}
!168 = metadata !{i32 65, i32 13, metadata !169, null}
!169 = metadata !{i32 786443, metadata !1, metadata !151, i32 65, i32 13, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!170 = metadata !{i32 72, i32 13, metadata !121, null}
!171 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777224, metadata !8, i32 0, metadata !170} ; [ DW_TAG_arg_variable ] [value] [line 8]
!172 = metadata !{i32 8, i32 33, metadata !4, metadata !170} ; [ DW_TAG_imported_declaration ]
!173 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554440, metadata !8, i32 0, metadata !170} ; [ DW_TAG_arg_variable ] [lower_bound] [line 8]
!174 = metadata !{i32 8, i32 50, metadata !4, metadata !170} ; [ DW_TAG_imported_declaration ]
!175 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331656, metadata !8, i32 0, metadata !170} ; [ DW_TAG_arg_variable ] [upper_bound] [line 8]
!176 = metadata !{i32 8, i32 73, metadata !4, metadata !170} ; [ DW_TAG_imported_declaration ]
!177 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 9, metadata !8, i32 0, metadata !170} ; [ DW_TAG_auto_variable ] [range] [line 9]
!178 = metadata !{i32 9, i32 15, metadata !4, metadata !170}
!179 = metadata !{i32 10, i32 9, metadata !30, metadata !170}
!180 = metadata !{i32 11, i32 9, metadata !32, metadata !170}
!181 = metadata !{i32 13, i32 14, metadata !34, metadata !170}
!182 = metadata !{i32 14, i32 9, metadata !36, metadata !170}
!183 = metadata !{i32 73, i32 11, metadata !121, null}
!184 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777224, metadata !8, i32 0, metadata !183} ; [ DW_TAG_arg_variable ] [value] [line 8]
!185 = metadata !{i32 8, i32 33, metadata !4, metadata !183} ; [ DW_TAG_imported_declaration ]
!186 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554440, metadata !8, i32 0, metadata !183} ; [ DW_TAG_arg_variable ] [lower_bound] [line 8]
!187 = metadata !{i32 8, i32 50, metadata !4, metadata !183} ; [ DW_TAG_imported_declaration ]
!188 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331656, metadata !8, i32 0, metadata !183} ; [ DW_TAG_arg_variable ] [upper_bound] [line 8]
!189 = metadata !{i32 8, i32 73, metadata !4, metadata !183} ; [ DW_TAG_imported_declaration ]
!190 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 9, metadata !8, i32 0, metadata !183} ; [ DW_TAG_auto_variable ] [range] [line 9]
!191 = metadata !{i32 9, i32 15, metadata !4, metadata !183}
!192 = metadata !{i32 10, i32 9, metadata !30, metadata !183}
!193 = metadata !{i32 11, i32 9, metadata !32, metadata !183}
!194 = metadata !{i32 13, i32 14, metadata !34, metadata !183}
!195 = metadata !{i32 14, i32 9, metadata !36, metadata !183}
!196 = metadata !{i32 75, i32 17, metadata !12, null}

