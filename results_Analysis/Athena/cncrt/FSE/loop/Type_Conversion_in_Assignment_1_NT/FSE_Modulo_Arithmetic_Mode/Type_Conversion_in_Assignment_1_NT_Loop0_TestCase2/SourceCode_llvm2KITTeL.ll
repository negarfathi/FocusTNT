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
define i64 @fgetc() #0 {
fgetc_bb5:
  %"12" = load i64* @"'flag", align 8, !dbg !39
  %"13" = icmp sgt i64 %"12", 1000, !dbg !39
  br i1 %"13", label %fgetc_bb14, label %fgetc_bb6, !dbg !39

fgetc_bb6:                                        ; preds = %fgetc_bb5
  %"14" = load i64* @"'flag", align 8, !dbg !41
  %"15" = add nsw i64 %"14", 1, !dbg !41
  call void @llvm.dbg.value(metadata !{i64 %"15"}, i64 0, metadata !42), !dbg !43
  call void @llvm.dbg.value(metadata !44, i64 0, metadata !45), !dbg !46
  call void @llvm.dbg.value(metadata !47, i64 0, metadata !48), !dbg !49
  call void @llvm.dbg.value(metadata !50, i64 0, metadata !51), !dbg !52
  %"16" = icmp sgt i64 %"15", 2147483647, !dbg !53
  br i1 %"16", label %fgetc_bb7, label %fgetc_bb8, !dbg !53

fgetc_bb7:                                        ; preds = %fgetc_bb6
  %"17" = sub nsw i64 %"15", 2147483647, !dbg !54
  %"18" = sub nsw i64 %"17", 1, !dbg !54
  %"19" = srem i64 %"18", 4294967296, !dbg !54
  %"20" = add nsw i64 -2147483648, %"19", !dbg !54
  br label %fgetc_wrap_around.exit, !dbg !54

fgetc_bb8:                                        ; preds = %fgetc_bb6
  %"21" = icmp slt i64 %"15", -2147483648, !dbg !55
  br i1 %"21", label %fgetc_bb9, label %fgetc_wrap_around.exit, !dbg !55

fgetc_bb9:                                        ; preds = %fgetc_bb8
  %"22" = sub nsw i64 -2147483648, %"15", !dbg !56
  %"23" = sub nsw i64 %"22", 1, !dbg !56
  %"24" = srem i64 %"23", 4294967296, !dbg !56
  %"25" = sub nsw i64 2147483647, %"24", !dbg !56
  br label %fgetc_wrap_around.exit, !dbg !56

fgetc_wrap_around.exit:                           ; preds = %fgetc_bb7, %fgetc_bb8, %fgetc_bb9
  %.0.i = phi i64 [ %"20", %fgetc_bb7 ], [ %"25", %fgetc_bb9 ], [ %"15", %fgetc_bb8 ], !dbg !41
  store i64 %.0.i, i64* @"'flag", align 8, !dbg !41
  call void @llvm.dbg.value(metadata !57, i64 0, metadata !58), !dbg !59
  %"26" = icmp slt i64 256, 0, !dbg !60
  br i1 %"26", label %fgetc_bb10, label %fgetc_wrap_around.exit3, !dbg !60

fgetc_bb10:                                       ; preds = %fgetc_wrap_around.exit
  %"27" = sub nsw i64 0, 256, !dbg !62
  call void @llvm.dbg.value(metadata !{i64 %"27"}, i64 0, metadata !64), !dbg !65
  call void @llvm.dbg.value(metadata !44, i64 0, metadata !66), !dbg !67
  call void @llvm.dbg.value(metadata !47, i64 0, metadata !68), !dbg !69
  call void @llvm.dbg.value(metadata !50, i64 0, metadata !70), !dbg !71
  %"28" = icmp sgt i64 %"27", 2147483647, !dbg !72
  br i1 %"28", label %fgetc_bb11, label %fgetc_bb12, !dbg !72

fgetc_bb11:                                       ; preds = %fgetc_bb10
  %"29" = sub nsw i64 %"27", 2147483647, !dbg !73
  %"30" = sub nsw i64 %"29", 1, !dbg !73
  %"31" = srem i64 %"30", 4294967296, !dbg !73
  %"32" = add nsw i64 -2147483648, %"31", !dbg !73
  br label %fgetc_wrap_around.exit3, !dbg !73

fgetc_bb12:                                       ; preds = %fgetc_bb10
  %"33" = icmp slt i64 %"27", -2147483648, !dbg !74
  br i1 %"33", label %fgetc_bb13, label %fgetc_wrap_around.exit3, !dbg !74

