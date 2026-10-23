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
define i64 @mdb_cursor_get_slice_1() #0 {
mdb_cursor_get_slice_1_bb5:
  %"12" = load i64* @"'flag", align 8, !dbg !38
  %"13" = add nsw i64 %"12", 1, !dbg !38
  call void @llvm.dbg.value(metadata !{i64 %"13"}, i64 0, metadata !39), !dbg !40
  call void @llvm.dbg.value(metadata !41, i64 0, metadata !42), !dbg !43
  call void @llvm.dbg.value(metadata !44, i64 0, metadata !45), !dbg !46
  call void @llvm.dbg.value(metadata !47, i64 0, metadata !48), !dbg !49
  %"14" = icmp sgt i64 %"13", 2147483647, !dbg !50
  br i1 %"14", label %mdb_cursor_get_slice_1_bb6, label %mdb_cursor_get_slice_1_bb7, !dbg !50

mdb_cursor_get_slice_1_bb6:                       ; preds = %mdb_cursor_get_slice_1_bb5
  %"15" = sub nsw i64 %"13", 2147483647, !dbg !51
  %"16" = sub nsw i64 %"15", 1, !dbg !51
  %"17" = srem i64 %"16", 4294967296, !dbg !51
  %"18" = add nsw i64 -2147483648, %"17", !dbg !51
  br label %mdb_cursor_get_slice_1_wrap_around.exit, !dbg !51

mdb_cursor_get_slice_1_bb7:                       ; preds = %mdb_cursor_get_slice_1_bb5
  %"19" = icmp slt i64 %"13", -2147483648, !dbg !52
  br i1 %"19", label %mdb_cursor_get_slice_1_bb8, label %mdb_cursor_get_slice_1_wrap_around.exit, !dbg !52

mdb_cursor_get_slice_1_bb8:                       ; preds = %mdb_cursor_get_slice_1_bb7
  %"20" = sub nsw i64 -2147483648, %"13", !dbg !53
  %"21" = sub nsw i64 %"20", 1, !dbg !53
  %"22" = srem i64 %"21", 4294967296, !dbg !53
  %"23" = sub nsw i64 2147483647, %"22", !dbg !53
  br label %mdb_cursor_get_slice_1_wrap_around.exit, !dbg !53

mdb_cursor_get_slice_1_wrap_around.exit:          ; preds = %mdb_cursor_get_slice_1_bb6, %mdb_cursor_get_slice_1_bb7, %mdb_cursor_get_slice_1_bb8
  %.0.i = phi i64 [ %"18", %mdb_cursor_get_slice_1_bb6 ], [ %"23", %mdb_cursor_get_slice_1_bb8 ], [ %"13", %mdb_cursor_get_slice_1_bb7 ], !dbg !38
  store i64 %.0.i, i64* @"'flag", align 8, !dbg !38
  %"24" = load i64* @"'flag", align 8, !dbg !54
  %"25" = icmp sgt i64 %"24", 1000, !dbg !54
  %. = select i1 %"25", i64 1, i64 0, !dbg !56
  ret i64 %., !dbg !58
}

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb9:
  %"26" = load i64* @"'flag", align 8, !dbg !59
  %"27" = add nsw i64 %"26", 1, !dbg !59
  call void @llvm.dbg.value(metadata !{i64 %"27"}, i64 0, metadata !61), !dbg !62
  call void @llvm.dbg.value(metadata !41, i64 0, metadata !63), !dbg !64
  call void @llvm.dbg.value(metadata !44, i64 0, metadata !65), !dbg !66
  call void @llvm.dbg.value(metadata !47, i64 0, metadata !67), !dbg !68
  %"28" = icmp sgt i64 %"27", 2147483647, !dbg !69
  br i1 %"28", label %main_bb10, label %main_bb11, !dbg !69

main_bb10:                                        ; preds = %main_bb9
  %"29" = sub nsw i64 %"27", 2147483647, !dbg !70
  %"30" = sub nsw i64 %"29", 1, !dbg !70
  %"31" = srem i64 %"30", 4294967296, !dbg !70
  %"32" = add nsw i64 -2147483648, %"31", !dbg !70
  br label %main_mdb_cursor_get_slice_1.exit, !dbg !70

main_bb11:                                        ; preds = %main_bb9
  %"33" = icmp slt i64 %"27", -2147483648, !dbg !71
  br i1 %"33", label %main_bb12, label %main_mdb_cursor_get_slice_1.exit, !dbg !71

main_bb12:                                        ; preds = %main_bb11
  %"34" = sub nsw i64 -2147483648, %"27", !dbg !72
  %"35" = sub nsw i64 %"34", 1, !dbg !72
  %"36" = srem i64 %"35", 4294967296, !dbg !72
  %"37" = sub nsw i64 2147483647, %"36", !dbg !72
  br label %main_mdb_cursor_get_slice_1.exit, !dbg !72

