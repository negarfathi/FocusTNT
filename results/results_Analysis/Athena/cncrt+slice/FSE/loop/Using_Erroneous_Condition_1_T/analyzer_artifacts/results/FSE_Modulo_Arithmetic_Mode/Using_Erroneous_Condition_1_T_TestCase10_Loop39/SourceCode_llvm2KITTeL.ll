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
  %"15" = call i64 @__kittel_nondef.0()
  call void @llvm.dbg.value(metadata !{i64 %"15"}, i64 0, metadata !55), !dbg !56
  call void @llvm.dbg.value(metadata !57, i64 0, metadata !58), !dbg !60
  %"16" = load i32* @"'memory0_freeIndex", align 4, !dbg !61
  call void @llvm.dbg.value(metadata !{i32 %"16"}, i64 0, metadata !62), !dbg !63
  %"17" = load i32* @"'memory0_freeIndex", align 4, !dbg !64
  %"18" = add nsw i32 %"17", 16, !dbg !64
  store i32 %"18", i32* @"'memory0_freeIndex", align 4, !dbg !64
  call void @llvm.dbg.value(metadata !{i32 %"16"}, i64 0, metadata !65), !dbg !66
  %"19" = sext i32 %"16" to i64, !dbg !67
  %"20" = getelementptr inbounds [100000 x %struct.Node]* @memory0, i32 0, i64 %"19", !dbg !67
  %"21" = getelementptr inbounds %struct.Node* %"20", i32 0, i32 1, !dbg !67
  store i64 0, i64* %"21", align 8, !dbg !67
  %"22" = sext i32 %"16" to i64, !dbg !68
  %"23" = getelementptr inbounds [100000 x %struct.Node]* @memory0, i32 0, i64 %"22", !dbg !68
  %"24" = getelementptr inbounds %struct.Node* %"23", i32 0, i32 0, !dbg !68
  store i64 1, i64* %"24", align 8, !dbg !68
  %"25" = sext i32 %"16" to i64, !dbg !69
  %"26" = getelementptr inbounds [100000 x %struct.Node]* @memory0, i32 0, i64 %"25", !dbg !69
  %"27" = getelementptr inbounds %struct.Node* %"26", i32 0, i32 1, !dbg !69
  %"28" = load i64* %"27", align 8, !dbg !69
  call void @llvm.dbg.value(metadata !{i64 %"28"}, i64 0, metadata !70), !dbg !71
  %"29" = icmp sge i64 %"28", 1, !dbg !72
  br i1 %"29", label %main_wrap_around.exit4, label %main_bb7, !dbg !72

main_bb7:                                         ; preds = %main_bb6
  %"30" = add nsw i64 %"28", 1, !dbg !76
  call void @llvm.dbg.value(metadata !{i64 %"30"}, i64 0, metadata !79), !dbg !80
  call void @llvm.dbg.value(metadata !81, i64 0, metadata !82), !dbg !83
  call void @llvm.dbg.value(metadata !84, i64 0, metadata !85), !dbg !86
  call void @llvm.dbg.value(metadata !87, i64 0, metadata !88), !dbg !89
  %"31" = icmp sgt i64 %"30", 2147483647, !dbg !90
  br i1 %"31", label %main_bb8, label %main_bb9, !dbg !90

main_bb8:                                         ; preds = %main_bb7
  %"32" = sub nsw i64 %"30", 2147483647, !dbg !91
  %"33" = sub nsw i64 %"32", 1, !dbg !91
  %"34" = srem i64 %"33", 4294967296, !dbg !91
  %"35" = add nsw i64 -2147483648, %"34", !dbg !91
  br label %main_wrap_around.exit4, !dbg !91

main_bb9:                                         ; preds = %main_bb7
  %"36" = icmp slt i64 %"30", -2147483648, !dbg !92
  br i1 %"36", label %main_bb10, label %main_wrap_around.exit4, !dbg !92

main_bb10:                                        ; preds = %main_bb9
  %"37" = sub nsw i64 -2147483648, %"30", !dbg !93
  %"38" = sub nsw i64 %"37", 1, !dbg !93
  %"39" = srem i64 %"38", 4294967296, !dbg !93
  %"40" = sub nsw i64 2147483647, %"39", !dbg !93
  br label %main_wrap_around.exit4, !dbg !93

