; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Node = type { i64, i64 }

@"'memory0_freeIndex" = global i32 1, align 4
@memory0 = common global [100000 x %struct.Node] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define i64 @wrap_around(i64 %value, i64 %lower_bound, i64 %upper_bound) #0 {
wrap_around_bb0:
  call void @llvm.dbg.value(metadata !{i64 %value}, i64 0, metadata !30), !dbg !31
  call void @llvm.dbg.value(metadata !{i64 %lower_bound}, i64 0, metadata !32), !dbg !33
  call void @llvm.dbg.value(metadata !{i64 %upper_bound}, i64 0, metadata !34), !dbg !35
  %"0" = sub nsw i64 %upper_bound, %lower_bound, !dbg !36
  %"1" = add nsw i64 %"0", 1, !dbg !36
  call void @llvm.dbg.value(metadata !{i64 %"1"}, i64 0, metadata !37), !dbg !38
  %"2" = icmp sgt i64 %value, %upper_bound, !dbg !39
  br i1 %"2", label %wrap_around_bb1, label %wrap_around_bb2, !dbg !39

wrap_around_bb1:                                  ; preds = %wrap_around_bb0
  %"3" = sub nsw i64 %value, %upper_bound, !dbg !41
  %"4" = sub nsw i64 %"3", 1, !dbg !41
  %"5" = srem i64 %"4", %"1", !dbg !41
  %"6" = add nsw i64 %lower_bound, %"5", !dbg !41
  br label %wrap_around_bb4, !dbg !41

wrap_around_bb2:                                  ; preds = %wrap_around_bb0
  %"7" = icmp slt i64 %value, %lower_bound, !dbg !43
  br i1 %"7", label %wrap_around_bb3, label %wrap_around_bb4, !dbg !43

wrap_around_bb3:                                  ; preds = %wrap_around_bb2
  %"8" = sub nsw i64 %lower_bound, %value, !dbg !45
  %"9" = sub nsw i64 %"8", 1, !dbg !45
  %"10" = srem i64 %"9", %"1", !dbg !45
  %"11" = sub nsw i64 %upper_bound, %"10", !dbg !45
  br label %wrap_around_bb4, !dbg !45

wrap_around_bb4:                                  ; preds = %wrap_around_bb2, %wrap_around_bb3, %wrap_around_bb1
  %.0 = phi i64 [ %"6", %wrap_around_bb1 ], [ %"11", %wrap_around_bb3 ], [ %value, %wrap_around_bb2 ]
  ret i64 %.0, !dbg !47
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @allocate_memory0(i32 %size) #0 {
allocate_memory0_bb5:
  call void @llvm.dbg.value(metadata !{i32 %size}, i64 0, metadata !48), !dbg !49
  %"12" = load i32* @"'memory0_freeIndex", align 4, !dbg !50
  call void @llvm.dbg.value(metadata !{i32 %"12"}, i64 0, metadata !51), !dbg !52
  %"13" = load i32* @"'memory0_freeIndex", align 4, !dbg !53
  %"14" = add nsw i32 %"13", %size, !dbg !53
  store i32 %"14", i32* @"'memory0_freeIndex", align 4, !dbg !53
  ret i32 %"12", !dbg !54
}

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb6:
  call void @llvm.dbg.value(metadata !55, i64 0, metadata !56), !dbg !58
  %"15" = load i32* @"'memory0_freeIndex", align 4, !dbg !59
  call void @llvm.dbg.value(metadata !{i32 %"15"}, i64 0, metadata !60), !dbg !61
  %"16" = load i32* @"'memory0_freeIndex", align 4, !dbg !62
  %"17" = add nsw i32 %"16", 16, !dbg !62
  store i32 %"17", i32* @"'memory0_freeIndex", align 4, !dbg !62
  call void @llvm.dbg.value(metadata !{i32 %"15"}, i64 0, metadata !63), !dbg !64
  %"18" = sext i32 %"15" to i64, !dbg !65
  %"19" = getelementptr inbounds [100000 x %struct.Node]* @memory0, i32 0, i64 %"18", !dbg !65
  %"20" = getelementptr inbounds %struct.Node* %"19", i32 0, i32 1, !dbg !65
  store i64 1, i64* %"20", align 8, !dbg !65
  %"21" = sext i32 %"15" to i64, !dbg !66
  %"22" = getelementptr inbounds [100000 x %struct.Node]* @memory0, i32 0, i64 %"21", !dbg !66
  %"23" = getelementptr inbounds %struct.Node* %"22", i32 0, i32 0, !dbg !66
  store i64 1, i64* %"23", align 8, !dbg !66
  %"24" = sext i32 %"15" to i64, !dbg !67
  %"25" = getelementptr inbounds [100000 x %struct.Node]* @memory0, i32 0, i64 %"24", !dbg !67
  %"26" = getelementptr inbounds %struct.Node* %"25", i32 0, i32 1, !dbg !67
  %"27" = load i64* %"26", align 8, !dbg !67
  call void @llvm.dbg.value(metadata !{i64 %"27"}, i64 0, metadata !68), !dbg !69
  %"28" = sub nsw i64 %"27", 1, !dbg !70
  call void @llvm.dbg.value(metadata !{i64 %"28"}, i64 0, metadata !71), !dbg !72
  call void @llvm.dbg.value(metadata !73, i64 0, metadata !74), !dbg !75
  call void @llvm.dbg.value(metadata !76, i64 0, metadata !77), !dbg !78
  call void @llvm.dbg.value(metadata !79, i64 0, metadata !80), !dbg !81
  %"29" = icmp sgt i64 %"28", 2147483647, !dbg !82
  br i1 %"29", label %main_bb7, label %main_bb8, !dbg !82

