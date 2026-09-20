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
  %.0 = phi i64 [ %loc, %read_slice_1_bb5 ], [ %"46", %read_slice_1_bb16 ], [ %"51", %read_slice_1_bb18 ], [ %"41", %read_slice_1_bb17 ]
  %"14" = icmp slt i64 %.0, %len, !dbg !47
  br i1 %"14", label %read_slice_1_bb6, label %read_slice_1_bb20, !dbg !47

read_slice_1_bb6:                                 ; preds = %read_slice_1_wrap_around.exit2
  %"15" = icmp eq i64 500, 0, !dbg !49
  br i1 %"15", label %read_slice_1_bb20, label %read_slice_1_bb7, !dbg !49

read_slice_1_bb7:                                 ; preds = %read_slice_1_bb6
  %"16" = icmp slt i64 500, 0, !dbg !52
  br i1 %"16", label %read_slice_1_bb8, label %read_slice_1_wrap_around.exit, !dbg !52

read_slice_1_bb8:                                 ; preds = %read_slice_1_bb7
  %"17" = sub nsw i64 0, 500, !dbg !55
  %"18" = icmp sgt i64 %"17", 2147483647, !dbg !57
  br i1 %"18", label %read_slice_1_bb9, label %read_slice_1_bb10, !dbg !57

read_slice_1_bb9:                                 ; preds = %read_slice_1_bb8
  %"19" = sub nsw i64 %"17", 2147483647, !dbg !58
  %"20" = sub nsw i64 %"19", 1, !dbg !58
  %"21" = srem i64 %"20", 4294967296, !dbg !58
  %"22" = add nsw i64 -2147483648, %"21", !dbg !58
  br label %read_slice_1_wrap_around.exit, !dbg !58

read_slice_1_bb10:                                ; preds = %read_slice_1_bb8
  %"23" = icmp slt i64 %"17", -2147483648, !dbg !59
  br i1 %"23", label %read_slice_1_bb11, label %read_slice_1_wrap_around.exit, !dbg !59

read_slice_1_bb11:                                ; preds = %read_slice_1_bb10
  %"24" = sub nsw i64 -2147483648, %"17", !dbg !60
  %"25" = sub nsw i64 %"24", 1, !dbg !60
  %"26" = srem i64 %"25", 4294967296, !dbg !60
  %"27" = sub nsw i64 2147483647, %"26", !dbg !60
  br label %read_slice_1_wrap_around.exit, !dbg !60

read_slice_1_wrap_around.exit:                    ; preds = %read_slice_1_bb11, %read_slice_1_bb10, %read_slice_1_bb9, %read_slice_1_bb7
  %num.0 = phi i64 [ 500, %read_slice_1_bb7 ], [ %"22", %read_slice_1_bb9 ], [ %"27", %read_slice_1_bb11 ], [ %"17", %read_slice_1_bb10 ]
  %"28" = srem i64 %num.0, 1000, !dbg !61
  %"29" = add nsw i64 %count.0, 1, !dbg !62
  %"30" = icmp sgt i64 %"29", 2147483647, !dbg !63
  br i1 %"30", label %read_slice_1_bb12, label %read_slice_1_bb13, !dbg !63

read_slice_1_bb12:                                ; preds = %read_slice_1_wrap_around.exit
  %"31" = sub nsw i64 %"29", 2147483647, !dbg !64
  %"32" = sub nsw i64 %"31", 1, !dbg !64
  %"33" = srem i64 %"32", 4294967296, !dbg !64
  %"34" = add nsw i64 -2147483648, %"33", !dbg !64
  br label %read_slice_1_wrap_around.exit4, !dbg !64

read_slice_1_bb13:                                ; preds = %read_slice_1_wrap_around.exit
  %"35" = icmp slt i64 %"29", -2147483648, !dbg !65
  br i1 %"35", label %read_slice_1_bb14, label %read_slice_1_wrap_around.exit4, !dbg !65

read_slice_1_bb14:                                ; preds = %read_slice_1_bb13
  %"36" = sub nsw i64 -2147483648, %"29", !dbg !66
  %"37" = sub nsw i64 %"36", 1, !dbg !66
  %"38" = srem i64 %"37", 4294967296, !dbg !66
  %"39" = sub nsw i64 2147483647, %"38", !dbg !66
  br label %read_slice_1_wrap_around.exit4, !dbg !66

