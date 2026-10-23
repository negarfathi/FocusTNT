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
  call void @llvm.dbg.value(metadata !34, i64 0, metadata !37), !dbg !38
  call void @llvm.dbg.value(metadata !39, i64 0, metadata !40), !dbg !41
  call void @llvm.dbg.declare(metadata !{[10 x i64]* %old_}, metadata !42), !dbg !46
  %"12" = bitcast [10 x i64]* %old_ to i8*, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* %"12", i8 0, i64 80, i32 16, i1 false), !dbg !47
  call void @llvm.dbg.declare(metadata !{[10 x i64]* %new_}, metadata !48), !dbg !49
  %"13" = bitcast [10 x i64]* %new_ to i8*, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* %"13", i8 0, i64 80, i32 16, i1 false), !dbg !50
  %"14" = bitcast i8* %"13" to [10 x i64]*, !dbg !50
  %"15" = getelementptr [10 x i64]* %"14", i32 0, i32 0, !dbg !50
  store i64 1, i64* %"15", !dbg !50
  call void @llvm.dbg.value(metadata !34, i64 0, metadata !51), !dbg !53
  call void @llvm.dbg.value(metadata !{i64 %"17"}, i64 0, metadata !54), !dbg !56
  call void @llvm.dbg.value(metadata !57, i64 0, metadata !58), !dbg !59
  call void @llvm.dbg.value(metadata !60, i64 0, metadata !61), !dbg !62
  call void @llvm.dbg.value(metadata !63, i64 0, metadata !64), !dbg !65
  br label %main_wrap_around.exit, !dbg !66

main_wrap_around.exit:                            ; preds = %main_bb9, %main_bb8, %main_bb7, %main_bb5
  %j.0 = phi i64 [ 0, %main_bb5 ], [ %"22", %main_bb7 ], [ %"27", %main_bb9 ], [ %"17", %main_bb8 ]
  %"16" = icmp slt i64 %j.0, 9, !dbg !67
  br i1 %"16", label %main_bb6, label %main_bb10, !dbg !67

main_bb6:                                         ; preds = %main_wrap_around.exit
  %"17" = add nsw i64 %j.0, 1, !dbg !55
  %"18" = icmp sgt i64 %"17", 2147483647, !dbg !70
  br i1 %"18", label %main_bb7, label %main_bb8, !dbg !70

main_bb7:                                         ; preds = %main_bb6
  %"19" = sub nsw i64 %"17", 2147483647, !dbg !71
  %"20" = sub nsw i64 %"19", 1, !dbg !71
  %"21" = srem i64 %"20", 4294967296, !dbg !71
  %"22" = add nsw i64 -2147483648, %"21", !dbg !71
  br label %main_wrap_around.exit, !dbg !71

main_bb8:                                         ; preds = %main_bb6
  %"23" = icmp slt i64 %"17", -2147483648, !dbg !72
  br i1 %"23", label %main_bb9, label %main_wrap_around.exit, !dbg !72

main_bb9:                                         ; preds = %main_bb8
  %"24" = sub nsw i64 -2147483648, %"17", !dbg !73
  %"25" = sub nsw i64 %"24", 1, !dbg !73
  %"26" = srem i64 %"25", 4294967296, !dbg !73
  %"27" = sub nsw i64 2147483647, %"26", !dbg !73
  br label %main_wrap_around.exit, !dbg !73

