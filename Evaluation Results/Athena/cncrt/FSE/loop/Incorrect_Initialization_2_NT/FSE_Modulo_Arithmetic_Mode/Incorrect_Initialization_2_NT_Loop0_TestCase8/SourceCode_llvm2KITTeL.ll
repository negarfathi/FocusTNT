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
  %.0 = phi i64 [ 2, %res_return_wrap_around.exit ], [ -1, %res_return_wrap_around.exit2 ]
  ret i64 %.0, !dbg !83
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
main_bb16:
  call void @llvm.dbg.value(metadata !84, i64 0, metadata !85), !dbg !86
  call void @llvm.dbg.value(metadata !87, i64 0, metadata !88), !dbg !89
  call void @llvm.dbg.value(metadata !{i64 %matroska.0}, i64 0, metadata !90), !dbg !93
  call void @llvm.dbg.value(metadata !94, i64 0, metadata !95), !dbg !98
  call void @llvm.dbg.value(metadata !{i64 %"41"}, i64 0, metadata !99), !dbg !103
  call void @llvm.dbg.value(metadata !56, i64 0, metadata !104), !dbg !105
  call void @llvm.dbg.value(metadata !59, i64 0, metadata !106), !dbg !107
  call void @llvm.dbg.value(metadata !62, i64 0, metadata !108), !dbg !109
  call void @llvm.dbg.value(metadata !{i64 %"41"}, i64 0, metadata !110), !dbg !112
  call void @llvm.dbg.value(metadata !56, i64 0, metadata !113), !dbg !114
  call void @llvm.dbg.value(metadata !59, i64 0, metadata !115), !dbg !116
  call void @llvm.dbg.value(metadata !62, i64 0, metadata !117), !dbg !118
  call void @llvm.dbg.value(metadata !56, i64 0, metadata !119), !dbg !123
  call void @llvm.dbg.value(metadata !59, i64 0, metadata !124), !dbg !125
  call void @llvm.dbg.value(metadata !62, i64 0, metadata !126), !dbg !127
  call void @llvm.dbg.value(metadata !56, i64 0, metadata !128), !dbg !132
  call void @llvm.dbg.value(metadata !59, i64 0, metadata !133), !dbg !134
  call void @llvm.dbg.value(metadata !62, i64 0, metadata !135), !dbg !136
  call void @llvm.dbg.value(metadata !137, i64 0, metadata !88), !dbg !89
  call void @llvm.dbg.value(metadata !56, i64 0, metadata !138), !dbg !140
  call void @llvm.dbg.value(metadata !59, i64 0, metadata !141), !dbg !142
  call void @llvm.dbg.value(metadata !62, i64 0, metadata !143), !dbg !144
  call void @llvm.dbg.value(metadata !56, i64 0, metadata !145), !dbg !147
  call void @llvm.dbg.value(metadata !59, i64 0, metadata !148), !dbg !149
  call void @llvm.dbg.value(metadata !62, i64 0, metadata !150), !dbg !151
  br label %main_bb17, !dbg !152

main_bb17:                                        ; preds = %main_NewDefault, %main_bb18, %main_bb16
  %res.0 = phi i64 [ 0, %main_bb16 ], [ %res.1, %main_NewDefault ], [ %res.1, %main_bb18 ]
  %matroska.0 = phi i64 [ 6, %main_bb16 ], [ 1, %main_bb18 ], [ %matroska.0, %main_NewDefault ]
  %"36" = icmp eq i64 %matroska.0, 1, !dbg !153
  %..i = select i1 %"36", i64 0, i64 1, !dbg !154
  %"37" = icmp ne i64 %..i, 0, !dbg !91
  br i1 %"37", label %main_res_return.exit, label %main_bb28, !dbg !91

