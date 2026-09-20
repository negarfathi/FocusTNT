; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.NNode = type { i32, i32 }

@"'memory0_freeIndex" = global i32 1, align 4
@"'memory1_freeIndex" = global i32 1, align 4
@memory0 = common global [100000 x %struct.NNode] zeroinitializer, align 16
@memory1 = common global [100000 x %struct.NNode] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define i32 @allocate_memory0(i32 %size) #0 {
allocate_memory0_bb0:
  call void @llvm.dbg.value(metadata !{i32 %size}, i64 0, metadata !31), !dbg !32
  %"0" = load i32* @"'memory0_freeIndex", align 4, !dbg !33
  call void @llvm.dbg.value(metadata !{i32 %"0"}, i64 0, metadata !34), !dbg !35
  %"1" = load i32* @"'memory0_freeIndex", align 4, !dbg !36
  %"2" = add nsw i32 %"1", %size, !dbg !36
  store i32 %"2", i32* @"'memory0_freeIndex", align 4, !dbg !36
  ret i32 %"0", !dbg !37
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @allocate_memory1(i32 %size) #0 {
allocate_memory1_bb1:
  call void @llvm.dbg.value(metadata !{i32 %size}, i64 0, metadata !38), !dbg !39
  %"3" = load i32* @"'memory1_freeIndex", align 4, !dbg !40
  call void @llvm.dbg.value(metadata !{i32 %"3"}, i64 0, metadata !41), !dbg !42
  %"4" = load i32* @"'memory1_freeIndex", align 4, !dbg !43
  %"5" = add nsw i32 %"4", %size, !dbg !43
  store i32 %"5", i32* @"'memory1_freeIndex", align 4, !dbg !43
  ret i32 %"3", !dbg !44
}

; Function Attrs: nounwind uwtable
define i32 @initLink(i32 %n) #0 {
initLink_bb2:
  call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !45), !dbg !46
  call void @llvm.dbg.value(metadata !47, i64 0, metadata !48), !dbg !50
  %"6" = load i32* @"'memory0_freeIndex", align 4, !dbg !51
  call void @llvm.dbg.value(metadata !{i32 %"6"}, i64 0, metadata !52), !dbg !53
  %"7" = load i32* @"'memory0_freeIndex", align 4, !dbg !54
  %"8" = add nsw i32 %"7", 8, !dbg !54
  store i32 %"8", i32* @"'memory0_freeIndex", align 4, !dbg !54
  call void @llvm.dbg.value(metadata !{i32 %"6"}, i64 0, metadata !55), !dbg !56
  %"9" = sext i32 %"6" to i64, !dbg !57
  %"10" = getelementptr inbounds [100000 x %struct.NNode]* @memory0, i32 0, i64 %"9", !dbg !57
  %"11" = getelementptr inbounds %struct.NNode* %"10", i32 0, i32 0, !dbg !57
  store i32 1, i32* %"11", align 4, !dbg !57
  %"12" = sext i32 %"6" to i64, !dbg !58
  %"13" = getelementptr inbounds [100000 x %struct.NNode]* @memory0, i32 0, i64 %"12", !dbg !58
  %"14" = getelementptr inbounds %struct.NNode* %"13", i32 0, i32 1, !dbg !58
  store i32 0, i32* %"14", align 4, !dbg !58
  call void @llvm.dbg.value(metadata !{i32 %"6"}, i64 0, metadata !59), !dbg !60
  call void @llvm.dbg.value(metadata !61, i64 0, metadata !62), !dbg !63
  call void @llvm.dbg.value(metadata !47, i64 0, metadata !64), !dbg !68
  call void @llvm.dbg.value(metadata !{i32 %"16"}, i64 0, metadata !69), !dbg !70
  call void @llvm.dbg.value(metadata !{i32 %"16"}, i64 0, metadata !71), !dbg !72
  call void @llvm.dbg.value(metadata !{i32 %"31"}, i64 0, metadata !59), !dbg !60
  call void @llvm.dbg.value(metadata !{i32 %"32"}, i64 0, metadata !62), !dbg !63
  br label %initLink_bb3, !dbg !73

