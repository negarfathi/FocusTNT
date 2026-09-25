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
  %"14" = add nsw i64 %"13", 1, !dbg !48
  call void @llvm.dbg.value(metadata !{i64 %"14"}, i64 0, metadata !49), !dbg !50
  call void @llvm.dbg.value(metadata !51, i64 0, metadata !52), !dbg !53
  call void @llvm.dbg.value(metadata !54, i64 0, metadata !55), !dbg !56
  call void @llvm.dbg.value(metadata !57, i64 0, metadata !58), !dbg !59
  %"15" = icmp sgt i64 %"14", 2147483647, !dbg !60
  br i1 %"15", label %res_return_slice_1_bb7, label %res_return_slice_1_bb8, !dbg !60

res_return_slice_1_bb7:                           ; preds = %res_return_slice_1_bb6
  %"16" = sub nsw i64 %"14", 2147483647, !dbg !61
  %"17" = sub nsw i64 %"16", 1, !dbg !61
  %"18" = srem i64 %"17", 4294967296, !dbg !61
  %"19" = add nsw i64 -2147483648, %"18", !dbg !61
  br label %res_return_slice_1_wrap_around.exit, !dbg !61

res_return_slice_1_bb8:                           ; preds = %res_return_slice_1_bb6
  %"20" = icmp slt i64 %"14", -2147483648, !dbg !62
  br i1 %"20", label %res_return_slice_1_bb9, label %res_return_slice_1_wrap_around.exit, !dbg !62

res_return_slice_1_bb9:                           ; preds = %res_return_slice_1_bb8
  %"21" = sub nsw i64 -2147483648, %"14", !dbg !63
  %"22" = sub nsw i64 %"21", 1, !dbg !63
  %"23" = srem i64 %"22", 4294967296, !dbg !63
  %"24" = sub nsw i64 2147483647, %"23", !dbg !63
  br label %res_return_slice_1_wrap_around.exit, !dbg !63

res_return_slice_1_wrap_around.exit:              ; preds = %res_return_slice_1_bb7, %res_return_slice_1_bb8, %res_return_slice_1_bb9
  %.0.i = phi i64 [ %"19", %res_return_slice_1_bb7 ], [ %"24", %res_return_slice_1_bb9 ], [ %"14", %res_return_slice_1_bb8 ], !dbg !48
  store i64 %.0.i, i64* @"'flag", align 8, !dbg !48
  ret i64 -1, !dbg !64
}

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb10:
  call void @llvm.dbg.value(metadata !65, i64 0, metadata !66), !dbg !67
  call void @llvm.dbg.value(metadata !{i64 %matroska.0}, i64 0, metadata !68), !dbg !71
  call void @llvm.dbg.value(metadata !{i64 %..i}, i64 0, metadata !72), !dbg !73
  call void @llvm.dbg.value(metadata !74, i64 0, metadata !75), !dbg !76
  call void @llvm.dbg.value(metadata !77, i64 0, metadata !78), !dbg !80
  call void @llvm.dbg.value(metadata !51, i64 0, metadata !81), !dbg !85
  call void @llvm.dbg.value(metadata !54, i64 0, metadata !86), !dbg !87
  call void @llvm.dbg.value(metadata !57, i64 0, metadata !88), !dbg !89
  call void @llvm.dbg.value(metadata !90, i64 0, metadata !75), !dbg !76
  call void @llvm.dbg.value(metadata !{i64 %"28"}, i64 0, metadata !91), !dbg !95
  call void @llvm.dbg.value(metadata !51, i64 0, metadata !96), !dbg !97
  call void @llvm.dbg.value(metadata !54, i64 0, metadata !98), !dbg !99
  call void @llvm.dbg.value(metadata !57, i64 0, metadata !100), !dbg !101
  call void @llvm.dbg.value(metadata !{i64 %"41"}, i64 0, metadata !75), !dbg !76
  call void @llvm.dbg.value(metadata !{i64 %"44"}, i64 0, metadata !102), !dbg !105
  call void @llvm.dbg.value(metadata !51, i64 0, metadata !106), !dbg !107
  call void @llvm.dbg.value(metadata !54, i64 0, metadata !108), !dbg !109
  call void @llvm.dbg.value(metadata !57, i64 0, metadata !110), !dbg !111
  call void @llvm.dbg.value(metadata !{i64 %"57"}, i64 0, metadata !75), !dbg !76
  call void @llvm.dbg.value(metadata !77, i64 0, metadata !75), !dbg !76
  br label %main_bb11, !dbg !112