main_bb10:                                        ; preds = %main_wrap_around.exit
  %"28" = getelementptr inbounds [10 x i64]* %old_, i32 0, i64 9, !dbg !74
  store i64 0, i64* %"28", align 8, !dbg !74
  %"29" = getelementptr inbounds [10 x i64]* %new_, i32 0, i64 9, !dbg !75
  store i64 0, i64* %"29", align 8, !dbg !75
  call void @llvm.dbg.value(metadata !{i64 %base.0}, i64 0, metadata !76), !dbg !78
  call void @llvm.dbg.value(metadata !{i64 %"35"}, i64 0, metadata !79), !dbg !83
  call void @llvm.dbg.value(metadata !57, i64 0, metadata !84), !dbg !85
  call void @llvm.dbg.value(metadata !60, i64 0, metadata !86), !dbg !87
  call void @llvm.dbg.value(metadata !63, i64 0, metadata !88), !dbg !89
  call void @llvm.dbg.value(metadata !{i64 %.0.i5}, i64 0, metadata !76), !dbg !78
  br label %main_wrap_around.exit2, !dbg !90

main_wrap_around.exit2:                           ; preds = %main_bb23, %main_bb22, %main_bb21, %main_bb10
  %base.0 = phi i64 [ 0, %main_bb10 ], [ %"63", %main_bb21 ], [ %"68", %main_bb23 ], [ %"58", %main_bb22 ]
  %i.0 = phi i64 [ 0, %main_bb10 ], [ %.0.i3, %main_bb21 ], [ %.0.i3, %main_bb22 ], [ %.0.i3, %main_bb23 ]
  %"30" = getelementptr inbounds [10 x i64]* %old_, i32 0, i64 %i.0, !dbg !91
  %"31" = load i64* %"30", align 8, !dbg !91
  %"32" = getelementptr inbounds [10 x i64]* %new_, i32 0, i64 %i.0, !dbg !91
  %"33" = load i64* %"32", align 8, !dbg !91
  br label %main_bb11, !dbg !93

main_bb11:                                        ; preds = %main_wrap_around.exit6, %main_wrap_around.exit2
  %number.0 = phi i64 [ %base.0, %main_wrap_around.exit2 ], [ %.0.i5, %main_wrap_around.exit6 ]
  %"34" = icmp ne i64 %"31", %"33", !dbg !91
  br i1 %"34", label %main_bb12, label %main_bb17, !dbg !91

main_bb12:                                        ; preds = %main_bb11
  %"35" = add nsw i64 %number.0, 1, !dbg !80
  %"36" = icmp sgt i64 %"35", 2147483647, !dbg !94
  br i1 %"36", label %main_bb13, label %main_bb14, !dbg !94

main_bb13:                                        ; preds = %main_bb12
  %"37" = sub nsw i64 %"35", 2147483647, !dbg !95
  %"38" = sub nsw i64 %"37", 1, !dbg !95
  %"39" = srem i64 %"38", 4294967296, !dbg !95
  %"40" = add nsw i64 -2147483648, %"39", !dbg !95
  br label %main_wrap_around.exit6, !dbg !95

main_bb14:                                        ; preds = %main_bb12
  %"41" = icmp slt i64 %"35", -2147483648, !dbg !96
  br i1 %"41", label %main_bb15, label %main_wrap_around.exit6, !dbg !96

main_bb15:                                        ; preds = %main_bb14
  %"42" = sub nsw i64 -2147483648, %"35", !dbg !97
  %"43" = sub nsw i64 %"42", 1, !dbg !97
  %"44" = srem i64 %"43", 4294967296, !dbg !97
  %"45" = sub nsw i64 2147483647, %"44", !dbg !97
  br label %main_wrap_around.exit6, !dbg !97

main_wrap_around.exit6:                           ; preds = %main_bb13, %main_bb14, %main_bb15
  %.0.i5 = phi i64 [ %"40", %main_bb13 ], [ %"45", %main_bb15 ], [ %"35", %main_bb14 ], !dbg !80
  %"46" = icmp eq i64 %.0.i5, 3, !dbg !80
  br i1 %"46", label %main_bb16, label %main_bb11, !dbg !80

main_bb16:                                        ; preds = %main_wrap_around.exit6
  ret i32 0, !dbg !98

