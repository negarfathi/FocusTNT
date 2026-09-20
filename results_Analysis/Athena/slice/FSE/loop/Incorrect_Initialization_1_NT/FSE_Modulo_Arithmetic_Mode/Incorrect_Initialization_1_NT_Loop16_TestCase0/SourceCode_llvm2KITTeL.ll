; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@"'memory0_freeIndex" = global i32 1, align 4
@"'memory1_freeIndex" = global i32 1, align 4
@memory1 = common global [100000 x i64] zeroinitializer, align 16
@memory0 = common global [100000 x i64] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define i64 @wrap_around(i64 %value, i64 %lower_bound, i64 %upper_bound) #0 {
wrap_around_bb0:
  call void @llvm.dbg.value(metadata !{i64 %value}, i64 0, metadata !31), !dbg !32
  call void @llvm.dbg.value(metadata !{i64 %lower_bound}, i64 0, metadata !33), !dbg !34
  call void @llvm.dbg.value(metadata !{i64 %upper_bound}, i64 0, metadata !35), !dbg !36
  %"0" = sub nsw i64 %upper_bound, %lower_bound, !dbg !37
  %"1" = add nsw i64 %"0", 1, !dbg !37
  call void @llvm.dbg.value(metadata !{i64 %"1"}, i64 0, metadata !38), !dbg !39
  %"2" = icmp sgt i64 %value, %upper_bound, !dbg !40
  br i1 %"2", label %wrap_around_bb1, label %wrap_around_bb2, !dbg !40

wrap_around_bb1:                                  ; preds = %wrap_around_bb0
  %"3" = sub nsw i64 %value, %upper_bound, !dbg !42
  %"4" = sub nsw i64 %"3", 1, !dbg !42
  %"5" = srem i64 %"4", %"1", !dbg !42
  %"6" = add nsw i64 %lower_bound, %"5", !dbg !42
  br label %wrap_around_bb4, !dbg !42

wrap_around_bb2:                                  ; preds = %wrap_around_bb0
  %"7" = icmp slt i64 %value, %lower_bound, !dbg !44
  br i1 %"7", label %wrap_around_bb3, label %wrap_around_bb4, !dbg !44

wrap_around_bb3:                                  ; preds = %wrap_around_bb2
  %"8" = sub nsw i64 %lower_bound, %value, !dbg !46
  %"9" = sub nsw i64 %"8", 1, !dbg !46
  %"10" = srem i64 %"9", %"1", !dbg !46
  %"11" = sub nsw i64 %upper_bound, %"10", !dbg !46
  br label %wrap_around_bb4, !dbg !46

wrap_around_bb4:                                  ; preds = %wrap_around_bb2, %wrap_around_bb3, %wrap_around_bb1
  %.0 = phi i64 [ %"6", %wrap_around_bb1 ], [ %"11", %wrap_around_bb3 ], [ %value, %wrap_around_bb2 ]
  ret i64 %.0, !dbg !48
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @allocate_memory0(i32 %size) #0 {
allocate_memory0_bb5:
  call void @llvm.dbg.value(metadata !{i32 %size}, i64 0, metadata !49), !dbg !50
  %"12" = load i32* @"'memory0_freeIndex", align 4, !dbg !51
  call void @llvm.dbg.value(metadata !{i32 %"12"}, i64 0, metadata !52), !dbg !53
  %"13" = load i32* @"'memory0_freeIndex", align 4, !dbg !54
  %"14" = add nsw i32 %"13", %size, !dbg !54
  store i32 %"14", i32* @"'memory0_freeIndex", align 4, !dbg !54
  ret i32 %"12", !dbg !55
}

; Function Attrs: nounwind uwtable
define i32 @allocate_memory1(i32 %size) #0 {
allocate_memory1_bb6:
  call void @llvm.dbg.value(metadata !{i32 %size}, i64 0, metadata !56), !dbg !57
  %"15" = load i32* @"'memory1_freeIndex", align 4, !dbg !58
  call void @llvm.dbg.value(metadata !{i32 %"15"}, i64 0, metadata !59), !dbg !60
  %"16" = load i32* @"'memory1_freeIndex", align 4, !dbg !61
  %"17" = add nsw i32 %"16", %size, !dbg !61
  store i32 %"17", i32* @"'memory1_freeIndex", align 4, !dbg !61
  ret i32 %"15", !dbg !62
}

