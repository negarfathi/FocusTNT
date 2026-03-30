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
  %"15" = icmp eq i64 997, 0, !dbg !49
  br i1 %"15", label %read_slice_1_bb20, label %read_slice_1_bb7, !dbg !49

read_slice_1_bb7:                                 ; preds = %read_slice_1_bb6
  %"16" = icmp slt i64 997, 0, !dbg !52
  br i1 %"16", label %read_slice_1_bb8, label %read_slice_1_wrap_around.exit, !dbg !52

read_slice_1_bb8:                                 ; preds = %read_slice_1_bb7
  %"17" = sub nsw i64 0, 997, !dbg !55
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
  %num.0 = phi i64 [ 997, %read_slice_1_bb7 ], [ %"22", %read_slice_1_bb9 ], [ %"27", %read_slice_1_bb11 ], [ %"17", %read_slice_1_bb10 ]
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
  %"52" = icmp sle i64 20, 0, !dbg !89
  %"53" = icmp sgt i64 20, 65536, !dbg !91
  %or.cond8 = or i1 %"52", %"53", !dbg !89
  br i1 %or.cond8, label %main_bb41, label %main_wrap_around.exit2, !dbg !89

main_wrap_around.exit2:                           ; preds = %main_bb21, %main_bb40, %main_bb39, %main_bb38, %main_wrap_around.exit6
  %__fc_errno_0.0 = phi i64 [ %.0.i5, %main_wrap_around.exit6 ], [ %__fc_errno_0.0, %main_bb38 ], [ %__fc_errno_0.0, %main_bb39 ], [ %__fc_errno_0.0, %main_bb40 ], [ 0, %main_bb21 ]
  %pos.0 = phi i64 [ %pos.0, %main_wrap_around.exit6 ], [ %"108", %main_bb38 ], [ %"113", %main_bb40 ], [ %"103", %main_bb39 ], [ 0, %main_bb21 ]
  %"54" = icmp slt i64 %pos.0, 20, !dbg !93
  br i1 %"54", label %main_bb22, label %main_bb41, !dbg !93

main_bb22:                                        ; preds = %main_wrap_around.exit2
  %"55" = sub nsw i64 20, %pos.0, !dbg !95
  %"56" = icmp sgt i64 %"55", 2147483647, !dbg !97
  br i1 %"56", label %main_bb23, label %main_bb24, !dbg !97

main_bb23:                                        ; preds = %main_bb22
  %"57" = sub nsw i64 %"55", 2147483647, !dbg !98
  %"58" = sub nsw i64 %"57", 1, !dbg !98
  %"59" = srem i64 %"58", 4294967296, !dbg !98
  %"60" = add nsw i64 -2147483648, %"59", !dbg !98
  br label %main_wrap_around.exit, !dbg !98

main_bb24:                                        ; preds = %main_bb22
  %"61" = icmp slt i64 %"55", -2147483648, !dbg !99
  br i1 %"61", label %main_bb25, label %main_wrap_around.exit, !dbg !99

main_bb25:                                        ; preds = %main_bb24
  %"62" = sub nsw i64 -2147483648, %"55", !dbg !100
  %"63" = sub nsw i64 %"62", 1, !dbg !100
  %"64" = srem i64 %"63", 4294967296, !dbg !100
  %"65" = sub nsw i64 2147483647, %"64", !dbg !100
  br label %main_wrap_around.exit, !dbg !100

main_wrap_around.exit:                            ; preds = %main_bb23, %main_bb24, %main_bb25
  %.0.i = phi i64 [ %"60", %main_bb23 ], [ %"65", %main_bb25 ], [ %"55", %main_bb24 ], !dbg !95
  %"66" = load i64* @"'flag", align 8, !dbg !101
  %"67" = icmp ne i64 %"66", 1, !dbg !101
  %"68" = icmp slt i64 %pos.0, %.0.i, !dbg !103
  %or.cond = and i1 %"67", %"68", !dbg !101
  br i1 %or.cond, label %main_bb26, label %main_read_slice_1.exit, !dbg !101

