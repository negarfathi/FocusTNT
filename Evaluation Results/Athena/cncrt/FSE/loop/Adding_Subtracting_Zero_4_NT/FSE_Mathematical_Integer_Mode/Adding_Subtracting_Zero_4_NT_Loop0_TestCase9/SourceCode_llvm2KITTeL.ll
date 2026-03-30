; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@"'flag" = global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @read(i32 %loc, i32 %len) #0 {
read_bb0:
  call void @llvm.dbg.value(metadata !{i32 %loc}, i64 0, metadata !17), !dbg !18
  call void @llvm.dbg.value(metadata !{i32 %len}, i64 0, metadata !19), !dbg !20
  call void @llvm.dbg.value(metadata !21, i64 0, metadata !22), !dbg !23
  %"0" = load i32* @"'flag", align 4, !dbg !24
  %"1" = icmp eq i32 %"0", 1, !dbg !24
  br i1 %"1", label %read_bb6, label %read_bb1, !dbg !24

read_bb1:                                         ; preds = %read_bb0, %read_bb4
  %count.0 = phi i32 [ %"7", %read_bb4 ], [ 0, %read_bb0 ]
  %.01 = phi i32 [ %"9", %read_bb4 ], [ %loc, %read_bb0 ]
  %"2" = icmp slt i32 %.01, %len, !dbg !26
  br i1 %"2", label %read_bb2, label %read_bb6, !dbg !26

read_bb2:                                         ; preds = %read_bb1
  %"3" = icmp eq i32 -999, 0, !dbg !28
  br i1 %"3", label %read_bb6, label %read_bb3, !dbg !28

read_bb3:                                         ; preds = %read_bb2
  %"4" = icmp slt i32 -999, 0, !dbg !31
  %"5" = sub nsw i32 0, -999, !dbg !34
  %. = select i1 %"4", i32 %"5", i32 -999, !dbg !31
  %"6" = srem i32 %., 1000, !dbg !35
  %"7" = add nsw i32 %count.0, 1, !dbg !36
  %"8" = icmp slt i32 %"6", 995, !dbg !37
  br i1 %"8", label %read_bb4, label %read_bb5, !dbg !37

read_bb4:                                         ; preds = %read_bb3
  %"9" = add nsw i32 %.01, 1, !dbg !39
  br label %read_bb1, !dbg !41

read_bb5:                                         ; preds = %read_bb3
  store i32 1, i32* @"'flag", align 4, !dbg !42
  br label %read_bb6, !dbg !44

read_bb6:                                         ; preds = %read_bb1, %read_bb2, %read_bb0, %read_bb5
  %.0 = phi i32 [ %"7", %read_bb5 ], [ 0, %read_bb0 ], [ -1, %read_bb2 ], [ %count.0, %read_bb1 ]
  ret i32 %.0, !dbg !45
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
main_bb7:
  call void @llvm.dbg.value(metadata !46, i64 0, metadata !47), !dbg !48
  %"10" = icmp sle i32 30, 0, !dbg !49
  br i1 %"10", label %main_bb12, label %main_bb8, !dbg !49

main_bb8:                                         ; preds = %main_bb7, %main_bb11
  %buf.0 = phi i32 [ %"17", %main_bb11 ], [ 0, %main_bb7 ]
  %count.0 = phi i32 [ %"16", %main_bb11 ], [ 30, %main_bb7 ]
  %"11" = icmp sgt i32 %count.0, 0, !dbg !51
  br i1 %"11", label %main_bb9, label %main_bb12, !dbg !51

main_bb9:                                         ; preds = %main_bb8
  %"12" = load i32* @"'flag", align 4, !dbg !53
  %"13" = icmp ne i32 %"12", 1, !dbg !53
  %"14" = icmp slt i32 %buf.0, %count.0, !dbg !56
  %or.cond = and i1 %"13", %"14", !dbg !53
  br i1 %or.cond, label %main_bb10, label %main_read.exit, !dbg !53

main_bb10:                                        ; preds = %main_bb9
  store i32 1, i32* @"'flag", align 4, !dbg !57
  br label %main_read.exit, !dbg !58

main_read.exit:                                   ; preds = %main_bb9, %main_bb10
  %.0.i = phi i32 [ 1, %main_bb10 ], [ 0, %main_bb9 ], !dbg !54
  %"15" = icmp slt i32 %.0.i, 0, !dbg !59
  br i1 %"15", label %main_bb12, label %main_bb11, !dbg !59

main_bb11:                                        ; preds = %main_read.exit
  %"16" = sub nsw i32 %count.0, %.0.i, !dbg !61
  %"17" = add nsw i32 %buf.0, %.0.i, !dbg !62
  br label %main_bb8, !dbg !63

