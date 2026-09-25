; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define i64 @wrap_around(i64 %value, i64 %lower_bound, i64 %upper_bound) #0 {
wrap_around_bb0:
  call void @llvm.dbg.value(metadata !{i64 %value}, i64 0, metadata !19), !dbg !20
  call void @llvm.dbg.value(metadata !{i64 %lower_bound}, i64 0, metadata !21), !dbg !22
  call void @llvm.dbg.value(metadata !{i64 %upper_bound}, i64 0, metadata !23), !dbg !24
  %"0" = sub nsw i64 %upper_bound, %lower_bound, !dbg !25
  %"1" = add nsw i64 %"0", 1, !dbg !25
  call void @llvm.dbg.value(metadata !{i64 %"1"}, i64 0, metadata !26), !dbg !27
  %"2" = icmp sgt i64 %value, %upper_bound, !dbg !28
  br i1 %"2", label %wrap_around_bb1, label %wrap_around_bb2, !dbg !28

wrap_around_bb1:                                  ; preds = %wrap_around_bb0
  %"3" = sub nsw i64 %value, %upper_bound, !dbg !30
  %"4" = sub nsw i64 %"3", 1, !dbg !30
  %"5" = srem i64 %"4", %"1", !dbg !30
  %"6" = add nsw i64 %lower_bound, %"5", !dbg !30
  br label %wrap_around_bb4, !dbg !30

wrap_around_bb2:                                  ; preds = %wrap_around_bb0
  %"7" = icmp slt i64 %value, %lower_bound, !dbg !32
  br i1 %"7", label %wrap_around_bb3, label %wrap_around_bb4, !dbg !32

wrap_around_bb3:                                  ; preds = %wrap_around_bb2
  %"8" = sub nsw i64 %lower_bound, %value, !dbg !34
  %"9" = sub nsw i64 %"8", 1, !dbg !34
  %"10" = srem i64 %"9", %"1", !dbg !34
  %"11" = sub nsw i64 %upper_bound, %"10", !dbg !34
  br label %wrap_around_bb4, !dbg !34

wrap_around_bb4:                                  ; preds = %wrap_around_bb2, %wrap_around_bb3, %wrap_around_bb1
  %.0 = phi i64 [ %"6", %wrap_around_bb1 ], [ %"11", %wrap_around_bb3 ], [ %value, %wrap_around_bb2 ]
  ret i64 %.0, !dbg !36
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i64 @gettablesize() #0 {
gettablesize_bb5:
  call void @llvm.dbg.value(metadata !37, i64 0, metadata !38), !dbg !39
  %"12" = srem i64 90000, 99999, !dbg !40
  call void @llvm.dbg.value(metadata !{i64 %"12"}, i64 0, metadata !41), !dbg !42
  call void @llvm.dbg.value(metadata !43, i64 0, metadata !44), !dbg !45
  call void @llvm.dbg.value(metadata !46, i64 0, metadata !47), !dbg !48
  call void @llvm.dbg.value(metadata !49, i64 0, metadata !50), !dbg !51
  call void @llvm.dbg.value(metadata !{i64 %"12"}, i64 0, metadata !38), !dbg !39
  %"13" = icmp slt i64 %"12", 0, !dbg !52
  br i1 %"13", label %gettablesize_bb6, label %gettablesize_wrap_around.exit, !dbg !52

gettablesize_bb6:                                 ; preds = %gettablesize_bb5
  %"14" = sub nsw i64 0, %"12", !dbg !54
  call void @llvm.dbg.value(metadata !{i64 %"14"}, i64 0, metadata !56), !dbg !57
  call void @llvm.dbg.value(metadata !43, i64 0, metadata !58), !dbg !59
  call void @llvm.dbg.value(metadata !46, i64 0, metadata !60), !dbg !61
  call void @llvm.dbg.value(metadata !49, i64 0, metadata !62), !dbg !63
  %"15" = icmp sgt i64 %"14", 2147483647, !dbg !64
  br i1 %"15", label %gettablesize_bb7, label %gettablesize_bb8, !dbg !64

gettablesize_bb7:                                 ; preds = %gettablesize_bb6
  %"16" = sub nsw i64 %"14", 2147483647, !dbg !65
  %"17" = sub nsw i64 %"16", 1, !dbg !65
  %"18" = srem i64 %"17", 4294967296, !dbg !65
  %"19" = add nsw i64 -2147483648, %"18", !dbg !65
  br label %gettablesize_wrap_around.exit, !dbg !65

gettablesize_bb8:                                 ; preds = %gettablesize_bb6
  %"20" = icmp slt i64 %"14", -2147483648, !dbg !66
  br i1 %"20", label %gettablesize_bb9, label %gettablesize_wrap_around.exit, !dbg !66