initLink_bb3:                                     ; preds = %initLink_bb4, %initLink_bb2
  %i.0 = phi i32 [ 2, %initLink_bb2 ], [ %"32", %initLink_bb4 ]
  %cyclic.0 = phi i32 [ %"6", %initLink_bb2 ], [ %"31", %initLink_bb4 ]
  %"15" = icmp sle i32 %i.0, %n, !dbg !74
  br i1 %"15", label %initLink_bb4, label %initLink_bb5, !dbg !74

initLink_bb4:                                     ; preds = %initLink_bb3
  %"16" = load i32* @"'memory0_freeIndex", align 4, !dbg !77
  %"17" = load i32* @"'memory0_freeIndex", align 4, !dbg !78
  %"18" = add nsw i32 %"17", 8, !dbg !78
  store i32 %"18", i32* @"'memory0_freeIndex", align 4, !dbg !78
  %"19" = sext i32 %"16" to i64, !dbg !79
  %"20" = getelementptr inbounds [100000 x %struct.NNode]* @memory0, i32 0, i64 %"19", !dbg !79
  %"21" = getelementptr inbounds %struct.NNode* %"20", i32 0, i32 0, !dbg !79
  store i32 %i.0, i32* %"21", align 4, !dbg !79
  %"22" = sext i32 %"16" to i64, !dbg !80
  %"23" = getelementptr inbounds [100000 x %struct.NNode]* @memory0, i32 0, i64 %"22", !dbg !80
  %"24" = getelementptr inbounds %struct.NNode* %"23", i32 0, i32 1, !dbg !80
  store i32 0, i32* %"24", align 4, !dbg !80
  %"25" = sext i32 %cyclic.0 to i64, !dbg !81
  %"26" = getelementptr inbounds [100000 x %struct.NNode]* @memory0, i32 0, i64 %"25", !dbg !81
  %"27" = getelementptr inbounds %struct.NNode* %"26", i32 0, i32 1, !dbg !81
  store i32 %"16", i32* %"27", align 4, !dbg !81
  %"28" = sext i32 %cyclic.0 to i64, !dbg !82
  %"29" = getelementptr inbounds [100000 x %struct.NNode]* @memory0, i32 0, i64 %"28", !dbg !82
  %"30" = getelementptr inbounds %struct.NNode* %"29", i32 0, i32 1, !dbg !82
  %"31" = load i32* %"30", align 4, !dbg !82
  %"32" = add nsw i32 %i.0, 1, !dbg !83
  br label %initLink_bb3, !dbg !83

initLink_bb5:                                     ; preds = %initLink_bb3
  %"33" = sext i32 %cyclic.0 to i64, !dbg !84
  %"34" = getelementptr inbounds [100000 x %struct.NNode]* @memory0, i32 0, i64 %"33", !dbg !84
  %"35" = getelementptr inbounds %struct.NNode* %"34", i32 0, i32 1, !dbg !84
  store i32 %"6", i32* %"35", align 4, !dbg !84
  ret i32 %"6", !dbg !85
}

; Function Attrs: nounwind uwtable
define i32 @findEnd(i32 %list) #0 {
findEnd_bb6:
  call void @llvm.dbg.value(metadata !{i32 %list}, i64 0, metadata !86), !dbg !87
  call void @llvm.dbg.value(metadata !{i32 %list}, i64 0, metadata !88), !dbg !89
  call void @llvm.dbg.value(metadata !{i32 %"44"}, i64 0, metadata !88), !dbg !89
  br label %findEnd_bb7, !dbg !90

findEnd_bb7:                                      ; preds = %findEnd_bb8, %findEnd_bb6
  %begin.0 = phi i32 [ %list, %findEnd_bb6 ], [ %"44", %findEnd_bb8 ]
  %"36" = sext i32 %begin.0 to i64, !dbg !91
  %"37" = getelementptr inbounds [100000 x %struct.NNode]* @memory0, i32 0, i64 %"36", !dbg !91
  %"38" = getelementptr inbounds %struct.NNode* %"37", i32 0, i32 1, !dbg !91
  %"39" = load i32* %"38", align 4, !dbg !91
  %"40" = icmp ne i32 %"39", %list, !dbg !91
  br i1 %"40", label %findEnd_bb8, label %findEnd_bb9, !dbg !91

findEnd_bb8:                                      ; preds = %findEnd_bb7
  %"41" = sext i32 %begin.0 to i64, !dbg !93
  %"42" = getelementptr inbounds [100000 x %struct.NNode]* @memory0, i32 0, i64 %"41", !dbg !93
  %"43" = getelementptr inbounds %struct.NNode* %"42", i32 0, i32 1, !dbg !93
  %"44" = load i32* %"43", align 4, !dbg !93
  br label %findEnd_bb7, !dbg !93

