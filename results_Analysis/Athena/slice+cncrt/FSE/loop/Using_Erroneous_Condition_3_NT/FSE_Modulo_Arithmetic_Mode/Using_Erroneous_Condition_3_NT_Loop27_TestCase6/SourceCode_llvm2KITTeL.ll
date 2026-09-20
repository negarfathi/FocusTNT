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
  %old_ = alloca [10 x i64], align 16
  %new_ = alloca [10 x i64], align 16
  call void @llvm.dbg.declare(metadata !{[10 x i64]* %old_}, metadata !33), !dbg !37
  %"12" = bitcast [10 x i64]* %old_ to i8*, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* %"12", i8 0, i64 80, i32 16, i1 false), !dbg !38
  %"13" = bitcast i8* %"12" to [10 x i64]*, !dbg !38
  %"14" = getelementptr [10 x i64]* %"13", i32 0, i32 0, !dbg !38
  store i64 1, i64* %"14", !dbg !38
  call void @llvm.dbg.declare(metadata !{[10 x i64]* %new_}, metadata !39), !dbg !40
  %"15" = bitcast [10 x i64]* %new_ to i8*, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* %"15", i8 0, i64 80, i32 16, i1 false), !dbg !41
  %"16" = bitcast i8* %"15" to [10 x i64]*, !dbg !41
  %"17" = getelementptr [10 x i64]* %"16", i32 0, i32 0, !dbg !41
  store i64 2, i64* %"17", !dbg !41
  call void @llvm.dbg.value(metadata !42, i64 0, metadata !43), !dbg !44
  call void @llvm.dbg.value(metadata !42, i64 0, metadata !45), !dbg !46
  call void @llvm.dbg.value(metadata !47, i64 0, metadata !48), !dbg !49
  call void @llvm.dbg.value(metadata !42, i64 0, metadata !50), !dbg !52
  call void @llvm.dbg.value(metadata !{i64 %"19"}, i64 0, metadata !53), !dbg !56
  call void @llvm.dbg.value(metadata !57, i64 0, metadata !58), !dbg !59
  call void @llvm.dbg.value(metadata !60, i64 0, metadata !61), !dbg !62
  call void @llvm.dbg.value(metadata !63, i64 0, metadata !64), !dbg !65
  br label %main_wrap_around.exit, !dbg !66

main_wrap_around.exit:                            ; preds = %main_bb9, %main_bb8, %main_bb7, %main_bb5
  %j.0 = phi i64 [ 0, %main_bb5 ], [ %"24", %main_bb7 ], [ %"29", %main_bb9 ], [ %"19", %main_bb8 ]
  %"18" = icmp slt i64 %j.0, 9, !dbg !67
  br i1 %"18", label %main_bb6, label %main_bb10, !dbg !67

main_bb6:                                         ; preds = %main_wrap_around.exit
  %"19" = add nsw i64 %j.0, 1, !dbg !54
  %"20" = icmp sgt i64 %"19", 2147483647, !dbg !69
  br i1 %"20", label %main_bb7, label %main_bb8, !dbg !69

main_bb7:                                         ; preds = %main_bb6
  %"21" = sub nsw i64 %"19", 2147483647, !dbg !70
  %"22" = sub nsw i64 %"21", 1, !dbg !70
  %"23" = srem i64 %"22", 4294967296, !dbg !70
  %"24" = add nsw i64 -2147483648, %"23", !dbg !70
  br label %main_wrap_around.exit, !dbg !70

main_bb8:                                         ; preds = %main_bb6
  %"25" = icmp slt i64 %"19", -2147483648, !dbg !71
  br i1 %"25", label %main_bb9, label %main_wrap_around.exit, !dbg !71

main_bb9:                                         ; preds = %main_bb8
  %"26" = sub nsw i64 -2147483648, %"19", !dbg !72
  %"27" = sub nsw i64 %"26", 1, !dbg !72
  %"28" = srem i64 %"27", 4294967296, !dbg !72
  %"29" = sub nsw i64 2147483647, %"28", !dbg !72
  br label %main_wrap_around.exit, !dbg !72