fgetc_bb13:                                       ; preds = %fgetc_bb12
  %"34" = sub nsw i64 -2147483648, %"27", !dbg !75
  %"35" = sub nsw i64 %"34", 1, !dbg !75
  %"36" = srem i64 %"35", 4294967296, !dbg !75
  %"37" = sub nsw i64 2147483647, %"36", !dbg !75
  br label %fgetc_wrap_around.exit3, !dbg !75

fgetc_wrap_around.exit3:                          ; preds = %fgetc_bb13, %fgetc_bb12, %fgetc_bb11, %fgetc_wrap_around.exit
  %c.0 = phi i64 [ 256, %fgetc_wrap_around.exit ], [ %"32", %fgetc_bb11 ], [ %"37", %fgetc_bb13 ], [ %"27", %fgetc_bb12 ]
  %"38" = srem i64 %c.0, 256, !dbg !76
  call void @llvm.dbg.value(metadata !{i64 %"38"}, i64 0, metadata !77), !dbg !78
  call void @llvm.dbg.value(metadata !44, i64 0, metadata !79), !dbg !80
  call void @llvm.dbg.value(metadata !47, i64 0, metadata !81), !dbg !82
  call void @llvm.dbg.value(metadata !50, i64 0, metadata !83), !dbg !84
  call void @llvm.dbg.value(metadata !{i64 %"38"}, i64 0, metadata !58), !dbg !59
  br label %fgetc_bb14, !dbg !85

fgetc_bb14:                                       ; preds = %fgetc_bb5, %fgetc_wrap_around.exit3
  %.0 = phi i64 [ %"38", %fgetc_wrap_around.exit3 ], [ -1, %fgetc_bb5 ]
  ret i64 %.0, !dbg !86
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
main_bb15:
  call void @llvm.dbg.value(metadata !{i64 %.0.i}, i64 0, metadata !87), !dbg !91
  call void @llvm.dbg.value(metadata !92, i64 0, metadata !93), !dbg !94
  call void @llvm.dbg.value(metadata !95, i64 0, metadata !96), !dbg !97
  call void @llvm.dbg.value(metadata !57, i64 0, metadata !98), !dbg !99
  call void @llvm.dbg.value(metadata !{i64 %.0.i1}, i64 0, metadata !100), !dbg !101
  call void @llvm.dbg.value(metadata !{i64 %"42"}, i64 0, metadata !102), !dbg !105
  call void @llvm.dbg.value(metadata !44, i64 0, metadata !106), !dbg !107
  call void @llvm.dbg.value(metadata !47, i64 0, metadata !108), !dbg !109
  call void @llvm.dbg.value(metadata !50, i64 0, metadata !110), !dbg !111
  call void @llvm.dbg.value(metadata !57, i64 0, metadata !112), !dbg !113
  call void @llvm.dbg.value(metadata !92, i64 0, metadata !114), !dbg !116
  call void @llvm.dbg.value(metadata !44, i64 0, metadata !117), !dbg !118
  call void @llvm.dbg.value(metadata !47, i64 0, metadata !119), !dbg !120
  call void @llvm.dbg.value(metadata !50, i64 0, metadata !121), !dbg !122
  call void @llvm.dbg.value(metadata !92, i64 0, metadata !112), !dbg !113
  br label %main_bb16, !dbg !123

main_bb16:                                        ; preds = %main_NewDefault, %main_bb15
  %"39" = load i64* @"'flag", align 8, !dbg !124
  %"40" = icmp sgt i64 %"39", 1000, !dbg !124
  br i1 %"40", label %main_fgetc.exit, label %main_bb17, !dbg !124

main_bb17:                                        ; preds = %main_bb16
  %"41" = load i64* @"'flag", align 8, !dbg !103
  %"42" = add nsw i64 %"41", 1, !dbg !103
  %"43" = icmp sgt i64 %"42", 2147483647, !dbg !125
  br i1 %"43", label %main_bb18, label %main_bb19, !dbg !125

main_bb18:                                        ; preds = %main_bb17
  %"44" = sub nsw i64 %"42", 2147483647, !dbg !126
  %"45" = sub nsw i64 %"44", 1, !dbg !126
  %"46" = srem i64 %"45", 4294967296, !dbg !126
  %"47" = add nsw i64 -2147483648, %"46", !dbg !126
  br label %main_wrap_around.exit.i, !dbg !126

