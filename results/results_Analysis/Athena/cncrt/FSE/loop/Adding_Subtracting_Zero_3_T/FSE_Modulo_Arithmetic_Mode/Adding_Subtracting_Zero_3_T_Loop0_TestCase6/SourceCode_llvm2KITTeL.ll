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
  %"15" = icmp eq i64 996, 0, !dbg !50
  br i1 %"15", label %read_bb20, label %read_bb7, !dbg !50

read_bb7:                                         ; preds = %read_bb6
  %"16" = icmp slt i64 996, 0, !dbg !53
  br i1 %"16", label %read_bb8, label %read_wrap_around.exit, !dbg !53

read_bb8:                                         ; preds = %read_bb7
  %"17" = sub nsw i64 0, 996, !dbg !56
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
  %num.0 = phi i64 [ 996, %read_bb7 ], [ %"22", %read_bb9 ], [ %"27", %read_bb11 ], [ %"17", %read_bb10 ]
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
  %"52" = icmp sle i64 5, 0, !dbg !88
  %"53" = icmp sgt i64 5, 65536, !dbg !90
  %or.cond = or i1 %"52", %"53", !dbg !88
  br i1 %or.cond, label %main_bb41, label %main_wrap_around.exit2, !dbg !88

main_wrap_around.exit2:                           ; preds = %main_bb40, %main_bb39, %main_bb38, %main_wrap_around.exit6, %main_bb21
  %errno.0 = phi i64 [ 0, %main_bb21 ], [ %.0.i5, %main_wrap_around.exit6 ], [ %errno.0, %main_bb38 ], [ %errno.0, %main_bb39 ], [ %errno.0, %main_bb40 ]
  %pos.0 = phi i64 [ 0, %main_bb21 ], [ %pos.0, %main_wrap_around.exit6 ], [ %"108", %main_bb38 ], [ %"113", %main_bb40 ], [ %"103", %main_bb39 ]
  %"54" = icmp slt i64 %pos.0, 5, !dbg !92
  br i1 %"54", label %main_bb22, label %main_bb41, !dbg !92

main_bb22:                                        ; preds = %main_wrap_around.exit2
  %"55" = sub nsw i64 5, %pos.0, !dbg !94
  %"56" = icmp sgt i64 %"55", 2147483647, !dbg !96
  br i1 %"56", label %main_bb23, label %main_bb24, !dbg !96

main_bb23:                                        ; preds = %main_bb22
  %"57" = sub nsw i64 %"55", 2147483647, !dbg !97
  %"58" = sub nsw i64 %"57", 1, !dbg !97
  %"59" = srem i64 %"58", 4294967296, !dbg !97
  %"60" = add nsw i64 -2147483648, %"59", !dbg !97
  br label %main_wrap_around.exit, !dbg !97

main_bb24:                                        ; preds = %main_bb22
  %"61" = icmp slt i64 %"55", -2147483648, !dbg !98
  br i1 %"61", label %main_bb25, label %main_wrap_around.exit, !dbg !98

main_bb25:                                        ; preds = %main_bb24
  %"62" = sub nsw i64 -2147483648, %"55", !dbg !99
  %"63" = sub nsw i64 %"62", 1, !dbg !99
  %"64" = srem i64 %"63", 4294967296, !dbg !99
  %"65" = sub nsw i64 2147483647, %"64", !dbg !99
  br label %main_wrap_around.exit, !dbg !99

main_wrap_around.exit:                            ; preds = %main_bb23, %main_bb24, %main_bb25
  %.0.i = phi i64 [ %"60", %main_bb23 ], [ %"65", %main_bb25 ], [ %"55", %main_bb24 ], !dbg !94
  %"66" = load i64* @"'flag", align 8, !dbg !100
  %"67" = icmp ne i64 %"66", 1, !dbg !100
  %"68" = icmp slt i64 %pos.0, %.0.i, !dbg !102
  %or.cond8 = and i1 %"67", %"68", !dbg !100
  br i1 %or.cond8, label %main_bb26, label %main_read.exit, !dbg !100