main_wrap_around.exit4:                           ; preds = %main_bb10, %main_bb9, %main_bb8, %main_bb6
  %pos.0 = phi i64 [ %"28", %main_bb6 ], [ %"35", %main_bb8 ], [ %"40", %main_bb10 ], [ %"30", %main_bb9 ]
  %direction.0 = phi i64 [ %"15", %main_bb6 ], [ 1, %main_bb8 ], [ 1, %main_bb9 ], [ 1, %main_bb10 ]
  %"41" = sext i32 %"16" to i64, !dbg !94
  %"42" = getelementptr inbounds [100000 x %struct.Node]* @memory0, i32 0, i64 %"41", !dbg !94
  %"43" = getelementptr inbounds %struct.Node* %"42", i32 0, i32 0, !dbg !94
  %"44" = load i64* %"43", align 8, !dbg !94
  %"45" = srem i64 %pos.0, %"44", !dbg !94
  call void @llvm.dbg.value(metadata !{i64 %"45"}, i64 0, metadata !95), !dbg !96
  call void @llvm.dbg.value(metadata !81, i64 0, metadata !97), !dbg !98
  call void @llvm.dbg.value(metadata !84, i64 0, metadata !99), !dbg !100
  call void @llvm.dbg.value(metadata !87, i64 0, metadata !101), !dbg !102
  %"46" = icmp sgt i64 %"45", 2147483647, !dbg !103
  br i1 %"46", label %main_bb11, label %main_bb12, !dbg !103

main_bb11:                                        ; preds = %main_wrap_around.exit4
  %"47" = sub nsw i64 %"45", 2147483647, !dbg !104
  %"48" = sub nsw i64 %"47", 1, !dbg !104
  %"49" = srem i64 %"48", 4294967296, !dbg !104
  %"50" = add nsw i64 -2147483648, %"49", !dbg !104
  br label %main_wrap_around.exit2, !dbg !104

main_bb12:                                        ; preds = %main_wrap_around.exit4
  %"51" = icmp slt i64 %"45", -2147483648, !dbg !105
  br i1 %"51", label %main_bb13, label %main_wrap_around.exit2, !dbg !105

main_bb13:                                        ; preds = %main_bb12
  %"52" = sub nsw i64 -2147483648, %"45", !dbg !106
  %"53" = sub nsw i64 %"52", 1, !dbg !106
  %"54" = srem i64 %"53", 4294967296, !dbg !106
  %"55" = sub nsw i64 2147483647, %"54", !dbg !106
  br label %main_wrap_around.exit2, !dbg !106

main_wrap_around.exit2:                           ; preds = %main_bb11, %main_bb12, %main_bb13
  %.0.i1 = phi i64 [ %"50", %main_bb11 ], [ %"55", %main_bb13 ], [ %"45", %main_bb12 ], !dbg !94
  call void @llvm.dbg.value(metadata !{i64 %.0.i1}, i64 0, metadata !70), !dbg !71
  call void @llvm.dbg.value(metadata !{i64 %.0.i1}, i64 0, metadata !107), !dbg !108
  call void @llvm.dbg.value(metadata !{i64 %"60"}, i64 0, metadata !109), !dbg !112
  call void @llvm.dbg.value(metadata !81, i64 0, metadata !113), !dbg !114
  call void @llvm.dbg.value(metadata !84, i64 0, metadata !115), !dbg !116
  call void @llvm.dbg.value(metadata !87, i64 0, metadata !117), !dbg !118
  call void @llvm.dbg.value(metadata !{i64 %.0.i}, i64 0, metadata !70), !dbg !71
  %"56" = sext i32 %"16" to i64, !dbg !119
  %"57" = getelementptr inbounds [100000 x %struct.Node]* @memory0, i32 0, i64 %"56", !dbg !119
  %"58" = getelementptr inbounds %struct.Node* %"57", i32 0, i32 0, !dbg !119
  %"59" = load i64* %"58", align 8, !dbg !119
  call void @llvm.dbg.value(metadata !121, i64 0, metadata !70), !dbg !71
  br label %main_bb14, !dbg !122

main_bb14:                                        ; preds = %main_wrap_around.exit, %main_wrap_around.exit2
  %pos.1 = phi i64 [ %.0.i1, %main_wrap_around.exit2 ], [ %..0.i, %main_wrap_around.exit ]
  %"60" = add nsw i64 %pos.1, %direction.0, !dbg !110
  %"61" = icmp sgt i64 %"60", 2147483647, !dbg !123
  br i1 %"61", label %main_bb15, label %main_bb16, !dbg !123

