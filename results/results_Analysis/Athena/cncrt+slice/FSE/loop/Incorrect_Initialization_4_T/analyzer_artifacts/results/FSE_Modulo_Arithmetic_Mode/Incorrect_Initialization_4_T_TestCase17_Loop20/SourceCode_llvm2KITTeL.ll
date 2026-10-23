; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define i64 @wrap_around(i64 %value, i64 %lower_bound, i64 %upper_bound) #0 {
wrap_around_bb0:
  call void @llvm.dbg.value(metadata !{i64 %value}, i64 0, metadata !15), !dbg !16
  call void @llvm.dbg.value(metadata !{i64 %lower_bound}, i64 0, metadata !17), !dbg !18
  call void @llvm.dbg.value(metadata !{i64 %upper_bound}, i64 0, metadata !19), !dbg !20
  %"0" = sub nsw i64 %upper_bound, %lower_bound, !dbg !21
  %"1" = add nsw i64 %"0", 1, !dbg !21
  call void @llvm.dbg.value(metadata !{i64 %"1"}, i64 0, metadata !22), !dbg !23
  %"2" = icmp sgt i64 %value, %upper_bound, !dbg !24
  br i1 %"2", label %wrap_around_bb1, label %wrap_around_bb2, !dbg !24

wrap_around_bb1:                                  ; preds = %wrap_around_bb0
  %"3" = sub nsw i64 %value, %upper_bound, !dbg !26
  %"4" = sub nsw i64 %"3", 1, !dbg !26
  %"5" = srem i64 %"4", %"1", !dbg !26
  %"6" = add nsw i64 %lower_bound, %"5", !dbg !26
  br label %wrap_around_bb4, !dbg !26

wrap_around_bb2:                                  ; preds = %wrap_around_bb0
  %"7" = icmp slt i64 %value, %lower_bound, !dbg !28
  br i1 %"7", label %wrap_around_bb3, label %wrap_around_bb4, !dbg !28

wrap_around_bb3:                                  ; preds = %wrap_around_bb2
  %"8" = sub nsw i64 %lower_bound, %value, !dbg !30
  %"9" = sub nsw i64 %"8", 1, !dbg !30
  %"10" = srem i64 %"9", %"1", !dbg !30
  %"11" = sub nsw i64 %upper_bound, %"10", !dbg !30
  br label %wrap_around_bb4, !dbg !30

wrap_around_bb4:                                  ; preds = %wrap_around_bb2, %wrap_around_bb3, %wrap_around_bb1
  %.0 = phi i64 [ %"6", %wrap_around_bb1 ], [ %"11", %wrap_around_bb3 ], [ %value, %wrap_around_bb2 ]
  ret i64 %.0, !dbg !32
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb5:
  call void @llvm.dbg.value(metadata !33, i64 0, metadata !34), !dbg !35
  call void @llvm.dbg.value(metadata !36, i64 0, metadata !37), !dbg !38
  call void @llvm.dbg.value(metadata !39, i64 0, metadata !40), !dbg !41
  %"12" = icmp slt i64 12, 0, !dbg !42
  %"13" = icmp sle i64 13, 0, !dbg !44
  %or.cond = or i1 %"12", %"13", !dbg !42
  %"14" = icmp sle i64 6, 0, !dbg !46
  %or.cond5 = or i1 %or.cond, %"14", !dbg !42
  %"15" = icmp sgt i64 6, 13, !dbg !48
  %or.cond6 = or i1 %or.cond5, %"15", !dbg !42
  %"16" = icmp sgt i64 13, 65534, !dbg !50
  %or.cond7 = or i1 %or.cond6, %"16", !dbg !42
  br i1 %or.cond7, label %main_bb18, label %main_bb6, !dbg !42

