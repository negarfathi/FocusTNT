; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@"'flag" = global i64 0, align 8

; Function Attrs: nounwind uwtable
define i64 @wrap_around(i64 %value, i64 %lower_bound, i64 %upper_bound) #0 {
wrap_around_bb0:
  call void @llvm.dbg.value(metadata !{i64 %value}, i64 0, metadata !21), !dbg !22
  call void @llvm.dbg.value(metadata !{i64 %lower_bound}, i64 0, metadata !23), !dbg !24
  call void @llvm.dbg.value(metadata !{i64 %upper_bound}, i64 0, metadata !25), !dbg !26
  %"0" = sub nsw i64 %upper_bound, %lower_bound, !dbg !27
  %"1" = add nsw i64 %"0", 1, !dbg !27
  call void @llvm.dbg.value(metadata !{i64 %"1"}, i64 0, metadata !28), !dbg !29
  %"2" = icmp sgt i64 %value, %upper_bound, !dbg !30
  br i1 %"2", label %wrap_around_bb1, label %wrap_around_bb2, !dbg !30

wrap_around_bb1:                                  ; preds = %wrap_around_bb0
  %"3" = sub nsw i64 %value, %upper_bound, !dbg !32
  %"4" = sub nsw i64 %"3", 1, !dbg !32
  %"5" = srem i64 %"4", %"1", !dbg !32
  %"6" = add nsw i64 %lower_bound, %"5", !dbg !32
  br label %wrap_around_bb4, !dbg !32

wrap_around_bb2:                                  ; preds = %wrap_around_bb0
  %"7" = icmp slt i64 %value, %lower_bound, !dbg !34
  br i1 %"7", label %wrap_around_bb3, label %wrap_around_bb4, !dbg !34

wrap_around_bb3:                                  ; preds = %wrap_around_bb2
  %"8" = sub nsw i64 %lower_bound, %value, !dbg !36
  %"9" = sub nsw i64 %"8", 1, !dbg !36
  %"10" = srem i64 %"9", %"1", !dbg !36
  %"11" = sub nsw i64 %upper_bound, %"10", !dbg !36
  br label %wrap_around_bb4, !dbg !36

wrap_around_bb4:                                  ; preds = %wrap_around_bb2, %wrap_around_bb3, %wrap_around_bb1
  %.0 = phi i64 [ %"6", %wrap_around_bb1 ], [ %"11", %wrap_around_bb3 ], [ %value, %wrap_around_bb2 ]
  ret i64 %.0, !dbg !38
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i64 @mdb_cursor_get() #0 {
mdb_cursor_get_bb5:
  call void @llvm.dbg.value(metadata !39, i64 0, metadata !40), !dbg !41
  %"12" = load i64* @"'flag", align 8, !dbg !42
  %"13" = add nsw i64 %"12", 1, !dbg !42
  call void @llvm.dbg.value(metadata !{i64 %"13"}, i64 0, metadata !43), !dbg !44
  call void @llvm.dbg.value(metadata !45, i64 0, metadata !46), !dbg !47
  call void @llvm.dbg.value(metadata !48, i64 0, metadata !49), !dbg !50
  call void @llvm.dbg.value(metadata !51, i64 0, metadata !52), !dbg !53
  %"14" = icmp sgt i64 %"13", 2147483647, !dbg !54
  br i1 %"14", label %mdb_cursor_get_bb6, label %mdb_cursor_get_bb7, !dbg !54

mdb_cursor_get_bb6:                               ; preds = %mdb_cursor_get_bb5
  %"15" = sub nsw i64 %"13", 2147483647, !dbg !55
  %"16" = sub nsw i64 %"15", 1, !dbg !55
  %"17" = srem i64 %"16", 4294967296, !dbg !55
  %"18" = add nsw i64 -2147483648, %"17", !dbg !55
  br label %mdb_cursor_get_wrap_around.exit, !dbg !55

mdb_cursor_get_bb7:                               ; preds = %mdb_cursor_get_bb5
  %"19" = icmp slt i64 %"13", -2147483648, !dbg !56
  br i1 %"19", label %mdb_cursor_get_bb8, label %mdb_cursor_get_wrap_around.exit, !dbg !56