findEnd_bb9:                                      ; preds = %findEnd_bb7
  ret i32 %begin.0, !dbg !94
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
main_bb10:
  call void @llvm.dbg.value(metadata !61, i64 0, metadata !95), !dbg !96
  %"45" = icmp sle i32 2, 0, !dbg !97
  %"46" = icmp sgt i32 2, 65534, !dbg !99
  %or.cond = or i1 %"45", %"46", !dbg !97
  br i1 %or.cond, label %main_bb19, label %main_bb11, !dbg !97

main_bb11:                                        ; preds = %main_bb10
  call void @llvm.dbg.value(metadata !61, i64 0, metadata !101), !dbg !103
  call void @llvm.dbg.value(metadata !47, i64 0, metadata !104), !dbg !106
  %"47" = load i32* @"'memory0_freeIndex", align 4, !dbg !107
  call void @llvm.dbg.value(metadata !{i32 %"47"}, i64 0, metadata !108), !dbg !109
  %"48" = load i32* @"'memory0_freeIndex", align 4, !dbg !110
  %"49" = add nsw i32 %"48", 8, !dbg !110
  store i32 %"49", i32* @"'memory0_freeIndex", align 4, !dbg !110
  call void @llvm.dbg.value(metadata !{i32 %"47"}, i64 0, metadata !111), !dbg !112
  %"50" = sext i32 %"47" to i64, !dbg !113
  %"51" = getelementptr inbounds [100000 x %struct.NNode]* @memory0, i32 0, i64 %"50", !dbg !113
  %"52" = getelementptr inbounds %struct.NNode* %"51", i32 0, i32 0, !dbg !113
  store i32 1, i32* %"52", align 4, !dbg !113
  %"53" = sext i32 %"47" to i64, !dbg !114
  %"54" = getelementptr inbounds [100000 x %struct.NNode]* @memory0, i32 0, i64 %"53", !dbg !114
  %"55" = getelementptr inbounds %struct.NNode* %"54", i32 0, i32 1, !dbg !114
  store i32 0, i32* %"55", align 4, !dbg !114
  call void @llvm.dbg.value(metadata !{i32 %"47"}, i64 0, metadata !115), !dbg !116
  call void @llvm.dbg.value(metadata !61, i64 0, metadata !117), !dbg !118
  call void @llvm.dbg.value(metadata !47, i64 0, metadata !119), !dbg !121
  br label %main_bb12, !dbg !122

main_bb12:                                        ; preds = %main_bb13, %main_bb11
  %i.0.i = phi i32 [ 2, %main_bb11 ], [ %"73", %main_bb13 ], !dbg !102
  %cyclic.0.i = phi i32 [ %"47", %main_bb11 ], [ %"72", %main_bb13 ], !dbg !102
  %"56" = icmp sle i32 %i.0.i, 2, !dbg !123
  br i1 %"56", label %main_bb13, label %main_initLink.exit, !dbg !123

main_bb13:                                        ; preds = %main_bb12
  %"57" = load i32* @"'memory0_freeIndex", align 4, !dbg !124
  %"58" = load i32* @"'memory0_freeIndex", align 4, !dbg !125
  %"59" = add nsw i32 %"58", 8, !dbg !125
  store i32 %"59", i32* @"'memory0_freeIndex", align 4, !dbg !125
  %"60" = sext i32 %"57" to i64, !dbg !126
  %"61" = getelementptr inbounds [100000 x %struct.NNode]* @memory0, i32 0, i64 %"60", !dbg !126
  %"62" = getelementptr inbounds %struct.NNode* %"61", i32 0, i32 0, !dbg !126
  store i32 %i.0.i, i32* %"62", align 4, !dbg !126
  %"63" = sext i32 %"57" to i64, !dbg !127
  %"64" = getelementptr inbounds [100000 x %struct.NNode]* @memory0, i32 0, i64 %"63", !dbg !127
  %"65" = getelementptr inbounds %struct.NNode* %"64", i32 0, i32 1, !dbg !127
  store i32 0, i32* %"65", align 4, !dbg !127
  %"66" = sext i32 %cyclic.0.i to i64, !dbg !128
  %"67" = getelementptr inbounds [100000 x %struct.NNode]* @memory0, i32 0, i64 %"66", !dbg !128
  %"68" = getelementptr inbounds %struct.NNode* %"67", i32 0, i32 1, !dbg !128
  store i32 %"57", i32* %"68", align 4, !dbg !128
  %"69" = sext i32 %cyclic.0.i to i64, !dbg !129
  %"70" = getelementptr inbounds [100000 x %struct.NNode]* @memory0, i32 0, i64 %"69", !dbg !129
  %"71" = getelementptr inbounds %struct.NNode* %"70", i32 0, i32 1, !dbg !129
  %"72" = load i32* %"71", align 4, !dbg !129
  %"73" = add nsw i32 %i.0.i, 1, !dbg !130
  br label %main_bb12, !dbg !130

