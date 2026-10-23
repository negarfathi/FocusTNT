; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@"'flag" = global i64 0, align 8

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
define i64 @ff_subtitles_next_line_slice_1() #0 {
ff_subtitles_next_line_slice_1_bb5:
  %"12" = load i64* @"'flag", align 8, !dbg !38
  %"13" = icmp eq i64 %"12", 1, !dbg !38
  br i1 %"13", label %ff_subtitles_next_line_slice_1_bb7, label %ff_subtitles_next_line_slice_1_bb6, !dbg !38

ff_subtitles_next_line_slice_1_bb6:               ; preds = %ff_subtitles_next_line_slice_1_bb5
  store i64 1, i64* @"'flag", align 8, !dbg !40
  call void @llvm.dbg.value(metadata !41, i64 0, metadata !42), !dbg !43
  br label %ff_subtitles_next_line_slice_1_bb7, !dbg !44

ff_subtitles_next_line_slice_1_bb7:               ; preds = %ff_subtitles_next_line_slice_1_bb5, %ff_subtitles_next_line_slice_1_bb6
  ret i64 0, !dbg !45
}

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb8:
  call void @llvm.dbg.value(metadata !46, i64 0, metadata !47), !dbg !48
  call void @llvm.dbg.value(metadata !49, i64 0, metadata !50), !dbg !51
  %"14" = icmp slt i64 2, 0, !dbg !52
  %"15" = icmp slt i64 10, 0, !dbg !54
  %or.cond = or i1 %"14", %"15", !dbg !52
  br i1 %or.cond, label %main_bb18, label %main_bb9, !dbg !52

main_bb9:                                         ; preds = %main_bb8, %main_wrap_around.exit
  %b.0 = phi i64 [ %.0.i1, %main_wrap_around.exit ], [ 2, %main_bb8 ]
  %"16" = icmp slt i64 %b.0, 10, !dbg !56
  br i1 %"16", label %main_bb10, label %main_bb18, !dbg !56

main_bb10:                                        ; preds = %main_bb9
  %"17" = load i64* @"'flag", align 8, !dbg !58
  %"18" = icmp eq i64 %"17", 1, !dbg !58
  br i1 %"18", label %main_ff_subtitles_next_line_slice_1.exit, label %main_bb11, !dbg !58

main_bb11:                                        ; preds = %main_bb10
  store i64 1, i64* @"'flag", align 8, !dbg !61
  br label %main_ff_subtitles_next_line_slice_1.exit, !dbg !62

main_ff_subtitles_next_line_slice_1.exit:         ; preds = %main_bb10, %main_bb11
  %"19" = add nsw i64 %b.0, 0, !dbg !63
  %"20" = icmp sgt i64 %"19", 2147483647, !dbg !64
  br i1 %"20", label %main_bb12, label %main_bb13, !dbg !64

main_bb12:                                        ; preds = %main_ff_subtitles_next_line_slice_1.exit
  %"21" = sub nsw i64 %"19", 2147483647, !dbg !65
  %"22" = sub nsw i64 %"21", 1, !dbg !65
  %"23" = srem i64 %"22", 4294967296, !dbg !65
  %"24" = add nsw i64 -2147483648, %"23", !dbg !65
  br label %main_wrap_around.exit2, !dbg !65

main_bb13:                                        ; preds = %main_ff_subtitles_next_line_slice_1.exit
  %"25" = icmp slt i64 %"19", -2147483648, !dbg !66
  br i1 %"25", label %main_bb14, label %main_wrap_around.exit2, !dbg !66

main_bb14:                                        ; preds = %main_bb13
  %"26" = sub nsw i64 -2147483648, %"19", !dbg !67
  %"27" = sub nsw i64 %"26", 1, !dbg !67
  %"28" = srem i64 %"27", 4294967296, !dbg !67
  %"29" = sub nsw i64 2147483647, %"28", !dbg !67
  br label %main_wrap_around.exit2, !dbg !67

