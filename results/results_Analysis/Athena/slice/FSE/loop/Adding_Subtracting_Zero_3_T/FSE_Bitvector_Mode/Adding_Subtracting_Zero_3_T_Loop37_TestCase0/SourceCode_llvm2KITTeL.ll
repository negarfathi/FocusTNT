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
  call void @llvm.dbg.value(metadata !{i32 %"1"}, i64 0, metadata !24), !dbg !26
  call void @llvm.dbg.value(metadata !{i32 %"4"}, i64 0, metadata !24), !dbg !26
  call void @llvm.dbg.value(metadata !{i32 %"5"}, i64 0, metadata !24), !dbg !26
  call void @llvm.dbg.value(metadata !{i32 %"6"}, i64 0, metadata !22), !dbg !23
  call void @llvm.dbg.value(metadata !{i32 %"8"}, i64 0, metadata !17), !dbg !18
  br label %read_slice_1_bb1, !dbg !27

read_slice_1_bb1:                                 ; preds = %read_slice_1_bb4, %read_slice_1_bb0
  %count.0 = phi i32 [ 0, %read_slice_1_bb0 ], [ %"6", %read_slice_1_bb4 ]
  %.0 = phi i32 [ %loc, %read_slice_1_bb0 ], [ %"8", %read_slice_1_bb4 ]
  %"0" = icmp slt i32 %.0, %len, !dbg !28
  br i1 %"0", label %read_slice_1_bb2, label %read_slice_1_bb5, !dbg !28

read_slice_1_bb2:                                 ; preds = %read_slice_1_bb1
  %"1" = call i32 @__VERIFIER_nondet_int(), !dbg !30
  %"2" = icmp eq i32 %"1", 0, !dbg !31
  br i1 %"2", label %read_slice_1_bb5, label %read_slice_1_bb3, !dbg !31

read_slice_1_bb3:                                 ; preds = %read_slice_1_bb2
  %"3" = icmp slt i32 %"1", 0, !dbg !33
  %"4" = sub nsw i32 0, %"1", !dbg !36
  %. = select i1 %"3", i32 %"4", i32 %"1", !dbg !33
  %"5" = srem i32 %., 1000, !dbg !38
  %"6" = add nsw i32 %count.0, 1, !dbg !39
  %"7" = icmp slt i32 %"5", 995, !dbg !40
  br i1 %"7", label %read_slice_1_bb4, label %read_slice_1_bb5, !dbg !40

read_slice_1_bb4:                                 ; preds = %read_slice_1_bb3
  %"8" = add nsw i32 %.0, 1, !dbg !42
  br label %read_slice_1_bb1, !dbg !44

read_slice_1_bb5:                                 ; preds = %read_slice_1_bb1, %read_slice_1_bb3, %read_slice_1_bb2
  %__retres.0 = phi i32 [ -1, %read_slice_1_bb2 ], [ %"6", %read_slice_1_bb3 ], [ %count.0, %read_slice_1_bb1 ]
  ret i32 %__retres.0, !dbg !45
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

declare i32 @__VERIFIER_nondet_int() #2

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb6:
  call void @llvm.dbg.value(metadata !21, i64 0, metadata !46), !dbg !47
  %"9" = call i32 @__VERIFIER_nondet_int(), !dbg !48
  call void @llvm.dbg.value(metadata !{i32 %"9"}, i64 0, metadata !49), !dbg !50
  store i32 0, i32* @"'flag", align 4, !dbg !51
  call void @llvm.dbg.value(metadata !21, i64 0, metadata !52), !dbg !53
  %"10" = icmp sle i32 %"9", 0, !dbg !54
  %"11" = icmp sgt i32 %"9", 65536, !dbg !56
  %or.cond = or i1 %"10", %"11", !dbg !54
  br i1 %or.cond, label %main_bb16, label %main_bb7, !dbg !54

main_bb7:                                         ; preds = %main_bb6, %main_bb13, %main_bb15
  %__fc_errno_0.0 = phi i32 [ %__fc_errno_0.0, %main_bb15 ], [ %"23", %main_bb13 ], [ 0, %main_bb6 ]
  %pos.0 = phi i32 [ %"26", %main_bb15 ], [ %pos.0, %main_bb13 ], [ 0, %main_bb6 ]
  %"12" = icmp slt i32 %pos.0, %"9", !dbg !58
  br i1 %"12", label %main_bb8, label %main_bb16, !dbg !58

main_bb8:                                         ; preds = %main_bb7
  %"13" = sub nsw i32 %"9", %pos.0, !dbg !60
  br label %main_bb9, !dbg !62

