; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@"'flag" = global i64 0, align 8

; Function Attrs: nounwind uwtable
define i64 @wrap_around(i64 %value, i64 %lower_bound, i64 %upper_bound) #0 {
wrap_around_bb0:
  call void @llvm.dbg.value(metadata !{i64 %value}, i64 0, metadata !24), !dbg !25
  call void @llvm.dbg.value(metadata !{i64 %lower_bound}, i64 0, metadata !26), !dbg !27
  call void @llvm.dbg.value(metadata !{i64 %upper_bound}, i64 0, metadata !28), !dbg !29
  %"0" = sub nsw i64 %upper_bound, %lower_bound, !dbg !30
  %"1" = add nsw i64 %"0", 1, !dbg !30
  call void @llvm.dbg.value(metadata !{i64 %"1"}, i64 0, metadata !31), !dbg !32
  %"2" = icmp sgt i64 %value, %upper_bound, !dbg !33
  br i1 %"2", label %wrap_around_bb1, label %wrap_around_bb2, !dbg !33

wrap_around_bb1:                                  ; preds = %wrap_around_bb0
  %"3" = sub nsw i64 %value, %upper_bound, !dbg !35
  %"4" = sub nsw i64 %"3", 1, !dbg !35
  %"5" = srem i64 %"4", %"1", !dbg !35
  %"6" = add nsw i64 %lower_bound, %"5", !dbg !35
  br label %wrap_around_bb4, !dbg !35

wrap_around_bb2:                                  ; preds = %wrap_around_bb0
  %"7" = icmp slt i64 %value, %lower_bound, !dbg !37
  br i1 %"7", label %wrap_around_bb3, label %wrap_around_bb4, !dbg !37

wrap_around_bb3:                                  ; preds = %wrap_around_bb2
  %"8" = sub nsw i64 %lower_bound, %value, !dbg !39
  %"9" = sub nsw i64 %"8", 1, !dbg !39
  %"10" = srem i64 %"9", %"1", !dbg !39
  %"11" = sub nsw i64 %upper_bound, %"10", !dbg !39
  br label %wrap_around_bb4, !dbg !39

wrap_around_bb4:                                  ; preds = %wrap_around_bb2, %wrap_around_bb3, %wrap_around_bb1
  %.0 = phi i64 [ %"6", %wrap_around_bb1 ], [ %"11", %wrap_around_bb3 ], [ %value, %wrap_around_bb2 ]
  ret i64 %.0, !dbg !41
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i64 @matroska_deliver_packet(i64 %q) #0 {
matroska_deliver_packet_bb5:
  call void @llvm.dbg.value(metadata !{i64 %q}, i64 0, metadata !42), !dbg !43
  %"12" = icmp eq i64 %q, 1, !dbg !44
  %. = select i1 %"12", i64 0, i64 1, !dbg !46
  ret i64 %., !dbg !48
}

; Function Attrs: nounwind uwtable
define i64 @res_return() #0 {
res_return_bb6:
  %"13" = load i64* @"'flag", align 8, !dbg !49
  %"14" = add nsw i64 %"13", 1, !dbg !49
  store i64 %"14", i64* @"'flag", align 8, !dbg !49
  %"15" = icmp slt i64 %"13", 100, !dbg !49
  %"16" = load i64* @"'flag", align 8, !dbg !51
  %"17" = icmp sgt i64 %"16", 2147483647, !dbg !53
  br i1 %"15", label %res_return_bb7, label %res_return_bb11, !dbg !49

res_return_bb7:                                   ; preds = %res_return_bb6
  call void @llvm.dbg.value(metadata !{i64 %"16"}, i64 0, metadata !54), !dbg !55
  call void @llvm.dbg.value(metadata !56, i64 0, metadata !57), !dbg !58
  call void @llvm.dbg.value(metadata !59, i64 0, metadata !60), !dbg !61
  call void @llvm.dbg.value(metadata !62, i64 0, metadata !63), !dbg !64
  br i1 %"17", label %res_return_bb8, label %res_return_bb9, !dbg !53

res_return_bb8:                                   ; preds = %res_return_bb7
  %"18" = sub nsw i64 %"16", 2147483647, !dbg !65
  %"19" = sub nsw i64 %"18", 1, !dbg !65
  %"20" = srem i64 %"19", 4294967296, !dbg !65
  %"21" = add nsw i64 -2147483648, %"20", !dbg !65
  br label %res_return_wrap_around.exit, !dbg !65

res_return_bb9:                                   ; preds = %res_return_bb7
  %"22" = icmp slt i64 %"16", -2147483648, !dbg !66
  br i1 %"22", label %res_return_bb10, label %res_return_wrap_around.exit, !dbg !66