main_bb7:                                         ; preds = %main_bb6
  %"30" = sub nsw i64 %"28", 2147483647, !dbg !83
  %"31" = sub nsw i64 %"30", 1, !dbg !83
  %"32" = srem i64 %"31", 4294967296, !dbg !83
  %"33" = add nsw i64 -2147483648, %"32", !dbg !83
  br label %main_wrap_around.exit6, !dbg !83

main_bb8:                                         ; preds = %main_bb6
  %"34" = icmp slt i64 %"28", -2147483648, !dbg !84
  br i1 %"34", label %main_bb9, label %main_wrap_around.exit6, !dbg !84

main_bb9:                                         ; preds = %main_bb8
  %"35" = sub nsw i64 -2147483648, %"28", !dbg !85
  %"36" = sub nsw i64 %"35", 1, !dbg !85
  %"37" = srem i64 %"36", 4294967296, !dbg !85
  %"38" = sub nsw i64 2147483647, %"37", !dbg !85
  br label %main_wrap_around.exit6, !dbg !85

main_wrap_around.exit6:                           ; preds = %main_bb7, %main_bb8, %main_bb9
  %.0.i5 = phi i64 [ %"33", %main_bb7 ], [ %"38", %main_bb9 ], [ %"28", %main_bb8 ], !dbg !70
  call void @llvm.dbg.value(metadata !{i64 %.0.i5}, i64 0, metadata !68), !dbg !69
  call void @llvm.dbg.value(metadata !86, i64 0, metadata !87), !dbg !88
  %"39" = sext i32 %"15" to i64, !dbg !89
  %"40" = getelementptr inbounds [100000 x %struct.Node]* @memory0, i32 0, i64 %"39", !dbg !89
  %"41" = getelementptr inbounds %struct.Node* %"40", i32 0, i32 0, !dbg !89
  %"42" = load i64* %"41", align 8, !dbg !89
  %"43" = srem i64 %.0.i5, %"42", !dbg !89
  call void @llvm.dbg.value(metadata !{i64 %"43"}, i64 0, metadata !90), !dbg !91
  call void @llvm.dbg.value(metadata !73, i64 0, metadata !92), !dbg !93
  call void @llvm.dbg.value(metadata !76, i64 0, metadata !94), !dbg !95
  call void @llvm.dbg.value(metadata !79, i64 0, metadata !96), !dbg !97
  %"44" = icmp sgt i64 %"43", 2147483647, !dbg !98
  br i1 %"44", label %main_bb10, label %main_bb11, !dbg !98

