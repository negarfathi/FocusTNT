; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@"'flag" = global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @matroska_deliver_packet_slice_1(i32 %q) #0 {
matroska_deliver_packet_slice_1_bb0:
  call void @llvm.dbg.value(metadata !{i32 %q}, i64 0, metadata !20), !dbg !21
  %"0" = icmp eq i32 %q, 1, !dbg !22
  %. = select i1 %"0", i32 0, i32 1, !dbg !24
  ret i32 %., !dbg !26
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @res_return_slice_1() #0 {
res_return_slice_1_bb1:
  %"1" = load i32* @"'flag", align 4, !dbg !27
  call void @llvm.dbg.value(metadata !{i32 %"1"}, i64 0, metadata !28), !dbg !29
  %"2" = load i32* @"'flag", align 4, !dbg !30
  %"3" = add nsw i32 %"2", 1, !dbg !30
  store i32 %"3", i32* @"'flag", align 4, !dbg !30
  %"4" = icmp slt i32 %"1", 100, !dbg !31
  br i1 %"4", label %res_return_slice_1_bb2, label %res_return_slice_1_bb3, !dbg !31

res_return_slice_1_bb2:                           ; preds = %res_return_slice_1_bb1
  %"5" = call i32 @__VERIFIER_nondet_int(), !dbg !33
  call void @llvm.dbg.value(metadata !{i32 %"5"}, i64 0, metadata !35), !dbg !36
  call void @llvm.dbg.value(metadata !{i32 %"5"}, i64 0, metadata !37), !dbg !38
  br label %res_return_slice_1_bb3, !dbg !39

res_return_slice_1_bb3:                           ; preds = %res_return_slice_1_bb1, %res_return_slice_1_bb2
  %__retres.0 = phi i32 [ %"5", %res_return_slice_1_bb2 ], [ -1, %res_return_slice_1_bb1 ]
  ret i32 %__retres.0, !dbg !40
}

declare i32 @__VERIFIER_nondet_int() #2

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb4:
  %"6" = call i32 @__VERIFIER_nondet_int(), !dbg !41
  call void @llvm.dbg.value(metadata !{i32 %"6"}, i64 0, metadata !42), !dbg !43
  call void @llvm.dbg.value(metadata !{i32 %matroska.0}, i64 0, metadata !44), !dbg !47
  call void @llvm.dbg.value(metadata !{i32 %..i}, i64 0, metadata !48), !dbg !49
  call void @llvm.dbg.value(metadata !50, i64 0, metadata !51), !dbg !52
  call void @llvm.dbg.value(metadata !{i32 %"9"}, i64 0, metadata !53), !dbg !55
  call void @llvm.dbg.value(metadata !{i32 %"10"}, i64 0, metadata !56) #3, !dbg !59
  call void @llvm.dbg.value(metadata !{i32 %"26"}, i64 0, metadata !60) #3, !dbg !61
  call void @llvm.dbg.value(metadata !{i32 %"26"}, i64 0, metadata !62) #3, !dbg !63
  call void @llvm.dbg.value(metadata !{i32 %"10"}, i64 0, metadata !64) #3, !dbg !67
  call void @llvm.dbg.value(metadata !{i32 %"14"}, i64 0, metadata !68) #3, !dbg !69
  call void @llvm.dbg.value(metadata !{i32 %"14"}, i64 0, metadata !70) #3, !dbg !71
  call void @llvm.dbg.value(metadata !{i32 %"16"}, i64 0, metadata !51), !dbg !52
  call void @llvm.dbg.value(metadata !{i32 %"18"}, i64 0, metadata !72) #3, !dbg !74
  call void @llvm.dbg.value(metadata !{i32 %"22"}, i64 0, metadata !75) #3, !dbg !76
  call void @llvm.dbg.value(metadata !{i32 %"22"}, i64 0, metadata !77) #3, !dbg !78
  call void @llvm.dbg.value(metadata !{i32 %"24"}, i64 0, metadata !51), !dbg !52
  call void @llvm.dbg.value(metadata !79, i64 0, metadata !51), !dbg !52
  br label %main_bb5, !dbg !80