res_return_bb10:                                  ; preds = %res_return_bb9
  %"23" = sub nsw i64 -2147483648, %"16", !dbg !67
  %"24" = sub nsw i64 %"23", 1, !dbg !67
  %"25" = srem i64 %"24", 4294967296, !dbg !67
  %"26" = sub nsw i64 2147483647, %"25", !dbg !67
  br label %res_return_wrap_around.exit, !dbg !67

res_return_wrap_around.exit:                      ; preds = %res_return_bb8, %res_return_bb9, %res_return_bb10
  %.0.i = phi i64 [ %"21", %res_return_bb8 ], [ %"26", %res_return_bb10 ], [ %"16", %res_return_bb9 ], !dbg !51
  store i64 %.0.i, i64* @"'flag", align 8, !dbg !51
  br label %res_return_bb15, !dbg !68

res_return_bb11:                                  ; preds = %res_return_bb6
  call void @llvm.dbg.value(metadata !{i64 %"16"}, i64 0, metadata !69), !dbg !71
  call void @llvm.dbg.value(metadata !56, i64 0, metadata !72), !dbg !73
  call void @llvm.dbg.value(metadata !59, i64 0, metadata !74), !dbg !75
  call void @llvm.dbg.value(metadata !62, i64 0, metadata !76), !dbg !77
  br i1 %"17", label %res_return_bb12, label %res_return_bb13, !dbg !78

res_return_bb12:                                  ; preds = %res_return_bb11
  %"27" = sub nsw i64 %"16", 2147483647, !dbg !79
  %"28" = sub nsw i64 %"27", 1, !dbg !79
  %"29" = srem i64 %"28", 4294967296, !dbg !79
  %"30" = add nsw i64 -2147483648, %"29", !dbg !79
  br label %res_return_wrap_around.exit2, !dbg !79

res_return_bb13:                                  ; preds = %res_return_bb11
  %"31" = icmp slt i64 %"16", -2147483648, !dbg !80
  br i1 %"31", label %res_return_bb14, label %res_return_wrap_around.exit2, !dbg !80

res_return_bb14:                                  ; preds = %res_return_bb13
  %"32" = sub nsw i64 -2147483648, %"16", !dbg !81
  %"33" = sub nsw i64 %"32", 1, !dbg !81
  %"34" = srem i64 %"33", 4294967296, !dbg !81
  %"35" = sub nsw i64 2147483647, %"34", !dbg !81
  br label %res_return_wrap_around.exit2, !dbg !81

res_return_wrap_around.exit2:                     ; preds = %res_return_bb12, %res_return_bb13, %res_return_bb14
  %.0.i1 = phi i64 [ %"30", %res_return_bb12 ], [ %"35", %res_return_bb14 ], [ %"16", %res_return_bb13 ], !dbg !70
  store i64 %.0.i1, i64* @"'flag", align 8, !dbg !70
  br label %res_return_bb15, !dbg !82

res_return_bb15:                                  ; preds = %res_return_wrap_around.exit2, %res_return_wrap_around.exit
  %.0 = phi i64 [ 0, %res_return_wrap_around.exit ], [ -1, %res_return_wrap_around.exit2 ]
  ret i64 %.0, !dbg !83
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
main_bb16:
  call void @llvm.dbg.value(metadata !84, i64 0, metadata !85), !dbg !86
  call void @llvm.dbg.value(metadata !87, i64 0, metadata !88), !dbg !89
  call void @llvm.dbg.value(metadata !{i64 %matroska.0}, i64 0, metadata !90), !dbg !93
  call void @llvm.dbg.value(metadata !87, i64 0, metadata !88), !dbg !89
  call void @llvm.dbg.value(metadata !84, i64 0, metadata !94), !dbg !97
  call void @llvm.dbg.value(metadata !56, i64 0, metadata !98), !dbg !102
  call void @llvm.dbg.value(metadata !59, i64 0, metadata !103), !dbg !104
  call void @llvm.dbg.value(metadata !62, i64 0, metadata !105), !dbg !106
  call void @llvm.dbg.value(metadata !56, i64 0, metadata !107), !dbg !109
  call void @llvm.dbg.value(metadata !59, i64 0, metadata !110), !dbg !111
  call void @llvm.dbg.value(metadata !62, i64 0, metadata !112), !dbg !113
  call void @llvm.dbg.value(metadata !{i64 %"41"}, i64 0, metadata !114), !dbg !118
  call void @llvm.dbg.value(metadata !56, i64 0, metadata !119), !dbg !120
  call void @llvm.dbg.value(metadata !59, i64 0, metadata !121), !dbg !122
  call void @llvm.dbg.value(metadata !62, i64 0, metadata !123), !dbg !124
  call void @llvm.dbg.value(metadata !{i64 %"63"}, i64 0, metadata !88), !dbg !89
  call void @llvm.dbg.value(metadata !{i64 %"68"}, i64 0, metadata !125), !dbg !129
  call void @llvm.dbg.value(metadata !56, i64 0, metadata !130), !dbg !131
  call void @llvm.dbg.value(metadata !59, i64 0, metadata !132), !dbg !133
  call void @llvm.dbg.value(metadata !62, i64 0, metadata !134), !dbg !135
  call void @llvm.dbg.value(metadata !{i64 %"90"}, i64 0, metadata !88), !dbg !89
  call void @llvm.dbg.value(metadata !84, i64 0, metadata !88), !dbg !89
  call void @llvm.dbg.value(metadata !{i64 %"68"}, i64 0, metadata !136), !dbg !138
  call void @llvm.dbg.value(metadata !56, i64 0, metadata !139), !dbg !140
  call void @llvm.dbg.value(metadata !59, i64 0, metadata !141), !dbg !142
  call void @llvm.dbg.value(metadata !62, i64 0, metadata !143), !dbg !144
  call void @llvm.dbg.value(metadata !{i64 %"41"}, i64 0, metadata !145), !dbg !147
  call void @llvm.dbg.value(metadata !56, i64 0, metadata !148), !dbg !149
  call void @llvm.dbg.value(metadata !59, i64 0, metadata !150), !dbg !151
  call void @llvm.dbg.value(metadata !62, i64 0, metadata !152), !dbg !153
  br label %main_bb17, !dbg !154

