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
  %"15" = icmp eq i64 -250, 0, !dbg !49
  br i1 %"15", label %read_slice_1_bb20, label %read_slice_1_bb7, !dbg !49

read_slice_1_bb7:                                 ; preds = %read_slice_1_bb6
  %"16" = icmp slt i64 -250, 0, !dbg !52
  br i1 %"16", label %read_slice_1_bb8, label %read_slice_1_wrap_around.exit, !dbg !52

read_slice_1_bb8:                                 ; preds = %read_slice_1_bb7
  %"17" = sub nsw i64 0, -250, !dbg !55
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
  %num.0 = phi i64 [ -250, %read_slice_1_bb7 ], [ %"22", %read_slice_1_bb9 ], [ %"27", %read_slice_1_bb11 ], [ %"17", %read_slice_1_bb10 ]
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
  call void @llvm.dbg.value(metadata !81, i64 0, metadata !82), !dbg !83
  %"52" = icmp sle i64 6, 0, !dbg !84
  br i1 %"52", label %main_bb38, label %main_bb22, !dbg !84

main_bb22:                                        ; preds = %main_bb21
  call void @llvm.dbg.value(metadata !42, i64 0, metadata !86), !dbg !87
  call void @llvm.dbg.value(metadata !{i64 %buf.0}, i64 0, metadata !88), !dbg !91
  call void @llvm.dbg.value(metadata !{i64 %count.0}, i64 0, metadata !92), !dbg !93
  call void @llvm.dbg.value(metadata !42, i64 0, metadata !94), !dbg !95
  %"53" = load i64* @"'flag", align 8, !dbg !96
  call void @llvm.dbg.value(metadata !{i64 %__retres.0.i}, i64 0, metadata !97), !dbg !98
  call void @llvm.dbg.value(metadata !{i64 %"80"}, i64 0, metadata !99), !dbg !101
  call void @llvm.dbg.value(metadata !102, i64 0, metadata !103), !dbg !104
  call void @llvm.dbg.value(metadata !105, i64 0, metadata !106), !dbg !107
  call void @llvm.dbg.value(metadata !108, i64 0, metadata !109), !dbg !110
  call void @llvm.dbg.value(metadata !{i64 %.0.i2}, i64 0, metadata !82), !dbg !83
  call void @llvm.dbg.value(metadata !{i64 %"91"}, i64 0, metadata !111), !dbg !113
  call void @llvm.dbg.value(metadata !102, i64 0, metadata !114), !dbg !115
  call void @llvm.dbg.value(metadata !105, i64 0, metadata !116), !dbg !117
  call void @llvm.dbg.value(metadata !108, i64 0, metadata !118), !dbg !119
  br label %main_wrap_around.exit, !dbg !120

main_wrap_around.exit:                            ; preds = %main_bb37, %main_bb36, %main_bb35, %main_bb22
  %buf.0 = phi i64 [ 0, %main_bb22 ], [ %"96", %main_bb35 ], [ %"101", %main_bb37 ], [ %"91", %main_bb36 ]
  %count.0 = phi i64 [ 6, %main_bb22 ], [ %.0.i2, %main_bb35 ], [ %.0.i2, %main_bb36 ], [ %.0.i2, %main_bb37 ]
  %"54" = icmp sgt i64 %count.0, 0, !dbg !121
  br i1 %"54", label %main_bb23, label %main_bb38, !dbg !121

main_bb23:                                        ; preds = %main_wrap_around.exit
  %"55" = icmp eq i64 %"53", 1, !dbg !96
  br i1 %"55", label %main_read_slice_1.exit, label %main_wrap_around.exit2.i, !dbg !96

main_wrap_around.exit2.i:                         ; preds = %main_bb30, %main_bb29, %main_bb28, %main_bb23
  %count.0.i = phi i64 [ 0, %main_bb23 ], [ %.0.i3.i, %main_bb28 ], [ %.0.i3.i, %main_bb29 ], [ %.0.i3.i, %main_bb30 ], !dbg !89
  %.0.i = phi i64 [ %buf.0, %main_bb23 ], [ %"73", %main_bb28 ], [ %"78", %main_bb30 ], [ %"68", %main_bb29 ], !dbg !89
  %"56" = icmp slt i64 %.0.i, %count.0, !dbg !123
  br i1 %"56", label %main_bb24, label %main_read_slice_1.exit, !dbg !123

