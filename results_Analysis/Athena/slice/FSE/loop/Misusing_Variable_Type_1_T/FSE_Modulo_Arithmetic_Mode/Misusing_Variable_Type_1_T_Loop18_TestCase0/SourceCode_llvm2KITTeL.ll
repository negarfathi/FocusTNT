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
  call void @llvm.dbg.value(metadata !{i64 %"15"}, i64 0, metadata !42), !dbg !47
  call void @llvm.dbg.value(metadata !39, i64 0, metadata !48), !dbg !49
  call void @llvm.dbg.value(metadata !50, i64 0, metadata !51), !dbg !52
  call void @llvm.dbg.value(metadata !53, i64 0, metadata !54), !dbg !55
  br label %main_wrap_around.exit2, !dbg !56

main_wrap_around.exit2:                           ; preds = %main_bb17, %main_bb16, %main_bb15, %main_bb5
  %div1.0 = phi i64 [ 1, %main_bb5 ], [ %"41", %main_bb15 ], [ %"46", %main_bb17 ], [ %"36", %main_bb16 ]
  %"12" = icmp sge i64 %div1.0, 0, !dbg !57
  br i1 %"12", label %main_wrap_around.exit4, label %main_bb18, !dbg !57

main_wrap_around.exit4:                           ; preds = %main_bb13, %main_bb12, %main_bb11, %main_wrap_around.exit2
  %div2.0 = phi i64 [ 7, %main_wrap_around.exit2 ], [ %"30", %main_bb11 ], [ %"35", %main_bb13 ], [ %"25", %main_bb12 ]
  %"13" = icmp sge i64 %div2.0, 0, !dbg !59
  br i1 %"13", label %main_wrap_around.exit, label %main_bb14, !dbg !59

main_wrap_around.exit:                            ; preds = %main_bb9, %main_bb8, %main_bb7, %main_wrap_around.exit4
  %mul.0 = phi i64 [ 0, %main_wrap_around.exit4 ], [ %"19", %main_bb7 ], [ %"24", %main_bb9 ], [ %"15", %main_bb8 ]
  %"14" = icmp sle i64 %mul.0, 255, !dbg !61
  br i1 %"14", label %main_bb6, label %main_bb10, !dbg !61

main_bb6:                                         ; preds = %main_wrap_around.exit
  %"15" = add nsw i64 %mul.0, 1, !dbg !43
  %"16" = icmp sgt i64 %"15", 4294967295, !dbg !63
  br i1 %"16", label %main_bb7, label %main_bb8, !dbg !63

main_bb7:                                         ; preds = %main_bb6
  %"17" = sub nsw i64 %"15", 4294967295, !dbg !64
  %"18" = sub nsw i64 %"17", 1, !dbg !64
  %"19" = srem i64 %"18", 4294967296, !dbg !64
  br label %main_wrap_around.exit, !dbg !64

main_bb8:                                         ; preds = %main_bb6
  %"20" = icmp slt i64 %"15", 0, !dbg !65
  br i1 %"20", label %main_bb9, label %main_wrap_around.exit, !dbg !65

main_bb9:                                         ; preds = %main_bb8
  %"21" = sub nsw i64 0, %"15", !dbg !66
  %"22" = sub nsw i64 %"21", 1, !dbg !66
  %"23" = srem i64 %"22", 4294967296, !dbg !66
  %"24" = sub nsw i64 4294967295, %"23", !dbg !66
  br label %main_wrap_around.exit, !dbg !66

main_bb10:                                        ; preds = %main_wrap_around.exit
  %"25" = sub nsw i64 %div2.0, 1, !dbg !67
  call void @llvm.dbg.value(metadata !{i64 %"25"}, i64 0, metadata !68), !dbg !69
  call void @llvm.dbg.value(metadata !70, i64 0, metadata !71), !dbg !72
  call void @llvm.dbg.value(metadata !73, i64 0, metadata !74), !dbg !75
  call void @llvm.dbg.value(metadata !53, i64 0, metadata !76), !dbg !77
  %"26" = icmp sgt i64 %"25", 2147483647, !dbg !78
  br i1 %"26", label %main_bb11, label %main_bb12, !dbg !78

main_bb11:                                        ; preds = %main_bb10
  %"27" = sub nsw i64 %"25", 2147483647, !dbg !79
  %"28" = sub nsw i64 %"27", 1, !dbg !79
  %"29" = srem i64 %"28", 4294967296, !dbg !79
  %"30" = add nsw i64 -2147483648, %"29", !dbg !79
  br label %main_wrap_around.exit4, !dbg !79

main_bb12:                                        ; preds = %main_bb10
  %"31" = icmp slt i64 %"25", -2147483648, !dbg !80
  br i1 %"31", label %main_bb13, label %main_wrap_around.exit4, !dbg !80