main_bb11:                                        ; preds = %main_NewDefault, %main_bb13, %main_bb10
  %matroska.0 = phi i64 [ 3, %main_bb10 ], [ 1, %main_bb13 ], [ %matroska.0, %main_NewDefault ]
  %"25" = icmp eq i64 %matroska.0, 1, !dbg !113
  %..i = select i1 %"25", i64 0, i64 1, !dbg !114
  %"26" = icmp ne i64 %..i, 0, !dbg !115
  br i1 %"26", label %main_bb12, label %main_bb22, !dbg !115

main_bb12:                                        ; preds = %main_res_return_slice_1.exit2, %main_res_return_slice_1.exit4, %main_bb11
  %res.0 = phi i64 [ 0, %main_bb11 ], [ %., %main_res_return_slice_1.exit2 ], [ %"41", %main_res_return_slice_1.exit4 ]
  br label %main_NodeBlock

main_NodeBlock:                                   ; preds = %main_bb12
  %Pivot = icmp slt i64 %res.0, 0
  br i1 %Pivot, label %main_LeafBlock, label %main_LeafBlock5

main_LeafBlock:                                   ; preds = %main_NodeBlock
  %SwitchLeaf = icmp eq i64 %res.0, -1
  br i1 %SwitchLeaf, label %main_bb13, label %main_NewDefault

main_bb13:                                        ; preds = %main_LeafBlock
  call void @llvm.dbg.value(metadata !77, i64 0, metadata !66), !dbg !67
  br label %main_bb11, !dbg !117

main_LeafBlock5:                                  ; preds = %main_NodeBlock
  %SwitchLeaf6 = icmp eq i64 %res.0, 0
  br i1 %SwitchLeaf6, label %main_bb14, label %main_NewDefault

main_bb14:                                        ; preds = %main_LeafBlock5
  %"27" = load i64* @"'flag", align 8, !dbg !92
  %"28" = add nsw i64 %"27", 1, !dbg !92
  %"29" = icmp sgt i64 %"28", 2147483647, !dbg !120
  br i1 %"29", label %main_bb15, label %main_bb16, !dbg !120

main_bb15:                                        ; preds = %main_bb14
  %"30" = sub nsw i64 %"28", 2147483647, !dbg !121
  %"31" = sub nsw i64 %"30", 1, !dbg !121
  %"32" = srem i64 %"31", 4294967296, !dbg !121
  %"33" = add nsw i64 -2147483648, %"32", !dbg !121
  br label %main_res_return_slice_1.exit4, !dbg !121

main_bb16:                                        ; preds = %main_bb14
  %"34" = icmp slt i64 %"28", -2147483648, !dbg !122
  br i1 %"34", label %main_bb17, label %main_res_return_slice_1.exit4, !dbg !122

main_bb17:                                        ; preds = %main_bb16
  %"35" = sub nsw i64 -2147483648, %"28", !dbg !123
  %"36" = sub nsw i64 %"35", 1, !dbg !123
  %"37" = srem i64 %"36", 4294967296, !dbg !123
  %"38" = sub nsw i64 2147483647, %"37", !dbg !123
  br label %main_res_return_slice_1.exit4, !dbg !123

main_res_return_slice_1.exit4:                    ; preds = %main_bb15, %main_bb16, %main_bb17
  %.0.i.i3 = phi i64 [ %"33", %main_bb15 ], [ %"38", %main_bb17 ], [ %"28", %main_bb16 ], !dbg !92
  store i64 %.0.i.i3, i64* @"'flag", align 8, !dbg !92
  %"39" = icmp slt i64 -1, 0, !dbg !124
  %"40" = zext i1 %"39" to i32, !dbg !124
  %"41" = sext i32 %"40" to i64, !dbg !124
  %"42" = icmp ne i64 %"41", 0, !dbg !125
  br i1 %"42", label %main_bb12, label %main_bb18, !dbg !125

main_bb18:                                        ; preds = %main_res_return_slice_1.exit4
  %"43" = load i64* @"'flag", align 8, !dbg !103
  %"44" = add nsw i64 %"43", 1, !dbg !103
  %"45" = icmp sgt i64 %"44", 2147483647, !dbg !127
  br i1 %"45", label %main_bb19, label %main_bb20, !dbg !127

main_bb19:                                        ; preds = %main_bb18
  %"46" = sub nsw i64 %"44", 2147483647, !dbg !128
  %"47" = sub nsw i64 %"46", 1, !dbg !128
  %"48" = srem i64 %"47", 4294967296, !dbg !128
  %"49" = add nsw i64 -2147483648, %"48", !dbg !128
  br label %main_res_return_slice_1.exit2, !dbg !128

main_bb20:                                        ; preds = %main_bb18
  %"50" = icmp slt i64 %"44", -2147483648, !dbg !129
  br i1 %"50", label %main_bb21, label %main_res_return_slice_1.exit2, !dbg !129