main_bb17:                                        ; preds = %main_NewDefault, %main_bb19, %main_bb16
  %matroska.0 = phi i64 [ 1, %main_bb16 ], [ 1, %main_bb19 ], [ %matroska.0, %main_NewDefault ]
  %"36" = icmp eq i64 %matroska.0, 1, !dbg !155
  %..i = select i1 %"36", i64 0, i64 1, !dbg !156
  %"37" = icmp ne i64 %..i, 0, !dbg !91
  br i1 %"37", label %main_bb18, label %main_bb38, !dbg !91

main_bb18:                                        ; preds = %main_res_return.exit6, %main_res_return.exit12, %main_bb17
  %res.0 = phi i64 [ 0, %main_bb17 ], [ %., %main_res_return.exit6 ], [ %"63", %main_res_return.exit12 ]
  br label %main_NodeBlock

main_NodeBlock:                                   ; preds = %main_bb18
  %Pivot = icmp slt i64 %res.0, 0
  br i1 %Pivot, label %main_LeafBlock, label %main_LeafBlock13

main_LeafBlock:                                   ; preds = %main_NodeBlock
  %SwitchLeaf = icmp eq i64 %res.0, -1
  br i1 %SwitchLeaf, label %main_bb19, label %main_NewDefault

main_bb19:                                        ; preds = %main_LeafBlock
  call void @llvm.dbg.value(metadata !84, i64 0, metadata !85), !dbg !86
  br label %main_bb17, !dbg !157

main_LeafBlock13:                                 ; preds = %main_NodeBlock
  %SwitchLeaf14 = icmp eq i64 %res.0, 0
  br i1 %SwitchLeaf14, label %main_bb20, label %main_NewDefault

main_bb20:                                        ; preds = %main_LeafBlock13
  %"38" = load i64* @"'flag", align 8, !dbg !160
  %"39" = add nsw i64 %"38", 1, !dbg !160
  store i64 %"39", i64* @"'flag", align 8, !dbg !160
  %"40" = icmp slt i64 %"38", 100, !dbg !160
  %"41" = load i64* @"'flag", align 8, !dbg !115
  %"42" = icmp sgt i64 %"41", 2147483647, !dbg !161
  br i1 %"40", label %main_bb21, label %main_bb25, !dbg !160

main_bb21:                                        ; preds = %main_bb20
  br i1 %"42", label %main_bb22, label %main_bb23, !dbg !161

main_bb22:                                        ; preds = %main_bb21
  %"43" = sub nsw i64 %"41", 2147483647, !dbg !162
  %"44" = sub nsw i64 %"43", 1, !dbg !162
  %"45" = srem i64 %"44", 4294967296, !dbg !162
  %"46" = add nsw i64 -2147483648, %"45", !dbg !162
  br label %main_wrap_around.exit.i8, !dbg !162

main_bb23:                                        ; preds = %main_bb21
  %"47" = icmp slt i64 %"41", -2147483648, !dbg !163
  br i1 %"47", label %main_bb24, label %main_wrap_around.exit.i8, !dbg !163

main_bb24:                                        ; preds = %main_bb23
  %"48" = sub nsw i64 -2147483648, %"41", !dbg !164
  %"49" = sub nsw i64 %"48", 1, !dbg !164
  %"50" = srem i64 %"49", 4294967296, !dbg !164
  %"51" = sub nsw i64 2147483647, %"50", !dbg !164
  br label %main_wrap_around.exit.i8, !dbg !164

