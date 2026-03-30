; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define i64 @wrap_around(i64 %value, i64 %lower_bound, i64 %upper_bound) #0 {
wrap_around_bb0:
  call void @llvm.dbg.value(metadata !{i64 %value}, i64 0, metadata !16), !dbg !17
  call void @llvm.dbg.value(metadata !{i64 %lower_bound}, i64 0, metadata !18), !dbg !19
  call void @llvm.dbg.value(metadata !{i64 %upper_bound}, i64 0, metadata !20), !dbg !21
  %"0" = sub nsw i64 %upper_bound, %lower_bound, !dbg !22
  %"1" = add nsw i64 %"0", 1, !dbg !22
  call void @llvm.dbg.value(metadata !{i64 %"1"}, i64 0, metadata !23), !dbg !24
  %"2" = icmp sgt i64 %value, %upper_bound, !dbg !25
  br i1 %"2", label %wrap_around_bb1, label %wrap_around_bb2, !dbg !25

wrap_around_bb1:                                  ; preds = %wrap_around_bb0
  %"3" = sub nsw i64 %value, %upper_bound, !dbg !27
  %"4" = sub nsw i64 %"3", 1, !dbg !27
  %"5" = srem i64 %"4", %"1", !dbg !27
  %"6" = add nsw i64 %lower_bound, %"5", !dbg !27
  br label %wrap_around_bb4, !dbg !27

wrap_around_bb2:                                  ; preds = %wrap_around_bb0
  %"7" = icmp slt i64 %value, %lower_bound, !dbg !29
  br i1 %"7", label %wrap_around_bb3, label %wrap_around_bb4, !dbg !29

wrap_around_bb3:                                  ; preds = %wrap_around_bb2
  %"8" = sub nsw i64 %lower_bound, %value, !dbg !31
  %"9" = sub nsw i64 %"8", 1, !dbg !31
  %"10" = srem i64 %"9", %"1", !dbg !31
  %"11" = sub nsw i64 %upper_bound, %"10", !dbg !31
  br label %wrap_around_bb4, !dbg !31

wrap_around_bb4:                                  ; preds = %wrap_around_bb2, %wrap_around_bb3, %wrap_around_bb1
  %.0 = phi i64 [ %"6", %wrap_around_bb1 ], [ %"11", %wrap_around_bb3 ], [ %value, %wrap_around_bb2 ]
  ret i64 %.0, !dbg !33
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
main_bb5:
  call void @llvm.dbg.value(metadata !34, i64 0, metadata !35), !dbg !36
  call void @llvm.dbg.value(metadata !37, i64 0, metadata !38), !dbg !39
  call void @llvm.dbg.value(metadata !34, i64 0, metadata !40), !dbg !41
  call void @llvm.dbg.value(metadata !34, i64 0, metadata !42), !dbg !43
  call void @llvm.dbg.value(metadata !37, i64 0, metadata !44), !dbg !45
  %"12" = icmp slt i64 10, 0, !dbg !46
  %"13" = icmp slt i64 10, 0, !dbg !48
  %or.cond = or i1 %"12", %"13", !dbg !46
  %"14" = icmp sgt i64 10, 65534, !dbg !50
  %or.cond5 = or i1 %or.cond, %"14", !dbg !46
  %"15" = icmp sgt i64 10, 65534, !dbg !52
  %or.cond6 = or i1 %or.cond5, %"15", !dbg !46
  br i1 %or.cond6, label %main_bb17, label %main_wrap_around.exit2, !dbg !46

main_wrap_around.exit2:                           ; preds = %main_bb16, %main_bb15, %main_bb14, %main_bb5
  %z.0 = phi i64 [ 5, %main_bb5 ], [ %"45", %main_bb14 ], [ %"50", %main_bb16 ], [ %"40", %main_bb15 ]
  %"16" = icmp slt i64 0, 10, !dbg !54
  br i1 %"16", label %main_wrap_around.exit, label %main_bb17, !dbg !54

main_wrap_around.exit:                            ; preds = %main_bb9, %main_bb8, %main_bb7, %main_wrap_around.exit2
  %y.0 = phi i64 [ 0, %main_wrap_around.exit2 ], [ %"23", %main_bb7 ], [ %"28", %main_bb9 ], [ %"18", %main_bb8 ]
  %"17" = icmp slt i64 %y.0, 10, !dbg !58
  br i1 %"17", label %main_bb6, label %main_bb10, !dbg !58