main_bb5:                                         ; preds = %main_NewDefault, %main_bb6, %main_bb4
  %matroska.0 = phi i32 [ %"6", %main_bb4 ], [ 1, %main_bb6 ], [ %matroska.0, %main_NewDefault ]
  %"7" = icmp eq i32 %matroska.0, 1, !dbg !81
  %..i = select i1 %"7", i32 0, i32 1, !dbg !82
  %"8" = icmp ne i32 %..i, 0, !dbg !83
  br i1 %"8", label %main_res_return_slice_1.exit, label %main_bb14, !dbg !83

main_res_return_slice_1.exit:                     ; preds = %main_res_return_slice_1.exit4, %main_res_return_slice_1.exit2, %main_bb12, %main_bb13, %main_bb5
  %res.0 = phi i32 [ 0, %main_bb5 ], [ %., %main_res_return_slice_1.exit4 ], [ %"16", %main_res_return_slice_1.exit2 ], [ %"26", %main_bb13 ], [ -1, %main_bb12 ]
  br label %main_NodeBlock

main_NodeBlock:                                   ; preds = %main_res_return_slice_1.exit
  %Pivot = icmp slt i32 %res.0, 0
  br i1 %Pivot, label %main_LeafBlock, label %main_LeafBlock5

main_LeafBlock:                                   ; preds = %main_NodeBlock
  %SwitchLeaf = icmp eq i32 %res.0, -1
  br i1 %SwitchLeaf, label %main_bb6, label %main_NewDefault

main_bb6:                                         ; preds = %main_LeafBlock
  call void @llvm.dbg.value(metadata !79, i64 0, metadata !42), !dbg !43
  br label %main_bb5, !dbg !85

main_LeafBlock5:                                  ; preds = %main_NodeBlock
  %SwitchLeaf6 = icmp eq i32 %res.0, 0
  br i1 %SwitchLeaf6, label %main_bb7, label %main_NewDefault

main_bb7:                                         ; preds = %main_LeafBlock5
  %"9" = call i32 @__VERIFIER_nondet_int(), !dbg !88
  %cond = icmp eq i32 %"9", 1, !dbg !89
  %"10" = load i32* @"'flag", align 4, !dbg !90
  %"11" = load i32* @"'flag", align 4, !dbg !91
  %"12" = add nsw i32 %"11", 1, !dbg !91
  store i32 %"12", i32* @"'flag", align 4, !dbg !91
  %"13" = icmp slt i32 %"10", 100, !dbg !92
  br i1 %cond, label %main_bb8, label %main_bb12, !dbg !89

main_bb8:                                         ; preds = %main_bb7
  br i1 %"13", label %main_bb9, label %main_res_return_slice_1.exit2, !dbg !92

main_bb9:                                         ; preds = %main_bb8
  %"14" = call i32 @__VERIFIER_nondet_int() #3, !dbg !93
  br label %main_res_return_slice_1.exit2, !dbg !94

main_res_return_slice_1.exit2:                    ; preds = %main_bb8, %main_bb9
  %__retres.0.i1 = phi i32 [ %"14", %main_bb9 ], [ -1, %main_bb8 ], !dbg !65
  %"15" = icmp slt i32 %__retres.0.i1, 0, !dbg !95
  %"16" = zext i1 %"15" to i32, !dbg !95
  %"17" = icmp ne i32 %"16", 0, !dbg !96
  br i1 %"17", label %main_res_return_slice_1.exit, label %main_bb10, !dbg !96

main_bb10:                                        ; preds = %main_res_return_slice_1.exit2
  %"18" = load i32* @"'flag", align 4, !dbg !98
  %"19" = load i32* @"'flag", align 4, !dbg !99
  %"20" = add nsw i32 %"19", 1, !dbg !99
  store i32 %"20", i32* @"'flag", align 4, !dbg !99
  %"21" = icmp slt i32 %"18", 100, !dbg !100
  br i1 %"21", label %main_bb11, label %main_res_return_slice_1.exit4, !dbg !100

