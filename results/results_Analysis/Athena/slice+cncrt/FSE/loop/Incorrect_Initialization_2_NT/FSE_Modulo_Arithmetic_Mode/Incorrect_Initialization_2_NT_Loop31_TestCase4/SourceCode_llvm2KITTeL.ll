; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@"'flag" = global i64 0, align 8

; Function Attrs: nounwind uwtable
define i64 @wrap_around(i64 %value, i64 %lower_bound, i64 %upper_bound) #0 {
wrap_around_bb0:
  call void @llvm.dbg.value(metadata !{i64 %value}, i64 0, metadata !23), !dbg !24
  call void @llvm.dbg.value(metadata !{i64 %lower_bound}, i64 0, metadata !25), !dbg !26
  call void @llvm.dbg.value(metadata !{i64 %upper_bound}, i64 0, metadata !27), !dbg !28
  %"0" = sub nsw i64 %upper_bound, %lower_bound, !dbg !29
  %"1" = add nsw i64 %"0", 1, !dbg !29
  call void @llvm.dbg.value(metadata !{i64 %"1"}, i64 0, metadata !30), !dbg !31
  %"2" = icmp sgt i64 %value, %upper_bound, !dbg !32
  br i1 %"2", label %wrap_around_bb1, label %wrap_around_bb2, !dbg !32

wrap_around_bb1:                                  ; preds = %wrap_around_bb0
  %"3" = sub nsw i64 %value, %upper_bound, !dbg !34
  %"4" = sub nsw i64 %"3", 1, !dbg !34
  %"5" = srem i64 %"4", %"1", !dbg !34
  %"6" = add nsw i64 %lower_bound, %"5", !dbg !34
  br label %wrap_around_bb4, !dbg !34

wrap_around_bb2:                                  ; preds = %wrap_around_bb0
  %"7" = icmp slt i64 %value, %lower_bound, !dbg !36
  br i1 %"7", label %wrap_around_bb3, label %wrap_around_bb4, !dbg !36

wrap_around_bb3:                                  ; preds = %wrap_around_bb2
  %"8" = sub nsw i64 %lower_bound, %value, !dbg !38
  %"9" = sub nsw i64 %"8", 1, !dbg !38
  %"10" = srem i64 %"9", %"1", !dbg !38
  %"11" = sub nsw i64 %upper_bound, %"10", !dbg !38
  br label %wrap_around_bb4, !dbg !38

wrap_around_bb4:                                  ; preds = %wrap_around_bb2, %wrap_around_bb3, %wrap_around_bb1
  %.0 = phi i64 [ %"6", %wrap_around_bb1 ], [ %"11", %wrap_around_bb3 ], [ %value, %wrap_around_bb2 ]
  ret i64 %.0, !dbg !40
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i64 @matroska_deliver_packet_slice_1(i64 %q) #0 {
matroska_deliver_packet_slice_1_bb5:
  call void @llvm.dbg.value(metadata !{i64 %q}, i64 0, metadata !41), !dbg !42
  %"12" = icmp eq i64 %q, 1, !dbg !43
  %. = select i1 %"12", i64 0, i64 1, !dbg !45
  ret i64 %., !dbg !47
}

; Function Attrs: nounwind uwtable
define i64 @res_return_slice_1() #0 {
res_return_slice_1_bb6:
  %"13" = load i64* @"'flag", align 8, !dbg !48
  call void @llvm.dbg.value(metadata !{i64 %"13"}, i64 0, metadata !49), !dbg !50
  %"14" = load i64* @"'flag", align 8, !dbg !51
  %"15" = add nsw i64 %"14", 1, !dbg !51
  call void @llvm.dbg.value(metadata !{i64 %"15"}, i64 0, metadata !52), !dbg !53
  call void @llvm.dbg.value(metadata !54, i64 0, metadata !55), !dbg !56
  call void @llvm.dbg.value(metadata !57, i64 0, metadata !58), !dbg !59
  call void @llvm.dbg.value(metadata !60, i64 0, metadata !61), !dbg !62
  %"16" = icmp sgt i64 %"15", 2147483647, !dbg !63
  br i1 %"16", label %res_return_slice_1_bb7, label %res_return_slice_1_bb8, !dbg !63