; Function Attrs: nounwind uwtable
define i64 @strcspn_slice_1(i32 %strSrc, i32 %str) #0 {
strcspn_slice_1_bb7:
  call void @llvm.dbg.value(metadata !{i32 %strSrc}, i64 0, metadata !63), !dbg !64
  call void @llvm.dbg.value(metadata !{i32 %str}, i64 0, metadata !65), !dbg !66
  call void @llvm.dbg.value(metadata !{i32 %strSrc}, i64 0, metadata !67), !dbg !68
  call void @llvm.dbg.value(metadata !{i32 %str}, i64 0, metadata !69), !dbg !70
  call void @llvm.dbg.value(metadata !{i32 %"39"}, i64 0, metadata !69), !dbg !70
  br label %strcspn_slice_1_bb8, !dbg !71

strcspn_slice_1_bb8:                              ; preds = %strcspn_slice_1_bb14, %strcspn_slice_1_bb7
  %t.0 = phi i32 [ %strSrc, %strcspn_slice_1_bb7 ], [ %"40", %strcspn_slice_1_bb14 ]
  %"18" = sext i32 %t.0 to i64, !dbg !72
  %"19" = getelementptr inbounds [100000 x i64]* @memory1, i32 0, i64 %"18", !dbg !72
  %"20" = load i64* %"19", align 8, !dbg !72
  %"21" = trunc i64 %"20" to i32, !dbg !72
  %"22" = icmp ne i32 %"21", 0, !dbg !72
  br i1 %"22", label %strcspn_slice_1_bb9, label %strcspn_slice_1_bb15, !dbg !72

strcspn_slice_1_bb9:                              ; preds = %strcspn_slice_1_bb8
  %"23" = sext i32 %t.0 to i64, !dbg !74
  %"24" = getelementptr inbounds [100000 x i64]* @memory1, i32 0, i64 %"23", !dbg !74
  %"25" = load i64* %"24", align 8, !dbg !74
  %"26" = trunc i64 %"25" to i32, !dbg !74
  br label %strcspn_slice_1_bb10, !dbg !78

strcspn_slice_1_bb10:                             ; preds = %strcspn_slice_1_bb13, %strcspn_slice_1_bb9
  %s.0 = phi i32 [ %str, %strcspn_slice_1_bb9 ], [ %"39", %strcspn_slice_1_bb13 ]
  %"27" = sext i32 %s.0 to i64, !dbg !79
  %"28" = getelementptr inbounds [100000 x i64]* @memory0, i32 0, i64 %"27", !dbg !79
  %"29" = load i64* %"28", align 8, !dbg !79
  %"30" = trunc i64 %"29" to i32, !dbg !79
  %"31" = icmp ne i32 %"30", 0, !dbg !79
  br i1 %"31", label %strcspn_slice_1_bb11, label %strcspn_slice_1_bb14, !dbg !79

strcspn_slice_1_bb11:                             ; preds = %strcspn_slice_1_bb10
  %"32" = sext i32 %s.0 to i64, !dbg !74
  %"33" = getelementptr inbounds [100000 x i64]* @memory0, i32 0, i64 %"32", !dbg !74
  %"34" = load i64* %"33", align 8, !dbg !74
  %"35" = trunc i64 %"34" to i32, !dbg !74
  %"36" = icmp eq i32 %"26", %"35", !dbg !74
  br i1 %"36", label %strcspn_slice_1_bb12, label %strcspn_slice_1_bb13, !dbg !74

strcspn_slice_1_bb12:                             ; preds = %strcspn_slice_1_bb11
  %"37" = sub nsw i32 %t.0, %strSrc, !dbg !81
  %"38" = sext i32 %"37" to i64, !dbg !81
  call void @llvm.dbg.value(metadata !{i64 %"38"}, i64 0, metadata !83), !dbg !84
  br label %strcspn_slice_1_bb15, !dbg !85

strcspn_slice_1_bb13:                             ; preds = %strcspn_slice_1_bb11
  %"39" = add nsw i32 %s.0, 1, !dbg !86
  br label %strcspn_slice_1_bb10, !dbg !87

strcspn_slice_1_bb14:                             ; preds = %strcspn_slice_1_bb10
  %"40" = add nsw i32 %t.0, 1, !dbg !88
  call void @llvm.dbg.value(metadata !{i32 %"40"}, i64 0, metadata !67), !dbg !68
  br label %strcspn_slice_1_bb8, !dbg !89

