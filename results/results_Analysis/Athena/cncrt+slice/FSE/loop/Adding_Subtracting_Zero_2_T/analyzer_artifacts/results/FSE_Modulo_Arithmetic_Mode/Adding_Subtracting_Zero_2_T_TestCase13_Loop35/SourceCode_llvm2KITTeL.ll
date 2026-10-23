; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define i64 @wrap_around(i64 %value, i64 %lower_bound, i64 %upper_bound) #0 {
wrap_around_bb0:
  call void @llvm.dbg.value(metadata !{i64 %value}, i64 0, metadata !18), !dbg !19
  call void @llvm.dbg.value(metadata !{i64 %lower_bound}, i64 0, metadata !20), !dbg !21
  call void @llvm.dbg.value(metadata !{i64 %upper_bound}, i64 0, metadata !22), !dbg !23
  %"0" = sub nsw i64 %upper_bound, %lower_bound, !dbg !24
  %"1" = add nsw i64 %"0", 1, !dbg !24
  call void @llvm.dbg.value(metadata !{i64 %"1"}, i64 0, metadata !25), !dbg !26
  %"2" = icmp sgt i64 %value, %upper_bound, !dbg !27
  br i1 %"2", label %wrap_around_bb1, label %wrap_around_bb2, !dbg !27

wrap_around_bb1:                                  ; preds = %wrap_around_bb0
  %"3" = sub nsw i64 %value, %upper_bound, !dbg !29
  %"4" = sub nsw i64 %"3", 1, !dbg !29
  %"5" = srem i64 %"4", %"1", !dbg !29
  %"6" = add nsw i64 %lower_bound, %"5", !dbg !29
  br label %wrap_around_bb4, !dbg !29

wrap_around_bb2:                                  ; preds = %wrap_around_bb0
  %"7" = icmp slt i64 %value, %lower_bound, !dbg !31
  br i1 %"7", label %wrap_around_bb3, label %wrap_around_bb4, !dbg !31

wrap_around_bb3:                                  ; preds = %wrap_around_bb2
  %"8" = sub nsw i64 %lower_bound, %value, !dbg !33
  %"9" = sub nsw i64 %"8", 1, !dbg !33
  %"10" = srem i64 %"9", %"1", !dbg !33
  %"11" = sub nsw i64 %upper_bound, %"10", !dbg !33
  br label %wrap_around_bb4, !dbg !33

wrap_around_bb4:                                  ; preds = %wrap_around_bb2, %wrap_around_bb3, %wrap_around_bb1
  %.0 = phi i64 [ %"6", %wrap_around_bb1 ], [ %"11", %wrap_around_bb3 ], [ %value, %wrap_around_bb2 ]
  ret i64 %.0, !dbg !35
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i64 @ff_subtitles_next_line_slice_1() #0 {
ff_subtitles_next_line_slice_1_bb5:
  call void @llvm.dbg.value(metadata !36, i64 0, metadata !37), !dbg !38
  %"12" = srem i64 999, 1000, !dbg !39
  call void @llvm.dbg.value(metadata !{i64 %"12"}, i64 0, metadata !40), !dbg !41
  call void @llvm.dbg.value(metadata !42, i64 0, metadata !43), !dbg !44
  call void @llvm.dbg.value(metadata !45, i64 0, metadata !46), !dbg !47
  call void @llvm.dbg.value(metadata !48, i64 0, metadata !49), !dbg !50
  call void @llvm.dbg.value(metadata !{i64 %"12"}, i64 0, metadata !37), !dbg !38
  call void @llvm.dbg.value(metadata !{i64 %"12"}, i64 0, metadata !51), !dbg !52
  ret i64 %"12", !dbg !53
}

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb6:
  call void @llvm.dbg.value(metadata !54, i64 0, metadata !55), !dbg !56
  call void @llvm.dbg.value(metadata !57, i64 0, metadata !58), !dbg !59
  %"13" = icmp slt i64 2, 0, !dbg !60
  %"14" = icmp slt i64 6, 0, !dbg !62
  %or.cond = or i1 %"13", %"14", !dbg !60
  br i1 %or.cond, label %main_bb15, label %main_bb7, !dbg !60

main_bb7:                                         ; preds = %main_bb6, %main_wrap_around.exit
  %b.0 = phi i64 [ %.0.i1, %main_wrap_around.exit ], [ 2, %main_bb6 ]
  %"15" = icmp slt i64 %b.0, 6, !dbg !64
  br i1 %"15", label %main_bb8, label %main_bb15, !dbg !64