res_return_slice_1_bb7:                           ; preds = %res_return_slice_1_bb6
  %"17" = sub nsw i64 %"15", 2147483647, !dbg !64
  %"18" = sub nsw i64 %"17", 1, !dbg !64
  %"19" = srem i64 %"18", 4294967296, !dbg !64
  %"20" = add nsw i64 -2147483648, %"19", !dbg !64
  br label %res_return_slice_1_wrap_around.exit, !dbg !64

res_return_slice_1_bb8:                           ; preds = %res_return_slice_1_bb6
  %"21" = icmp slt i64 %"15", -2147483648, !dbg !65
  br i1 %"21", label %res_return_slice_1_bb9, label %res_return_slice_1_wrap_around.exit, !dbg !65

res_return_slice_1_bb9:                           ; preds = %res_return_slice_1_bb8
  %"22" = sub nsw i64 -2147483648, %"15", !dbg !66
  %"23" = sub nsw i64 %"22", 1, !dbg !66
  %"24" = srem i64 %"23", 4294967296, !dbg !66
  %"25" = sub nsw i64 2147483647, %"24", !dbg !66
  br label %res_return_slice_1_wrap_around.exit, !dbg !66

res_return_slice_1_wrap_around.exit:              ; preds = %res_return_slice_1_bb7, %res_return_slice_1_bb8, %res_return_slice_1_bb9
  %.0.i = phi i64 [ %"20", %res_return_slice_1_bb7 ], [ %"25", %res_return_slice_1_bb9 ], [ %"15", %res_return_slice_1_bb8 ], !dbg !51
  store i64 %.0.i, i64* @"'flag", align 8, !dbg !51
  %"26" = icmp slt i64 %"13", 100, !dbg !67
  %. = select i1 %"26", i64 0, i64 -1, !dbg !69
  ret i64 %., !dbg !71
}

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb10:
  call void @llvm.dbg.value(metadata !72, i64 0, metadata !73), !dbg !74
  call void @llvm.dbg.value(metadata !75, i64 0, metadata !76), !dbg !77
  call void @llvm.dbg.value(metadata !{i64 %matroska.0}, i64 0, metadata !78), !dbg !81
  call void @llvm.dbg.value(metadata !{i64 %..i}, i64 0, metadata !82), !dbg !83
  call void @llvm.dbg.value(metadata !84, i64 0, metadata !85), !dbg !87
  call void @llvm.dbg.value(metadata !54, i64 0, metadata !88), !dbg !92
  call void @llvm.dbg.value(metadata !57, i64 0, metadata !93), !dbg !94
  call void @llvm.dbg.value(metadata !60, i64 0, metadata !95), !dbg !96
  call void @llvm.dbg.value(metadata !{i64 %"29"}, i64 0, metadata !97), !dbg !100
  call void @llvm.dbg.value(metadata !{i64 %"31"}, i64 0, metadata !101), !dbg !103
  call void @llvm.dbg.value(metadata !54, i64 0, metadata !104), !dbg !105
  call void @llvm.dbg.value(metadata !57, i64 0, metadata !106), !dbg !107
  call void @llvm.dbg.value(metadata !60, i64 0, metadata !108), !dbg !109
  call void @llvm.dbg.value(metadata !{i64 %"45"}, i64 0, metadata !76), !dbg !77
  call void @llvm.dbg.value(metadata !{i64 %"47"}, i64 0, metadata !110), !dbg !112
  call void @llvm.dbg.value(metadata !{i64 %"49"}, i64 0, metadata !113), !dbg !115
  call void @llvm.dbg.value(metadata !54, i64 0, metadata !116), !dbg !117
  call void @llvm.dbg.value(metadata !57, i64 0, metadata !118), !dbg !119
  call void @llvm.dbg.value(metadata !60, i64 0, metadata !120), !dbg !121
  call void @llvm.dbg.value(metadata !{i64 %"63"}, i64 0, metadata !76), !dbg !77
  call void @llvm.dbg.value(metadata !84, i64 0, metadata !76), !dbg !77
  br label %main_bb11, !dbg !122

