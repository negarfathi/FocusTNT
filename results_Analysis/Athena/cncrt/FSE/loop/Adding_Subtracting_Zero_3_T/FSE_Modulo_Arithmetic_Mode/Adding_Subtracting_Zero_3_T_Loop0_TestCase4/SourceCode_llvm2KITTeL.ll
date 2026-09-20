; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@"'flag" = global i64 0, align 8

; Function Attrs: nounwind uwtable
define i64 @wrap_around(i64 %value, i64 %lower_bound, i64 %upper_bound) #0 {
wrap_around_bb0:
  call void @llvm.dbg.value(metadata !{i64 %value}, i64 0, metadata !21), !dbg !22
  call void @llvm.dbg.value(metadata !{i64 %lower_bound}, i64 0, metadata !23), !dbg !24
  call void @llvm.dbg.value(metadata !{i64 %upper_bound}, i64 0, metadata !25), !dbg !26
  %"0" = sub nsw i64 %upper_bound, %lower_bound, !dbg !27
  %"1" = add nsw i64 %"0", 1, !dbg !27
  call void @llvm.dbg.value(metadata !{i64 %"1"}, i64 0, metadata !28), !dbg !29
  %"2" = icmp sgt i64 %value, %upper_bound, !dbg !30
  br i1 %"2", label %wrap_around_bb1, label %wrap_around_bb2, !dbg !30

wrap_around_bb1:                                  ; preds = %wrap_around_bb0
  %"3" = sub nsw i64 %value, %upper_bound, !dbg !32
  %"4" = sub nsw i64 %"3", 1, !dbg !32
  %"5" = srem i64 %"4", %"1", !dbg !32
  %"6" = add nsw i64 %lower_bound, %"5", !dbg !32
  br label %wrap_around_bb4, !dbg !32

wrap_around_bb2:                                  ; preds = %wrap_around_bb0
  %"7" = icmp slt i64 %value, %lower_bound, !dbg !34
  br i1 %"7", label %wrap_around_bb3, label %wrap_around_bb4, !dbg !34

wrap_around_bb3:                                  ; preds = %wrap_around_bb2
  %"8" = sub nsw i64 %lower_bound, %value, !dbg !36
  %"9" = sub nsw i64 %"8", 1, !dbg !36
  %"10" = srem i64 %"9", %"1", !dbg !36
  %"11" = sub nsw i64 %upper_bound, %"10", !dbg !36
  br label %wrap_around_bb4, !dbg !36

wrap_around_bb4:                                  ; preds = %wrap_around_bb2, %wrap_around_bb3, %wrap_around_bb1
  %.0 = phi i64 [ %"6", %wrap_around_bb1 ], [ %"11", %wrap_around_bb3 ], [ %value, %wrap_around_bb2 ]
  ret i64 %.0, !dbg !38
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i64 @read(i64 %loc, i64 %len) #0 {
read_bb5:
  call void @llvm.dbg.value(metadata !{i64 %loc}, i64 0, metadata !39), !dbg !40
  call void @llvm.dbg.value(metadata !{i64 %len}, i64 0, metadata !41), !dbg !42
  call void @llvm.dbg.value(metadata !43, i64 0, metadata !44), !dbg !45
  %"12" = load i64* @"'flag", align 8, !dbg !46
  %"13" = icmp eq i64 %"12", 1, !dbg !46
  br i1 %"13", label %read_bb20, label %read_wrap_around.exit2, !dbg !46

read_wrap_around.exit2:                           ; preds = %read_bb18, %read_bb17, %read_bb16, %read_bb5
  %count.0 = phi i64 [ 0, %read_bb5 ], [ %.0.i3, %read_bb16 ], [ %.0.i3, %read_bb17 ], [ %.0.i3, %read_bb18 ]
  %.06 = phi i64 [ %loc, %read_bb5 ], [ %"46", %read_bb16 ], [ %"51", %read_bb18 ], [ %"41", %read_bb17 ]
  %"14" = icmp slt i64 %.06, %len, !dbg !48
  br i1 %"14", label %read_bb6, label %read_bb20, !dbg !48

read_bb6:                                         ; preds = %read_wrap_around.exit2
  %"15" = icmp eq i64 -200, 0, !dbg !50
  br i1 %"15", label %read_bb20, label %read_bb7, !dbg !50

read_bb7:                                         ; preds = %read_bb6
  %"16" = icmp slt i64 -200, 0, !dbg !53
  br i1 %"16", label %read_bb8, label %read_wrap_around.exit, !dbg !53

read_bb8:                                         ; preds = %read_bb7
  %"17" = sub nsw i64 0, -200, !dbg !56
  %"18" = icmp sgt i64 %"17", 2147483647, !dbg !58
  br i1 %"18", label %read_bb9, label %read_bb10, !dbg !58

read_bb9:                                         ; preds = %read_bb8
  %"19" = sub nsw i64 %"17", 2147483647, !dbg !59
  %"20" = sub nsw i64 %"19", 1, !dbg !59
  %"21" = srem i64 %"20", 4294967296, !dbg !59
  %"22" = add nsw i64 -2147483648, %"21", !dbg !59
  br label %read_wrap_around.exit, !dbg !59