main_bb19:                                        ; preds = %main_bb17
  %"48" = icmp slt i64 %"42", -2147483648, !dbg !127
  br i1 %"48", label %main_bb20, label %main_wrap_around.exit.i, !dbg !127

main_bb20:                                        ; preds = %main_bb19
  %"49" = sub nsw i64 -2147483648, %"42", !dbg !128
  %"50" = sub nsw i64 %"49", 1, !dbg !128
  %"51" = srem i64 %"50", 4294967296, !dbg !128
  %"52" = sub nsw i64 2147483647, %"51", !dbg !128
  br label %main_wrap_around.exit.i, !dbg !128

main_wrap_around.exit.i:                          ; preds = %main_bb20, %main_bb19, %main_bb18
  %.0.i.i = phi i64 [ %"47", %main_bb18 ], [ %"52", %main_bb20 ], [ %"42", %main_bb19 ], !dbg !103
  store i64 %.0.i.i, i64* @"'flag", align 8, !dbg !103
  br label %main_fgetc.exit, !dbg !129

main_fgetc.exit:                                  ; preds = %main_bb16, %main_wrap_around.exit.i
  %.0.i = phi i64 [ 0, %main_wrap_around.exit.i ], [ -1, %main_bb16 ], !dbg !104
  %"53" = icmp slt i64 %.0.i, 0, !dbg !130
  br i1 %"53", label %main_bb21, label %main_wrap_around.exit, !dbg !130

main_bb21:                                        ; preds = %main_fgetc.exit
  %"54" = sub nsw i64 0, %.0.i, !dbg !131
  %"55" = sub nsw i64 %"54", 1, !dbg !131
  %"56" = srem i64 %"55", 256, !dbg !131
  %"57" = sub nsw i64 255, %"56", !dbg !131
  br label %main_wrap_around.exit, !dbg !131

main_wrap_around.exit:                            ; preds = %main_fgetc.exit, %main_bb21
  %.0.i1 = phi i64 [ %"57", %main_bb21 ], [ %.0.i, %main_fgetc.exit ], !dbg !88
  br label %main_LeafBlock

main_LeafBlock:                                   ; preds = %main_wrap_around.exit
  %.0.i1.off = add i64 %.0.i1, 1
  %SwitchLeaf = icmp ule i64 %.0.i1.off, 1
  br i1 %SwitchLeaf, label %main_bb22, label %main_NewDefault

main_bb22:                                        ; preds = %main_LeafBlock
  ret i32 0, !dbg !132