main_wrap_around.exit.i8:                         ; preds = %main_bb24, %main_bb23, %main_bb22
  %.0.i.i7 = phi i64 [ %"46", %main_bb22 ], [ %"51", %main_bb24 ], [ %"41", %main_bb23 ], !dbg !115
  store i64 %.0.i.i7, i64* @"'flag", align 8, !dbg !115
  br label %main_res_return.exit12, !dbg !165

main_bb25:                                        ; preds = %main_bb20
  br i1 %"42", label %main_bb26, label %main_bb27, !dbg !166

main_bb26:                                        ; preds = %main_bb25
  %"52" = sub nsw i64 %"41", 2147483647, !dbg !167
  %"53" = sub nsw i64 %"52", 1, !dbg !167
  %"54" = srem i64 %"53", 4294967296, !dbg !167
  %"55" = add nsw i64 -2147483648, %"54", !dbg !167
  br label %main_wrap_around.exit2.i10, !dbg !167

main_bb27:                                        ; preds = %main_bb25
  %"56" = icmp slt i64 %"41", -2147483648, !dbg !168
  br i1 %"56", label %main_bb28, label %main_wrap_around.exit2.i10, !dbg !168

main_bb28:                                        ; preds = %main_bb27
  %"57" = sub nsw i64 -2147483648, %"41", !dbg !169
  %"58" = sub nsw i64 %"57", 1, !dbg !169
  %"59" = srem i64 %"58", 4294967296, !dbg !169
  %"60" = sub nsw i64 2147483647, %"59", !dbg !169
  br label %main_wrap_around.exit2.i10, !dbg !169

main_wrap_around.exit2.i10:                       ; preds = %main_bb28, %main_bb27, %main_bb26
  %.0.i1.i9 = phi i64 [ %"55", %main_bb26 ], [ %"60", %main_bb28 ], [ %"41", %main_bb27 ], !dbg !146
  store i64 %.0.i1.i9, i64* @"'flag", align 8, !dbg !146
  br label %main_res_return.exit12, !dbg !170

main_res_return.exit12:                           ; preds = %main_wrap_around.exit.i8, %main_wrap_around.exit2.i10
  %.0.i11 = phi i64 [ 0, %main_wrap_around.exit.i8 ], [ -1, %main_wrap_around.exit2.i10 ], !dbg !116
  %"61" = icmp slt i64 %.0.i11, 0, !dbg !116
  %"62" = zext i1 %"61" to i32, !dbg !116
  %"63" = sext i32 %"62" to i64, !dbg !116
  %"64" = icmp ne i64 %"63", 0, !dbg !116
  br i1 %"64", label %main_bb18, label %main_bb29, !dbg !116

main_bb29:                                        ; preds = %main_res_return.exit12
  %"65" = load i64* @"'flag", align 8, !dbg !171
  %"66" = add nsw i64 %"65", 1, !dbg !171
  store i64 %"66", i64* @"'flag", align 8, !dbg !171
  %"67" = icmp slt i64 %"65", 100, !dbg !171
  %"68" = load i64* @"'flag", align 8, !dbg !126
  %"69" = icmp sgt i64 %"68", 2147483647, !dbg !172
  br i1 %"67", label %main_bb30, label %main_bb34, !dbg !171

main_bb30:                                        ; preds = %main_bb29
  br i1 %"69", label %main_bb31, label %main_bb32, !dbg !172

main_bb31:                                        ; preds = %main_bb30
  %"70" = sub nsw i64 %"68", 2147483647, !dbg !173
  %"71" = sub nsw i64 %"70", 1, !dbg !173
  %"72" = srem i64 %"71", 4294967296, !dbg !173
  %"73" = add nsw i64 -2147483648, %"72", !dbg !173
  br label %main_wrap_around.exit.i2, !dbg !173

main_bb32:                                        ; preds = %main_bb30
  %"74" = icmp slt i64 %"68", -2147483648, !dbg !174
  br i1 %"74", label %main_bb33, label %main_wrap_around.exit.i2, !dbg !174

main_bb33:                                        ; preds = %main_bb32
  %"75" = sub nsw i64 -2147483648, %"68", !dbg !175
  %"76" = sub nsw i64 %"75", 1, !dbg !175
  %"77" = srem i64 %"76", 4294967296, !dbg !175
  %"78" = sub nsw i64 2147483647, %"77", !dbg !175
  br label %main_wrap_around.exit.i2, !dbg !175

