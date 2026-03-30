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
  %"2" = add nsw i32 %"1", 1, !dbg !27
  store i32 %"2", i32* @"'flag", align 4, !dbg !27
  ret i32 -1, !dbg !28
}

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb2:
  call void @llvm.dbg.value(metadata !29, i64 0, metadata !30), !dbg !31
  call void @llvm.dbg.value(metadata !32, i64 0, metadata !33), !dbg !34
  call void @llvm.dbg.value(metadata !{i32 %matroska.0}, i64 0, metadata !35), !dbg !38
  call void @llvm.dbg.value(metadata !{i32 %..i}, i64 0, metadata !39), !dbg !40
  call void @llvm.dbg.value(metadata !41, i64 0, metadata !42), !dbg !44
  call void @llvm.dbg.value(metadata !45, i64 0, metadata !33), !dbg !34
  call void @llvm.dbg.value(metadata !{i32 %"8"}, i64 0, metadata !33), !dbg !34
  call void @llvm.dbg.value(metadata !{i32 %"13"}, i64 0, metadata !33), !dbg !34
  call void @llvm.dbg.value(metadata !41, i64 0, metadata !33), !dbg !34
  br label %main_bb3, !dbg !46

main_bb3:                                         ; preds = %main_NewDefault, %main_bb5, %main_bb2
  %res.0 = phi i32 [ 0, %main_bb2 ], [ %res.1, %main_NewDefault ], [ %res.1, %main_bb5 ]
  %matroska.0 = phi i32 [ 2, %main_bb2 ], [ 1, %main_bb5 ], [ %matroska.0, %main_NewDefault ]
  %"3" = icmp eq i32 %matroska.0, 1, !dbg !47
  %..i = select i1 %"3", i32 0, i32 1, !dbg !48
  %"4" = icmp ne i32 %..i, 0, !dbg !49
  br i1 %"4", label %main_bb4, label %main_bb8, !dbg !49

main_bb4:                                         ; preds = %main_bb7, %main_bb6, %main_bb3
  %res.1 = phi i32 [ %res.0, %main_bb3 ], [ %., %main_bb7 ], [ %"8", %main_bb6 ]
  br label %main_NodeBlock

main_NodeBlock:                                   ; preds = %main_bb4
  %Pivot = icmp slt i32 %res.1, 0
  br i1 %Pivot, label %main_LeafBlock, label %main_LeafBlock1

main_LeafBlock:                                   ; preds = %main_NodeBlock
  %SwitchLeaf = icmp eq i32 %res.1, -1
  br i1 %SwitchLeaf, label %main_bb5, label %main_NewDefault

main_bb5:                                         ; preds = %main_LeafBlock
  call void @llvm.dbg.value(metadata !41, i64 0, metadata !30), !dbg !31
  br label %main_bb3, !dbg !51

main_LeafBlock1:                                  ; preds = %main_NodeBlock
  %SwitchLeaf2 = icmp eq i32 %res.1, 0
  br i1 %SwitchLeaf2, label %main_bb6, label %main_NewDefault

main_bb6:                                         ; preds = %main_LeafBlock1
  %"5" = load i32* @"'flag", align 4, !dbg !54
  %"6" = add nsw i32 %"5", 1, !dbg !54
  store i32 %"6", i32* @"'flag", align 4, !dbg !54
  %"7" = icmp slt i32 -1, 0, !dbg !58
  %"8" = zext i1 %"7" to i32, !dbg !58
  %"9" = icmp ne i32 %"8", 0, !dbg !59
  br i1 %"9", label %main_bb4, label %main_bb7, !dbg !59

main_bb7:                                         ; preds = %main_bb6
  %"10" = load i32* @"'flag", align 4, !dbg !61
  %"11" = add nsw i32 %"10", 1, !dbg !61
  store i32 %"11", i32* @"'flag", align 4, !dbg !61
  %"12" = icmp eq i32 -1, 0, !dbg !63
  %"13" = zext i1 %"12" to i32, !dbg !63
  %"14" = icmp ne i32 %"13", 0, !dbg !64
  %. = select i1 %"14", i32 1, i32 %"13", !dbg !64
  br label %main_bb4, !dbg !66