mdb_cursor_get_bb8:                               ; preds = %mdb_cursor_get_bb7
  %"20" = sub nsw i64 -2147483648, %"13", !dbg !57
  %"21" = sub nsw i64 %"20", 1, !dbg !57
  %"22" = srem i64 %"21", 4294967296, !dbg !57
  %"23" = sub nsw i64 2147483647, %"22", !dbg !57
  br label %mdb_cursor_get_wrap_around.exit, !dbg !57

mdb_cursor_get_wrap_around.exit:                  ; preds = %mdb_cursor_get_bb6, %mdb_cursor_get_bb7, %mdb_cursor_get_bb8
  %.0.i = phi i64 [ %"18", %mdb_cursor_get_bb6 ], [ %"23", %mdb_cursor_get_bb8 ], [ %"13", %mdb_cursor_get_bb7 ], !dbg !42
  store i64 %.0.i, i64* @"'flag", align 8, !dbg !42
  %"24" = load i64* @"'flag", align 8, !dbg !58
  %"25" = icmp sgt i64 %"24", 1000, !dbg !58
  br i1 %"25", label %mdb_cursor_get_bb10, label %mdb_cursor_get_bb9, !dbg !58

mdb_cursor_get_bb9:                               ; preds = %mdb_cursor_get_wrap_around.exit
  %"26" = icmp sge i64 1, 0, !dbg !60
  %. = select i1 %"26", i64 0, i64 1, !dbg !62
  br label %mdb_cursor_get_bb10, !dbg !62

mdb_cursor_get_bb10:                              ; preds = %mdb_cursor_get_bb9, %mdb_cursor_get_wrap_around.exit
  %.0 = phi i64 [ 1, %mdb_cursor_get_wrap_around.exit ], [ %., %mdb_cursor_get_bb9 ]
  ret i64 %.0, !dbg !64
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
main_bb11:
  call void @llvm.dbg.value(metadata !39, i64 0, metadata !65), !dbg !67
  %"27" = load i64* @"'flag", align 8, !dbg !68
  %"28" = add nsw i64 %"27", 1, !dbg !68
  call void @llvm.dbg.value(metadata !{i64 %"28"}, i64 0, metadata !69), !dbg !70
  call void @llvm.dbg.value(metadata !45, i64 0, metadata !71), !dbg !72
  call void @llvm.dbg.value(metadata !48, i64 0, metadata !73), !dbg !74
  call void @llvm.dbg.value(metadata !51, i64 0, metadata !75), !dbg !76
  %"29" = icmp sgt i64 %"28", 2147483647, !dbg !77
  br i1 %"29", label %main_bb12, label %main_bb13, !dbg !77

main_bb12:                                        ; preds = %main_bb11
  %"30" = sub nsw i64 %"28", 2147483647, !dbg !78
  %"31" = sub nsw i64 %"30", 1, !dbg !78
  %"32" = srem i64 %"31", 4294967296, !dbg !78
  %"33" = add nsw i64 -2147483648, %"32", !dbg !78
  br label %main_wrap_around.exit.i, !dbg !78

main_bb13:                                        ; preds = %main_bb11
  %"34" = icmp slt i64 %"28", -2147483648, !dbg !79
  br i1 %"34", label %main_bb14, label %main_wrap_around.exit.i, !dbg !79

main_bb14:                                        ; preds = %main_bb13
  %"35" = sub nsw i64 -2147483648, %"28", !dbg !80
  %"36" = sub nsw i64 %"35", 1, !dbg !80
  %"37" = srem i64 %"36", 4294967296, !dbg !80
  %"38" = sub nsw i64 2147483647, %"37", !dbg !80
  br label %main_wrap_around.exit.i, !dbg !80