main_bb6:                                         ; preds = %main_wrap_around.exit
  %"18" = add nsw i64 %y.0, 1, !dbg !63
  %"19" = icmp sgt i64 %"18", 2147483647, !dbg !64
  br i1 %"19", label %main_bb7, label %main_bb8, !dbg !64

main_bb7:                                         ; preds = %main_bb6
  %"20" = sub nsw i64 %"18", 2147483647, !dbg !65
  %"21" = sub nsw i64 %"20", 1, !dbg !65
  %"22" = srem i64 %"21", 4294967296, !dbg !65
  %"23" = add nsw i64 -2147483648, %"22", !dbg !65
  br label %main_wrap_around.exit, !dbg !65

main_bb8:                                         ; preds = %main_bb6
  %"24" = icmp slt i64 %"18", -2147483648, !dbg !66
  br i1 %"24", label %main_bb9, label %main_wrap_around.exit, !dbg !66

main_bb9:                                         ; preds = %main_bb8
  %"25" = sub nsw i64 -2147483648, %"18", !dbg !67
  %"26" = sub nsw i64 %"25", 1, !dbg !67
  %"27" = srem i64 %"26", 4294967296, !dbg !67
  %"28" = sub nsw i64 2147483647, %"27", !dbg !67
  br label %main_wrap_around.exit, !dbg !67

main_bb10:                                        ; preds = %main_wrap_around.exit
  %"29" = add nsw i64 %z.0, 1, !dbg !68
  call void @llvm.dbg.value(metadata !{i64 %"29"}, i64 0, metadata !69), !dbg !70
  call void @llvm.dbg.value(metadata !71, i64 0, metadata !72), !dbg !73
  call void @llvm.dbg.value(metadata !74, i64 0, metadata !75), !dbg !76
  call void @llvm.dbg.value(metadata !77, i64 0, metadata !78), !dbg !79
  %"30" = icmp sgt i64 %"29", 2147483647, !dbg !80
  br i1 %"30", label %main_bb11, label %main_bb12, !dbg !80

main_bb11:                                        ; preds = %main_bb10
  %"31" = sub nsw i64 %"29", 2147483647, !dbg !81
  %"32" = sub nsw i64 %"31", 1, !dbg !81
  %"33" = srem i64 %"32", 4294967296, !dbg !81
  %"34" = add nsw i64 -2147483648, %"33", !dbg !81
  br label %main_wrap_around.exit4, !dbg !81

main_bb12:                                        ; preds = %main_bb10
  %"35" = icmp slt i64 %"29", -2147483648, !dbg !82
  br i1 %"35", label %main_bb13, label %main_wrap_around.exit4, !dbg !82

main_bb13:                                        ; preds = %main_bb12
  %"36" = sub nsw i64 -2147483648, %"29", !dbg !83
  %"37" = sub nsw i64 %"36", 1, !dbg !83
  %"38" = srem i64 %"37", 4294967296, !dbg !83
  %"39" = sub nsw i64 2147483647, %"38", !dbg !83
  br label %main_wrap_around.exit4, !dbg !83

main_wrap_around.exit4:                           ; preds = %main_bb13, %main_bb12, %main_bb11
  %.0.i3 = phi i64 [ %"34", %main_bb11 ], [ %"39", %main_bb13 ], [ %"29", %main_bb12 ], !dbg !68
  call void @llvm.dbg.value(metadata !{i64 %.0.i3}, i64 0, metadata !42), !dbg !43
  %"40" = add nsw i64 %.0.i3, 1, !dbg !84
  call void @llvm.dbg.value(metadata !{i64 %"40"}, i64 0, metadata !85), !dbg !86
  call void @llvm.dbg.value(metadata !71, i64 0, metadata !87), !dbg !88
  call void @llvm.dbg.value(metadata !74, i64 0, metadata !89), !dbg !90
  call void @llvm.dbg.value(metadata !77, i64 0, metadata !91), !dbg !92
  %"41" = icmp sgt i64 %"40", 2147483647, !dbg !93
  br i1 %"41", label %main_bb14, label %main_bb15, !dbg !93

main_bb14:                                        ; preds = %main_wrap_around.exit4
  %"42" = sub nsw i64 %"40", 2147483647, !dbg !94
  %"43" = sub nsw i64 %"42", 1, !dbg !94
  %"44" = srem i64 %"43", 4294967296, !dbg !94
  %"45" = add nsw i64 -2147483648, %"44", !dbg !94
  br label %main_wrap_around.exit2, !dbg !94