main_bb17:                                        ; preds = %main_bb11
  %"47" = add nsw i64 %i.0, 1, !dbg !99
  call void @llvm.dbg.value(metadata !{i64 %"47"}, i64 0, metadata !100), !dbg !101
  call void @llvm.dbg.value(metadata !57, i64 0, metadata !102), !dbg !103
  call void @llvm.dbg.value(metadata !60, i64 0, metadata !104), !dbg !105
  call void @llvm.dbg.value(metadata !63, i64 0, metadata !106), !dbg !107
  %"48" = icmp sgt i64 %"47", 2147483647, !dbg !108
  br i1 %"48", label %main_bb18, label %main_bb19, !dbg !108

main_bb18:                                        ; preds = %main_bb17
  %"49" = sub nsw i64 %"47", 2147483647, !dbg !109
  %"50" = sub nsw i64 %"49", 1, !dbg !109
  %"51" = srem i64 %"50", 4294967296, !dbg !109
  %"52" = add nsw i64 -2147483648, %"51", !dbg !109
  br label %main_wrap_around.exit4, !dbg !109

main_bb19:                                        ; preds = %main_bb17
  %"53" = icmp slt i64 %"47", -2147483648, !dbg !110
  br i1 %"53", label %main_bb20, label %main_wrap_around.exit4, !dbg !110

main_bb20:                                        ; preds = %main_bb19
  %"54" = sub nsw i64 -2147483648, %"47", !dbg !111
  %"55" = sub nsw i64 %"54", 1, !dbg !111
  %"56" = srem i64 %"55", 4294967296, !dbg !111
  %"57" = sub nsw i64 2147483647, %"56", !dbg !111
  br label %main_wrap_around.exit4, !dbg !111

main_wrap_around.exit4:                           ; preds = %main_bb18, %main_bb19, %main_bb20
  %.0.i3 = phi i64 [ %"52", %main_bb18 ], [ %"57", %main_bb20 ], [ %"47", %main_bb19 ], !dbg !99
  call void @llvm.dbg.value(metadata !{i64 %.0.i3}, i64 0, metadata !35), !dbg !36
  %"58" = add nsw i64 %base.0, 8, !dbg !112
  call void @llvm.dbg.value(metadata !{i64 %"58"}, i64 0, metadata !113), !dbg !114
  call void @llvm.dbg.value(metadata !57, i64 0, metadata !115), !dbg !116
  call void @llvm.dbg.value(metadata !60, i64 0, metadata !117), !dbg !118
  call void @llvm.dbg.value(metadata !63, i64 0, metadata !119), !dbg !120
  %"59" = icmp sgt i64 %"58", 2147483647, !dbg !121
  br i1 %"59", label %main_bb21, label %main_bb22, !dbg !121

main_bb21:                                        ; preds = %main_wrap_around.exit4
  %"60" = sub nsw i64 %"58", 2147483647, !dbg !122
  %"61" = sub nsw i64 %"60", 1, !dbg !122
  %"62" = srem i64 %"61", 4294967296, !dbg !122
  %"63" = add nsw i64 -2147483648, %"62", !dbg !122
  br label %main_wrap_around.exit2, !dbg !122

main_bb22:                                        ; preds = %main_wrap_around.exit4
  %"64" = icmp slt i64 %"58", -2147483648, !dbg !123
  br i1 %"64", label %main_bb23, label %main_wrap_around.exit2, !dbg !123