main_bb26:                                        ; preds = %main_wrap_around.exit
  %"69" = add nsw i64 0, 1, !dbg !104
  %"70" = icmp sgt i64 %"69", 2147483647, !dbg !105
  br i1 %"70", label %main_bb27, label %main_bb28, !dbg !105

main_bb27:                                        ; preds = %main_bb26
  %"71" = sub nsw i64 %"69", 2147483647, !dbg !106
  %"72" = sub nsw i64 %"71", 1, !dbg !106
  %"73" = srem i64 %"72", 4294967296, !dbg !106
  %"74" = add nsw i64 -2147483648, %"73", !dbg !106
  br label %main_wrap_around.exit4.i, !dbg !106

main_bb28:                                        ; preds = %main_bb26
  %"75" = icmp slt i64 %"69", -2147483648, !dbg !107
  br i1 %"75", label %main_bb29, label %main_wrap_around.exit4.i, !dbg !107

main_bb29:                                        ; preds = %main_bb28
  %"76" = sub nsw i64 -2147483648, %"69", !dbg !108
  %"77" = sub nsw i64 %"76", 1, !dbg !108
  %"78" = srem i64 %"77", 4294967296, !dbg !108
  %"79" = sub nsw i64 2147483647, %"78", !dbg !108
  br label %main_wrap_around.exit4.i, !dbg !108

main_wrap_around.exit4.i:                         ; preds = %main_bb29, %main_bb28, %main_bb27
  %.0.i3.i = phi i64 [ %"74", %main_bb27 ], [ %"79", %main_bb29 ], [ %"69", %main_bb28 ], !dbg !104
  store i64 1, i64* @"'flag", align 8, !dbg !109
  br label %main_read_slice_1.exit, !dbg !110

main_read_slice_1.exit:                           ; preds = %main_wrap_around.exit, %main_wrap_around.exit4.i
  %__retres.0.i = phi i64 [ %.0.i3.i, %main_wrap_around.exit4.i ], [ 0, %main_wrap_around.exit ], !dbg !102
  br label %main_NodeBlock

main_NodeBlock:                                   ; preds = %main_read_slice_1.exit
  %Pivot = icmp slt i64 %__retres.0.i, 0
  br i1 %Pivot, label %main_LeafBlock, label %main_LeafBlock9

main_LeafBlock:                                   ; preds = %main_NodeBlock
  %SwitchLeaf = icmp eq i64 %__retres.0.i, -1
  br i1 %SwitchLeaf, label %main_bb30, label %main_NewDefault

main_bb30:                                        ; preds = %main_LeafBlock
  %"80" = add nsw i64 %__fc_errno_0.0, 1, !dbg !111
  %"81" = icmp sgt i64 %"80", 2147483647, !dbg !114
  br i1 %"81", label %main_bb31, label %main_bb32, !dbg !114

main_bb31:                                        ; preds = %main_bb30
  %"82" = sub nsw i64 %"80", 2147483647, !dbg !115
  %"83" = sub nsw i64 %"82", 1, !dbg !115
  %"84" = srem i64 %"83", 4294967296, !dbg !115
  %"85" = add nsw i64 -2147483648, %"84", !dbg !115
  br label %main_wrap_around.exit6, !dbg !115

main_bb32:                                        ; preds = %main_bb30
  %"86" = icmp slt i64 %"80", -2147483648, !dbg !116
  br i1 %"86", label %main_bb33, label %main_wrap_around.exit6, !dbg !116

main_bb33:                                        ; preds = %main_bb32
  %"87" = sub nsw i64 -2147483648, %"80", !dbg !117
  %"88" = sub nsw i64 %"87", 1, !dbg !117
  %"89" = srem i64 %"88", 4294967296, !dbg !117
  %"90" = sub nsw i64 2147483647, %"89", !dbg !117
  br label %main_wrap_around.exit6, !dbg !117

