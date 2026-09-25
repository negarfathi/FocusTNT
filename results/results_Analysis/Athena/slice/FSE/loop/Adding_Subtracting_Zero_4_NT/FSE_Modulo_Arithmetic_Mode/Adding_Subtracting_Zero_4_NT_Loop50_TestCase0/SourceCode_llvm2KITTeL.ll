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
  %"12" = load i64* @"'flag", align 8, !dbg !45
  %"13" = icmp eq i64 %"12", 1, !dbg !45
  br i1 %"13", label %read_slice_1_bb20, label %read_slice_1_wrap_around.exit2, !dbg !45

read_slice_1_wrap_around.exit2:                   ; preds = %read_slice_1_bb18, %read_slice_1_bb17, %read_slice_1_bb16, %read_slice_1_bb5
  %count.0 = phi i64 [ 0, %read_slice_1_bb5 ], [ %.0.i3, %read_slice_1_bb16 ], [ %.0.i3, %read_slice_1_bb17 ], [ %.0.i3, %read_slice_1_bb18 ]
  %.0 = phi i64 [ %loc, %read_slice_1_bb5 ], [ %"47", %read_slice_1_bb16 ], [ %"52", %read_slice_1_bb18 ], [ %"42", %read_slice_1_bb17 ]
  %"14" = icmp slt i64 %.0, %len, !dbg !47
  br i1 %"14", label %read_slice_1_bb6, label %read_slice_1_bb20, !dbg !47

read_slice_1_bb6:                                 ; preds = %read_slice_1_wrap_around.exit2
  %"15" = call i64 @__VERIFIER_nondet_int(), !dbg !49
  %"16" = icmp eq i64 %"15", 0, !dbg !51
  br i1 %"16", label %read_slice_1_bb20, label %read_slice_1_bb7, !dbg !51

read_slice_1_bb7:                                 ; preds = %read_slice_1_bb6
  %"17" = icmp slt i64 %"15", 0, !dbg !53
  br i1 %"17", label %read_slice_1_bb8, label %read_slice_1_wrap_around.exit, !dbg !53

read_slice_1_bb8:                                 ; preds = %read_slice_1_bb7
  %"18" = sub nsw i64 0, %"15", !dbg !56
  %"19" = icmp sgt i64 %"18", 2147483647, !dbg !58
  br i1 %"19", label %read_slice_1_bb9, label %read_slice_1_bb10, !dbg !58

read_slice_1_bb9:                                 ; preds = %read_slice_1_bb8
  %"20" = sub nsw i64 %"18", 2147483647, !dbg !59
  %"21" = sub nsw i64 %"20", 1, !dbg !59
  %"22" = srem i64 %"21", 4294967296, !dbg !59
  %"23" = add nsw i64 -2147483648, %"22", !dbg !59
  br label %read_slice_1_wrap_around.exit, !dbg !59

read_slice_1_bb10:                                ; preds = %read_slice_1_bb8
  %"24" = icmp slt i64 %"18", -2147483648, !dbg !60
  br i1 %"24", label %read_slice_1_bb11, label %read_slice_1_wrap_around.exit, !dbg !60

read_slice_1_bb11:                                ; preds = %read_slice_1_bb10
  %"25" = sub nsw i64 -2147483648, %"18", !dbg !61
  %"26" = sub nsw i64 %"25", 1, !dbg !61
  %"27" = srem i64 %"26", 4294967296, !dbg !61
  %"28" = sub nsw i64 2147483647, %"27", !dbg !61
  br label %read_slice_1_wrap_around.exit, !dbg !61