main_bb6:                                         ; preds = %main_bb5
  %"17" = srem i64 12, 13, !dbg !52
  call void @llvm.dbg.value(metadata !{i64 %"17"}, i64 0, metadata !53), !dbg !54
  call void @llvm.dbg.value(metadata !55, i64 0, metadata !56), !dbg !57
  call void @llvm.dbg.value(metadata !58, i64 0, metadata !59), !dbg !60
  call void @llvm.dbg.value(metadata !61, i64 0, metadata !62), !dbg !63
  %"18" = icmp sgt i64 %"17", 2147483647, !dbg !64
  br i1 %"18", label %main_bb7, label %main_bb8, !dbg !64

main_bb7:                                         ; preds = %main_bb6
  %"19" = sub nsw i64 %"17", 2147483647, !dbg !65
  %"20" = sub nsw i64 %"19", 1, !dbg !65
  %"21" = srem i64 %"20", 4294967296, !dbg !65
  %"22" = add nsw i64 -2147483648, %"21", !dbg !65
  br label %main_wrap_around.exit, !dbg !65

main_bb8:                                         ; preds = %main_bb6
  %"23" = icmp slt i64 %"17", -2147483648, !dbg !66
  br i1 %"23", label %main_bb9, label %main_wrap_around.exit, !dbg !66

main_bb9:                                         ; preds = %main_bb8
  %"24" = sub nsw i64 -2147483648, %"17", !dbg !67
  %"25" = sub nsw i64 %"24", 1, !dbg !67
  %"26" = srem i64 %"25", 4294967296, !dbg !67
  %"27" = sub nsw i64 2147483647, %"26", !dbg !67
  br label %main_wrap_around.exit, !dbg !67

main_wrap_around.exit:                            ; preds = %main_bb7, %main_bb8, %main_bb9
  %.0.i = phi i64 [ %"22", %main_bb7 ], [ %"27", %main_bb9 ], [ %"17", %main_bb8 ], !dbg !52
  call void @llvm.dbg.value(metadata !{i64 %.0.i}, i64 0, metadata !68), !dbg !69
  call void @llvm.dbg.value(metadata !70, i64 0, metadata !71), !dbg !72
  call void @llvm.dbg.value(metadata !{i64 %"42"}, i64 0, metadata !73), !dbg !76
  call void @llvm.dbg.value(metadata !55, i64 0, metadata !77), !dbg !78
  call void @llvm.dbg.value(metadata !58, i64 0, metadata !79), !dbg !80
  call void @llvm.dbg.value(metadata !61, i64 0, metadata !81), !dbg !82
  %"28" = srem i64 12, 6, !dbg !83
  call void @llvm.dbg.value(metadata !{i64 %"31"}, i64 0, metadata !86), !dbg !87
  call void @llvm.dbg.value(metadata !55, i64 0, metadata !88), !dbg !89
  call void @llvm.dbg.value(metadata !58, i64 0, metadata !90), !dbg !91
  call void @llvm.dbg.value(metadata !61, i64 0, metadata !92), !dbg !93
  br label %main_wrap_around.exit2, !dbg !94

main_wrap_around.exit2:                           ; preds = %main_bb17, %main_bb16, %main_bb15, %main_wrap_around.exit
  %r.0 = phi i64 [ 0, %main_wrap_around.exit ], [ %r.1, %main_bb15 ], [ %r.1, %main_bb16 ], [ %r.1, %main_bb17 ]
  %i.0 = phi i64 [ %.0.i, %main_wrap_around.exit ], [ %"47", %main_bb15 ], [ %"52", %main_bb17 ], [ %"42", %main_bb16 ]
  %"29" = icmp slt i64 %i.0, 13, !dbg !95
  br i1 %"29", label %main_bb10, label %main_bb18, !dbg !95

main_bb10:                                        ; preds = %main_wrap_around.exit2
  %"30" = icmp ne i64 %r.0, 0, !dbg !97
  br i1 %"30", label %main_wrap_around.exit4, label %main_bb11, !dbg !97