main_initLink.exit:                               ; preds = %main_bb12
  %"74" = sext i32 %cyclic.0.i to i64, !dbg !131
  %"75" = getelementptr inbounds [100000 x %struct.NNode]* @memory0, i32 0, i64 %"74", !dbg !131
  %"76" = getelementptr inbounds %struct.NNode* %"75", i32 0, i32 1, !dbg !131
  store i32 %"47", i32* %"76", align 4, !dbg !131
  call void @llvm.dbg.value(metadata !{i32 %"47"}, i64 0, metadata !132), !dbg !133
  call void @llvm.dbg.value(metadata !{i32 %"47"}, i64 0, metadata !134), !dbg !135
  call void @llvm.dbg.value(metadata !{i32 %"47"}, i64 0, metadata !136), !dbg !138
  call void @llvm.dbg.value(metadata !{i32 %"47"}, i64 0, metadata !139), !dbg !140
  br label %main_bb14, !dbg !141

main_bb14:                                        ; preds = %main_bb15, %main_initLink.exit
  %begin.0.i = phi i32 [ %"47", %main_initLink.exit ], [ %"85", %main_bb15 ], !dbg !137
  %"77" = sext i32 %begin.0.i to i64, !dbg !142
  %"78" = getelementptr inbounds [100000 x %struct.NNode]* @memory0, i32 0, i64 %"77", !dbg !142
  %"79" = getelementptr inbounds %struct.NNode* %"78", i32 0, i32 1, !dbg !142
  %"80" = load i32* %"79", align 4, !dbg !142
  %"81" = icmp ne i32 %"80", %"47", !dbg !142
  br i1 %"81", label %main_bb15, label %main_findEnd.exit, !dbg !142

main_bb15:                                        ; preds = %main_bb14
  %"82" = sext i32 %begin.0.i to i64, !dbg !143
  %"83" = getelementptr inbounds [100000 x %struct.NNode]* @memory0, i32 0, i64 %"82", !dbg !143
  %"84" = getelementptr inbounds %struct.NNode* %"83", i32 0, i32 1, !dbg !143
  %"85" = load i32* %"84", align 4, !dbg !143
  br label %main_bb14, !dbg !143

main_findEnd.exit:                                ; preds = %main_bb14, %main_bb18
  %h.0 = phi float [ %h.1, %main_bb18 ], [ 0.000000e+00, %main_bb14 ]
  %node.0 = phi i32 [ %"101", %main_bb18 ], [ %"47", %main_bb14 ]
  %"86" = icmp ne i32 %node.0, 0, !dbg !144
  br i1 %"86", label %main_bb16, label %main_bb19, !dbg !144

main_bb16:                                        ; preds = %main_findEnd.exit
  %"87" = sext i32 %node.0 to i64, !dbg !146
  %"88" = getelementptr inbounds [100000 x %struct.NNode]* @memory0, i32 0, i64 %"87", !dbg !146
  %"89" = getelementptr inbounds %struct.NNode* %"88", i32 0, i32 0, !dbg !146
  %"90" = load i32* %"89", align 4, !dbg !146
  %"91" = sitofp i32 %"90" to float, !dbg !146
  %"92" = fcmp ogt float %"91", %h.0, !dbg !146
  br i1 %"92", label %main_bb17, label %main_bb18, !dbg !146

