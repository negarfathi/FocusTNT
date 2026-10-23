; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@"'__fc_errno" = common global i64 0, align 8

; Function Attrs: nounwind uwtable
define i64 @wrap_around(i64 %value, i64 %lower_bound, i64 %upper_bound) #0 {
wrap_around_bb0:
  call void @llvm.dbg.value(metadata !{i64 %value}, i64 0, metadata !20), !dbg !21
  call void @llvm.dbg.value(metadata !{i64 %lower_bound}, i64 0, metadata !22), !dbg !23
  call void @llvm.dbg.value(metadata !{i64 %upper_bound}, i64 0, metadata !24), !dbg !25
  %"0" = sub nsw i64 %upper_bound, %lower_bound, !dbg !26
  %"1" = add nsw i64 %"0", 1, !dbg !26
  call void @llvm.dbg.value(metadata !{i64 %"1"}, i64 0, metadata !27), !dbg !28
  %"2" = icmp sgt i64 %value, %upper_bound, !dbg !29
  br i1 %"2", label %wrap_around_bb1, label %wrap_around_bb2, !dbg !29

wrap_around_bb1:                                  ; preds = %wrap_around_bb0
  %"3" = sub nsw i64 %value, %upper_bound, !dbg !31
  %"4" = sub nsw i64 %"3", 1, !dbg !31
  %"5" = srem i64 %"4", %"1", !dbg !31
  %"6" = add nsw i64 %lower_bound, %"5", !dbg !31
  br label %wrap_around_bb4, !dbg !31

wrap_around_bb2:                                  ; preds = %wrap_around_bb0
  %"7" = icmp slt i64 %value, %lower_bound, !dbg !33
  br i1 %"7", label %wrap_around_bb3, label %wrap_around_bb4, !dbg !33

wrap_around_bb3:                                  ; preds = %wrap_around_bb2
  %"8" = sub nsw i64 %lower_bound, %value, !dbg !35
  %"9" = sub nsw i64 %"8", 1, !dbg !35
  %"10" = srem i64 %"9", %"1", !dbg !35
  %"11" = sub nsw i64 %upper_bound, %"10", !dbg !35
  br label %wrap_around_bb4, !dbg !35

wrap_around_bb4:                                  ; preds = %wrap_around_bb2, %wrap_around_bb3, %wrap_around_bb1
  %.0 = phi i64 [ %"6", %wrap_around_bb1 ], [ %"11", %wrap_around_bb3 ], [ %value, %wrap_around_bb2 ]
  ret i64 %.0, !dbg !37
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i64 @waitpid_slice_1() #0 {
waitpid_slice_1_bb5:
  %"12" = call i64 @__VERIFIER_nondet_int(), !dbg !38
  call void @llvm.dbg.value(metadata !{i64 %"12"}, i64 0, metadata !39), !dbg !40
  %"13" = icmp slt i64 %"12", 0, !dbg !41
  br i1 %"13", label %waitpid_slice_1_bb6, label %waitpid_slice_1_bb11, !dbg !41

waitpid_slice_1_bb6:                              ; preds = %waitpid_slice_1_bb5
  %"14" = call i64 @__VERIFIER_nondet_int(), !dbg !43
  %"15" = icmp ne i64 %"14", 0, !dbg !43
  br i1 %"15", label %waitpid_slice_1_bb7, label %waitpid_slice_1_bb10, !dbg !43

waitpid_slice_1_bb7:                              ; preds = %waitpid_slice_1_bb6
  %"16" = load i64* @"'__fc_errno", align 8, !dbg !45
  %"17" = icmp ne i64 %"16", 1, !dbg !45
  br i1 %"17", label %waitpid_slice_1_bb8, label %waitpid_slice_1_bb9, !dbg !45

waitpid_slice_1_bb8:                              ; preds = %waitpid_slice_1_bb7
  store i64 1, i64* @"'__fc_errno", align 8, !dbg !48
  br label %waitpid_slice_1_bb11, !dbg !50