strcspn_slice_1_bb15:                             ; preds = %strcspn_slice_1_bb8, %strcspn_slice_1_bb12
  %__retres.0 = phi i64 [ %"38", %strcspn_slice_1_bb12 ], [ 0, %strcspn_slice_1_bb8 ]
  ret i64 %__retres.0, !dbg !90
}

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb16:
  call void @llvm.dbg.value(metadata !91, i64 0, metadata !92), !dbg !94
  %"41" = load i32* @"'memory0_freeIndex", align 4, !dbg !95
  call void @llvm.dbg.value(metadata !{i32 %"41"}, i64 0, metadata !96), !dbg !97
  %"42" = load i32* @"'memory0_freeIndex", align 4, !dbg !98
  %"43" = add nsw i32 %"42", 2, !dbg !98
  store i32 %"43", i32* @"'memory0_freeIndex", align 4, !dbg !98
  call void @llvm.dbg.value(metadata !{i32 %"41"}, i64 0, metadata !99), !dbg !100
  %"44" = add nsw i32 %"41", 0, !dbg !101
  %"45" = sext i32 %"44" to i64, !dbg !101
  %"46" = getelementptr inbounds [100000 x i64]* @memory0, i32 0, i64 %"45", !dbg !101
  store i64 10, i64* %"46", align 8, !dbg !101
  %"47" = add nsw i32 %"41", 1, !dbg !102
  %"48" = sext i32 %"47" to i64, !dbg !102
  %"49" = getelementptr inbounds [100000 x i64]* @memory0, i32 0, i64 %"48", !dbg !102
  store i64 0, i64* %"49", align 8, !dbg !102
  call void @llvm.dbg.value(metadata !103, i64 0, metadata !104), !dbg !106
  %"50" = load i32* @"'memory1_freeIndex", align 4, !dbg !107
  call void @llvm.dbg.value(metadata !{i32 %"50"}, i64 0, metadata !108), !dbg !109
  %"51" = load i32* @"'memory1_freeIndex", align 4, !dbg !110
  %"52" = add nsw i32 %"51", 100, !dbg !110
  store i32 %"52", i32* @"'memory1_freeIndex", align 4, !dbg !110
  call void @llvm.dbg.value(metadata !{i32 %"50"}, i64 0, metadata !111), !dbg !112
  call void @llvm.dbg.value(metadata !113, i64 0, metadata !114), !dbg !116
  %"53" = sext i32 %"50" to i64, !dbg !117
  call void @llvm.dbg.value(metadata !{i64 %"58"}, i64 0, metadata !119), !dbg !121
  call void @llvm.dbg.value(metadata !122, i64 0, metadata !123), !dbg !124
  call void @llvm.dbg.value(metadata !125, i64 0, metadata !126), !dbg !127
  call void @llvm.dbg.value(metadata !128, i64 0, metadata !129), !dbg !130
  br label %main_wrap_around.exit, !dbg !131

main_wrap_around.exit:                            ; preds = %main_bb20, %main_bb19, %main_bb18, %main_bb16
  %i.0 = phi i64 [ 0, %main_bb16 ], [ %"63", %main_bb18 ], [ %"68", %main_bb20 ], [ %"58", %main_bb19 ]
  %"54" = icmp slt i64 %i.0, 99, !dbg !132
  br i1 %"54", label %main_bb17, label %main_bb21, !dbg !132

main_bb17:                                        ; preds = %main_wrap_around.exit
  %"55" = call i64 @__VERIFIER_nondet_char(), !dbg !117
  %"56" = add nsw i64 %"53", %i.0, !dbg !117
  %"57" = getelementptr inbounds [100000 x i64]* @memory1, i32 0, i64 %"56", !dbg !117
  store i64 %"55", i64* %"57", align 8, !dbg !117
  %"58" = add nsw i64 %i.0, 1, !dbg !120
  %"59" = icmp sgt i64 %"58", 2147483647, !dbg !134
  br i1 %"59", label %main_bb18, label %main_bb19, !dbg !134

main_bb18:                                        ; preds = %main_bb17
  %"60" = sub nsw i64 %"58", 2147483647, !dbg !135
  %"61" = sub nsw i64 %"60", 1, !dbg !135
  %"62" = srem i64 %"61", 4294967296, !dbg !135
  %"63" = add nsw i64 -2147483648, %"62", !dbg !135
  br label %main_wrap_around.exit, !dbg !135

main_bb19:                                        ; preds = %main_bb17
  %"64" = icmp slt i64 %"58", -2147483648, !dbg !136
  br i1 %"64", label %main_bb20, label %main_wrap_around.exit, !dbg !136