read_bb10:                                        ; preds = %read_bb8
  %"23" = icmp slt i64 %"17", -2147483648, !dbg !60
  br i1 %"23", label %read_bb11, label %read_wrap_around.exit, !dbg !60

read_bb11:                                        ; preds = %read_bb10
  %"24" = sub nsw i64 -2147483648, %"17", !dbg !61
  %"25" = sub nsw i64 %"24", 1, !dbg !61
  %"26" = srem i64 %"25", 4294967296, !dbg !61
  %"27" = sub nsw i64 2147483647, %"26", !dbg !61
  br label %read_wrap_around.exit, !dbg !61

read_wrap_around.exit:                            ; preds = %read_bb11, %read_bb10, %read_bb9, %read_bb7
  %num.0 = phi i64 [ -200, %read_bb7 ], [ %"22", %read_bb9 ], [ %"27", %read_bb11 ], [ %"17", %read_bb10 ]
  %"28" = srem i64 %num.0, 1000, !dbg !62
  %"29" = add nsw i64 %count.0, 1, !dbg !63
  %"30" = icmp sgt i64 %"29", 2147483647, !dbg !64
  br i1 %"30", label %read_bb12, label %read_bb13, !dbg !64

read_bb12:                                        ; preds = %read_wrap_around.exit
  %"31" = sub nsw i64 %"29", 2147483647, !dbg !65
  %"32" = sub nsw i64 %"31", 1, !dbg !65
  %"33" = srem i64 %"32", 4294967296, !dbg !65
  %"34" = add nsw i64 -2147483648, %"33", !dbg !65
  br label %read_wrap_around.exit4, !dbg !65

read_bb13:                                        ; preds = %read_wrap_around.exit
  %"35" = icmp slt i64 %"29", -2147483648, !dbg !66
  br i1 %"35", label %read_bb14, label %read_wrap_around.exit4, !dbg !66

read_bb14:                                        ; preds = %read_bb13
  %"36" = sub nsw i64 -2147483648, %"29", !dbg !67
  %"37" = sub nsw i64 %"36", 1, !dbg !67
  %"38" = srem i64 %"37", 4294967296, !dbg !67
  %"39" = sub nsw i64 2147483647, %"38", !dbg !67
  br label %read_wrap_around.exit4, !dbg !67

read_wrap_around.exit4:                           ; preds = %read_bb12, %read_bb13, %read_bb14
  %.0.i3 = phi i64 [ %"34", %read_bb12 ], [ %"39", %read_bb14 ], [ %"29", %read_bb13 ], !dbg !63
  %"40" = icmp slt i64 %"28", 995, !dbg !68
  br i1 %"40", label %read_bb15, label %read_bb19, !dbg !68

read_bb15:                                        ; preds = %read_wrap_around.exit4
  %"41" = add nsw i64 %.06, 1, !dbg !70
  %"42" = icmp sgt i64 %"41", 2147483647, !dbg !72
  br i1 %"42", label %read_bb16, label %read_bb17, !dbg !72

read_bb16:                                        ; preds = %read_bb15
  %"43" = sub nsw i64 %"41", 2147483647, !dbg !73
  %"44" = sub nsw i64 %"43", 1, !dbg !73
  %"45" = srem i64 %"44", 4294967296, !dbg !73
  %"46" = add nsw i64 -2147483648, %"45", !dbg !73
  br label %read_wrap_around.exit2, !dbg !73

read_bb17:                                        ; preds = %read_bb15
  %"47" = icmp slt i64 %"41", -2147483648, !dbg !74
  br i1 %"47", label %read_bb18, label %read_wrap_around.exit2, !dbg !74

read_bb18:                                        ; preds = %read_bb17
  %"48" = sub nsw i64 -2147483648, %"41", !dbg !75
  %"49" = sub nsw i64 %"48", 1, !dbg !75
  %"50" = srem i64 %"49", 4294967296, !dbg !75
  %"51" = sub nsw i64 2147483647, %"50", !dbg !75
  br label %read_wrap_around.exit2, !dbg !75

read_bb19:                                        ; preds = %read_wrap_around.exit4
  store i64 1, i64* @"'flag", align 8, !dbg !76
  br label %read_bb20, !dbg !78

read_bb20:                                        ; preds = %read_wrap_around.exit2, %read_bb6, %read_bb5, %read_bb19
  %.0 = phi i64 [ %.0.i3, %read_bb19 ], [ 0, %read_bb5 ], [ -1, %read_bb6 ], [ %count.0, %read_wrap_around.exit2 ]
  ret i64 %.0, !dbg !79
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
main_bb21:
  call void @llvm.dbg.value(metadata !43, i64 0, metadata !80), !dbg !81
  call void @llvm.dbg.value(metadata !82, i64 0, metadata !83), !dbg !84
  store i64 0, i64* @"'flag", align 8, !dbg !85
  call void @llvm.dbg.value(metadata !43, i64 0, metadata !86), !dbg !87
  %"52" = icmp sle i64 8, 0, !dbg !88
  %"53" = icmp sgt i64 8, 65536, !dbg !90
  %or.cond = or i1 %"52", %"53", !dbg !88
  br i1 %or.cond, label %main_bb45, label %main_bb22, !dbg !88

