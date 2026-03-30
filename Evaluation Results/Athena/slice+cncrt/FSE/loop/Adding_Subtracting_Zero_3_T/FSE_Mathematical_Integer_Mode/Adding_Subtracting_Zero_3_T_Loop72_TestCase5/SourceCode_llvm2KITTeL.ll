; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@"'flag" = global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @read_slice_1(i32 %loc, i32 %len) #0 {
read_slice_1_bb0:
  call void @llvm.dbg.value(metadata !{i32 %loc}, i64 0, metadata !17), !dbg !18
  call void @llvm.dbg.value(metadata !{i32 %len}, i64 0, metadata !19), !dbg !20
  call void @llvm.dbg.value(metadata !21, i64 0, metadata !22), !dbg !23
  %"0" = load i32* @"'flag", align 4, !dbg !24
  %"1" = icmp eq i32 %"0", 1, !dbg !24
  br i1 %"1", label %read_slice_1_bb6, label %read_slice_1_bb1, !dbg !24

read_slice_1_bb1:                                 ; preds = %read_slice_1_bb0, %read_slice_1_bb4
  %count.0 = phi i32 [ %"7", %read_slice_1_bb4 ], [ 0, %read_slice_1_bb0 ]
  %.0 = phi i32 [ %"9", %read_slice_1_bb4 ], [ %loc, %read_slice_1_bb0 ]
  %"2" = icmp slt i32 %.0, %len, !dbg !26
  br i1 %"2", label %read_slice_1_bb2, label %read_slice_1_bb6, !dbg !26

read_slice_1_bb2:                                 ; preds = %read_slice_1_bb1
  %"3" = icmp eq i32 1, 0, !dbg !28
  br i1 %"3", label %read_slice_1_bb6, label %read_slice_1_bb3, !dbg !28

read_slice_1_bb3:                                 ; preds = %read_slice_1_bb2
  %"4" = icmp slt i32 1, 0, !dbg !31
  %"5" = sub nsw i32 0, 1, !dbg !34
  %. = select i1 %"4", i32 %"5", i32 1, !dbg !31
  %"6" = srem i32 %., 1000, !dbg !36
  %"7" = add nsw i32 %count.0, 1, !dbg !37
  %"8" = icmp slt i32 %"6", 995, !dbg !38
  br i1 %"8", label %read_slice_1_bb4, label %read_slice_1_bb5, !dbg !38

read_slice_1_bb4:                                 ; preds = %read_slice_1_bb3
  %"9" = add nsw i32 %.0, 1, !dbg !40
  br label %read_slice_1_bb1, !dbg !42

read_slice_1_bb5:                                 ; preds = %read_slice_1_bb3
  store i32 1, i32* @"'flag", align 4, !dbg !43
  call void @llvm.dbg.value(metadata !{i32 %"7"}, i64 0, metadata !45), !dbg !46
  br label %read_slice_1_bb6, !dbg !47

read_slice_1_bb6:                                 ; preds = %read_slice_1_bb1, %read_slice_1_bb2, %read_slice_1_bb0, %read_slice_1_bb5
  %__retres.0 = phi i32 [ %"7", %read_slice_1_bb5 ], [ 0, %read_slice_1_bb0 ], [ -1, %read_slice_1_bb2 ], [ %count.0, %read_slice_1_bb1 ]
  ret i32 %__retres.0, !dbg !48
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb7:
  call void @llvm.dbg.value(metadata !21, i64 0, metadata !49), !dbg !50
  call void @llvm.dbg.value(metadata !51, i64 0, metadata !52), !dbg !53
  store i32 0, i32* @"'flag", align 4, !dbg !54
  call void @llvm.dbg.value(metadata !21, i64 0, metadata !55), !dbg !56
  %"10" = icmp sle i32 15, 0, !dbg !57
  %"11" = icmp sgt i32 15, 65536, !dbg !59
  %or.cond = or i1 %"10", %"11", !dbg !57
  br i1 %or.cond, label %main_bb16, label %main_bb8, !dbg !57

