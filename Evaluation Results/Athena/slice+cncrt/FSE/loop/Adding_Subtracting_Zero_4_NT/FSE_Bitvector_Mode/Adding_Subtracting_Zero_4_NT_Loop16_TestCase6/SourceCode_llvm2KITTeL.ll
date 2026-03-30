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
  call void @llvm.dbg.value(metadata !24, i64 0, metadata !25), !dbg !27
  call void @llvm.dbg.value(metadata !{i32 %"3"}, i64 0, metadata !25), !dbg !27
  call void @llvm.dbg.value(metadata !{i32 %"4"}, i64 0, metadata !25), !dbg !27
  call void @llvm.dbg.value(metadata !{i32 %"5"}, i64 0, metadata !22), !dbg !23
  call void @llvm.dbg.value(metadata !{i32 %"7"}, i64 0, metadata !17), !dbg !18
  br label %read_slice_1_bb1, !dbg !28

read_slice_1_bb1:                                 ; preds = %read_slice_1_bb4, %read_slice_1_bb0
  %count.0 = phi i32 [ 0, %read_slice_1_bb0 ], [ %"5", %read_slice_1_bb4 ]
  %.0 = phi i32 [ %loc, %read_slice_1_bb0 ], [ %"7", %read_slice_1_bb4 ]
  %"0" = icmp slt i32 %.0, %len, !dbg !29
  br i1 %"0", label %read_slice_1_bb2, label %read_slice_1_bb5, !dbg !29

read_slice_1_bb2:                                 ; preds = %read_slice_1_bb1
  %"1" = icmp eq i32 996, 0, !dbg !31
  br i1 %"1", label %read_slice_1_bb5, label %read_slice_1_bb3, !dbg !31

read_slice_1_bb3:                                 ; preds = %read_slice_1_bb2
  %"2" = icmp slt i32 996, 0, !dbg !33
  %"3" = sub nsw i32 0, 996, !dbg !36
  %. = select i1 %"2", i32 %"3", i32 996, !dbg !33
  %"4" = srem i32 %., 1000, !dbg !38
  %"5" = add nsw i32 %count.0, 1, !dbg !39
  %"6" = icmp slt i32 %"4", 995, !dbg !40
  br i1 %"6", label %read_slice_1_bb4, label %read_slice_1_bb5, !dbg !40

read_slice_1_bb4:                                 ; preds = %read_slice_1_bb3
  %"7" = add nsw i32 %.0, 1, !dbg !42
  br label %read_slice_1_bb1, !dbg !44

read_slice_1_bb5:                                 ; preds = %read_slice_1_bb1, %read_slice_1_bb3, %read_slice_1_bb2
  %__retres.0 = phi i32 [ -1, %read_slice_1_bb2 ], [ %"5", %read_slice_1_bb3 ], [ %count.0, %read_slice_1_bb1 ]
  ret i32 %__retres.0, !dbg !45
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb6:
  call void @llvm.dbg.value(metadata !46, i64 0, metadata !47), !dbg !48
  %"8" = icmp sle i32 2, 0, !dbg !49
  br i1 %"8", label %main_bb9, label %main_bb7, !dbg !49

main_bb7:                                         ; preds = %main_bb6, %main_bb8
  %buf.0 = phi i32 [ %"13", %main_bb8 ], [ 0, %main_bb6 ]
  %count.0 = phi i32 [ %"12", %main_bb8 ], [ 2, %main_bb6 ]
  %"9" = icmp sgt i32 %count.0, 0, !dbg !51
  br i1 %"9", label %main_read_slice_1.exit, label %main_bb9, !dbg !51

main_read_slice_1.exit:                           ; preds = %main_bb7
  %"10" = icmp slt i32 %buf.0, %count.0, !dbg !53
  %. = select i1 %"10", i32 1, i32 0, !dbg !53
  %"11" = icmp slt i32 %., 0, !dbg !56
  br i1 %"11", label %main_bb9, label %main_bb8, !dbg !56

main_bb8:                                         ; preds = %main_read_slice_1.exit
  %"12" = sub nsw i32 %count.0, %., !dbg !58
  %"13" = add nsw i32 %buf.0, %., !dbg !59
  br label %main_bb7, !dbg !60

main_bb9:                                         ; preds = %main_bb7, %main_read_slice_1.exit, %main_bb6
  ret void, !dbg !61
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
!24 = metadata !{i32 996}
!25 = metadata !{i32 786688, metadata !26, metadata !"num", metadata !5, i32 11, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [num] [line 11]
!26 = metadata !{i32 786443, metadata !1, metadata !4, i32 10, i32 21, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!27 = metadata !{i32 11, i32 9, metadata !26, null}
!28 = metadata !{i32 10, i32 3, metadata !4, null}
!29 = metadata !{i32 10, i32 3, metadata !30, null}
!30 = metadata !{i32 786443, metadata !1, metadata !4, i32 10, i32 3, i32 1, i32 11} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!31 = metadata !{i32 12, i32 9, metadata !32, null}
!32 = metadata !{i32 786443, metadata !1, metadata !26, i32 12, i32 9, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!33 = metadata !{i32 18, i32 11, metadata !34, null}
!34 = metadata !{i32 786443, metadata !1, metadata !35, i32 18, i32 11, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!35 = metadata !{i32 786443, metadata !1, metadata !32, i32 17, i32 10, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!36 = metadata !{i32 18, i32 20, metadata !37, null}
!37 = metadata !{i32 786443, metadata !1, metadata !34, i32 18, i32 20, i32 1, i32 12} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!38 = metadata !{i32 19, i32 7, metadata !35, null}
!39 = metadata !{i32 20, i32 7, metadata !35, null}
!40 = metadata !{i32 21, i32 11, metadata !41, null}
!41 = metadata !{i32 786443, metadata !1, metadata !35, i32 21, i32 11, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!42 = metadata !{i32 21, i32 22, metadata !43, null}
!43 = metadata !{i32 786443, metadata !1, metadata !41, i32 21, i32 22, i32 1, i32 13} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!44 = metadata !{i32 28, i32 3, metadata !26, null}
!45 = metadata !{i32 30, i32 17, metadata !4, null}
!46 = metadata !{i32 2}
!47 = metadata !{i32 786688, metadata !9, metadata !"count", metadata !5, i32 36, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 36]
!48 = metadata !{i32 36, i32 7, metadata !9, null}
!49 = metadata !{i32 37, i32 7, metadata !50, null}
!50 = metadata !{i32 786443, metadata !1, metadata !9, i32 37, i32 7, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!51 = metadata !{i32 39, i32 3, metadata !52, null}
!52 = metadata !{i32 786443, metadata !1, metadata !9, i32 39, i32 3, i32 1, i32 15} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!53 = metadata !{i32 10, i32 3, metadata !30, metadata !54}
!54 = metadata !{i32 40, i32 11, metadata !55, null}
!55 = metadata !{i32 786443, metadata !1, metadata !9, i32 39, i32 21, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!56 = metadata !{i32 41, i32 9, metadata !57, null}
!57 = metadata !{i32 786443, metadata !1, metadata !55, i32 41, i32 9, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!58 = metadata !{i32 45, i32 5, metadata !55, null}
!59 = metadata !{i32 46, i32 5, metadata !55, null}
!60 = metadata !{i32 47, i32 3, metadata !55, null}
!61 = metadata !{i32 48, i32 17, metadata !9, null}