main_bb11:                                        ; preds = %main_NewDefault, %main_bb13, %main_bb10
  %res.0 = phi i64 [ 0, %main_bb10 ], [ %res.1, %main_NewDefault ], [ %res.1, %main_bb13 ]
  %matroska.0 = phi i64 [ 2, %main_bb10 ], [ 1, %main_bb13 ], [ %matroska.0, %main_NewDefault ]
  %"27" = icmp eq i64 %matroska.0, 1, !dbg !123
  %..i = select i1 %"27", i64 0, i64 1, !dbg !124
  %"28" = icmp ne i64 %..i, 0, !dbg !125
  br i1 %"28", label %main_bb12, label %main_bb22, !dbg !125

main_bb12:                                        ; preds = %main_res_return_slice_1.exit4, %main_res_return_slice_1.exit7, %main_bb11
  %res.1 = phi i64 [ %res.0, %main_bb11 ], [ %., %main_res_return_slice_1.exit4 ], [ %"45", %main_res_return_slice_1.exit7 ]
  br label %main_NodeBlock

main_NodeBlock:                                   ; preds = %main_bb12
  %Pivot = icmp slt i64 %res.1, 0
  br i1 %Pivot, label %main_LeafBlock, label %main_LeafBlock8

main_LeafBlock:                                   ; preds = %main_NodeBlock
  %SwitchLeaf = icmp eq i64 %res.1, -1
  br i1 %SwitchLeaf, label %main_bb13, label %main_NewDefault

main_bb13:                                        ; preds = %main_LeafBlock
  call void @llvm.dbg.value(metadata !84, i64 0, metadata !73), !dbg !74
  br label %main_bb11, !dbg !127

main_LeafBlock8:                                  ; preds = %main_NodeBlock
  %SwitchLeaf9 = icmp eq i64 %res.1, 0
  br i1 %SwitchLeaf9, label %main_bb14, label %main_NewDefault

main_bb14:                                        ; preds = %main_LeafBlock8
  %"29" = load i64* @"'flag", align 8, !dbg !130
  %"30" = load i64* @"'flag", align 8, !dbg !102
  %"31" = add nsw i64 %"30", 1, !dbg !102
  %"32" = icmp sgt i64 %"31", 2147483647, !dbg !131
  br i1 %"32", label %main_bb15, label %main_bb16, !dbg !131

main_bb15:                                        ; preds = %main_bb14
  %"33" = sub nsw i64 %"31", 2147483647, !dbg !132
  %"34" = sub nsw i64 %"33", 1, !dbg !132
  %"35" = srem i64 %"34", 4294967296, !dbg !132
  %"36" = add nsw i64 -2147483648, %"35", !dbg !132
  br label %main_res_return_slice_1.exit7, !dbg !132

main_bb16:                                        ; preds = %main_bb14
  %"37" = icmp slt i64 %"31", -2147483648, !dbg !133
  br i1 %"37", label %main_bb17, label %main_res_return_slice_1.exit7, !dbg !133

main_bb17:                                        ; preds = %main_bb16
  %"38" = sub nsw i64 -2147483648, %"31", !dbg !134
  %"39" = sub nsw i64 %"38", 1, !dbg !134
  %"40" = srem i64 %"39", 4294967296, !dbg !134
  %"41" = sub nsw i64 2147483647, %"40", !dbg !134
  br label %main_res_return_slice_1.exit7, !dbg !134

main_res_return_slice_1.exit7:                    ; preds = %main_bb15, %main_bb16, %main_bb17
  %.0.i.i5 = phi i64 [ %"36", %main_bb15 ], [ %"41", %main_bb17 ], [ %"31", %main_bb16 ], !dbg !102
  store i64 %.0.i.i5, i64* @"'flag", align 8, !dbg !102
  %"42" = icmp slt i64 %"29", 100, !dbg !135
  %..i6 = select i1 %"42", i64 0, i64 -1, !dbg !136
  %"43" = icmp slt i64 %..i6, 0, !dbg !137
  %"44" = zext i1 %"43" to i32, !dbg !137
  %"45" = sext i32 %"44" to i64, !dbg !137
  %"46" = icmp ne i64 %"45", 0, !dbg !138
  br i1 %"46", label %main_bb12, label %main_bb18, !dbg !138