read_slice_1_wrap_around.exit:                    ; preds = %read_slice_1_bb11, %read_slice_1_bb10, %read_slice_1_bb9, %read_slice_1_bb7
  %num.0 = phi i64 [ %"15", %read_slice_1_bb7 ], [ %"23", %read_slice_1_bb9 ], [ %"28", %read_slice_1_bb11 ], [ %"18", %read_slice_1_bb10 ]
  %"29" = srem i64 %num.0, 1000, !dbg !62
  %"30" = add nsw i64 %count.0, 1, !dbg !63
  %"31" = icmp sgt i64 %"30", 2147483647, !dbg !64
  br i1 %"31", label %read_slice_1_bb12, label %read_slice_1_bb13, !dbg !64

read_slice_1_bb12:                                ; preds = %read_slice_1_wrap_around.exit
  %"32" = sub nsw i64 %"30", 2147483647, !dbg !65
  %"33" = sub nsw i64 %"32", 1, !dbg !65
  %"34" = srem i64 %"33", 4294967296, !dbg !65
  %"35" = add nsw i64 -2147483648, %"34", !dbg !65
  br label %read_slice_1_wrap_around.exit4, !dbg !65

read_slice_1_bb13:                                ; preds = %read_slice_1_wrap_around.exit
  %"36" = icmp slt i64 %"30", -2147483648, !dbg !66
  br i1 %"36", label %read_slice_1_bb14, label %read_slice_1_wrap_around.exit4, !dbg !66

read_slice_1_bb14:                                ; preds = %read_slice_1_bb13
  %"37" = sub nsw i64 -2147483648, %"30", !dbg !67
  %"38" = sub nsw i64 %"37", 1, !dbg !67
  %"39" = srem i64 %"38", 4294967296, !dbg !67
  %"40" = sub nsw i64 2147483647, %"39", !dbg !67
  br label %read_slice_1_wrap_around.exit4, !dbg !67

read_slice_1_wrap_around.exit4:                   ; preds = %read_slice_1_bb12, %read_slice_1_bb13, %read_slice_1_bb14
  %.0.i3 = phi i64 [ %"35", %read_slice_1_bb12 ], [ %"40", %read_slice_1_bb14 ], [ %"30", %read_slice_1_bb13 ], !dbg !63
  %"41" = icmp slt i64 %"29", 995, !dbg !68
  br i1 %"41", label %read_slice_1_bb15, label %read_slice_1_bb19, !dbg !68

read_slice_1_bb15:                                ; preds = %read_slice_1_wrap_around.exit4
  %"42" = add nsw i64 %.0, 1, !dbg !70
  %"43" = icmp sgt i64 %"42", 2147483647, !dbg !72
  br i1 %"43", label %read_slice_1_bb16, label %read_slice_1_bb17, !dbg !72

read_slice_1_bb16:                                ; preds = %read_slice_1_bb15
  %"44" = sub nsw i64 %"42", 2147483647, !dbg !73
  %"45" = sub nsw i64 %"44", 1, !dbg !73
  %"46" = srem i64 %"45", 4294967296, !dbg !73
  %"47" = add nsw i64 -2147483648, %"46", !dbg !73
  br label %read_slice_1_wrap_around.exit2, !dbg !73

read_slice_1_bb17:                                ; preds = %read_slice_1_bb15
  %"48" = icmp slt i64 %"42", -2147483648, !dbg !74
  br i1 %"48", label %read_slice_1_bb18, label %read_slice_1_wrap_around.exit2, !dbg !74

read_slice_1_bb18:                                ; preds = %read_slice_1_bb17
  %"49" = sub nsw i64 -2147483648, %"42", !dbg !75
  %"50" = sub nsw i64 %"49", 1, !dbg !75
  %"51" = srem i64 %"50", 4294967296, !dbg !75
  %"52" = sub nsw i64 2147483647, %"51", !dbg !75
  br label %read_slice_1_wrap_around.exit2, !dbg !75

read_slice_1_bb19:                                ; preds = %read_slice_1_wrap_around.exit4
  store i64 1, i64* @"'flag", align 8, !dbg !76
  call void @llvm.dbg.value(metadata !{i64 %.0.i3}, i64 0, metadata !78), !dbg !79
  br label %read_slice_1_bb20, !dbg !80