main_mdb_cursor_get_slice_1.exit:                 ; preds = %main_bb10, %main_bb11, %main_bb12
  %.0.i.i = phi i64 [ %"32", %main_bb10 ], [ %"37", %main_bb12 ], [ %"27", %main_bb11 ], !dbg !59
  store i64 %.0.i.i, i64* @"'flag", align 8, !dbg !59
  %"38" = load i64* @"'flag", align 8, !dbg !73
  call void @llvm.dbg.value(metadata !{i64 %..i}, i64 0, metadata !74), !dbg !75
  call void @llvm.dbg.value(metadata !{i64 %"42"}, i64 0, metadata !76), !dbg !80
  call void @llvm.dbg.value(metadata !41, i64 0, metadata !81), !dbg !82
  call void @llvm.dbg.value(metadata !44, i64 0, metadata !83), !dbg !84
  call void @llvm.dbg.value(metadata !47, i64 0, metadata !85), !dbg !86
  br label %main_bb13, !dbg !87

main_bb13:                                        ; preds = %main_mdb_cursor_get_slice_1.exit3, %main_mdb_cursor_get_slice_1.exit
  %.sink4 = phi i64 [ %"38", %main_mdb_cursor_get_slice_1.exit ], [ %"53", %main_mdb_cursor_get_slice_1.exit3 ]
  %"39" = icmp sgt i64 %.sink4, 1000, !dbg !73
  %..i = select i1 %"39", i64 1, i64 0, !dbg !88
  %"40" = icmp eq i64 %..i, 0, !dbg !89
  br i1 %"40", label %main_bb14, label %main_bb18, !dbg !89

main_bb14:                                        ; preds = %main_bb13
  %"41" = load i64* @"'flag", align 8, !dbg !77
  %"42" = add nsw i64 %"41", 1, !dbg !77
  %"43" = icmp sgt i64 %"42", 2147483647, !dbg !91
  br i1 %"43", label %main_bb15, label %main_bb16, !dbg !91

main_bb15:                                        ; preds = %main_bb14
  %"44" = sub nsw i64 %"42", 2147483647, !dbg !92
  %"45" = sub nsw i64 %"44", 1, !dbg !92
  %"46" = srem i64 %"45", 4294967296, !dbg !92
  %"47" = add nsw i64 -2147483648, %"46", !dbg !92
  br label %main_mdb_cursor_get_slice_1.exit3, !dbg !92

main_bb16:                                        ; preds = %main_bb14
  %"48" = icmp slt i64 %"42", -2147483648, !dbg !93
  br i1 %"48", label %main_bb17, label %main_mdb_cursor_get_slice_1.exit3, !dbg !93

main_bb17:                                        ; preds = %main_bb16
  %"49" = sub nsw i64 -2147483648, %"42", !dbg !94
  %"50" = sub nsw i64 %"49", 1, !dbg !94
  %"51" = srem i64 %"50", 4294967296, !dbg !94
  %"52" = sub nsw i64 2147483647, %"51", !dbg !94
  br label %main_mdb_cursor_get_slice_1.exit3, !dbg !94

main_mdb_cursor_get_slice_1.exit3:                ; preds = %main_bb15, %main_bb16, %main_bb17
  %.0.i.i1 = phi i64 [ %"47", %main_bb15 ], [ %"52", %main_bb17 ], [ %"42", %main_bb16 ], !dbg !77
  store i64 %.0.i.i1, i64* @"'flag", align 8, !dbg !77
  %"53" = load i64* @"'flag", align 8, !dbg !95
  br label %main_bb13, !dbg !96