main_bb17:                                        ; preds = %main_bb16
  %"93" = sext i32 %node.0 to i64, !dbg !149
  %"94" = getelementptr inbounds [100000 x %struct.NNode]* @memory0, i32 0, i64 %"93", !dbg !149
  %"95" = getelementptr inbounds %struct.NNode* %"94", i32 0, i32 0, !dbg !149
  %"96" = load i32* %"95", align 4, !dbg !149
  %"97" = sitofp i32 %"96" to float, !dbg !149
  br label %main_bb18, !dbg !149

main_bb18:                                        ; preds = %main_bb17, %main_bb16
  %h.1 = phi float [ %"97", %main_bb17 ], [ %h.0, %main_bb16 ]
  %"98" = sext i32 %node.0 to i64, !dbg !150
  %"99" = getelementptr inbounds [100000 x %struct.NNode]* @memory0, i32 0, i64 %"98", !dbg !150
  %"100" = getelementptr inbounds %struct.NNode* %"99", i32 0, i32 1, !dbg !150
  %"101" = load i32* %"100", align 4, !dbg !150
  br label %main_findEnd.exit, !dbg !151

main_bb19:                                        ; preds = %main_findEnd.exit, %main_bb10
  ret i32 0, !dbg !152
}

declare i32 @__kittel_nondef.0()

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

