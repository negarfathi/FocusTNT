; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@"'__fc_errno" = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @waitpid_slice_1() #0 {
waitpid_slice_1_bb0:
  %"0" = call i32 @__VERIFIER_nondet_int(), !dbg !17
  call void @llvm.dbg.value(metadata !{i32 %"0"}, i64 0, metadata !18), !dbg !19
  %"1" = icmp slt i32 %"0", 0, !dbg !20
  br i1 %"1", label %waitpid_slice_1_bb1, label %waitpid_slice_1_bb6, !dbg !20

waitpid_slice_1_bb1:                              ; preds = %waitpid_slice_1_bb0
  %"2" = call i32 @__VERIFIER_nondet_int(), !dbg !22
  %"3" = icmp ne i32 %"2", 0, !dbg !22
  br i1 %"3", label %waitpid_slice_1_bb2, label %waitpid_slice_1_bb5, !dbg !22

waitpid_slice_1_bb2:                              ; preds = %waitpid_slice_1_bb1
  %"4" = load i32* @"'__fc_errno", align 4, !dbg !24
  %"5" = icmp ne i32 %"4", 1, !dbg !24
  br i1 %"5", label %waitpid_slice_1_bb3, label %waitpid_slice_1_bb4, !dbg !24

waitpid_slice_1_bb3:                              ; preds = %waitpid_slice_1_bb2
  store i32 1, i32* @"'__fc_errno", align 4, !dbg !27
  br label %waitpid_slice_1_bb6, !dbg !27

waitpid_slice_1_bb4:                              ; preds = %waitpid_slice_1_bb2
  store i32 2, i32* @"'__fc_errno", align 4, !dbg !28
  br label %waitpid_slice_1_bb6

waitpid_slice_1_bb5:                              ; preds = %waitpid_slice_1_bb1
  store i32 2, i32* @"'__fc_errno", align 4, !dbg !29
  br label %waitpid_slice_1_bb6

waitpid_slice_1_bb6:                              ; preds = %waitpid_slice_1_bb0, %waitpid_slice_1_bb5, %waitpid_slice_1_bb4, %waitpid_slice_1_bb3
  ret i32 %"0", !dbg !30
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

declare i32 @__VERIFIER_nondet_int() #2

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb7:
  %"6" = call i32 @__VERIFIER_nondet_int() #3, !dbg !31
  call void @llvm.dbg.value(metadata !{i32 %"6"}, i64 0, metadata !33) #3, !dbg !34
  %"7" = icmp slt i32 %"6", 0, !dbg !35
  br i1 %"7", label %main_bb8, label %main_waitpid_slice_1.exit, !dbg !35

main_bb8:                                         ; preds = %main_bb7
  %"8" = call i32 @__VERIFIER_nondet_int() #3, !dbg !36
  %"9" = icmp ne i32 %"8", 0, !dbg !36
  br i1 %"9", label %main_bb9, label %main_bb12, !dbg !36

main_bb9:                                         ; preds = %main_bb8
  %"10" = load i32* @"'__fc_errno", align 4, !dbg !37
  %"11" = icmp ne i32 %"10", 1, !dbg !37
  br i1 %"11", label %main_bb10, label %main_bb11, !dbg !37

main_bb10:                                        ; preds = %main_bb9
  store i32 1, i32* @"'__fc_errno", align 4, !dbg !38
  br label %main_waitpid_slice_1.exit, !dbg !38

main_bb11:                                        ; preds = %main_bb9
  store i32 2, i32* @"'__fc_errno", align 4, !dbg !39
  br label %main_waitpid_slice_1.exit, !dbg !32

main_bb12:                                        ; preds = %main_bb8
  store i32 2, i32* @"'__fc_errno", align 4, !dbg !40
  br label %main_waitpid_slice_1.exit, !dbg !32

main_waitpid_slice_1.exit:                        ; preds = %main_bb7, %main_bb10, %main_bb11, %main_bb12
  call void @llvm.dbg.value(metadata !{i32 %"6"}, i64 0, metadata !41), !dbg !42
  %"12" = icmp eq i32 %"6", 0, !dbg !43
  br i1 %"12", label %main_bb13, label %main_bb19, !dbg !43

main_bb13:                                        ; preds = %main_waitpid_slice_1.exit1, %main_waitpid_slice_1.exit
  %"13" = call i32 @__VERIFIER_nondet_int() #3, !dbg !45
  %"14" = icmp slt i32 %"13", 0, !dbg !48
  br i1 %"14", label %main_bb14, label %main_waitpid_slice_1.exit1, !dbg !48

main_bb14:                                        ; preds = %main_bb13
  %"15" = call i32 @__VERIFIER_nondet_int() #3, !dbg !49
  %"16" = icmp ne i32 %"15", 0, !dbg !49
  br i1 %"16", label %main_bb15, label %main_bb18, !dbg !49

main_bb15:                                        ; preds = %main_bb14
  %"17" = load i32* @"'__fc_errno", align 4, !dbg !50
  %"18" = icmp ne i32 %"17", 1, !dbg !50
  br i1 %"18", label %main_bb16, label %main_bb17, !dbg !50

main_bb16:                                        ; preds = %main_bb15
  store i32 1, i32* @"'__fc_errno", align 4, !dbg !51
  br label %main_waitpid_slice_1.exit1, !dbg !51