main_wrap_around.exit2:                           ; preds = %main_bb12, %main_bb13, %main_bb14
  %.0.i1 = phi i64 [ %"24", %main_bb12 ], [ %"29", %main_bb14 ], [ %"19", %main_bb13 ], !dbg !63
  %"30" = sub nsw i64 10, 4, !dbg !68
  %"31" = icmp sgt i64 %"30", 2147483647, !dbg !70
  br i1 %"31", label %main_bb15, label %main_bb16, !dbg !70

main_bb15:                                        ; preds = %main_wrap_around.exit2
  %"32" = sub nsw i64 %"30", 2147483647, !dbg !71
  %"33" = sub nsw i64 %"32", 1, !dbg !71
  %"34" = srem i64 %"33", 4294967296, !dbg !71
  %"35" = add nsw i64 -2147483648, %"34", !dbg !71
  br label %main_wrap_around.exit, !dbg !71

main_bb16:                                        ; preds = %main_wrap_around.exit2
  %"36" = icmp slt i64 %"30", -2147483648, !dbg !72
  br i1 %"36", label %main_bb17, label %main_wrap_around.exit, !dbg !72

main_bb17:                                        ; preds = %main_bb16
  %"37" = sub nsw i64 -2147483648, %"30", !dbg !73
  %"38" = sub nsw i64 %"37", 1, !dbg !73
  %"39" = srem i64 %"38", 4294967296, !dbg !73
  %"40" = sub nsw i64 2147483647, %"39", !dbg !73
  br label %main_wrap_around.exit, !dbg !73

main_wrap_around.exit:                            ; preds = %main_bb15, %main_bb16, %main_bb17
  %.0.i = phi i64 [ %"35", %main_bb15 ], [ %"40", %main_bb17 ], [ %"30", %main_bb16 ], !dbg !68
  %"41" = icmp sge i64 %.0.i1, %.0.i, !dbg !68
  br i1 %"41", label %main_bb18, label %main_bb9, !dbg !68

main_bb18:                                        ; preds = %main_bb9, %main_wrap_around.exit, %main_bb8
  ret void, !dbg !74
}