main_bb10:                                        ; preds = %main_wrap_around.exit6
  %"45" = sub nsw i64 %"43", 2147483647, !dbg !99
  %"46" = sub nsw i64 %"45", 1, !dbg !99
  %"47" = srem i64 %"46", 4294967296, !dbg !99
  %"48" = add nsw i64 -2147483648, %"47", !dbg !99
  br label %main_wrap_around.exit4, !dbg !99

main_bb11:                                        ; preds = %main_wrap_around.exit6
  %"49" = icmp slt i64 %"43", -2147483648, !dbg !100
  br i1 %"49", label %main_bb12, label %main_wrap_around.exit4, !dbg !100

main_bb12:                                        ; preds = %main_bb11
  %"50" = sub nsw i64 -2147483648, %"43", !dbg !101
  %"51" = sub nsw i64 %"50", 1, !dbg !101
  %"52" = srem i64 %"51", 4294967296, !dbg !101
  %"53" = sub nsw i64 2147483647, %"52", !dbg !101
  br label %main_wrap_around.exit4, !dbg !101

main_wrap_around.exit4:                           ; preds = %main_bb10, %main_bb11, %main_bb12
  %.0.i3 = phi i64 [ %"48", %main_bb10 ], [ %"53", %main_bb12 ], [ %"43", %main_bb11 ], !dbg !89
  call void @llvm.dbg.value(metadata !{i64 %.0.i3}, i64 0, metadata !68), !dbg !69
  call void @llvm.dbg.value(metadata !{i64 %"66"}, i64 0, metadata !102), !dbg !105
  call void @llvm.dbg.value(metadata !73, i64 0, metadata !106), !dbg !107
  call void @llvm.dbg.value(metadata !76, i64 0, metadata !108), !dbg !109
  call void @llvm.dbg.value(metadata !79, i64 0, metadata !110), !dbg !111
  call void @llvm.dbg.value(metadata !{i64 %.0.i1}, i64 0, metadata !68), !dbg !69
  %"54" = sext i32 %"15" to i64, !dbg !112
  %"55" = getelementptr inbounds [100000 x %struct.Node]* @memory0, i32 0, i64 %"54", !dbg !112
  %"56" = getelementptr inbounds %struct.Node* %"55", i32 0, i32 0, !dbg !112
  %"57" = load i64* %"56", align 8, !dbg !112
  %"58" = sext i32 %"15" to i64, !dbg !114
  %"59" = getelementptr inbounds [100000 x %struct.Node]* @memory0, i32 0, i64 %"58", !dbg !114
  %"60" = getelementptr inbounds %struct.Node* %"59", i32 0, i32 1, !dbg !114
  %"61" = load i64* %"60", align 8, !dbg !114
  %"62" = sext i32 %"15" to i64, !dbg !116
  %"63" = getelementptr inbounds [100000 x %struct.Node]* @memory0, i32 0, i64 %"62", !dbg !116
  %"64" = getelementptr inbounds %struct.Node* %"63", i32 0, i32 0, !dbg !116
  %"65" = load i64* %"64", align 8, !dbg !116
  call void @llvm.dbg.value(metadata !{i64 %"79"}, i64 0, metadata !120), !dbg !121
  call void @llvm.dbg.value(metadata !73, i64 0, metadata !122), !dbg !123
  call void @llvm.dbg.value(metadata !76, i64 0, metadata !124), !dbg !125
  call void @llvm.dbg.value(metadata !79, i64 0, metadata !126), !dbg !127
  br label %main_bb13, !dbg !128

main_bb13:                                        ; preds = %main_wrap_around.exit, %main_wrap_around.exit4
  %pos.0 = phi i64 [ %.0.i3, %main_wrap_around.exit4 ], [ %pos.2, %main_wrap_around.exit ]
  %"66" = add nsw i64 %pos.0, -1, !dbg !103
  %"67" = icmp sgt i64 %"66", 2147483647, !dbg !129
  br i1 %"67", label %main_bb14, label %main_bb15, !dbg !129