main_bb17:                                        ; preds = %main_bb15
  store i32 2, i32* @"'__fc_errno", align 4, !dbg !52
  br label %main_waitpid_slice_1.exit1, !dbg !46

main_bb18:                                        ; preds = %main_bb14
  store i32 2, i32* @"'__fc_errno", align 4, !dbg !53
  br label %main_waitpid_slice_1.exit1, !dbg !46

main_waitpid_slice_1.exit1:                       ; preds = %main_bb13, %main_bb16, %main_bb17, %main_bb18
  %"19" = icmp slt i32 %"13", 0, !dbg !54
  %"20" = load i32* @"'__fc_errno", align 4
  %"21" = icmp eq i32 %"20", 1, !dbg !56
  %or.cond = and i1 %"19", %"21", !dbg !54
  br i1 %or.cond, label %main_bb13, label %main_bb19, !dbg !54

main_bb19:                                        ; preds = %main_waitpid_slice_1.exit1, %main_waitpid_slice_1.exit
  ret void, !dbg !59
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
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"waitpid_slice_1", metadata !"waitpid_slice_1", metadata !"", i32 6, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @waitpid_slice_1, null, null, metadata !2, i32 7} ; [ DW_TAG_subprogram ] [line 6] [def] [scope 7] [waitpid_slice_1]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 27, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @main, null, null, metadata !2, i32 28} ; [ DW_TAG_subprogram ] [line 27] [def] [scope 28] [main]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{null}
!12 = metadata !{metadata !13}
!13 = metadata !{i32 786484, i32 0, null, metadata !"__fc_errno", metadata !"__fc_errno", metadata !"", metadata !5, i32 5, metadata !8, i32 0, i32 1, i32* @"'__fc_errno", null} ; [ DW_TAG_variable ] [__fc_errno] [line 5] [def]
!14 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!15 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!16 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!17 = metadata !{i32 9, i32 13, metadata !4, null}
!18 = metadata !{i32 786688, metadata !4, metadata !"num", metadata !5, i32 9, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [num] [line 9]
!19 = metadata !{i32 9, i32 7, metadata !4, null}
!20 = metadata !{i32 10, i32 7, metadata !21, null}
!21 = metadata !{i32 786443, metadata !1, metadata !4, i32 10, i32 7, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!22 = metadata !{i32 12, i32 7, metadata !23, null}
!23 = metadata !{i32 786443, metadata !1, metadata !4, i32 12, i32 7, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!24 = metadata !{i32 13, i32 9, metadata !25, null}
!25 = metadata !{i32 786443, metadata !1, metadata !26, i32 13, i32 9, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!26 = metadata !{i32 786443, metadata !1, metadata !23, i32 12, i32 32, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!27 = metadata !{i32 14, i32 7, metadata !25, null}
!28 = metadata !{i32 16, i32 7, metadata !25, null}
!29 = metadata !{i32 19, i32 5, metadata !23, null}
!30 = metadata !{i32 24, i32 17, metadata !4, null}
!31 = metadata !{i32 9, i32 13, metadata !4, metadata !32}
!32 = metadata !{i32 29, i32 13, metadata !9, null}
!33 = metadata !{i32 786688, metadata !4, metadata !"num", metadata !5, i32 9, metadata !8, i32 0, metadata !32} ; [ DW_TAG_auto_variable ] [num] [line 9]
!34 = metadata !{i32 9, i32 7, metadata !4, metadata !32}
!35 = metadata !{i32 10, i32 7, metadata !21, metadata !32}
!36 = metadata !{i32 12, i32 7, metadata !23, metadata !32}
!37 = metadata !{i32 13, i32 9, metadata !25, metadata !32}
!38 = metadata !{i32 14, i32 7, metadata !25, metadata !32}
!39 = metadata !{i32 16, i32 7, metadata !25, metadata !32}
!40 = metadata !{i32 19, i32 5, metadata !23, metadata !32}
!41 = metadata !{i32 786688, metadata !9, metadata !"ret", metadata !5, i32 29, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ret] [line 29]
!42 = metadata !{i32 29, i32 7, metadata !9, null}
!43 = metadata !{i32 30, i32 7, metadata !44, null}
!44 = metadata !{i32 786443, metadata !1, metadata !9, i32 30, i32 7, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!45 = metadata !{i32 9, i32 13, metadata !4, metadata !46}
!46 = metadata !{i32 32, i32 13, metadata !47, null}
!47 = metadata !{i32 786443, metadata !1, metadata !44, i32 31, i32 15, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!48 = metadata !{i32 10, i32 7, metadata !21, metadata !46}
!49 = metadata !{i32 12, i32 7, metadata !23, metadata !46}
!50 = metadata !{i32 13, i32 9, metadata !25, metadata !46}
!51 = metadata !{i32 14, i32 7, metadata !25, metadata !46}
!52 = metadata !{i32 16, i32 7, metadata !25, metadata !46}
!53 = metadata !{i32 19, i32 5, metadata !23, metadata !46}
!54 = metadata !{i32 33, i32 11, metadata !55, null}
!55 = metadata !{i32 786443, metadata !1, metadata !47, i32 33, i32 11, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!56 = metadata !{i32 34, i32 13, metadata !57, null}
!57 = metadata !{i32 786443, metadata !1, metadata !58, i32 34, i32 13, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!58 = metadata !{i32 786443, metadata !1, metadata !55, i32 33, i32 20, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!59 = metadata !{i32 38, i32 3, metadata !9, null}