main_bb9:                                         ; preds = %main_bb12, %main_bb8
  %count.0.i = phi i32 [ 0, %main_bb8 ], [ %"20", %main_bb12 ], !dbg !60
  %.0.i = phi i32 [ %pos.0, %main_bb8 ], [ %"22", %main_bb12 ], !dbg !60
  %"14" = icmp slt i32 %.0.i, %"13", !dbg !63
  br i1 %"14", label %main_bb10, label %main_read_slice_1.exit, !dbg !63

main_bb10:                                        ; preds = %main_bb9
  %"15" = call i32 @__VERIFIER_nondet_int() #3, !dbg !64
  %"16" = icmp eq i32 %"15", 0, !dbg !65
  br i1 %"16", label %main_read_slice_1.exit, label %main_bb11, !dbg !65

main_bb11:                                        ; preds = %main_bb10
  %"17" = icmp slt i32 %"15", 0, !dbg !66
  %"18" = sub nsw i32 0, %"15", !dbg !67
  %..i = select i1 %"17", i32 %"18", i32 %"15", !dbg !66
  %"19" = srem i32 %..i, 1000, !dbg !68
  %"20" = add nsw i32 %count.0.i, 1, !dbg !69
  %"21" = icmp slt i32 %"19", 995, !dbg !70
  br i1 %"21", label %main_bb12, label %main_read_slice_1.exit, !dbg !70

main_bb12:                                        ; preds = %main_bb11
  %"22" = add nsw i32 %.0.i, 1, !dbg !71
  br label %main_bb9, !dbg !72

main_read_slice_1.exit:                           ; preds = %main_bb9, %main_bb10, %main_bb11
  %__retres.0.i = phi i32 [ -1, %main_bb10 ], [ %"20", %main_bb11 ], [ %count.0.i, %main_bb9 ], !dbg !60
  call void @llvm.dbg.value(metadata !{i32 %__retres.0.i}, i64 0, metadata !73), !dbg !74
  br label %main_NodeBlock

main_NodeBlock:                                   ; preds = %main_read_slice_1.exit
  %Pivot = icmp slt i32 %__retres.0.i, 0
  br i1 %Pivot, label %main_LeafBlock, label %main_LeafBlock1

main_LeafBlock:                                   ; preds = %main_NodeBlock
  %SwitchLeaf = icmp eq i32 %__retres.0.i, -1
  br i1 %SwitchLeaf, label %main_bb13, label %main_NewDefault

main_bb13:                                        ; preds = %main_LeafBlock
  %"23" = add nsw i32 %__fc_errno_0.0, 1, !dbg !75
  call void @llvm.dbg.value(metadata !{i32 %"23"}, i64 0, metadata !52), !dbg !53
  %"24" = icmp eq i32 %"23", 5, !dbg !78
  br i1 %"24", label %main_bb16, label %main_bb7, !dbg !78

main_LeafBlock1:                                  ; preds = %main_NodeBlock
  %SwitchLeaf2 = icmp eq i32 %__retres.0.i, 0
  br i1 %SwitchLeaf2, label %main_bb14, label %main_NewDefault

main_bb14:                                        ; preds = %main_LeafBlock1
  %"25" = add nsw i32 %__retres.0.i, 1, !dbg !80
  call void @llvm.dbg.value(metadata !{i32 %"25"}, i64 0, metadata !73), !dbg !74
  br label %main_bb15, !dbg !80

main_NewDefault:                                  ; preds = %main_LeafBlock1, %main_LeafBlock
  br label %main_bb15

main_bb15:                                        ; preds = %main_NewDefault, %main_bb14
  %rc.0 = phi i32 [ %"25", %main_bb14 ], [ %__retres.0.i, %main_NewDefault ]
  %"26" = add nsw i32 %pos.0, %rc.0, !dbg !83
  call void @llvm.dbg.value(metadata !{i32 %"26"}, i64 0, metadata !46), !dbg !47
  br label %main_bb7, !dbg !84

main_bb16:                                        ; preds = %main_bb7, %main_bb13, %main_bb6
  ret void, !dbg !85
}