main_wrap_around.exit6:                           ; preds = %main_bb31, %main_bb32, %main_bb33
  %.0.i5 = phi i64 [ %"85", %main_bb31 ], [ %"90", %main_bb33 ], [ %"80", %main_bb32 ], !dbg !111
  %"91" = icmp eq i64 %.0.i5, 5, !dbg !118
  br i1 %"91", label %main_bb41, label %main_wrap_around.exit2, !dbg !118

main_LeafBlock9:                                  ; preds = %main_NodeBlock
  %SwitchLeaf10 = icmp eq i64 %__retres.0.i, 0
  br i1 %SwitchLeaf10, label %main_bb34, label %main_NewDefault

main_bb34:                                        ; preds = %main_LeafBlock9
  %"92" = add nsw i64 %__retres.0.i, 1, !dbg !120
  %"93" = icmp sgt i64 %"92", 2147483647, !dbg !123
  br i1 %"93", label %main_bb35, label %main_bb36, !dbg !123

main_bb35:                                        ; preds = %main_bb34
  %"94" = sub nsw i64 %"92", 2147483647, !dbg !124
  %"95" = sub nsw i64 %"94", 1, !dbg !124
  %"96" = srem i64 %"95", 4294967296, !dbg !124
  %"97" = add nsw i64 -2147483648, %"96", !dbg !124
  br label %main_wrap_around.exit4, !dbg !124

main_bb36:                                        ; preds = %main_bb34
  %"98" = icmp slt i64 %"92", -2147483648, !dbg !125
  br i1 %"98", label %main_bb37, label %main_wrap_around.exit4, !dbg !125

main_bb37:                                        ; preds = %main_bb36
  %"99" = sub nsw i64 -2147483648, %"92", !dbg !126
  %"100" = sub nsw i64 %"99", 1, !dbg !126
  %"101" = srem i64 %"100", 4294967296, !dbg !126
  %"102" = sub nsw i64 2147483647, %"101", !dbg !126
  br label %main_wrap_around.exit4, !dbg !126

main_NewDefault:                                  ; preds = %main_LeafBlock9, %main_LeafBlock
  br label %main_wrap_around.exit4

main_wrap_around.exit4:                           ; preds = %main_NewDefault, %main_bb37, %main_bb36, %main_bb35
  %rc.0 = phi i64 [ %__retres.0.i, %main_NewDefault ], [ %"97", %main_bb35 ], [ %"102", %main_bb37 ], [ %"92", %main_bb36 ]
  %"103" = add nsw i64 %pos.0, %rc.0, !dbg !127
  %"104" = icmp sgt i64 %"103", 2147483647, !dbg !128
  br i1 %"104", label %main_bb38, label %main_bb39, !dbg !128

main_bb38:                                        ; preds = %main_wrap_around.exit4
  %"105" = sub nsw i64 %"103", 2147483647, !dbg !129
  %"106" = sub nsw i64 %"105", 1, !dbg !129
  %"107" = srem i64 %"106", 4294967296, !dbg !129
  %"108" = add nsw i64 -2147483648, %"107", !dbg !129
  br label %main_wrap_around.exit2, !dbg !129

main_bb39:                                        ; preds = %main_wrap_around.exit4
  %"109" = icmp slt i64 %"103", -2147483648, !dbg !130
  br i1 %"109", label %main_bb40, label %main_wrap_around.exit2, !dbg !130

main_bb40:                                        ; preds = %main_bb39
  %"110" = sub nsw i64 -2147483648, %"103", !dbg !131
  %"111" = sub nsw i64 %"110", 1, !dbg !131
  %"112" = srem i64 %"111", 4294967296, !dbg !131
  %"113" = sub nsw i64 2147483647, %"112", !dbg !131
  br label %main_wrap_around.exit2, !dbg !131