main_bb13:                                        ; preds = %main_bb12
  %"32" = sub nsw i64 -2147483648, %"25", !dbg !81
  %"33" = sub nsw i64 %"32", 1, !dbg !81
  %"34" = srem i64 %"33", 4294967296, !dbg !81
  %"35" = sub nsw i64 2147483647, %"34", !dbg !81
  br label %main_wrap_around.exit4, !dbg !81

main_bb14:                                        ; preds = %main_wrap_around.exit4
  %"36" = sub nsw i64 %div1.0, 1, !dbg !82
  call void @llvm.dbg.value(metadata !{i64 %"36"}, i64 0, metadata !83), !dbg !84
  call void @llvm.dbg.value(metadata !70, i64 0, metadata !85), !dbg !86
  call void @llvm.dbg.value(metadata !73, i64 0, metadata !87), !dbg !88
  call void @llvm.dbg.value(metadata !53, i64 0, metadata !89), !dbg !90
  %"37" = icmp sgt i64 %"36", 2147483647, !dbg !91
  br i1 %"37", label %main_bb15, label %main_bb16, !dbg !91

main_bb15:                                        ; preds = %main_bb14
  %"38" = sub nsw i64 %"36", 2147483647, !dbg !92
  %"39" = sub nsw i64 %"38", 1, !dbg !92
  %"40" = srem i64 %"39", 4294967296, !dbg !92
  %"41" = add nsw i64 -2147483648, %"40", !dbg !92
  br label %main_wrap_around.exit2, !dbg !92

main_bb16:                                        ; preds = %main_bb14
  %"42" = icmp slt i64 %"36", -2147483648, !dbg !93
  br i1 %"42", label %main_bb17, label %main_wrap_around.exit2, !dbg !93

main_bb17:                                        ; preds = %main_bb16
  %"43" = sub nsw i64 -2147483648, %"36", !dbg !94
  %"44" = sub nsw i64 %"43", 1, !dbg !94
  %"45" = srem i64 %"44", 4294967296, !dbg !94
  %"46" = sub nsw i64 2147483647, %"45", !dbg !94
  br label %main_wrap_around.exit2, !dbg !94