main_bb21:                                        ; preds = %main_bb20
  %"51" = sub nsw i64 -2147483648, %"44", !dbg !130
  %"52" = sub nsw i64 %"51", 1, !dbg !130
  %"53" = srem i64 %"52", 4294967296, !dbg !130
  %"54" = sub nsw i64 2147483647, %"53", !dbg !130
  br label %main_res_return_slice_1.exit2, !dbg !130

main_res_return_slice_1.exit2:                    ; preds = %main_bb19, %main_bb20, %main_bb21
  %.0.i.i1 = phi i64 [ %"49", %main_bb19 ], [ %"54", %main_bb21 ], [ %"44", %main_bb20 ], !dbg !103
  store i64 %.0.i.i1, i64* @"'flag", align 8, !dbg !103
  %"55" = icmp eq i64 -1, 0, !dbg !131
  %"56" = zext i1 %"55" to i32, !dbg !131
  %"57" = sext i32 %"56" to i64, !dbg !131
  %"58" = icmp ne i64 %"57", 0, !dbg !132
  %. = select i1 %"58", i64 1, i64 %"57", !dbg !132
  br label %main_bb12, !dbg !134

main_NewDefault:                                  ; preds = %main_LeafBlock5, %main_LeafBlock
  br label %main_bb11

main_bb22:                                        ; preds = %main_bb11
  ret void, !dbg !135
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
!48 = metadata !{i32 32, i32 11, metadata !12, null}
!49 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777223, metadata !8, i32 0, metadata !48} ; [ DW_TAG_arg_variable ] [value] [line 7]
!50 = metadata !{i32 7, i32 33, metadata !4, metadata !48}
!51 = metadata !{i64 -2147483648}
!52 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554439, metadata !8, i32 0, metadata !48} ; [ DW_TAG_arg_variable ] [lower_bound] [line 7]
!53 = metadata !{i32 7, i32 50, metadata !4, metadata !48}
!54 = metadata !{i64 2147483647}
!55 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331655, metadata !8, i32 0, metadata !48} ; [ DW_TAG_arg_variable ] [upper_bound] [line 7]
!56 = metadata !{i32 7, i32 73, metadata !4, metadata !48}
!57 = metadata !{i64 4294967296}
!58 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 8, metadata !8, i32 0, metadata !48} ; [ DW_TAG_auto_variable ] [range] [line 8]
!59 = metadata !{i32 8, i32 15, metadata !4, metadata !48} ; [ DW_TAG_imported_declaration ]
!60 = metadata !{i32 9, i32 9, metadata !33, metadata !48}
!61 = metadata !{i32 10, i32 9, metadata !35, metadata !48}
!62 = metadata !{i32 12, i32 14, metadata !37, metadata !48}
!63 = metadata !{i32 13, i32 9, metadata !39, metadata !48}
!64 = metadata !{i32 40, i32 17, metadata !12, null}
!65 = metadata !{i64 3}
!66 = metadata !{i32 786688, metadata !15, metadata !"matroska", metadata !5, i32 47, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [matroska] [line 47]
!67 = metadata !{i32 47, i32 13, metadata !15, null}
!68 = metadata !{i32 786689, metadata !9, metadata !"q", metadata !5, i32 16777233, metadata !8, i32 0, metadata !69} ; [ DW_TAG_arg_variable ] [q] [line 17]
!69 = metadata !{i32 49, i32 15, metadata !70, null}
!70 = metadata !{i32 786443, metadata !1, metadata !15, i32 48, i32 13, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!71 = metadata !{i32 17, i32 53, metadata !9, metadata !69}
!72 = metadata !{i32 786688, metadata !15, metadata !"tmpVar0", metadata !5, i32 46, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmpVar0] [line 46]
!73 = metadata !{i32 46, i32 13, metadata !15, null}
!74 = metadata !{i64 0}
!75 = metadata !{i32 786688, metadata !15, metadata !"res", metadata !5, i32 45, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [res] [line 45]
!76 = metadata !{i32 45, i32 13, metadata !15, null}
!77 = metadata !{i64 1}
!78 = metadata !{i32 786688, metadata !79, metadata !"id", metadata !5, i32 55, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [id] [line 55]
!79 = metadata !{i32 786443, metadata !1, metadata !70, i32 54, i32 22, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!80 = metadata !{i32 55, i32 17, metadata !79, null}
!81 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554439, metadata !8, i32 0, metadata !82} ; [ DW_TAG_arg_variable ] [lower_bound] [line 7]
!82 = metadata !{i32 32, i32 11, metadata !12, metadata !83}
!83 = metadata !{i32 77, i32 32, metadata !84, null}
!84 = metadata !{i32 786443, metadata !1, metadata !79, i32 56, i32 19, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!85 = metadata !{i32 7, i32 50, metadata !4, metadata !82}
!86 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331655, metadata !8, i32 0, metadata !82} ; [ DW_TAG_arg_variable ] [upper_bound] [line 7]
!87 = metadata !{i32 7, i32 73, metadata !4, metadata !82}
!88 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 8, metadata !8, i32 0, metadata !82} ; [ DW_TAG_auto_variable ] [range] [line 8]
!89 = metadata !{i32 8, i32 15, metadata !4, metadata !82} ; [ DW_TAG_imported_declaration ]
!90 = metadata !{i64 -1}
!91 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777223, metadata !8, i32 0, metadata !92} ; [ DW_TAG_arg_variable ] [value] [line 7]
!92 = metadata !{i32 32, i32 11, metadata !12, metadata !93}
!93 = metadata !{i32 61, i32 19, metadata !94, null}
!94 = metadata !{i32 786443, metadata !1, metadata !84, i32 60, i32 9, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!95 = metadata !{i32 7, i32 33, metadata !4, metadata !92}
!96 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554439, metadata !8, i32 0, metadata !92} ; [ DW_TAG_arg_variable ] [lower_bound] [line 7]
!97 = metadata !{i32 7, i32 50, metadata !4, metadata !92}
!98 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331655, metadata !8, i32 0, metadata !92} ; [ DW_TAG_arg_variable ] [upper_bound] [line 7]
!99 = metadata !{i32 7, i32 73, metadata !4, metadata !92}
!100 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 8, metadata !8, i32 0, metadata !92} ; [ DW_TAG_auto_variable ] [range] [line 8]
!101 = metadata !{i32 8, i32 15, metadata !4, metadata !92} ; [ DW_TAG_imported_declaration ]
!102 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777223, metadata !8, i32 0, metadata !103} ; [ DW_TAG_arg_variable ] [value] [line 7]
!103 = metadata !{i32 32, i32 11, metadata !12, metadata !104}
!104 = metadata !{i32 69, i32 17, metadata !84, null}
!105 = metadata !{i32 7, i32 33, metadata !4, metadata !103}
!106 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554439, metadata !8, i32 0, metadata !103} ; [ DW_TAG_arg_variable ] [lower_bound] [line 7]
!107 = metadata !{i32 7, i32 50, metadata !4, metadata !103}
!108 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331655, metadata !8, i32 0, metadata !103} ; [ DW_TAG_arg_variable ] [upper_bound] [line 7]
!109 = metadata !{i32 7, i32 73, metadata !4, metadata !103}
!110 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 8, metadata !8, i32 0, metadata !103} ; [ DW_TAG_auto_variable ] [range] [line 8]
!111 = metadata !{i32 8, i32 15, metadata !4, metadata !103} ; [ DW_TAG_imported_declaration ]
!112 = metadata !{i32 48, i32 3, metadata !15, null}
!113 = metadata !{i32 20, i32 7, metadata !44, metadata !69}
!114 = metadata !{i32 22, i32 1, metadata !46, metadata !69}
!115 = metadata !{i32 50, i32 9, metadata !116, null}
!116 = metadata !{i32 786443, metadata !1, metadata !70, i32 50, i32 9, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!117 = metadata !{i32 84, i32 1, metadata !118, null}
!118 = metadata !{i32 786443, metadata !1, metadata !119, i32 83, i32 1, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!119 = metadata !{i32 786443, metadata !1, metadata !70, i32 82, i32 9, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!120 = metadata !{i32 9, i32 9, metadata !33, metadata !92}
!121 = metadata !{i32 10, i32 9, metadata !35, metadata !92}
!122 = metadata !{i32 12, i32 14, metadata !37, metadata !92}
!123 = metadata !{i32 13, i32 9, metadata !39, metadata !92}
!124 = metadata !{i32 62, i32 11, metadata !94, null}
!125 = metadata !{i32 64, i32 13, metadata !126, null}
!126 = metadata !{i32 786443, metadata !1, metadata !84, i32 64, i32 13, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!127 = metadata !{i32 9, i32 9, metadata !33, metadata !103}
!128 = metadata !{i32 10, i32 9, metadata !35, metadata !103}
!129 = metadata !{i32 12, i32 14, metadata !37, metadata !103}
!130 = metadata !{i32 13, i32 9, metadata !39, metadata !103}
!131 = metadata !{i32 70, i32 9, metadata !84, null}
!132 = metadata !{i32 71, i32 13, metadata !133, null}
!133 = metadata !{i32 786443, metadata !1, metadata !84, i32 71, i32 13, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!134 = metadata !{i32 76, i32 9, metadata !84, null}
!135 = metadata !{i32 86, i32 3, metadata !15, null}