main_bb20:                                        ; preds = %main_bb19
  %"65" = sub nsw i64 -2147483648, %"58", !dbg !137
  %"66" = sub nsw i64 %"65", 1, !dbg !137
  %"67" = srem i64 %"66", 4294967296, !dbg !137
  %"68" = sub nsw i64 2147483647, %"67", !dbg !137
  br label %main_wrap_around.exit, !dbg !137

main_bb21:                                        ; preds = %main_wrap_around.exit
  %"69" = add nsw i32 %"50", 99, !dbg !138
  %"70" = sext i32 %"69" to i64, !dbg !138
  %"71" = getelementptr inbounds [100000 x i64]* @memory1, i32 0, i64 %"70", !dbg !138
  store i64 0, i64* %"71", align 8, !dbg !138
  call void @llvm.dbg.value(metadata !{i32 %"50"}, i64 0, metadata !139), !dbg !140
  call void @llvm.dbg.value(metadata !{i32 %p.0}, i64 0, metadata !141), !dbg !144
  call void @llvm.dbg.value(metadata !{i32 %"41"}, i64 0, metadata !145), !dbg !146
  call void @llvm.dbg.value(metadata !{i32 %p.0}, i64 0, metadata !147), !dbg !148
  call void @llvm.dbg.value(metadata !{i32 %"41"}, i64 0, metadata !149), !dbg !150
  br label %main_bb22, !dbg !151

main_bb22:                                        ; preds = %main_strcspn_slice_1.exit, %main_bb21
  %p.0 = phi i32 [ %"50", %main_bb21 ], [ %"101", %main_strcspn_slice_1.exit ]
  %"72" = sext i32 %p.0 to i64, !dbg !152
  %"73" = getelementptr inbounds [100000 x i64]* @memory1, i32 0, i64 %"72", !dbg !152
  %"74" = load i64* %"73", align 8, !dbg !152
  %"75" = icmp ne i64 %"74", 0, !dbg !152
  br i1 %"75", label %main_bb23, label %main_bb30, !dbg !152

main_bb23:                                        ; preds = %main_bb22, %main_bb29
  %t.0.i = phi i32 [ %"98", %main_bb29 ], [ %p.0, %main_bb22 ], !dbg !142
  %"76" = sext i32 %t.0.i to i64, !dbg !154
  %"77" = getelementptr inbounds [100000 x i64]* @memory1, i32 0, i64 %"76", !dbg !154
  %"78" = load i64* %"77", align 8, !dbg !154
  %"79" = trunc i64 %"78" to i32, !dbg !154
  %"80" = icmp ne i32 %"79", 0, !dbg !154
  br i1 %"80", label %main_bb24, label %main_strcspn_slice_1.exit, !dbg !154

main_bb24:                                        ; preds = %main_bb23
  %"81" = sext i32 %t.0.i to i64, !dbg !155
  %"82" = getelementptr inbounds [100000 x i64]* @memory1, i32 0, i64 %"81", !dbg !155
  %"83" = load i64* %"82", align 8, !dbg !155
  %"84" = trunc i64 %"83" to i32, !dbg !155
  br label %main_bb25, !dbg !156

main_bb25:                                        ; preds = %main_bb28, %main_bb24
  %s.0.i = phi i32 [ %"41", %main_bb24 ], [ %"97", %main_bb28 ], !dbg !142
  %"85" = sext i32 %s.0.i to i64, !dbg !157
  %"86" = getelementptr inbounds [100000 x i64]* @memory0, i32 0, i64 %"85", !dbg !157
  %"87" = load i64* %"86", align 8, !dbg !157
  %"88" = trunc i64 %"87" to i32, !dbg !157
  %"89" = icmp ne i32 %"88", 0, !dbg !157
  br i1 %"89", label %main_bb26, label %main_bb29, !dbg !157

main_bb26:                                        ; preds = %main_bb25
  %"90" = sext i32 %s.0.i to i64, !dbg !155
  %"91" = getelementptr inbounds [100000 x i64]* @memory0, i32 0, i64 %"90", !dbg !155
  %"92" = load i64* %"91", align 8, !dbg !155
  %"93" = trunc i64 %"92" to i32, !dbg !155
  %"94" = icmp eq i32 %"84", %"93", !dbg !155
  br i1 %"94", label %main_bb27, label %main_bb28, !dbg !155