main_res_return.exit:                             ; preds = %main_wrap_around.exit.i, %main_wrap_around.exit2.i, %main_bb17
  %res.1 = phi i64 [ %res.0, %main_bb17 ], [ 2, %main_wrap_around.exit.i ], [ -1, %main_wrap_around.exit2.i ]
  br label %main_NodeBlock

main_NodeBlock:                                   ; preds = %main_res_return.exit
  %Pivot = icmp slt i64 %res.1, 0
  br i1 %Pivot, label %main_LeafBlock, label %main_LeafBlock13

main_LeafBlock:                                   ; preds = %main_NodeBlock
  %SwitchLeaf = icmp eq i64 %res.1, -1
  br i1 %SwitchLeaf, label %main_bb18, label %main_NewDefault

main_bb18:                                        ; preds = %main_LeafBlock
  call void @llvm.dbg.value(metadata !137, i64 0, metadata !85), !dbg !86
  br label %main_bb17, !dbg !155

main_LeafBlock13:                                 ; preds = %main_NodeBlock
  %SwitchLeaf14 = icmp eq i64 %res.1, 0
  br i1 %SwitchLeaf14, label %main_bb19, label %main_NewDefault

main_bb19:                                        ; preds = %main_LeafBlock13
  %"38" = load i64* @"'flag", align 8, !dbg !158
  %"39" = add nsw i64 %"38", 1, !dbg !158
  store i64 %"39", i64* @"'flag", align 8, !dbg !158
  %"40" = icmp slt i64 %"38", 100, !dbg !158
  %"41" = load i64* @"'flag", align 8, !dbg !100
  %"42" = icmp sgt i64 %"41", 2147483647, !dbg !159
  br i1 %"40", label %main_bb20, label %main_bb24, !dbg !158

main_bb20:                                        ; preds = %main_bb19
  br i1 %"42", label %main_bb21, label %main_bb22, !dbg !159

main_bb21:                                        ; preds = %main_bb20
  %"43" = sub nsw i64 %"41", 2147483647, !dbg !160
  %"44" = sub nsw i64 %"43", 1, !dbg !160
  %"45" = srem i64 %"44", 4294967296, !dbg !160
  %"46" = add nsw i64 -2147483648, %"45", !dbg !160
  br label %main_wrap_around.exit.i, !dbg !160

main_bb22:                                        ; preds = %main_bb20
  %"47" = icmp slt i64 %"41", -2147483648, !dbg !161
  br i1 %"47", label %main_bb23, label %main_wrap_around.exit.i, !dbg !161

main_bb23:                                        ; preds = %main_bb22
  %"48" = sub nsw i64 -2147483648, %"41", !dbg !162
  %"49" = sub nsw i64 %"48", 1, !dbg !162
  %"50" = srem i64 %"49", 4294967296, !dbg !162
  %"51" = sub nsw i64 2147483647, %"50", !dbg !162
  br label %main_wrap_around.exit.i, !dbg !162

main_wrap_around.exit.i:                          ; preds = %main_bb23, %main_bb22, %main_bb21
  %.0.i.i = phi i64 [ %"46", %main_bb21 ], [ %"51", %main_bb23 ], [ %"41", %main_bb22 ], !dbg !100
  store i64 %.0.i.i, i64* @"'flag", align 8, !dbg !100
  br label %main_res_return.exit, !dbg !163

main_bb24:                                        ; preds = %main_bb19
  br i1 %"42", label %main_bb25, label %main_bb26, !dbg !164

main_bb25:                                        ; preds = %main_bb24
  %"52" = sub nsw i64 %"41", 2147483647, !dbg !165
  %"53" = sub nsw i64 %"52", 1, !dbg !165
  %"54" = srem i64 %"53", 4294967296, !dbg !165
  %"55" = add nsw i64 -2147483648, %"54", !dbg !165
  br label %main_wrap_around.exit2.i, !dbg !165

main_bb26:                                        ; preds = %main_bb24
  %"56" = icmp slt i64 %"41", -2147483648, !dbg !166
  br i1 %"56", label %main_bb27, label %main_wrap_around.exit2.i, !dbg !166