main_bb14:                                        ; preds = %main_bb13
  %"68" = sub nsw i64 %"66", 2147483647, !dbg !130
  %"69" = sub nsw i64 %"68", 1, !dbg !130
  %"70" = srem i64 %"69", 4294967296, !dbg !130
  %"71" = add nsw i64 -2147483648, %"70", !dbg !130
  br label %main_wrap_around.exit2, !dbg !130

main_bb15:                                        ; preds = %main_bb13
  %"72" = icmp slt i64 %"66", -2147483648, !dbg !131
  br i1 %"72", label %main_bb16, label %main_wrap_around.exit2, !dbg !131

main_bb16:                                        ; preds = %main_bb15
  %"73" = sub nsw i64 -2147483648, %"66", !dbg !132
  %"74" = sub nsw i64 %"73", 1, !dbg !132
  %"75" = srem i64 %"74", 4294967296, !dbg !132
  %"76" = sub nsw i64 2147483647, %"75", !dbg !132
  br label %main_wrap_around.exit2, !dbg !132

main_wrap_around.exit2:                           ; preds = %main_bb14, %main_bb15, %main_bb16
  %.0.i1 = phi i64 [ %"71", %main_bb14 ], [ %"76", %main_bb16 ], [ %"66", %main_bb15 ], !dbg !103
  %"77" = icmp ne i64 %.0.i1, %"57", !dbg !112
  %"78" = icmp slt i64 %.0.i1, 0, !dbg !133
  %or.cond = and i1 %"77", %"78", !dbg !112
  br i1 %or.cond, label %main_bb17, label %main_wrap_around.exit, !dbg !112

main_bb17:                                        ; preds = %main_wrap_around.exit2
  %"79" = sub nsw i64 %"65", 1, !dbg !116
  %"80" = icmp sgt i64 %"79", 2147483647, !dbg !134
  br i1 %"80", label %main_bb18, label %main_bb19, !dbg !134

main_bb18:                                        ; preds = %main_bb17
  %"81" = sub nsw i64 %"79", 2147483647, !dbg !135
  %"82" = sub nsw i64 %"81", 1, !dbg !135
  %"83" = srem i64 %"82", 4294967296, !dbg !135
  %"84" = add nsw i64 -2147483648, %"83", !dbg !135
  br label %main_wrap_around.exit, !dbg !135

main_bb19:                                        ; preds = %main_bb17
  %"85" = icmp slt i64 %"79", -2147483648, !dbg !136
  br i1 %"85", label %main_bb20, label %main_wrap_around.exit, !dbg !136

main_bb20:                                        ; preds = %main_bb19
  %"86" = sub nsw i64 -2147483648, %"79", !dbg !137
  %"87" = sub nsw i64 %"86", 1, !dbg !137
  %"88" = srem i64 %"87", 4294967296, !dbg !137
  %"89" = sub nsw i64 2147483647, %"88", !dbg !137
  br label %main_wrap_around.exit, !dbg !137

main_wrap_around.exit:                            ; preds = %main_wrap_around.exit2, %main_bb18, %main_bb19, %main_bb20
  %pos.2 = phi i64 [ %.0.i1, %main_wrap_around.exit2 ], [ %"84", %main_bb18 ], [ %"89", %main_bb20 ], [ %"79", %main_bb19 ]
  %"90" = icmp ne i64 %pos.2, %"61", !dbg !114
  br i1 %"90", label %main_bb13, label %main_bb21, !dbg !114

main_bb21:                                        ; preds = %main_wrap_around.exit
  ret void, !dbg !138
}

declare i64 @__kittel_nondef.0()

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