main_wrap_around.exit.i:                          ; preds = %main_bb14, %main_bb13, %main_bb12
  %.0.i.i = phi i64 [ %"33", %main_bb12 ], [ %"38", %main_bb14 ], [ %"28", %main_bb13 ], !dbg !68
  store i64 %.0.i.i, i64* @"'flag", align 8, !dbg !68
  %"39" = load i64* @"'flag", align 8, !dbg !81
  %"40" = icmp sgt i64 %"39", 1000, !dbg !81
  %. = select i1 %"40", i64 1, i64 0, !dbg !81
  call void @llvm.dbg.value(metadata !{i64 %.}, i64 0, metadata !82), !dbg !83
  call void @llvm.dbg.value(metadata !84, i64 0, metadata !85), !dbg !86
  call void @llvm.dbg.value(metadata !39, i64 0, metadata !87), !dbg !90
  call void @llvm.dbg.value(metadata !{i64 %"44"}, i64 0, metadata !91), !dbg !93
  call void @llvm.dbg.value(metadata !45, i64 0, metadata !94), !dbg !95
  call void @llvm.dbg.value(metadata !48, i64 0, metadata !96), !dbg !97
  call void @llvm.dbg.value(metadata !51, i64 0, metadata !98), !dbg !99
  call void @llvm.dbg.value(metadata !{i64 %.5}, i64 0, metadata !82), !dbg !83
  br label %main_bb15, !dbg !100

main_bb15:                                        ; preds = %main_bb16, %main_wrap_around.exit.i2, %main_wrap_around.exit.i
  %rc.0 = phi i64 [ %., %main_wrap_around.exit.i ], [ %.5, %main_wrap_around.exit.i2 ], [ %rc.0, %main_bb16 ]
  %"41" = icmp eq i64 %rc.0, 0, !dbg !101
  br i1 %"41", label %main_bb16, label %main_bb21, !dbg !101

main_bb16:                                        ; preds = %main_bb15
  %"42" = icmp sle i64 -1, 0, !dbg !103
  br i1 %"42", label %main_bb15, label %main_bb17, !dbg !103

main_bb17:                                        ; preds = %main_bb16
  %"43" = load i64* @"'flag", align 8, !dbg !92
  %"44" = add nsw i64 %"43", 1, !dbg !92
  %"45" = icmp sgt i64 %"44", 2147483647, !dbg !105
  br i1 %"45", label %main_bb18, label %main_bb19, !dbg !105

main_bb18:                                        ; preds = %main_bb17
  %"46" = sub nsw i64 %"44", 2147483647, !dbg !106
  %"47" = sub nsw i64 %"46", 1, !dbg !106
  %"48" = srem i64 %"47", 4294967296, !dbg !106
  %"49" = add nsw i64 -2147483648, %"48", !dbg !106
  br label %main_wrap_around.exit.i2, !dbg !106

main_bb19:                                        ; preds = %main_bb17
  %"50" = icmp slt i64 %"44", -2147483648, !dbg !107
  br i1 %"50", label %main_bb20, label %main_wrap_around.exit.i2, !dbg !107

main_bb20:                                        ; preds = %main_bb19
  %"51" = sub nsw i64 -2147483648, %"44", !dbg !108
  %"52" = sub nsw i64 %"51", 1, !dbg !108
  %"53" = srem i64 %"52", 4294967296, !dbg !108
  %"54" = sub nsw i64 2147483647, %"53", !dbg !108
  br label %main_wrap_around.exit.i2, !dbg !108

main_wrap_around.exit.i2:                         ; preds = %main_bb20, %main_bb19, %main_bb18
  %.0.i.i1 = phi i64 [ %"49", %main_bb18 ], [ %"54", %main_bb20 ], [ %"44", %main_bb19 ], !dbg !92
  store i64 %.0.i.i1, i64* @"'flag", align 8, !dbg !92
  %"55" = load i64* @"'flag", align 8, !dbg !109
  %"56" = icmp sgt i64 %"55", 1000, !dbg !109
  %.5 = select i1 %"56", i64 1, i64 0, !dbg !109
  br label %main_bb15, !dbg !110

main_bb21:                                        ; preds = %main_bb15
  ret i32 0, !dbg !111
}

declare i64 @__kittel_nondef.0()

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