declare i64 @__kittel_nondef.0()

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!17, !18}
!llvm.ident = !{!19}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !15, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [//FILES_DIR/SourceCode_SemanticAugmentor.c] [DW_LANG_C99]
!1 = metadata !{metadata !"FILES_DIR/SourceCode_SemanticAugmentor.c", metadata !"/"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9, metadata !12}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"wrap_around", metadata !"wrap_around", metadata !"", i32 5, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i64, i64, i64)* @wrap_around, null, null, metadata !2, i32 5} ; [ DW_TAG_subprogram ] [line 5] [def] [wrap_around]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"ff_subtitles_next_line_slice_1", metadata !"ff_subtitles_next_line_slice_1", metadata !"", i32 15, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 ()* @ff_subtitles_next_line_slice_1, null, null, metadata !2, i32 16} ; [ DW_TAG_subprogram ] [line 15] [def] [scope 16] [ff_subtitles_next_line_slice_1]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !8}
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 27, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @main, null, null, metadata !2, i32 28} ; [ DW_TAG_subprogram ] [line 27] [def] [scope 28] [main]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{null}
!15 = metadata !{metadata !16}
!16 = metadata !{i32 786484, i32 0, null, metadata !"flag", metadata !"flag", metadata !"", metadata !5, i32 4, metadata !8, i32 0, i32 1, i64* @"'flag", null} ; [ DW_TAG_variable ] [flag] [line 4] [def]
!17 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!18 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!19 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!20 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777221, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 5]
!21 = metadata !{i32 5, i32 33, metadata !4, null}
!22 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554437, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [lower_bound] [line 5]
!23 = metadata !{i32 5, i32 50, metadata !4, null}
!24 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331653, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [upper_bound] [line 5]
!25 = metadata !{i32 5, i32 73, metadata !4, null}
!26 = metadata !{i32 6, i32 5, metadata !4, null}
!27 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 6, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [range] [line 6]
!28 = metadata !{i32 6, i32 15, metadata !4, null}
!29 = metadata !{i32 7, i32 9, metadata !30, null}
!30 = metadata !{i32 786443, metadata !1, metadata !4, i32 7, i32 9, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!31 = metadata !{i32 8, i32 9, metadata !32, null} ; [ DW_TAG_imported_declaration ]
!32 = metadata !{i32 786443, metadata !1, metadata !30, i32 7, i32 30, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!33 = metadata !{i32 10, i32 14, metadata !34, null}
!34 = metadata !{i32 786443, metadata !1, metadata !30, i32 10, i32 14, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!35 = metadata !{i32 11, i32 9, metadata !36, null}
!36 = metadata !{i32 786443, metadata !1, metadata !34, i32 10, i32 35, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!37 = metadata !{i32 14, i32 1, metadata !4, null}
!38 = metadata !{i32 18, i32 7, metadata !39, null}
!39 = metadata !{i32 786443, metadata !1, metadata !9, i32 18, i32 7, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!40 = metadata !{i32 22, i32 3, metadata !9, null}
!41 = metadata !{i64 0}
!42 = metadata !{i32 786688, metadata !9, metadata !"__retres", metadata !5, i32 17, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__retres] [line 17]
!43 = metadata !{i32 17, i32 13, metadata !9, null}
!44 = metadata !{i32 23, i32 3, metadata !9, null}
!45 = metadata !{i32 24, i32 17, metadata !9, null}
!46 = metadata !{i64 2}
!47 = metadata !{i32 786688, metadata !12, metadata !"b", metadata !5, i32 29, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 29]
!48 = metadata !{i32 29, i32 13, metadata !12, null}
!49 = metadata !{i64 10}
!50 = metadata !{i32 786688, metadata !12, metadata !"end", metadata !5, i32 30, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [end] [line 30]
!51 = metadata !{i32 30, i32 13, metadata !12, null}
!52 = metadata !{i32 31, i32 7, metadata !53, null}
!53 = metadata !{i32 786443, metadata !1, metadata !12, i32 31, i32 7, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!54 = metadata !{i32 35, i32 9, metadata !55, null}
!55 = metadata !{i32 786443, metadata !1, metadata !53, i32 35, i32 9, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!56 = metadata !{i32 38, i32 3, metadata !57, null}
!57 = metadata !{i32 786443, metadata !1, metadata !12, i32 38, i32 3, i32 1, i32 13} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!58 = metadata !{i32 18, i32 7, metadata !39, metadata !59}
!59 = metadata !{i32 40, i32 11, metadata !60, null}
!60 = metadata !{i32 786443, metadata !1, metadata !12, i32 38, i32 19, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!61 = metadata !{i32 22, i32 3, metadata !9, metadata !59}
!62 = metadata !{i32 23, i32 3, metadata !9, metadata !59}
!63 = metadata !{i32 41, i32 9, metadata !60, null}
!64 = metadata !{i32 7, i32 9, metadata !30, metadata !63}
!65 = metadata !{i32 8, i32 9, metadata !32, metadata !63} ; [ DW_TAG_imported_declaration ]
!66 = metadata !{i32 10, i32 14, metadata !34, metadata !63}
!67 = metadata !{i32 11, i32 9, metadata !36, metadata !63}
!68 = metadata !{i32 42, i32 14, metadata !69, null}
!69 = metadata !{i32 786443, metadata !1, metadata !60, i32 42, i32 9, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!70 = metadata !{i32 7, i32 9, metadata !30, metadata !68}
!71 = metadata !{i32 8, i32 9, metadata !32, metadata !68} ; [ DW_TAG_imported_declaration ]
!72 = metadata !{i32 10, i32 14, metadata !34, metadata !68}
!73 = metadata !{i32 11, i32 9, metadata !36, metadata !68}
!74 = metadata !{i32 46, i32 17, metadata !12, null}

