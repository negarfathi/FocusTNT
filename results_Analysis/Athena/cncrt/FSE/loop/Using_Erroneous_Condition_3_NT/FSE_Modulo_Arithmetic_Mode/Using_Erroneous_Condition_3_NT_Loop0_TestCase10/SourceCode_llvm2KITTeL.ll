; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define i64 @wrap_around(i64 %value, i64 %lower_bound, i64 %upper_bound) #0 {
wrap_around_bb0:
  call void @llvm.dbg.value(metadata !{i64 %value}, i64 0, metadata !16), !dbg !17
  call void @llvm.dbg.value(metadata !{i64 %lower_bound}, i64 0, metadata !18), !dbg !19
  call void @llvm.dbg.value(metadata !{i64 %upper_bound}, i64 0, metadata !20), !dbg !21
  %"0" = sub nsw i64 %upper_bound, %lower_bound, !dbg !22
  %"1" = add nsw i64 %"0", 1, !dbg !22
  call void @llvm.dbg.value(metadata !{i64 %"1"}, i64 0, metadata !23), !dbg !24
  %"2" = icmp sgt i64 %value, %upper_bound, !dbg !25
  br i1 %"2", label %wrap_around_bb1, label %wrap_around_bb2, !dbg !25

wrap_around_bb1:                                  ; preds = %wrap_around_bb0
  %"3" = sub nsw i64 %value, %upper_bound, !dbg !27
  %"4" = sub nsw i64 %"3", 1, !dbg !27
  %"5" = srem i64 %"4", %"1", !dbg !27
  %"6" = add nsw i64 %lower_bound, %"5", !dbg !27
  br label %wrap_around_bb4, !dbg !27

wrap_around_bb2:                                  ; preds = %wrap_around_bb0
  %"7" = icmp slt i64 %value, %lower_bound, !dbg !29
  br i1 %"7", label %wrap_around_bb3, label %wrap_around_bb4, !dbg !29

wrap_around_bb3:                                  ; preds = %wrap_around_bb2
  %"8" = sub nsw i64 %lower_bound, %value, !dbg !31
  %"9" = sub nsw i64 %"8", 1, !dbg !31
  %"10" = srem i64 %"9", %"1", !dbg !31
  %"11" = sub nsw i64 %upper_bound, %"10", !dbg !31
  br label %wrap_around_bb4, !dbg !31

wrap_around_bb4:                                  ; preds = %wrap_around_bb2, %wrap_around_bb3, %wrap_around_bb1
  %.0 = phi i64 [ %"6", %wrap_around_bb1 ], [ %"11", %wrap_around_bb3 ], [ %value, %wrap_around_bb2 ]
  ret i64 %.0, !dbg !33
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
main_bb5:
  %old_ = alloca [10 x i64], align 16
  %new_ = alloca [10 x i64], align 16
  call void @llvm.dbg.value(metadata !34, i64 0, metadata !35), !dbg !36
  call void @llvm.dbg.value(metadata !37, i64 0, metadata !38), !dbg !39
  call void @llvm.dbg.value(metadata !40, i64 0, metadata !41), !dbg !42
  call void @llvm.dbg.declare(metadata !{[10 x i64]* %old_}, metadata !43), !dbg !47
  %"12" = bitcast [10 x i64]* %old_ to i8*, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* %"12", i8 0, i64 80, i32 16, i1 false), !dbg !48
  %"13" = bitcast i8* %"12" to [10 x i64]*, !dbg !48
  %"14" = getelementptr [10 x i64]* %"13", i32 0, i32 0, !dbg !48
  store i64 4, i64* %"14", !dbg !48
  call void @llvm.dbg.declare(metadata !{[10 x i64]* %new_}, metadata !49), !dbg !50
  %"15" = bitcast [10 x i64]* %new_ to i8*, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* %"15", i8 0, i64 80, i32 16, i1 false), !dbg !51
  %"16" = bitcast i8* %"15" to [10 x i64]*, !dbg !51
  %"17" = getelementptr [10 x i64]* %"16", i32 0, i32 0, !dbg !51
  store i64 5, i64* %"17", !dbg !51
  call void @llvm.dbg.value(metadata !34, i64 0, metadata !52), !dbg !54
  call void @llvm.dbg.value(metadata !{i64 %"19"}, i64 0, metadata !55), !dbg !57
  call void @llvm.dbg.value(metadata !58, i64 0, metadata !59), !dbg !60
  call void @llvm.dbg.value(metadata !61, i64 0, metadata !62), !dbg !63
  call void @llvm.dbg.value(metadata !64, i64 0, metadata !65), !dbg !66
  br label %main_wrap_around.exit, !dbg !67