main_bb27:                                        ; preds = %main_bb26
  %"95" = sub nsw i32 %t.0.i, %p.0, !dbg !158
  %"96" = sext i32 %"95" to i64, !dbg !158
  call void @llvm.dbg.value(metadata !{i64 %"96"}, i64 0, metadata !159), !dbg !160
  br label %main_strcspn_slice_1.exit, !dbg !161

main_bb28:                                        ; preds = %main_bb26
  %"97" = add nsw i32 %s.0.i, 1, !dbg !162
  br label %main_bb25, !dbg !163

main_bb29:                                        ; preds = %main_bb25
  %"98" = add nsw i32 %t.0.i, 1, !dbg !164
  call void @llvm.dbg.value(metadata !{i32 %"98"}, i64 0, metadata !147), !dbg !148
  br label %main_bb23, !dbg !165

main_strcspn_slice_1.exit:                        ; preds = %main_bb23, %main_bb27
  %__retres.0.i = phi i64 [ %"96", %main_bb27 ], [ 0, %main_bb23 ], !dbg !142
  call void @llvm.dbg.value(metadata !{i64 %__retres.0.i}, i64 0, metadata !166), !dbg !167
  %"99" = sext i32 %p.0 to i64, !dbg !168
  %"100" = add nsw i64 %"99", %__retres.0.i, !dbg !168
  %"101" = trunc i64 %"100" to i32, !dbg !168
  call void @llvm.dbg.value(metadata !{i32 %"101"}, i64 0, metadata !139), !dbg !140
  br label %main_bb22, !dbg !169

main_bb30:                                        ; preds = %main_bb22
  ret void, !dbg !170
}

declare i64 @__VERIFIER_nondet_char() #2

declare i64 @__kittel_nondef.0()

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