main_bb23:                                        ; preds = %main_bb22
  %"65" = sub nsw i64 -2147483648, %"58", !dbg !124
  %"66" = sub nsw i64 %"65", 1, !dbg !124
  %"67" = srem i64 %"66", 4294967296, !dbg !124
  %"68" = sub nsw i64 2147483647, %"67", !dbg !124
  br label %main_wrap_around.exit2, !dbg !124
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
!37 = metadata !{i32 786688, metadata !9, metadata !"base", metadata !5, i32 24, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [base] [line 24]
!38 = metadata !{i32 24, i32 15, metadata !9, null}
!39 = metadata !{i64 3}
!40 = metadata !{i32 786688, metadata !9, metadata !"count", metadata !5, i32 25, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 25]
!41 = metadata !{i32 25, i32 15, metadata !9, null}
!42 = metadata !{i32 786688, metadata !9, metadata !"old_", metadata !5, i32 26, metadata !43, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [old_] [line 26]
!43 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 640, i64 64, i32 0, i32 0, metadata !8, metadata !44, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 640, align 64, offset 0] [from long long int]
!44 = metadata !{metadata !45}
!45 = metadata !{i32 786465, i64 0, i64 10}       ; [ DW_TAG_subrange_type ] [0, 9]
!46 = metadata !{i32 26, i32 15, metadata !9, null}
!47 = metadata !{i32 26, i32 5, metadata !9, null}
!48 = metadata !{i32 786688, metadata !9, metadata !"new_", metadata !5, i32 27, metadata !43, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [new_] [line 27]
!49 = metadata !{i32 27, i32 15, metadata !9, null}
!50 = metadata !{i32 27, i32 5, metadata !9, null}
!51 = metadata !{i32 786688, metadata !52, metadata !"j", metadata !5, i32 28, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 28]
!52 = metadata !{i32 786443, metadata !1, metadata !9, i32 28, i32 5, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!53 = metadata !{i32 28, i32 20, metadata !52, null}
!54 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777227, metadata !8, i32 0, metadata !55} ; [ DW_TAG_arg_variable ] [value] [line 11]
!55 = metadata !{i32 28, i32 41, metadata !52, null}
!56 = metadata !{i32 11, i32 33, metadata !4, metadata !55}
!57 = metadata !{i64 -2147483648}
!58 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554443, metadata !8, i32 0, metadata !55} ; [ DW_TAG_arg_variable ] [lower_bound] [line 11]
!59 = metadata !{i32 11, i32 50, metadata !4, metadata !55}
!60 = metadata !{i64 2147483647}
!61 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331659, metadata !8, i32 0, metadata !55} ; [ DW_TAG_arg_variable ] [upper_bound] [line 11]
!62 = metadata !{i32 11, i32 73, metadata !4, metadata !55}
!63 = metadata !{i64 4294967296}
!64 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 12, metadata !8, i32 0, metadata !55} ; [ DW_TAG_auto_variable ] [range] [line 12]
!65 = metadata !{i32 12, i32 15, metadata !4, metadata !55}
!66 = metadata !{i32 28, i32 10, metadata !52, null}
!67 = metadata !{i32 28, i32 10, metadata !68, null}
!68 = metadata !{i32 786443, metadata !1, metadata !69, i32 28, i32 10, i32 2, i32 11} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!69 = metadata !{i32 786443, metadata !1, metadata !52, i32 28, i32 10, i32 1, i32 10} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!70 = metadata !{i32 13, i32 9, metadata !26, metadata !55}
!71 = metadata !{i32 14, i32 9, metadata !28, metadata !55}
!72 = metadata !{i32 16, i32 14, metadata !30, metadata !55}
!73 = metadata !{i32 17, i32 9, metadata !32, metadata !55}
!74 = metadata !{i32 33, i32 5, metadata !9, null}
!75 = metadata !{i32 34, i32 5, metadata !9, null}
!76 = metadata !{i32 786688, metadata !77, metadata !"number", metadata !5, i32 37, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [number] [line 37]
!77 = metadata !{i32 786443, metadata !1, metadata !9, i32 36, i32 5, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!78 = metadata !{i32 37, i32 19, metadata !77, null}
!79 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777227, metadata !8, i32 0, metadata !80} ; [ DW_TAG_arg_variable ] [value] [line 11]
!80 = metadata !{i32 40, i32 27, metadata !81, null}
!81 = metadata !{i32 786443, metadata !1, metadata !82, i32 40, i32 17, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!82 = metadata !{i32 786443, metadata !1, metadata !77, i32 39, i32 9, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!83 = metadata !{i32 11, i32 33, metadata !4, metadata !80}
!84 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554443, metadata !8, i32 0, metadata !80} ; [ DW_TAG_arg_variable ] [lower_bound] [line 11]
!85 = metadata !{i32 11, i32 50, metadata !4, metadata !80}
!86 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331659, metadata !8, i32 0, metadata !80} ; [ DW_TAG_arg_variable ] [upper_bound] [line 11]
!87 = metadata !{i32 11, i32 73, metadata !4, metadata !80}
!88 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 12, metadata !8, i32 0, metadata !80} ; [ DW_TAG_auto_variable ] [range] [line 12]
!89 = metadata !{i32 12, i32 15, metadata !4, metadata !80}
!90 = metadata !{i32 35, i32 5, metadata !9, null}
!91 = metadata !{i32 38, i32 9, metadata !92, null}
!92 = metadata !{i32 786443, metadata !1, metadata !77, i32 38, i32 9, i32 1, i32 12} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!93 = metadata !{i32 38, i32 9, metadata !77, null}
!94 = metadata !{i32 13, i32 9, metadata !26, metadata !80}
!95 = metadata !{i32 14, i32 9, metadata !28, metadata !80}
!96 = metadata !{i32 16, i32 14, metadata !30, metadata !80}
!97 = metadata !{i32 17, i32 9, metadata !32, metadata !80}
!98 = metadata !{i32 49, i32 5, metadata !9, null}
!99 = metadata !{i32 45, i32 14, metadata !77, null}
!100 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777227, metadata !8, i32 0, metadata !99} ; [ DW_TAG_arg_variable ] [value] [line 11]
!101 = metadata !{i32 11, i32 33, metadata !4, metadata !99}
!102 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554443, metadata !8, i32 0, metadata !99} ; [ DW_TAG_arg_variable ] [lower_bound] [line 11]
!103 = metadata !{i32 11, i32 50, metadata !4, metadata !99}
!104 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331659, metadata !8, i32 0, metadata !99} ; [ DW_TAG_arg_variable ] [upper_bound] [line 11]
!105 = metadata !{i32 11, i32 73, metadata !4, metadata !99}
!106 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 12, metadata !8, i32 0, metadata !99} ; [ DW_TAG_auto_variable ] [range] [line 12]
!107 = metadata !{i32 12, i32 15, metadata !4, metadata !99}
!108 = metadata !{i32 13, i32 9, metadata !26, metadata !99}
!109 = metadata !{i32 14, i32 9, metadata !28, metadata !99}
!110 = metadata !{i32 16, i32 14, metadata !30, metadata !99}
!111 = metadata !{i32 17, i32 9, metadata !32, metadata !99}
!112 = metadata !{i32 46, i32 16, metadata !77, null}
!113 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777227, metadata !8, i32 0, metadata !112} ; [ DW_TAG_arg_variable ] [value] [line 11]
!114 = metadata !{i32 11, i32 33, metadata !4, metadata !112}
!115 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554443, metadata !8, i32 0, metadata !112} ; [ DW_TAG_arg_variable ] [lower_bound] [line 11]
!116 = metadata !{i32 11, i32 50, metadata !4, metadata !112}
!117 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331659, metadata !8, i32 0, metadata !112} ; [ DW_TAG_arg_variable ] [upper_bound] [line 11]
!118 = metadata !{i32 11, i32 73, metadata !4, metadata !112}
!119 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 12, metadata !8, i32 0, metadata !112} ; [ DW_TAG_auto_variable ] [range] [line 12]
!120 = metadata !{i32 12, i32 15, metadata !4, metadata !112}
!121 = metadata !{i32 13, i32 9, metadata !26, metadata !112}
!122 = metadata !{i32 14, i32 9, metadata !28, metadata !112}
!123 = metadata !{i32 16, i32 14, metadata !30, metadata !112}
!124 = metadata !{i32 17, i32 9, metadata !32, metadata !112}