main_bb10:                                        ; preds = %main_wrap_around.exit
  %"30" = getelementptr inbounds [10 x i64]* %old_, i32 0, i64 9, !dbg !73
  store i64 0, i64* %"30", align 8, !dbg !73
  %"31" = getelementptr inbounds [10 x i64]* %new_, i32 0, i64 9, !dbg !74
  store i64 0, i64* %"31", align 8, !dbg !74
  call void @llvm.dbg.value(metadata !{i64 %base.0}, i64 0, metadata !75), !dbg !77
  call void @llvm.dbg.value(metadata !{i64 %"37"}, i64 0, metadata !78), !dbg !81
  call void @llvm.dbg.value(metadata !57, i64 0, metadata !82), !dbg !83
  call void @llvm.dbg.value(metadata !60, i64 0, metadata !84), !dbg !85
  call void @llvm.dbg.value(metadata !63, i64 0, metadata !86), !dbg !87
  call void @llvm.dbg.value(metadata !{i64 %.0.i5}, i64 0, metadata !75), !dbg !77
  br label %main_wrap_around.exit2, !dbg !88

main_wrap_around.exit2:                           ; preds = %main_bb23, %main_bb22, %main_bb21, %main_bb10
  %base.0 = phi i64 [ 0, %main_bb10 ], [ %"65", %main_bb21 ], [ %"70", %main_bb23 ], [ %"60", %main_bb22 ]
  %i.0 = phi i64 [ 0, %main_bb10 ], [ %.0.i3, %main_bb21 ], [ %.0.i3, %main_bb22 ], [ %.0.i3, %main_bb23 ]
  %"32" = getelementptr inbounds [10 x i64]* %old_, i32 0, i64 %i.0, !dbg !89
  %"33" = load i64* %"32", align 8, !dbg !89
  %"34" = getelementptr inbounds [10 x i64]* %new_, i32 0, i64 %i.0, !dbg !89
  %"35" = load i64* %"34", align 8, !dbg !89
  br label %main_bb11, !dbg !91

main_bb11:                                        ; preds = %main_wrap_around.exit6, %main_wrap_around.exit2
  %number.0 = phi i64 [ %base.0, %main_wrap_around.exit2 ], [ %.0.i5, %main_wrap_around.exit6 ]
  %"36" = icmp ne i64 %"33", %"35", !dbg !89
  br i1 %"36", label %main_bb12, label %main_bb17, !dbg !89

main_bb12:                                        ; preds = %main_bb11
  %"37" = add nsw i64 %number.0, 1, !dbg !79
  %"38" = icmp sgt i64 %"37", 2147483647, !dbg !92
  br i1 %"38", label %main_bb13, label %main_bb14, !dbg !92

main_bb13:                                        ; preds = %main_bb12
  %"39" = sub nsw i64 %"37", 2147483647, !dbg !93
  %"40" = sub nsw i64 %"39", 1, !dbg !93
  %"41" = srem i64 %"40", 4294967296, !dbg !93
  %"42" = add nsw i64 -2147483648, %"41", !dbg !93
  br label %main_wrap_around.exit6, !dbg !93

main_bb14:                                        ; preds = %main_bb12
  %"43" = icmp slt i64 %"37", -2147483648, !dbg !94
  br i1 %"43", label %main_bb15, label %main_wrap_around.exit6, !dbg !94

main_bb15:                                        ; preds = %main_bb14
  %"44" = sub nsw i64 -2147483648, %"37", !dbg !95
  %"45" = sub nsw i64 %"44", 1, !dbg !95
  %"46" = srem i64 %"45", 4294967296, !dbg !95
  %"47" = sub nsw i64 2147483647, %"46", !dbg !95
  br label %main_wrap_around.exit6, !dbg !95

main_wrap_around.exit6:                           ; preds = %main_bb13, %main_bb14, %main_bb15
  %.0.i5 = phi i64 [ %"42", %main_bb13 ], [ %"47", %main_bb15 ], [ %"37", %main_bb14 ], !dbg !79
  %"48" = icmp eq i64 %.0.i5, 100, !dbg !96
  br i1 %"48", label %main_bb16, label %main_bb11, !dbg !96

main_bb16:                                        ; preds = %main_wrap_around.exit6
  ret void, !dbg !98

main_bb17:                                        ; preds = %main_bb11
  %"49" = add nsw i64 %i.0, 1, !dbg !99
  call void @llvm.dbg.value(metadata !{i64 %"49"}, i64 0, metadata !100), !dbg !101
  call void @llvm.dbg.value(metadata !57, i64 0, metadata !102), !dbg !103
  call void @llvm.dbg.value(metadata !60, i64 0, metadata !104), !dbg !105
  call void @llvm.dbg.value(metadata !63, i64 0, metadata !106), !dbg !107
  %"50" = icmp sgt i64 %"49", 2147483647, !dbg !108
  br i1 %"50", label %main_bb18, label %main_bb19, !dbg !108