main_bb8:                                         ; preds = %main_bb7
  call void @llvm.dbg.value(metadata !{i32 %pos.0}, i64 0, metadata !61), !dbg !64
  call void @llvm.dbg.value(metadata !{i32 %"14"}, i64 0, metadata !65), !dbg !66
  call void @llvm.dbg.value(metadata !21, i64 0, metadata !67), !dbg !68
  %"12" = load i32* @"'flag", align 4, !dbg !69
  call void @llvm.dbg.value(metadata !{i32 %__retres.0.i}, i64 0, metadata !70), !dbg !71
  call void @llvm.dbg.value(metadata !{i32 %"19"}, i64 0, metadata !55), !dbg !56
  call void @llvm.dbg.value(metadata !{i32 %"21"}, i64 0, metadata !70), !dbg !71
  call void @llvm.dbg.value(metadata !{i32 %"22"}, i64 0, metadata !49), !dbg !50
  br label %main_bb9, !dbg !72

main_bb9:                                         ; preds = %main_bb13, %main_bb15, %main_bb8
  %__fc_errno_0.0 = phi i32 [ 0, %main_bb8 ], [ %__fc_errno_0.0, %main_bb15 ], [ %"19", %main_bb13 ]
  %pos.0 = phi i32 [ 0, %main_bb8 ], [ %"22", %main_bb15 ], [ %pos.0, %main_bb13 ]
  %"13" = icmp slt i32 %pos.0, 15, !dbg !73
  br i1 %"13", label %main_bb10, label %main_bb16, !dbg !73

main_bb10:                                        ; preds = %main_bb9
  %"14" = sub nsw i32 15, %pos.0, !dbg !62
  %"15" = icmp eq i32 %"12", 1, !dbg !69
  br i1 %"15", label %main_read_slice_1.exit, label %main_bb11, !dbg !69

main_bb11:                                        ; preds = %main_bb12, %main_bb10
  %count.0.i = phi i32 [ %"17", %main_bb12 ], [ 0, %main_bb10 ], !dbg !62
  %.0.i = phi i32 [ %"18", %main_bb12 ], [ %pos.0, %main_bb10 ], !dbg !62
  %"16" = icmp slt i32 %.0.i, %"14", !dbg !75
  br i1 %"16", label %main_bb12, label %main_read_slice_1.exit, !dbg !75

main_bb12:                                        ; preds = %main_bb11
  %"17" = add nsw i32 %count.0.i, 1, !dbg !76
  %"18" = add nsw i32 %.0.i, 1, !dbg !77
  br label %main_bb11, !dbg !78

main_read_slice_1.exit:                           ; preds = %main_bb10, %main_bb11
  %__retres.0.i = phi i32 [ 0, %main_bb10 ], [ %count.0.i, %main_bb11 ], !dbg !62
  br label %main_NodeBlock

main_NodeBlock:                                   ; preds = %main_read_slice_1.exit
  %Pivot = icmp slt i32 %__retres.0.i, 0
  br i1 %Pivot, label %main_LeafBlock, label %main_LeafBlock1

main_LeafBlock:                                   ; preds = %main_NodeBlock
  %SwitchLeaf = icmp eq i32 %__retres.0.i, -1
  br i1 %SwitchLeaf, label %main_bb13, label %main_NewDefault

main_bb13:                                        ; preds = %main_LeafBlock
  %"19" = add nsw i32 %__fc_errno_0.0, 1, !dbg !79
  %"20" = icmp eq i32 %"19", 5, !dbg !82
  br i1 %"20", label %main_bb16, label %main_bb9, !dbg !82

main_LeafBlock1:                                  ; preds = %main_NodeBlock
  %SwitchLeaf2 = icmp eq i32 %__retres.0.i, 0
  br i1 %SwitchLeaf2, label %main_bb14, label %main_NewDefault

main_bb14:                                        ; preds = %main_LeafBlock1
  %"21" = add nsw i32 %__retres.0.i, 1, !dbg !84
  br label %main_bb15, !dbg !84

main_NewDefault:                                  ; preds = %main_LeafBlock1, %main_LeafBlock
  br label %main_bb15