main_bb18:                                        ; preds = %main_res_return_slice_1.exit7
  %"47" = load i64* @"'flag", align 8, !dbg !140
  %"48" = load i64* @"'flag", align 8, !dbg !114
  %"49" = add nsw i64 %"48", 1, !dbg !114
  %"50" = icmp sgt i64 %"49", 2147483647, !dbg !141
  br i1 %"50", label %main_bb19, label %main_bb20, !dbg !141

main_bb19:                                        ; preds = %main_bb18
  %"51" = sub nsw i64 %"49", 2147483647, !dbg !142
  %"52" = sub nsw i64 %"51", 1, !dbg !142
  %"53" = srem i64 %"52", 4294967296, !dbg !142
  %"54" = add nsw i64 -2147483648, %"53", !dbg !142
  br label %main_res_return_slice_1.exit4, !dbg !142

main_bb20:                                        ; preds = %main_bb18
  %"55" = icmp slt i64 %"49", -2147483648, !dbg !143
  br i1 %"55", label %main_bb21, label %main_res_return_slice_1.exit4, !dbg !143

main_bb21:                                        ; preds = %main_bb20
  %"56" = sub nsw i64 -2147483648, %"49", !dbg !144
  %"57" = sub nsw i64 %"56", 1, !dbg !144
  %"58" = srem i64 %"57", 4294967296, !dbg !144
  %"59" = sub nsw i64 2147483647, %"58", !dbg !144
  br label %main_res_return_slice_1.exit4, !dbg !144

main_res_return_slice_1.exit4:                    ; preds = %main_bb19, %main_bb20, %main_bb21
  %.0.i.i2 = phi i64 [ %"54", %main_bb19 ], [ %"59", %main_bb21 ], [ %"49", %main_bb20 ], !dbg !114
  store i64 %.0.i.i2, i64* @"'flag", align 8, !dbg !114
  %"60" = icmp slt i64 %"47", 100, !dbg !145
  %..i3 = select i1 %"60", i64 0, i64 -1, !dbg !146
  %"61" = icmp eq i64 %..i3, 0, !dbg !147
  %"62" = zext i1 %"61" to i32, !dbg !147
  %"63" = sext i32 %"62" to i64, !dbg !147
  %"64" = icmp ne i64 %"63", 0, !dbg !148
  %. = select i1 %"64", i64 1, i64 %"63", !dbg !148
  br label %main_bb12, !dbg !150

main_NewDefault:                                  ; preds = %main_LeafBlock8, %main_LeafBlock
  br label %main_bb11

main_bb22:                                        ; preds = %main_bb11
  ret void, !dbg !151
}