main_bb18:                                        ; preds = %main_bb17
  %"51" = sub nsw i64 %"49", 2147483647, !dbg !109
  %"52" = sub nsw i64 %"51", 1, !dbg !109
  %"53" = srem i64 %"52", 4294967296, !dbg !109
  %"54" = add nsw i64 -2147483648, %"53", !dbg !109
  br label %main_wrap_around.exit4, !dbg !109

main_bb19:                                        ; preds = %main_bb17
  %"55" = icmp slt i64 %"49", -2147483648, !dbg !110
  br i1 %"55", label %main_bb20, label %main_wrap_around.exit4, !dbg !110

main_bb20:                                        ; preds = %main_bb19
  %"56" = sub nsw i64 -2147483648, %"49", !dbg !111
  %"57" = sub nsw i64 %"56", 1, !dbg !111
  %"58" = srem i64 %"57", 4294967296, !dbg !111
  %"59" = sub nsw i64 2147483647, %"58", !dbg !111
  br label %main_wrap_around.exit4, !dbg !111

main_wrap_around.exit4:                           ; preds = %main_bb18, %main_bb19, %main_bb20
  %.0.i3 = phi i64 [ %"54", %main_bb18 ], [ %"59", %main_bb20 ], [ %"49", %main_bb19 ], !dbg !99
  call void @llvm.dbg.value(metadata !{i64 %.0.i3}, i64 0, metadata !43), !dbg !44
  %"60" = add nsw i64 %base.0, 8, !dbg !112
  call void @llvm.dbg.value(metadata !{i64 %"60"}, i64 0, metadata !113), !dbg !114
  call void @llvm.dbg.value(metadata !57, i64 0, metadata !115), !dbg !116
  call void @llvm.dbg.value(metadata !60, i64 0, metadata !117), !dbg !118
  call void @llvm.dbg.value(metadata !63, i64 0, metadata !119), !dbg !120
  %"61" = icmp sgt i64 %"60", 2147483647, !dbg !121
  br i1 %"61", label %main_bb21, label %main_bb22, !dbg !121

main_bb21:                                        ; preds = %main_wrap_around.exit4
  %"62" = sub nsw i64 %"60", 2147483647, !dbg !122
  %"63" = sub nsw i64 %"62", 1, !dbg !122
  %"64" = srem i64 %"63", 4294967296, !dbg !122
  %"65" = add nsw i64 -2147483648, %"64", !dbg !122
  br label %main_wrap_around.exit2, !dbg !122

main_bb22:                                        ; preds = %main_wrap_around.exit4
  %"66" = icmp slt i64 %"60", -2147483648, !dbg !123
  br i1 %"66", label %main_bb23, label %main_wrap_around.exit2, !dbg !123

main_bb23:                                        ; preds = %main_bb22
  %"67" = sub nsw i64 -2147483648, %"60", !dbg !124
  %"68" = sub nsw i64 %"67", 1, !dbg !124
  %"69" = srem i64 %"68", 4294967296, !dbg !124
  %"70" = sub nsw i64 2147483647, %"69", !dbg !124
  br label %main_wrap_around.exit2, !dbg !124
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #2