main_bb11:                                        ; preds = %main_bb10
  %"22" = call i32 @__VERIFIER_nondet_int() #3, !dbg !101
  br label %main_res_return_slice_1.exit4, !dbg !102

main_res_return_slice_1.exit4:                    ; preds = %main_bb10, %main_bb11
  %__retres.0.i3 = phi i32 [ %"22", %main_bb11 ], [ -1, %main_bb10 ], !dbg !73
  %"23" = icmp eq i32 %__retres.0.i3, 0, !dbg !103
  %"24" = zext i1 %"23" to i32, !dbg !103
  %"25" = icmp ne i32 %"24", 0, !dbg !104
  %. = select i1 %"25", i32 1, i32 %"24", !dbg !104
  br label %main_res_return_slice_1.exit, !dbg !106

main_bb12:                                        ; preds = %main_bb7
  br i1 %"13", label %main_bb13, label %main_res_return_slice_1.exit, !dbg !107

main_bb13:                                        ; preds = %main_bb12
  %"26" = call i32 @__VERIFIER_nondet_int() #3, !dbg !108
  br label %main_res_return_slice_1.exit, !dbg !109

main_NewDefault:                                  ; preds = %main_LeafBlock5, %main_LeafBlock
  br label %main_bb5

main_bb14:                                        ; preds = %main_bb5
  ret void, !dbg !110
}