read_slice_1_bb20:                                ; preds = %read_slice_1_wrap_around.exit2, %read_slice_1_bb6, %read_slice_1_bb5, %read_slice_1_bb19
  %__retres.0 = phi i64 [ %.0.i3, %read_slice_1_bb19 ], [ 0, %read_slice_1_bb5 ], [ -1, %read_slice_1_bb6 ], [ %count.0, %read_slice_1_wrap_around.exit2 ]
  ret i64 %__retres.0, !dbg !81
}

declare i64 @__VERIFIER_nondet_int() #2

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb21:
  %"53" = call i64 @__VERIFIER_nondet_int(), !dbg !82
  call void @llvm.dbg.value(metadata !{i64 %"53"}, i64 0, metadata !83), !dbg !84
  %"54" = icmp sle i64 %"53", 0, !dbg !85
  br i1 %"54", label %main_bb44, label %main_wrap_around.exit3, !dbg !85

main_wrap_around.exit3:                           ; preds = %main_bb43, %main_bb42, %main_bb41, %main_bb21
  %buf.0 = phi i64 [ 0, %main_bb21 ], [ %"114", %main_bb41 ], [ %"119", %main_bb43 ], [ %"109", %main_bb42 ]
  %count.0 = phi i64 [ %"53", %main_bb21 ], [ %.0.i1, %main_bb41 ], [ %.0.i1, %main_bb42 ], [ %.0.i1, %main_bb43 ]
  %"55" = icmp sgt i64 %count.0, 0, !dbg !87
  br i1 %"55", label %main_bb22, label %main_bb44, !dbg !87

main_bb22:                                        ; preds = %main_wrap_around.exit3
  %"56" = load i64* @"'flag", align 8, !dbg !89
  %"57" = icmp eq i64 %"56", 1, !dbg !89
  br i1 %"57", label %main_read_slice_1.exit, label %main_wrap_around.exit2.i, !dbg !89

main_wrap_around.exit2.i:                         ; preds = %main_bb35, %main_bb34, %main_bb33, %main_bb22
  %count.0.i = phi i64 [ 0, %main_bb22 ], [ %.0.i3.i, %main_bb33 ], [ %.0.i3.i, %main_bb34 ], [ %.0.i3.i, %main_bb35 ], !dbg !90
  %.0.i = phi i64 [ %buf.0, %main_bb22 ], [ %"91", %main_bb33 ], [ %"96", %main_bb35 ], [ %"86", %main_bb34 ], !dbg !90
  %"58" = icmp slt i64 %.0.i, %count.0, !dbg !92
  br i1 %"58", label %main_bb23, label %main_read_slice_1.exit, !dbg !92

main_bb23:                                        ; preds = %main_wrap_around.exit2.i
  %"59" = call i64 @__VERIFIER_nondet_int() #3, !dbg !93
  %"60" = icmp eq i64 %"59", 0, !dbg !94
  br i1 %"60", label %main_read_slice_1.exit, label %main_bb24, !dbg !94

main_bb24:                                        ; preds = %main_bb23
  %"61" = icmp slt i64 %"59", 0, !dbg !95
  br i1 %"61", label %main_bb25, label %main_wrap_around.exit.i, !dbg !95

main_bb25:                                        ; preds = %main_bb24
  %"62" = sub nsw i64 0, %"59", !dbg !96
  %"63" = icmp sgt i64 %"62", 2147483647, !dbg !97
  br i1 %"63", label %main_bb26, label %main_bb27, !dbg !97

main_bb26:                                        ; preds = %main_bb25
  %"64" = sub nsw i64 %"62", 2147483647, !dbg !98
  %"65" = sub nsw i64 %"64", 1, !dbg !98
  %"66" = srem i64 %"65", 4294967296, !dbg !98
  %"67" = add nsw i64 -2147483648, %"66", !dbg !98
  br label %main_wrap_around.exit.i, !dbg !98