waitpid_slice_1_bb9:                              ; preds = %waitpid_slice_1_bb7
  store i64 2, i64* @"'__fc_errno", align 8, !dbg !51
  br label %waitpid_slice_1_bb11

waitpid_slice_1_bb10:                             ; preds = %waitpid_slice_1_bb6
  store i64 2, i64* @"'__fc_errno", align 8, !dbg !52
  br label %waitpid_slice_1_bb11

waitpid_slice_1_bb11:                             ; preds = %waitpid_slice_1_bb5, %waitpid_slice_1_bb10, %waitpid_slice_1_bb9, %waitpid_slice_1_bb8
  ret i64 %"12", !dbg !53
}

declare i64 @__VERIFIER_nondet_int() #2

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb12:
  %"18" = call i64 @__VERIFIER_nondet_int() #3, !dbg !54
  call void @llvm.dbg.value(metadata !{i64 %"18"}, i64 0, metadata !56) #3, !dbg !57
  %"19" = icmp slt i64 %"18", 0, !dbg !58
  br i1 %"19", label %main_bb13, label %main_waitpid_slice_1.exit, !dbg !58

main_bb13:                                        ; preds = %main_bb12
  %"20" = call i64 @__VERIFIER_nondet_int() #3, !dbg !59
  %"21" = icmp ne i64 %"20", 0, !dbg !59
  br i1 %"21", label %main_bb14, label %main_bb17, !dbg !59

main_bb14:                                        ; preds = %main_bb13
  %"22" = load i64* @"'__fc_errno", align 8, !dbg !60
  %"23" = icmp ne i64 %"22", 1, !dbg !60
  br i1 %"23", label %main_bb15, label %main_bb16, !dbg !60

main_bb15:                                        ; preds = %main_bb14
  store i64 1, i64* @"'__fc_errno", align 8, !dbg !61
  br label %main_waitpid_slice_1.exit, !dbg !62

main_bb16:                                        ; preds = %main_bb14
  store i64 2, i64* @"'__fc_errno", align 8, !dbg !63
  br label %main_waitpid_slice_1.exit, !dbg !55

main_bb17:                                        ; preds = %main_bb13
  store i64 2, i64* @"'__fc_errno", align 8, !dbg !64
  br label %main_waitpid_slice_1.exit, !dbg !55

main_waitpid_slice_1.exit:                        ; preds = %main_bb12, %main_bb15, %main_bb16, %main_bb17
  call void @llvm.dbg.value(metadata !{i64 %"18"}, i64 0, metadata !65), !dbg !66
  %"24" = icmp eq i64 %"18", 0, !dbg !67
  br i1 %"24", label %main_bb18, label %main_bb24, !dbg !67

main_bb18:                                        ; preds = %main_waitpid_slice_1.exit1, %main_waitpid_slice_1.exit
  %"25" = call i64 @__VERIFIER_nondet_int() #3, !dbg !69
  %"26" = icmp slt i64 %"25", 0, !dbg !73
  br i1 %"26", label %main_bb19, label %main_waitpid_slice_1.exit1, !dbg !73

main_bb19:                                        ; preds = %main_bb18
  %"27" = call i64 @__VERIFIER_nondet_int() #3, !dbg !74
  %"28" = icmp ne i64 %"27", 0, !dbg !74
  br i1 %"28", label %main_bb20, label %main_bb23, !dbg !74

main_bb20:                                        ; preds = %main_bb19
  %"29" = load i64* @"'__fc_errno", align 8, !dbg !75
  %"30" = icmp ne i64 %"29", 1, !dbg !75
  br i1 %"30", label %main_bb21, label %main_bb22, !dbg !75

main_bb21:                                        ; preds = %main_bb20
  store i64 1, i64* @"'__fc_errno", align 8, !dbg !76
  br label %main_waitpid_slice_1.exit1, !dbg !77