main_bb27:                                        ; preds = %main_bb26
  %"57" = sub nsw i64 -2147483648, %"41", !dbg !167
  %"58" = sub nsw i64 %"57", 1, !dbg !167
  %"59" = srem i64 %"58", 4294967296, !dbg !167
  %"60" = sub nsw i64 2147483647, %"59", !dbg !167
  br label %main_wrap_around.exit2.i, !dbg !167

main_wrap_around.exit2.i:                         ; preds = %main_bb27, %main_bb26, %main_bb25
  %.0.i1.i = phi i64 [ %"55", %main_bb25 ], [ %"60", %main_bb27 ], [ %"41", %main_bb26 ], !dbg !111
  store i64 %.0.i1.i, i64* @"'flag", align 8, !dbg !111
  br label %main_res_return.exit, !dbg !168

main_NewDefault:                                  ; preds = %main_LeafBlock13, %main_LeafBlock
  br label %main_bb17

main_bb28:                                        ; preds = %main_bb17
  ret i32 0, !dbg !169
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
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"wrap_around", metadata !"wrap_around", metadata !"", i32 12, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i64, i64, i64)* @wrap_around, null, null, metadata !2, i32 12} ; [ DW_TAG_subprogram ] [line 12] [def] [wrap_around]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"matroska_deliver_packet", metadata !"matroska_deliver_packet", metadata !"", i32 22, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i64)* @matroska_deliver_packet, null, null, metadata !2, i32 23} ; [ DW_TAG_subprogram ] [line 22] [def] [scope 23] [matroska_deliver_packet]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !8, metadata !8}
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"res_return", metadata !"res_return", metadata !"", i32 32, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i64 ()* @res_return, null, null, metadata !2, i32 33} ; [ DW_TAG_subprogram ] [line 32] [def] [scope 33] [res_return]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{metadata !8}
!15 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 42, metadata !16, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 43} ; [ DW_TAG_subprogram ] [line 42] [def] [scope 43] [main]
!16 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !17, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!17 = metadata !{metadata !18}
!18 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!19 = metadata !{metadata !20}
!20 = metadata !{i32 786484, i32 0, null, metadata !"flag", metadata !"flag", metadata !"", metadata !5, i32 31, metadata !8, i32 0, i32 1, i64* @"'flag", null} ; [ DW_TAG_variable ] [flag] [line 31] [def]
!21 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!22 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!23 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!24 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777228, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 12]
!25 = metadata !{i32 12, i32 33, metadata !4, null}
!26 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554444, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [lower_bound] [line 12]
!27 = metadata !{i32 12, i32 50, metadata !4, null}
!28 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331660, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [upper_bound] [line 12]
!29 = metadata !{i32 12, i32 73, metadata !4, null}
!30 = metadata !{i32 13, i32 5, metadata !4, null}
!31 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 13, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [range] [line 13]
!32 = metadata !{i32 13, i32 15, metadata !4, null}
!33 = metadata !{i32 14, i32 9, metadata !34, null}
!34 = metadata !{i32 786443, metadata !1, metadata !4, i32 14, i32 9, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!35 = metadata !{i32 15, i32 9, metadata !36, null}
!36 = metadata !{i32 786443, metadata !1, metadata !34, i32 14, i32 30, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!37 = metadata !{i32 17, i32 14, metadata !38, null}
!38 = metadata !{i32 786443, metadata !1, metadata !34, i32 17, i32 14, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!39 = metadata !{i32 18, i32 9, metadata !40, null}
!40 = metadata !{i32 786443, metadata !1, metadata !38, i32 17, i32 35, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!41 = metadata !{i32 21, i32 1, metadata !4, null}
!42 = metadata !{i32 786689, metadata !9, metadata !"q", metadata !5, i32 16777238, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [q] [line 22]
!43 = metadata !{i32 22, i32 46, metadata !9, null}
!44 = metadata !{i32 24, i32 9, metadata !45, null}
!45 = metadata !{i32 786443, metadata !1, metadata !9, i32 24, i32 9, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!46 = metadata !{i32 26, i32 9, metadata !47, null}
!47 = metadata !{i32 786443, metadata !1, metadata !45, i32 25, i32 1, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!48 = metadata !{i32 30, i32 1, metadata !9, null}
!49 = metadata !{i32 34, i32 9, metadata !50, null}
!50 = metadata !{i32 786443, metadata !1, metadata !12, i32 34, i32 9, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!51 = metadata !{i32 36, i32 8, metadata !52, null}
!52 = metadata !{i32 786443, metadata !1, metadata !50, i32 35, i32 1, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!53 = metadata !{i32 14, i32 9, metadata !34, metadata !51}
!54 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777228, metadata !8, i32 0, metadata !51} ; [ DW_TAG_arg_variable ] [value] [line 12]
!55 = metadata !{i32 12, i32 33, metadata !4, metadata !51}
!56 = metadata !{i64 -2147483648}
!57 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554444, metadata !8, i32 0, metadata !51} ; [ DW_TAG_arg_variable ] [lower_bound] [line 12]
!58 = metadata !{i32 12, i32 50, metadata !4, metadata !51}
!59 = metadata !{i64 2147483647}
!60 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331660, metadata !8, i32 0, metadata !51} ; [ DW_TAG_arg_variable ] [upper_bound] [line 12]
!61 = metadata !{i32 12, i32 73, metadata !4, metadata !51}
!62 = metadata !{i64 4294967296}
!63 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 13, metadata !8, i32 0, metadata !51} ; [ DW_TAG_auto_variable ] [range] [line 13]
!64 = metadata !{i32 13, i32 15, metadata !4, metadata !51}
!65 = metadata !{i32 15, i32 9, metadata !36, metadata !51}
!66 = metadata !{i32 17, i32 14, metadata !38, metadata !51}
!67 = metadata !{i32 18, i32 9, metadata !40, metadata !51}
!68 = metadata !{i32 37, i32 9, metadata !52, null}
!69 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777228, metadata !8, i32 0, metadata !70} ; [ DW_TAG_arg_variable ] [value] [line 12]
!70 = metadata !{i32 39, i32 8, metadata !12, null}
!71 = metadata !{i32 12, i32 33, metadata !4, metadata !70}
!72 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554444, metadata !8, i32 0, metadata !70} ; [ DW_TAG_arg_variable ] [lower_bound] [line 12]
!73 = metadata !{i32 12, i32 50, metadata !4, metadata !70}
!74 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331660, metadata !8, i32 0, metadata !70} ; [ DW_TAG_arg_variable ] [upper_bound] [line 12]
!75 = metadata !{i32 12, i32 73, metadata !4, metadata !70}
!76 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 13, metadata !8, i32 0, metadata !70} ; [ DW_TAG_auto_variable ] [range] [line 13]
!77 = metadata !{i32 13, i32 15, metadata !4, metadata !70}
!78 = metadata !{i32 14, i32 9, metadata !34, metadata !70}
!79 = metadata !{i32 15, i32 9, metadata !36, metadata !70}
!80 = metadata !{i32 17, i32 14, metadata !38, metadata !70}
!81 = metadata !{i32 18, i32 9, metadata !40, metadata !70}
!82 = metadata !{i32 40, i32 5, metadata !12, null}
!83 = metadata !{i32 41, i32 1, metadata !12, null}
!84 = metadata !{i64 6}
!85 = metadata !{i32 786688, metadata !15, metadata !"matroska", metadata !5, i32 44, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [matroska] [line 44]
!86 = metadata !{i32 44, i32 15, metadata !15, null}
!87 = metadata !{i64 0}
!88 = metadata !{i32 786688, metadata !15, metadata !"res", metadata !5, i32 45, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [res] [line 45]
!89 = metadata !{i32 45, i32 15, metadata !15, null}
!90 = metadata !{i32 786689, metadata !9, metadata !"q", metadata !5, i32 16777238, metadata !8, i32 0, metadata !91} ; [ DW_TAG_arg_variable ] [q] [line 22]
!91 = metadata !{i32 46, i32 12, metadata !92, null}
!92 = metadata !{i32 786443, metadata !1, metadata !15, i32 46, i32 12, i32 1, i32 17} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!93 = metadata !{i32 22, i32 46, metadata !9, metadata !91}
!94 = metadata !{i64 2}
!95 = metadata !{i32 786688, metadata !96, metadata !"id", metadata !5, i32 50, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [id] [line 50]
!96 = metadata !{i32 786443, metadata !1, metadata !97, i32 49, i32 9, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!97 = metadata !{i32 786443, metadata !1, metadata !15, i32 47, i32 5, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!98 = metadata !{i32 50, i32 23, metadata !96, null}
!99 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777228, metadata !8, i32 0, metadata !100} ; [ DW_TAG_arg_variable ] [value] [line 12]
!100 = metadata !{i32 36, i32 8, metadata !52, metadata !101}
!101 = metadata !{i32 65, i32 27, metadata !102, null}
!102 = metadata !{i32 786443, metadata !1, metadata !96, i32 51, i32 25, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!103 = metadata !{i32 12, i32 33, metadata !4, metadata !100}
!104 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554444, metadata !8, i32 0, metadata !100} ; [ DW_TAG_arg_variable ] [lower_bound] [line 12]
!105 = metadata !{i32 12, i32 50, metadata !4, metadata !100}
!106 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331660, metadata !8, i32 0, metadata !100} ; [ DW_TAG_arg_variable ] [upper_bound] [line 12]
!107 = metadata !{i32 12, i32 73, metadata !4, metadata !100}
!108 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 13, metadata !8, i32 0, metadata !100} ; [ DW_TAG_auto_variable ] [range] [line 13]
!109 = metadata !{i32 13, i32 15, metadata !4, metadata !100}
!110 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777228, metadata !8, i32 0, metadata !111} ; [ DW_TAG_arg_variable ] [value] [line 12]
!111 = metadata !{i32 39, i32 8, metadata !12, metadata !101}
!112 = metadata !{i32 12, i32 33, metadata !4, metadata !111}
!113 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554444, metadata !8, i32 0, metadata !111} ; [ DW_TAG_arg_variable ] [lower_bound] [line 12]
!114 = metadata !{i32 12, i32 50, metadata !4, metadata !111}
!115 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331660, metadata !8, i32 0, metadata !111} ; [ DW_TAG_arg_variable ] [upper_bound] [line 12]
!116 = metadata !{i32 12, i32 73, metadata !4, metadata !111}
!117 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 13, metadata !8, i32 0, metadata !111} ; [ DW_TAG_auto_variable ] [range] [line 13]
!118 = metadata !{i32 13, i32 15, metadata !4, metadata !111}
!119 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554444, metadata !8, i32 0, metadata !120} ; [ DW_TAG_arg_variable ] [lower_bound] [line 12]
!120 = metadata !{i32 36, i32 8, metadata !52, metadata !121}
!121 = metadata !{i32 53, i32 31, metadata !122, null}
!122 = metadata !{i32 786443, metadata !1, metadata !102, i32 53, i32 25, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!123 = metadata !{i32 12, i32 50, metadata !4, metadata !120}
!124 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331660, metadata !8, i32 0, metadata !120} ; [ DW_TAG_arg_variable ] [upper_bound] [line 12]
!125 = metadata !{i32 12, i32 73, metadata !4, metadata !120}
!126 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 13, metadata !8, i32 0, metadata !120} ; [ DW_TAG_auto_variable ] [range] [line 13]
!127 = metadata !{i32 13, i32 15, metadata !4, metadata !120}
!128 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554444, metadata !8, i32 0, metadata !129} ; [ DW_TAG_arg_variable ] [lower_bound] [line 12]
!129 = metadata !{i32 36, i32 8, metadata !52, metadata !130}
!130 = metadata !{i32 57, i32 31, metadata !131, null}
!131 = metadata !{i32 786443, metadata !1, metadata !102, i32 57, i32 25, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!132 = metadata !{i32 12, i32 50, metadata !4, metadata !129}
!133 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331660, metadata !8, i32 0, metadata !129} ; [ DW_TAG_arg_variable ] [upper_bound] [line 12]
!134 = metadata !{i32 12, i32 73, metadata !4, metadata !129}
!135 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 13, metadata !8, i32 0, metadata !129} ; [ DW_TAG_auto_variable ] [range] [line 13]
!136 = metadata !{i32 13, i32 15, metadata !4, metadata !129}
!137 = metadata !{i64 1}
!138 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554444, metadata !8, i32 0, metadata !139} ; [ DW_TAG_arg_variable ] [lower_bound] [line 12]
!139 = metadata !{i32 39, i32 8, metadata !12, metadata !130}
!140 = metadata !{i32 12, i32 50, metadata !4, metadata !139}
!141 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331660, metadata !8, i32 0, metadata !139} ; [ DW_TAG_arg_variable ] [upper_bound] [line 12]
!142 = metadata !{i32 12, i32 73, metadata !4, metadata !139}
!143 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 13, metadata !8, i32 0, metadata !139} ; [ DW_TAG_auto_variable ] [range] [line 13]
!144 = metadata !{i32 13, i32 15, metadata !4, metadata !139}
!145 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554444, metadata !8, i32 0, metadata !146} ; [ DW_TAG_arg_variable ] [lower_bound] [line 12]
!146 = metadata !{i32 39, i32 8, metadata !12, metadata !121}
!147 = metadata !{i32 12, i32 50, metadata !4, metadata !146}
!148 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331660, metadata !8, i32 0, metadata !146} ; [ DW_TAG_arg_variable ] [upper_bound] [line 12]
!149 = metadata !{i32 12, i32 73, metadata !4, metadata !146}
!150 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 13, metadata !8, i32 0, metadata !146} ; [ DW_TAG_auto_variable ] [range] [line 13]
!151 = metadata !{i32 13, i32 15, metadata !4, metadata !146}
!152 = metadata !{i32 46, i32 5, metadata !15, null}
!153 = metadata !{i32 24, i32 9, metadata !45, metadata !91}
!154 = metadata !{i32 26, i32 9, metadata !47, metadata !91}
!155 = metadata !{i32 72, i32 1, metadata !156, null}
!156 = metadata !{i32 786443, metadata !1, metadata !157, i32 70, i32 1, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!157 = metadata !{i32 786443, metadata !1, metadata !97, i32 69, i32 13, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!158 = metadata !{i32 34, i32 9, metadata !50, metadata !101}
!159 = metadata !{i32 14, i32 9, metadata !34, metadata !100}
!160 = metadata !{i32 15, i32 9, metadata !36, metadata !100}
!161 = metadata !{i32 17, i32 14, metadata !38, metadata !100}
!162 = metadata !{i32 18, i32 9, metadata !40, metadata !100}
!163 = metadata !{i32 37, i32 9, metadata !52, metadata !101}
!164 = metadata !{i32 14, i32 9, metadata !34, metadata !111}
!165 = metadata !{i32 15, i32 9, metadata !36, metadata !111}
!166 = metadata !{i32 17, i32 14, metadata !38, metadata !111}
!167 = metadata !{i32 18, i32 9, metadata !40, metadata !111}
!168 = metadata !{i32 40, i32 5, metadata !12, metadata !101}
!169 = metadata !{i32 74, i32 5, metadata !15, null}

