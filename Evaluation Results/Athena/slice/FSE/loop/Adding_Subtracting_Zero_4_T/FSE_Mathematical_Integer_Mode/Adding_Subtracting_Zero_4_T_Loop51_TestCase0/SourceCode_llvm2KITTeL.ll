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
  %count.0 = phi i32 [ %"8", %read_slice_1_bb4 ], [ 0, %read_slice_1_bb0 ]
  %.0 = phi i32 [ %"10", %read_slice_1_bb4 ], [ %loc, %read_slice_1_bb0 ]
  %"2" = icmp slt i32 %.0, %len, !dbg !26
  br i1 %"2", label %read_slice_1_bb2, label %read_slice_1_bb6, !dbg !26

read_slice_1_bb2:                                 ; preds = %read_slice_1_bb1
  %"3" = call i32 @__VERIFIER_nondet_int(), !dbg !28
  %"4" = icmp eq i32 %"3", 0, !dbg !30
  br i1 %"4", label %read_slice_1_bb6, label %read_slice_1_bb3, !dbg !30

read_slice_1_bb3:                                 ; preds = %read_slice_1_bb2
  %"5" = icmp slt i32 %"3", 0, !dbg !32
  %"6" = sub nsw i32 0, %"3", !dbg !35
  %. = select i1 %"5", i32 %"6", i32 %"3", !dbg !32
  %"7" = srem i32 %., 1000, !dbg !37
  %"8" = add nsw i32 %count.0, 1, !dbg !38
  %"9" = icmp slt i32 %"7", 995, !dbg !39
  br i1 %"9", label %read_slice_1_bb4, label %read_slice_1_bb5, !dbg !39

read_slice_1_bb4:                                 ; preds = %read_slice_1_bb3
  %"10" = add nsw i32 %.0, 1, !dbg !41
  br label %read_slice_1_bb1, !dbg !43

read_slice_1_bb5:                                 ; preds = %read_slice_1_bb3
  store i32 1, i32* @"'flag", align 4, !dbg !44
  call void @llvm.dbg.value(metadata !{i32 %"8"}, i64 0, metadata !46), !dbg !47
  br label %read_slice_1_bb6, !dbg !48

read_slice_1_bb6:                                 ; preds = %read_slice_1_bb1, %read_slice_1_bb2, %read_slice_1_bb0, %read_slice_1_bb5
  %__retres.0 = phi i32 [ %"8", %read_slice_1_bb5 ], [ 0, %read_slice_1_bb0 ], [ -1, %read_slice_1_bb2 ], [ %count.0, %read_slice_1_bb1 ]
  ret i32 %__retres.0, !dbg !49
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

declare i32 @__VERIFIER_nondet_int() #2

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb7:
  %"11" = call i32 @__VERIFIER_nondet_int(), !dbg !50
  call void @llvm.dbg.value(metadata !{i32 %"11"}, i64 0, metadata !51), !dbg !52
  %"12" = icmp sle i32 %"11", 0, !dbg !53
  br i1 %"12", label %main_bb18, label %main_bb8, !dbg !53

main_bb8:                                         ; preds = %main_bb16, %main_bb7, %main_bb17
  %tries.0 = phi i32 [ %tries.0, %main_bb17 ], [ 0, %main_bb7 ], [ %"27", %main_bb16 ]
  %buf.0 = phi i32 [ %"30", %main_bb17 ], [ 0, %main_bb7 ], [ %buf.0, %main_bb16 ]
  %count.0 = phi i32 [ %"29", %main_bb17 ], [ %"11", %main_bb7 ], [ %count.0, %main_bb16 ]
  %"13" = icmp sgt i32 %count.0, 0, !dbg !55
  br i1 %"13", label %main_bb9, label %main_bb18, !dbg !55

main_bb9:                                         ; preds = %main_bb8
  %"14" = load i32* @"'flag", align 4, !dbg !57
  %"15" = icmp eq i32 %"14", 1, !dbg !57
  br i1 %"15", label %main_read_slice_1.exit, label %main_bb10, !dbg !57