declare i32 @__kittel_nondef.1()

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!28, !29}
!llvm.ident = !{!30}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !20, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [//FILES_DIR/SourceCode_SemanticAugmentor.c] [DW_LANG_C99]
!1 = metadata !{metadata !"FILES_DIR/SourceCode_SemanticAugmentor.c", metadata !"/"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9, metadata !13, metadata !14, metadata !17}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"wrap_around", metadata !"wrap_around", metadata !"", i32 10, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i64, i64, i64)* @wrap_around, null, null, metadata !2, i32 10} ; [ DW_TAG_subprogram ] [line 10] [def] [wrap_around]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"allocate_memory0", metadata !"allocate_memory0", metadata !"", i32 20, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @allocate_memory0, null, null, metadata !2, i32 20} ; [ DW_TAG_subprogram ] [line 20] [def] [allocate_memory0]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !12, metadata !12}
!12 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!13 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"allocate_memory1", metadata !"allocate_memory1", metadata !"", i32 29, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @allocate_memory1, null, null, metadata !2, i32 29} ; [ DW_TAG_subprogram ] [line 29] [def] [allocate_memory1]
!14 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"strcspn_slice_1", metadata !"strcspn_slice_1", metadata !"", i32 35, metadata !15, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i32, i32)* @strcspn_slice_1, null, null, metadata !2, i32 36} ; [ DW_TAG_subprogram ] [line 35] [def] [scope 36] [strcspn_slice_1]
!15 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !16, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!16 = metadata !{metadata !8, metadata !12, metadata !12}
!17 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 57, metadata !18, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @main, null, null, metadata !2, i32 58} ; [ DW_TAG_subprogram ] [line 57] [def] [scope 58] [main]
!18 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !19, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = metadata !{null}
!20 = metadata !{metadata !21, metadata !22, metadata !23, metadata !27}
!21 = metadata !{i32 786484, i32 0, null, metadata !"memory0_freeIndex", metadata !"memory0_freeIndex", metadata !"", metadata !5, i32 9, metadata !12, i32 0, i32 1, i32* @"'memory0_freeIndex", null} ; [ DW_TAG_variable ] [memory0_freeIndex] [line 9] [def]
!22 = metadata !{i32 786484, i32 0, null, metadata !"memory1_freeIndex", metadata !"memory1_freeIndex", metadata !"", metadata !5, i32 28, metadata !12, i32 0, i32 1, i32* @"'memory1_freeIndex", null} ; [ DW_TAG_variable ] [memory1_freeIndex] [line 28] [def]
!23 = metadata !{i32 786484, i32 0, null, metadata !"memory0", metadata !"memory0", metadata !"", metadata !5, i32 8, metadata !24, i32 0, i32 1, [100000 x i64]* @memory0, null} ; [ DW_TAG_variable ] [memory0] [line 8] [def]
!24 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 6400000, i64 64, i32 0, i32 0, metadata !8, metadata !25, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 6400000, align 64, offset 0] [from long long int]
!25 = metadata !{metadata !26}
!26 = metadata !{i32 786465, i64 0, i64 100000}   ; [ DW_TAG_subrange_type ] [0, 99999]
!27 = metadata !{i32 786484, i32 0, null, metadata !"memory1", metadata !"memory1", metadata !"", metadata !5, i32 27, metadata !24, i32 0, i32 1, [100000 x i64]* @memory1, null} ; [ DW_TAG_variable ] [memory1] [line 27] [def]
!28 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!29 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!30 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!31 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777226, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 10]
!32 = metadata !{i32 10, i32 33, metadata !4, null}
!33 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554442, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [lower_bound] [line 10]
!34 = metadata !{i32 10, i32 50, metadata !4, null}
!35 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331658, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [upper_bound] [line 10]
!36 = metadata !{i32 10, i32 73, metadata !4, null}
!37 = metadata !{i32 11, i32 5, metadata !4, null}
!38 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 11, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [range] [line 11]
!39 = metadata !{i32 11, i32 15, metadata !4, null}
!40 = metadata !{i32 12, i32 9, metadata !41, null}
!41 = metadata !{i32 786443, metadata !1, metadata !4, i32 12, i32 9, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!42 = metadata !{i32 13, i32 9, metadata !43, null}
!43 = metadata !{i32 786443, metadata !1, metadata !41, i32 12, i32 30, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!44 = metadata !{i32 15, i32 14, metadata !45, null}
!45 = metadata !{i32 786443, metadata !1, metadata !41, i32 15, i32 14, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!46 = metadata !{i32 16, i32 9, metadata !47, null}
!47 = metadata !{i32 786443, metadata !1, metadata !45, i32 15, i32 35, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!48 = metadata !{i32 19, i32 1, metadata !4, null}
!49 = metadata !{i32 786689, metadata !9, metadata !"size", metadata !5, i32 16777236, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 20]
!50 = metadata !{i32 20, i32 26, metadata !9, null}
!51 = metadata !{i32 21, i32 4, metadata !9, null}
!52 = metadata !{i32 786688, metadata !9, metadata !"allocatedIndex", metadata !5, i32 21, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [allocatedIndex] [line 21]
!53 = metadata !{i32 21, i32 8, metadata !9, null}
!54 = metadata !{i32 22, i32 4, metadata !9, null}
!55 = metadata !{i32 23, i32 4, metadata !9, null}
!56 = metadata !{i32 786689, metadata !13, metadata !"size", metadata !5, i32 16777245, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 29]
!57 = metadata !{i32 29, i32 26, metadata !13, null}
!58 = metadata !{i32 30, i32 4, metadata !13, null}
!59 = metadata !{i32 786688, metadata !13, metadata !"allocatedIndex", metadata !5, i32 30, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [allocatedIndex] [line 30]
!60 = metadata !{i32 30, i32 8, metadata !13, null}
!61 = metadata !{i32 31, i32 4, metadata !13, null}
!62 = metadata !{i32 32, i32 4, metadata !13, null}
!63 = metadata !{i32 786689, metadata !14, metadata !"strSrc", metadata !5, i32 16777251, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [strSrc] [line 35]
!64 = metadata !{i32 35, i32 31, metadata !14, null}
!65 = metadata !{i32 786689, metadata !14, metadata !"str", metadata !5, i32 33554467, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [str] [line 35]
!66 = metadata !{i32 35, i32 43, metadata !14, null}
!67 = metadata !{i32 786688, metadata !14, metadata !"t", metadata !5, i32 39, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t] [line 39]
!68 = metadata !{i32 39, i32 7, metadata !14, null}
!69 = metadata !{i32 786688, metadata !14, metadata !"s", metadata !5, i32 38, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [s] [line 38]
!70 = metadata !{i32 38, i32 7, metadata !14, null}
!71 = metadata !{i32 40, i32 3, metadata !14, null}
!72 = metadata !{i32 40, i32 3, metadata !73, null}
!73 = metadata !{i32 786443, metadata !1, metadata !14, i32 40, i32 3, i32 1, i32 11} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!74 = metadata !{i32 43, i32 11, metadata !75, null}
!75 = metadata !{i32 786443, metadata !1, metadata !76, i32 43, i32 11, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!76 = metadata !{i32 786443, metadata !1, metadata !77, i32 42, i32 39, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!77 = metadata !{i32 786443, metadata !1, metadata !14, i32 40, i32 37, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!78 = metadata !{i32 42, i32 5, metadata !77, null}
!79 = metadata !{i32 42, i32 5, metadata !80, null}
!80 = metadata !{i32 786443, metadata !1, metadata !77, i32 42, i32 5, i32 1, i32 12} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!81 = metadata !{i32 46, i32 9, metadata !82, null}
!82 = metadata !{i32 786443, metadata !1, metadata !75, i32 43, i32 47, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!83 = metadata !{i32 786688, metadata !14, metadata !"__retres", metadata !5, i32 37, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__retres] [line 37]
!84 = metadata !{i32 37, i32 13, metadata !14, null}
!85 = metadata !{i32 47, i32 9, metadata !82, null}
!86 = metadata !{i32 49, i32 7, metadata !76, null}
!87 = metadata !{i32 50, i32 5, metadata !76, null}
!88 = metadata !{i32 51, i32 5, metadata !77, null}
!89 = metadata !{i32 52, i32 3, metadata !77, null}
!90 = metadata !{i32 54, i32 17, metadata !14, null}
!91 = metadata !{i32 2}
!92 = metadata !{i32 786689, metadata !9, metadata !"size", metadata !5, i32 16777236, metadata !12, i32 0, metadata !93} ; [ DW_TAG_arg_variable ] [size] [line 20]
!93 = metadata !{i32 59, i32 21, metadata !17, null}
!94 = metadata !{i32 20, i32 26, metadata !9, metadata !93}
!95 = metadata !{i32 21, i32 4, metadata !9, metadata !93}
!96 = metadata !{i32 786688, metadata !9, metadata !"allocatedIndex", metadata !5, i32 21, metadata !12, i32 0, metadata !93} ; [ DW_TAG_auto_variable ] [allocatedIndex] [line 21]
!97 = metadata !{i32 21, i32 8, metadata !9, metadata !93}
!98 = metadata !{i32 22, i32 4, metadata !9, metadata !93}
!99 = metadata !{i32 786688, metadata !17, metadata !"newLine_index", metadata !5, i32 59, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [newLine_index] [line 59]
!100 = metadata !{i32 59, i32 5, metadata !17, null}
!101 = metadata !{i32 60, i32 1, metadata !17, null}
!102 = metadata !{i32 61, i32 1, metadata !17, null}
!103 = metadata !{i32 100}
!104 = metadata !{i32 786689, metadata !13, metadata !"size", metadata !5, i32 16777245, metadata !12, i32 0, metadata !105} ; [ DW_TAG_arg_variable ] [size] [line 29]
!105 = metadata !{i32 62, i32 19, metadata !17, null}
!106 = metadata !{i32 29, i32 26, metadata !13, metadata !105}
!107 = metadata !{i32 30, i32 4, metadata !13, metadata !105}
!108 = metadata !{i32 786688, metadata !13, metadata !"allocatedIndex", metadata !5, i32 30, metadata !12, i32 0, metadata !105} ; [ DW_TAG_auto_variable ] [allocatedIndex] [line 30]
!109 = metadata !{i32 30, i32 8, metadata !13, metadata !105}
!110 = metadata !{i32 31, i32 4, metadata !13, metadata !105}
!111 = metadata !{i32 786688, metadata !17, metadata !"buf_index", metadata !5, i32 62, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [buf_index] [line 62]
!112 = metadata !{i32 62, i32 7, metadata !17, null}
!113 = metadata !{i64 0}
!114 = metadata !{i32 786688, metadata !115, metadata !"i", metadata !5, i32 64, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 64]
!115 = metadata !{i32 786443, metadata !1, metadata !17, i32 63, i32 3, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!116 = metadata !{i32 64, i32 15, metadata !115, null}
!117 = metadata !{i32 66, i32 34, metadata !118, null}
!118 = metadata !{i32 786443, metadata !1, metadata !115, i32 65, i32 20, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!119 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777226, metadata !8, i32 0, metadata !120} ; [ DW_TAG_arg_variable ] [value] [line 10]
!120 = metadata !{i32 67, i32 12, metadata !118, null}
!121 = metadata !{i32 10, i32 33, metadata !4, metadata !120}
!122 = metadata !{i64 -2147483648}
!123 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554442, metadata !8, i32 0, metadata !120} ; [ DW_TAG_arg_variable ] [lower_bound] [line 10]
!124 = metadata !{i32 10, i32 50, metadata !4, metadata !120}
!125 = metadata !{i64 2147483647}
!126 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331658, metadata !8, i32 0, metadata !120} ; [ DW_TAG_arg_variable ] [upper_bound] [line 10]
!127 = metadata !{i32 10, i32 73, metadata !4, metadata !120}
!128 = metadata !{i64 4294967296}
!129 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 11, metadata !8, i32 0, metadata !120} ; [ DW_TAG_auto_variable ] [range] [line 11]
!130 = metadata !{i32 11, i32 15, metadata !4, metadata !120}
!131 = metadata !{i32 65, i32 5, metadata !115, null}
!132 = metadata !{i32 65, i32 5, metadata !133, null}
!133 = metadata !{i32 786443, metadata !1, metadata !115, i32 65, i32 5, i32 1, i32 13} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!134 = metadata !{i32 12, i32 9, metadata !41, metadata !120}
!135 = metadata !{i32 13, i32 9, metadata !43, metadata !120}
!136 = metadata !{i32 15, i32 14, metadata !45, metadata !120}
!137 = metadata !{i32 16, i32 9, metadata !47, metadata !120}
!138 = metadata !{i32 70, i32 3, metadata !17, null}
!139 = metadata !{i32 786688, metadata !17, metadata !"p", metadata !5, i32 71, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [p] [line 71]
!140 = metadata !{i32 71, i32 7, metadata !17, null}
!141 = metadata !{i32 786689, metadata !14, metadata !"strSrc", metadata !5, i32 16777251, metadata !12, i32 0, metadata !142} ; [ DW_TAG_arg_variable ] [strSrc] [line 35]
!142 = metadata !{i32 73, i32 21, metadata !143, null}
!143 = metadata !{i32 786443, metadata !1, metadata !17, i32 72, i32 22, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!144 = metadata !{i32 35, i32 31, metadata !14, metadata !142}
!145 = metadata !{i32 786689, metadata !14, metadata !"str", metadata !5, i32 33554467, metadata !12, i32 0, metadata !142} ; [ DW_TAG_arg_variable ] [str] [line 35]
!146 = metadata !{i32 35, i32 43, metadata !14, metadata !142}
!147 = metadata !{i32 786688, metadata !14, metadata !"t", metadata !5, i32 39, metadata !12, i32 0, metadata !142} ; [ DW_TAG_auto_variable ] [t] [line 39]
!148 = metadata !{i32 39, i32 7, metadata !14, metadata !142}
!149 = metadata !{i32 786688, metadata !14, metadata !"s", metadata !5, i32 38, metadata !12, i32 0, metadata !142} ; [ DW_TAG_auto_variable ] [s] [line 38]
!150 = metadata !{i32 38, i32 7, metadata !14, metadata !142}
!151 = metadata !{i32 72, i32 3, metadata !17, null}
!152 = metadata !{i32 72, i32 3, metadata !153, null}
!153 = metadata !{i32 786443, metadata !1, metadata !17, i32 72, i32 3, i32 1, i32 14} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!154 = metadata !{i32 40, i32 3, metadata !73, metadata !142}
!155 = metadata !{i32 43, i32 11, metadata !75, metadata !142}
!156 = metadata !{i32 42, i32 5, metadata !77, metadata !142}
!157 = metadata !{i32 42, i32 5, metadata !80, metadata !142}
!158 = metadata !{i32 46, i32 9, metadata !82, metadata !142}
!159 = metadata !{i32 786688, metadata !14, metadata !"__retres", metadata !5, i32 37, metadata !8, i32 0, metadata !142} ; [ DW_TAG_auto_variable ] [__retres] [line 37]
!160 = metadata !{i32 37, i32 13, metadata !14, metadata !142}
!161 = metadata !{i32 47, i32 9, metadata !82, metadata !142}
!162 = metadata !{i32 49, i32 7, metadata !76, metadata !142}
!163 = metadata !{i32 50, i32 5, metadata !76, metadata !142}
!164 = metadata !{i32 51, i32 5, metadata !77, metadata !142}
!165 = metadata !{i32 52, i32 3, metadata !77, metadata !142}
!166 = metadata !{i32 786688, metadata !143, metadata !"len", metadata !5, i32 73, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [len] [line 73]
!167 = metadata !{i32 73, i32 15, metadata !143, null}
!168 = metadata !{i32 74, i32 5, metadata !143, null}
!169 = metadata !{i32 75, i32 3, metadata !143, null}
!170 = metadata !{i32 76, i32 3, metadata !17, null}