declare i32 @__kittel_nondef.1()

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!18, !19}
!llvm.ident = !{!20}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !16, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [//FILES_DIR/SourceCode_SemanticAugmentor.c] [DW_LANG_C99]
!1 = metadata !{metadata !"FILES_DIR/SourceCode_SemanticAugmentor.c", metadata !"/"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9, metadata !12}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"wrap_around", metadata !"wrap_around", metadata !"", i32 12, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i64, i64, i64)* @wrap_around, null, null, metadata !2, i32 12} ; [ DW_TAG_subprogram ] [line 12] [def] [wrap_around]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"mdb_cursor_get", metadata !"mdb_cursor_get", metadata !"", i32 22, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i64 ()* @mdb_cursor_get, null, null, metadata !2, i32 23} ; [ DW_TAG_subprogram ] [line 22] [def] [scope 23] [mdb_cursor_get]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !8}
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 38, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 39} ; [ DW_TAG_subprogram ] [line 38] [def] [scope 39] [main]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{metadata !15}
!15 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!16 = metadata !{metadata !17}
!17 = metadata !{i32 786484, i32 0, null, metadata !"flag", metadata !"flag", metadata !"", metadata !5, i32 11, metadata !8, i32 0, i32 1, i64* @"'flag", null} ; [ DW_TAG_variable ] [flag] [line 11] [def]
!18 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!19 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!20 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!21 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777228, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 12]
!22 = metadata !{i32 12, i32 33, metadata !4, null}
!23 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554444, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [lower_bound] [line 12]
!24 = metadata !{i32 12, i32 50, metadata !4, null}
!25 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331660, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [upper_bound] [line 12]
!26 = metadata !{i32 12, i32 73, metadata !4, null}
!27 = metadata !{i32 13, i32 5, metadata !4, null}
!28 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 13, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [range] [line 13]
!29 = metadata !{i32 13, i32 15, metadata !4, null}
!30 = metadata !{i32 14, i32 9, metadata !31, null}
!31 = metadata !{i32 786443, metadata !1, metadata !4, i32 14, i32 9, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!32 = metadata !{i32 15, i32 9, metadata !33, null}
!33 = metadata !{i32 786443, metadata !1, metadata !31, i32 14, i32 30, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!34 = metadata !{i32 17, i32 14, metadata !35, null}
!35 = metadata !{i32 786443, metadata !1, metadata !31, i32 17, i32 14, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!36 = metadata !{i32 18, i32 9, metadata !37, null}
!37 = metadata !{i32 786443, metadata !1, metadata !35, i32 17, i32 35, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!38 = metadata !{i32 21, i32 1, metadata !4, null}
!39 = metadata !{i64 1}
!40 = metadata !{i32 786688, metadata !9, metadata !"i", metadata !5, i32 24, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 24]
!41 = metadata !{i32 24, i32 15, metadata !9, null}
!42 = metadata !{i32 25, i32 13, metadata !9, null}
!43 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777228, metadata !8, i32 0, metadata !42} ; [ DW_TAG_arg_variable ] [value] [line 12]
!44 = metadata !{i32 12, i32 33, metadata !4, metadata !42}
!45 = metadata !{i64 -2147483648}
!46 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554444, metadata !8, i32 0, metadata !42} ; [ DW_TAG_arg_variable ] [lower_bound] [line 12]
!47 = metadata !{i32 12, i32 50, metadata !4, metadata !42}
!48 = metadata !{i64 2147483647}
!49 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331660, metadata !8, i32 0, metadata !42} ; [ DW_TAG_arg_variable ] [upper_bound] [line 12]
!50 = metadata !{i32 12, i32 73, metadata !4, metadata !42}
!51 = metadata !{i64 4294967296}
!52 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 13, metadata !8, i32 0, metadata !42} ; [ DW_TAG_auto_variable ] [range] [line 13]
!53 = metadata !{i32 13, i32 15, metadata !4, metadata !42}
!54 = metadata !{i32 14, i32 9, metadata !31, metadata !42}
!55 = metadata !{i32 15, i32 9, metadata !33, metadata !42}
!56 = metadata !{i32 17, i32 14, metadata !35, metadata !42}
!57 = metadata !{i32 18, i32 9, metadata !37, metadata !42}
!58 = metadata !{i32 26, i32 9, metadata !59, null}
!59 = metadata !{i32 786443, metadata !1, metadata !9, i32 26, i32 9, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!60 = metadata !{i32 30, i32 9, metadata !61, null}
!61 = metadata !{i32 786443, metadata !1, metadata !9, i32 30, i32 9, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!62 = metadata !{i32 32, i32 9, metadata !63, null}
!63 = metadata !{i32 786443, metadata !1, metadata !61, i32 31, i32 1, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!64 = metadata !{i32 36, i32 1, metadata !9, null}
!65 = metadata !{i32 786688, metadata !9, metadata !"i", metadata !5, i32 24, metadata !8, i32 0, metadata !66} ; [ DW_TAG_auto_variable ] [i] [line 24]
!66 = metadata !{i32 41, i32 10, metadata !12, null}
!67 = metadata !{i32 24, i32 15, metadata !9, metadata !66}
!68 = metadata !{i32 25, i32 13, metadata !9, metadata !66}
!69 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777228, metadata !8, i32 0, metadata !68} ; [ DW_TAG_arg_variable ] [value] [line 12]
!70 = metadata !{i32 12, i32 33, metadata !4, metadata !68}
!71 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554444, metadata !8, i32 0, metadata !68} ; [ DW_TAG_arg_variable ] [lower_bound] [line 12]
!72 = metadata !{i32 12, i32 50, metadata !4, metadata !68}
!73 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331660, metadata !8, i32 0, metadata !68} ; [ DW_TAG_arg_variable ] [upper_bound] [line 12]
!74 = metadata !{i32 12, i32 73, metadata !4, metadata !68}
!75 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 13, metadata !8, i32 0, metadata !68} ; [ DW_TAG_auto_variable ] [range] [line 13]
!76 = metadata !{i32 13, i32 15, metadata !4, metadata !68}
!77 = metadata !{i32 14, i32 9, metadata !31, metadata !68}
!78 = metadata !{i32 15, i32 9, metadata !33, metadata !68}
!79 = metadata !{i32 17, i32 14, metadata !35, metadata !68}
!80 = metadata !{i32 18, i32 9, metadata !37, metadata !68}
!81 = metadata !{i32 26, i32 9, metadata !59, metadata !66}
!82 = metadata !{i32 786688, metadata !12, metadata !"rc", metadata !5, i32 40, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rc] [line 40]
!83 = metadata !{i32 40, i32 15, metadata !12, null}
!84 = metadata !{i64 -1}
!85 = metadata !{i32 786688, metadata !12, metadata !"dval_mv_size", metadata !5, i32 42, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dval_mv_size] [line 42]
!86 = metadata !{i32 42, i32 15, metadata !12, null}
!87 = metadata !{i32 786688, metadata !9, metadata !"i", metadata !5, i32 24, metadata !8, i32 0, metadata !88} ; [ DW_TAG_auto_variable ] [i] [line 24]
!88 = metadata !{i32 49, i32 14, metadata !89, null}
!89 = metadata !{i32 786443, metadata !1, metadata !12, i32 44, i32 5, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!90 = metadata !{i32 24, i32 15, metadata !9, metadata !88}
!91 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777228, metadata !8, i32 0, metadata !92} ; [ DW_TAG_arg_variable ] [value] [line 12]
!92 = metadata !{i32 25, i32 13, metadata !9, metadata !88}
!93 = metadata !{i32 12, i32 33, metadata !4, metadata !92}
!94 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554444, metadata !8, i32 0, metadata !92} ; [ DW_TAG_arg_variable ] [lower_bound] [line 12]
!95 = metadata !{i32 12, i32 50, metadata !4, metadata !92}
!96 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331660, metadata !8, i32 0, metadata !92} ; [ DW_TAG_arg_variable ] [upper_bound] [line 12]
!97 = metadata !{i32 12, i32 73, metadata !4, metadata !92}
!98 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 13, metadata !8, i32 0, metadata !92} ; [ DW_TAG_auto_variable ] [range] [line 13]
!99 = metadata !{i32 13, i32 15, metadata !4, metadata !92}
!100 = metadata !{i32 43, i32 5, metadata !12, null}
!101 = metadata !{i32 43, i32 5, metadata !102, null}
!102 = metadata !{i32 786443, metadata !1, metadata !12, i32 43, i32 5, i32 1, i32 11} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!103 = metadata !{i32 45, i32 13, metadata !104, null}
!104 = metadata !{i32 786443, metadata !1, metadata !89, i32 45, i32 13, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!105 = metadata !{i32 14, i32 9, metadata !31, metadata !92}
!106 = metadata !{i32 15, i32 9, metadata !33, metadata !92}
!107 = metadata !{i32 17, i32 14, metadata !35, metadata !92}
!108 = metadata !{i32 18, i32 9, metadata !37, metadata !92}
!109 = metadata !{i32 26, i32 9, metadata !59, metadata !88}
!110 = metadata !{i32 50, i32 5, metadata !89, null}
!111 = metadata !{i32 51, i32 5, metadata !12, null}