declare i64 @__kittel_nondef.0()

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13}
!llvm.ident = !{!14}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [//FILES_DIR/SourceCode_SemanticAugmentor.c] [DW_LANG_C99]
!1 = metadata !{metadata !"FILES_DIR/SourceCode_SemanticAugmentor.c", metadata !"/"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"wrap_around", metadata !"wrap_around", metadata !"", i32 7, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i64, i64, i64)* @wrap_around, null, null, metadata !2, i32 7} ; [ DW_TAG_subprogram ] [line 7] [def] [wrap_around]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 17, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @main, null, null, metadata !2, i32 18} ; [ DW_TAG_subprogram ] [line 17] [def] [scope 18] [main]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{null}
!12 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!13 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!14 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!15 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777223, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 7]
!16 = metadata !{i32 7, i32 33, metadata !4, null}
!17 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554439, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [lower_bound] [line 7]
!18 = metadata !{i32 7, i32 50, metadata !4, null}
!19 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331655, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [upper_bound] [line 7]
!20 = metadata !{i32 7, i32 73, metadata !4, null}
!21 = metadata !{i32 8, i32 5, metadata !4, null} ; [ DW_TAG_imported_declaration ]
!22 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 8, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [range] [line 8]
!23 = metadata !{i32 8, i32 15, metadata !4, null} ; [ DW_TAG_imported_declaration ]
!24 = metadata !{i32 9, i32 9, metadata !25, null}
!25 = metadata !{i32 786443, metadata !1, metadata !4, i32 9, i32 9, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!26 = metadata !{i32 10, i32 9, metadata !27, null}
!27 = metadata !{i32 786443, metadata !1, metadata !25, i32 9, i32 30, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!28 = metadata !{i32 12, i32 14, metadata !29, null}
!29 = metadata !{i32 786443, metadata !1, metadata !25, i32 12, i32 14, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!30 = metadata !{i32 13, i32 9, metadata !31, null}
!31 = metadata !{i32 786443, metadata !1, metadata !29, i32 12, i32 35, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!32 = metadata !{i32 16, i32 1, metadata !4, null}
!33 = metadata !{i32 786688, metadata !9, metadata !"old_", metadata !5, i32 19, metadata !34, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [old_] [line 19]
!34 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 640, i64 64, i32 0, i32 0, metadata !8, metadata !35, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 640, align 64, offset 0] [from long long int]
!35 = metadata !{metadata !36}
!36 = metadata !{i32 786465, i64 0, i64 10}       ; [ DW_TAG_subrange_type ] [0, 9]
!37 = metadata !{i32 19, i32 13, metadata !9, null}
!38 = metadata !{i32 19, i32 3, metadata !9, null}
!39 = metadata !{i32 786688, metadata !9, metadata !"new_", metadata !5, i32 20, metadata !34, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [new_] [line 20]
!40 = metadata !{i32 20, i32 13, metadata !9, null}
!41 = metadata !{i32 20, i32 3, metadata !9, null}
!42 = metadata !{i64 0}
!43 = metadata !{i32 786688, metadata !9, metadata !"i", metadata !5, i32 21, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 21]
!44 = metadata !{i32 21, i32 13, metadata !9, null}
!45 = metadata !{i32 786688, metadata !9, metadata !"base", metadata !5, i32 22, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [base] [line 22]
!46 = metadata !{i32 22, i32 13, metadata !9, null}
!47 = metadata !{i64 100}
!48 = metadata !{i32 786688, metadata !9, metadata !"count", metadata !5, i32 23, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 23]
!49 = metadata !{i32 23, i32 13, metadata !9, null}
!50 = metadata !{i32 786688, metadata !51, metadata !"j", metadata !5, i32 25, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 25]
!51 = metadata !{i32 786443, metadata !1, metadata !9, i32 24, i32 3, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!52 = metadata !{i32 25, i32 15, metadata !51, null}
!53 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777223, metadata !8, i32 0, metadata !54} ; [ DW_TAG_arg_variable ] [value] [line 7]
!54 = metadata !{i32 29, i32 12, metadata !55, null}
!55 = metadata !{i32 786443, metadata !1, metadata !51, i32 26, i32 19, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!56 = metadata !{i32 7, i32 33, metadata !4, metadata !54}
!57 = metadata !{i64 -2147483648}
!58 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554439, metadata !8, i32 0, metadata !54} ; [ DW_TAG_arg_variable ] [lower_bound] [line 7]
!59 = metadata !{i32 7, i32 50, metadata !4, metadata !54}
!60 = metadata !{i64 2147483647}
!61 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331655, metadata !8, i32 0, metadata !54} ; [ DW_TAG_arg_variable ] [upper_bound] [line 7]
!62 = metadata !{i32 7, i32 73, metadata !4, metadata !54}
!63 = metadata !{i64 4294967296}
!64 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 8, metadata !8, i32 0, metadata !54} ; [ DW_TAG_auto_variable ] [range] [line 8]
!65 = metadata !{i32 8, i32 15, metadata !4, metadata !54} ; [ DW_TAG_imported_declaration ]
!66 = metadata !{i32 26, i32 5, metadata !51, null}
!67 = metadata !{i32 26, i32 5, metadata !68, null}
!68 = metadata !{i32 786443, metadata !1, metadata !51, i32 26, i32 5, i32 1, i32 10} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!69 = metadata !{i32 9, i32 9, metadata !25, metadata !54}
!70 = metadata !{i32 10, i32 9, metadata !27, metadata !54}
!71 = metadata !{i32 12, i32 14, metadata !29, metadata !54}
!72 = metadata !{i32 13, i32 9, metadata !31, metadata !54}
!73 = metadata !{i32 32, i32 3, metadata !9, null}
!74 = metadata !{i32 33, i32 3, metadata !9, null}
!75 = metadata !{i32 786688, metadata !76, metadata !"number", metadata !5, i32 35, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [number] [line 35]
!76 = metadata !{i32 786443, metadata !1, metadata !9, i32 34, i32 13, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!77 = metadata !{i32 35, i32 15, metadata !76, null}
!78 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777223, metadata !8, i32 0, metadata !79} ; [ DW_TAG_arg_variable ] [value] [line 7]
!79 = metadata !{i32 37, i32 17, metadata !80, null}
!80 = metadata !{i32 786443, metadata !1, metadata !76, i32 36, i32 32, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!81 = metadata !{i32 7, i32 33, metadata !4, metadata !79}
!82 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554439, metadata !8, i32 0, metadata !79} ; [ DW_TAG_arg_variable ] [lower_bound] [line 7]
!83 = metadata !{i32 7, i32 50, metadata !4, metadata !79}
!84 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331655, metadata !8, i32 0, metadata !79} ; [ DW_TAG_arg_variable ] [upper_bound] [line 7]
!85 = metadata !{i32 7, i32 73, metadata !4, metadata !79}
!86 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 8, metadata !8, i32 0, metadata !79} ; [ DW_TAG_auto_variable ] [range] [line 8]
!87 = metadata !{i32 8, i32 15, metadata !4, metadata !79} ; [ DW_TAG_imported_declaration ]
!88 = metadata !{i32 34, i32 3, metadata !9, null}
!89 = metadata !{i32 36, i32 5, metadata !90, null}
!90 = metadata !{i32 786443, metadata !1, metadata !76, i32 36, i32 5, i32 1, i32 11} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!91 = metadata !{i32 36, i32 5, metadata !76, null}
!92 = metadata !{i32 9, i32 9, metadata !25, metadata !79}
!93 = metadata !{i32 10, i32 9, metadata !27, metadata !79}
!94 = metadata !{i32 12, i32 14, metadata !29, metadata !79}
!95 = metadata !{i32 13, i32 9, metadata !31, metadata !79}
!96 = metadata !{i32 38, i32 11, metadata !97, null}
!97 = metadata !{i32 786443, metadata !1, metadata !80, i32 38, i32 11, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!98 = metadata !{i32 48, i32 3, metadata !9, null}
!99 = metadata !{i32 44, i32 10, metadata !76, null}
!100 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777223, metadata !8, i32 0, metadata !99} ; [ DW_TAG_arg_variable ] [value] [line 7]
!101 = metadata !{i32 7, i32 33, metadata !4, metadata !99}
!102 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554439, metadata !8, i32 0, metadata !99} ; [ DW_TAG_arg_variable ] [lower_bound] [line 7]
!103 = metadata !{i32 7, i32 50, metadata !4, metadata !99}
!104 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331655, metadata !8, i32 0, metadata !99} ; [ DW_TAG_arg_variable ] [upper_bound] [line 7]
!105 = metadata !{i32 7, i32 73, metadata !4, metadata !99}
!106 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 8, metadata !8, i32 0, metadata !99} ; [ DW_TAG_auto_variable ] [range] [line 8]
!107 = metadata !{i32 8, i32 15, metadata !4, metadata !99} ; [ DW_TAG_imported_declaration ]
!108 = metadata !{i32 9, i32 9, metadata !25, metadata !99}
!109 = metadata !{i32 10, i32 9, metadata !27, metadata !99}
!110 = metadata !{i32 12, i32 14, metadata !29, metadata !99}
!111 = metadata !{i32 13, i32 9, metadata !31, metadata !99}
!112 = metadata !{i32 45, i32 12, metadata !76, null}
!113 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777223, metadata !8, i32 0, metadata !112} ; [ DW_TAG_arg_variable ] [value] [line 7]
!114 = metadata !{i32 7, i32 33, metadata !4, metadata !112}
!115 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554439, metadata !8, i32 0, metadata !112} ; [ DW_TAG_arg_variable ] [lower_bound] [line 7]
!116 = metadata !{i32 7, i32 50, metadata !4, metadata !112}
!117 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331655, metadata !8, i32 0, metadata !112} ; [ DW_TAG_arg_variable ] [upper_bound] [line 7]
!118 = metadata !{i32 7, i32 73, metadata !4, metadata !112}
!119 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 8, metadata !8, i32 0, metadata !112} ; [ DW_TAG_auto_variable ] [range] [line 8]
!120 = metadata !{i32 8, i32 15, metadata !4, metadata !112} ; [ DW_TAG_imported_declaration ]
!121 = metadata !{i32 9, i32 9, metadata !25, metadata !112}
!122 = metadata !{i32 10, i32 9, metadata !27, metadata !112}
!123 = metadata !{i32 12, i32 14, metadata !29, metadata !112}
!124 = metadata !{i32 13, i32 9, metadata !31, metadata !112}