main_bb12:                                        ; preds = %main_bb8, %main_read.exit, %main_bb7
  ret i32 0, !dbg !64
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
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"read", metadata !"read", metadata !"", i32 10, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i32)* @read, null, null, metadata !2, i32 11} ; [ DW_TAG_subprogram ] [line 10] [def] [scope 11] [read]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 42, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 43} ; [ DW_TAG_subprogram ] [line 42] [def] [scope 43] [main]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !8}
!12 = metadata !{metadata !13}
!13 = metadata !{i32 786484, i32 0, null, metadata !"flag", metadata !"flag", metadata !"", metadata !5, i32 9, metadata !8, i32 0, i32 1, i32* @"'flag", null} ; [ DW_TAG_variable ] [flag] [line 9] [def]
!14 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!15 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!16 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!17 = metadata !{i32 786689, metadata !4, metadata !"loc", metadata !5, i32 16777226, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [loc] [line 10]
!18 = metadata !{i32 10, i32 15, metadata !4, null}
!19 = metadata !{i32 786689, metadata !4, metadata !"len", metadata !5, i32 33554442, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 10]
!20 = metadata !{i32 10, i32 25, metadata !4, null}
!21 = metadata !{i32 0}
!22 = metadata !{i32 786688, metadata !4, metadata !"count", metadata !5, i32 12, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 12]
!23 = metadata !{i32 12, i32 9, metadata !4, null}
!24 = metadata !{i32 13, i32 9, metadata !25, null}
!25 = metadata !{i32 786443, metadata !1, metadata !4, i32 13, i32 9, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!26 = metadata !{i32 15, i32 5, metadata !27, null}
!27 = metadata !{i32 786443, metadata !1, metadata !4, i32 15, i32 5, i32 1, i32 12} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!28 = metadata !{i32 18, i32 13, metadata !29, null}
!29 = metadata !{i32 786443, metadata !1, metadata !30, i32 18, i32 13, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!30 = metadata !{i32 786443, metadata !1, metadata !4, i32 16, i32 5, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!31 = metadata !{i32 24, i32 17, metadata !32, null}
!32 = metadata !{i32 786443, metadata !1, metadata !33, i32 24, i32 17, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!33 = metadata !{i32 786443, metadata !1, metadata !29, i32 23, i32 9, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!34 = metadata !{i32 25, i32 17, metadata !32, null}
!35 = metadata !{i32 26, i32 13, metadata !33, null}
!36 = metadata !{i32 27, i32 13, metadata !33, null}
!37 = metadata !{i32 28, i32 17, metadata !38, null}
!38 = metadata !{i32 786443, metadata !1, metadata !33, i32 28, i32 17, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!39 = metadata !{i32 30, i32 17, metadata !40, null}
!40 = metadata !{i32 786443, metadata !1, metadata !38, i32 29, i32 13, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!41 = metadata !{i32 31, i32 17, metadata !40, null}
!42 = metadata !{i32 35, i32 17, metadata !43, null}
!43 = metadata !{i32 786443, metadata !1, metadata !38, i32 34, i32 13, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!44 = metadata !{i32 36, i32 17, metadata !43, null}
!45 = metadata !{i32 41, i32 1, metadata !4, null}
!46 = metadata !{i32 30}
!47 = metadata !{i32 786688, metadata !9, metadata !"count", metadata !5, i32 44, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 44]
!48 = metadata !{i32 44, i32 9, metadata !9, null}
!49 = metadata !{i32 45, i32 9, metadata !50, null}
!50 = metadata !{i32 786443, metadata !1, metadata !9, i32 45, i32 9, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!51 = metadata !{i32 49, i32 5, metadata !52, null}
!52 = metadata !{i32 786443, metadata !1, metadata !9, i32 49, i32 5, i32 1, i32 13} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!53 = metadata !{i32 13, i32 9, metadata !25, metadata !54}
!54 = metadata !{i32 51, i32 15, metadata !55, null}
!55 = metadata !{i32 786443, metadata !1, metadata !9, i32 50, i32 5, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!56 = metadata !{i32 15, i32 5, metadata !27, metadata !54}
!57 = metadata !{i32 35, i32 17, metadata !43, metadata !54}
!58 = metadata !{i32 36, i32 17, metadata !43, metadata !54}
!59 = metadata !{i32 52, i32 13, metadata !60, null}
!60 = metadata !{i32 786443, metadata !1, metadata !55, i32 52, i32 13, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!61 = metadata !{i32 54, i32 9, metadata !55, null}
!62 = metadata !{i32 55, i32 9, metadata !55, null}
!63 = metadata !{i32 56, i32 5, metadata !55, null}
!64 = metadata !{i32 58, i32 1, metadata !9, null} ; [ DW_TAG_imported_module ]