main_wrap_around.exit.i2:                         ; preds = %main_bb33, %main_bb32, %main_bb31
  %.0.i.i1 = phi i64 [ %"73", %main_bb31 ], [ %"78", %main_bb33 ], [ %"68", %main_bb32 ], !dbg !126
  store i64 %.0.i.i1, i64* @"'flag", align 8, !dbg !126
  br label %main_res_return.exit6, !dbg !176

main_bb34:                                        ; preds = %main_bb29
  br i1 %"69", label %main_bb35, label %main_bb36, !dbg !177

main_bb35:                                        ; preds = %main_bb34
  %"79" = sub nsw i64 %"68", 2147483647, !dbg !178
  %"80" = sub nsw i64 %"79", 1, !dbg !178
  %"81" = srem i64 %"80", 4294967296, !dbg !178
  %"82" = add nsw i64 -2147483648, %"81", !dbg !178
  br label %main_wrap_around.exit2.i4, !dbg !178

main_bb36:                                        ; preds = %main_bb34
  %"83" = icmp slt i64 %"68", -2147483648, !dbg !179
  br i1 %"83", label %main_bb37, label %main_wrap_around.exit2.i4, !dbg !179

main_bb37:                                        ; preds = %main_bb36
  %"84" = sub nsw i64 -2147483648, %"68", !dbg !180
  %"85" = sub nsw i64 %"84", 1, !dbg !180
  %"86" = srem i64 %"85", 4294967296, !dbg !180
  %"87" = sub nsw i64 2147483647, %"86", !dbg !180
  br label %main_wrap_around.exit2.i4, !dbg !180

main_wrap_around.exit2.i4:                        ; preds = %main_bb37, %main_bb36, %main_bb35
  %.0.i1.i3 = phi i64 [ %"82", %main_bb35 ], [ %"87", %main_bb37 ], [ %"68", %main_bb36 ], !dbg !137
  store i64 %.0.i1.i3, i64* @"'flag", align 8, !dbg !137
  br label %main_res_return.exit6, !dbg !181

main_res_return.exit6:                            ; preds = %main_wrap_around.exit.i2, %main_wrap_around.exit2.i4
  %.0.i5 = phi i64 [ 0, %main_wrap_around.exit.i2 ], [ -1, %main_wrap_around.exit2.i4 ], !dbg !127
  %"88" = icmp eq i64 %.0.i5, 0, !dbg !127
  %"89" = zext i1 %"88" to i32, !dbg !127
  %"90" = sext i32 %"89" to i64, !dbg !127
  %"91" = icmp ne i64 %"90", 0, !dbg !127
  %. = select i1 %"91", i64 1, i64 %"90", !dbg !127
  br label %main_bb18, !dbg !182

main_NewDefault:                                  ; preds = %main_LeafBlock13, %main_LeafBlock
  br label %main_bb17

main_bb38:                                        ; preds = %main_bb17
  ret i32 0, !dbg !183
}

declare i64 @__kittel_nondef.0()

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