gettablesize_bb9:                                 ; preds = %gettablesize_bb8
  %"21" = sub nsw i64 -2147483648, %"14", !dbg !67
  %"22" = sub nsw i64 %"21", 1, !dbg !67
  %"23" = srem i64 %"22", 4294967296, !dbg !67
  %"24" = sub nsw i64 2147483647, %"23", !dbg !67
  br label %gettablesize_wrap_around.exit, !dbg !67

gettablesize_wrap_around.exit:                    ; preds = %gettablesize_bb5, %gettablesize_bb9, %gettablesize_bb8, %gettablesize_bb7
  %.0 = phi i64 [ %"19", %gettablesize_bb7 ], [ %"24", %gettablesize_bb9 ], [ %"14", %gettablesize_bb8 ], [ %"12", %gettablesize_bb5 ]
  ret i64 %.0, !dbg !68
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
main_bb10:
  call void @llvm.dbg.value(metadata !37, i64 0, metadata !69), !dbg !71
  call void @llvm.dbg.value(metadata !37, i64 0, metadata !72), !dbg !74
  call void @llvm.dbg.value(metadata !43, i64 0, metadata !75), !dbg !76
  call void @llvm.dbg.value(metadata !46, i64 0, metadata !77), !dbg !78
  call void @llvm.dbg.value(metadata !49, i64 0, metadata !79), !dbg !80
  call void @llvm.dbg.value(metadata !37, i64 0, metadata !69), !dbg !71
  call void @llvm.dbg.value(metadata !37, i64 0, metadata !81), !dbg !83
  call void @llvm.dbg.value(metadata !84, i64 0, metadata !85), !dbg !86
  call void @llvm.dbg.value(metadata !87, i64 0, metadata !88), !dbg !89
  call void @llvm.dbg.value(metadata !84, i64 0, metadata !90), !dbg !91
  call void @llvm.dbg.value(metadata !92, i64 0, metadata !93), !dbg !94
  call void @llvm.dbg.value(metadata !84, i64 0, metadata !95), !dbg !96
  call void @llvm.dbg.value(metadata !{i64 %"26"}, i64 0, metadata !97), !dbg !100
  call void @llvm.dbg.value(metadata !84, i64 0, metadata !101), !dbg !102
  call void @llvm.dbg.value(metadata !103, i64 0, metadata !104), !dbg !105
  call void @llvm.dbg.value(metadata !106, i64 0, metadata !107), !dbg !108
  br label %main_wrap_around.exit, !dbg !109

main_wrap_around.exit:                            ; preds = %main_bb14, %main_bb13, %main_bb12, %main_bb10
  %i.0 = phi i64 [ 0, %main_bb10 ], [ %"30", %main_bb12 ], [ %"35", %main_bb14 ], [ %"26", %main_bb13 ]
  %"25" = icmp slt i64 %i.0, undef, !dbg !110
  br i1 %"25", label %main_bb11, label %main_bb15, !dbg !110

main_bb11:                                        ; preds = %main_wrap_around.exit
  %"26" = add nsw i64 %i.0, 1, !dbg !98
  %"27" = icmp sgt i64 %"26", 65535, !dbg !113
  br i1 %"27", label %main_bb12, label %main_bb13, !dbg !113

main_bb12:                                        ; preds = %main_bb11
  %"28" = sub nsw i64 %"26", 65535, !dbg !114
  %"29" = sub nsw i64 %"28", 1, !dbg !114
  %"30" = srem i64 %"29", 65536, !dbg !114
  br label %main_wrap_around.exit, !dbg !114

main_bb13:                                        ; preds = %main_bb11
  %"31" = icmp slt i64 %"26", 0, !dbg !115
  br i1 %"31", label %main_bb14, label %main_wrap_around.exit, !dbg !115

main_bb14:                                        ; preds = %main_bb13
  %"32" = sub nsw i64 0, %"26", !dbg !116
  %"33" = sub nsw i64 %"32", 1, !dbg !116
  %"34" = srem i64 %"33", 65536, !dbg !116
  %"35" = sub nsw i64 65535, %"34", !dbg !116
  br label %main_wrap_around.exit, !dbg !116

main_bb15:                                        ; preds = %main_wrap_around.exit
  ret i32 0, !dbg !117
}

declare i64 @__kittel_nondef.0()

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

