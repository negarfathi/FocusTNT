; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@"'flag" = global i32 0, align 4
@"'count" = global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @read_slice_1() #0 {
read_slice_1_bb0:
  %"0" = load i32* @"'flag", align 4, !dbg !18
  %"1" = icmp eq i32 %"0", 1, !dbg !18
  %"2" = load i32* @"'count", align 4
  %"3" = icmp sgt i32 %"2", 100, !dbg !20
  %or.cond = or i1 %"1", %"3", !dbg !18
  br i1 %or.cond, label %read_slice_1_bb5, label %read_slice_1_bb1, !dbg !18

read_slice_1_bb1:                                 ; preds = %read_slice_1_bb0
  call void @llvm.dbg.value(metadata !22, i64 0, metadata !23), !dbg !24
  %"4" = icmp sle i32 -10, 0, !dbg !25
  br i1 %"4", label %read_slice_1_bb5, label %read_slice_1_bb2, !dbg !25

read_slice_1_bb2:                                 ; preds = %read_slice_1_bb1
  %"5" = srem i32 -10, 1000, !dbg !27
  call void @llvm.dbg.value(metadata !{i32 %"5"}, i64 0, metadata !23), !dbg !24
  %"6" = icmp slt i32 %"5", 995, !dbg !29
  br i1 %"6", label %read_slice_1_bb3, label %read_slice_1_bb4, !dbg !29

read_slice_1_bb3:                                 ; preds = %read_slice_1_bb2
  %"7" = load i32* @"'count", align 4, !dbg !31
  %"8" = add nsw i32 %"7", 1, !dbg !31
  store i32 %"8", i32* @"'count", align 4, !dbg !31
  call void @llvm.dbg.value(metadata !{i32 %"5"}, i64 0, metadata !33), !dbg !34
  br label %read_slice_1_bb5, !dbg !35

read_slice_1_bb4:                                 ; preds = %read_slice_1_bb2
  store i32 1, i32* @"'flag", align 4, !dbg !36
  call void @llvm.dbg.value(metadata !38, i64 0, metadata !33), !dbg !34
  br label %read_slice_1_bb5

read_slice_1_bb5:                                 ; preds = %read_slice_1_bb1, %read_slice_1_bb4, %read_slice_1_bb3, %read_slice_1_bb0
  %__retres.2 = phi i32 [ 0, %read_slice_1_bb0 ], [ -1, %read_slice_1_bb1 ], [ %"5", %read_slice_1_bb3 ], [ 0, %read_slice_1_bb4 ]
  ret i32 %__retres.2, !dbg !39
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb6:
  %"9" = load i32* @"'flag", align 4, !dbg !40
  %"10" = load i32* @"'count", align 4, !dbg !41
  call void @llvm.dbg.value(metadata !{i32 %.}, i64 0, metadata !43), !dbg !44
  call void @llvm.dbg.value(metadata !22, i64 0, metadata !45), !dbg !46
  br label %main_read_slice_1.exit, !dbg !47

main_read_slice_1.exit:                           ; preds = %main_read_slice_1.exit, %main_bb6
  %"11" = icmp eq i32 %"9", 1, !dbg !40
  %"12" = icmp sgt i32 %"10", 100, !dbg !48
  %or.cond.i = or i1 %"11", %"12", !dbg !40
  %. = select i1 %or.cond.i, i32 0, i32 -1, !dbg !40
  %"13" = icmp slt i32 %., 0, !dbg !49
  br i1 %"13", label %main_bb7, label %main_read_slice_1.exit, !dbg !49

main_bb7:                                         ; preds = %main_read_slice_1.exit
  ret void, !dbg !51
}