read_slice_1_wrap_around.exit4:                   ; preds = %read_slice_1_bb12, %read_slice_1_bb13, %read_slice_1_bb14
  %.0.i3 = phi i64 [ %"34", %read_slice_1_bb12 ], [ %"39", %read_slice_1_bb14 ], [ %"29", %read_slice_1_bb13 ], !dbg !62
  %"40" = icmp slt i64 %"28", 995, !dbg !67
  br i1 %"40", label %read_slice_1_bb15, label %read_slice_1_bb19, !dbg !67

read_slice_1_bb15:                                ; preds = %read_slice_1_wrap_around.exit4
  %"41" = add nsw i64 %.0, 1, !dbg !69
  %"42" = icmp sgt i64 %"41", 2147483647, !dbg !71
  br i1 %"42", label %read_slice_1_bb16, label %read_slice_1_bb17, !dbg !71

read_slice_1_bb16:                                ; preds = %read_slice_1_bb15
  %"43" = sub nsw i64 %"41", 2147483647, !dbg !72
  %"44" = sub nsw i64 %"43", 1, !dbg !72
  %"45" = srem i64 %"44", 4294967296, !dbg !72
  %"46" = add nsw i64 -2147483648, %"45", !dbg !72
  br label %read_slice_1_wrap_around.exit2, !dbg !72

read_slice_1_bb17:                                ; preds = %read_slice_1_bb15
  %"47" = icmp slt i64 %"41", -2147483648, !dbg !73
  br i1 %"47", label %read_slice_1_bb18, label %read_slice_1_wrap_around.exit2, !dbg !73

read_slice_1_bb18:                                ; preds = %read_slice_1_bb17
  %"48" = sub nsw i64 -2147483648, %"41", !dbg !74
  %"49" = sub nsw i64 %"48", 1, !dbg !74
  %"50" = srem i64 %"49", 4294967296, !dbg !74
  %"51" = sub nsw i64 2147483647, %"50", !dbg !74
  br label %read_slice_1_wrap_around.exit2, !dbg !74

read_slice_1_bb19:                                ; preds = %read_slice_1_wrap_around.exit4
  store i64 1, i64* @"'flag", align 8, !dbg !75
  call void @llvm.dbg.value(metadata !{i64 %.0.i3}, i64 0, metadata !77), !dbg !78
  br label %read_slice_1_bb20, !dbg !79

read_slice_1_bb20:                                ; preds = %read_slice_1_wrap_around.exit2, %read_slice_1_bb6, %read_slice_1_bb5, %read_slice_1_bb19
  %__retres.0 = phi i64 [ %.0.i3, %read_slice_1_bb19 ], [ 0, %read_slice_1_bb5 ], [ -1, %read_slice_1_bb6 ], [ %count.0, %read_slice_1_wrap_around.exit2 ]
  ret i64 %__retres.0, !dbg !80
}

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb21:
  call void @llvm.dbg.value(metadata !42, i64 0, metadata !81), !dbg !82
  call void @llvm.dbg.value(metadata !83, i64 0, metadata !84), !dbg !85
  store i64 0, i64* @"'flag", align 8, !dbg !86
  call void @llvm.dbg.value(metadata !42, i64 0, metadata !87), !dbg !88
  %"52" = icmp sle i64 70000, 0, !dbg !89
  %"53" = icmp sgt i64 70000, 65536, !dbg !91
  %or.cond = or i1 %"52", %"53", !dbg !89
  br i1 %or.cond, label %main_bb45, label %main_bb22, !dbg !89