main_bb26:                                        ; preds = %main_wrap_around.exit
  %"69" = add nsw i64 0, 1, !dbg !103
  %"70" = icmp sgt i64 %"69", 2147483647, !dbg !104
  br i1 %"70", label %main_bb27, label %main_bb28, !dbg !104

main_bb27:                                        ; preds = %main_bb26
  %"71" = sub nsw i64 %"69", 2147483647, !dbg !105
  %"72" = sub nsw i64 %"71", 1, !dbg !105
  %"73" = srem i64 %"72", 4294967296, !dbg !105
  %"74" = add nsw i64 -2147483648, %"73", !dbg !105
  br label %main_wrap_around.exit4.i, !dbg !105

main_bb28:                                        ; preds = %main_bb26
  %"75" = icmp slt i64 %"69", -2147483648, !dbg !106
  br i1 %"75", label %main_bb29, label %main_wrap_around.exit4.i, !dbg !106

main_bb29:                                        ; preds = %main_bb28
  %"76" = sub nsw i64 -2147483648, %"69", !dbg !107
  %"77" = sub nsw i64 %"76", 1, !dbg !107
  %"78" = srem i64 %"77", 4294967296, !dbg !107
  %"79" = sub nsw i64 2147483647, %"78", !dbg !107
  br label %main_wrap_around.exit4.i, !dbg !107

main_wrap_around.exit4.i:                         ; preds = %main_bb29, %main_bb28, %main_bb27
  %.0.i3.i = phi i64 [ %"74", %main_bb27 ], [ %"79", %main_bb29 ], [ %"69", %main_bb28 ], !dbg !103
  store i64 1, i64* @"'flag", align 8, !dbg !108
  br label %main_read.exit, !dbg !109

main_read.exit:                                   ; preds = %main_wrap_around.exit, %main_wrap_around.exit4.i
  %.0.i7 = phi i64 [ %.0.i3.i, %main_wrap_around.exit4.i ], [ 0, %main_wrap_around.exit ], !dbg !101
  br label %main_NodeBlock

main_NodeBlock:                                   ; preds = %main_read.exit
  %Pivot = icmp slt i64 %.0.i7, 0
  br i1 %Pivot, label %main_LeafBlock, label %main_LeafBlock9

main_LeafBlock:                                   ; preds = %main_NodeBlock
  %SwitchLeaf = icmp eq i64 %.0.i7, -1
  br i1 %SwitchLeaf, label %main_bb30, label %main_NewDefault

main_bb30:                                        ; preds = %main_LeafBlock
  %"80" = add nsw i64 %errno.0, 1, !dbg !110
  %"81" = icmp sgt i64 %"80", 2147483647, !dbg !113
  br i1 %"81", label %main_bb31, label %main_bb32, !dbg !113

main_bb31:                                        ; preds = %main_bb30
  %"82" = sub nsw i64 %"80", 2147483647, !dbg !114
  %"83" = sub nsw i64 %"82", 1, !dbg !114
  %"84" = srem i64 %"83", 4294967296, !dbg !114
  %"85" = add nsw i64 -2147483648, %"84", !dbg !114
  br label %main_wrap_around.exit6, !dbg !114

main_bb32:                                        ; preds = %main_bb30
  %"86" = icmp slt i64 %"80", -2147483648, !dbg !115
  br i1 %"86", label %main_bb33, label %main_wrap_around.exit6, !dbg !115

main_bb33:                                        ; preds = %main_bb32
  %"87" = sub nsw i64 -2147483648, %"80", !dbg !116
  %"88" = sub nsw i64 %"87", 1, !dbg !116
  %"89" = srem i64 %"88", 4294967296, !dbg !116
  %"90" = sub nsw i64 2147483647, %"89", !dbg !116
  br label %main_wrap_around.exit6, !dbg !116