main_bb18:                                        ; preds = %main_wrap_around.exit2
  ret void, !dbg !95
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
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"wrap_around", metadata !"wrap_around", metadata !"", i32 4, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i64, i64, i64)* @wrap_around, null, null, metadata !2, i32 4} ; [ DW_TAG_subprogram ] [line 4] [def] [wrap_around]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 14, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @main, null, null, metadata !2, i32 15} ; [ DW_TAG_subprogram ] [line 14] [def] [scope 15] [main]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{null}
!12 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!13 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!14 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!15 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777220, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 4]
!16 = metadata !{i32 4, i32 33, metadata !4, null}
!17 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554436, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [lower_bound] [line 4]
!18 = metadata !{i32 4, i32 50, metadata !4, null}
!19 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331652, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [upper_bound] [line 4]
!20 = metadata !{i32 4, i32 73, metadata !4, null}
!21 = metadata !{i32 5, i32 5, metadata !4, null}
!22 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 5, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [range] [line 5]
!23 = metadata !{i32 5, i32 15, metadata !4, null}
!24 = metadata !{i32 6, i32 9, metadata !25, null}
!25 = metadata !{i32 786443, metadata !1, metadata !4, i32 6, i32 9, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!26 = metadata !{i32 7, i32 9, metadata !27, null}
!27 = metadata !{i32 786443, metadata !1, metadata !25, i32 6, i32 30, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!28 = metadata !{i32 9, i32 14, metadata !29, null}
!29 = metadata !{i32 786443, metadata !1, metadata !25, i32 9, i32 14, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!30 = metadata !{i32 10, i32 9, metadata !31, null}
!31 = metadata !{i32 786443, metadata !1, metadata !29, i32 9, i32 35, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!32 = metadata !{i32 13, i32 1, metadata !4, null}
!33 = metadata !{i64 1}
!34 = metadata !{i32 786688, metadata !9, metadata !"div1", metadata !5, i32 17, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [div1] [line 17]
!35 = metadata !{i32 17, i32 13, metadata !9, null}
!36 = metadata !{i64 7}
!37 = metadata !{i32 786688, metadata !9, metadata !"div2", metadata !5, i32 18, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [div2] [line 18]
!38 = metadata !{i32 18, i32 13, metadata !9, null}
!39 = metadata !{i64 0}
!40 = metadata !{i32 786688, metadata !9, metadata !"mul", metadata !5, i32 16, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mul] [line 16]
!41 = metadata !{i32 16, i32 13, metadata !9, null}
!42 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777220, metadata !8, i32 0, metadata !43} ; [ DW_TAG_arg_variable ] [value] [line 4]
!43 = metadata !{i32 25, i32 10, metadata !44, null}
!44 = metadata !{i32 786443, metadata !1, metadata !45, i32 25, i32 1, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!45 = metadata !{i32 786443, metadata !1, metadata !46, i32 22, i32 23, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!46 = metadata !{i32 786443, metadata !1, metadata !9, i32 20, i32 21, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!47 = metadata !{i32 4, i32 33, metadata !4, metadata !43}
!48 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554436, metadata !8, i32 0, metadata !43} ; [ DW_TAG_arg_variable ] [lower_bound] [line 4]
!49 = metadata !{i32 4, i32 50, metadata !4, metadata !43}
!50 = metadata !{i64 4294967295}
!51 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331652, metadata !8, i32 0, metadata !43} ; [ DW_TAG_arg_variable ] [upper_bound] [line 4]
!52 = metadata !{i32 4, i32 73, metadata !4, metadata !43}
!53 = metadata !{i64 4294967296}
!54 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 5, metadata !8, i32 0, metadata !43} ; [ DW_TAG_auto_variable ] [range] [line 5]
!55 = metadata !{i32 5, i32 15, metadata !4, metadata !43}
!56 = metadata !{i32 20, i32 3, metadata !9, null}
!57 = metadata !{i32 20, i32 3, metadata !58, null}
!58 = metadata !{i32 786443, metadata !1, metadata !9, i32 20, i32 3, i32 1, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!59 = metadata !{i32 22, i32 5, metadata !60, null}
!60 = metadata !{i32 786443, metadata !1, metadata !46, i32 22, i32 5, i32 1, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!61 = metadata !{i32 24, i32 7, metadata !62, null}
!62 = metadata !{i32 786443, metadata !1, metadata !45, i32 24, i32 7, i32 1, i32 9} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!63 = metadata !{i32 6, i32 9, metadata !25, metadata !43}
!64 = metadata !{i32 7, i32 9, metadata !27, metadata !43}
!65 = metadata !{i32 9, i32 14, metadata !29, metadata !43}
!66 = metadata !{i32 10, i32 9, metadata !31, metadata !43}
!67 = metadata !{i32 27, i32 15, metadata !45, null}
!68 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777220, metadata !8, i32 0, metadata !67} ; [ DW_TAG_arg_variable ] [value] [line 4]
!69 = metadata !{i32 4, i32 33, metadata !4, metadata !67}
!70 = metadata !{i64 -2147483648}
!71 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554436, metadata !8, i32 0, metadata !67} ; [ DW_TAG_arg_variable ] [lower_bound] [line 4]
!72 = metadata !{i32 4, i32 50, metadata !4, metadata !67}
!73 = metadata !{i64 2147483647}
!74 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331652, metadata !8, i32 0, metadata !67} ; [ DW_TAG_arg_variable ] [upper_bound] [line 4]
!75 = metadata !{i32 4, i32 73, metadata !4, metadata !67}
!76 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 5, metadata !8, i32 0, metadata !67} ; [ DW_TAG_auto_variable ] [range] [line 5]
!77 = metadata !{i32 5, i32 15, metadata !4, metadata !67}
!78 = metadata !{i32 6, i32 9, metadata !25, metadata !67}
!79 = metadata !{i32 7, i32 9, metadata !27, metadata !67}
!80 = metadata !{i32 9, i32 14, metadata !29, metadata !67}
!81 = metadata !{i32 10, i32 9, metadata !31, metadata !67}
!82 = metadata !{i32 29, i32 13, metadata !46, null}
!83 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777220, metadata !8, i32 0, metadata !82} ; [ DW_TAG_arg_variable ] [value] [line 4]
!84 = metadata !{i32 4, i32 33, metadata !4, metadata !82}
!85 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554436, metadata !8, i32 0, metadata !82} ; [ DW_TAG_arg_variable ] [lower_bound] [line 4]
!86 = metadata !{i32 4, i32 50, metadata !4, metadata !82}
!87 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331652, metadata !8, i32 0, metadata !82} ; [ DW_TAG_arg_variable ] [upper_bound] [line 4]
!88 = metadata !{i32 4, i32 73, metadata !4, metadata !82}
!89 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 5, metadata !8, i32 0, metadata !82} ; [ DW_TAG_auto_variable ] [range] [line 5]
!90 = metadata !{i32 5, i32 15, metadata !4, metadata !82}
!91 = metadata !{i32 6, i32 9, metadata !25, metadata !82}
!92 = metadata !{i32 7, i32 9, metadata !27, metadata !82}
!93 = metadata !{i32 9, i32 14, metadata !29, metadata !82}
!94 = metadata !{i32 10, i32 9, metadata !31, metadata !82}
!95 = metadata !{i32 31, i32 3, metadata !9, null}