main_bb24:                                        ; preds = %main_wrap_around.exit2.i
  %"57" = add nsw i64 %count.0.i, 1, !dbg !124
  %"58" = icmp sgt i64 %"57", 2147483647, !dbg !125
  br i1 %"58", label %main_bb25, label %main_bb26, !dbg !125

main_bb25:                                        ; preds = %main_bb24
  %"59" = sub nsw i64 %"57", 2147483647, !dbg !126
  %"60" = sub nsw i64 %"59", 1, !dbg !126
  %"61" = srem i64 %"60", 4294967296, !dbg !126
  %"62" = add nsw i64 -2147483648, %"61", !dbg !126
  br label %main_wrap_around.exit4.i, !dbg !126

main_bb26:                                        ; preds = %main_bb24
  %"63" = icmp slt i64 %"57", -2147483648, !dbg !127
  br i1 %"63", label %main_bb27, label %main_wrap_around.exit4.i, !dbg !127

main_bb27:                                        ; preds = %main_bb26
  %"64" = sub nsw i64 -2147483648, %"57", !dbg !128
  %"65" = sub nsw i64 %"64", 1, !dbg !128
  %"66" = srem i64 %"65", 4294967296, !dbg !128
  %"67" = sub nsw i64 2147483647, %"66", !dbg !128
  br label %main_wrap_around.exit4.i, !dbg !128

main_wrap_around.exit4.i:                         ; preds = %main_bb27, %main_bb26, %main_bb25
  %.0.i3.i = phi i64 [ %"62", %main_bb25 ], [ %"67", %main_bb27 ], [ %"57", %main_bb26 ], !dbg !124
  %"68" = add nsw i64 %.0.i, 1, !dbg !129
  %"69" = icmp sgt i64 %"68", 2147483647, !dbg !130
  br i1 %"69", label %main_bb28, label %main_bb29, !dbg !130

main_bb28:                                        ; preds = %main_wrap_around.exit4.i
  %"70" = sub nsw i64 %"68", 2147483647, !dbg !131
  %"71" = sub nsw i64 %"70", 1, !dbg !131
  %"72" = srem i64 %"71", 4294967296, !dbg !131
  %"73" = add nsw i64 -2147483648, %"72", !dbg !131
  br label %main_wrap_around.exit2.i, !dbg !131

main_bb29:                                        ; preds = %main_wrap_around.exit4.i
  %"74" = icmp slt i64 %"68", -2147483648, !dbg !132
  br i1 %"74", label %main_bb30, label %main_wrap_around.exit2.i, !dbg !132

main_bb30:                                        ; preds = %main_bb29
  %"75" = sub nsw i64 -2147483648, %"68", !dbg !133
  %"76" = sub nsw i64 %"75", 1, !dbg !133
  %"77" = srem i64 %"76", 4294967296, !dbg !133
  %"78" = sub nsw i64 2147483647, %"77", !dbg !133
  br label %main_wrap_around.exit2.i, !dbg !133

main_read_slice_1.exit:                           ; preds = %main_bb23, %main_wrap_around.exit2.i
  %__retres.0.i = phi i64 [ 0, %main_bb23 ], [ %count.0.i, %main_wrap_around.exit2.i ], !dbg !89
  %"79" = icmp slt i64 %__retres.0.i, 0, !dbg !134
  br i1 %"79", label %main_bb38, label %main_bb31, !dbg !134

main_bb31:                                        ; preds = %main_read_slice_1.exit
  %"80" = sub nsw i64 %count.0, %__retres.0.i, !dbg !100
  %"81" = icmp sgt i64 %"80", 2147483647, !dbg !136
  br i1 %"81", label %main_bb32, label %main_bb33, !dbg !136

main_bb32:                                        ; preds = %main_bb31
  %"82" = sub nsw i64 %"80", 2147483647, !dbg !137
  %"83" = sub nsw i64 %"82", 1, !dbg !137
  %"84" = srem i64 %"83", 4294967296, !dbg !137
  %"85" = add nsw i64 -2147483648, %"84", !dbg !137
  br label %main_wrap_around.exit3, !dbg !137

main_bb33:                                        ; preds = %main_bb31
  %"86" = icmp slt i64 %"80", -2147483648, !dbg !138
  br i1 %"86", label %main_bb34, label %main_wrap_around.exit3, !dbg !138