main_bb22:                                        ; preds = %main_bb21
  call void @llvm.dbg.value(metadata !{i64 %"56"}, i64 0, metadata !92), !dbg !95
  call void @llvm.dbg.value(metadata !96, i64 0, metadata !97), !dbg !98
  call void @llvm.dbg.value(metadata !99, i64 0, metadata !100), !dbg !101
  call void @llvm.dbg.value(metadata !102, i64 0, metadata !103), !dbg !104
  call void @llvm.dbg.value(metadata !{i64 %pos.0}, i64 0, metadata !105), !dbg !107
  call void @llvm.dbg.value(metadata !{i64 %.0.i}, i64 0, metadata !108), !dbg !109
  call void @llvm.dbg.value(metadata !43, i64 0, metadata !110), !dbg !111
  %"54" = load i64* @"'flag", align 8, !dbg !112
  call void @llvm.dbg.value(metadata !{i64 %.0.i7}, i64 0, metadata !113), !dbg !114
  call void @llvm.dbg.value(metadata !{i64 %"91"}, i64 0, metadata !115), !dbg !119
  call void @llvm.dbg.value(metadata !96, i64 0, metadata !120), !dbg !121
  call void @llvm.dbg.value(metadata !99, i64 0, metadata !122), !dbg !123
  call void @llvm.dbg.value(metadata !102, i64 0, metadata !124), !dbg !125
  call void @llvm.dbg.value(metadata !{i64 %.0.i5}, i64 0, metadata !86), !dbg !87
  call void @llvm.dbg.value(metadata !{i64 %"103"}, i64 0, metadata !126), !dbg !130
  call void @llvm.dbg.value(metadata !96, i64 0, metadata !131), !dbg !132
  call void @llvm.dbg.value(metadata !99, i64 0, metadata !133), !dbg !134
  call void @llvm.dbg.value(metadata !102, i64 0, metadata !135), !dbg !136
  call void @llvm.dbg.value(metadata !{i64 %"114"}, i64 0, metadata !137), !dbg !139
  call void @llvm.dbg.value(metadata !96, i64 0, metadata !140), !dbg !141
  call void @llvm.dbg.value(metadata !99, i64 0, metadata !142), !dbg !143
  call void @llvm.dbg.value(metadata !102, i64 0, metadata !144), !dbg !145
  br label %main_wrap_around.exit2, !dbg !146

main_wrap_around.exit2:                           ; preds = %main_bb44, %main_bb43, %main_bb42, %main_wrap_around.exit6, %main_bb22
  %errno.0 = phi i64 [ 0, %main_bb22 ], [ %.0.i5, %main_wrap_around.exit6 ], [ %errno.0, %main_bb42 ], [ %errno.0, %main_bb43 ], [ %errno.0, %main_bb44 ]
  %pos.0 = phi i64 [ 0, %main_bb22 ], [ %pos.0, %main_wrap_around.exit6 ], [ %"119", %main_bb42 ], [ %"124", %main_bb44 ], [ %"114", %main_bb43 ]
  %"55" = icmp slt i64 %pos.0, 8, !dbg !147
  br i1 %"55", label %main_bb23, label %main_bb45, !dbg !147

main_bb23:                                        ; preds = %main_wrap_around.exit2
  %"56" = sub nsw i64 8, %pos.0, !dbg !93
  %"57" = icmp sgt i64 %"56", 2147483647, !dbg !149
  br i1 %"57", label %main_bb24, label %main_bb25, !dbg !149

main_bb24:                                        ; preds = %main_bb23
  %"58" = sub nsw i64 %"56", 2147483647, !dbg !150
  %"59" = sub nsw i64 %"58", 1, !dbg !150
  %"60" = srem i64 %"59", 4294967296, !dbg !150
  %"61" = add nsw i64 -2147483648, %"60", !dbg !150
  br label %main_wrap_around.exit, !dbg !150

main_bb25:                                        ; preds = %main_bb23
  %"62" = icmp slt i64 %"56", -2147483648, !dbg !151
  br i1 %"62", label %main_bb26, label %main_wrap_around.exit, !dbg !151

main_bb26:                                        ; preds = %main_bb25
  %"63" = sub nsw i64 -2147483648, %"56", !dbg !152
  %"64" = sub nsw i64 %"63", 1, !dbg !152
  %"65" = srem i64 %"64", 4294967296, !dbg !152
  %"66" = sub nsw i64 2147483647, %"65", !dbg !152
  br label %main_wrap_around.exit, !dbg !152