main_bb15:                                        ; preds = %main_bb14
  %"62" = sub nsw i64 %"60", 2147483647, !dbg !124
  %"63" = sub nsw i64 %"62", 1, !dbg !124
  %"64" = srem i64 %"63", 4294967296, !dbg !124
  %"65" = add nsw i64 -2147483648, %"64", !dbg !124
  br label %main_wrap_around.exit, !dbg !124

main_bb16:                                        ; preds = %main_bb14
  %"66" = icmp slt i64 %"60", -2147483648, !dbg !125
  br i1 %"66", label %main_bb17, label %main_wrap_around.exit, !dbg !125

main_bb17:                                        ; preds = %main_bb16
  %"67" = sub nsw i64 -2147483648, %"60", !dbg !126
  %"68" = sub nsw i64 %"67", 1, !dbg !126
  %"69" = srem i64 %"68", 4294967296, !dbg !126
  %"70" = sub nsw i64 2147483647, %"69", !dbg !126
  br label %main_wrap_around.exit, !dbg !126

main_wrap_around.exit:                            ; preds = %main_bb15, %main_bb16, %main_bb17
  %.0.i = phi i64 [ %"65", %main_bb15 ], [ %"70", %main_bb17 ], [ %"60", %main_bb16 ], !dbg !110
  %"71" = icmp eq i64 %.0.i, %"59", !dbg !119
  %..0.i = select i1 %"71", i64 0, i64 %.0.i, !dbg !119
  %"72" = icmp ne i64 %..0.i, %.0.i1, !dbg !127
  br i1 %"72", label %main_bb14, label %main_bb18, !dbg !127