main_bb41:                                        ; preds = %main_wrap_around.exit2, %main_wrap_around.exit6, %main_bb21
  ret void, !dbg !132
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
!83 = metadata !{i64 20}
!84 = metadata !{i32 786688, metadata !12, metadata !"size", metadata !5, i32 58, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [size] [line 58]
!85 = metadata !{i32 58, i32 13, metadata !12, null} ; [ DW_TAG_imported_module ]
!86 = metadata !{i32 59, i32 3, metadata !12, null}
!87 = metadata !{i32 786688, metadata !12, metadata !"__fc_errno_0", metadata !5, i32 60, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__fc_errno_0] [line 60]
!88 = metadata !{i32 60, i32 13, metadata !12, null}
!89 = metadata !{i32 61, i32 7, metadata !90, null}
!90 = metadata !{i32 786443, metadata !1, metadata !12, i32 61, i32 7, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!91 = metadata !{i32 66, i32 9, metadata !92, null}
!92 = metadata !{i32 786443, metadata !1, metadata !90, i32 66, i32 9, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!93 = metadata !{i32 70, i32 3, metadata !94, null}
!94 = metadata !{i32 786443, metadata !1, metadata !12, i32 70, i32 3, i32 1, i32 27} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!95 = metadata !{i32 71, i32 37, metadata !96, null}
!96 = metadata !{i32 786443, metadata !1, metadata !12, i32 70, i32 22, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!97 = metadata !{i32 10, i32 9, metadata !30, metadata !95}
!98 = metadata !{i32 11, i32 9, metadata !32, metadata !95}
!99 = metadata !{i32 13, i32 14, metadata !34, metadata !95}
!100 = metadata !{i32 14, i32 9, metadata !36, metadata !95}
!101 = metadata !{i32 22, i32 7, metadata !46, metadata !102}
!102 = metadata !{i32 71, i32 20, metadata !96, null}
!103 = metadata !{i32 26, i32 3, metadata !48, metadata !102}
!104 = metadata !{i32 38, i32 16, metadata !54, metadata !102}
!105 = metadata !{i32 10, i32 9, metadata !30, metadata !104}
!106 = metadata !{i32 11, i32 9, metadata !32, metadata !104}
!107 = metadata !{i32 13, i32 14, metadata !34, metadata !104}
!108 = metadata !{i32 14, i32 9, metadata !36, metadata !104}
!109 = metadata !{i32 43, i32 9, metadata !76, metadata !102}
!110 = metadata !{i32 46, i32 9, metadata !76, metadata !102}
!111 = metadata !{i32 73, i32 23, metadata !112, null}
!112 = metadata !{i32 786443, metadata !1, metadata !113, i32 72, i32 19, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!113 = metadata !{i32 786443, metadata !1, metadata !96, i32 72, i32 9, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!114 = metadata !{i32 10, i32 9, metadata !30, metadata !111}
!115 = metadata !{i32 11, i32 9, metadata !32, metadata !111}
!116 = metadata !{i32 13, i32 14, metadata !34, metadata !111}
!117 = metadata !{i32 14, i32 9, metadata !36, metadata !111}
!118 = metadata !{i32 74, i32 11, metadata !119, null}
!119 = metadata !{i32 786443, metadata !1, metadata !112, i32 74, i32 11, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!120 = metadata !{i32 81, i32 9, metadata !121, null}
!121 = metadata !{i32 786443, metadata !1, metadata !122, i32 81, i32 1, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!122 = metadata !{i32 786443, metadata !1, metadata !96, i32 80, i32 9, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!123 = metadata !{i32 10, i32 9, metadata !30, metadata !120}
!124 = metadata !{i32 11, i32 9, metadata !32, metadata !120}
!125 = metadata !{i32 13, i32 14, metadata !34, metadata !120}
!126 = metadata !{i32 14, i32 9, metadata !36, metadata !120}
!127 = metadata !{i32 83, i32 11, metadata !96, null}
!128 = metadata !{i32 10, i32 9, metadata !30, metadata !127}
!129 = metadata !{i32 11, i32 9, metadata !32, metadata !127}
!130 = metadata !{i32 13, i32 14, metadata !34, metadata !127}
!131 = metadata !{i32 14, i32 9, metadata !36, metadata !127}
!132 = metadata !{i32 85, i32 17, metadata !12, null}