main_bb18:                                        ; preds = %main_bb13
  ret void, !dbg !97
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
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"mdb_cursor_get_slice_1", metadata !"mdb_cursor_get_slice_1", metadata !"", i32 15, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 ()* @mdb_cursor_get_slice_1, null, null, metadata !2, i32 16} ; [ DW_TAG_subprogram ] [line 15] [def] [scope 16] [mdb_cursor_get_slice_1]
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
!38 = metadata !{i32 18, i32 11, metadata !9, null}
!39 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777221, metadata !8, i32 0, metadata !38} ; [ DW_TAG_arg_variable ] [value] [line 5]
!40 = metadata !{i32 5, i32 33, metadata !4, metadata !38}
!41 = metadata !{i64 -2147483648}
!42 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554437, metadata !8, i32 0, metadata !38} ; [ DW_TAG_arg_variable ] [lower_bound] [line 5]
!43 = metadata !{i32 5, i32 50, metadata !4, metadata !38}
!44 = metadata !{i64 2147483647}
!45 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331653, metadata !8, i32 0, metadata !38} ; [ DW_TAG_arg_variable ] [upper_bound] [line 5]
!46 = metadata !{i32 5, i32 73, metadata !4, metadata !38}
!47 = metadata !{i64 4294967296}
!48 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 6, metadata !8, i32 0, metadata !38} ; [ DW_TAG_auto_variable ] [range] [line 6]
!49 = metadata !{i32 6, i32 15, metadata !4, metadata !38}
!50 = metadata !{i32 7, i32 9, metadata !30, metadata !38}
!51 = metadata !{i32 8, i32 9, metadata !32, metadata !38} ; [ DW_TAG_imported_declaration ]
!52 = metadata !{i32 10, i32 14, metadata !34, metadata !38}
!53 = metadata !{i32 11, i32 9, metadata !36, metadata !38}
!54 = metadata !{i32 19, i32 7, metadata !55, null}
!55 = metadata !{i32 786443, metadata !1, metadata !9, i32 19, i32 7, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!56 = metadata !{i32 21, i32 5, metadata !57, null}
!57 = metadata !{i32 786443, metadata !1, metadata !55, i32 19, i32 20, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!58 = metadata !{i32 24, i32 17, metadata !9, null}
!59 = metadata !{i32 18, i32 11, metadata !9, metadata !60}
!60 = metadata !{i32 30, i32 8, metadata !12, null}
!61 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777221, metadata !8, i32 0, metadata !59} ; [ DW_TAG_arg_variable ] [value] [line 5]
!62 = metadata !{i32 5, i32 33, metadata !4, metadata !59}
!63 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554437, metadata !8, i32 0, metadata !59} ; [ DW_TAG_arg_variable ] [lower_bound] [line 5]
!64 = metadata !{i32 5, i32 50, metadata !4, metadata !59}
!65 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331653, metadata !8, i32 0, metadata !59} ; [ DW_TAG_arg_variable ] [upper_bound] [line 5]
!66 = metadata !{i32 5, i32 73, metadata !4, metadata !59}
!67 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 6, metadata !8, i32 0, metadata !59} ; [ DW_TAG_auto_variable ] [range] [line 6]
!68 = metadata !{i32 6, i32 15, metadata !4, metadata !59}
!69 = metadata !{i32 7, i32 9, metadata !30, metadata !59}
!70 = metadata !{i32 8, i32 9, metadata !32, metadata !59} ; [ DW_TAG_imported_declaration ]
!71 = metadata !{i32 10, i32 14, metadata !34, metadata !59}
!72 = metadata !{i32 11, i32 9, metadata !36, metadata !59}
!73 = metadata !{i32 19, i32 7, metadata !55, metadata !60}
!74 = metadata !{i32 786688, metadata !12, metadata !"rc", metadata !5, i32 29, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rc] [line 29]
!75 = metadata !{i32 29, i32 13, metadata !12, null}
!76 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777221, metadata !8, i32 0, metadata !77} ; [ DW_TAG_arg_variable ] [value] [line 5]
!77 = metadata !{i32 18, i32 11, metadata !9, metadata !78}
!78 = metadata !{i32 32, i32 8, metadata !79, null}
!79 = metadata !{i32 786443, metadata !1, metadata !12, i32 32, i32 1, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!80 = metadata !{i32 5, i32 33, metadata !4, metadata !77}
!81 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554437, metadata !8, i32 0, metadata !77} ; [ DW_TAG_arg_variable ] [lower_bound] [line 5]
!82 = metadata !{i32 5, i32 50, metadata !4, metadata !77}
!83 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331653, metadata !8, i32 0, metadata !77} ; [ DW_TAG_arg_variable ] [upper_bound] [line 5]
!84 = metadata !{i32 5, i32 73, metadata !4, metadata !77}
!85 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 6, metadata !8, i32 0, metadata !77} ; [ DW_TAG_auto_variable ] [range] [line 6]
!86 = metadata !{i32 6, i32 15, metadata !4, metadata !77}
!87 = metadata !{i32 31, i32 3, metadata !12, null}
!88 = metadata !{i32 21, i32 5, metadata !57, metadata !60}
!89 = metadata !{i32 31, i32 3, metadata !90, null}
!90 = metadata !{i32 786443, metadata !1, metadata !12, i32 31, i32 3, i32 1, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!91 = metadata !{i32 7, i32 9, metadata !30, metadata !77}
!92 = metadata !{i32 8, i32 9, metadata !32, metadata !77} ; [ DW_TAG_imported_declaration ]
!93 = metadata !{i32 10, i32 14, metadata !34, metadata !77}
!94 = metadata !{i32 11, i32 9, metadata !36, metadata !77}
!95 = metadata !{i32 19, i32 7, metadata !55, metadata !78}
!96 = metadata !{i32 33, i32 1, metadata !79, null}
!97 = metadata !{i32 34, i32 3, metadata !12, null}