declare i32 @__kittel_nondef.0()

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
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"matroska_deliver_packet_slice_1", metadata !"matroska_deliver_packet_slice_1", metadata !"", i32 5, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @matroska_deliver_packet_slice_1, null, null, metadata !2, i32 6} ; [ DW_TAG_subprogram ] [line 5] [def] [scope 6] [matroska_deliver_packet_slice_1]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"res_return_slice_1", metadata !"res_return_slice_1", metadata !"", i32 13, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @res_return_slice_1, null, null, metadata !2, i32 14} ; [ DW_TAG_subprogram ] [line 13] [def] [scope 14] [res_return_slice_1]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !8}
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 29, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @main, null, null, metadata !2, i32 30} ; [ DW_TAG_subprogram ] [line 29] [def] [scope 30] [main]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{null}
!15 = metadata !{metadata !16}
!16 = metadata !{i32 786484, i32 0, null, metadata !"flag", metadata !"flag", metadata !"", metadata !5, i32 12, metadata !8, i32 0, i32 1, i32* @"'flag", null} ; [ DW_TAG_variable ] [flag] [line 12] [def]
!17 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!18 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!19 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!20 = metadata !{i32 786689, metadata !4, metadata !"q", metadata !5, i32 16777221, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [q] [line 5]
!21 = metadata !{i32 5, i32 41, metadata !4, null}
!22 = metadata !{i32 8, i32 7, metadata !23, null} ; [ DW_TAG_imported_declaration ]
!23 = metadata !{i32 786443, metadata !1, metadata !4, i32 8, i32 7, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!24 = metadata !{i32 8, i32 15, metadata !25, null} ; [ DW_TAG_imported_declaration ]
!25 = metadata !{i32 786443, metadata !1, metadata !23, i32 8, i32 15, i32 1, i32 12} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!26 = metadata !{i32 9, i32 3, metadata !4, null}
!27 = metadata !{i32 17, i32 3, metadata !9, null}
!28 = metadata !{i32 786688, metadata !9, metadata !"tmp_0", metadata !5, i32 16, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmp_0] [line 16]
!29 = metadata !{i32 16, i32 7, metadata !9, null}
!30 = metadata !{i32 18, i32 3, metadata !9, null}
!31 = metadata !{i32 19, i32 7, metadata !32, null}
!32 = metadata !{i32 786443, metadata !1, metadata !9, i32 19, i32 7, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!33 = metadata !{i32 21, i32 11, metadata !34, null}
!34 = metadata !{i32 786443, metadata !1, metadata !32, i32 19, i32 20, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!35 = metadata !{i32 786688, metadata !34, metadata !"tmp", metadata !5, i32 20, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmp] [line 20]
!36 = metadata !{i32 20, i32 9, metadata !34, null}
!37 = metadata !{i32 786688, metadata !9, metadata !"__retres", metadata !5, i32 15, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__retres] [line 15]
!38 = metadata !{i32 15, i32 7, metadata !9, null}
!39 = metadata !{i32 23, i32 5, metadata !34, null}
!40 = metadata !{i32 26, i32 17, metadata !9, null}
!41 = metadata !{i32 33, i32 18, metadata !12, null}
!42 = metadata !{i32 786688, metadata !12, metadata !"matroska", metadata !5, i32 33, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [matroska] [line 33]
!43 = metadata !{i32 33, i32 7, metadata !12, null}
!44 = metadata !{i32 786689, metadata !4, metadata !"q", metadata !5, i32 16777221, metadata !8, i32 0, metadata !45} ; [ DW_TAG_arg_variable ] [q] [line 5]
!45 = metadata !{i32 35, i32 15, metadata !46, null}
!46 = metadata !{i32 786443, metadata !1, metadata !12, i32 34, i32 13, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!47 = metadata !{i32 5, i32 41, metadata !4, metadata !45}
!48 = metadata !{i32 786688, metadata !12, metadata !"tmpVar0", metadata !5, i32 32, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmpVar0] [line 32]
!49 = metadata !{i32 32, i32 7, metadata !12, null}
!50 = metadata !{i32 0}
!51 = metadata !{i32 786688, metadata !12, metadata !"res", metadata !5, i32 31, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [res] [line 31]
!52 = metadata !{i32 31, i32 7, metadata !12, null}
!53 = metadata !{i32 786688, metadata !54, metadata !"id", metadata !5, i32 39, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [id] [line 39]
!54 = metadata !{i32 786443, metadata !1, metadata !46, i32 38, i32 22, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!55 = metadata !{i32 39, i32 11, metadata !54, null}
!56 = metadata !{i32 786688, metadata !9, metadata !"tmp_0", metadata !5, i32 16, metadata !8, i32 0, metadata !57} ; [ DW_TAG_auto_variable ] [tmp_0] [line 16]
!57 = metadata !{i32 59, i32 32, metadata !58, null}
!58 = metadata !{i32 786443, metadata !1, metadata !54, i32 40, i32 19, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!59 = metadata !{i32 16, i32 7, metadata !9, metadata !57}
!60 = metadata !{i32 786688, metadata !34, metadata !"tmp", metadata !5, i32 20, metadata !8, i32 0, metadata !57} ; [ DW_TAG_auto_variable ] [tmp] [line 20]
!61 = metadata !{i32 20, i32 9, metadata !34, metadata !57}
!62 = metadata !{i32 786688, metadata !9, metadata !"__retres", metadata !5, i32 15, metadata !8, i32 0, metadata !57} ; [ DW_TAG_auto_variable ] [__retres] [line 15]
!63 = metadata !{i32 15, i32 7, metadata !9, metadata !57}
!64 = metadata !{i32 786688, metadata !9, metadata !"tmp_0", metadata !5, i32 16, metadata !8, i32 0, metadata !65} ; [ DW_TAG_auto_variable ] [tmp_0] [line 16]
!65 = metadata !{i32 45, i32 19, metadata !66, null}
!66 = metadata !{i32 786443, metadata !1, metadata !58, i32 44, i32 9, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!67 = metadata !{i32 16, i32 7, metadata !9, metadata !65}
!68 = metadata !{i32 786688, metadata !34, metadata !"tmp", metadata !5, i32 20, metadata !8, i32 0, metadata !65} ; [ DW_TAG_auto_variable ] [tmp] [line 20]
!69 = metadata !{i32 20, i32 9, metadata !34, metadata !65}
!70 = metadata !{i32 786688, metadata !9, metadata !"__retres", metadata !5, i32 15, metadata !8, i32 0, metadata !65} ; [ DW_TAG_auto_variable ] [__retres] [line 15]
!71 = metadata !{i32 15, i32 7, metadata !9, metadata !65}
!72 = metadata !{i32 786688, metadata !9, metadata !"tmp_0", metadata !5, i32 16, metadata !8, i32 0, metadata !73} ; [ DW_TAG_auto_variable ] [tmp_0] [line 16]
!73 = metadata !{i32 53, i32 17, metadata !58, null}
!74 = metadata !{i32 16, i32 7, metadata !9, metadata !73}
!75 = metadata !{i32 786688, metadata !34, metadata !"tmp", metadata !5, i32 20, metadata !8, i32 0, metadata !73} ; [ DW_TAG_auto_variable ] [tmp] [line 20]
!76 = metadata !{i32 20, i32 9, metadata !34, metadata !73}
!77 = metadata !{i32 786688, metadata !9, metadata !"__retres", metadata !5, i32 15, metadata !8, i32 0, metadata !73} ; [ DW_TAG_auto_variable ] [__retres] [line 15]
!78 = metadata !{i32 15, i32 7, metadata !9, metadata !73}
!79 = metadata !{i32 1}
!80 = metadata !{i32 34, i32 3, metadata !12, null}
!81 = metadata !{i32 8, i32 7, metadata !23, metadata !45} ; [ DW_TAG_imported_declaration ]
!82 = metadata !{i32 8, i32 15, metadata !25, metadata !45} ; [ DW_TAG_imported_declaration ]
!83 = metadata !{i32 36, i32 9, metadata !84, null}
!84 = metadata !{i32 786443, metadata !1, metadata !46, i32 36, i32 9, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!85 = metadata !{i32 64, i32 20, metadata !86, null}
!86 = metadata !{i32 786443, metadata !1, metadata !87, i32 64, i32 20, i32 1, i32 17} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!87 = metadata !{i32 786443, metadata !1, metadata !46, i32 64, i32 9, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!88 = metadata !{i32 39, i32 16, metadata !54, null}
!89 = metadata !{i32 40, i32 7, metadata !54, null}
!90 = metadata !{i32 17, i32 3, metadata !9, metadata !65}
!91 = metadata !{i32 18, i32 3, metadata !9, metadata !65}
!92 = metadata !{i32 19, i32 7, metadata !32, metadata !65}
!93 = metadata !{i32 21, i32 11, metadata !34, metadata !65}
!94 = metadata !{i32 23, i32 5, metadata !34, metadata !65}
!95 = metadata !{i32 46, i32 11, metadata !66, null}
!96 = metadata !{i32 48, i32 13, metadata !97, null}
!97 = metadata !{i32 786443, metadata !1, metadata !58, i32 48, i32 13, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!98 = metadata !{i32 17, i32 3, metadata !9, metadata !73}
!99 = metadata !{i32 18, i32 3, metadata !9, metadata !73}
!100 = metadata !{i32 19, i32 7, metadata !32, metadata !73}
!101 = metadata !{i32 21, i32 11, metadata !34, metadata !73}
!102 = metadata !{i32 23, i32 5, metadata !34, metadata !73}
!103 = metadata !{i32 54, i32 9, metadata !58, null}
!104 = metadata !{i32 55, i32 13, metadata !105, null}
!105 = metadata !{i32 786443, metadata !1, metadata !58, i32 55, i32 13, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!106 = metadata !{i32 58, i32 9, metadata !58, null} ; [ DW_TAG_imported_module ]
!107 = metadata !{i32 19, i32 7, metadata !32, metadata !57}
!108 = metadata !{i32 21, i32 11, metadata !34, metadata !57}
!109 = metadata !{i32 23, i32 5, metadata !34, metadata !57}
!110 = metadata !{i32 66, i32 3, metadata !12, null}