main_wrap_around.exit:                            ; preds = %main_bb9, %main_bb8, %main_bb7, %main_bb5
  %j.0 = phi i64 [ 0, %main_bb5 ], [ %"24", %main_bb7 ], [ %"29", %main_bb9 ], [ %"19", %main_bb8 ]
  %"18" = icmp slt i64 %j.0, 9, !dbg !68
  br i1 %"18", label %main_bb6, label %main_bb10, !dbg !68

main_bb6:                                         ; preds = %main_wrap_around.exit
  %"19" = add nsw i64 %j.0, 1, !dbg !56
  %"20" = icmp sgt i64 %"19", 2147483647, !dbg !71
  br i1 %"20", label %main_bb7, label %main_bb8, !dbg !71

main_bb7:                                         ; preds = %main_bb6
  %"21" = sub nsw i64 %"19", 2147483647, !dbg !72
  %"22" = sub nsw i64 %"21", 1, !dbg !72
  %"23" = srem i64 %"22", 4294967296, !dbg !72
  %"24" = add nsw i64 -2147483648, %"23", !dbg !72
  br label %main_wrap_around.exit, !dbg !72

main_bb8:                                         ; preds = %main_bb6
  %"25" = icmp slt i64 %"19", -2147483648, !dbg !73
  br i1 %"25", label %main_bb9, label %main_wrap_around.exit, !dbg !73

main_bb9:                                         ; preds = %main_bb8
  %"26" = sub nsw i64 -2147483648, %"19", !dbg !74
  %"27" = sub nsw i64 %"26", 1, !dbg !74
  %"28" = srem i64 %"27", 4294967296, !dbg !74
  %"29" = sub nsw i64 2147483647, %"28", !dbg !74
  br label %main_wrap_around.exit, !dbg !74

main_bb10:                                        ; preds = %main_wrap_around.exit
  %"30" = getelementptr inbounds [10 x i64]* %old_, i32 0, i64 9, !dbg !75
  store i64 0, i64* %"30", align 8, !dbg !75
  %"31" = getelementptr inbounds [10 x i64]* %new_, i32 0, i64 9, !dbg !76
  store i64 0, i64* %"31", align 8, !dbg !76
  call void @llvm.dbg.value(metadata !{i64 %base.0}, i64 0, metadata !77), !dbg !79
  call void @llvm.dbg.value(metadata !{i64 %"37"}, i64 0, metadata !80), !dbg !84
  call void @llvm.dbg.value(metadata !58, i64 0, metadata !85), !dbg !86
  call void @llvm.dbg.value(metadata !61, i64 0, metadata !87), !dbg !88
  call void @llvm.dbg.value(metadata !64, i64 0, metadata !89), !dbg !90
  call void @llvm.dbg.value(metadata !{i64 %.0.i5}, i64 0, metadata !77), !dbg !79
  br label %main_wrap_around.exit2, !dbg !91

main_wrap_around.exit2:                           ; preds = %main_bb23, %main_bb22, %main_bb21, %main_bb10
  %base.0 = phi i64 [ 10, %main_bb10 ], [ %"65", %main_bb21 ], [ %"70", %main_bb23 ], [ %"60", %main_bb22 ]
  %i.0 = phi i64 [ 0, %main_bb10 ], [ %.0.i3, %main_bb21 ], [ %.0.i3, %main_bb22 ], [ %.0.i3, %main_bb23 ]
  %"32" = getelementptr inbounds [10 x i64]* %old_, i32 0, i64 %i.0, !dbg !92
  %"33" = load i64* %"32", align 8, !dbg !92
  %"34" = getelementptr inbounds [10 x i64]* %new_, i32 0, i64 %i.0, !dbg !92
  %"35" = load i64* %"34", align 8, !dbg !92
  br label %main_bb11, !dbg !94