main_bb22:                                        ; preds = %main_bb21
  call void @llvm.dbg.value(metadata !{i64 %"56"}, i64 0, metadata !93), !dbg !96
  call void @llvm.dbg.value(metadata !97, i64 0, metadata !98), !dbg !99
  call void @llvm.dbg.value(metadata !100, i64 0, metadata !101), !dbg !102
  call void @llvm.dbg.value(metadata !103, i64 0, metadata !104), !dbg !105
  call void @llvm.dbg.value(metadata !{i64 %pos.0}, i64 0, metadata !106), !dbg !108
  call void @llvm.dbg.value(metadata !{i64 %.0.i}, i64 0, metadata !109), !dbg !110
  call void @llvm.dbg.value(metadata !42, i64 0, metadata !111), !dbg !112
  %"54" = load i64* @"'flag", align 8, !dbg !113
  call void @llvm.dbg.value(metadata !{i64 %__retres.0.i}, i64 0, metadata !114), !dbg !115
  call void @llvm.dbg.value(metadata !{i64 %"91"}, i64 0, metadata !116), !dbg !120
  call void @llvm.dbg.value(metadata !97, i64 0, metadata !121), !dbg !122
  call void @llvm.dbg.value(metadata !100, i64 0, metadata !123), !dbg !124
  call void @llvm.dbg.value(metadata !103, i64 0, metadata !125), !dbg !126
  call void @llvm.dbg.value(metadata !{i64 %.0.i5}, i64 0, metadata !87), !dbg !88
  call void @llvm.dbg.value(metadata !{i64 %"103"}, i64 0, metadata !127), !dbg !131
  call void @llvm.dbg.value(metadata !97, i64 0, metadata !132), !dbg !133
  call void @llvm.dbg.value(metadata !100, i64 0, metadata !134), !dbg !135
  call void @llvm.dbg.value(metadata !103, i64 0, metadata !136), !dbg !137
  call void @llvm.dbg.value(metadata !{i64 %"114"}, i64 0, metadata !138), !dbg !140
  call void @llvm.dbg.value(metadata !97, i64 0, metadata !141), !dbg !142
  call void @llvm.dbg.value(metadata !100, i64 0, metadata !143), !dbg !144
  call void @llvm.dbg.value(metadata !103, i64 0, metadata !145), !dbg !146
  br label %main_wrap_around.exit2, !dbg !147

main_wrap_around.exit2:                           ; preds = %main_bb44, %main_bb43, %main_bb42, %main_wrap_around.exit6, %main_bb22
  %__fc_errno_0.0 = phi i64 [ 0, %main_bb22 ], [ %.0.i5, %main_wrap_around.exit6 ], [ %__fc_errno_0.0, %main_bb42 ], [ %__fc_errno_0.0, %main_bb43 ], [ %__fc_errno_0.0, %main_bb44 ]
  %pos.0 = phi i64 [ 0, %main_bb22 ], [ %pos.0, %main_wrap_around.exit6 ], [ %"119", %main_bb42 ], [ %"124", %main_bb44 ], [ %"114", %main_bb43 ]
  %"55" = icmp slt i64 %pos.0, 70000, !dbg !148
  br i1 %"55", label %main_bb23, label %main_bb45, !dbg !148

main_bb23:                                        ; preds = %main_wrap_around.exit2
  %"56" = sub nsw i64 70000, %pos.0, !dbg !94
  %"57" = icmp sgt i64 %"56", 2147483647, !dbg !150
  br i1 %"57", label %main_bb24, label %main_bb25, !dbg !150

main_bb24:                                        ; preds = %main_bb23
  %"58" = sub nsw i64 %"56", 2147483647, !dbg !151
  %"59" = sub nsw i64 %"58", 1, !dbg !151
  %"60" = srem i64 %"59", 4294967296, !dbg !151
  %"61" = add nsw i64 -2147483648, %"60", !dbg !151
  br label %main_wrap_around.exit, !dbg !151

main_bb25:                                        ; preds = %main_bb23
  %"62" = icmp slt i64 %"56", -2147483648, !dbg !152
  br i1 %"62", label %main_bb26, label %main_wrap_around.exit, !dbg !152

main_bb26:                                        ; preds = %main_bb25
  %"63" = sub nsw i64 -2147483648, %"56", !dbg !153
  %"64" = sub nsw i64 %"63", 1, !dbg !153
  %"65" = srem i64 %"64", 4294967296, !dbg !153
  %"66" = sub nsw i64 2147483647, %"65", !dbg !153
  br label %main_wrap_around.exit, !dbg !153

main_wrap_around.exit:                            ; preds = %main_bb24, %main_bb25, %main_bb26
  %.0.i = phi i64 [ %"61", %main_bb24 ], [ %"66", %main_bb26 ], [ %"56", %main_bb25 ], !dbg !94
  %"67" = icmp eq i64 %"54", 1, !dbg !113
  br i1 %"67", label %main_read_slice_1.exit, label %main_wrap_around.exit2.i, !dbg !113