main_wrap_around.exit6:                           ; preds = %main_bb31, %main_bb32, %main_bb33
  %.0.i5 = phi i64 [ %"85", %main_bb31 ], [ %"90", %main_bb33 ], [ %"80", %main_bb32 ], !dbg !110
  %"91" = icmp eq i64 %.0.i5, 5, !dbg !117
  br i1 %"91", label %main_bb41, label %main_wrap_around.exit2, !dbg !117

main_LeafBlock9:                                  ; preds = %main_NodeBlock
  %SwitchLeaf10 = icmp eq i64 %.0.i7, 0
  br i1 %SwitchLeaf10, label %main_bb34, label %main_NewDefault

main_bb34:                                        ; preds = %main_LeafBlock9
  %"92" = add nsw i64 %.0.i7, 1, !dbg !119
  %"93" = icmp sgt i64 %"92", 2147483647, !dbg !122
  br i1 %"93", label %main_bb35, label %main_bb36, !dbg !122

main_bb35:                                        ; preds = %main_bb34
  %"94" = sub nsw i64 %"92", 2147483647, !dbg !123
  %"95" = sub nsw i64 %"94", 1, !dbg !123
  %"96" = srem i64 %"95", 4294967296, !dbg !123
  %"97" = add nsw i64 -2147483648, %"96", !dbg !123
  br label %main_wrap_around.exit4, !dbg !123

main_bb36:                                        ; preds = %main_bb34
  %"98" = icmp slt i64 %"92", -2147483648, !dbg !124
  br i1 %"98", label %main_bb37, label %main_wrap_around.exit4, !dbg !124

main_bb37:                                        ; preds = %main_bb36
  %"99" = sub nsw i64 -2147483648, %"92", !dbg !125
  %"100" = sub nsw i64 %"99", 1, !dbg !125
  %"101" = srem i64 %"100", 4294967296, !dbg !125
  %"102" = sub nsw i64 2147483647, %"101", !dbg !125
  br label %main_wrap_around.exit4, !dbg !125

main_NewDefault:                                  ; preds = %main_LeafBlock9, %main_LeafBlock
  br label %main_wrap_around.exit4

main_wrap_around.exit4:                           ; preds = %main_NewDefault, %main_bb37, %main_bb36, %main_bb35
  %rc.0 = phi i64 [ %.0.i7, %main_NewDefault ], [ %"97", %main_bb35 ], [ %"102", %main_bb37 ], [ %"92", %main_bb36 ]
  %"103" = add nsw i64 %pos.0, %rc.0, !dbg !126
  %"104" = icmp sgt i64 %"103", 2147483647, !dbg !127
  br i1 %"104", label %main_bb38, label %main_bb39, !dbg !127

main_bb38:                                        ; preds = %main_wrap_around.exit4
  %"105" = sub nsw i64 %"103", 2147483647, !dbg !128
  %"106" = sub nsw i64 %"105", 1, !dbg !128
  %"107" = srem i64 %"106", 4294967296, !dbg !128
  %"108" = add nsw i64 -2147483648, %"107", !dbg !128
  br label %main_wrap_around.exit2, !dbg !128

main_bb39:                                        ; preds = %main_wrap_around.exit4
  %"109" = icmp slt i64 %"103", -2147483648, !dbg !129
  br i1 %"109", label %main_bb40, label %main_wrap_around.exit2, !dbg !129

main_bb40:                                        ; preds = %main_bb39
  %"110" = sub nsw i64 -2147483648, %"103", !dbg !130
  %"111" = sub nsw i64 %"110", 1, !dbg !130
  %"112" = srem i64 %"111", 4294967296, !dbg !130
  %"113" = sub nsw i64 2147483647, %"112", !dbg !130
  br label %main_wrap_around.exit2, !dbg !130