declare i32 @__kittel_nondef.1()

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!16, !17}
!llvm.ident = !{!18}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [//FILES_DIR/SourceCode_SemanticAugmentor.c] [DW_LANG_C99]
!1 = metadata !{metadata !"FILES_DIR/SourceCode_SemanticAugmentor.c", metadata !"/"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9, metadata !12}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"wrap_around", metadata !"wrap_around", metadata !"", i32 12, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i64, i64, i64)* @wrap_around, null, null, metadata !2, i32 12} ; [ DW_TAG_subprogram ] [line 12] [def] [wrap_around]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"gettablesize", metadata !"gettablesize", metadata !"", i32 22, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i64 ()* @gettablesize, null, null, metadata !2, i32 23} ; [ DW_TAG_subprogram ] [line 22] [def] [scope 23] [gettablesize]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !8}
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 33, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 34} ; [ DW_TAG_subprogram ] [line 33] [def] [scope 34] [main]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{metadata !15}
!15 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!16 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!17 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!18 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!19 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777228, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 12]
!20 = metadata !{i32 12, i32 33, metadata !4, null}
!21 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554444, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [lower_bound] [line 12]
!22 = metadata !{i32 12, i32 50, metadata !4, null}
!23 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331660, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [upper_bound] [line 12]
!24 = metadata !{i32 12, i32 73, metadata !4, null}
!25 = metadata !{i32 13, i32 5, metadata !4, null}
!26 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 13, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [range] [line 13]
!27 = metadata !{i32 13, i32 15, metadata !4, null}
!28 = metadata !{i32 14, i32 9, metadata !29, null}
!29 = metadata !{i32 786443, metadata !1, metadata !4, i32 14, i32 9, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!30 = metadata !{i32 15, i32 9, metadata !31, null}
!31 = metadata !{i32 786443, metadata !1, metadata !29, i32 14, i32 30, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!32 = metadata !{i32 17, i32 14, metadata !33, null}
!33 = metadata !{i32 786443, metadata !1, metadata !29, i32 17, i32 14, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!34 = metadata !{i32 18, i32 9, metadata !35, null}
!35 = metadata !{i32 786443, metadata !1, metadata !33, i32 17, i32 35, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!36 = metadata !{i32 21, i32 1, metadata !4, null}
!37 = metadata !{i64 90000}
!38 = metadata !{i32 786688, metadata !9, metadata !"i", metadata !5, i32 24, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 24]
!39 = metadata !{i32 24, i32 15, metadata !9, null}
!40 = metadata !{i32 25, i32 9, metadata !9, null}
!41 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777228, metadata !8, i32 0, metadata !40} ; [ DW_TAG_arg_variable ] [value] [line 12]
!42 = metadata !{i32 12, i32 33, metadata !4, metadata !40}
!43 = metadata !{i64 -2147483648}
!44 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554444, metadata !8, i32 0, metadata !40} ; [ DW_TAG_arg_variable ] [lower_bound] [line 12]
!45 = metadata !{i32 12, i32 50, metadata !4, metadata !40}
!46 = metadata !{i64 2147483647}
!47 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331660, metadata !8, i32 0, metadata !40} ; [ DW_TAG_arg_variable ] [upper_bound] [line 12]
!48 = metadata !{i32 12, i32 73, metadata !4, metadata !40}
!49 = metadata !{i64 4294967296}
!50 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 13, metadata !8, i32 0, metadata !40} ; [ DW_TAG_auto_variable ] [range] [line 13]
!51 = metadata !{i32 13, i32 15, metadata !4, metadata !40}
!52 = metadata !{i32 26, i32 9, metadata !53, null}
!53 = metadata !{i32 786443, metadata !1, metadata !9, i32 26, i32 9, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!54 = metadata !{i32 28, i32 16, metadata !55, null}
!55 = metadata !{i32 786443, metadata !1, metadata !53, i32 27, i32 1, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!56 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777228, metadata !8, i32 0, metadata !54} ; [ DW_TAG_arg_variable ] [value] [line 12]
!57 = metadata !{i32 12, i32 33, metadata !4, metadata !54}
!58 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554444, metadata !8, i32 0, metadata !54} ; [ DW_TAG_arg_variable ] [lower_bound] [line 12]
!59 = metadata !{i32 12, i32 50, metadata !4, metadata !54}
!60 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331660, metadata !8, i32 0, metadata !54} ; [ DW_TAG_arg_variable ] [upper_bound] [line 12]
!61 = metadata !{i32 12, i32 73, metadata !4, metadata !54}
!62 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 13, metadata !8, i32 0, metadata !54} ; [ DW_TAG_auto_variable ] [range] [line 13]
!63 = metadata !{i32 13, i32 15, metadata !4, metadata !54}
!64 = metadata !{i32 14, i32 9, metadata !29, metadata !54}
!65 = metadata !{i32 15, i32 9, metadata !31, metadata !54}
!66 = metadata !{i32 17, i32 14, metadata !33, metadata !54}
!67 = metadata !{i32 18, i32 9, metadata !35, metadata !54}
!68 = metadata !{i32 32, i32 1, metadata !9, null}
!69 = metadata !{i32 786688, metadata !9, metadata !"i", metadata !5, i32 24, metadata !8, i32 0, metadata !70} ; [ DW_TAG_auto_variable ] [i] [line 24]
!70 = metadata !{i32 36, i32 37, metadata !12, null}
!71 = metadata !{i32 24, i32 15, metadata !9, metadata !70}
!72 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777228, metadata !8, i32 0, metadata !73} ; [ DW_TAG_arg_variable ] [value] [line 12]
!73 = metadata !{i32 25, i32 9, metadata !9, metadata !70}
!74 = metadata !{i32 12, i32 33, metadata !4, metadata !73}
!75 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554444, metadata !8, i32 0, metadata !73} ; [ DW_TAG_arg_variable ] [lower_bound] [line 12]
!76 = metadata !{i32 12, i32 50, metadata !4, metadata !73}
!77 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331660, metadata !8, i32 0, metadata !73} ; [ DW_TAG_arg_variable ] [upper_bound] [line 12]
!78 = metadata !{i32 12, i32 73, metadata !4, metadata !73}
!79 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 13, metadata !8, i32 0, metadata !73} ; [ DW_TAG_auto_variable ] [range] [line 13]
!80 = metadata !{i32 13, i32 15, metadata !4, metadata !73}
!81 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777228, metadata !8, i32 0, metadata !82} ; [ DW_TAG_arg_variable ] [value] [line 12]
!82 = metadata !{i32 36, i32 25, metadata !12, null}
!83 = metadata !{i32 12, i32 33, metadata !4, metadata !82}
!84 = metadata !{i64 0}
!85 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554444, metadata !8, i32 0, metadata !82} ; [ DW_TAG_arg_variable ] [lower_bound] [line 12]
!86 = metadata !{i32 12, i32 50, metadata !4, metadata !82}
!87 = metadata !{i64 -1}
!88 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331660, metadata !8, i32 0, metadata !82} ; [ DW_TAG_arg_variable ] [upper_bound] [line 12]
!89 = metadata !{i32 12, i32 73, metadata !4, metadata !82}
!90 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 13, metadata !8, i32 0, metadata !82} ; [ DW_TAG_auto_variable ] [range] [line 13]
!91 = metadata !{i32 13, i32 15, metadata !4, metadata !82}
!92 = metadata !{i64 undef}
!93 = metadata !{i32 786688, metadata !12, metadata !"max_fds", metadata !5, i32 36, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [max_fds] [line 36]
!94 = metadata !{i32 36, i32 15, metadata !12, null}
!95 = metadata !{i32 786688, metadata !12, metadata !"i", metadata !5, i32 35, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 35]
!96 = metadata !{i32 35, i32 15, metadata !12, null}
!97 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777228, metadata !8, i32 0, metadata !98} ; [ DW_TAG_arg_variable ] [value] [line 12]
!98 = metadata !{i32 37, i32 37, metadata !99, null}
!99 = metadata !{i32 786443, metadata !1, metadata !12, i32 37, i32 5, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!100 = metadata !{i32 12, i32 33, metadata !4, metadata !98}
!101 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554444, metadata !8, i32 0, metadata !98} ; [ DW_TAG_arg_variable ] [lower_bound] [line 12]
!102 = metadata !{i32 12, i32 50, metadata !4, metadata !98}
!103 = metadata !{i64 65535}
!104 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331660, metadata !8, i32 0, metadata !98} ; [ DW_TAG_arg_variable ] [upper_bound] [line 12]
!105 = metadata !{i32 12, i32 73, metadata !4, metadata !98}
!106 = metadata !{i64 65536}
!107 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 13, metadata !8, i32 0, metadata !98} ; [ DW_TAG_auto_variable ] [range] [line 13]
!108 = metadata !{i32 13, i32 15, metadata !4, metadata !98}
!109 = metadata !{i32 37, i32 10, metadata !99, null}
!110 = metadata !{i32 37, i32 10, metadata !111, null}
!111 = metadata !{i32 786443, metadata !1, metadata !112, i32 37, i32 10, i32 2, i32 9} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!112 = metadata !{i32 786443, metadata !1, metadata !99, i32 37, i32 10, i32 1, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!113 = metadata !{i32 14, i32 9, metadata !29, metadata !98}
!114 = metadata !{i32 15, i32 9, metadata !31, metadata !98}
!115 = metadata !{i32 17, i32 14, metadata !33, metadata !98}
!116 = metadata !{i32 18, i32 9, metadata !35, metadata !98}
!117 = metadata !{i32 42, i32 5, metadata !12, null}