main_wrap_around.exit:                            ; preds = %main_bb24, %main_bb25, %main_bb26
  %.0.i = phi i64 [ %"61", %main_bb24 ], [ %"66", %main_bb26 ], [ %"56", %main_bb25 ], !dbg !93
  %"67" = icmp eq i64 %"54", 1, !dbg !112
  br i1 %"67", label %main_read.exit, label %main_wrap_around.exit2.i, !dbg !112

main_wrap_around.exit2.i:                         ; preds = %main_bb33, %main_bb32, %main_bb31, %main_wrap_around.exit
  %count.0.i = phi i64 [ 0, %main_wrap_around.exit ], [ %.0.i3.i, %main_bb31 ], [ %.0.i3.i, %main_bb32 ], [ %.0.i3.i, %main_bb33 ], !dbg !106
  %.06.i = phi i64 [ %pos.0, %main_wrap_around.exit ], [ %"85", %main_bb31 ], [ %"90", %main_bb33 ], [ %"80", %main_bb32 ], !dbg !106
  %"68" = icmp slt i64 %.06.i, %.0.i, !dbg !153
  br i1 %"68", label %main_bb27, label %main_read.exit, !dbg !153

main_bb27:                                        ; preds = %main_wrap_around.exit2.i
  %"69" = add nsw i64 %count.0.i, 1, !dbg !154
  %"70" = icmp sgt i64 %"69", 2147483647, !dbg !155
  br i1 %"70", label %main_bb28, label %main_bb29, !dbg !155

main_bb28:                                        ; preds = %main_bb27
  %"71" = sub nsw i64 %"69", 2147483647, !dbg !156
  %"72" = sub nsw i64 %"71", 1, !dbg !156
  %"73" = srem i64 %"72", 4294967296, !dbg !156
  %"74" = add nsw i64 -2147483648, %"73", !dbg !156
  br label %main_wrap_around.exit4.i, !dbg !156

main_bb29:                                        ; preds = %main_bb27
  %"75" = icmp slt i64 %"69", -2147483648, !dbg !157
  br i1 %"75", label %main_bb30, label %main_wrap_around.exit4.i, !dbg !157

main_bb30:                                        ; preds = %main_bb29
  %"76" = sub nsw i64 -2147483648, %"69", !dbg !158
  %"77" = sub nsw i64 %"76", 1, !dbg !158
  %"78" = srem i64 %"77", 4294967296, !dbg !158
  %"79" = sub nsw i64 2147483647, %"78", !dbg !158
  br label %main_wrap_around.exit4.i, !dbg !158

main_wrap_around.exit4.i:                         ; preds = %main_bb30, %main_bb29, %main_bb28
  %.0.i3.i = phi i64 [ %"74", %main_bb28 ], [ %"79", %main_bb30 ], [ %"69", %main_bb29 ], !dbg !154
  %"80" = add nsw i64 %.06.i, 1, !dbg !159
  %"81" = icmp sgt i64 %"80", 2147483647, !dbg !160
  br i1 %"81", label %main_bb31, label %main_bb32, !dbg !160

main_bb31:                                        ; preds = %main_wrap_around.exit4.i
  %"82" = sub nsw i64 %"80", 2147483647, !dbg !161
  %"83" = sub nsw i64 %"82", 1, !dbg !161
  %"84" = srem i64 %"83", 4294967296, !dbg !161
  %"85" = add nsw i64 -2147483648, %"84", !dbg !161
  br label %main_wrap_around.exit2.i, !dbg !161

main_bb32:                                        ; preds = %main_wrap_around.exit4.i
  %"86" = icmp slt i64 %"80", -2147483648, !dbg !162
  br i1 %"86", label %main_bb33, label %main_wrap_around.exit2.i, !dbg !162

main_bb33:                                        ; preds = %main_bb32
  %"87" = sub nsw i64 -2147483648, %"80", !dbg !163
  %"88" = sub nsw i64 %"87", 1, !dbg !163
  %"89" = srem i64 %"88", 4294967296, !dbg !163
  %"90" = sub nsw i64 2147483647, %"89", !dbg !163
  br label %main_wrap_around.exit2.i, !dbg !163

main_read.exit:                                   ; preds = %main_wrap_around.exit, %main_wrap_around.exit2.i
  %.0.i7 = phi i64 [ 0, %main_wrap_around.exit ], [ %count.0.i, %main_wrap_around.exit2.i ], !dbg !106
  br label %main_NodeBlock

main_NodeBlock:                                   ; preds = %main_read.exit
  %Pivot = icmp slt i64 %.0.i7, 0
  br i1 %Pivot, label %main_LeafBlock, label %main_LeafBlock8

main_LeafBlock:                                   ; preds = %main_NodeBlock
  %SwitchLeaf = icmp eq i64 %.0.i7, -1
  br i1 %SwitchLeaf, label %main_bb34, label %main_NewDefault

main_bb34:                                        ; preds = %main_LeafBlock
  %"91" = add nsw i64 %errno.0, 1, !dbg !116
  %"92" = icmp sgt i64 %"91", 2147483647, !dbg !164
  br i1 %"92", label %main_bb35, label %main_bb36, !dbg !164