main_bb34:                                        ; preds = %main_bb33
  %"87" = sub nsw i64 -2147483648, %"80", !dbg !139
  %"88" = sub nsw i64 %"87", 1, !dbg !139
  %"89" = srem i64 %"88", 4294967296, !dbg !139
  %"90" = sub nsw i64 2147483647, %"89", !dbg !139
  br label %main_wrap_around.exit3, !dbg !139

main_wrap_around.exit3:                           ; preds = %main_bb32, %main_bb33, %main_bb34
  %.0.i2 = phi i64 [ %"85", %main_bb32 ], [ %"90", %main_bb34 ], [ %"80", %main_bb33 ], !dbg !100
  %"91" = add nsw i64 %buf.0, %__retres.0.i, !dbg !112
  %"92" = icmp sgt i64 %"91", 2147483647, !dbg !140
  br i1 %"92", label %main_bb35, label %main_bb36, !dbg !140

main_bb35:                                        ; preds = %main_wrap_around.exit3
  %"93" = sub nsw i64 %"91", 2147483647, !dbg !141
  %"94" = sub nsw i64 %"93", 1, !dbg !141
  %"95" = srem i64 %"94", 4294967296, !dbg !141
  %"96" = add nsw i64 -2147483648, %"95", !dbg !141
  br label %main_wrap_around.exit, !dbg !141

main_bb36:                                        ; preds = %main_wrap_around.exit3
  %"97" = icmp slt i64 %"91", -2147483648, !dbg !142
  br i1 %"97", label %main_bb37, label %main_wrap_around.exit, !dbg !142

main_bb37:                                        ; preds = %main_bb36
  %"98" = sub nsw i64 -2147483648, %"91", !dbg !143
  %"99" = sub nsw i64 %"98", 1, !dbg !143
  %"100" = srem i64 %"99", 4294967296, !dbg !143
  %"101" = sub nsw i64 2147483647, %"100", !dbg !143
  br label %main_wrap_around.exit, !dbg !143