main_bb11:                                        ; preds = %main_bb10
  %"31" = add nsw i64 %"28", 1, !dbg !83
  %"32" = icmp sgt i64 %"31", 2147483647, !dbg !98
  br i1 %"32", label %main_bb12, label %main_bb13, !dbg !98

main_bb12:                                        ; preds = %main_bb11
  %"33" = sub nsw i64 %"31", 2147483647, !dbg !99
  %"34" = sub nsw i64 %"33", 1, !dbg !99
  %"35" = srem i64 %"34", 4294967296, !dbg !99
  %"36" = add nsw i64 -2147483648, %"35", !dbg !99
  br label %main_wrap_around.exit4, !dbg !99

main_bb13:                                        ; preds = %main_bb11
  %"37" = icmp slt i64 %"31", -2147483648, !dbg !100
  br i1 %"37", label %main_bb14, label %main_wrap_around.exit4, !dbg !100

main_bb14:                                        ; preds = %main_bb13
  %"38" = sub nsw i64 -2147483648, %"31", !dbg !101
  %"39" = sub nsw i64 %"38", 1, !dbg !101
  %"40" = srem i64 %"39", 4294967296, !dbg !101
  %"41" = sub nsw i64 2147483647, %"40", !dbg !101
  br label %main_wrap_around.exit4, !dbg !101

main_wrap_around.exit4:                           ; preds = %main_bb14, %main_bb13, %main_bb12, %main_bb10
  %r.1 = phi i64 [ %r.0, %main_bb10 ], [ %"36", %main_bb12 ], [ %"41", %main_bb14 ], [ %"31", %main_bb13 ]
  %"42" = add nsw i64 %i.0, %r.1, !dbg !74
  %"43" = icmp sgt i64 %"42", 2147483647, !dbg !102
  br i1 %"43", label %main_bb15, label %main_bb16, !dbg !102

main_bb15:                                        ; preds = %main_wrap_around.exit4
  %"44" = sub nsw i64 %"42", 2147483647, !dbg !103
  %"45" = sub nsw i64 %"44", 1, !dbg !103
  %"46" = srem i64 %"45", 4294967296, !dbg !103
  %"47" = add nsw i64 -2147483648, %"46", !dbg !103
  br label %main_wrap_around.exit2, !dbg !103

main_bb16:                                        ; preds = %main_wrap_around.exit4
  %"48" = icmp slt i64 %"42", -2147483648, !dbg !104
  br i1 %"48", label %main_bb17, label %main_wrap_around.exit2, !dbg !104

main_bb17:                                        ; preds = %main_bb16
  %"49" = sub nsw i64 -2147483648, %"42", !dbg !105
  %"50" = sub nsw i64 %"49", 1, !dbg !105
  %"51" = srem i64 %"50", 4294967296, !dbg !105
  %"52" = sub nsw i64 2147483647, %"51", !dbg !105
  br label %main_wrap_around.exit2, !dbg !105

main_bb18:                                        ; preds = %main_wrap_around.exit2, %main_bb5
  ret void, !dbg !106
}