main_bb15:                                        ; preds = %main_NewDefault, %main_bb14
  %rc.0 = phi i32 [ %"21", %main_bb14 ], [ %__retres.0.i, %main_NewDefault ]
  %"22" = add nsw i32 %pos.0, %rc.0, !dbg !87
  br label %main_bb9, !dbg !88

main_bb16:                                        ; preds = %main_bb9, %main_bb13, %main_bb7
  ret void, !dbg !89
}

declare i32 @__kittel_nondef.0()

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!14, !15}
!llvm.ident = !{!16}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !12, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [//FILES_DIR/SourceCode_SemanticAugmentor.c] [DW_LANG_C99]
!1 = metadata !{metadata !"FILES_DIR/SourceCode_SemanticAugmentor.c", metadata !"/"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"read_slice_1", metadata !"read_slice_1", metadata !"", i32 6, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i32)* @read_slice_1, null, null, metadata !2, i32 7} ; [ DW_TAG_subprogram ] [line 6] [def] [scope 7] [read_slice_1]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 38, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @main, null, null, metadata !2, i32 39} ; [ DW_TAG_subprogram ] [line 38] [def] [scope 39] [main]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{null}
!12 = metadata !{metadata !13}
!13 = metadata !{i32 786484, i32 0, null, metadata !"flag", metadata !"flag", metadata !"", metadata !5, i32 5, metadata !8, i32 0, i32 1, i32* @"'flag", null} ; [ DW_TAG_variable ] [flag] [line 5] [def]
!14 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!15 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!16 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!17 = metadata !{i32 786689, metadata !4, metadata !"loc", metadata !5, i32 16777222, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [loc] [line 6]
!18 = metadata !{i32 6, i32 22, metadata !4, null}
!19 = metadata !{i32 786689, metadata !4, metadata !"len", metadata !5, i32 33554438, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 6]
!20 = metadata !{i32 6, i32 31, metadata !4, null}
!21 = metadata !{i32 0}
!22 = metadata !{i32 786688, metadata !4, metadata !"count", metadata !5, i32 9, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 9]
!23 = metadata !{i32 9, i32 7, metadata !4, null}
!24 = metadata !{i32 10, i32 7, metadata !25, null}
!25 = metadata !{i32 786443, metadata !1, metadata !4, i32 10, i32 7, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!26 = metadata !{i32 14, i32 3, metadata !27, null}
!27 = metadata !{i32 786443, metadata !1, metadata !4, i32 14, i32 3, i32 1, i32 19} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!28 = metadata !{i32 16, i32 9, metadata !29, null}
!29 = metadata !{i32 786443, metadata !1, metadata !30, i32 16, i32 9, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!30 = metadata !{i32 786443, metadata !1, metadata !4, i32 14, i32 21, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!31 = metadata !{i32 22, i32 11, metadata !32, null}
!32 = metadata !{i32 786443, metadata !1, metadata !33, i32 22, i32 11, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!33 = metadata !{i32 786443, metadata !1, metadata !29, i32 21, i32 10, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!34 = metadata !{i32 22, i32 20, metadata !35, null}
!35 = metadata !{i32 786443, metadata !1, metadata !32, i32 22, i32 20, i32 1, i32 20} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!36 = metadata !{i32 23, i32 7, metadata !33, null}
!37 = metadata !{i32 24, i32 7, metadata !33, null}
!38 = metadata !{i32 25, i32 11, metadata !39, null}
!39 = metadata !{i32 786443, metadata !1, metadata !33, i32 25, i32 11, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!40 = metadata !{i32 25, i32 22, metadata !41, null}
!41 = metadata !{i32 786443, metadata !1, metadata !39, i32 25, i32 22, i32 1, i32 21} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!42 = metadata !{i32 33, i32 3, metadata !30, null}
!43 = metadata !{i32 27, i32 9, metadata !44, null}
!44 = metadata !{i32 786443, metadata !1, metadata !39, i32 26, i32 12, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!45 = metadata !{i32 786688, metadata !4, metadata !"__retres", metadata !5, i32 8, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__retres] [line 8]
!46 = metadata !{i32 8, i32 7, metadata !4, null} ; [ DW_TAG_imported_declaration ]
!47 = metadata !{i32 30, i32 9, metadata !44, null}
!48 = metadata !{i32 35, i32 17, metadata !4, null}
!49 = metadata !{i32 786688, metadata !9, metadata !"pos", metadata !5, i32 41, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pos] [line 41]
!50 = metadata !{i32 41, i32 7, metadata !9, null}
!51 = metadata !{i32 15}
!52 = metadata !{i32 786688, metadata !9, metadata !"size", metadata !5, i32 42, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [size] [line 42]
!53 = metadata !{i32 42, i32 7, metadata !9, null}
!54 = metadata !{i32 43, i32 3, metadata !9, null}
!55 = metadata !{i32 786688, metadata !9, metadata !"__fc_errno_0", metadata !5, i32 44, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__fc_errno_0] [line 44]
!56 = metadata !{i32 44, i32 7, metadata !9, null}
!57 = metadata !{i32 45, i32 7, metadata !58, null}
!58 = metadata !{i32 786443, metadata !1, metadata !9, i32 45, i32 7, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!59 = metadata !{i32 50, i32 9, metadata !60, null}
!60 = metadata !{i32 786443, metadata !1, metadata !58, i32 50, i32 9, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!61 = metadata !{i32 786689, metadata !4, metadata !"loc", metadata !5, i32 16777222, metadata !8, i32 0, metadata !62} ; [ DW_TAG_arg_variable ] [loc] [line 6]
!62 = metadata !{i32 55, i32 14, metadata !63, null}
!63 = metadata !{i32 786443, metadata !1, metadata !9, i32 54, i32 22, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!64 = metadata !{i32 6, i32 22, metadata !4, metadata !62}
!65 = metadata !{i32 786689, metadata !4, metadata !"len", metadata !5, i32 33554438, metadata !8, i32 0, metadata !62} ; [ DW_TAG_arg_variable ] [len] [line 6]
!66 = metadata !{i32 6, i32 31, metadata !4, metadata !62}
!67 = metadata !{i32 786688, metadata !4, metadata !"count", metadata !5, i32 9, metadata !8, i32 0, metadata !62} ; [ DW_TAG_auto_variable ] [count] [line 9]
!68 = metadata !{i32 9, i32 7, metadata !4, metadata !62}
!69 = metadata !{i32 10, i32 7, metadata !25, metadata !62}
!70 = metadata !{i32 786688, metadata !63, metadata !"rc", metadata !5, i32 55, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rc] [line 55]
!71 = metadata !{i32 55, i32 9, metadata !63, null}
!72 = metadata !{i32 54, i32 3, metadata !9, null}
!73 = metadata !{i32 54, i32 3, metadata !74, null}
!74 = metadata !{i32 786443, metadata !1, metadata !9, i32 54, i32 3, i32 1, i32 22} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!75 = metadata !{i32 14, i32 3, metadata !27, metadata !62}
!76 = metadata !{i32 24, i32 7, metadata !33, metadata !62}
!77 = metadata !{i32 25, i32 22, metadata !41, metadata !62}
!78 = metadata !{i32 33, i32 3, metadata !30, metadata !62}
!79 = metadata !{i32 57, i32 7, metadata !80, null}
!80 = metadata !{i32 786443, metadata !1, metadata !81, i32 56, i32 19, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!81 = metadata !{i32 786443, metadata !1, metadata !63, i32 56, i32 9, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!82 = metadata !{i32 58, i32 11, metadata !83, null} ; [ DW_TAG_imported_module ]
!83 = metadata !{i32 786443, metadata !1, metadata !80, i32 58, i32 11, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!84 = metadata !{i32 64, i32 18, metadata !85, null}
!85 = metadata !{i32 786443, metadata !1, metadata !86, i32 64, i32 18, i32 1, i32 23} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!86 = metadata !{i32 786443, metadata !1, metadata !63, i32 64, i32 9, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!87 = metadata !{i32 65, i32 5, metadata !63, null}
!88 = metadata !{i32 66, i32 3, metadata !63, null}
!89 = metadata !{i32 67, i32 17, metadata !9, null}