main_bb8:                                         ; preds = %main_bb7
  %"16" = add nsw i64 %b.0, 999, !dbg !66
  %"17" = icmp sgt i64 %"16", 2147483647, !dbg !68
  br i1 %"17", label %main_bb9, label %main_bb10, !dbg !68

main_bb9:                                         ; preds = %main_bb8
  %"18" = sub nsw i64 %"16", 2147483647, !dbg !69
  %"19" = sub nsw i64 %"18", 1, !dbg !69
  %"20" = srem i64 %"19", 4294967296, !dbg !69
  %"21" = add nsw i64 -2147483648, %"20", !dbg !69
  br label %main_wrap_around.exit2, !dbg !69

main_bb10:                                        ; preds = %main_bb8
  %"22" = icmp slt i64 %"16", -2147483648, !dbg !70
  br i1 %"22", label %main_bb11, label %main_wrap_around.exit2, !dbg !70

main_bb11:                                        ; preds = %main_bb10
  %"23" = sub nsw i64 -2147483648, %"16", !dbg !71
  %"24" = sub nsw i64 %"23", 1, !dbg !71
  %"25" = srem i64 %"24", 4294967296, !dbg !71
  %"26" = sub nsw i64 2147483647, %"25", !dbg !71
  br label %main_wrap_around.exit2, !dbg !71

main_wrap_around.exit2:                           ; preds = %main_bb9, %main_bb10, %main_bb11
  %.0.i1 = phi i64 [ %"21", %main_bb9 ], [ %"26", %main_bb11 ], [ %"16", %main_bb10 ], !dbg !66
  %"27" = sub nsw i64 6, 4, !dbg !72
  %"28" = icmp sgt i64 %"27", 2147483647, !dbg !74
  br i1 %"28", label %main_bb12, label %main_bb13, !dbg !74

main_bb12:                                        ; preds = %main_wrap_around.exit2
  %"29" = sub nsw i64 %"27", 2147483647, !dbg !75
  %"30" = sub nsw i64 %"29", 1, !dbg !75
  %"31" = srem i64 %"30", 4294967296, !dbg !75
  %"32" = add nsw i64 -2147483648, %"31", !dbg !75
  br label %main_wrap_around.exit, !dbg !75

main_bb13:                                        ; preds = %main_wrap_around.exit2
  %"33" = icmp slt i64 %"27", -2147483648, !dbg !76
  br i1 %"33", label %main_bb14, label %main_wrap_around.exit, !dbg !76

main_bb14:                                        ; preds = %main_bb13
  %"34" = sub nsw i64 -2147483648, %"27", !dbg !77
  %"35" = sub nsw i64 %"34", 1, !dbg !77
  %"36" = srem i64 %"35", 4294967296, !dbg !77
  %"37" = sub nsw i64 2147483647, %"36", !dbg !77
  br label %main_wrap_around.exit, !dbg !77

main_wrap_around.exit:                            ; preds = %main_bb12, %main_bb13, %main_bb14
  %.0.i = phi i64 [ %"32", %main_bb12 ], [ %"37", %main_bb14 ], [ %"27", %main_bb13 ], !dbg !72
  %"38" = icmp sge i64 %.0.i1, %.0.i, !dbg !72
  br i1 %"38", label %main_bb15, label %main_bb7, !dbg !72

main_bb15:                                        ; preds = %main_bb7, %main_wrap_around.exit, %main_bb6
  ret void, !dbg !78
}