main_NewDefault:                                  ; preds = %main_LeafBlock
  br label %main_bb16
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
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"wrap_around", metadata !"wrap_around", metadata !"", i32 14, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i64, i64, i64)* @wrap_around, null, null, metadata !2, i32 14} ; [ DW_TAG_subprogram ] [line 14] [def] [wrap_around]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"fgetc", metadata !"fgetc", metadata !"", i32 24, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i64 ()* @fgetc, null, null, metadata !2, i32 25} ; [ DW_TAG_subprogram ] [line 24] [def] [scope 25] [fgetc]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !8}
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 39, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 40} ; [ DW_TAG_subprogram ] [line 39] [def] [scope 40] [main]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{metadata !15}
!15 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!16 = metadata !{metadata !17}
!17 = metadata !{i32 786484, i32 0, null, metadata !"flag", metadata !"flag", metadata !"", metadata !5, i32 13, metadata !8, i32 0, i32 1, i64* @"'flag", null} ; [ DW_TAG_variable ] [flag] [line 13] [def]
!18 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!19 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!20 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!21 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777230, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 14]
!22 = metadata !{i32 14, i32 33, metadata !4, null}
!23 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554446, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [lower_bound] [line 14]
!24 = metadata !{i32 14, i32 50, metadata !4, null}
!25 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331662, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [upper_bound] [line 14]
!26 = metadata !{i32 14, i32 73, metadata !4, null}
!27 = metadata !{i32 15, i32 5, metadata !4, null}
!28 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 15, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [range] [line 15]
!29 = metadata !{i32 15, i32 15, metadata !4, null}
!30 = metadata !{i32 16, i32 9, metadata !31, null}
!31 = metadata !{i32 786443, metadata !1, metadata !4, i32 16, i32 9, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!32 = metadata !{i32 17, i32 9, metadata !33, null}
!33 = metadata !{i32 786443, metadata !1, metadata !31, i32 16, i32 30, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!34 = metadata !{i32 19, i32 14, metadata !35, null}
!35 = metadata !{i32 786443, metadata !1, metadata !31, i32 19, i32 14, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!36 = metadata !{i32 20, i32 9, metadata !37, null}
!37 = metadata !{i32 786443, metadata !1, metadata !35, i32 19, i32 35, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!38 = metadata !{i32 23, i32 1, metadata !4, null}
!39 = metadata !{i32 26, i32 9, metadata !40, null}
!40 = metadata !{i32 786443, metadata !1, metadata !9, i32 26, i32 9, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!41 = metadata !{i32 30, i32 13, metadata !9, null}
!42 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777230, metadata !8, i32 0, metadata !41} ; [ DW_TAG_arg_variable ] [value] [line 14]
!43 = metadata !{i32 14, i32 33, metadata !4, metadata !41}
!44 = metadata !{i64 -2147483648}
!45 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554446, metadata !8, i32 0, metadata !41} ; [ DW_TAG_arg_variable ] [lower_bound] [line 14]
!46 = metadata !{i32 14, i32 50, metadata !4, metadata !41}
!47 = metadata !{i64 2147483647}
!48 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331662, metadata !8, i32 0, metadata !41} ; [ DW_TAG_arg_variable ] [upper_bound] [line 14]
!49 = metadata !{i32 14, i32 73, metadata !4, metadata !41}
!50 = metadata !{i64 4294967296}
!51 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 15, metadata !8, i32 0, metadata !41} ; [ DW_TAG_auto_variable ] [range] [line 15]
!52 = metadata !{i32 15, i32 15, metadata !4, metadata !41}
!53 = metadata !{i32 16, i32 9, metadata !31, metadata !41}
!54 = metadata !{i32 17, i32 9, metadata !33, metadata !41}
!55 = metadata !{i32 19, i32 14, metadata !35, metadata !41}
!56 = metadata !{i32 20, i32 9, metadata !37, metadata !41}
!57 = metadata !{i64 256}
!58 = metadata !{i32 786688, metadata !9, metadata !"c", metadata !5, i32 31, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [c] [line 31]
!59 = metadata !{i32 31, i32 15, metadata !9, null}
!60 = metadata !{i32 32, i32 9, metadata !61, null}
!61 = metadata !{i32 786443, metadata !1, metadata !9, i32 32, i32 9, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!62 = metadata !{i32 34, i32 13, metadata !63, null}
!63 = metadata !{i32 786443, metadata !1, metadata !61, i32 33, i32 1, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!64 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777230, metadata !8, i32 0, metadata !62} ; [ DW_TAG_arg_variable ] [value] [line 14]
!65 = metadata !{i32 14, i32 33, metadata !4, metadata !62}
!66 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554446, metadata !8, i32 0, metadata !62} ; [ DW_TAG_arg_variable ] [lower_bound] [line 14]
!67 = metadata !{i32 14, i32 50, metadata !4, metadata !62}
!68 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331662, metadata !8, i32 0, metadata !62} ; [ DW_TAG_arg_variable ] [upper_bound] [line 14]
!69 = metadata !{i32 14, i32 73, metadata !4, metadata !62}
!70 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 15, metadata !8, i32 0, metadata !62} ; [ DW_TAG_auto_variable ] [range] [line 15]
!71 = metadata !{i32 15, i32 15, metadata !4, metadata !62}
!72 = metadata !{i32 16, i32 9, metadata !31, metadata !62}
!73 = metadata !{i32 17, i32 9, metadata !33, metadata !62}
!74 = metadata !{i32 19, i32 14, metadata !35, metadata !62}
!75 = metadata !{i32 20, i32 9, metadata !37, metadata !62}
!76 = metadata !{i32 36, i32 9, metadata !9, null}
!77 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777230, metadata !8, i32 0, metadata !76} ; [ DW_TAG_arg_variable ] [value] [line 14]
!78 = metadata !{i32 14, i32 33, metadata !4, metadata !76}
!79 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554446, metadata !8, i32 0, metadata !76} ; [ DW_TAG_arg_variable ] [lower_bound] [line 14]
!80 = metadata !{i32 14, i32 50, metadata !4, metadata !76}
!81 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331662, metadata !8, i32 0, metadata !76} ; [ DW_TAG_arg_variable ] [upper_bound] [line 14]
!82 = metadata !{i32 14, i32 73, metadata !4, metadata !76}
!83 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 15, metadata !8, i32 0, metadata !76} ; [ DW_TAG_auto_variable ] [range] [line 15]
!84 = metadata !{i32 15, i32 15, metadata !4, metadata !76}
!85 = metadata !{i32 37, i32 5, metadata !9, null}
!86 = metadata !{i32 38, i32 1, metadata !9, null}
!87 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777230, metadata !8, i32 0, metadata !88} ; [ DW_TAG_arg_variable ] [value] [line 14]
!88 = metadata !{i32 44, i32 16, metadata !89, null}
!89 = metadata !{i32 786443, metadata !1, metadata !90, i32 43, i32 5, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!90 = metadata !{i32 786443, metadata !1, metadata !12, i32 42, i32 5, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!91 = metadata !{i32 14, i32 33, metadata !4, metadata !88}
!92 = metadata !{i64 0}
!93 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554446, metadata !8, i32 0, metadata !88} ; [ DW_TAG_arg_variable ] [lower_bound] [line 14]
!94 = metadata !{i32 14, i32 50, metadata !4, metadata !88}
!95 = metadata !{i64 255}
!96 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331662, metadata !8, i32 0, metadata !88} ; [ DW_TAG_arg_variable ] [upper_bound] [line 14]
!97 = metadata !{i32 14, i32 73, metadata !4, metadata !88}
!98 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 15, metadata !8, i32 0, metadata !88} ; [ DW_TAG_auto_variable ] [range] [line 15]
!99 = metadata !{i32 15, i32 15, metadata !4, metadata !88}
!100 = metadata !{i32 786688, metadata !12, metadata !"temp", metadata !5, i32 41, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [temp] [line 41]
!101 = metadata !{i32 41, i32 15, metadata !12, null}
!102 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777230, metadata !8, i32 0, metadata !103} ; [ DW_TAG_arg_variable ] [value] [line 14]
!103 = metadata !{i32 30, i32 13, metadata !9, metadata !104}
!104 = metadata !{i32 44, i32 28, metadata !89, null}
!105 = metadata !{i32 14, i32 33, metadata !4, metadata !103}
!106 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554446, metadata !8, i32 0, metadata !103} ; [ DW_TAG_arg_variable ] [lower_bound] [line 14]
!107 = metadata !{i32 14, i32 50, metadata !4, metadata !103}
!108 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331662, metadata !8, i32 0, metadata !103} ; [ DW_TAG_arg_variable ] [upper_bound] [line 14]
!109 = metadata !{i32 14, i32 73, metadata !4, metadata !103}
!110 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 15, metadata !8, i32 0, metadata !103} ; [ DW_TAG_auto_variable ] [range] [line 15]
!111 = metadata !{i32 15, i32 15, metadata !4, metadata !103}
!112 = metadata !{i32 786688, metadata !9, metadata !"c", metadata !5, i32 31, metadata !8, i32 0, metadata !104} ; [ DW_TAG_auto_variable ] [c] [line 31]
!113 = metadata !{i32 31, i32 15, metadata !9, metadata !104}
!114 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777230, metadata !8, i32 0, metadata !115} ; [ DW_TAG_arg_variable ] [value] [line 14]
!115 = metadata !{i32 36, i32 9, metadata !9, metadata !104}
!116 = metadata !{i32 14, i32 33, metadata !4, metadata !115}
!117 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554446, metadata !8, i32 0, metadata !115} ; [ DW_TAG_arg_variable ] [lower_bound] [line 14]
!118 = metadata !{i32 14, i32 50, metadata !4, metadata !115}
!119 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331662, metadata !8, i32 0, metadata !115} ; [ DW_TAG_arg_variable ] [upper_bound] [line 14]
!120 = metadata !{i32 14, i32 73, metadata !4, metadata !115}
!121 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 15, metadata !8, i32 0, metadata !115} ; [ DW_TAG_auto_variable ] [range] [line 15]
!122 = metadata !{i32 15, i32 15, metadata !4, metadata !115}
!123 = metadata !{i32 42, i32 5, metadata !90, null}
!124 = metadata !{i32 26, i32 9, metadata !40, metadata !104}
!125 = metadata !{i32 16, i32 9, metadata !31, metadata !103}
!126 = metadata !{i32 17, i32 9, metadata !33, metadata !103}
!127 = metadata !{i32 19, i32 14, metadata !35, metadata !103}
!128 = metadata !{i32 20, i32 9, metadata !37, metadata !103}
!129 = metadata !{i32 37, i32 5, metadata !9, metadata !104}
!130 = metadata !{i32 19, i32 14, metadata !35, metadata !88}
!131 = metadata !{i32 20, i32 9, metadata !37, metadata !88}
!132 = metadata !{i32 61, i32 1, metadata !12, null}