main_bb11:                                        ; preds = %main_wrap_around.exit6, %main_wrap_around.exit2
  %number.0 = phi i64 [ %base.0, %main_wrap_around.exit2 ], [ %.0.i5, %main_wrap_around.exit6 ]
  %"36" = icmp ne i64 %"33", %"35", !dbg !92
  br i1 %"36", label %main_bb12, label %main_bb17, !dbg !92

main_bb12:                                        ; preds = %main_bb11
  %"37" = add nsw i64 %number.0, 1, !dbg !81
  %"38" = icmp sgt i64 %"37", 2147483647, !dbg !95
  br i1 %"38", label %main_bb13, label %main_bb14, !dbg !95

main_bb13:                                        ; preds = %main_bb12
  %"39" = sub nsw i64 %"37", 2147483647, !dbg !96
  %"40" = sub nsw i64 %"39", 1, !dbg !96
  %"41" = srem i64 %"40", 4294967296, !dbg !96
  %"42" = add nsw i64 -2147483648, %"41", !dbg !96
  br label %main_wrap_around.exit6, !dbg !96

main_bb14:                                        ; preds = %main_bb12
  %"43" = icmp slt i64 %"37", -2147483648, !dbg !97
  br i1 %"43", label %main_bb15, label %main_wrap_around.exit6, !dbg !97

main_bb15:                                        ; preds = %main_bb14
  %"44" = sub nsw i64 -2147483648, %"37", !dbg !98
  %"45" = sub nsw i64 %"44", 1, !dbg !98
  %"46" = srem i64 %"45", 4294967296, !dbg !98
  %"47" = sub nsw i64 2147483647, %"46", !dbg !98
  br label %main_wrap_around.exit6, !dbg !98

main_wrap_around.exit6:                           ; preds = %main_bb13, %main_bb14, %main_bb15
  %.0.i5 = phi i64 [ %"42", %main_bb13 ], [ %"47", %main_bb15 ], [ %"37", %main_bb14 ], !dbg !81
  %"48" = icmp eq i64 %.0.i5, 20, !dbg !81
  br i1 %"48", label %main_bb16, label %main_bb11, !dbg !81

main_bb16:                                        ; preds = %main_wrap_around.exit6
  ret i32 0, !dbg !99

main_bb17:                                        ; preds = %main_bb11
  %"49" = add nsw i64 %i.0, 1, !dbg !100
  call void @llvm.dbg.value(metadata !{i64 %"49"}, i64 0, metadata !101), !dbg !102
  call void @llvm.dbg.value(metadata !58, i64 0, metadata !103), !dbg !104
  call void @llvm.dbg.value(metadata !61, i64 0, metadata !105), !dbg !106
  call void @llvm.dbg.value(metadata !64, i64 0, metadata !107), !dbg !108
  %"50" = icmp sgt i64 %"49", 2147483647, !dbg !109
  br i1 %"50", label %main_bb18, label %main_bb19, !dbg !109

main_bb18:                                        ; preds = %main_bb17
  %"51" = sub nsw i64 %"49", 2147483647, !dbg !110
  %"52" = sub nsw i64 %"51", 1, !dbg !110
  %"53" = srem i64 %"52", 4294967296, !dbg !110
  %"54" = add nsw i64 -2147483648, %"53", !dbg !110
  br label %main_wrap_around.exit4, !dbg !110

main_bb19:                                        ; preds = %main_bb17
  %"55" = icmp slt i64 %"49", -2147483648, !dbg !111
  br i1 %"55", label %main_bb20, label %main_wrap_around.exit4, !dbg !111

main_bb20:                                        ; preds = %main_bb19
  %"56" = sub nsw i64 -2147483648, %"49", !dbg !112
  %"57" = sub nsw i64 %"56", 1, !dbg !112
  %"58" = srem i64 %"57", 4294967296, !dbg !112
  %"59" = sub nsw i64 2147483647, %"58", !dbg !112
  br label %main_wrap_around.exit4, !dbg !112