declare i32 @__kittel_nondef.1()

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!27, !28}
!llvm.ident = !{!29}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !16, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [//FILES_DIR/SourceCode_SemanticAugmentor.c] [DW_LANG_C99]
!1 = metadata !{metadata !"FILES_DIR/SourceCode_SemanticAugmentor.c", metadata !"/"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9, metadata !13}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"wrap_around", metadata !"wrap_around", metadata !"", i32 12, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i64, i64, i64)* @wrap_around, null, null, metadata !2, i32 12} ; [ DW_TAG_subprogram ] [line 12] [def] [wrap_around]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"allocate_memory0", metadata !"allocate_memory0", metadata !"", i32 22, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @allocate_memory0, null, null, metadata !2, i32 22} ; [ DW_TAG_subprogram ] [line 22] [def] [allocate_memory0]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !12, metadata !12}
!12 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!13 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 28, metadata !14, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @main, null, null, metadata !2, i32 29} ; [ DW_TAG_subprogram ] [line 28] [def] [scope 29] [main]
!14 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !15, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!15 = metadata !{null}
!16 = metadata !{metadata !17, metadata !18}
!17 = metadata !{i32 786484, i32 0, null, metadata !"memory0_freeIndex", metadata !"memory0_freeIndex", metadata !"", metadata !5, i32 11, metadata !12, i32 0, i32 1, i32* @"'memory0_freeIndex", null} ; [ DW_TAG_variable ] [memory0_freeIndex] [line 11] [def]
!18 = metadata !{i32 786484, i32 0, null, metadata !"memory0", metadata !"memory0", metadata !"", metadata !5, i32 10, metadata !19, i32 0, i32 1, [100000 x %struct.Node]* @memory0, null} ; [ DW_TAG_variable ] [memory0] [line 10] [def]
!19 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 12800000, i64 64, i32 0, i32 0, metadata !20, metadata !25, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 12800000, align 64, offset 0] [from Node]
!20 = metadata !{i32 786454, metadata !1, null, metadata !"Node", i32 8, i64 0, i64 0, i64 0, i32 0, metadata !21} ; [ DW_TAG_typedef ] [Node] [line 8, size 0, align 0, offset 0] [from Node]
!21 = metadata !{i32 786451, metadata !1, null, metadata !"Node", i32 4, i64 128, i64 64, i32 0, i32 0, null, metadata !22, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [Node] [line 4, size 128, align 64, offset 0] [def] [from ]
!22 = metadata !{metadata !23, metadata !24}
!23 = metadata !{i32 786445, metadata !1, metadata !21, metadata !"size", i32 5, i64 64, i64 64, i64 0, i32 0, metadata !8} ; [ DW_TAG_member ] [size] [line 5, size 64, align 64, offset 0] [from long long int]
!24 = metadata !{i32 786445, metadata !1, metadata !21, metadata !"selected", i32 6, i64 64, i64 64, i64 64, i32 0, metadata !8} ; [ DW_TAG_member ] [selected] [line 6, size 64, align 64, offset 64] [from long long int]
!25 = metadata !{metadata !26}
!26 = metadata !{i32 786465, i64 0, i64 100000}   ; [ DW_TAG_subrange_type ] [0, 99999]
!27 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!28 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!29 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!30 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777228, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 12]
!31 = metadata !{i32 12, i32 33, metadata !4, null}
!32 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554444, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [lower_bound] [line 12]
!33 = metadata !{i32 12, i32 50, metadata !4, null}
!34 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331660, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [upper_bound] [line 12]
!35 = metadata !{i32 12, i32 73, metadata !4, null}
!36 = metadata !{i32 13, i32 5, metadata !4, null}
!37 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 13, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [range] [line 13]
!38 = metadata !{i32 13, i32 15, metadata !4, null}
!39 = metadata !{i32 14, i32 9, metadata !40, null}
!40 = metadata !{i32 786443, metadata !1, metadata !4, i32 14, i32 9, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!41 = metadata !{i32 15, i32 9, metadata !42, null}
!42 = metadata !{i32 786443, metadata !1, metadata !40, i32 14, i32 30, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!43 = metadata !{i32 17, i32 14, metadata !44, null}
!44 = metadata !{i32 786443, metadata !1, metadata !40, i32 17, i32 14, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!45 = metadata !{i32 18, i32 9, metadata !46, null}
!46 = metadata !{i32 786443, metadata !1, metadata !44, i32 17, i32 35, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!47 = metadata !{i32 21, i32 1, metadata !4, null}
!48 = metadata !{i32 786689, metadata !9, metadata !"size", metadata !5, i32 16777238, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 22]
!49 = metadata !{i32 22, i32 26, metadata !9, null}
!50 = metadata !{i32 23, i32 4, metadata !9, null}
!51 = metadata !{i32 786688, metadata !9, metadata !"allocatedIndex", metadata !5, i32 23, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [allocatedIndex] [line 23]
!52 = metadata !{i32 23, i32 8, metadata !9, null}
!53 = metadata !{i32 24, i32 4, metadata !9, null}
!54 = metadata !{i32 25, i32 4, metadata !9, null}
!55 = metadata !{i32 16}
!56 = metadata !{i32 786689, metadata !9, metadata !"size", metadata !5, i32 16777238, metadata !12, i32 0, metadata !57} ; [ DW_TAG_arg_variable ] [size] [line 22]
!57 = metadata !{i32 31, i32 14, metadata !13, null}
!58 = metadata !{i32 22, i32 26, metadata !9, metadata !57}
!59 = metadata !{i32 23, i32 4, metadata !9, metadata !57}
!60 = metadata !{i32 786688, metadata !9, metadata !"allocatedIndex", metadata !5, i32 23, metadata !12, i32 0, metadata !57} ; [ DW_TAG_auto_variable ] [allocatedIndex] [line 23]
!61 = metadata !{i32 23, i32 8, metadata !9, metadata !57}
!62 = metadata !{i32 24, i32 4, metadata !9, metadata !57}
!63 = metadata !{i32 786688, metadata !13, metadata !"menu", metadata !5, i32 31, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [menu] [line 31]
!64 = metadata !{i32 31, i32 7, metadata !13, null}
!65 = metadata !{i32 32, i32 3, metadata !13, null}
!66 = metadata !{i32 33, i32 3, metadata !13, null}
!67 = metadata !{i32 34, i32 3, metadata !13, null}
!68 = metadata !{i32 786688, metadata !13, metadata !"pos", metadata !5, i32 34, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pos] [line 34]
!69 = metadata !{i32 34, i32 13, metadata !13, null}
!70 = metadata !{i32 35, i32 10, metadata !13, null}
!71 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777228, metadata !8, i32 0, metadata !70} ; [ DW_TAG_arg_variable ] [value] [line 12]
!72 = metadata !{i32 12, i32 33, metadata !4, metadata !70}
!73 = metadata !{i64 -2147483648}
!74 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554444, metadata !8, i32 0, metadata !70} ; [ DW_TAG_arg_variable ] [lower_bound] [line 12]
!75 = metadata !{i32 12, i32 50, metadata !4, metadata !70}
!76 = metadata !{i64 2147483647}
!77 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331660, metadata !8, i32 0, metadata !70} ; [ DW_TAG_arg_variable ] [upper_bound] [line 12]
!78 = metadata !{i32 12, i32 73, metadata !4, metadata !70}
!79 = metadata !{i64 4294967296}
!80 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 13, metadata !8, i32 0, metadata !70} ; [ DW_TAG_auto_variable ] [range] [line 13]
!81 = metadata !{i32 13, i32 15, metadata !4, metadata !70}
!82 = metadata !{i32 14, i32 9, metadata !40, metadata !70}
!83 = metadata !{i32 15, i32 9, metadata !42, metadata !70}
!84 = metadata !{i32 17, i32 14, metadata !44, metadata !70}
!85 = metadata !{i32 18, i32 9, metadata !46, metadata !70}
!86 = metadata !{i64 -1}
!87 = metadata !{i32 786688, metadata !13, metadata !"direction", metadata !5, i32 30, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [direction] [line 30]
!88 = metadata !{i32 30, i32 13, metadata !13, null}
!89 = metadata !{i32 37, i32 9, metadata !13, null}
!90 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777228, metadata !8, i32 0, metadata !89} ; [ DW_TAG_arg_variable ] [value] [line 12]
!91 = metadata !{i32 12, i32 33, metadata !4, metadata !89}
!92 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554444, metadata !8, i32 0, metadata !89} ; [ DW_TAG_arg_variable ] [lower_bound] [line 12]
!93 = metadata !{i32 12, i32 50, metadata !4, metadata !89}
!94 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331660, metadata !8, i32 0, metadata !89} ; [ DW_TAG_arg_variable ] [upper_bound] [line 12]
!95 = metadata !{i32 12, i32 73, metadata !4, metadata !89}
!96 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 13, metadata !8, i32 0, metadata !89} ; [ DW_TAG_auto_variable ] [range] [line 13]
!97 = metadata !{i32 13, i32 15, metadata !4, metadata !89}
!98 = metadata !{i32 14, i32 9, metadata !40, metadata !89}
!99 = metadata !{i32 15, i32 9, metadata !42, metadata !89}
!100 = metadata !{i32 17, i32 14, metadata !44, metadata !89}
!101 = metadata !{i32 18, i32 9, metadata !46, metadata !89}
!102 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777228, metadata !8, i32 0, metadata !103} ; [ DW_TAG_arg_variable ] [value] [line 12]
!103 = metadata !{i32 39, i32 11, metadata !104, null}
!104 = metadata !{i32 786443, metadata !1, metadata !13, i32 38, i32 13, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!105 = metadata !{i32 12, i32 33, metadata !4, metadata !103}
!106 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554444, metadata !8, i32 0, metadata !103} ; [ DW_TAG_arg_variable ] [lower_bound] [line 12]
!107 = metadata !{i32 12, i32 50, metadata !4, metadata !103}
!108 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331660, metadata !8, i32 0, metadata !103} ; [ DW_TAG_arg_variable ] [upper_bound] [line 12]
!109 = metadata !{i32 12, i32 73, metadata !4, metadata !103}
!110 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 13, metadata !8, i32 0, metadata !103} ; [ DW_TAG_auto_variable ] [range] [line 13]
!111 = metadata !{i32 13, i32 15, metadata !4, metadata !103}
!112 = metadata !{i32 40, i32 9, metadata !113, null}
!113 = metadata !{i32 786443, metadata !1, metadata !104, i32 40, i32 9, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!114 = metadata !{i32 46, i32 9, metadata !115, null}
!115 = metadata !{i32 786443, metadata !1, metadata !104, i32 46, i32 9, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!116 = metadata !{i32 43, i32 9, metadata !117, null}
!117 = metadata !{i32 786443, metadata !1, metadata !118, i32 43, i32 1, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!118 = metadata !{i32 786443, metadata !1, metadata !119, i32 42, i32 11, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!119 = metadata !{i32 786443, metadata !1, metadata !113, i32 41, i32 1, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!120 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777228, metadata !8, i32 0, metadata !116} ; [ DW_TAG_arg_variable ] [value] [line 12]
!121 = metadata !{i32 12, i32 33, metadata !4, metadata !116}
!122 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554444, metadata !8, i32 0, metadata !116} ; [ DW_TAG_arg_variable ] [lower_bound] [line 12]
!123 = metadata !{i32 12, i32 50, metadata !4, metadata !116}
!124 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331660, metadata !8, i32 0, metadata !116} ; [ DW_TAG_arg_variable ] [upper_bound] [line 12]
!125 = metadata !{i32 12, i32 73, metadata !4, metadata !116}
!126 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 13, metadata !8, i32 0, metadata !116} ; [ DW_TAG_auto_variable ] [range] [line 13]
!127 = metadata !{i32 13, i32 15, metadata !4, metadata !116}
!128 = metadata !{i32 38, i32 3, metadata !13, null}
!129 = metadata !{i32 14, i32 9, metadata !40, metadata !103}
!130 = metadata !{i32 15, i32 9, metadata !42, metadata !103}
!131 = metadata !{i32 17, i32 14, metadata !44, metadata !103}
!132 = metadata !{i32 18, i32 9, metadata !46, metadata !103}
!133 = metadata !{i32 42, i32 11, metadata !118, null}
!134 = metadata !{i32 14, i32 9, metadata !40, metadata !116}
!135 = metadata !{i32 15, i32 9, metadata !42, metadata !116}
!136 = metadata !{i32 17, i32 14, metadata !44, metadata !116}
!137 = metadata !{i32 18, i32 9, metadata !46, metadata !116}
!138 = metadata !{i32 50, i32 3, metadata !13, null}