main_NewDefault:                                  ; preds = %main_LeafBlock1, %main_LeafBlock
  br label %main_bb3

main_bb8:                                         ; preds = %main_bb3
  ret void, !dbg !67
}

declare i32 @__kittel_nondef.0()

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
!27 = metadata !{i32 18, i32 3, metadata !9, null}
!28 = metadata !{i32 26, i32 17, metadata !9, null}
!29 = metadata !{i32 2}
!30 = metadata !{i32 786688, metadata !12, metadata !"matroska", metadata !5, i32 32, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [matroska] [line 32]
!31 = metadata !{i32 32, i32 7, metadata !12, null}
!32 = metadata !{i32 0}
!33 = metadata !{i32 786688, metadata !12, metadata !"res", metadata !5, i32 33, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [res] [line 33]
!34 = metadata !{i32 33, i32 7, metadata !12, null}
!35 = metadata !{i32 786689, metadata !4, metadata !"q", metadata !5, i32 16777221, metadata !8, i32 0, metadata !36} ; [ DW_TAG_arg_variable ] [q] [line 5]
!36 = metadata !{i32 35, i32 15, metadata !37, null}
!37 = metadata !{i32 786443, metadata !1, metadata !12, i32 34, i32 13, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!38 = metadata !{i32 5, i32 41, metadata !4, metadata !36}
!39 = metadata !{i32 786688, metadata !12, metadata !"tmpVar0", metadata !5, i32 31, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmpVar0] [line 31]
!40 = metadata !{i32 31, i32 7, metadata !12, null}
!41 = metadata !{i32 1}
!42 = metadata !{i32 786688, metadata !43, metadata !"id", metadata !5, i32 38, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [id] [line 38]
!43 = metadata !{i32 786443, metadata !1, metadata !37, i32 37, i32 22, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!44 = metadata !{i32 38, i32 11, metadata !43, null}
!45 = metadata !{i32 -1}
!46 = metadata !{i32 34, i32 3, metadata !12, null}
!47 = metadata !{i32 8, i32 7, metadata !23, metadata !36} ; [ DW_TAG_imported_declaration ]
!48 = metadata !{i32 8, i32 15, metadata !25, metadata !36} ; [ DW_TAG_imported_declaration ]
!49 = metadata !{i32 36, i32 9, metadata !50, null}
!50 = metadata !{i32 786443, metadata !1, metadata !37, i32 36, i32 9, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!51 = metadata !{i32 63, i32 20, metadata !52, null}
!52 = metadata !{i32 786443, metadata !1, metadata !53, i32 63, i32 20, i32 1, i32 17} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!53 = metadata !{i32 786443, metadata !1, metadata !37, i32 63, i32 9, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!54 = metadata !{i32 18, i32 3, metadata !9, metadata !55}
!55 = metadata !{i32 44, i32 19, metadata !56, null}
!56 = metadata !{i32 786443, metadata !1, metadata !57, i32 43, i32 9, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!57 = metadata !{i32 786443, metadata !1, metadata !43, i32 39, i32 19, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!58 = metadata !{i32 45, i32 11, metadata !56, null}
!59 = metadata !{i32 47, i32 13, metadata !60, null}
!60 = metadata !{i32 786443, metadata !1, metadata !57, i32 47, i32 13, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!61 = metadata !{i32 18, i32 3, metadata !9, metadata !62}
!62 = metadata !{i32 52, i32 17, metadata !57, null}
!63 = metadata !{i32 53, i32 9, metadata !57, null}
!64 = metadata !{i32 54, i32 13, metadata !65, null}
!65 = metadata !{i32 786443, metadata !1, metadata !57, i32 54, i32 13, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!66 = metadata !{i32 57, i32 9, metadata !57, null}
!67 = metadata !{i32 65, i32 3, metadata !12, null}