main_wrap_around.exit4:                           ; preds = %main_bb18, %main_bb19, %main_bb20
  %.0.i3 = phi i64 [ %"54", %main_bb18 ], [ %"59", %main_bb20 ], [ %"49", %main_bb19 ], !dbg !100
  call void @llvm.dbg.value(metadata !{i64 %.0.i3}, i64 0, metadata !35), !dbg !36
  %"60" = add nsw i64 %base.0, 8, !dbg !113
  call void @llvm.dbg.value(metadata !{i64 %"60"}, i64 0, metadata !114), !dbg !115
  call void @llvm.dbg.value(metadata !58, i64 0, metadata !116), !dbg !117
  call void @llvm.dbg.value(metadata !61, i64 0, metadata !118), !dbg !119
  call void @llvm.dbg.value(metadata !64, i64 0, metadata !120), !dbg !121
  %"61" = icmp sgt i64 %"60", 2147483647, !dbg !122
  br i1 %"61", label %main_bb21, label %main_bb22, !dbg !122

main_bb21:                                        ; preds = %main_wrap_around.exit4
  %"62" = sub nsw i64 %"60", 2147483647, !dbg !123
  %"63" = sub nsw i64 %"62", 1, !dbg !123
  %"64" = srem i64 %"63", 4294967296, !dbg !123
  %"65" = add nsw i64 -2147483648, %"64", !dbg !123
  br label %main_wrap_around.exit2, !dbg !123

main_bb22:                                        ; preds = %main_wrap_around.exit4
  %"66" = icmp slt i64 %"60", -2147483648, !dbg !124
  br i1 %"66", label %main_bb23, label %main_wrap_around.exit2, !dbg !124

main_bb23:                                        ; preds = %main_bb22
  %"67" = sub nsw i64 -2147483648, %"60", !dbg !125
  %"68" = sub nsw i64 %"67", 1, !dbg !125
  %"69" = srem i64 %"68", 4294967296, !dbg !125
  %"70" = sub nsw i64 2147483647, %"69", !dbg !125
  br label %main_wrap_around.exit2, !dbg !125
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #2

declare i64 @__kittel_nondef.0()

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