declare i32 @__kittel_nondef.1()

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!21, !22}
!llvm.ident = !{!23}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !19, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [//FILES_DIR/SourceCode_SemanticAugmentor.c] [DW_LANG_C99]
!1 = metadata !{metadata !"FILES_DIR/SourceCode_SemanticAugmentor.c", metadata !"/"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9, metadata !12, metadata !15}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"wrap_around", metadata !"wrap_around", metadata !"", i32 9, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i64, i64, i64)* @wrap_around, null, null, metadata !2, i32 9} ; [ DW_TAG_subprogram ] [line 9] [def] [wrap_around]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"matroska_deliver_packet", metadata !"matroska_deliver_packet", metadata !"", i32 19, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i64)* @matroska_deliver_packet, null, null, metadata !2, i32 20} ; [ DW_TAG_subprogram ] [line 19] [def] [scope 20] [matroska_deliver_packet]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !8, metadata !8}
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"res_return", metadata !"res_return", metadata !"", i32 29, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i64 ()* @res_return, null, null, metadata !2, i32 30} ; [ DW_TAG_subprogram ] [line 29] [def] [scope 30] [res_return]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{metadata !8}
!15 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 39, metadata !16, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 40} ; [ DW_TAG_subprogram ] [line 39] [def] [scope 40] [main]
!16 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !17, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!17 = metadata !{metadata !18}
!18 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!19 = metadata !{metadata !20}
!20 = metadata !{i32 786484, i32 0, null, metadata !"flag", metadata !"flag", metadata !"", metadata !5, i32 28, metadata !8, i32 0, i32 1, i64* @"'flag", null} ; [ DW_TAG_variable ] [flag] [line 28] [def]
!21 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!22 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!23 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!24 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777225, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 9]
!25 = metadata !{i32 9, i32 33, metadata !4, null}
!26 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554441, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [lower_bound] [line 9]
!27 = metadata !{i32 9, i32 50, metadata !4, null}
!28 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331657, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [upper_bound] [line 9]
!29 = metadata !{i32 9, i32 73, metadata !4, null}
!30 = metadata !{i32 10, i32 5, metadata !4, null}
!31 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 10, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [range] [line 10]
!32 = metadata !{i32 10, i32 15, metadata !4, null}
!33 = metadata !{i32 11, i32 9, metadata !34, null}
!34 = metadata !{i32 786443, metadata !1, metadata !4, i32 11, i32 9, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!35 = metadata !{i32 12, i32 9, metadata !36, null}
!36 = metadata !{i32 786443, metadata !1, metadata !34, i32 11, i32 30, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!37 = metadata !{i32 14, i32 14, metadata !38, null}
!38 = metadata !{i32 786443, metadata !1, metadata !34, i32 14, i32 14, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!39 = metadata !{i32 15, i32 9, metadata !40, null}
!40 = metadata !{i32 786443, metadata !1, metadata !38, i32 14, i32 35, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!41 = metadata !{i32 18, i32 1, metadata !4, null}
!42 = metadata !{i32 786689, metadata !9, metadata !"q", metadata !5, i32 16777235, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [q] [line 19]
!43 = metadata !{i32 19, i32 46, metadata !9, null}
!44 = metadata !{i32 21, i32 9, metadata !45, null}
!45 = metadata !{i32 786443, metadata !1, metadata !9, i32 21, i32 9, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!46 = metadata !{i32 23, i32 9, metadata !47, null}
!47 = metadata !{i32 786443, metadata !1, metadata !45, i32 22, i32 1, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!48 = metadata !{i32 27, i32 1, metadata !9, null}
!49 = metadata !{i32 31, i32 9, metadata !50, null}
!50 = metadata !{i32 786443, metadata !1, metadata !12, i32 31, i32 9, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!51 = metadata !{i32 33, i32 8, metadata !52, null}
!52 = metadata !{i32 786443, metadata !1, metadata !50, i32 32, i32 1, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!53 = metadata !{i32 11, i32 9, metadata !34, metadata !51}
!54 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777225, metadata !8, i32 0, metadata !51} ; [ DW_TAG_arg_variable ] [value] [line 9]
!55 = metadata !{i32 9, i32 33, metadata !4, metadata !51}
!56 = metadata !{i64 -2147483648}
!57 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554441, metadata !8, i32 0, metadata !51} ; [ DW_TAG_arg_variable ] [lower_bound] [line 9]
!58 = metadata !{i32 9, i32 50, metadata !4, metadata !51}
!59 = metadata !{i64 2147483647}
!60 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331657, metadata !8, i32 0, metadata !51} ; [ DW_TAG_arg_variable ] [upper_bound] [line 9]
!61 = metadata !{i32 9, i32 73, metadata !4, metadata !51}
!62 = metadata !{i64 4294967296}
!63 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 10, metadata !8, i32 0, metadata !51} ; [ DW_TAG_auto_variable ] [range] [line 10]
!64 = metadata !{i32 10, i32 15, metadata !4, metadata !51}
!65 = metadata !{i32 12, i32 9, metadata !36, metadata !51}
!66 = metadata !{i32 14, i32 14, metadata !38, metadata !51}
!67 = metadata !{i32 15, i32 9, metadata !40, metadata !51}
!68 = metadata !{i32 34, i32 9, metadata !52, null}
!69 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777225, metadata !8, i32 0, metadata !70} ; [ DW_TAG_arg_variable ] [value] [line 9]
!70 = metadata !{i32 36, i32 8, metadata !12, null}
!71 = metadata !{i32 9, i32 33, metadata !4, metadata !70}
!72 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554441, metadata !8, i32 0, metadata !70} ; [ DW_TAG_arg_variable ] [lower_bound] [line 9]
!73 = metadata !{i32 9, i32 50, metadata !4, metadata !70}
!74 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331657, metadata !8, i32 0, metadata !70} ; [ DW_TAG_arg_variable ] [upper_bound] [line 9]
!75 = metadata !{i32 9, i32 73, metadata !4, metadata !70}
!76 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 10, metadata !8, i32 0, metadata !70} ; [ DW_TAG_auto_variable ] [range] [line 10]
!77 = metadata !{i32 10, i32 15, metadata !4, metadata !70}
!78 = metadata !{i32 11, i32 9, metadata !34, metadata !70}
!79 = metadata !{i32 12, i32 9, metadata !36, metadata !70}
!80 = metadata !{i32 14, i32 14, metadata !38, metadata !70}
!81 = metadata !{i32 15, i32 9, metadata !40, metadata !70}
!82 = metadata !{i32 37, i32 5, metadata !12, null}
!83 = metadata !{i32 38, i32 1, metadata !12, null}
!84 = metadata !{i64 1}
!85 = metadata !{i32 786688, metadata !15, metadata !"matroska", metadata !5, i32 41, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [matroska] [line 41]
!86 = metadata !{i32 41, i32 15, metadata !15, null}
!87 = metadata !{i64 0}
!88 = metadata !{i32 786688, metadata !15, metadata !"res", metadata !5, i32 42, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [res] [line 42]
!89 = metadata !{i32 42, i32 15, metadata !15, null}
!90 = metadata !{i32 786689, metadata !9, metadata !"q", metadata !5, i32 16777235, metadata !8, i32 0, metadata !91} ; [ DW_TAG_arg_variable ] [q] [line 19]
!91 = metadata !{i32 43, i32 12, metadata !92, null}
!92 = metadata !{i32 786443, metadata !1, metadata !15, i32 43, i32 12, i32 1, i32 17} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!93 = metadata !{i32 19, i32 46, metadata !9, metadata !91}
!94 = metadata !{i32 786688, metadata !95, metadata !"id", metadata !5, i32 48, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [id] [line 48]
!95 = metadata !{i32 786443, metadata !1, metadata !96, i32 47, i32 9, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!96 = metadata !{i32 786443, metadata !1, metadata !15, i32 44, i32 5, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!97 = metadata !{i32 48, i32 23, metadata !95, null}
!98 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554441, metadata !8, i32 0, metadata !99} ; [ DW_TAG_arg_variable ] [lower_bound] [line 9]
!99 = metadata !{i32 33, i32 8, metadata !52, metadata !100}
!100 = metadata !{i32 63, i32 27, metadata !101, null}
!101 = metadata !{i32 786443, metadata !1, metadata !95, i32 49, i32 25, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!102 = metadata !{i32 9, i32 50, metadata !4, metadata !99}
!103 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331657, metadata !8, i32 0, metadata !99} ; [ DW_TAG_arg_variable ] [upper_bound] [line 9]
!104 = metadata !{i32 9, i32 73, metadata !4, metadata !99}
!105 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 10, metadata !8, i32 0, metadata !99} ; [ DW_TAG_auto_variable ] [range] [line 10]
!106 = metadata !{i32 10, i32 15, metadata !4, metadata !99}
!107 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554441, metadata !8, i32 0, metadata !108} ; [ DW_TAG_arg_variable ] [lower_bound] [line 9]
!108 = metadata !{i32 36, i32 8, metadata !12, metadata !100}
!109 = metadata !{i32 9, i32 50, metadata !4, metadata !108}
!110 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331657, metadata !8, i32 0, metadata !108} ; [ DW_TAG_arg_variable ] [upper_bound] [line 9]
!111 = metadata !{i32 9, i32 73, metadata !4, metadata !108}
!112 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 10, metadata !8, i32 0, metadata !108} ; [ DW_TAG_auto_variable ] [range] [line 10]
!113 = metadata !{i32 10, i32 15, metadata !4, metadata !108}
!114 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777225, metadata !8, i32 0, metadata !115} ; [ DW_TAG_arg_variable ] [value] [line 9]
!115 = metadata !{i32 33, i32 8, metadata !52, metadata !116}
!116 = metadata !{i32 51, i32 31, metadata !117, null}
!117 = metadata !{i32 786443, metadata !1, metadata !101, i32 51, i32 25, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!118 = metadata !{i32 9, i32 33, metadata !4, metadata !115}
!119 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554441, metadata !8, i32 0, metadata !115} ; [ DW_TAG_arg_variable ] [lower_bound] [line 9]
!120 = metadata !{i32 9, i32 50, metadata !4, metadata !115}
!121 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331657, metadata !8, i32 0, metadata !115} ; [ DW_TAG_arg_variable ] [upper_bound] [line 9]
!122 = metadata !{i32 9, i32 73, metadata !4, metadata !115}
!123 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 10, metadata !8, i32 0, metadata !115} ; [ DW_TAG_auto_variable ] [range] [line 10]
!124 = metadata !{i32 10, i32 15, metadata !4, metadata !115}
!125 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777225, metadata !8, i32 0, metadata !126} ; [ DW_TAG_arg_variable ] [value] [line 9]
!126 = metadata !{i32 33, i32 8, metadata !52, metadata !127}
!127 = metadata !{i32 55, i32 31, metadata !128, null}
!128 = metadata !{i32 786443, metadata !1, metadata !101, i32 55, i32 25, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!129 = metadata !{i32 9, i32 33, metadata !4, metadata !126}
!130 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554441, metadata !8, i32 0, metadata !126} ; [ DW_TAG_arg_variable ] [lower_bound] [line 9]
!131 = metadata !{i32 9, i32 50, metadata !4, metadata !126}
!132 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331657, metadata !8, i32 0, metadata !126} ; [ DW_TAG_arg_variable ] [upper_bound] [line 9]
!133 = metadata !{i32 9, i32 73, metadata !4, metadata !126}
!134 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 10, metadata !8, i32 0, metadata !126} ; [ DW_TAG_auto_variable ] [range] [line 10]
!135 = metadata !{i32 10, i32 15, metadata !4, metadata !126}
!136 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777225, metadata !8, i32 0, metadata !137} ; [ DW_TAG_arg_variable ] [value] [line 9]
!137 = metadata !{i32 36, i32 8, metadata !12, metadata !127}
!138 = metadata !{i32 9, i32 33, metadata !4, metadata !137}
!139 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554441, metadata !8, i32 0, metadata !137} ; [ DW_TAG_arg_variable ] [lower_bound] [line 9]
!140 = metadata !{i32 9, i32 50, metadata !4, metadata !137}
!141 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331657, metadata !8, i32 0, metadata !137} ; [ DW_TAG_arg_variable ] [upper_bound] [line 9]
!142 = metadata !{i32 9, i32 73, metadata !4, metadata !137}
!143 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 10, metadata !8, i32 0, metadata !137} ; [ DW_TAG_auto_variable ] [range] [line 10]
!144 = metadata !{i32 10, i32 15, metadata !4, metadata !137}
!145 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777225, metadata !8, i32 0, metadata !146} ; [ DW_TAG_arg_variable ] [value] [line 9]
!146 = metadata !{i32 36, i32 8, metadata !12, metadata !116}
!147 = metadata !{i32 9, i32 33, metadata !4, metadata !146}
!148 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554441, metadata !8, i32 0, metadata !146} ; [ DW_TAG_arg_variable ] [lower_bound] [line 9]
!149 = metadata !{i32 9, i32 50, metadata !4, metadata !146}
!150 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331657, metadata !8, i32 0, metadata !146} ; [ DW_TAG_arg_variable ] [upper_bound] [line 9]
!151 = metadata !{i32 9, i32 73, metadata !4, metadata !146}
!152 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 10, metadata !8, i32 0, metadata !146} ; [ DW_TAG_auto_variable ] [range] [line 10]
!153 = metadata !{i32 10, i32 15, metadata !4, metadata !146}
!154 = metadata !{i32 43, i32 5, metadata !15, null}
!155 = metadata !{i32 21, i32 9, metadata !45, metadata !91}
!156 = metadata !{i32 23, i32 9, metadata !47, metadata !91}
!157 = metadata !{i32 70, i32 1, metadata !158, null}
!158 = metadata !{i32 786443, metadata !1, metadata !159, i32 68, i32 1, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!159 = metadata !{i32 786443, metadata !1, metadata !96, i32 67, i32 13, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!160 = metadata !{i32 31, i32 9, metadata !50, metadata !116}
!161 = metadata !{i32 11, i32 9, metadata !34, metadata !115}
!162 = metadata !{i32 12, i32 9, metadata !36, metadata !115}
!163 = metadata !{i32 14, i32 14, metadata !38, metadata !115}
!164 = metadata !{i32 15, i32 9, metadata !40, metadata !115}
!165 = metadata !{i32 34, i32 9, metadata !52, metadata !116}
!166 = metadata !{i32 11, i32 9, metadata !34, metadata !146}
!167 = metadata !{i32 12, i32 9, metadata !36, metadata !146}
!168 = metadata !{i32 14, i32 14, metadata !38, metadata !146}
!169 = metadata !{i32 15, i32 9, metadata !40, metadata !146}
!170 = metadata !{i32 37, i32 5, metadata !12, metadata !116}
!171 = metadata !{i32 31, i32 9, metadata !50, metadata !127}
!172 = metadata !{i32 11, i32 9, metadata !34, metadata !126}
!173 = metadata !{i32 12, i32 9, metadata !36, metadata !126}
!174 = metadata !{i32 14, i32 14, metadata !38, metadata !126}
!175 = metadata !{i32 15, i32 9, metadata !40, metadata !126}
!176 = metadata !{i32 34, i32 9, metadata !52, metadata !127}
!177 = metadata !{i32 11, i32 9, metadata !34, metadata !137}
!178 = metadata !{i32 12, i32 9, metadata !36, metadata !137}
!179 = metadata !{i32 14, i32 14, metadata !38, metadata !137}
!180 = metadata !{i32 15, i32 9, metadata !40, metadata !137}
!181 = metadata !{i32 37, i32 5, metadata !12, metadata !127}
!182 = metadata !{i32 59, i32 21, metadata !101, null}
!183 = metadata !{i32 72, i32 5, metadata !15, null}