main_bb27:                                        ; preds = %main_bb25
  %"68" = icmp slt i64 %"62", -2147483648, !dbg !99
  br i1 %"68", label %main_bb28, label %main_wrap_around.exit.i, !dbg !99

main_bb28:                                        ; preds = %main_bb27
  %"69" = sub nsw i64 -2147483648, %"62", !dbg !100
  %"70" = sub nsw i64 %"69", 1, !dbg !100
  %"71" = srem i64 %"70", 4294967296, !dbg !100
  %"72" = sub nsw i64 2147483647, %"71", !dbg !100
  br label %main_wrap_around.exit.i, !dbg !100

main_wrap_around.exit.i:                          ; preds = %main_bb28, %main_bb27, %main_bb26, %main_bb24
  %num.0.i = phi i64 [ %"59", %main_bb24 ], [ %"67", %main_bb26 ], [ %"72", %main_bb28 ], [ %"62", %main_bb27 ], !dbg !90
  %"73" = srem i64 %num.0.i, 1000, !dbg !101
  %"74" = add nsw i64 %count.0.i, 1, !dbg !102
  %"75" = icmp sgt i64 %"74", 2147483647, !dbg !103
  br i1 %"75", label %main_bb29, label %main_bb30, !dbg !103

main_bb29:                                        ; preds = %main_wrap_around.exit.i
  %"76" = sub nsw i64 %"74", 2147483647, !dbg !104
  %"77" = sub nsw i64 %"76", 1, !dbg !104
  %"78" = srem i64 %"77", 4294967296, !dbg !104
  %"79" = add nsw i64 -2147483648, %"78", !dbg !104
  br label %main_wrap_around.exit4.i, !dbg !104

main_bb30:                                        ; preds = %main_wrap_around.exit.i
  %"80" = icmp slt i64 %"74", -2147483648, !dbg !105
  br i1 %"80", label %main_bb31, label %main_wrap_around.exit4.i, !dbg !105

main_bb31:                                        ; preds = %main_bb30
  %"81" = sub nsw i64 -2147483648, %"74", !dbg !106
  %"82" = sub nsw i64 %"81", 1, !dbg !106
  %"83" = srem i64 %"82", 4294967296, !dbg !106
  %"84" = sub nsw i64 2147483647, %"83", !dbg !106
  br label %main_wrap_around.exit4.i, !dbg !106

main_wrap_around.exit4.i:                         ; preds = %main_bb31, %main_bb30, %main_bb29
  %.0.i3.i = phi i64 [ %"79", %main_bb29 ], [ %"84", %main_bb31 ], [ %"74", %main_bb30 ], !dbg !102
  %"85" = icmp slt i64 %"73", 995, !dbg !107
  br i1 %"85", label %main_bb32, label %main_bb36, !dbg !107

main_bb32:                                        ; preds = %main_wrap_around.exit4.i
  %"86" = add nsw i64 %.0.i, 1, !dbg !108
  %"87" = icmp sgt i64 %"86", 2147483647, !dbg !109
  br i1 %"87", label %main_bb33, label %main_bb34, !dbg !109

main_bb33:                                        ; preds = %main_bb32
  %"88" = sub nsw i64 %"86", 2147483647, !dbg !110
  %"89" = sub nsw i64 %"88", 1, !dbg !110
  %"90" = srem i64 %"89", 4294967296, !dbg !110
  %"91" = add nsw i64 -2147483648, %"90", !dbg !110
  br label %main_wrap_around.exit2.i, !dbg !110

main_bb34:                                        ; preds = %main_bb32
  %"92" = icmp slt i64 %"86", -2147483648, !dbg !111
  br i1 %"92", label %main_bb35, label %main_wrap_around.exit2.i, !dbg !111

