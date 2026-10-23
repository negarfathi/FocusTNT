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
  call void @llvm.dbg.value(metadata !{i32 %"1"}, i64 0, metadata !22), !dbg !23
  call void @llvm.dbg.value(metadata !{i32 %"2"}, i64 0, metadata !17), !dbg !18
  br label %read_slice_1_bb1, !dbg !24

read_slice_1_bb1:                                 ; preds = %read_slice_1_bb2, %read_slice_1_bb0
  %count.0 = phi i32 [ 0, %read_slice_1_bb0 ], [ %"1", %read_slice_1_bb2 ]
  %.0 = phi i32 [ %loc, %read_slice_1_bb0 ], [ %"2", %read_slice_1_bb2 ]
  %"0" = icmp slt i32 %.0, %len, !dbg !25
  br i1 %"0", label %read_slice_1_bb2, label %read_slice_1_bb3, !dbg !25

read_slice_1_bb2:                                 ; preds = %read_slice_1_bb1
  %"1" = add nsw i32 %count.0, 1, !dbg !27
  %"2" = add nsw i32 %.0, 1, !dbg !29
  br label %read_slice_1_bb1, !dbg !30

read_slice_1_bb3:                                 ; preds = %read_slice_1_bb1
  call void @llvm.dbg.value(metadata !{i32 %count.0}, i64 0, metadata !31), !dbg !32
  ret i32 %count.0, !dbg !33
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb4:
  call void @llvm.dbg.value(metadata !21, i64 0, metadata !34), !dbg !35
  call void @llvm.dbg.value(metadata !36, i64 0, metadata !37), !dbg !38
  store i32 0, i32* @"'flag", align 4, !dbg !39
  %"3" = icmp sle i32 2000, 0, !dbg !40
  %"4" = icmp sgt i32 2000, 65536, !dbg !42
  %or.cond = or i1 %"3", %"4", !dbg !40
  br i1 %or.cond, label %main_bb9, label %main_bb5, !dbg !40

main_bb5:                                         ; preds = %main_bb4, %main_read_slice_1.exit
  %pos.0 = phi i32 [ %"10", %main_read_slice_1.exit ], [ 0, %main_bb4 ]
  %"5" = icmp slt i32 %pos.0, 2000, !dbg !44
  br i1 %"5", label %main_bb6, label %main_bb9, !dbg !44

main_bb6:                                         ; preds = %main_bb5
  %"6" = sub nsw i32 2000, %pos.0, !dbg !46
  br label %main_bb7, !dbg !48

main_bb7:                                         ; preds = %main_bb8, %main_bb6
  %count.0.i = phi i32 [ 0, %main_bb6 ], [ %"8", %main_bb8 ], !dbg !46
  %.0.i = phi i32 [ %pos.0, %main_bb6 ], [ %"9", %main_bb8 ], !dbg !46
  %"7" = icmp slt i32 %.0.i, %"6", !dbg !49
  br i1 %"7", label %main_bb8, label %main_read_slice_1.exit, !dbg !49

main_bb8:                                         ; preds = %main_bb7
  %"8" = add nsw i32 %count.0.i, 1, !dbg !50
  %"9" = add nsw i32 %.0.i, 1, !dbg !51
  br label %main_bb7, !dbg !52

main_read_slice_1.exit:                           ; preds = %main_bb7
  call void @llvm.dbg.value(metadata !{i32 %count.0.i}, i64 0, metadata !53), !dbg !54
  call void @llvm.dbg.value(metadata !{i32 %count.0.i}, i64 0, metadata !55), !dbg !56
  %"10" = add nsw i32 %pos.0, %count.0.i, !dbg !57
  call void @llvm.dbg.value(metadata !{i32 %"10"}, i64 0, metadata !34), !dbg !35
  br label %main_bb5, !dbg !58