main_bb41:                                        ; preds = %main_wrap_around.exit2, %main_wrap_around.exit6, %main_bb21
  ret i32 0, !dbg !131
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
!82 = metadata !{i64 5}
!83 = metadata !{i32 786688, metadata !12, metadata !"size", metadata !5, i32 82, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [size] [line 82]
!84 = metadata !{i32 82, i32 15, metadata !12, null}
!85 = metadata !{i32 83, i32 5, metadata !12, null}
!86 = metadata !{i32 786688, metadata !12, metadata !"errno", metadata !5, i32 84, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [errno] [line 84]
!87 = metadata !{i32 84, i32 15, metadata !12, null}
!88 = metadata !{i32 85, i32 9, metadata !89, null}
!89 = metadata !{i32 786443, metadata !1, metadata !12, i32 85, i32 9, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!90 = metadata !{i32 85, i32 9, metadata !91, null}
!91 = metadata !{i32 786443, metadata !1, metadata !89, i32 85, i32 9, i32 1, i32 25} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!92 = metadata !{i32 89, i32 5, metadata !93, null}
!93 = metadata !{i32 786443, metadata !1, metadata !12, i32 89, i32 5, i32 1, i32 26} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!94 = metadata !{i32 91, i32 35, metadata !95, null}
!95 = metadata !{i32 786443, metadata !1, metadata !12, i32 90, i32 5, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!96 = metadata !{i32 35, i32 9, metadata !31, metadata !94}
!97 = metadata !{i32 36, i32 9, metadata !33, metadata !94}
!98 = metadata !{i32 38, i32 14, metadata !35, metadata !94}
!99 = metadata !{i32 39, i32 9, metadata !37, metadata !94}
!100 = metadata !{i32 46, i32 9, metadata !47, metadata !101}
!101 = metadata !{i32 91, i32 24, metadata !95, null}
!102 = metadata !{i32 50, i32 5, metadata !49, metadata !101}
!103 = metadata !{i32 64, i32 22, metadata !55, metadata !101}
!104 = metadata !{i32 35, i32 9, metadata !31, metadata !103}
!105 = metadata !{i32 36, i32 9, metadata !33, metadata !103}
!106 = metadata !{i32 38, i32 14, metadata !35, metadata !103}
!107 = metadata !{i32 39, i32 9, metadata !37, metadata !103}
!108 = metadata !{i32 72, i32 17, metadata !77, metadata !101}
!109 = metadata !{i32 73, i32 17, metadata !77, metadata !101}
!110 = metadata !{i32 94, i32 22, metadata !111, null}
!111 = metadata !{i32 786443, metadata !1, metadata !112, i32 93, i32 9, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!112 = metadata !{i32 786443, metadata !1, metadata !95, i32 92, i32 13, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!113 = metadata !{i32 35, i32 9, metadata !31, metadata !110}
!114 = metadata !{i32 36, i32 9, metadata !33, metadata !110}
!115 = metadata !{i32 38, i32 14, metadata !35, metadata !110}
!116 = metadata !{i32 39, i32 9, metadata !37, metadata !110}
!117 = metadata !{i32 95, i32 17, metadata !118, null}
!118 = metadata !{i32 786443, metadata !1, metadata !111, i32 95, i32 17, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!119 = metadata !{i32 103, i32 19, metadata !120, null}
!120 = metadata !{i32 786443, metadata !1, metadata !121, i32 102, i32 1, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!121 = metadata !{i32 786443, metadata !1, metadata !95, i32 101, i32 13, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!122 = metadata !{i32 35, i32 9, metadata !31, metadata !119}
!123 = metadata !{i32 36, i32 9, metadata !33, metadata !119}
!124 = metadata !{i32 38, i32 14, metadata !35, metadata !119}
!125 = metadata !{i32 39, i32 9, metadata !37, metadata !119}
!126 = metadata !{i32 105, i32 15, metadata !95, null}
!127 = metadata !{i32 35, i32 9, metadata !31, metadata !126}
!128 = metadata !{i32 36, i32 9, metadata !33, metadata !126}
!129 = metadata !{i32 38, i32 14, metadata !35, metadata !126}
!130 = metadata !{i32 39, i32 9, metadata !37, metadata !126}
!131 = metadata !{i32 108, i32 1, metadata !12, null}