declare i32 @__kittel_nondef.0()

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!15, !16}
!llvm.ident = !{!17}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !12, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [//FILES_DIR/SourceCode_SemanticAugmentor.c] [DW_LANG_C99]
!1 = metadata !{metadata !"FILES_DIR/SourceCode_SemanticAugmentor.c", metadata !"/"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"read_slice_1", metadata !"read_slice_1", metadata !"", i32 7, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @read_slice_1, null, null, metadata !2, i32 8} ; [ DW_TAG_subprogram ] [line 7] [def] [scope 8] [read_slice_1]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 35, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @main, null, null, metadata !2, i32 36} ; [ DW_TAG_subprogram ] [line 35] [def] [scope 36] [main]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{null}
!12 = metadata !{metadata !13, metadata !14}
!13 = metadata !{i32 786484, i32 0, null, metadata !"flag", metadata !"flag", metadata !"", metadata !5, i32 5, metadata !8, i32 0, i32 1, i32* @"'flag", null} ; [ DW_TAG_variable ] [flag] [line 5] [def]
!14 = metadata !{i32 786484, i32 0, null, metadata !"count", metadata !"count", metadata !"", metadata !5, i32 6, metadata !8, i32 0, i32 1, i32* @"'count", null} ; [ DW_TAG_variable ] [count] [line 6] [def]
!15 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!16 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!17 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!18 = metadata !{i32 10, i32 7, metadata !19, null}
!19 = metadata !{i32 786443, metadata !1, metadata !4, i32 10, i32 7, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!20 = metadata !{i32 15, i32 9, metadata !21, null}
!21 = metadata !{i32 786443, metadata !1, metadata !19, i32 15, i32 9, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!22 = metadata !{i32 -10}
!23 = metadata !{i32 786688, metadata !4, metadata !"num", metadata !5, i32 19, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [num] [line 19]
!24 = metadata !{i32 19, i32 7, metadata !4, null}
!25 = metadata !{i32 20, i32 7, metadata !26, null}
!26 = metadata !{i32 786443, metadata !1, metadata !4, i32 20, i32 7, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!27 = metadata !{i32 22, i32 5, metadata !28, null}
!28 = metadata !{i32 786443, metadata !1, metadata !26, i32 21, i32 8, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!29 = metadata !{i32 23, i32 9, metadata !30, null}
!30 = metadata !{i32 786443, metadata !1, metadata !28, i32 23, i32 9, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!31 = metadata !{i32 24, i32 7, metadata !32, null}
!32 = metadata !{i32 786443, metadata !1, metadata !30, i32 23, i32 20, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!33 = metadata !{i32 786688, metadata !4, metadata !"__retres", metadata !5, i32 9, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__retres] [line 9]
!34 = metadata !{i32 9, i32 7, metadata !4, null}
!35 = metadata !{i32 26, i32 5, metadata !32, null}
!36 = metadata !{i32 28, i32 7, metadata !37, null}
!37 = metadata !{i32 786443, metadata !1, metadata !30, i32 27, i32 10, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!38 = metadata !{i32 0}
!39 = metadata !{i32 32, i32 17, metadata !4, null}
!40 = metadata !{i32 10, i32 7, metadata !19, metadata !41}
!41 = metadata !{i32 39, i32 11, metadata !42, null}
!42 = metadata !{i32 786443, metadata !1, metadata !9, i32 37, i32 13, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!43 = metadata !{i32 786688, metadata !42, metadata !"tmp", metadata !5, i32 38, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmp] [line 38]
!44 = metadata !{i32 38, i32 9, metadata !42, null}
!45 = metadata !{i32 786688, metadata !4, metadata !"num", metadata !5, i32 19, metadata !8, i32 0, metadata !41} ; [ DW_TAG_auto_variable ] [num] [line 19]
!46 = metadata !{i32 19, i32 7, metadata !4, metadata !41}
!47 = metadata !{i32 37, i32 3, metadata !9, null}
!48 = metadata !{i32 15, i32 9, metadata !21, metadata !41}
!49 = metadata !{i32 40, i32 9, metadata !50, null}
!50 = metadata !{i32 786443, metadata !1, metadata !42, i32 40, i32 9, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!51 = metadata !{i32 45, i32 3, metadata !9, null}