main_bb18:                                        ; preds = %main_wrap_around.exit
  ret void, !dbg !129
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
!55 = metadata !{i32 786688, metadata !13, metadata !"direction", metadata !5, i32 30, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [direction] [line 30]
!56 = metadata !{i32 30, i32 13, metadata !13, null}
!57 = metadata !{i32 16}
!58 = metadata !{i32 786689, metadata !9, metadata !"size", metadata !5, i32 16777238, metadata !12, i32 0, metadata !59} ; [ DW_TAG_arg_variable ] [size] [line 22]
!59 = metadata !{i32 31, i32 14, metadata !13, null}
!60 = metadata !{i32 22, i32 26, metadata !9, metadata !59}
!61 = metadata !{i32 23, i32 4, metadata !9, metadata !59}
!62 = metadata !{i32 786688, metadata !9, metadata !"allocatedIndex", metadata !5, i32 23, metadata !12, i32 0, metadata !59} ; [ DW_TAG_auto_variable ] [allocatedIndex] [line 23]
!63 = metadata !{i32 23, i32 8, metadata !9, metadata !59}
!64 = metadata !{i32 24, i32 4, metadata !9, metadata !59}
!65 = metadata !{i32 786688, metadata !13, metadata !"menu", metadata !5, i32 31, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [menu] [line 31]
!66 = metadata !{i32 31, i32 7, metadata !13, null}
!67 = metadata !{i32 32, i32 3, metadata !13, null}
!68 = metadata !{i32 33, i32 3, metadata !13, null}
!69 = metadata !{i32 34, i32 3, metadata !13, null}
!70 = metadata !{i32 786688, metadata !13, metadata !"pos", metadata !5, i32 34, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pos] [line 34]
!71 = metadata !{i32 34, i32 13, metadata !13, null}
!72 = metadata !{i32 36, i32 9, metadata !73, null}
!73 = metadata !{i32 786443, metadata !1, metadata !74, i32 36, i32 9, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!74 = metadata !{i32 786443, metadata !1, metadata !75, i32 35, i32 10, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!75 = metadata !{i32 786443, metadata !1, metadata !13, i32 35, i32 7, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!76 = metadata !{i32 42, i32 21, metadata !77, null}
!77 = metadata !{i32 786443, metadata !1, metadata !78, i32 41, i32 12, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!78 = metadata !{i32 786443, metadata !1, metadata !75, i32 40, i32 8, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!79 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777228, metadata !8, i32 0, metadata !76} ; [ DW_TAG_arg_variable ] [value] [line 12]
!80 = metadata !{i32 12, i32 33, metadata !4, metadata !76}
!81 = metadata !{i64 -2147483648}
!82 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554444, metadata !8, i32 0, metadata !76} ; [ DW_TAG_arg_variable ] [lower_bound] [line 12]
!83 = metadata !{i32 12, i32 50, metadata !4, metadata !76}
!84 = metadata !{i64 2147483647}
!85 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331660, metadata !8, i32 0, metadata !76} ; [ DW_TAG_arg_variable ] [upper_bound] [line 12]
!86 = metadata !{i32 12, i32 73, metadata !4, metadata !76}
!87 = metadata !{i64 4294967296}
!88 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 13, metadata !8, i32 0, metadata !76} ; [ DW_TAG_auto_variable ] [range] [line 13]
!89 = metadata !{i32 13, i32 15, metadata !4, metadata !76}
!90 = metadata !{i32 14, i32 9, metadata !40, metadata !76}
!91 = metadata !{i32 15, i32 9, metadata !42, metadata !76}
!92 = metadata !{i32 17, i32 14, metadata !44, metadata !76}
!93 = metadata !{i32 18, i32 9, metadata !46, metadata !76}
!94 = metadata !{i32 46, i32 9, metadata !13, null}
!95 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777228, metadata !8, i32 0, metadata !94} ; [ DW_TAG_arg_variable ] [value] [line 12]
!96 = metadata !{i32 12, i32 33, metadata !4, metadata !94}
!97 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554444, metadata !8, i32 0, metadata !94} ; [ DW_TAG_arg_variable ] [lower_bound] [line 12]
!98 = metadata !{i32 12, i32 50, metadata !4, metadata !94}
!99 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331660, metadata !8, i32 0, metadata !94} ; [ DW_TAG_arg_variable ] [upper_bound] [line 12]
!100 = metadata !{i32 12, i32 73, metadata !4, metadata !94}
!101 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 13, metadata !8, i32 0, metadata !94} ; [ DW_TAG_auto_variable ] [range] [line 13]
!102 = metadata !{i32 13, i32 15, metadata !4, metadata !94}
!103 = metadata !{i32 14, i32 9, metadata !40, metadata !94}
!104 = metadata !{i32 15, i32 9, metadata !42, metadata !94}
!105 = metadata !{i32 17, i32 14, metadata !44, metadata !94}
!106 = metadata !{i32 18, i32 9, metadata !46, metadata !94}
!107 = metadata !{i32 786688, metadata !13, metadata !"start", metadata !5, i32 47, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [start] [line 47]
!108 = metadata !{i32 47, i32 13, metadata !13, null}
!109 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777228, metadata !8, i32 0, metadata !110} ; [ DW_TAG_arg_variable ] [value] [line 12]
!110 = metadata !{i32 49, i32 11, metadata !111, null}
!111 = metadata !{i32 786443, metadata !1, metadata !13, i32 48, i32 13, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!112 = metadata !{i32 12, i32 33, metadata !4, metadata !110}
!113 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554444, metadata !8, i32 0, metadata !110} ; [ DW_TAG_arg_variable ] [lower_bound] [line 12]
!114 = metadata !{i32 12, i32 50, metadata !4, metadata !110}
!115 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331660, metadata !8, i32 0, metadata !110} ; [ DW_TAG_arg_variable ] [upper_bound] [line 12]
!116 = metadata !{i32 12, i32 73, metadata !4, metadata !110}
!117 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 13, metadata !8, i32 0, metadata !110} ; [ DW_TAG_auto_variable ] [range] [line 13]
!118 = metadata !{i32 13, i32 15, metadata !4, metadata !110}
!119 = metadata !{i32 50, i32 9, metadata !120, null}
!120 = metadata !{i32 786443, metadata !1, metadata !111, i32 50, i32 9, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!121 = metadata !{i64 0}
!122 = metadata !{i32 48, i32 3, metadata !13, null}
!123 = metadata !{i32 14, i32 9, metadata !40, metadata !110}
!124 = metadata !{i32 15, i32 9, metadata !42, metadata !110}
!125 = metadata !{i32 17, i32 14, metadata !44, metadata !110}
!126 = metadata !{i32 18, i32 9, metadata !46, metadata !110}
!127 = metadata !{i32 53, i32 9, metadata !128, null}
!128 = metadata !{i32 786443, metadata !1, metadata !111, i32 53, i32 9, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!129 = metadata !{i32 57, i32 3, metadata !13, null}