main_wrap_around.exit2.i:                         ; preds = %main_bb33, %main_bb32, %main_bb31, %main_wrap_around.exit
  %count.0.i = phi i64 [ 0, %main_wrap_around.exit ], [ %.0.i3.i, %main_bb31 ], [ %.0.i3.i, %main_bb32 ], [ %.0.i3.i, %main_bb33 ], !dbg !107
  %.0.i7 = phi i64 [ %pos.0, %main_wrap_around.exit ], [ %"85", %main_bb31 ], [ %"90", %main_bb33 ], [ %"80", %main_bb32 ], !dbg !107
  %"68" = icmp slt i64 %.0.i7, %.0.i, !dbg !154
  br i1 %"68", label %main_bb27, label %main_read_slice_1.exit, !dbg !154

main_bb27:                                        ; preds = %main_wrap_around.exit2.i
  %"69" = add nsw i64 %count.0.i, 1, !dbg !155
  %"70" = icmp sgt i64 %"69", 2147483647, !dbg !156
  br i1 %"70", label %main_bb28, label %main_bb29, !dbg !156

main_bb28:                                        ; preds = %main_bb27
  %"71" = sub nsw i64 %"69", 2147483647, !dbg !157
  %"72" = sub nsw i64 %"71", 1, !dbg !157
  %"73" = srem i64 %"72", 4294967296, !dbg !157
  %"74" = add nsw i64 -2147483648, %"73", !dbg !157
  br label %main_wrap_around.exit4.i, !dbg !157

main_bb29:                                        ; preds = %main_bb27
  %"75" = icmp slt i64 %"69", -2147483648, !dbg !158
  br i1 %"75", label %main_bb30, label %main_wrap_around.exit4.i, !dbg !158

main_bb30:                                        ; preds = %main_bb29
  %"76" = sub nsw i64 -2147483648, %"69", !dbg !159
  %"77" = sub nsw i64 %"76", 1, !dbg !159
  %"78" = srem i64 %"77", 4294967296, !dbg !159
  %"79" = sub nsw i64 2147483647, %"78", !dbg !159
  br label %main_wrap_around.exit4.i, !dbg !159

main_wrap_around.exit4.i:                         ; preds = %main_bb30, %main_bb29, %main_bb28
  %.0.i3.i = phi i64 [ %"74", %main_bb28 ], [ %"79", %main_bb30 ], [ %"69", %main_bb29 ], !dbg !155
  %"80" = add nsw i64 %.0.i7, 1, !dbg !160
  %"81" = icmp sgt i64 %"80", 2147483647, !dbg !161
  br i1 %"81", label %main_bb31, label %main_bb32, !dbg !161

main_bb31:                                        ; preds = %main_wrap_around.exit4.i
  %"82" = sub nsw i64 %"80", 2147483647, !dbg !162
  %"83" = sub nsw i64 %"82", 1, !dbg !162
  %"84" = srem i64 %"83", 4294967296, !dbg !162
  %"85" = add nsw i64 -2147483648, %"84", !dbg !162
  br label %main_wrap_around.exit2.i, !dbg !162

main_bb32:                                        ; preds = %main_wrap_around.exit4.i
  %"86" = icmp slt i64 %"80", -2147483648, !dbg !163
  br i1 %"86", label %main_bb33, label %main_wrap_around.exit2.i, !dbg !163

main_bb33:                                        ; preds = %main_bb32
  %"87" = sub nsw i64 -2147483648, %"80", !dbg !164
  %"88" = sub nsw i64 %"87", 1, !dbg !164
  %"89" = srem i64 %"88", 4294967296, !dbg !164
  %"90" = sub nsw i64 2147483647, %"89", !dbg !164
  br label %main_wrap_around.exit2.i, !dbg !164

main_read_slice_1.exit:                           ; preds = %main_wrap_around.exit, %main_wrap_around.exit2.i
  %__retres.0.i = phi i64 [ 0, %main_wrap_around.exit ], [ %count.0.i, %main_wrap_around.exit2.i ], !dbg !107
  br label %main_NodeBlock

main_NodeBlock:                                   ; preds = %main_read_slice_1.exit
  %Pivot = icmp slt i64 %__retres.0.i, 0
  br i1 %Pivot, label %main_LeafBlock, label %main_LeafBlock8

main_LeafBlock:                                   ; preds = %main_NodeBlock
  %SwitchLeaf = icmp eq i64 %__retres.0.i, -1
  br i1 %SwitchLeaf, label %main_bb34, label %main_NewDefault

main_bb34:                                        ; preds = %main_LeafBlock
  %"91" = add nsw i64 %__fc_errno_0.0, 1, !dbg !117
  %"92" = icmp sgt i64 %"91", 2147483647, !dbg !165
  br i1 %"92", label %main_bb35, label %main_bb36, !dbg !165