main_bb15:                                        ; preds = %main_wrap_around.exit4
  %"46" = icmp slt i64 %"40", -2147483648, !dbg !95
  br i1 %"46", label %main_bb16, label %main_wrap_around.exit2, !dbg !95

main_bb16:                                        ; preds = %main_bb15
  %"47" = sub nsw i64 -2147483648, %"40", !dbg !96
  %"48" = sub nsw i64 %"47", 1, !dbg !96
  %"49" = srem i64 %"48", 4294967296, !dbg !96
  %"50" = sub nsw i64 2147483647, %"49", !dbg !96
  br label %main_wrap_around.exit2, !dbg !96

main_bb17:                                        ; preds = %main_wrap_around.exit2, %main_bb5
  ret i32 0, !dbg !97
}

declare i64 @__kittel_nondef.0()

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

declare i32 @__kittel_nondef.1()

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!13, !14}
!llvm.ident = !{!15}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [//FILES_DIR/SourceCode_SemanticAugmentor.c] [DW_LANG_C99]
!1 = metadata !{metadata !"FILES_DIR/SourceCode_SemanticAugmentor.c", metadata !"/"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"wrap_around", metadata !"wrap_around", metadata !"", i32 11, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i64, i64, i64)* @wrap_around, null, null, metadata !2, i32 11} ; [ DW_TAG_subprogram ] [line 11] [def] [wrap_around]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 21, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 22} ; [ DW_TAG_subprogram ] [line 21] [def] [scope 22] [main]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !12}
!12 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!13 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!14 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!15 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!16 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777227, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 11]
!17 = metadata !{i32 11, i32 33, metadata !4, null}
!18 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554443, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [lower_bound] [line 11]
!19 = metadata !{i32 11, i32 50, metadata !4, null}
!20 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331659, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [upper_bound] [line 11]
!21 = metadata !{i32 11, i32 73, metadata !4, null}
!22 = metadata !{i32 12, i32 5, metadata !4, null}
!23 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 12, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [range] [line 12]
!24 = metadata !{i32 12, i32 15, metadata !4, null}
!25 = metadata !{i32 13, i32 9, metadata !26, null}
!26 = metadata !{i32 786443, metadata !1, metadata !4, i32 13, i32 9, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!27 = metadata !{i32 14, i32 9, metadata !28, null}
!28 = metadata !{i32 786443, metadata !1, metadata !26, i32 13, i32 30, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!29 = metadata !{i32 16, i32 14, metadata !30, null}
!30 = metadata !{i32 786443, metadata !1, metadata !26, i32 16, i32 14, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!31 = metadata !{i32 17, i32 9, metadata !32, null}
!32 = metadata !{i32 786443, metadata !1, metadata !30, i32 16, i32 35, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!33 = metadata !{i32 20, i32 1, metadata !4, null}
!34 = metadata !{i64 5}
!35 = metadata !{i32 786688, metadata !9, metadata !"x", metadata !5, i32 23, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 23]
!36 = metadata !{i32 23, i32 15, metadata !9, null}
!37 = metadata !{i64 10}
!38 = metadata !{i32 786688, metadata !9, metadata !"mat_colSize", metadata !5, i32 24, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mat_colSize] [line 24]
!39 = metadata !{i32 24, i32 15, metadata !9, null}
!40 = metadata !{i32 786688, metadata !9, metadata !"y", metadata !5, i32 25, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [y] [line 25]
!41 = metadata !{i32 25, i32 15, metadata !9, null}
!42 = metadata !{i32 786688, metadata !9, metadata !"z", metadata !5, i32 26, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [z] [line 26]
!43 = metadata !{i32 26, i32 15, metadata !9, null}
!44 = metadata !{i32 786688, metadata !9, metadata !"mat_rowSize", metadata !5, i32 27, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mat_rowSize] [line 27]
!45 = metadata !{i32 27, i32 15, metadata !9, null}
!46 = metadata !{i32 28, i32 9, metadata !47, null}
!47 = metadata !{i32 786443, metadata !1, metadata !9, i32 28, i32 9, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!48 = metadata !{i32 28, i32 9, metadata !49, null}
!49 = metadata !{i32 786443, metadata !1, metadata !47, i32 28, i32 9, i32 1, i32 10} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!50 = metadata !{i32 28, i32 9, metadata !51, null}
!51 = metadata !{i32 786443, metadata !1, metadata !47, i32 28, i32 9, i32 2, i32 11} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!52 = metadata !{i32 28, i32 9, metadata !53, null}
!53 = metadata !{i32 786443, metadata !1, metadata !47, i32 28, i32 9, i32 3, i32 12} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!54 = metadata !{i32 32, i32 10, metadata !55, null}
!55 = metadata !{i32 786443, metadata !1, metadata !56, i32 32, i32 10, i32 2, i32 16} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!56 = metadata !{i32 786443, metadata !1, metadata !57, i32 32, i32 10, i32 1, i32 13} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!57 = metadata !{i32 786443, metadata !1, metadata !9, i32 32, i32 5, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!58 = metadata !{i32 34, i32 14, metadata !59, null}
!59 = metadata !{i32 786443, metadata !1, metadata !60, i32 34, i32 14, i32 2, i32 15} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!60 = metadata !{i32 786443, metadata !1, metadata !61, i32 34, i32 14, i32 1, i32 14} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!61 = metadata !{i32 786443, metadata !1, metadata !62, i32 34, i32 9, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!62 = metadata !{i32 786443, metadata !1, metadata !57, i32 33, i32 5, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!63 = metadata !{i32 34, i32 44, metadata !61, null}
!64 = metadata !{i32 13, i32 9, metadata !26, metadata !63}
!65 = metadata !{i32 14, i32 9, metadata !28, metadata !63}
!66 = metadata !{i32 16, i32 14, metadata !30, metadata !63}
!67 = metadata !{i32 17, i32 9, metadata !32, metadata !63}
!68 = metadata !{i32 38, i32 14, metadata !62, null}
!69 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777227, metadata !8, i32 0, metadata !68} ; [ DW_TAG_arg_variable ] [value] [line 11]
!70 = metadata !{i32 11, i32 33, metadata !4, metadata !68}
!71 = metadata !{i64 -2147483648}
!72 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554443, metadata !8, i32 0, metadata !68} ; [ DW_TAG_arg_variable ] [lower_bound] [line 11]
!73 = metadata !{i32 11, i32 50, metadata !4, metadata !68}
!74 = metadata !{i64 2147483647}
!75 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331659, metadata !8, i32 0, metadata !68} ; [ DW_TAG_arg_variable ] [upper_bound] [line 11]
!76 = metadata !{i32 11, i32 73, metadata !4, metadata !68}
!77 = metadata !{i64 4294967296}
!78 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 12, metadata !8, i32 0, metadata !68} ; [ DW_TAG_auto_variable ] [range] [line 12]
!79 = metadata !{i32 12, i32 15, metadata !4, metadata !68}
!80 = metadata !{i32 13, i32 9, metadata !26, metadata !68}
!81 = metadata !{i32 14, i32 9, metadata !28, metadata !68}
!82 = metadata !{i32 16, i32 14, metadata !30, metadata !68}
!83 = metadata !{i32 17, i32 9, metadata !32, metadata !68}
!84 = metadata !{i32 32, i32 41, metadata !57, null}
!85 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777227, metadata !8, i32 0, metadata !84} ; [ DW_TAG_arg_variable ] [value] [line 11]
!86 = metadata !{i32 11, i32 33, metadata !4, metadata !84}
!87 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554443, metadata !8, i32 0, metadata !84} ; [ DW_TAG_arg_variable ] [lower_bound] [line 11]
!88 = metadata !{i32 11, i32 50, metadata !4, metadata !84}
!89 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331659, metadata !8, i32 0, metadata !84} ; [ DW_TAG_arg_variable ] [upper_bound] [line 11]
!90 = metadata !{i32 11, i32 73, metadata !4, metadata !84}
!91 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 12, metadata !8, i32 0, metadata !84} ; [ DW_TAG_auto_variable ] [range] [line 12]
!92 = metadata !{i32 12, i32 15, metadata !4, metadata !84}
!93 = metadata !{i32 13, i32 9, metadata !26, metadata !84}
!94 = metadata !{i32 14, i32 9, metadata !28, metadata !84}
!95 = metadata !{i32 16, i32 14, metadata !30, metadata !84}
!96 = metadata !{i32 17, i32 9, metadata !32, metadata !84}
!97 = metadata !{i32 41, i32 1, metadata !9, null}