main_bb35:                                        ; preds = %main_bb34
  %"93" = sub nsw i64 %"91", 2147483647, !dbg !165
  %"94" = sub nsw i64 %"93", 1, !dbg !165
  %"95" = srem i64 %"94", 4294967296, !dbg !165
  %"96" = add nsw i64 -2147483648, %"95", !dbg !165
  br label %main_wrap_around.exit6, !dbg !165

main_bb36:                                        ; preds = %main_bb34
  %"97" = icmp slt i64 %"91", -2147483648, !dbg !166
  br i1 %"97", label %main_bb37, label %main_wrap_around.exit6, !dbg !166

main_bb37:                                        ; preds = %main_bb36
  %"98" = sub nsw i64 -2147483648, %"91", !dbg !167
  %"99" = sub nsw i64 %"98", 1, !dbg !167
  %"100" = srem i64 %"99", 4294967296, !dbg !167
  %"101" = sub nsw i64 2147483647, %"100", !dbg !167
  br label %main_wrap_around.exit6, !dbg !167

main_wrap_around.exit6:                           ; preds = %main_bb35, %main_bb36, %main_bb37
  %.0.i5 = phi i64 [ %"96", %main_bb35 ], [ %"101", %main_bb37 ], [ %"91", %main_bb36 ], !dbg !116
  %"102" = icmp eq i64 %.0.i5, 5, !dbg !168
  br i1 %"102", label %main_bb45, label %main_wrap_around.exit2, !dbg !168

main_LeafBlock8:                                  ; preds = %main_NodeBlock
  %SwitchLeaf9 = icmp eq i64 %.0.i7, 0
  br i1 %SwitchLeaf9, label %main_bb38, label %main_NewDefault

main_bb38:                                        ; preds = %main_LeafBlock8
  %"103" = add nsw i64 %.0.i7, 1, !dbg !127
  %"104" = icmp sgt i64 %"103", 2147483647, !dbg !170
  br i1 %"104", label %main_bb39, label %main_bb40, !dbg !170

main_bb39:                                        ; preds = %main_bb38
  %"105" = sub nsw i64 %"103", 2147483647, !dbg !171
  %"106" = sub nsw i64 %"105", 1, !dbg !171
  %"107" = srem i64 %"106", 4294967296, !dbg !171
  %"108" = add nsw i64 -2147483648, %"107", !dbg !171
  br label %main_wrap_around.exit4, !dbg !171

main_bb40:                                        ; preds = %main_bb38
  %"109" = icmp slt i64 %"103", -2147483648, !dbg !172
  br i1 %"109", label %main_bb41, label %main_wrap_around.exit4, !dbg !172

main_bb41:                                        ; preds = %main_bb40
  %"110" = sub nsw i64 -2147483648, %"103", !dbg !173
  %"111" = sub nsw i64 %"110", 1, !dbg !173
  %"112" = srem i64 %"111", 4294967296, !dbg !173
  %"113" = sub nsw i64 2147483647, %"112", !dbg !173
  br label %main_wrap_around.exit4, !dbg !173

main_NewDefault:                                  ; preds = %main_LeafBlock8, %main_LeafBlock
  br label %main_wrap_around.exit4

main_wrap_around.exit4:                           ; preds = %main_NewDefault, %main_bb41, %main_bb40, %main_bb39
  %rc.0 = phi i64 [ %.0.i7, %main_NewDefault ], [ %"108", %main_bb39 ], [ %"113", %main_bb41 ], [ %"103", %main_bb40 ]
  %"114" = add nsw i64 %pos.0, %rc.0, !dbg !138
  %"115" = icmp sgt i64 %"114", 2147483647, !dbg !174
  br i1 %"115", label %main_bb42, label %main_bb43, !dbg !174

main_bb42:                                        ; preds = %main_wrap_around.exit4
  %"116" = sub nsw i64 %"114", 2147483647, !dbg !175
  %"117" = sub nsw i64 %"116", 1, !dbg !175
  %"118" = srem i64 %"117", 4294967296, !dbg !175
  %"119" = add nsw i64 -2147483648, %"118", !dbg !175
  br label %main_wrap_around.exit2, !dbg !175

main_bb43:                                        ; preds = %main_wrap_around.exit4
  %"120" = icmp slt i64 %"114", -2147483648, !dbg !176
  br i1 %"120", label %main_bb44, label %main_wrap_around.exit2, !dbg !176

main_bb44:                                        ; preds = %main_bb43
  %"121" = sub nsw i64 -2147483648, %"114", !dbg !177
  %"122" = sub nsw i64 %"121", 1, !dbg !177
  %"123" = srem i64 %"122", 4294967296, !dbg !177
  %"124" = sub nsw i64 2147483647, %"123", !dbg !177
  br label %main_wrap_around.exit2, !dbg !177

main_bb45:                                        ; preds = %main_wrap_around.exit2, %main_wrap_around.exit6, %main_bb21
  ret i32 0, !dbg !178
}

declare i64 @__kittel_nondef.0()

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