main_bb35:                                        ; preds = %main_bb34
  %"93" = sub nsw i64 -2147483648, %"86", !dbg !112
  %"94" = sub nsw i64 %"93", 1, !dbg !112
  %"95" = srem i64 %"94", 4294967296, !dbg !112
  %"96" = sub nsw i64 2147483647, %"95", !dbg !112
  br label %main_wrap_around.exit2.i, !dbg !112

main_bb36:                                        ; preds = %main_wrap_around.exit4.i
  store i64 1, i64* @"'flag", align 8, !dbg !113
  call void @llvm.dbg.value(metadata !{i64 %.0.i3.i}, i64 0, metadata !114) #3, !dbg !115
  br label %main_read_slice_1.exit, !dbg !116

main_read_slice_1.exit:                           ; preds = %main_bb22, %main_wrap_around.exit2.i, %main_bb23, %main_bb36
  %__retres.0.i = phi i64 [ %.0.i3.i, %main_bb36 ], [ 0, %main_bb22 ], [ -1, %main_bb23 ], [ %count.0.i, %main_wrap_around.exit2.i ], !dbg !90
  %"97" = icmp slt i64 %__retres.0.i, 0, !dbg !117
  br i1 %"97", label %main_bb44, label %main_bb37, !dbg !117

main_bb37:                                        ; preds = %main_read_slice_1.exit
  %"98" = sub nsw i64 %count.0, %__retres.0.i, !dbg !119
  %"99" = icmp sgt i64 %"98", 2147483647, !dbg !120
  br i1 %"99", label %main_bb38, label %main_bb39, !dbg !120

main_bb38:                                        ; preds = %main_bb37
  %"100" = sub nsw i64 %"98", 2147483647, !dbg !121
  %"101" = sub nsw i64 %"100", 1, !dbg !121
  %"102" = srem i64 %"101", 4294967296, !dbg !121
  %"103" = add nsw i64 -2147483648, %"102", !dbg !121
  br label %main_wrap_around.exit, !dbg !121

main_bb39:                                        ; preds = %main_bb37
  %"104" = icmp slt i64 %"98", -2147483648, !dbg !122
  br i1 %"104", label %main_bb40, label %main_wrap_around.exit, !dbg !122

main_bb40:                                        ; preds = %main_bb39
  %"105" = sub nsw i64 -2147483648, %"98", !dbg !123
  %"106" = sub nsw i64 %"105", 1, !dbg !123
  %"107" = srem i64 %"106", 4294967296, !dbg !123
  %"108" = sub nsw i64 2147483647, %"107", !dbg !123
  br label %main_wrap_around.exit, !dbg !123

main_wrap_around.exit:                            ; preds = %main_bb38, %main_bb39, %main_bb40
  %.0.i1 = phi i64 [ %"103", %main_bb38 ], [ %"108", %main_bb40 ], [ %"98", %main_bb39 ], !dbg !119
  %"109" = add nsw i64 %buf.0, %__retres.0.i, !dbg !124
  %"110" = icmp sgt i64 %"109", 2147483647, !dbg !125
  br i1 %"110", label %main_bb41, label %main_bb42, !dbg !125

main_bb41:                                        ; preds = %main_wrap_around.exit
  %"111" = sub nsw i64 %"109", 2147483647, !dbg !126
  %"112" = sub nsw i64 %"111", 1, !dbg !126
  %"113" = srem i64 %"112", 4294967296, !dbg !126
  %"114" = add nsw i64 -2147483648, %"113", !dbg !126
  br label %main_wrap_around.exit3, !dbg !126

main_bb42:                                        ; preds = %main_wrap_around.exit
  %"115" = icmp slt i64 %"109", -2147483648, !dbg !127
  br i1 %"115", label %main_bb43, label %main_wrap_around.exit3, !dbg !127