declare i64 @__kittel_nondef.0()

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13}
!llvm.ident = !{!14}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [//FILES_DIR/SourceCode_SemanticAugmentor.c] [DW_LANG_C99]
!1 = metadata !{metadata !"FILES_DIR/SourceCode_SemanticAugmentor.c", metadata !"/"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"wrap_around", metadata !"wrap_around", metadata !"", i32 7, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i64, i64, i64)* @wrap_around, null, null, metadata !2, i32 7} ; [ DW_TAG_subprogram ] [line 7] [def] [wrap_around]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 17, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @main, null, null, metadata !2, i32 18} ; [ DW_TAG_subprogram ] [line 17] [def] [scope 18] [main]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{null}
!12 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!13 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!14 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!15 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777223, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 7]
!16 = metadata !{i32 7, i32 33, metadata !4, null}
!17 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554439, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [lower_bound] [line 7]
!18 = metadata !{i32 7, i32 50, metadata !4, null}
!19 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331655, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [upper_bound] [line 7]
!20 = metadata !{i32 7, i32 73, metadata !4, null}
!21 = metadata !{i32 8, i32 5, metadata !4, null} ; [ DW_TAG_imported_declaration ]
!22 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 8, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [range] [line 8]
!23 = metadata !{i32 8, i32 15, metadata !4, null} ; [ DW_TAG_imported_declaration ]
!24 = metadata !{i32 9, i32 9, metadata !25, null}
!25 = metadata !{i32 786443, metadata !1, metadata !4, i32 9, i32 9, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!26 = metadata !{i32 10, i32 9, metadata !27, null}
!27 = metadata !{i32 786443, metadata !1, metadata !25, i32 9, i32 30, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!28 = metadata !{i32 12, i32 14, metadata !29, null}
!29 = metadata !{i32 786443, metadata !1, metadata !25, i32 12, i32 14, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!30 = metadata !{i32 13, i32 9, metadata !31, null}
!31 = metadata !{i32 786443, metadata !1, metadata !29, i32 12, i32 35, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!32 = metadata !{i32 16, i32 1, metadata !4, null}
!33 = metadata !{i64 12}
!34 = metadata !{i32 786688, metadata !9, metadata !"h", metadata !5, i32 19, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [h] [line 19]
!35 = metadata !{i32 19, i32 13, metadata !9, null}
!36 = metadata !{i64 13}
!37 = metadata !{i32 786688, metadata !9, metadata !"hash", metadata !5, i32 20, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [hash] [line 20]
!38 = metadata !{i32 20, i32 13, metadata !9, null}
!39 = metadata !{i64 6}
!40 = metadata !{i32 786688, metadata !9, metadata !"rehash", metadata !5, i32 21, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rehash] [line 21]
!41 = metadata !{i32 21, i32 13, metadata !9, null}
!42 = metadata !{i32 23, i32 7, metadata !43, null}
!43 = metadata !{i32 786443, metadata !1, metadata !9, i32 23, i32 7, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!44 = metadata !{i32 28, i32 9, metadata !45, null}
!45 = metadata !{i32 786443, metadata !1, metadata !43, i32 28, i32 9, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!46 = metadata !{i32 33, i32 11, metadata !47, null}
!47 = metadata !{i32 786443, metadata !1, metadata !45, i32 33, i32 11, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!48 = metadata !{i32 38, i32 13, metadata !49, null}
!49 = metadata !{i32 786443, metadata !1, metadata !47, i32 38, i32 13, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!50 = metadata !{i32 43, i32 15, metadata !51, null}
!51 = metadata !{i32 786443, metadata !1, metadata !49, i32 43, i32 15, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!52 = metadata !{i32 48, i32 17, metadata !9, null}
!53 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777223, metadata !8, i32 0, metadata !52} ; [ DW_TAG_arg_variable ] [value] [line 7]
!54 = metadata !{i32 7, i32 33, metadata !4, metadata !52}
!55 = metadata !{i64 -2147483648}
!56 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554439, metadata !8, i32 0, metadata !52} ; [ DW_TAG_arg_variable ] [lower_bound] [line 7]
!57 = metadata !{i32 7, i32 50, metadata !4, metadata !52}
!58 = metadata !{i64 2147483647}
!59 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331655, metadata !8, i32 0, metadata !52} ; [ DW_TAG_arg_variable ] [upper_bound] [line 7]
!60 = metadata !{i32 7, i32 73, metadata !4, metadata !52}
!61 = metadata !{i64 4294967296}
!62 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 8, metadata !8, i32 0, metadata !52} ; [ DW_TAG_auto_variable ] [range] [line 8]
!63 = metadata !{i32 8, i32 15, metadata !4, metadata !52} ; [ DW_TAG_imported_declaration ]
!64 = metadata !{i32 9, i32 9, metadata !25, metadata !52}
!65 = metadata !{i32 10, i32 9, metadata !27, metadata !52}
!66 = metadata !{i32 12, i32 14, metadata !29, metadata !52}
!67 = metadata !{i32 13, i32 9, metadata !31, metadata !52}
!68 = metadata !{i32 786688, metadata !9, metadata !"i", metadata !5, i32 48, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 48]
!69 = metadata !{i32 48, i32 13, metadata !9, null}
!70 = metadata !{i64 0}
!71 = metadata !{i32 786688, metadata !9, metadata !"r", metadata !5, i32 49, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 49]
!72 = metadata !{i32 49, i32 13, metadata !9, null}
!73 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777223, metadata !8, i32 0, metadata !74} ; [ DW_TAG_arg_variable ] [value] [line 7]
!74 = metadata !{i32 56, i32 9, metadata !75, null}
!75 = metadata !{i32 786443, metadata !1, metadata !9, i32 51, i32 20, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!76 = metadata !{i32 7, i32 33, metadata !4, metadata !74}
!77 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554439, metadata !8, i32 0, metadata !74} ; [ DW_TAG_arg_variable ] [lower_bound] [line 7]
!78 = metadata !{i32 7, i32 50, metadata !4, metadata !74}
!79 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331655, metadata !8, i32 0, metadata !74} ; [ DW_TAG_arg_variable ] [upper_bound] [line 7]
!80 = metadata !{i32 7, i32 73, metadata !4, metadata !74}
!81 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 8, metadata !8, i32 0, metadata !74} ; [ DW_TAG_auto_variable ] [range] [line 8]
!82 = metadata !{i32 8, i32 15, metadata !4, metadata !74} ; [ DW_TAG_imported_declaration ]
!83 = metadata !{i32 54, i32 11, metadata !84, null}
!84 = metadata !{i32 786443, metadata !1, metadata !85, i32 53, i32 1, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!85 = metadata !{i32 786443, metadata !1, metadata !75, i32 52, i32 9, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!86 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777223, metadata !8, i32 0, metadata !83} ; [ DW_TAG_arg_variable ] [value] [line 7]
!87 = metadata !{i32 7, i32 33, metadata !4, metadata !83}
!88 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554439, metadata !8, i32 0, metadata !83} ; [ DW_TAG_arg_variable ] [lower_bound] [line 7]
!89 = metadata !{i32 7, i32 50, metadata !4, metadata !83}
!90 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331655, metadata !8, i32 0, metadata !83} ; [ DW_TAG_arg_variable ] [upper_bound] [line 7]
!91 = metadata !{i32 7, i32 73, metadata !4, metadata !83}
!92 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 8, metadata !8, i32 0, metadata !83} ; [ DW_TAG_auto_variable ] [range] [line 8]
!93 = metadata !{i32 8, i32 15, metadata !4, metadata !83} ; [ DW_TAG_imported_declaration ]
!94 = metadata !{i32 51, i32 3, metadata !9, null}
!95 = metadata !{i32 51, i32 3, metadata !96, null}
!96 = metadata !{i32 786443, metadata !1, metadata !9, i32 51, i32 3, i32 1, i32 17} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!97 = metadata !{i32 52, i32 9, metadata !85, null}
!98 = metadata !{i32 9, i32 9, metadata !25, metadata !83}
!99 = metadata !{i32 10, i32 9, metadata !27, metadata !83}
!100 = metadata !{i32 12, i32 14, metadata !29, metadata !83}
!101 = metadata !{i32 13, i32 9, metadata !31, metadata !83}
!102 = metadata !{i32 9, i32 9, metadata !25, metadata !74}
!103 = metadata !{i32 10, i32 9, metadata !27, metadata !74}
!104 = metadata !{i32 12, i32 14, metadata !29, metadata !74}
!105 = metadata !{i32 13, i32 9, metadata !31, metadata !74}
!106 = metadata !{i32 60, i32 3, metadata !9, null}