main_bb22:                                        ; preds = %main_bb20
  store i64 2, i64* @"'__fc_errno", align 8, !dbg !78
  br label %main_waitpid_slice_1.exit1, !dbg !70

main_bb23:                                        ; preds = %main_bb19
  store i64 2, i64* @"'__fc_errno", align 8, !dbg !79
  br label %main_waitpid_slice_1.exit1, !dbg !70

main_waitpid_slice_1.exit1:                       ; preds = %main_bb18, %main_bb21, %main_bb22, %main_bb23
  %"31" = icmp slt i64 %"25", 0, !dbg !80
  %"32" = load i64* @"'__fc_errno", align 8
  %"33" = icmp eq i64 %"32", 1, !dbg !82
  %or.cond = and i1 %"31", %"33", !dbg !80
  br i1 %or.cond, label %main_bb18, label %main_bb24, !dbg !80

main_bb24:                                        ; preds = %main_waitpid_slice_1.exit1, %main_waitpid_slice_1.exit
  ret void, !dbg !85
}

declare i64 @__kittel_nondef.0()

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!17, !18}
!llvm.ident = !{!19}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !15, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [//FILES_DIR/SourceCode_SemanticAugmentor.c] [DW_LANG_C99]
!1 = metadata !{metadata !"FILES_DIR/SourceCode_SemanticAugmentor.c", metadata !"/"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9, metadata !12}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"wrap_around", metadata !"wrap_around", metadata !"", i32 8, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i64, i64, i64)* @wrap_around, null, null, metadata !2, i32 8} ; [ DW_TAG_subprogram ] [line 8] [def] [wrap_around]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"waitpid_slice_1", metadata !"waitpid_slice_1", metadata !"", i32 18, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 ()* @waitpid_slice_1, null, null, metadata !2, i32 19} ; [ DW_TAG_subprogram ] [line 18] [def] [scope 19] [waitpid_slice_1]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !8}
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 43, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @main, null, null, metadata !2, i32 44} ; [ DW_TAG_subprogram ] [line 43] [def] [scope 44] [main]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{null}
!15 = metadata !{metadata !16}
!16 = metadata !{i32 786484, i32 0, null, metadata !"__fc_errno", metadata !"__fc_errno", metadata !"", metadata !5, i32 7, metadata !8, i32 0, i32 1, i64* @"'__fc_errno", null} ; [ DW_TAG_variable ] [__fc_errno] [line 7] [def]
!17 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!18 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!19 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!20 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777224, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 8]
!21 = metadata !{i32 8, i32 33, metadata !4, null} ; [ DW_TAG_imported_declaration ]
!22 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554440, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [lower_bound] [line 8]
!23 = metadata !{i32 8, i32 50, metadata !4, null} ; [ DW_TAG_imported_declaration ]
!24 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331656, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [upper_bound] [line 8]
!25 = metadata !{i32 8, i32 73, metadata !4, null} ; [ DW_TAG_imported_declaration ]
!26 = metadata !{i32 9, i32 5, metadata !4, null}
!27 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 9, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [range] [line 9]
!28 = metadata !{i32 9, i32 15, metadata !4, null}
!29 = metadata !{i32 10, i32 9, metadata !30, null}
!30 = metadata !{i32 786443, metadata !1, metadata !4, i32 10, i32 9, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!31 = metadata !{i32 11, i32 9, metadata !32, null}
!32 = metadata !{i32 786443, metadata !1, metadata !30, i32 10, i32 30, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!33 = metadata !{i32 13, i32 14, metadata !34, null}
!34 = metadata !{i32 786443, metadata !1, metadata !30, i32 13, i32 14, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!35 = metadata !{i32 14, i32 9, metadata !36, null}
!36 = metadata !{i32 786443, metadata !1, metadata !34, i32 13, i32 35, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!37 = metadata !{i32 17, i32 1, metadata !4, null}
!38 = metadata !{i32 21, i32 19, metadata !9, null}
!39 = metadata !{i32 786688, metadata !9, metadata !"num", metadata !5, i32 21, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [num] [line 21]
!40 = metadata !{i32 21, i32 13, metadata !9, null}
!41 = metadata !{i32 22, i32 7, metadata !42, null}
!42 = metadata !{i32 786443, metadata !1, metadata !9, i32 22, i32 7, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!43 = metadata !{i32 26, i32 7, metadata !44, null}
!44 = metadata !{i32 786443, metadata !1, metadata !9, i32 26, i32 7, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!45 = metadata !{i32 27, i32 9, metadata !46, null}
!46 = metadata !{i32 786443, metadata !1, metadata !47, i32 27, i32 9, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!47 = metadata !{i32 786443, metadata !1, metadata !44, i32 26, i32 32, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!48 = metadata !{i32 29, i32 7, metadata !49, null}
!49 = metadata !{i32 786443, metadata !1, metadata !46, i32 28, i32 1, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!50 = metadata !{i32 30, i32 1, metadata !49, null}
!51 = metadata !{i32 32, i32 7, metadata !46, null}
!52 = metadata !{i32 35, i32 5, metadata !44, null}
!53 = metadata !{i32 40, i32 17, metadata !9, null}
!54 = metadata !{i32 21, i32 19, metadata !9, metadata !55}
!55 = metadata !{i32 45, i32 19, metadata !12, null}
!56 = metadata !{i32 786688, metadata !9, metadata !"num", metadata !5, i32 21, metadata !8, i32 0, metadata !55} ; [ DW_TAG_auto_variable ] [num] [line 21]
!57 = metadata !{i32 21, i32 13, metadata !9, metadata !55}
!58 = metadata !{i32 22, i32 7, metadata !42, metadata !55}
!59 = metadata !{i32 26, i32 7, metadata !44, metadata !55}
!60 = metadata !{i32 27, i32 9, metadata !46, metadata !55}
!61 = metadata !{i32 29, i32 7, metadata !49, metadata !55}
!62 = metadata !{i32 30, i32 1, metadata !49, metadata !55}
!63 = metadata !{i32 32, i32 7, metadata !46, metadata !55}
!64 = metadata !{i32 35, i32 5, metadata !44, metadata !55}
!65 = metadata !{i32 786688, metadata !12, metadata !"ret", metadata !5, i32 45, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ret] [line 45]
!66 = metadata !{i32 45, i32 13, metadata !12, null}
!67 = metadata !{i32 46, i32 7, metadata !68, null}
!68 = metadata !{i32 786443, metadata !1, metadata !12, i32 46, i32 7, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!69 = metadata !{i32 21, i32 19, metadata !9, metadata !70}
!70 = metadata !{i32 49, i32 13, metadata !71, null}
!71 = metadata !{i32 786443, metadata !1, metadata !72, i32 48, i32 15, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!72 = metadata !{i32 786443, metadata !1, metadata !68, i32 47, i32 1, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!73 = metadata !{i32 22, i32 7, metadata !42, metadata !70}
!74 = metadata !{i32 26, i32 7, metadata !44, metadata !70}
!75 = metadata !{i32 27, i32 9, metadata !46, metadata !70}
!76 = metadata !{i32 29, i32 7, metadata !49, metadata !70}
!77 = metadata !{i32 30, i32 1, metadata !49, metadata !70}
!78 = metadata !{i32 32, i32 7, metadata !46, metadata !70}
!79 = metadata !{i32 35, i32 5, metadata !44, metadata !70}
!80 = metadata !{i32 50, i32 11, metadata !81, null}
!81 = metadata !{i32 786443, metadata !1, metadata !71, i32 50, i32 11, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!82 = metadata !{i32 51, i32 13, metadata !83, null}
!83 = metadata !{i32 786443, metadata !1, metadata !84, i32 51, i32 13, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!84 = metadata !{i32 786443, metadata !1, metadata !81, i32 50, i32 20, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!85 = metadata !{i32 58, i32 3, metadata !12, null} ; [ DW_TAG_imported_module ]