main_bb38:                                        ; preds = %main_wrap_around.exit, %main_read_slice_1.exit, %main_bb21
  ret void, !dbg !144
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
!48 = metadata !{i32 786443, metadata !1, metadata !9, i32 26, i32 3, i32 1, i32 20} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
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
!81 = metadata !{i64 6}
!82 = metadata !{i32 786688, metadata !12, metadata !"count", metadata !5, i32 58, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 58]
!83 = metadata !{i32 58, i32 13, metadata !12, null} ; [ DW_TAG_imported_module ]
!84 = metadata !{i32 59, i32 7, metadata !85, null}
!85 = metadata !{i32 786443, metadata !1, metadata !12, i32 59, i32 7, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!86 = metadata !{i32 786688, metadata !12, metadata !"buf", metadata !5, i32 63, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [buf] [line 63]
!87 = metadata !{i32 63, i32 13, metadata !12, null}
!88 = metadata !{i32 786689, metadata !9, metadata !"loc", metadata !5, i32 16777234, metadata !8, i32 0, metadata !89} ; [ DW_TAG_arg_variable ] [loc] [line 18]
!89 = metadata !{i32 65, i32 11, metadata !90, null}
!90 = metadata !{i32 786443, metadata !1, metadata !12, i32 64, i32 21, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!91 = metadata !{i32 18, i32 34, metadata !9, metadata !89}
!92 = metadata !{i32 786689, metadata !9, metadata !"len", metadata !5, i32 33554450, metadata !8, i32 0, metadata !89} ; [ DW_TAG_arg_variable ] [len] [line 18]
!93 = metadata !{i32 18, i32 49, metadata !9, metadata !89}
!94 = metadata !{i32 786688, metadata !9, metadata !"count", metadata !5, i32 21, metadata !8, i32 0, metadata !89} ; [ DW_TAG_auto_variable ] [count] [line 21]
!95 = metadata !{i32 21, i32 13, metadata !9, metadata !89}
!96 = metadata !{i32 22, i32 7, metadata !46, metadata !89}
!97 = metadata !{i32 786688, metadata !12, metadata !"ret", metadata !5, i32 57, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ret] [line 57]
!98 = metadata !{i32 57, i32 13, metadata !12, null}
!99 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777224, metadata !8, i32 0, metadata !100} ; [ DW_TAG_arg_variable ] [value] [line 8]
!100 = metadata !{i32 70, i32 13, metadata !90, null}
!101 = metadata !{i32 8, i32 33, metadata !4, metadata !100} ; [ DW_TAG_imported_declaration ]
!102 = metadata !{i64 -2147483648}
!103 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554440, metadata !8, i32 0, metadata !100} ; [ DW_TAG_arg_variable ] [lower_bound] [line 8]
!104 = metadata !{i32 8, i32 50, metadata !4, metadata !100} ; [ DW_TAG_imported_declaration ]
!105 = metadata !{i64 2147483647}
!106 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331656, metadata !8, i32 0, metadata !100} ; [ DW_TAG_arg_variable ] [upper_bound] [line 8]
!107 = metadata !{i32 8, i32 73, metadata !4, metadata !100} ; [ DW_TAG_imported_declaration ]
!108 = metadata !{i64 4294967296}
!109 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 9, metadata !8, i32 0, metadata !100} ; [ DW_TAG_auto_variable ] [range] [line 9]
!110 = metadata !{i32 9, i32 15, metadata !4, metadata !100}
!111 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777224, metadata !8, i32 0, metadata !112} ; [ DW_TAG_arg_variable ] [value] [line 8]
!112 = metadata !{i32 71, i32 11, metadata !90, null}
!113 = metadata !{i32 8, i32 33, metadata !4, metadata !112} ; [ DW_TAG_imported_declaration ]
!114 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554440, metadata !8, i32 0, metadata !112} ; [ DW_TAG_arg_variable ] [lower_bound] [line 8]
!115 = metadata !{i32 8, i32 50, metadata !4, metadata !112} ; [ DW_TAG_imported_declaration ]
!116 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331656, metadata !8, i32 0, metadata !112} ; [ DW_TAG_arg_variable ] [upper_bound] [line 8]
!117 = metadata !{i32 8, i32 73, metadata !4, metadata !112} ; [ DW_TAG_imported_declaration ]
!118 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 9, metadata !8, i32 0, metadata !112} ; [ DW_TAG_auto_variable ] [range] [line 9]
!119 = metadata !{i32 9, i32 15, metadata !4, metadata !112}
!120 = metadata !{i32 64, i32 3, metadata !12, null}
!121 = metadata !{i32 64, i32 3, metadata !122, null}
!122 = metadata !{i32 786443, metadata !1, metadata !12, i32 64, i32 3, i32 1, i32 21} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!123 = metadata !{i32 26, i32 3, metadata !48, metadata !89}
!124 = metadata !{i32 38, i32 16, metadata !54, metadata !89}
!125 = metadata !{i32 10, i32 9, metadata !30, metadata !124}
!126 = metadata !{i32 11, i32 9, metadata !32, metadata !124}
!127 = metadata !{i32 13, i32 14, metadata !34, metadata !124}
!128 = metadata !{i32 14, i32 9, metadata !36, metadata !124}
!129 = metadata !{i32 40, i32 10, metadata !70, metadata !89}
!130 = metadata !{i32 10, i32 9, metadata !30, metadata !129}
!131 = metadata !{i32 11, i32 9, metadata !32, metadata !129}
!132 = metadata !{i32 13, i32 14, metadata !34, metadata !129}
!133 = metadata !{i32 14, i32 9, metadata !36, metadata !129}
!134 = metadata !{i32 66, i32 9, metadata !135, null}
!135 = metadata !{i32 786443, metadata !1, metadata !90, i32 66, i32 9, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!136 = metadata !{i32 10, i32 9, metadata !30, metadata !100}
!137 = metadata !{i32 11, i32 9, metadata !32, metadata !100}
!138 = metadata !{i32 13, i32 14, metadata !34, metadata !100}
!139 = metadata !{i32 14, i32 9, metadata !36, metadata !100}
!140 = metadata !{i32 10, i32 9, metadata !30, metadata !112}
!141 = metadata !{i32 11, i32 9, metadata !32, metadata !112}
!142 = metadata !{i32 13, i32 14, metadata !34, metadata !112}
!143 = metadata !{i32 14, i32 9, metadata !36, metadata !112}
!144 = metadata !{i32 73, i32 17, metadata !12, null}