declare i32 @__kittel_nondef.1()

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!18, !19}
!llvm.ident = !{!20}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !16, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [//FILES_DIR/SourceCode_SemanticAugmentor.c] [DW_LANG_C99]
!1 = metadata !{metadata !"FILES_DIR/SourceCode_SemanticAugmentor.c", metadata !"/"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9, metadata !12}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"wrap_around", metadata !"wrap_around", metadata !"", i32 33, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i64, i64, i64)* @wrap_around, null, null, metadata !2, i32 33} ; [ DW_TAG_subprogram ] [line 33] [def] [wrap_around]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"read", metadata !"read", metadata !"", i32 43, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i64, i64)* @read, null, null, metadata !2, i32 44} ; [ DW_TAG_subprogram ] [line 43] [def] [scope 44] [read]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !8, metadata !8, metadata !8}
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 79, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 80} ; [ DW_TAG_subprogram ] [line 79] [def] [scope 80] [main]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{metadata !15}
!15 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!16 = metadata !{metadata !17}
!17 = metadata !{i32 786484, i32 0, null, metadata !"flag", metadata !"flag", metadata !"", metadata !5, i32 32, metadata !8, i32 0, i32 1, i64* @"'flag", null} ; [ DW_TAG_variable ] [flag] [line 32] [def]
!18 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!19 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!20 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!21 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777249, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 33]
!22 = metadata !{i32 33, i32 33, metadata !4, null}
!23 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554465, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [lower_bound] [line 33]
!24 = metadata !{i32 33, i32 50, metadata !4, null}
!25 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331681, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [upper_bound] [line 33]
!26 = metadata !{i32 33, i32 73, metadata !4, null}
!27 = metadata !{i32 34, i32 5, metadata !4, null}
!28 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 34, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [range] [line 34]
!29 = metadata !{i32 34, i32 15, metadata !4, null}
!30 = metadata !{i32 35, i32 9, metadata !31, null}
!31 = metadata !{i32 786443, metadata !1, metadata !4, i32 35, i32 9, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!32 = metadata !{i32 36, i32 9, metadata !33, null}
!33 = metadata !{i32 786443, metadata !1, metadata !31, i32 35, i32 30, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!34 = metadata !{i32 38, i32 14, metadata !35, null}
!35 = metadata !{i32 786443, metadata !1, metadata !31, i32 38, i32 14, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!36 = metadata !{i32 39, i32 9, metadata !37, null}
!37 = metadata !{i32 786443, metadata !1, metadata !35, i32 38, i32 35, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!38 = metadata !{i32 42, i32 1, metadata !4, null}
!39 = metadata !{i32 786689, metadata !9, metadata !"loc", metadata !5, i32 16777259, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [loc] [line 43]
!40 = metadata !{i32 43, i32 27, metadata !9, null}
!41 = metadata !{i32 786689, metadata !9, metadata !"len", metadata !5, i32 33554475, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 43]
!42 = metadata !{i32 43, i32 43, metadata !9, null}
!43 = metadata !{i64 0}
!44 = metadata !{i32 786688, metadata !9, metadata !"count", metadata !5, i32 45, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 45]
!45 = metadata !{i32 45, i32 15, metadata !9, null}
!46 = metadata !{i32 46, i32 9, metadata !47, null}
!47 = metadata !{i32 786443, metadata !1, metadata !9, i32 46, i32 9, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!48 = metadata !{i32 50, i32 5, metadata !49, null}
!49 = metadata !{i32 786443, metadata !1, metadata !9, i32 50, i32 5, i32 1, i32 24} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!50 = metadata !{i32 53, i32 13, metadata !51, null}
!51 = metadata !{i32 786443, metadata !1, metadata !52, i32 53, i32 13, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!52 = metadata !{i32 786443, metadata !1, metadata !9, i32 51, i32 5, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!53 = metadata !{i32 59, i32 17, metadata !54, null}
!54 = metadata !{i32 786443, metadata !1, metadata !55, i32 59, i32 17, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!55 = metadata !{i32 786443, metadata !1, metadata !51, i32 58, i32 9, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!56 = metadata !{i32 61, i32 24, metadata !57, null}
!57 = metadata !{i32 786443, metadata !1, metadata !54, i32 60, i32 1, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!58 = metadata !{i32 35, i32 9, metadata !31, metadata !56}
!59 = metadata !{i32 36, i32 9, metadata !33, metadata !56}
!60 = metadata !{i32 38, i32 14, metadata !35, metadata !56}
!61 = metadata !{i32 39, i32 9, metadata !37, metadata !56}
!62 = metadata !{i32 63, i32 19, metadata !55, null}
!63 = metadata !{i32 64, i32 22, metadata !55, null}
!64 = metadata !{i32 35, i32 9, metadata !31, metadata !63}
!65 = metadata !{i32 36, i32 9, metadata !33, metadata !63}
!66 = metadata !{i32 38, i32 14, metadata !35, metadata !63}
!67 = metadata !{i32 39, i32 9, metadata !37, metadata !63}
!68 = metadata !{i32 65, i32 17, metadata !69, null}
!69 = metadata !{i32 786443, metadata !1, metadata !55, i32 65, i32 17, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!70 = metadata !{i32 67, i32 24, metadata !71, null}
!71 = metadata !{i32 786443, metadata !1, metadata !69, i32 66, i32 13, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!72 = metadata !{i32 35, i32 9, metadata !31, metadata !70}
!73 = metadata !{i32 36, i32 9, metadata !33, metadata !70}
!74 = metadata !{i32 38, i32 14, metadata !35, metadata !70}
!75 = metadata !{i32 39, i32 9, metadata !37, metadata !70}
!76 = metadata !{i32 72, i32 17, metadata !77, null}
!77 = metadata !{i32 786443, metadata !1, metadata !69, i32 71, i32 13, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!78 = metadata !{i32 73, i32 17, metadata !77, null}
!79 = metadata !{i32 78, i32 1, metadata !9, null}
!80 = metadata !{i32 786688, metadata !12, metadata !"pos", metadata !5, i32 81, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pos] [line 81]
!81 = metadata !{i32 81, i32 15, metadata !12, null}
!82 = metadata !{i64 8}
!83 = metadata !{i32 786688, metadata !12, metadata !"size", metadata !5, i32 82, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [size] [line 82]
!84 = metadata !{i32 82, i32 15, metadata !12, null}
!85 = metadata !{i32 83, i32 5, metadata !12, null}
!86 = metadata !{i32 786688, metadata !12, metadata !"errno", metadata !5, i32 84, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [errno] [line 84]
!87 = metadata !{i32 84, i32 15, metadata !12, null}
!88 = metadata !{i32 85, i32 9, metadata !89, null}
!89 = metadata !{i32 786443, metadata !1, metadata !12, i32 85, i32 9, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!90 = metadata !{i32 85, i32 9, metadata !91, null}
!91 = metadata !{i32 786443, metadata !1, metadata !89, i32 85, i32 9, i32 1, i32 25} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!92 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777249, metadata !8, i32 0, metadata !93} ; [ DW_TAG_arg_variable ] [value] [line 33]
!93 = metadata !{i32 91, i32 35, metadata !94, null}
!94 = metadata !{i32 786443, metadata !1, metadata !12, i32 90, i32 5, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!95 = metadata !{i32 33, i32 33, metadata !4, metadata !93}
!96 = metadata !{i64 -2147483648}
!97 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554465, metadata !8, i32 0, metadata !93} ; [ DW_TAG_arg_variable ] [lower_bound] [line 33]
!98 = metadata !{i32 33, i32 50, metadata !4, metadata !93}
!99 = metadata !{i64 2147483647}
!100 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331681, metadata !8, i32 0, metadata !93} ; [ DW_TAG_arg_variable ] [upper_bound] [line 33]
!101 = metadata !{i32 33, i32 73, metadata !4, metadata !93}
!102 = metadata !{i64 4294967296}
!103 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 34, metadata !8, i32 0, metadata !93} ; [ DW_TAG_auto_variable ] [range] [line 34]
!104 = metadata !{i32 34, i32 15, metadata !4, metadata !93}
!105 = metadata !{i32 786689, metadata !9, metadata !"loc", metadata !5, i32 16777259, metadata !8, i32 0, metadata !106} ; [ DW_TAG_arg_variable ] [loc] [line 43]
!106 = metadata !{i32 91, i32 24, metadata !94, null}
!107 = metadata !{i32 43, i32 27, metadata !9, metadata !106}
!108 = metadata !{i32 786689, metadata !9, metadata !"len", metadata !5, i32 33554475, metadata !8, i32 0, metadata !106} ; [ DW_TAG_arg_variable ] [len] [line 43]
!109 = metadata !{i32 43, i32 43, metadata !9, metadata !106}
!110 = metadata !{i32 786688, metadata !9, metadata !"count", metadata !5, i32 45, metadata !8, i32 0, metadata !106} ; [ DW_TAG_auto_variable ] [count] [line 45]
!111 = metadata !{i32 45, i32 15, metadata !9, metadata !106}
!112 = metadata !{i32 46, i32 9, metadata !47, metadata !106}
!113 = metadata !{i32 786688, metadata !94, metadata !"rc", metadata !5, i32 91, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rc] [line 91]
!114 = metadata !{i32 91, i32 19, metadata !94, null}
!115 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777249, metadata !8, i32 0, metadata !116} ; [ DW_TAG_arg_variable ] [value] [line 33]
!116 = metadata !{i32 94, i32 22, metadata !117, null}
!117 = metadata !{i32 786443, metadata !1, metadata !118, i32 93, i32 9, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!118 = metadata !{i32 786443, metadata !1, metadata !94, i32 92, i32 13, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!119 = metadata !{i32 33, i32 33, metadata !4, metadata !116}
!120 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554465, metadata !8, i32 0, metadata !116} ; [ DW_TAG_arg_variable ] [lower_bound] [line 33]
!121 = metadata !{i32 33, i32 50, metadata !4, metadata !116}
!122 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331681, metadata !8, i32 0, metadata !116} ; [ DW_TAG_arg_variable ] [upper_bound] [line 33]
!123 = metadata !{i32 33, i32 73, metadata !4, metadata !116}
!124 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 34, metadata !8, i32 0, metadata !116} ; [ DW_TAG_auto_variable ] [range] [line 34]
!125 = metadata !{i32 34, i32 15, metadata !4, metadata !116}
!126 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777249, metadata !8, i32 0, metadata !127} ; [ DW_TAG_arg_variable ] [value] [line 33]
!127 = metadata !{i32 103, i32 19, metadata !128, null}
!128 = metadata !{i32 786443, metadata !1, metadata !129, i32 102, i32 1, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!129 = metadata !{i32 786443, metadata !1, metadata !94, i32 101, i32 13, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!130 = metadata !{i32 33, i32 33, metadata !4, metadata !127}
!131 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554465, metadata !8, i32 0, metadata !127} ; [ DW_TAG_arg_variable ] [lower_bound] [line 33]
!132 = metadata !{i32 33, i32 50, metadata !4, metadata !127}
!133 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331681, metadata !8, i32 0, metadata !127} ; [ DW_TAG_arg_variable ] [upper_bound] [line 33]
!134 = metadata !{i32 33, i32 73, metadata !4, metadata !127}
!135 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 34, metadata !8, i32 0, metadata !127} ; [ DW_TAG_auto_variable ] [range] [line 34]
!136 = metadata !{i32 34, i32 15, metadata !4, metadata !127}
!137 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777249, metadata !8, i32 0, metadata !138} ; [ DW_TAG_arg_variable ] [value] [line 33]
!138 = metadata !{i32 105, i32 15, metadata !94, null}
!139 = metadata !{i32 33, i32 33, metadata !4, metadata !138}
!140 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554465, metadata !8, i32 0, metadata !138} ; [ DW_TAG_arg_variable ] [lower_bound] [line 33]
!141 = metadata !{i32 33, i32 50, metadata !4, metadata !138}
!142 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331681, metadata !8, i32 0, metadata !138} ; [ DW_TAG_arg_variable ] [upper_bound] [line 33]
!143 = metadata !{i32 33, i32 73, metadata !4, metadata !138}
!144 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 34, metadata !8, i32 0, metadata !138} ; [ DW_TAG_auto_variable ] [range] [line 34]
!145 = metadata !{i32 34, i32 15, metadata !4, metadata !138}
!146 = metadata !{i32 89, i32 5, metadata !12, null}
!147 = metadata !{i32 89, i32 5, metadata !148, null}
!148 = metadata !{i32 786443, metadata !1, metadata !12, i32 89, i32 5, i32 1, i32 26} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!149 = metadata !{i32 35, i32 9, metadata !31, metadata !93}
!150 = metadata !{i32 36, i32 9, metadata !33, metadata !93}
!151 = metadata !{i32 38, i32 14, metadata !35, metadata !93}
!152 = metadata !{i32 39, i32 9, metadata !37, metadata !93}
!153 = metadata !{i32 50, i32 5, metadata !49, metadata !106}
!154 = metadata !{i32 64, i32 22, metadata !55, metadata !106}
!155 = metadata !{i32 35, i32 9, metadata !31, metadata !154}
!156 = metadata !{i32 36, i32 9, metadata !33, metadata !154}
!157 = metadata !{i32 38, i32 14, metadata !35, metadata !154}
!158 = metadata !{i32 39, i32 9, metadata !37, metadata !154}
!159 = metadata !{i32 67, i32 24, metadata !71, metadata !106}
!160 = metadata !{i32 35, i32 9, metadata !31, metadata !159}
!161 = metadata !{i32 36, i32 9, metadata !33, metadata !159}
!162 = metadata !{i32 38, i32 14, metadata !35, metadata !159}
!163 = metadata !{i32 39, i32 9, metadata !37, metadata !159}
!164 = metadata !{i32 35, i32 9, metadata !31, metadata !116}
!165 = metadata !{i32 36, i32 9, metadata !33, metadata !116}
!166 = metadata !{i32 38, i32 14, metadata !35, metadata !116}
!167 = metadata !{i32 39, i32 9, metadata !37, metadata !116}
!168 = metadata !{i32 95, i32 17, metadata !169, null}
!169 = metadata !{i32 786443, metadata !1, metadata !117, i32 95, i32 17, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!170 = metadata !{i32 35, i32 9, metadata !31, metadata !127}
!171 = metadata !{i32 36, i32 9, metadata !33, metadata !127}
!172 = metadata !{i32 38, i32 14, metadata !35, metadata !127}
!173 = metadata !{i32 39, i32 9, metadata !37, metadata !127}
!174 = metadata !{i32 35, i32 9, metadata !31, metadata !138}
!175 = metadata !{i32 36, i32 9, metadata !33, metadata !138}
!176 = metadata !{i32 38, i32 14, metadata !35, metadata !138}
!177 = metadata !{i32 39, i32 9, metadata !37, metadata !138}
!178 = metadata !{i32 108, i32 1, metadata !12, null}