declare i64 @__kittel_nondef.0()

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!20, !21}
!llvm.ident = !{!22}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !18, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [//FILES_DIR/SourceCode_SemanticAugmentor.c] [DW_LANG_C99]
!1 = metadata !{metadata !"FILES_DIR/SourceCode_SemanticAugmentor.c", metadata !"/"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9, metadata !12, metadata !15}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"wrap_around", metadata !"wrap_around", metadata !"", i32 7, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i64, i64, i64)* @wrap_around, null, null, metadata !2, i32 7} ; [ DW_TAG_subprogram ] [line 7] [def] [wrap_around]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"matroska_deliver_packet_slice_1", metadata !"matroska_deliver_packet_slice_1", metadata !"", i32 17, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i64)* @matroska_deliver_packet_slice_1, null, null, metadata !2, i32 18} ; [ DW_TAG_subprogram ] [line 17] [def] [scope 18] [matroska_deliver_packet_slice_1]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !8, metadata !8}
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"res_return_slice_1", metadata !"res_return_slice_1", metadata !"", i32 27, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 ()* @res_return_slice_1, null, null, metadata !2, i32 28} ; [ DW_TAG_subprogram ] [line 27] [def] [scope 28] [res_return_slice_1]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{metadata !8}
!15 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 43, metadata !16, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @main, null, null, metadata !2, i32 44} ; [ DW_TAG_subprogram ] [line 43] [def] [scope 44] [main]
!16 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !17, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!17 = metadata !{null}
!18 = metadata !{metadata !19}
!19 = metadata !{i32 786484, i32 0, null, metadata !"flag", metadata !"flag", metadata !"", metadata !5, i32 26, metadata !8, i32 0, i32 1, i64* @"'flag", null} ; [ DW_TAG_variable ] [flag] [line 26] [def]
!20 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!21 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!22 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!23 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777223, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 7]
!24 = metadata !{i32 7, i32 33, metadata !4, null}
!25 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554439, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [lower_bound] [line 7]
!26 = metadata !{i32 7, i32 50, metadata !4, null}
!27 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331655, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [upper_bound] [line 7]
!28 = metadata !{i32 7, i32 73, metadata !4, null}
!29 = metadata !{i32 8, i32 5, metadata !4, null} ; [ DW_TAG_imported_declaration ]
!30 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 8, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [range] [line 8]
!31 = metadata !{i32 8, i32 15, metadata !4, null} ; [ DW_TAG_imported_declaration ]
!32 = metadata !{i32 9, i32 9, metadata !33, null}
!33 = metadata !{i32 786443, metadata !1, metadata !4, i32 9, i32 9, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!34 = metadata !{i32 10, i32 9, metadata !35, null}
!35 = metadata !{i32 786443, metadata !1, metadata !33, i32 9, i32 30, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!36 = metadata !{i32 12, i32 14, metadata !37, null}
!37 = metadata !{i32 786443, metadata !1, metadata !33, i32 12, i32 14, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!38 = metadata !{i32 13, i32 9, metadata !39, null}
!39 = metadata !{i32 786443, metadata !1, metadata !37, i32 12, i32 35, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!40 = metadata !{i32 16, i32 1, metadata !4, null}
!41 = metadata !{i32 786689, metadata !9, metadata !"q", metadata !5, i32 16777233, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [q] [line 17]
!42 = metadata !{i32 17, i32 53, metadata !9, null}
!43 = metadata !{i32 20, i32 7, metadata !44, null}
!44 = metadata !{i32 786443, metadata !1, metadata !9, i32 20, i32 7, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!45 = metadata !{i32 22, i32 1, metadata !46, null}
!46 = metadata !{i32 786443, metadata !1, metadata !44, i32 21, i32 1, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!47 = metadata !{i32 23, i32 3, metadata !9, null}
!48 = metadata !{i32 31, i32 3, metadata !12, null}
!49 = metadata !{i32 786688, metadata !12, metadata !"tmp_0", metadata !5, i32 30, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmp_0] [line 30]
!50 = metadata !{i32 30, i32 13, metadata !12, null}
!51 = metadata !{i32 32, i32 11, metadata !12, null}
!52 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777223, metadata !8, i32 0, metadata !51} ; [ DW_TAG_arg_variable ] [value] [line 7]
!53 = metadata !{i32 7, i32 33, metadata !4, metadata !51}
!54 = metadata !{i64 -2147483648}
!55 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554439, metadata !8, i32 0, metadata !51} ; [ DW_TAG_arg_variable ] [lower_bound] [line 7]
!56 = metadata !{i32 7, i32 50, metadata !4, metadata !51}
!57 = metadata !{i64 2147483647}
!58 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331655, metadata !8, i32 0, metadata !51} ; [ DW_TAG_arg_variable ] [upper_bound] [line 7]
!59 = metadata !{i32 7, i32 73, metadata !4, metadata !51}
!60 = metadata !{i64 4294967296}
!61 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 8, metadata !8, i32 0, metadata !51} ; [ DW_TAG_auto_variable ] [range] [line 8]
!62 = metadata !{i32 8, i32 15, metadata !4, metadata !51} ; [ DW_TAG_imported_declaration ]
!63 = metadata !{i32 9, i32 9, metadata !33, metadata !51}
!64 = metadata !{i32 10, i32 9, metadata !35, metadata !51}
!65 = metadata !{i32 12, i32 14, metadata !37, metadata !51}
!66 = metadata !{i32 13, i32 9, metadata !39, metadata !51}
!67 = metadata !{i32 33, i32 7, metadata !68, null}
!68 = metadata !{i32 786443, metadata !1, metadata !12, i32 33, i32 7, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!69 = metadata !{i32 37, i32 5, metadata !70, null}
!70 = metadata !{i32 786443, metadata !1, metadata !68, i32 33, i32 20, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!71 = metadata !{i32 40, i32 17, metadata !12, null}
!72 = metadata !{i64 2}
!73 = metadata !{i32 786688, metadata !15, metadata !"matroska", metadata !5, i32 46, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [matroska] [line 46]
!74 = metadata !{i32 46, i32 13, metadata !15, null}
!75 = metadata !{i64 0}
!76 = metadata !{i32 786688, metadata !15, metadata !"res", metadata !5, i32 47, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [res] [line 47]
!77 = metadata !{i32 47, i32 13, metadata !15, null}
!78 = metadata !{i32 786689, metadata !9, metadata !"q", metadata !5, i32 16777233, metadata !8, i32 0, metadata !79} ; [ DW_TAG_arg_variable ] [q] [line 17]
!79 = metadata !{i32 49, i32 15, metadata !80, null}
!80 = metadata !{i32 786443, metadata !1, metadata !15, i32 48, i32 13, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!81 = metadata !{i32 17, i32 53, metadata !9, metadata !79}
!82 = metadata !{i32 786688, metadata !15, metadata !"tmpVar0", metadata !5, i32 45, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmpVar0] [line 45]
!83 = metadata !{i32 45, i32 13, metadata !15, null}
!84 = metadata !{i64 1}
!85 = metadata !{i32 786688, metadata !86, metadata !"id", metadata !5, i32 54, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [id] [line 54]
!86 = metadata !{i32 786443, metadata !1, metadata !80, i32 53, i32 22, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!87 = metadata !{i32 54, i32 17, metadata !86, null}
!88 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554439, metadata !8, i32 0, metadata !89} ; [ DW_TAG_arg_variable ] [lower_bound] [line 7]
!89 = metadata !{i32 32, i32 11, metadata !12, metadata !90}
!90 = metadata !{i32 76, i32 32, metadata !91, null}
!91 = metadata !{i32 786443, metadata !1, metadata !86, i32 55, i32 19, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!92 = metadata !{i32 7, i32 50, metadata !4, metadata !89}
!93 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331655, metadata !8, i32 0, metadata !89} ; [ DW_TAG_arg_variable ] [upper_bound] [line 7]
!94 = metadata !{i32 7, i32 73, metadata !4, metadata !89}
!95 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 8, metadata !8, i32 0, metadata !89} ; [ DW_TAG_auto_variable ] [range] [line 8]
!96 = metadata !{i32 8, i32 15, metadata !4, metadata !89} ; [ DW_TAG_imported_declaration ]
!97 = metadata !{i32 786688, metadata !12, metadata !"tmp_0", metadata !5, i32 30, metadata !8, i32 0, metadata !98} ; [ DW_TAG_auto_variable ] [tmp_0] [line 30]
!98 = metadata !{i32 60, i32 19, metadata !99, null}
!99 = metadata !{i32 786443, metadata !1, metadata !91, i32 59, i32 9, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!100 = metadata !{i32 30, i32 13, metadata !12, metadata !98}
!101 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777223, metadata !8, i32 0, metadata !102} ; [ DW_TAG_arg_variable ] [value] [line 7]
!102 = metadata !{i32 32, i32 11, metadata !12, metadata !98}
!103 = metadata !{i32 7, i32 33, metadata !4, metadata !102}
!104 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554439, metadata !8, i32 0, metadata !102} ; [ DW_TAG_arg_variable ] [lower_bound] [line 7]
!105 = metadata !{i32 7, i32 50, metadata !4, metadata !102}
!106 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331655, metadata !8, i32 0, metadata !102} ; [ DW_TAG_arg_variable ] [upper_bound] [line 7]
!107 = metadata !{i32 7, i32 73, metadata !4, metadata !102}
!108 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 8, metadata !8, i32 0, metadata !102} ; [ DW_TAG_auto_variable ] [range] [line 8]
!109 = metadata !{i32 8, i32 15, metadata !4, metadata !102} ; [ DW_TAG_imported_declaration ]
!110 = metadata !{i32 786688, metadata !12, metadata !"tmp_0", metadata !5, i32 30, metadata !8, i32 0, metadata !111} ; [ DW_TAG_auto_variable ] [tmp_0] [line 30]
!111 = metadata !{i32 68, i32 17, metadata !91, null}
!112 = metadata !{i32 30, i32 13, metadata !12, metadata !111}
!113 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777223, metadata !8, i32 0, metadata !114} ; [ DW_TAG_arg_variable ] [value] [line 7]
!114 = metadata !{i32 32, i32 11, metadata !12, metadata !111}
!115 = metadata !{i32 7, i32 33, metadata !4, metadata !114}
!116 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554439, metadata !8, i32 0, metadata !114} ; [ DW_TAG_arg_variable ] [lower_bound] [line 7]
!117 = metadata !{i32 7, i32 50, metadata !4, metadata !114}
!118 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331655, metadata !8, i32 0, metadata !114} ; [ DW_TAG_arg_variable ] [upper_bound] [line 7]
!119 = metadata !{i32 7, i32 73, metadata !4, metadata !114}
!120 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 8, metadata !8, i32 0, metadata !114} ; [ DW_TAG_auto_variable ] [range] [line 8]
!121 = metadata !{i32 8, i32 15, metadata !4, metadata !114} ; [ DW_TAG_imported_declaration ]
!122 = metadata !{i32 48, i32 3, metadata !15, null}
!123 = metadata !{i32 20, i32 7, metadata !44, metadata !79}
!124 = metadata !{i32 22, i32 1, metadata !46, metadata !79}
!125 = metadata !{i32 50, i32 9, metadata !126, null}
!126 = metadata !{i32 786443, metadata !1, metadata !80, i32 50, i32 9, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!127 = metadata !{i32 83, i32 1, metadata !128, null}
!128 = metadata !{i32 786443, metadata !1, metadata !129, i32 82, i32 1, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!129 = metadata !{i32 786443, metadata !1, metadata !80, i32 81, i32 9, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!130 = metadata !{i32 31, i32 3, metadata !12, metadata !98}
!131 = metadata !{i32 9, i32 9, metadata !33, metadata !102}
!132 = metadata !{i32 10, i32 9, metadata !35, metadata !102}
!133 = metadata !{i32 12, i32 14, metadata !37, metadata !102}
!134 = metadata !{i32 13, i32 9, metadata !39, metadata !102}
!135 = metadata !{i32 33, i32 7, metadata !68, metadata !98}
!136 = metadata !{i32 37, i32 5, metadata !70, metadata !98}
!137 = metadata !{i32 61, i32 11, metadata !99, null}
!138 = metadata !{i32 63, i32 13, metadata !139, null}
!139 = metadata !{i32 786443, metadata !1, metadata !91, i32 63, i32 13, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!140 = metadata !{i32 31, i32 3, metadata !12, metadata !111}
!141 = metadata !{i32 9, i32 9, metadata !33, metadata !114}
!142 = metadata !{i32 10, i32 9, metadata !35, metadata !114}
!143 = metadata !{i32 12, i32 14, metadata !37, metadata !114}
!144 = metadata !{i32 13, i32 9, metadata !39, metadata !114}
!145 = metadata !{i32 33, i32 7, metadata !68, metadata !111}
!146 = metadata !{i32 37, i32 5, metadata !70, metadata !111}
!147 = metadata !{i32 69, i32 9, metadata !91, null}
!148 = metadata !{i32 70, i32 13, metadata !149, null}
!149 = metadata !{i32 786443, metadata !1, metadata !91, i32 70, i32 13, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!150 = metadata !{i32 75, i32 9, metadata !91, null}
!151 = metadata !{i32 85, i32 3, metadata !15, null}