main_bb10:                                        ; preds = %main_bb13, %main_bb9
  %count.0.i = phi i32 [ %"22", %main_bb13 ], [ 0, %main_bb9 ], !dbg !58
  %.0.i = phi i32 [ %"24", %main_bb13 ], [ %buf.0, %main_bb9 ], !dbg !58
  %"16" = icmp slt i32 %.0.i, %count.0, !dbg !60
  br i1 %"16", label %main_bb11, label %main_read_slice_1.exit, !dbg !60

main_bb11:                                        ; preds = %main_bb10
  %"17" = call i32 @__VERIFIER_nondet_int() #3, !dbg !61
  %"18" = icmp eq i32 %"17", 0, !dbg !62
  br i1 %"18", label %main_read_slice_1.exit, label %main_bb12, !dbg !62

main_bb12:                                        ; preds = %main_bb11
  %"19" = icmp slt i32 %"17", 0, !dbg !63
  %"20" = sub nsw i32 0, %"17", !dbg !64
  %..i = select i1 %"19", i32 %"20", i32 %"17", !dbg !63
  %"21" = srem i32 %..i, 1000, !dbg !65
  %"22" = add nsw i32 %count.0.i, 1, !dbg !66
  %"23" = icmp slt i32 %"21", 995, !dbg !67
  br i1 %"23", label %main_bb13, label %main_bb14, !dbg !67

main_bb13:                                        ; preds = %main_bb12
  %"24" = add nsw i32 %.0.i, 1, !dbg !68
  br label %main_bb10, !dbg !69

main_bb14:                                        ; preds = %main_bb12
  store i32 1, i32* @"'flag", align 4, !dbg !70
  call void @llvm.dbg.value(metadata !{i32 %"22"}, i64 0, metadata !71) #3, !dbg !72
  br label %main_read_slice_1.exit, !dbg !73

main_read_slice_1.exit:                           ; preds = %main_bb9, %main_bb10, %main_bb11, %main_bb14
  %__retres.0.i = phi i32 [ %"22", %main_bb14 ], [ 0, %main_bb9 ], [ -1, %main_bb11 ], [ %count.0.i, %main_bb10 ], !dbg !58
  %"25" = icmp sle i32 %__retres.0.i, 0, !dbg !74
  br i1 %"25", label %main_bb15, label %main_bb17, !dbg !74

main_bb15:                                        ; preds = %main_read_slice_1.exit
  %"26" = icmp eq i32 %__retres.0.i, 0, !dbg !76
  br i1 %"26", label %main_bb16, label %main_bb18, !dbg !76

main_bb16:                                        ; preds = %main_bb15
  %"27" = add nsw i32 %tries.0, 1, !dbg !79
  %"28" = icmp slt i32 %tries.0, 5, !dbg !81
  br i1 %"28", label %main_bb8, label %main_bb18, !dbg !81

main_bb17:                                        ; preds = %main_read_slice_1.exit
  %"29" = sub nsw i32 %count.0, %__retres.0.i, !dbg !83
  %"30" = add nsw i32 %buf.0, %__retres.0.i, !dbg !84
  br label %main_bb8, !dbg !85