main_bb35:                                        ; preds = %main_bb34
  %"93" = sub nsw i64 %"91", 2147483647, !dbg !166
  %"94" = sub nsw i64 %"93", 1, !dbg !166
  %"95" = srem i64 %"94", 4294967296, !dbg !166
  %"96" = add nsw i64 -2147483648, %"95", !dbg !166
  br label %main_wrap_around.exit6, !dbg !166

main_bb36:                                        ; preds = %main_bb34
  %"97" = icmp slt i64 %"91", -2147483648, !dbg !167
  br i1 %"97", label %main_bb37, label %main_wrap_around.exit6, !dbg !167

main_bb37:                                        ; preds = %main_bb36
  %"98" = sub nsw i64 -2147483648, %"91", !dbg !168
  %"99" = sub nsw i64 %"98", 1, !dbg !168
  %"100" = srem i64 %"99", 4294967296, !dbg !168
  %"101" = sub nsw i64 2147483647, %"100", !dbg !168
  br label %main_wrap_around.exit6, !dbg !168

main_wrap_around.exit6:                           ; preds = %main_bb35, %main_bb36, %main_bb37
  %.0.i5 = phi i64 [ %"96", %main_bb35 ], [ %"101", %main_bb37 ], [ %"91", %main_bb36 ], !dbg !117
  %"102" = icmp eq i64 %.0.i5, 5, !dbg !169
  br i1 %"102", label %main_bb45, label %main_wrap_around.exit2, !dbg !169

main_LeafBlock8:                                  ; preds = %main_NodeBlock
  %SwitchLeaf9 = icmp eq i64 %__retres.0.i, 0
  br i1 %SwitchLeaf9, label %main_bb38, label %main_NewDefault

main_bb38:                                        ; preds = %main_LeafBlock8
  %"103" = add nsw i64 %__retres.0.i, 1, !dbg !128
  %"104" = icmp sgt i64 %"103", 2147483647, !dbg !171
  br i1 %"104", label %main_bb39, label %main_bb40, !dbg !171

main_bb39:                                        ; preds = %main_bb38
  %"105" = sub nsw i64 %"103", 2147483647, !dbg !172
  %"106" = sub nsw i64 %"105", 1, !dbg !172
  %"107" = srem i64 %"106", 4294967296, !dbg !172
  %"108" = add nsw i64 -2147483648, %"107", !dbg !172
  br label %main_wrap_around.exit4, !dbg !172

main_bb40:                                        ; preds = %main_bb38
  %"109" = icmp slt i64 %"103", -2147483648, !dbg !173
  br i1 %"109", label %main_bb41, label %main_wrap_around.exit4, !dbg !173

main_bb41:                                        ; preds = %main_bb40
  %"110" = sub nsw i64 -2147483648, %"103", !dbg !174
  %"111" = sub nsw i64 %"110", 1, !dbg !174
  %"112" = srem i64 %"111", 4294967296, !dbg !174
  %"113" = sub nsw i64 2147483647, %"112", !dbg !174
  br label %main_wrap_around.exit4, !dbg !174

main_NewDefault:                                  ; preds = %main_LeafBlock8, %main_LeafBlock
  br label %main_wrap_around.exit4

main_wrap_around.exit4:                           ; preds = %main_NewDefault, %main_bb41, %main_bb40, %main_bb39
  %rc.0 = phi i64 [ %__retres.0.i, %main_NewDefault ], [ %"108", %main_bb39 ], [ %"113", %main_bb41 ], [ %"103", %main_bb40 ]
  %"114" = add nsw i64 %pos.0, %rc.0, !dbg !139
  %"115" = icmp sgt i64 %"114", 2147483647, !dbg !175
  br i1 %"115", label %main_bb42, label %main_bb43, !dbg !175

main_bb42:                                        ; preds = %main_wrap_around.exit4
  %"116" = sub nsw i64 %"114", 2147483647, !dbg !176
  %"117" = sub nsw i64 %"116", 1, !dbg !176
  %"118" = srem i64 %"117", 4294967296, !dbg !176
  %"119" = add nsw i64 -2147483648, %"118", !dbg !176
  br label %main_wrap_around.exit2, !dbg !176

main_bb43:                                        ; preds = %main_wrap_around.exit4
  %"120" = icmp slt i64 %"114", -2147483648, !dbg !177
  br i1 %"120", label %main_bb44, label %main_wrap_around.exit2, !dbg !177