main_bb43:                                        ; preds = %main_bb42
  %"116" = sub nsw i64 -2147483648, %"109", !dbg !128
  %"117" = sub nsw i64 %"116", 1, !dbg !128
  %"118" = srem i64 %"117", 4294967296, !dbg !128
  %"119" = sub nsw i64 2147483647, %"118", !dbg !128
  br label %main_wrap_around.exit3, !dbg !128

main_bb44:                                        ; preds = %main_wrap_around.exit3, %main_read_slice_1.exit, %main_bb21
  ret void, !dbg !129
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
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 54, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @main, null, null, metadata !2, i32 55} ; [ DW_TAG_subprogram ] [line 54] [def] [scope 55] [main]
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
!45 = metadata !{i32 22, i32 7, metadata !46, null}
!46 = metadata !{i32 786443, metadata !1, metadata !9, i32 22, i32 7, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!47 = metadata !{i32 26, i32 3, metadata !48, null}
!48 = metadata !{i32 786443, metadata !1, metadata !9, i32 26, i32 3, i32 1, i32 20} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!49 = metadata !{i32 27, i32 21, metadata !50, null}
!50 = metadata !{i32 786443, metadata !1, metadata !9, i32 26, i32 21, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!51 = metadata !{i32 28, i32 9, metadata !52, null}
!52 = metadata !{i32 786443, metadata !1, metadata !50, i32 28, i32 9, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!53 = metadata !{i32 34, i32 11, metadata !54, null}
!54 = metadata !{i32 786443, metadata !1, metadata !55, i32 34, i32 11, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!55 = metadata !{i32 786443, metadata !1, metadata !52, i32 33, i32 10, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!56 = metadata !{i32 35, i32 9, metadata !57, null}
!57 = metadata !{i32 786443, metadata !1, metadata !54, i32 35, i32 1, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!58 = metadata !{i32 10, i32 9, metadata !30, metadata !56}
!59 = metadata !{i32 11, i32 9, metadata !32, metadata !56}
!60 = metadata !{i32 13, i32 14, metadata !34, metadata !56}
!61 = metadata !{i32 14, i32 9, metadata !36, metadata !56}
!62 = metadata !{i32 37, i32 13, metadata !55, null}
!63 = metadata !{i32 38, i32 16, metadata !55, null}
!64 = metadata !{i32 10, i32 9, metadata !30, metadata !63}
!65 = metadata !{i32 11, i32 9, metadata !32, metadata !63}
!66 = metadata !{i32 13, i32 14, metadata !34, metadata !63}
!67 = metadata !{i32 14, i32 9, metadata !36, metadata !63}
!68 = metadata !{i32 39, i32 11, metadata !69, null}
!69 = metadata !{i32 786443, metadata !1, metadata !55, i32 39, i32 11, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!70 = metadata !{i32 40, i32 10, metadata !71, null}
!71 = metadata !{i32 786443, metadata !1, metadata !69, i32 40, i32 1, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!72 = metadata !{i32 10, i32 9, metadata !30, metadata !70}
!73 = metadata !{i32 11, i32 9, metadata !32, metadata !70}
!74 = metadata !{i32 13, i32 14, metadata !34, metadata !70}
!75 = metadata !{i32 14, i32 9, metadata !36, metadata !70}
!76 = metadata !{i32 43, i32 9, metadata !77, null}
!77 = metadata !{i32 786443, metadata !1, metadata !69, i32 42, i32 12, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!78 = metadata !{i32 786688, metadata !9, metadata !"__retres", metadata !5, i32 20, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__retres] [line 20]
!79 = metadata !{i32 20, i32 13, metadata !9, null}
!80 = metadata !{i32 46, i32 9, metadata !77, null}
!81 = metadata !{i32 51, i32 17, metadata !9, null}
!82 = metadata !{i32 58, i32 21, metadata !12, null} ; [ DW_TAG_imported_module ]
!83 = metadata !{i32 786688, metadata !12, metadata !"count", metadata !5, i32 58, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 58]
!84 = metadata !{i32 58, i32 13, metadata !12, null} ; [ DW_TAG_imported_module ]
!85 = metadata !{i32 59, i32 7, metadata !86, null}
!86 = metadata !{i32 786443, metadata !1, metadata !12, i32 59, i32 7, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!87 = metadata !{i32 64, i32 3, metadata !88, null}
!88 = metadata !{i32 786443, metadata !1, metadata !12, i32 64, i32 3, i32 1, i32 21} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!89 = metadata !{i32 22, i32 7, metadata !46, metadata !90}
!90 = metadata !{i32 65, i32 11, metadata !91, null}
!91 = metadata !{i32 786443, metadata !1, metadata !12, i32 64, i32 21, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!92 = metadata !{i32 26, i32 3, metadata !48, metadata !90}
!93 = metadata !{i32 27, i32 21, metadata !50, metadata !90}
!94 = metadata !{i32 28, i32 9, metadata !52, metadata !90}
!95 = metadata !{i32 34, i32 11, metadata !54, metadata !90}
!96 = metadata !{i32 35, i32 9, metadata !57, metadata !90}
!97 = metadata !{i32 10, i32 9, metadata !30, metadata !96}
!98 = metadata !{i32 11, i32 9, metadata !32, metadata !96}
!99 = metadata !{i32 13, i32 14, metadata !34, metadata !96}
!100 = metadata !{i32 14, i32 9, metadata !36, metadata !96}
!101 = metadata !{i32 37, i32 13, metadata !55, metadata !90}
!102 = metadata !{i32 38, i32 16, metadata !55, metadata !90}
!103 = metadata !{i32 10, i32 9, metadata !30, metadata !102}
!104 = metadata !{i32 11, i32 9, metadata !32, metadata !102}
!105 = metadata !{i32 13, i32 14, metadata !34, metadata !102}
!106 = metadata !{i32 14, i32 9, metadata !36, metadata !102}
!107 = metadata !{i32 39, i32 11, metadata !69, metadata !90}
!108 = metadata !{i32 40, i32 10, metadata !71, metadata !90}
!109 = metadata !{i32 10, i32 9, metadata !30, metadata !108}
!110 = metadata !{i32 11, i32 9, metadata !32, metadata !108}
!111 = metadata !{i32 13, i32 14, metadata !34, metadata !108}
!112 = metadata !{i32 14, i32 9, metadata !36, metadata !108}
!113 = metadata !{i32 43, i32 9, metadata !77, metadata !90}
!114 = metadata !{i32 786688, metadata !9, metadata !"__retres", metadata !5, i32 20, metadata !8, i32 0, metadata !90} ; [ DW_TAG_auto_variable ] [__retres] [line 20]
!115 = metadata !{i32 20, i32 13, metadata !9, metadata !90}
!116 = metadata !{i32 46, i32 9, metadata !77, metadata !90}
!117 = metadata !{i32 66, i32 9, metadata !118, null}
!118 = metadata !{i32 786443, metadata !1, metadata !91, i32 66, i32 9, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!119 = metadata !{i32 70, i32 13, metadata !91, null}
!120 = metadata !{i32 10, i32 9, metadata !30, metadata !119}
!121 = metadata !{i32 11, i32 9, metadata !32, metadata !119}
!122 = metadata !{i32 13, i32 14, metadata !34, metadata !119}
!123 = metadata !{i32 14, i32 9, metadata !36, metadata !119}
!124 = metadata !{i32 71, i32 11, metadata !91, null}
!125 = metadata !{i32 10, i32 9, metadata !30, metadata !124}
!126 = metadata !{i32 11, i32 9, metadata !32, metadata !124}
!127 = metadata !{i32 13, i32 14, metadata !34, metadata !124}
!128 = metadata !{i32 14, i32 9, metadata !36, metadata !124}
!129 = metadata !{i32 73, i32 17, metadata !12, null}