declare float @__kittel_nondef.1()

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!28, !29}
!llvm.ident = !{!30}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !15, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [//FILES_DIR/SourceCode_SemanticAugmentor.c] [DW_LANG_C99]
!1 = metadata !{metadata !"FILES_DIR/SourceCode_SemanticAugmentor.c", metadata !"/"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9, metadata !10, metadata !11, metadata !12}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"allocate_memory0", metadata !"allocate_memory0", metadata !"", i32 19, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @allocate_memory0, null, null, metadata !2, i32 19} ; [ DW_TAG_subprogram ] [line 19] [def] [allocate_memory0]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"allocate_memory1", metadata !"allocate_memory1", metadata !"", i32 28, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @allocate_memory1, null, null, metadata !2, i32 28} ; [ DW_TAG_subprogram ] [line 28] [def] [allocate_memory1]
!10 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"initLink", metadata !"initLink", metadata !"", i32 34, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @initLink, null, null, metadata !2, i32 34} ; [ DW_TAG_subprogram ] [line 34] [def] [initLink]
!11 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"findEnd", metadata !"findEnd", metadata !"", i32 51, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @findEnd, null, null, metadata !2, i32 52} ; [ DW_TAG_subprogram ] [line 51] [def] [scope 52] [findEnd]
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 59, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 60} ; [ DW_TAG_subprogram ] [line 59] [def] [scope 60] [main]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{metadata !8}
!15 = metadata !{metadata !16, metadata !17, metadata !18, metadata !27}
!16 = metadata !{i32 786484, i32 0, null, metadata !"memory0_freeIndex", metadata !"memory0_freeIndex", metadata !"", metadata !5, i32 18, metadata !8, i32 0, i32 1, i32* @"'memory0_freeIndex", null} ; [ DW_TAG_variable ] [memory0_freeIndex] [line 18] [def]
!17 = metadata !{i32 786484, i32 0, null, metadata !"memory1_freeIndex", metadata !"memory1_freeIndex", metadata !"", metadata !5, i32 27, metadata !8, i32 0, i32 1, i32* @"'memory1_freeIndex", null} ; [ DW_TAG_variable ] [memory1_freeIndex] [line 27] [def]
!18 = metadata !{i32 786484, i32 0, null, metadata !"memory0", metadata !"memory0", metadata !"", metadata !5, i32 17, metadata !19, i32 0, i32 1, [100000 x %struct.NNode]* @memory0, null} ; [ DW_TAG_variable ] [memory0] [line 17] [def]
!19 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 6400000, i64 32, i32 0, i32 0, metadata !20, metadata !25, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 6400000, align 32, offset 0] [from Node]
!20 = metadata !{i32 786454, metadata !1, null, metadata !"Node", i32 13, i64 0, i64 0, i64 0, i32 0, metadata !21} ; [ DW_TAG_typedef ] [Node] [line 13, size 0, align 0, offset 0] [from NNode]
!21 = metadata !{i32 786451, metadata !1, null, metadata !"NNode", i32 10, i64 64, i64 32, i32 0, i32 0, null, metadata !22, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [NNode] [line 10, size 64, align 32, offset 0] [def] [from ]
!22 = metadata !{metadata !23, metadata !24}
!23 = metadata !{i32 786445, metadata !1, metadata !21, metadata !"h", i32 11, i64 32, i64 32, i64 0, i32 0, metadata !8} ; [ DW_TAG_member ] [h] [line 11, size 32, align 32, offset 0] [from int]
!24 = metadata !{i32 786445, metadata !1, metadata !21, metadata !"next", i32 12, i64 32, i64 32, i64 32, i32 0, metadata !8} ; [ DW_TAG_member ] [next] [line 12, size 32, align 32, offset 32] [from int]
!25 = metadata !{metadata !26}
!26 = metadata !{i32 786465, i64 0, i64 100000}   ; [ DW_TAG_subrange_type ] [0, 99999]
!27 = metadata !{i32 786484, i32 0, null, metadata !"memory1", metadata !"memory1", metadata !"", metadata !5, i32 26, metadata !19, i32 0, i32 1, [100000 x %struct.NNode]* @memory1, null} ; [ DW_TAG_variable ] [memory1] [line 26] [def]
!28 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!29 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!30 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!31 = metadata !{i32 786689, metadata !4, metadata !"size", metadata !5, i32 16777235, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 19]
!32 = metadata !{i32 19, i32 26, metadata !4, null}
!33 = metadata !{i32 20, i32 4, metadata !4, null}
!34 = metadata !{i32 786688, metadata !4, metadata !"allocatedIndex", metadata !5, i32 20, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [allocatedIndex] [line 20]
!35 = metadata !{i32 20, i32 8, metadata !4, null}
!36 = metadata !{i32 21, i32 4, metadata !4, null}
!37 = metadata !{i32 22, i32 4, metadata !4, null}
!38 = metadata !{i32 786689, metadata !9, metadata !"size", metadata !5, i32 16777244, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 28]
!39 = metadata !{i32 28, i32 26, metadata !9, null}
!40 = metadata !{i32 29, i32 4, metadata !9, null}
!41 = metadata !{i32 786688, metadata !9, metadata !"allocatedIndex", metadata !5, i32 29, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [allocatedIndex] [line 29]
!42 = metadata !{i32 29, i32 8, metadata !9, null}
!43 = metadata !{i32 30, i32 4, metadata !9, null}
!44 = metadata !{i32 31, i32 4, metadata !9, null}
!45 = metadata !{i32 786689, metadata !10, metadata !"n", metadata !5, i32 16777250, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 34]
!46 = metadata !{i32 34, i32 18, metadata !10, null}
!47 = metadata !{i32 8}
!48 = metadata !{i32 786689, metadata !4, metadata !"size", metadata !5, i32 16777235, metadata !8, i32 0, metadata !49} ; [ DW_TAG_arg_variable ] [size] [line 19]
!49 = metadata !{i32 35, i32 16, metadata !10, null}
!50 = metadata !{i32 19, i32 26, metadata !4, metadata !49}
!51 = metadata !{i32 20, i32 4, metadata !4, metadata !49}
!52 = metadata !{i32 786688, metadata !4, metadata !"allocatedIndex", metadata !5, i32 20, metadata !8, i32 0, metadata !49} ; [ DW_TAG_auto_variable ] [allocatedIndex] [line 20]
!53 = metadata !{i32 20, i32 8, metadata !4, metadata !49}
!54 = metadata !{i32 21, i32 4, metadata !4, metadata !49}
!55 = metadata !{i32 786688, metadata !10, metadata !"head", metadata !5, i32 35, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [head] [line 35]
!56 = metadata !{i32 35, i32 9, metadata !10, null}
!57 = metadata !{i32 36, i32 5, metadata !10, null}
!58 = metadata !{i32 37, i32 5, metadata !10, null}
!59 = metadata !{i32 786688, metadata !10, metadata !"cyclic", metadata !5, i32 38, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cyclic] [line 38]
!60 = metadata !{i32 38, i32 9, metadata !10, null}
!61 = metadata !{i32 2}
!62 = metadata !{i32 786688, metadata !10, metadata !"i", metadata !5, i32 40, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 40]
!63 = metadata !{i32 40, i32 9, metadata !10, null}
!64 = metadata !{i32 786689, metadata !4, metadata !"size", metadata !5, i32 16777235, metadata !8, i32 0, metadata !65} ; [ DW_TAG_arg_variable ] [size] [line 19]
!65 = metadata !{i32 42, i32 20, metadata !66, null}
!66 = metadata !{i32 786443, metadata !1, metadata !67, i32 41, i32 26, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!67 = metadata !{i32 786443, metadata !1, metadata !10, i32 41, i32 5, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!68 = metadata !{i32 19, i32 26, metadata !4, metadata !65}
!69 = metadata !{i32 786688, metadata !4, metadata !"allocatedIndex", metadata !5, i32 20, metadata !8, i32 0, metadata !65} ; [ DW_TAG_auto_variable ] [allocatedIndex] [line 20]
!70 = metadata !{i32 20, i32 8, metadata !4, metadata !65}
!71 = metadata !{i32 786688, metadata !66, metadata !"body", metadata !5, i32 42, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [body] [line 42]
!72 = metadata !{i32 42, i32 13, metadata !66, null}
!73 = metadata !{i32 41, i32 10, metadata !67, null}
!74 = metadata !{i32 41, i32 10, metadata !75, null}
!75 = metadata !{i32 786443, metadata !1, metadata !76, i32 41, i32 10, i32 2, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!76 = metadata !{i32 786443, metadata !1, metadata !67, i32 41, i32 10, i32 1, i32 5} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!77 = metadata !{i32 20, i32 4, metadata !4, metadata !65}
!78 = metadata !{i32 21, i32 4, metadata !4, metadata !65}
!79 = metadata !{i32 43, i32 9, metadata !66, null}
!80 = metadata !{i32 44, i32 9, metadata !66, null}
!81 = metadata !{i32 45, i32 9, metadata !66, null}
!82 = metadata !{i32 46, i32 9, metadata !66, null}
!83 = metadata !{i32 41, i32 21, metadata !67, null}
!84 = metadata !{i32 48, i32 5, metadata !10, null}
!85 = metadata !{i32 49, i32 5, metadata !10, null}
!86 = metadata !{i32 786689, metadata !11, metadata !"list", metadata !5, i32 16777267, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [list] [line 51]
!87 = metadata !{i32 51, i32 18, metadata !11, null}
!88 = metadata !{i32 786688, metadata !11, metadata !"begin", metadata !5, i32 53, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [begin] [line 53]
!89 = metadata !{i32 53, i32 9, metadata !11, null}
!90 = metadata !{i32 54, i32 5, metadata !11, null}
!91 = metadata !{i32 54, i32 5, metadata !92, null}
!92 = metadata !{i32 786443, metadata !1, metadata !11, i32 54, i32 5, i32 1, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!93 = metadata !{i32 55, i32 9, metadata !11, null}
!94 = metadata !{i32 56, i32 5, metadata !11, null}
!95 = metadata !{i32 786688, metadata !12, metadata !"num", metadata !5, i32 61, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [num] [line 61]
!96 = metadata !{i32 61, i32 9, metadata !12, null}
!97 = metadata !{i32 62, i32 9, metadata !98, null}
!98 = metadata !{i32 786443, metadata !1, metadata !12, i32 62, i32 9, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!99 = metadata !{i32 62, i32 9, metadata !100, null}
!100 = metadata !{i32 786443, metadata !1, metadata !98, i32 62, i32 9, i32 1, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!101 = metadata !{i32 786689, metadata !10, metadata !"n", metadata !5, i32 16777250, metadata !8, i32 0, metadata !102} ; [ DW_TAG_arg_variable ] [n] [line 34]
!102 = metadata !{i32 64, i32 16, metadata !12, null}
!103 = metadata !{i32 34, i32 18, metadata !10, metadata !102}
!104 = metadata !{i32 786689, metadata !4, metadata !"size", metadata !5, i32 16777235, metadata !8, i32 0, metadata !105} ; [ DW_TAG_arg_variable ] [size] [line 19]
!105 = metadata !{i32 35, i32 16, metadata !10, metadata !102}
!106 = metadata !{i32 19, i32 26, metadata !4, metadata !105}
!107 = metadata !{i32 20, i32 4, metadata !4, metadata !105}
!108 = metadata !{i32 786688, metadata !4, metadata !"allocatedIndex", metadata !5, i32 20, metadata !8, i32 0, metadata !105} ; [ DW_TAG_auto_variable ] [allocatedIndex] [line 20]
!109 = metadata !{i32 20, i32 8, metadata !4, metadata !105}
!110 = metadata !{i32 21, i32 4, metadata !4, metadata !105}
!111 = metadata !{i32 786688, metadata !10, metadata !"head", metadata !5, i32 35, metadata !8, i32 0, metadata !102} ; [ DW_TAG_auto_variable ] [head] [line 35]
!112 = metadata !{i32 35, i32 9, metadata !10, metadata !102}
!113 = metadata !{i32 36, i32 5, metadata !10, metadata !102}
!114 = metadata !{i32 37, i32 5, metadata !10, metadata !102}
!115 = metadata !{i32 786688, metadata !10, metadata !"cyclic", metadata !5, i32 38, metadata !8, i32 0, metadata !102} ; [ DW_TAG_auto_variable ] [cyclic] [line 38]
!116 = metadata !{i32 38, i32 9, metadata !10, metadata !102}
!117 = metadata !{i32 786688, metadata !10, metadata !"i", metadata !5, i32 40, metadata !8, i32 0, metadata !102} ; [ DW_TAG_auto_variable ] [i] [line 40]
!118 = metadata !{i32 40, i32 9, metadata !10, metadata !102}
!119 = metadata !{i32 786689, metadata !4, metadata !"size", metadata !5, i32 16777235, metadata !8, i32 0, metadata !120} ; [ DW_TAG_arg_variable ] [size] [line 19]
!120 = metadata !{i32 42, i32 20, metadata !66, metadata !102}
!121 = metadata !{i32 19, i32 26, metadata !4, metadata !120}
!122 = metadata !{i32 41, i32 10, metadata !67, metadata !102}
!123 = metadata !{i32 41, i32 10, metadata !75, metadata !102}
!124 = metadata !{i32 20, i32 4, metadata !4, metadata !120}
!125 = metadata !{i32 21, i32 4, metadata !4, metadata !120}
!126 = metadata !{i32 43, i32 9, metadata !66, metadata !102}
!127 = metadata !{i32 44, i32 9, metadata !66, metadata !102}
!128 = metadata !{i32 45, i32 9, metadata !66, metadata !102}
!129 = metadata !{i32 46, i32 9, metadata !66, metadata !102}
!130 = metadata !{i32 41, i32 21, metadata !67, metadata !102}
!131 = metadata !{i32 48, i32 5, metadata !10, metadata !102}
!132 = metadata !{i32 786688, metadata !12, metadata !"list", metadata !5, i32 64, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [list] [line 64]
!133 = metadata !{i32 64, i32 9, metadata !12, null}
!134 = metadata !{i32 786688, metadata !12, metadata !"node", metadata !5, i32 65, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [node] [line 65]
!135 = metadata !{i32 65, i32 9, metadata !12, null}
!136 = metadata !{i32 786689, metadata !11, metadata !"list", metadata !5, i32 16777267, metadata !8, i32 0, metadata !137} ; [ DW_TAG_arg_variable ] [list] [line 51]
!137 = metadata !{i32 66, i32 15, metadata !12, null}
!138 = metadata !{i32 51, i32 18, metadata !11, metadata !137}
!139 = metadata !{i32 786688, metadata !11, metadata !"begin", metadata !5, i32 53, metadata !8, i32 0, metadata !137} ; [ DW_TAG_auto_variable ] [begin] [line 53]
!140 = metadata !{i32 53, i32 9, metadata !11, metadata !137}
!141 = metadata !{i32 54, i32 5, metadata !11, metadata !137}
!142 = metadata !{i32 54, i32 5, metadata !92, metadata !137}
!143 = metadata !{i32 55, i32 9, metadata !11, metadata !137}
!144 = metadata !{i32 68, i32 5, metadata !145, null}
!145 = metadata !{i32 786443, metadata !1, metadata !12, i32 68, i32 5, i32 1, i32 9} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!146 = metadata !{i32 70, i32 13, metadata !147, null}
!147 = metadata !{i32 786443, metadata !1, metadata !148, i32 70, i32 13, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!148 = metadata !{i32 786443, metadata !1, metadata !12, i32 69, i32 5, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!149 = metadata !{i32 71, i32 13, metadata !147, null}
!150 = metadata !{i32 72, i32 9, metadata !148, null}
!151 = metadata !{i32 73, i32 5, metadata !148, null}
!152 = metadata !{i32 75, i32 1, metadata !12, null}