main_bb18:                                        ; preds = %main_bb8, %main_bb15, %main_bb16, %main_bb7
  ret void, !dbg !86
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
!27 = metadata !{i32 786443, metadata !1, metadata !4, i32 14, i32 3, i32 1, i32 17} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!28 = metadata !{i32 15, i32 15, metadata !29, null}
!29 = metadata !{i32 786443, metadata !1, metadata !4, i32 14, i32 21, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!30 = metadata !{i32 16, i32 9, metadata !31, null}
!31 = metadata !{i32 786443, metadata !1, metadata !29, i32 16, i32 9, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!32 = metadata !{i32 22, i32 11, metadata !33, null}
!33 = metadata !{i32 786443, metadata !1, metadata !34, i32 22, i32 11, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!34 = metadata !{i32 786443, metadata !1, metadata !31, i32 21, i32 10, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!35 = metadata !{i32 22, i32 20, metadata !36, null}
!36 = metadata !{i32 786443, metadata !1, metadata !33, i32 22, i32 20, i32 1, i32 18} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!37 = metadata !{i32 23, i32 7, metadata !34, null}
!38 = metadata !{i32 24, i32 7, metadata !34, null}
!39 = metadata !{i32 25, i32 11, metadata !40, null}
!40 = metadata !{i32 786443, metadata !1, metadata !34, i32 25, i32 11, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!41 = metadata !{i32 25, i32 22, metadata !42, null}
!42 = metadata !{i32 786443, metadata !1, metadata !40, i32 25, i32 22, i32 1, i32 19} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!43 = metadata !{i32 33, i32 3, metadata !29, null}
!44 = metadata !{i32 27, i32 9, metadata !45, null}
!45 = metadata !{i32 786443, metadata !1, metadata !40, i32 26, i32 12, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!46 = metadata !{i32 786688, metadata !4, metadata !"__retres", metadata !5, i32 8, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__retres] [line 8]
!47 = metadata !{i32 8, i32 7, metadata !4, null} ; [ DW_TAG_imported_declaration ]
!48 = metadata !{i32 30, i32 9, metadata !45, null}
!49 = metadata !{i32 35, i32 17, metadata !4, null}
!50 = metadata !{i32 42, i32 15, metadata !9, null}
!51 = metadata !{i32 786688, metadata !9, metadata !"count", metadata !5, i32 42, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 42]
!52 = metadata !{i32 42, i32 7, metadata !9, null}
!53 = metadata !{i32 43, i32 7, metadata !54, null}
!54 = metadata !{i32 786443, metadata !1, metadata !9, i32 43, i32 7, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!55 = metadata !{i32 49, i32 3, metadata !56, null}
!56 = metadata !{i32 786443, metadata !1, metadata !9, i32 49, i32 3, i32 1, i32 20} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!57 = metadata !{i32 10, i32 7, metadata !25, metadata !58}
!58 = metadata !{i32 50, i32 11, metadata !59, null}
!59 = metadata !{i32 786443, metadata !1, metadata !9, i32 49, i32 21, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!60 = metadata !{i32 14, i32 3, metadata !27, metadata !58}
!61 = metadata !{i32 15, i32 15, metadata !29, metadata !58}
!62 = metadata !{i32 16, i32 9, metadata !31, metadata !58}
!63 = metadata !{i32 22, i32 11, metadata !33, metadata !58}
!64 = metadata !{i32 22, i32 20, metadata !36, metadata !58}
!65 = metadata !{i32 23, i32 7, metadata !34, metadata !58}
!66 = metadata !{i32 24, i32 7, metadata !34, metadata !58}
!67 = metadata !{i32 25, i32 11, metadata !40, metadata !58}
!68 = metadata !{i32 25, i32 22, metadata !42, metadata !58}
!69 = metadata !{i32 33, i32 3, metadata !29, metadata !58}
!70 = metadata !{i32 27, i32 9, metadata !45, metadata !58}
!71 = metadata !{i32 786688, metadata !4, metadata !"__retres", metadata !5, i32 8, metadata !8, i32 0, metadata !58} ; [ DW_TAG_auto_variable ] [__retres] [line 8]
!72 = metadata !{i32 8, i32 7, metadata !4, metadata !58} ; [ DW_TAG_imported_declaration ]
!73 = metadata !{i32 30, i32 9, metadata !45, metadata !58}
!74 = metadata !{i32 51, i32 9, metadata !75, null}
!75 = metadata !{i32 786443, metadata !1, metadata !59, i32 51, i32 9, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!76 = metadata !{i32 52, i32 11, metadata !77, null}
!77 = metadata !{i32 786443, metadata !1, metadata !78, i32 52, i32 11, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!78 = metadata !{i32 786443, metadata !1, metadata !75, i32 51, i32 19, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!79 = metadata !{i32 55, i32 9, metadata !80, null}
!80 = metadata !{i32 786443, metadata !1, metadata !77, i32 52, i32 21, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!81 = metadata !{i32 56, i32 13, metadata !82, null}
!82 = metadata !{i32 786443, metadata !1, metadata !80, i32 56, i32 13, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!83 = metadata !{i32 61, i32 5, metadata !59, null}
!84 = metadata !{i32 62, i32 5, metadata !59, null}
!85 = metadata !{i32 63, i32 3, metadata !59, null}
!86 = metadata !{i32 64, i32 17, metadata !9, null}