main_bb44:                                        ; preds = %main_bb43
  %"121" = sub nsw i64 -2147483648, %"114", !dbg !178
  %"122" = sub nsw i64 %"121", 1, !dbg !178
  %"123" = srem i64 %"122", 4294967296, !dbg !178
  %"124" = sub nsw i64 2147483647, %"123", !dbg !178
  br label %main_wrap_around.exit2, !dbg !178

main_bb45:                                        ; preds = %main_wrap_around.exit2, %main_wrap_around.exit6, %main_bb21
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
!48 = metadata !{i32 786443, metadata !1, metadata !9, i32 26, i32 3, i32 1, i32 26} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!49 = metadata !{i32 28, i32 9, metadata !50, null}
!50 = metadata !{i32 786443, metadata !1, metadata !51, i32 28, i32 9, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!51 = metadata !{i32 786443, metadata !1, metadata !9, i32 26, i32 21, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!52 = metadata !{i32 34, i32 11, metadata !53, null}
!53 = metadata !{i32 786443, metadata !1, metadata !54, i32 34, i32 11, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!54 = metadata !{i32 786443, metadata !1, metadata !50, i32 33, i32 10, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!55 = metadata !{i32 35, i32 9, metadata !56, null}
!56 = metadata !{i32 786443, metadata !1, metadata !53, i32 35, i32 1, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!57 = metadata !{i32 10, i32 9, metadata !30, metadata !55}
!58 = metadata !{i32 11, i32 9, metadata !32, metadata !55}
!59 = metadata !{i32 13, i32 14, metadata !34, metadata !55}
!60 = metadata !{i32 14, i32 9, metadata !36, metadata !55}
!61 = metadata !{i32 37, i32 13, metadata !54, null}
!62 = metadata !{i32 38, i32 16, metadata !54, null}
!63 = metadata !{i32 10, i32 9, metadata !30, metadata !62}
!64 = metadata !{i32 11, i32 9, metadata !32, metadata !62}
!65 = metadata !{i32 13, i32 14, metadata !34, metadata !62}
!66 = metadata !{i32 14, i32 9, metadata !36, metadata !62}
!67 = metadata !{i32 39, i32 11, metadata !68, null}
!68 = metadata !{i32 786443, metadata !1, metadata !54, i32 39, i32 11, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!69 = metadata !{i32 40, i32 10, metadata !70, null}
!70 = metadata !{i32 786443, metadata !1, metadata !68, i32 40, i32 1, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!71 = metadata !{i32 10, i32 9, metadata !30, metadata !69}
!72 = metadata !{i32 11, i32 9, metadata !32, metadata !69}
!73 = metadata !{i32 13, i32 14, metadata !34, metadata !69}
!74 = metadata !{i32 14, i32 9, metadata !36, metadata !69}
!75 = metadata !{i32 43, i32 9, metadata !76, null}
!76 = metadata !{i32 786443, metadata !1, metadata !68, i32 42, i32 12, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!77 = metadata !{i32 786688, metadata !9, metadata !"__retres", metadata !5, i32 20, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__retres] [line 20]
!78 = metadata !{i32 20, i32 13, metadata !9, null}
!79 = metadata !{i32 46, i32 9, metadata !76, null}
!80 = metadata !{i32 51, i32 17, metadata !9, null}
!81 = metadata !{i32 786688, metadata !12, metadata !"pos", metadata !5, i32 57, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pos] [line 57]
!82 = metadata !{i32 57, i32 13, metadata !12, null}
!83 = metadata !{i64 70000}
!84 = metadata !{i32 786688, metadata !12, metadata !"size", metadata !5, i32 58, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [size] [line 58]
!85 = metadata !{i32 58, i32 13, metadata !12, null} ; [ DW_TAG_imported_module ]
!86 = metadata !{i32 59, i32 3, metadata !12, null}
!87 = metadata !{i32 786688, metadata !12, metadata !"__fc_errno_0", metadata !5, i32 60, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__fc_errno_0] [line 60]
!88 = metadata !{i32 60, i32 13, metadata !12, null}
!89 = metadata !{i32 61, i32 7, metadata !90, null}
!90 = metadata !{i32 786443, metadata !1, metadata !12, i32 61, i32 7, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!91 = metadata !{i32 66, i32 9, metadata !92, null}
!92 = metadata !{i32 786443, metadata !1, metadata !90, i32 66, i32 9, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!93 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777224, metadata !8, i32 0, metadata !94} ; [ DW_TAG_arg_variable ] [value] [line 8]
!94 = metadata !{i32 71, i32 37, metadata !95, null}
!95 = metadata !{i32 786443, metadata !1, metadata !12, i32 70, i32 22, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!96 = metadata !{i32 8, i32 33, metadata !4, metadata !94} ; [ DW_TAG_imported_declaration ]
!97 = metadata !{i64 -2147483648}
!98 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554440, metadata !8, i32 0, metadata !94} ; [ DW_TAG_arg_variable ] [lower_bound] [line 8]
!99 = metadata !{i32 8, i32 50, metadata !4, metadata !94} ; [ DW_TAG_imported_declaration ]
!100 = metadata !{i64 2147483647}
!101 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331656, metadata !8, i32 0, metadata !94} ; [ DW_TAG_arg_variable ] [upper_bound] [line 8]
!102 = metadata !{i32 8, i32 73, metadata !4, metadata !94} ; [ DW_TAG_imported_declaration ]
!103 = metadata !{i64 4294967296}
!104 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 9, metadata !8, i32 0, metadata !94} ; [ DW_TAG_auto_variable ] [range] [line 9]
!105 = metadata !{i32 9, i32 15, metadata !4, metadata !94}
!106 = metadata !{i32 786689, metadata !9, metadata !"loc", metadata !5, i32 16777234, metadata !8, i32 0, metadata !107} ; [ DW_TAG_arg_variable ] [loc] [line 18]
!107 = metadata !{i32 71, i32 20, metadata !95, null}
!108 = metadata !{i32 18, i32 34, metadata !9, metadata !107}
!109 = metadata !{i32 786689, metadata !9, metadata !"len", metadata !5, i32 33554450, metadata !8, i32 0, metadata !107} ; [ DW_TAG_arg_variable ] [len] [line 18]
!110 = metadata !{i32 18, i32 49, metadata !9, metadata !107}
!111 = metadata !{i32 786688, metadata !9, metadata !"count", metadata !5, i32 21, metadata !8, i32 0, metadata !107} ; [ DW_TAG_auto_variable ] [count] [line 21]
!112 = metadata !{i32 21, i32 13, metadata !9, metadata !107}
!113 = metadata !{i32 22, i32 7, metadata !46, metadata !107}
!114 = metadata !{i32 786688, metadata !95, metadata !"rc", metadata !5, i32 71, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rc] [line 71]
!115 = metadata !{i32 71, i32 15, metadata !95, null}
!116 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777224, metadata !8, i32 0, metadata !117} ; [ DW_TAG_arg_variable ] [value] [line 8]
!117 = metadata !{i32 73, i32 23, metadata !118, null}
!118 = metadata !{i32 786443, metadata !1, metadata !119, i32 72, i32 19, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!119 = metadata !{i32 786443, metadata !1, metadata !95, i32 72, i32 9, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!120 = metadata !{i32 8, i32 33, metadata !4, metadata !117} ; [ DW_TAG_imported_declaration ]
!121 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554440, metadata !8, i32 0, metadata !117} ; [ DW_TAG_arg_variable ] [lower_bound] [line 8]
!122 = metadata !{i32 8, i32 50, metadata !4, metadata !117} ; [ DW_TAG_imported_declaration ]
!123 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331656, metadata !8, i32 0, metadata !117} ; [ DW_TAG_arg_variable ] [upper_bound] [line 8]
!124 = metadata !{i32 8, i32 73, metadata !4, metadata !117} ; [ DW_TAG_imported_declaration ]
!125 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 9, metadata !8, i32 0, metadata !117} ; [ DW_TAG_auto_variable ] [range] [line 9]
!126 = metadata !{i32 9, i32 15, metadata !4, metadata !117}
!127 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777224, metadata !8, i32 0, metadata !128} ; [ DW_TAG_arg_variable ] [value] [line 8]
!128 = metadata !{i32 81, i32 9, metadata !129, null}
!129 = metadata !{i32 786443, metadata !1, metadata !130, i32 81, i32 1, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!130 = metadata !{i32 786443, metadata !1, metadata !95, i32 80, i32 9, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!131 = metadata !{i32 8, i32 33, metadata !4, metadata !128} ; [ DW_TAG_imported_declaration ]
!132 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554440, metadata !8, i32 0, metadata !128} ; [ DW_TAG_arg_variable ] [lower_bound] [line 8]
!133 = metadata !{i32 8, i32 50, metadata !4, metadata !128} ; [ DW_TAG_imported_declaration ]
!134 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331656, metadata !8, i32 0, metadata !128} ; [ DW_TAG_arg_variable ] [upper_bound] [line 8]
!135 = metadata !{i32 8, i32 73, metadata !4, metadata !128} ; [ DW_TAG_imported_declaration ]
!136 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 9, metadata !8, i32 0, metadata !128} ; [ DW_TAG_auto_variable ] [range] [line 9]
!137 = metadata !{i32 9, i32 15, metadata !4, metadata !128}
!138 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777224, metadata !8, i32 0, metadata !139} ; [ DW_TAG_arg_variable ] [value] [line 8]
!139 = metadata !{i32 83, i32 11, metadata !95, null}
!140 = metadata !{i32 8, i32 33, metadata !4, metadata !139} ; [ DW_TAG_imported_declaration ]
!141 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554440, metadata !8, i32 0, metadata !139} ; [ DW_TAG_arg_variable ] [lower_bound] [line 8]
!142 = metadata !{i32 8, i32 50, metadata !4, metadata !139} ; [ DW_TAG_imported_declaration ]
!143 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331656, metadata !8, i32 0, metadata !139} ; [ DW_TAG_arg_variable ] [upper_bound] [line 8]
!144 = metadata !{i32 8, i32 73, metadata !4, metadata !139} ; [ DW_TAG_imported_declaration ]
!145 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 9, metadata !8, i32 0, metadata !139} ; [ DW_TAG_auto_variable ] [range] [line 9]
!146 = metadata !{i32 9, i32 15, metadata !4, metadata !139}
!147 = metadata !{i32 70, i32 3, metadata !12, null}
!148 = metadata !{i32 70, i32 3, metadata !149, null}
!149 = metadata !{i32 786443, metadata !1, metadata !12, i32 70, i32 3, i32 1, i32 27} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!150 = metadata !{i32 10, i32 9, metadata !30, metadata !94}
!151 = metadata !{i32 11, i32 9, metadata !32, metadata !94}
!152 = metadata !{i32 13, i32 14, metadata !34, metadata !94}
!153 = metadata !{i32 14, i32 9, metadata !36, metadata !94}
!154 = metadata !{i32 26, i32 3, metadata !48, metadata !107}
!155 = metadata !{i32 38, i32 16, metadata !54, metadata !107}
!156 = metadata !{i32 10, i32 9, metadata !30, metadata !155}
!157 = metadata !{i32 11, i32 9, metadata !32, metadata !155}
!158 = metadata !{i32 13, i32 14, metadata !34, metadata !155}
!159 = metadata !{i32 14, i32 9, metadata !36, metadata !155}
!160 = metadata !{i32 40, i32 10, metadata !70, metadata !107}
!161 = metadata !{i32 10, i32 9, metadata !30, metadata !160}
!162 = metadata !{i32 11, i32 9, metadata !32, metadata !160}
!163 = metadata !{i32 13, i32 14, metadata !34, metadata !160}
!164 = metadata !{i32 14, i32 9, metadata !36, metadata !160}
!165 = metadata !{i32 10, i32 9, metadata !30, metadata !117}
!166 = metadata !{i32 11, i32 9, metadata !32, metadata !117}
!167 = metadata !{i32 13, i32 14, metadata !34, metadata !117}
!168 = metadata !{i32 14, i32 9, metadata !36, metadata !117}
!169 = metadata !{i32 74, i32 11, metadata !170, null}
!170 = metadata !{i32 786443, metadata !1, metadata !118, i32 74, i32 11, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!171 = metadata !{i32 10, i32 9, metadata !30, metadata !128}
!172 = metadata !{i32 11, i32 9, metadata !32, metadata !128}
!173 = metadata !{i32 13, i32 14, metadata !34, metadata !128}
!174 = metadata !{i32 14, i32 9, metadata !36, metadata !128}
!175 = metadata !{i32 10, i32 9, metadata !30, metadata !139}
!176 = metadata !{i32 11, i32 9, metadata !32, metadata !139}
!177 = metadata !{i32 13, i32 14, metadata !34, metadata !139}
!178 = metadata !{i32 14, i32 9, metadata !36, metadata !139}
!179 = metadata !{i32 85, i32 17, metadata !12, null}