declare i32 @__kittel_nondef.1()

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!13, !14}
!llvm.ident = !{!15}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [//FILES_DIR/SourceCode_SemanticAugmentor.c] [DW_LANG_C99]
!1 = metadata !{metadata !"FILES_DIR/SourceCode_SemanticAugmentor.c", metadata !"/"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"wrap_around", metadata !"wrap_around", metadata !"", i32 11, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i64, i64, i64)* @wrap_around, null, null, metadata !2, i32 11} ; [ DW_TAG_subprogram ] [line 11] [def] [wrap_around]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 21, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 22} ; [ DW_TAG_subprogram ] [line 21] [def] [scope 22] [main]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !12}
!12 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!13 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!14 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!15 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!16 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777227, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 11]
!17 = metadata !{i32 11, i32 33, metadata !4, null}
!18 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554443, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [lower_bound] [line 11]
!19 = metadata !{i32 11, i32 50, metadata !4, null}
!20 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331659, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [upper_bound] [line 11]
!21 = metadata !{i32 11, i32 73, metadata !4, null}
!22 = metadata !{i32 12, i32 5, metadata !4, null}
!23 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 12, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [range] [line 12]
!24 = metadata !{i32 12, i32 15, metadata !4, null}
!25 = metadata !{i32 13, i32 9, metadata !26, null}
!26 = metadata !{i32 786443, metadata !1, metadata !4, i32 13, i32 9, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!27 = metadata !{i32 14, i32 9, metadata !28, null}
!28 = metadata !{i32 786443, metadata !1, metadata !26, i32 13, i32 30, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!29 = metadata !{i32 16, i32 14, metadata !30, null}
!30 = metadata !{i32 786443, metadata !1, metadata !26, i32 16, i32 14, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!31 = metadata !{i32 17, i32 9, metadata !32, null}
!32 = metadata !{i32 786443, metadata !1, metadata !30, i32 16, i32 35, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!33 = metadata !{i32 20, i32 1, metadata !4, null}
!34 = metadata !{i64 0}
!35 = metadata !{i32 786688, metadata !9, metadata !"i", metadata !5, i32 23, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 23]
!36 = metadata !{i32 23, i32 15, metadata !9, null}
!37 = metadata !{i64 10}
!38 = metadata !{i32 786688, metadata !9, metadata !"base", metadata !5, i32 24, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [base] [line 24]
!39 = metadata !{i32 24, i32 15, metadata !9, null}
!40 = metadata !{i64 20}
!41 = metadata !{i32 786688, metadata !9, metadata !"count", metadata !5, i32 25, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 25]
!42 = metadata !{i32 25, i32 15, metadata !9, null}
!43 = metadata !{i32 786688, metadata !9, metadata !"old_", metadata !5, i32 26, metadata !44, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [old_] [line 26]
!44 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 640, i64 64, i32 0, i32 0, metadata !8, metadata !45, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 640, align 64, offset 0] [from long long int]
!45 = metadata !{metadata !46}
!46 = metadata !{i32 786465, i64 0, i64 10}       ; [ DW_TAG_subrange_type ] [0, 9]
!47 = metadata !{i32 26, i32 15, metadata !9, null}
!48 = metadata !{i32 26, i32 5, metadata !9, null}
!49 = metadata !{i32 786688, metadata !9, metadata !"new_", metadata !5, i32 27, metadata !44, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [new_] [line 27]
!50 = metadata !{i32 27, i32 15, metadata !9, null}
!51 = metadata !{i32 27, i32 5, metadata !9, null}
!52 = metadata !{i32 786688, metadata !53, metadata !"j", metadata !5, i32 28, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 28]
!53 = metadata !{i32 786443, metadata !1, metadata !9, i32 28, i32 5, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!54 = metadata !{i32 28, i32 20, metadata !53, null}
!55 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777227, metadata !8, i32 0, metadata !56} ; [ DW_TAG_arg_variable ] [value] [line 11]
!56 = metadata !{i32 28, i32 41, metadata !53, null}
!57 = metadata !{i32 11, i32 33, metadata !4, metadata !56}
!58 = metadata !{i64 -2147483648}
!59 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554443, metadata !8, i32 0, metadata !56} ; [ DW_TAG_arg_variable ] [lower_bound] [line 11]
!60 = metadata !{i32 11, i32 50, metadata !4, metadata !56}
!61 = metadata !{i64 2147483647}
!62 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331659, metadata !8, i32 0, metadata !56} ; [ DW_TAG_arg_variable ] [upper_bound] [line 11]
!63 = metadata !{i32 11, i32 73, metadata !4, metadata !56}
!64 = metadata !{i64 4294967296}
!65 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 12, metadata !8, i32 0, metadata !56} ; [ DW_TAG_auto_variable ] [range] [line 12]
!66 = metadata !{i32 12, i32 15, metadata !4, metadata !56}
!67 = metadata !{i32 28, i32 10, metadata !53, null}
!68 = metadata !{i32 28, i32 10, metadata !69, null}
!69 = metadata !{i32 786443, metadata !1, metadata !70, i32 28, i32 10, i32 2, i32 11} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!70 = metadata !{i32 786443, metadata !1, metadata !53, i32 28, i32 10, i32 1, i32 10} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!71 = metadata !{i32 13, i32 9, metadata !26, metadata !56}
!72 = metadata !{i32 14, i32 9, metadata !28, metadata !56}
!73 = metadata !{i32 16, i32 14, metadata !30, metadata !56}
!74 = metadata !{i32 17, i32 9, metadata !32, metadata !56}
!75 = metadata !{i32 33, i32 5, metadata !9, null}
!76 = metadata !{i32 34, i32 5, metadata !9, null}
!77 = metadata !{i32 786688, metadata !78, metadata !"number", metadata !5, i32 37, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [number] [line 37]
!78 = metadata !{i32 786443, metadata !1, metadata !9, i32 36, i32 5, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!79 = metadata !{i32 37, i32 19, metadata !78, null}
!80 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777227, metadata !8, i32 0, metadata !81} ; [ DW_TAG_arg_variable ] [value] [line 11]
!81 = metadata !{i32 40, i32 27, metadata !82, null}
!82 = metadata !{i32 786443, metadata !1, metadata !83, i32 40, i32 17, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!83 = metadata !{i32 786443, metadata !1, metadata !78, i32 39, i32 9, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!84 = metadata !{i32 11, i32 33, metadata !4, metadata !81}
!85 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554443, metadata !8, i32 0, metadata !81} ; [ DW_TAG_arg_variable ] [lower_bound] [line 11]
!86 = metadata !{i32 11, i32 50, metadata !4, metadata !81}
!87 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331659, metadata !8, i32 0, metadata !81} ; [ DW_TAG_arg_variable ] [upper_bound] [line 11]
!88 = metadata !{i32 11, i32 73, metadata !4, metadata !81}
!89 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 12, metadata !8, i32 0, metadata !81} ; [ DW_TAG_auto_variable ] [range] [line 12]
!90 = metadata !{i32 12, i32 15, metadata !4, metadata !81}
!91 = metadata !{i32 35, i32 5, metadata !9, null}
!92 = metadata !{i32 38, i32 9, metadata !93, null}
!93 = metadata !{i32 786443, metadata !1, metadata !78, i32 38, i32 9, i32 1, i32 12} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!94 = metadata !{i32 38, i32 9, metadata !78, null}
!95 = metadata !{i32 13, i32 9, metadata !26, metadata !81}
!96 = metadata !{i32 14, i32 9, metadata !28, metadata !81}
!97 = metadata !{i32 16, i32 14, metadata !30, metadata !81}
!98 = metadata !{i32 17, i32 9, metadata !32, metadata !81}
!99 = metadata !{i32 49, i32 5, metadata !9, null}
!100 = metadata !{i32 45, i32 14, metadata !78, null}
!101 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777227, metadata !8, i32 0, metadata !100} ; [ DW_TAG_arg_variable ] [value] [line 11]
!102 = metadata !{i32 11, i32 33, metadata !4, metadata !100}
!103 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554443, metadata !8, i32 0, metadata !100} ; [ DW_TAG_arg_variable ] [lower_bound] [line 11]
!104 = metadata !{i32 11, i32 50, metadata !4, metadata !100}
!105 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331659, metadata !8, i32 0, metadata !100} ; [ DW_TAG_arg_variable ] [upper_bound] [line 11]
!106 = metadata !{i32 11, i32 73, metadata !4, metadata !100}
!107 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 12, metadata !8, i32 0, metadata !100} ; [ DW_TAG_auto_variable ] [range] [line 12]
!108 = metadata !{i32 12, i32 15, metadata !4, metadata !100}
!109 = metadata !{i32 13, i32 9, metadata !26, metadata !100}
!110 = metadata !{i32 14, i32 9, metadata !28, metadata !100}
!111 = metadata !{i32 16, i32 14, metadata !30, metadata !100}
!112 = metadata !{i32 17, i32 9, metadata !32, metadata !100}
!113 = metadata !{i32 46, i32 16, metadata !78, null}
!114 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777227, metadata !8, i32 0, metadata !113} ; [ DW_TAG_arg_variable ] [value] [line 11]
!115 = metadata !{i32 11, i32 33, metadata !4, metadata !113}
!116 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554443, metadata !8, i32 0, metadata !113} ; [ DW_TAG_arg_variable ] [lower_bound] [line 11]
!117 = metadata !{i32 11, i32 50, metadata !4, metadata !113}
!118 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331659, metadata !8, i32 0, metadata !113} ; [ DW_TAG_arg_variable ] [upper_bound] [line 11]
!119 = metadata !{i32 11, i32 73, metadata !4, metadata !113}
!120 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 12, metadata !8, i32 0, metadata !113} ; [ DW_TAG_auto_variable ] [range] [line 12]
!121 = metadata !{i32 12, i32 15, metadata !4, metadata !113}
!122 = metadata !{i32 13, i32 9, metadata !26, metadata !113}
!123 = metadata !{i32 14, i32 9, metadata !28, metadata !113}
!124 = metadata !{i32 16, i32 14, metadata !30, metadata !113}
!125 = metadata !{i32 17, i32 9, metadata !32, metadata !113}