declare i32 @__kittel_nondef.0()

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

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
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 33, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @main, null, null, metadata !2, i32 34} ; [ DW_TAG_subprogram ] [line 33] [def] [scope 34] [main]
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
!24 = metadata !{i32 786688, metadata !25, metadata !"num", metadata !5, i32 11, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [num] [line 11]
!25 = metadata !{i32 786443, metadata !1, metadata !4, i32 10, i32 21, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!26 = metadata !{i32 11, i32 9, metadata !25, null}
!27 = metadata !{i32 10, i32 3, metadata !4, null}
!28 = metadata !{i32 10, i32 3, metadata !29, null}
!29 = metadata !{i32 786443, metadata !1, metadata !4, i32 10, i32 3, i32 1, i32 15} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!30 = metadata !{i32 11, i32 15, metadata !25, null}
!31 = metadata !{i32 12, i32 9, metadata !32, null}
!32 = metadata !{i32 786443, metadata !1, metadata !25, i32 12, i32 9, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!33 = metadata !{i32 18, i32 11, metadata !34, null}
!34 = metadata !{i32 786443, metadata !1, metadata !35, i32 18, i32 11, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!35 = metadata !{i32 786443, metadata !1, metadata !32, i32 17, i32 10, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!36 = metadata !{i32 18, i32 20, metadata !37, null}
!37 = metadata !{i32 786443, metadata !1, metadata !34, i32 18, i32 20, i32 1, i32 16} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!38 = metadata !{i32 19, i32 7, metadata !35, null}
!39 = metadata !{i32 20, i32 7, metadata !35, null}
!40 = metadata !{i32 21, i32 11, metadata !41, null}
!41 = metadata !{i32 786443, metadata !1, metadata !35, i32 21, i32 11, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!42 = metadata !{i32 21, i32 22, metadata !43, null}
!43 = metadata !{i32 786443, metadata !1, metadata !41, i32 21, i32 22, i32 1, i32 17} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!44 = metadata !{i32 28, i32 3, metadata !25, null}
!45 = metadata !{i32 30, i32 17, metadata !4, null}
!46 = metadata !{i32 786688, metadata !9, metadata !"pos", metadata !5, i32 35, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pos] [line 35]
!47 = metadata !{i32 35, i32 7, metadata !9, null}
!48 = metadata !{i32 36, i32 14, metadata !9, null}
!49 = metadata !{i32 786688, metadata !9, metadata !"size", metadata !5, i32 36, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [size] [line 36]
!50 = metadata !{i32 36, i32 7, metadata !9, null}
!51 = metadata !{i32 37, i32 3, metadata !9, null}
!52 = metadata !{i32 786688, metadata !9, metadata !"__fc_errno_0", metadata !5, i32 38, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__fc_errno_0] [line 38]
!53 = metadata !{i32 38, i32 7, metadata !9, null}
!54 = metadata !{i32 39, i32 7, metadata !55, null}
!55 = metadata !{i32 786443, metadata !1, metadata !9, i32 39, i32 7, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!56 = metadata !{i32 41, i32 9, metadata !57, null}
!57 = metadata !{i32 786443, metadata !1, metadata !55, i32 41, i32 9, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!58 = metadata !{i32 42, i32 3, metadata !59, null}
!59 = metadata !{i32 786443, metadata !1, metadata !9, i32 42, i32 3, i32 1, i32 20} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!60 = metadata !{i32 43, i32 14, metadata !61, null}
!61 = metadata !{i32 786443, metadata !1, metadata !9, i32 42, i32 22, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!62 = metadata !{i32 10, i32 3, metadata !4, metadata !60}
!63 = metadata !{i32 10, i32 3, metadata !29, metadata !60}
!64 = metadata !{i32 11, i32 15, metadata !25, metadata !60}
!65 = metadata !{i32 12, i32 9, metadata !32, metadata !60}
!66 = metadata !{i32 18, i32 11, metadata !34, metadata !60}
!67 = metadata !{i32 18, i32 20, metadata !37, metadata !60}
!68 = metadata !{i32 19, i32 7, metadata !35, metadata !60}
!69 = metadata !{i32 20, i32 7, metadata !35, metadata !60}
!70 = metadata !{i32 21, i32 11, metadata !41, metadata !60}
!71 = metadata !{i32 21, i32 22, metadata !43, metadata !60}
!72 = metadata !{i32 28, i32 3, metadata !25, metadata !60}
!73 = metadata !{i32 786688, metadata !61, metadata !"rc", metadata !5, i32 43, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rc] [line 43]
!74 = metadata !{i32 43, i32 9, metadata !61, null}
!75 = metadata !{i32 45, i32 7, metadata !76, null}
!76 = metadata !{i32 786443, metadata !1, metadata !77, i32 44, i32 19, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!77 = metadata !{i32 786443, metadata !1, metadata !61, i32 44, i32 9, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!78 = metadata !{i32 46, i32 11, metadata !79, null}
!79 = metadata !{i32 786443, metadata !1, metadata !76, i32 46, i32 11, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!80 = metadata !{i32 52, i32 18, metadata !81, null}
!81 = metadata !{i32 786443, metadata !1, metadata !82, i32 52, i32 18, i32 1, i32 21} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!82 = metadata !{i32 786443, metadata !1, metadata !61, i32 52, i32 9, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!83 = metadata !{i32 53, i32 5, metadata !61, null}
!84 = metadata !{i32 54, i32 3, metadata !61, null}
!85 = metadata !{i32 55, i32 17, metadata !9, null}