declare i64 @__kittel_nondef.0()

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!15, !16}
!llvm.ident = !{!17}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [//FILES_DIR/SourceCode_SemanticAugmentor.c] [DW_LANG_C99]
!1 = metadata !{metadata !"FILES_DIR/SourceCode_SemanticAugmentor.c", metadata !"/"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9, metadata !12}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"wrap_around", metadata !"wrap_around", metadata !"", i32 4, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i64, i64, i64)* @wrap_around, null, null, metadata !2, i32 4} ; [ DW_TAG_subprogram ] [line 4] [def] [wrap_around]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"ff_subtitles_next_line_slice_1", metadata !"ff_subtitles_next_line_slice_1", metadata !"", i32 14, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 ()* @ff_subtitles_next_line_slice_1, null, null, metadata !2, i32 15} ; [ DW_TAG_subprogram ] [line 14] [def] [scope 15] [ff_subtitles_next_line_slice_1]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !8}
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 23, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @main, null, null, metadata !2, i32 24} ; [ DW_TAG_subprogram ] [line 23] [def] [scope 24] [main]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{null}
!15 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!16 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!17 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!18 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777220, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 4]
!19 = metadata !{i32 4, i32 33, metadata !4, null}
!20 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554436, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [lower_bound] [line 4]
!21 = metadata !{i32 4, i32 50, metadata !4, null}
!22 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331652, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [upper_bound] [line 4]
!23 = metadata !{i32 4, i32 73, metadata !4, null}
!24 = metadata !{i32 5, i32 5, metadata !4, null}
!25 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 5, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [range] [line 5]
!26 = metadata !{i32 5, i32 15, metadata !4, null}
!27 = metadata !{i32 6, i32 9, metadata !28, null}
!28 = metadata !{i32 786443, metadata !1, metadata !4, i32 6, i32 9, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!29 = metadata !{i32 7, i32 9, metadata !30, null}
!30 = metadata !{i32 786443, metadata !1, metadata !28, i32 6, i32 30, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!31 = metadata !{i32 9, i32 14, metadata !32, null}
!32 = metadata !{i32 786443, metadata !1, metadata !28, i32 9, i32 14, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!33 = metadata !{i32 10, i32 9, metadata !34, null}
!34 = metadata !{i32 786443, metadata !1, metadata !32, i32 9, i32 35, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!35 = metadata !{i32 13, i32 1, metadata !4, null}
!36 = metadata !{i64 999}
!37 = metadata !{i32 786688, metadata !9, metadata !"i", metadata !5, i32 17, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 17]
!38 = metadata !{i32 17, i32 13, metadata !9, null}
!39 = metadata !{i32 18, i32 7, metadata !9, null}
!40 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777220, metadata !8, i32 0, metadata !39} ; [ DW_TAG_arg_variable ] [value] [line 4]
!41 = metadata !{i32 4, i32 33, metadata !4, metadata !39}
!42 = metadata !{i64 -2147483648}
!43 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554436, metadata !8, i32 0, metadata !39} ; [ DW_TAG_arg_variable ] [lower_bound] [line 4]
!44 = metadata !{i32 4, i32 50, metadata !4, metadata !39}
!45 = metadata !{i64 2147483647}
!46 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331652, metadata !8, i32 0, metadata !39} ; [ DW_TAG_arg_variable ] [upper_bound] [line 4]
!47 = metadata !{i32 4, i32 73, metadata !4, metadata !39}
!48 = metadata !{i64 4294967296}
!49 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 5, metadata !8, i32 0, metadata !39} ; [ DW_TAG_auto_variable ] [range] [line 5]
!50 = metadata !{i32 5, i32 15, metadata !4, metadata !39}
!51 = metadata !{i32 786688, metadata !9, metadata !"__retres", metadata !5, i32 16, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__retres] [line 16]
!52 = metadata !{i32 16, i32 13, metadata !9, null}
!53 = metadata !{i32 20, i32 3, metadata !9, null}
!54 = metadata !{i64 2}
!55 = metadata !{i32 786688, metadata !12, metadata !"b", metadata !5, i32 26, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 26]
!56 = metadata !{i32 26, i32 13, metadata !12, null}
!57 = metadata !{i64 6}
!58 = metadata !{i32 786688, metadata !12, metadata !"end", metadata !5, i32 27, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [end] [line 27]
!59 = metadata !{i32 27, i32 13, metadata !12, null}
!60 = metadata !{i32 28, i32 7, metadata !61, null}
!61 = metadata !{i32 786443, metadata !1, metadata !12, i32 28, i32 7, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!62 = metadata !{i32 32, i32 9, metadata !63, null}
!63 = metadata !{i32 786443, metadata !1, metadata !61, i32 32, i32 9, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!64 = metadata !{i32 35, i32 3, metadata !65, null}
!65 = metadata !{i32 786443, metadata !1, metadata !12, i32 35, i32 3, i32 1, i32 11} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!66 = metadata !{i32 37, i32 9, metadata !67, null}
!67 = metadata !{i32 786443, metadata !1, metadata !12, i32 35, i32 19, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!68 = metadata !{i32 6, i32 9, metadata !28, metadata !66}
!69 = metadata !{i32 7, i32 9, metadata !30, metadata !66}
!70 = metadata !{i32 9, i32 14, metadata !32, metadata !66}
!71 = metadata !{i32 10, i32 9, metadata !34, metadata !66}
!72 = metadata !{i32 38, i32 14, metadata !73, null}
!73 = metadata !{i32 786443, metadata !1, metadata !67, i32 38, i32 9, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!74 = metadata !{i32 6, i32 9, metadata !28, metadata !72}
!75 = metadata !{i32 7, i32 9, metadata !30, metadata !72}
!76 = metadata !{i32 9, i32 14, metadata !32, metadata !72}
!77 = metadata !{i32 10, i32 9, metadata !34, metadata !72}
!78 = metadata !{i32 43, i32 17, metadata !12, null}