main_bb9:                                         ; preds = %main_bb5, %main_bb4
  ret void, !dbg !59
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
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"read_slice_1", metadata !"read_slice_1", metadata !"", i32 3, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i32)* @read_slice_1, null, null, metadata !2, i32 4} ; [ DW_TAG_subprogram ] [line 3] [def] [scope 4] [read_slice_1]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 15, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @main, null, null, metadata !2, i32 16} ; [ DW_TAG_subprogram ] [line 15] [def] [scope 16] [main]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{null}
!12 = metadata !{metadata !13}
!13 = metadata !{i32 786484, i32 0, null, metadata !"flag", metadata !"flag", metadata !"", metadata !5, i32 2, metadata !8, i32 0, i32 1, i32* @"'flag", null} ; [ DW_TAG_variable ] [flag] [line 2] [def]
!14 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!15 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!16 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!17 = metadata !{i32 786689, metadata !4, metadata !"loc", metadata !5, i32 16777219, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [loc] [line 3]
!18 = metadata !{i32 3, i32 22, metadata !4, null}
!19 = metadata !{i32 786689, metadata !4, metadata !"len", metadata !5, i32 33554435, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 3]
!20 = metadata !{i32 3, i32 31, metadata !4, null}
!21 = metadata !{i32 0}
!22 = metadata !{i32 786688, metadata !4, metadata !"count", metadata !5, i32 6, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 6]
!23 = metadata !{i32 6, i32 7, metadata !4, null}
!24 = metadata !{i32 7, i32 3, metadata !4, null}
!25 = metadata !{i32 7, i32 3, metadata !26, null}
!26 = metadata !{i32 786443, metadata !1, metadata !4, i32 7, i32 3, i32 1, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!27 = metadata !{i32 8, i32 5, metadata !28, null} ; [ DW_TAG_imported_declaration ]
!28 = metadata !{i32 786443, metadata !1, metadata !4, i32 7, i32 21, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!29 = metadata !{i32 9, i32 5, metadata !28, null}
!30 = metadata !{i32 10, i32 3, metadata !28, null}
!31 = metadata !{i32 786688, metadata !4, metadata !"__retres", metadata !5, i32 5, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__retres] [line 5]
!32 = metadata !{i32 5, i32 7, metadata !4, null}
!33 = metadata !{i32 12, i32 3, metadata !4, null}
!34 = metadata !{i32 786688, metadata !9, metadata !"pos", metadata !5, i32 17, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pos] [line 17]
!35 = metadata !{i32 17, i32 7, metadata !9, null}
!36 = metadata !{i32 2000}
!37 = metadata !{i32 786688, metadata !9, metadata !"size", metadata !5, i32 18, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [size] [line 18]
!38 = metadata !{i32 18, i32 7, metadata !9, null}
!39 = metadata !{i32 19, i32 3, metadata !9, null}
!40 = metadata !{i32 20, i32 7, metadata !41, null}
!41 = metadata !{i32 786443, metadata !1, metadata !9, i32 20, i32 7, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!42 = metadata !{i32 22, i32 9, metadata !43, null}
!43 = metadata !{i32 786443, metadata !1, metadata !41, i32 22, i32 9, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!44 = metadata !{i32 23, i32 3, metadata !45, null}
!45 = metadata !{i32 786443, metadata !1, metadata !9, i32 23, i32 3, i32 1, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!46 = metadata !{i32 24, i32 14, metadata !47, null}
!47 = metadata !{i32 786443, metadata !1, metadata !9, i32 23, i32 22, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!48 = metadata !{i32 7, i32 3, metadata !4, metadata !46}
!49 = metadata !{i32 7, i32 3, metadata !26, metadata !46}
!50 = metadata !{i32 8, i32 5, metadata !28, metadata !46} ; [ DW_TAG_imported_declaration ]
!51 = metadata !{i32 9, i32 5, metadata !28, metadata !46}
!52 = metadata !{i32 10, i32 3, metadata !28, metadata !46}
!53 = metadata !{i32 786688, metadata !4, metadata !"__retres", metadata !5, i32 5, metadata !8, i32 0, metadata !46} ; [ DW_TAG_auto_variable ] [__retres] [line 5]
!54 = metadata !{i32 5, i32 7, metadata !4, metadata !46}
!55 = metadata !{i32 786688, metadata !47, metadata !"rc", metadata !5, i32 24, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rc] [line 24]
!56 = metadata !{i32 24, i32 9, metadata !47, null}
!57 = metadata !{i32 25, i32 5, metadata !47, null}
!58 = metadata !{i32 26, i32 3, metadata !47, null}
!59 = metadata !{i32 27, i32 17, metadata !9, null}

