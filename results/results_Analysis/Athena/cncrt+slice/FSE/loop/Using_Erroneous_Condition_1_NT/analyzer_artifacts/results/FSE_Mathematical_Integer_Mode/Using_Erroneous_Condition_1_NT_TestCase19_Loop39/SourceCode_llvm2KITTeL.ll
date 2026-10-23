; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Node = type { i32, i32 }

@"'memory0_freeIndex" = global i32 1, align 4
@memory0 = common global [100000 x %struct.Node] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define i32 @allocate_memory0(i32 %size) #0 {
allocate_memory0_bb0:
  call void @llvm.dbg.value(metadata !{i32 %size}, i64 0, metadata !26), !dbg !27
  %"0" = load i32* @"'memory0_freeIndex", align 4, !dbg !28
  call void @llvm.dbg.value(metadata !{i32 %"0"}, i64 0, metadata !29), !dbg !30
  %"1" = load i32* @"'memory0_freeIndex", align 4, !dbg !31
  %"2" = add nsw i32 %"1", %size, !dbg !31
  store i32 %"2", i32* @"'memory0_freeIndex", align 4, !dbg !31
  ret i32 %"0", !dbg !32
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb1:
  call void @llvm.dbg.value(metadata !33, i64 0, metadata !34), !dbg !36
  %"3" = load i32* @"'memory0_freeIndex", align 4, !dbg !37
  call void @llvm.dbg.value(metadata !{i32 %"3"}, i64 0, metadata !38), !dbg !39
  %"4" = load i32* @"'memory0_freeIndex", align 4, !dbg !40
  %"5" = add nsw i32 %"4", 8, !dbg !40
  store i32 %"5", i32* @"'memory0_freeIndex", align 4, !dbg !40
  call void @llvm.dbg.value(metadata !{i32 %"3"}, i64 0, metadata !41), !dbg !42
  %"6" = sext i32 %"3" to i64, !dbg !43
  %"7" = getelementptr inbounds [100000 x %struct.Node]* @memory0, i32 0, i64 %"6", !dbg !43
  %"8" = getelementptr inbounds %struct.Node* %"7", i32 0, i32 1, !dbg !43
  store i32 2147483647, i32* %"8", align 4, !dbg !43
  %"9" = sext i32 %"3" to i64, !dbg !44
  %"10" = getelementptr inbounds [100000 x %struct.Node]* @memory0, i32 0, i64 %"9", !dbg !44
  %"11" = getelementptr inbounds %struct.Node* %"10", i32 0, i32 0, !dbg !44
  store i32 2147483647, i32* %"11", align 4, !dbg !44
  %"12" = sext i32 %"3" to i64, !dbg !45
  %"13" = getelementptr inbounds [100000 x %struct.Node]* @memory0, i32 0, i64 %"12", !dbg !45
  %"14" = getelementptr inbounds %struct.Node* %"13", i32 0, i32 1, !dbg !45
  %"15" = load i32* %"14", align 4, !dbg !45
  call void @llvm.dbg.value(metadata !{i32 %"15"}, i64 0, metadata !46), !dbg !47
  %"16" = add nsw i32 %"15", -1, !dbg !48
  call void @llvm.dbg.value(metadata !{i32 %"16"}, i64 0, metadata !46), !dbg !47
  call void @llvm.dbg.value(metadata !49, i64 0, metadata !50), !dbg !51
  %"17" = sext i32 %"3" to i64, !dbg !52
  %"18" = getelementptr inbounds [100000 x %struct.Node]* @memory0, i32 0, i64 %"17", !dbg !52
  %"19" = getelementptr inbounds %struct.Node* %"18", i32 0, i32 0, !dbg !52
  %"20" = load i32* %"19", align 4, !dbg !52
  %"21" = srem i32 %"16", %"20", !dbg !52
  call void @llvm.dbg.value(metadata !{i32 %"21"}, i64 0, metadata !46), !dbg !47
  call void @llvm.dbg.value(metadata !{i32 %"34"}, i64 0, metadata !46), !dbg !47
  %"22" = sext i32 %"3" to i64, !dbg !53
  %"23" = getelementptr inbounds [100000 x %struct.Node]* @memory0, i32 0, i64 %"22", !dbg !53
  %"24" = getelementptr inbounds %struct.Node* %"23", i32 0, i32 0, !dbg !53
  %"25" = load i32* %"24", align 4, !dbg !53
  %"26" = sext i32 %"3" to i64, !dbg !56
  %"27" = getelementptr inbounds [100000 x %struct.Node]* @memory0, i32 0, i64 %"26", !dbg !56
  %"28" = getelementptr inbounds %struct.Node* %"27", i32 0, i32 1, !dbg !56
  %"29" = load i32* %"28", align 4, !dbg !56
  %"30" = sext i32 %"3" to i64, !dbg !58
  %"31" = getelementptr inbounds [100000 x %struct.Node]* @memory0, i32 0, i64 %"30", !dbg !58
  %"32" = getelementptr inbounds %struct.Node* %"31", i32 0, i32 0, !dbg !58
  %"33" = load i32* %"32", align 4, !dbg !58
  call void @llvm.dbg.value(metadata !{i32 %"37"}, i64 0, metadata !46), !dbg !47
  br label %main_bb2, !dbg !61

main_bb2:                                         ; preds = %main_bb4, %main_bb1
  %pos.0 = phi i32 [ %"21", %main_bb1 ], [ %pos.2, %main_bb4 ]
  %"34" = add nsw i32 %pos.0, -1, !dbg !62
  %"35" = icmp eq i32 %"34", %"25", !dbg !53
  br i1 %"35", label %main_bb4, label %main_bb3, !dbg !53

main_bb3:                                         ; preds = %main_bb2
  %"36" = icmp slt i32 %"34", 0, !dbg !63
  %"37" = sub nsw i32 %"33", 1, !dbg !58
  %. = select i1 %"36", i32 %"37", i32 %"34", !dbg !63
  br label %main_bb4, !dbg !64

main_bb4:                                         ; preds = %main_bb3, %main_bb2
  %pos.2 = phi i32 [ %"34", %main_bb2 ], [ %., %main_bb3 ]
  %"38" = icmp ne i32 %pos.2, %"29", !dbg !56
  br i1 %"38", label %main_bb2, label %main_bb5, !dbg !56

main_bb5:                                         ; preds = %main_bb4
  ret void, !dbg !67
}

declare i32 @__kittel_nondef.0()

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!23, !24}
!llvm.ident = !{!25}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !12, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [//FILES_DIR/SourceCode_SemanticAugmentor.c] [DW_LANG_C99]
!1 = metadata !{metadata !"FILES_DIR/SourceCode_SemanticAugmentor.c", metadata !"/"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"allocate_memory0", metadata !"allocate_memory0", metadata !"", i32 10, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @allocate_memory0, null, null, metadata !2, i32 10} ; [ DW_TAG_subprogram ] [line 10] [def] [allocate_memory0]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 16, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @main, null, null, metadata !2, i32 17} ; [ DW_TAG_subprogram ] [line 16] [def] [scope 17] [main]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{null}
!12 = metadata !{metadata !13, metadata !14}
!13 = metadata !{i32 786484, i32 0, null, metadata !"memory0_freeIndex", metadata !"memory0_freeIndex", metadata !"", metadata !5, i32 9, metadata !8, i32 0, i32 1, i32* @"'memory0_freeIndex", null} ; [ DW_TAG_variable ] [memory0_freeIndex] [line 9] [def]
!14 = metadata !{i32 786484, i32 0, null, metadata !"memory0", metadata !"memory0", metadata !"", metadata !5, i32 8, metadata !15, i32 0, i32 1, [100000 x %struct.Node]* @memory0, null} ; [ DW_TAG_variable ] [memory0] [line 8] [def]
!15 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 6400000, i64 32, i32 0, i32 0, metadata !16, metadata !21, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 6400000, align 32, offset 0] [from Node]
!16 = metadata !{i32 786454, metadata !1, null, metadata !"Node", i32 6, i64 0, i64 0, i64 0, i32 0, metadata !17} ; [ DW_TAG_typedef ] [Node] [line 6, size 0, align 0, offset 0] [from Node]
!17 = metadata !{i32 786451, metadata !1, null, metadata !"Node", i32 2, i64 64, i64 32, i32 0, i32 0, null, metadata !18, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [Node] [line 2, size 64, align 32, offset 0] [def] [from ]
!18 = metadata !{metadata !19, metadata !20}
!19 = metadata !{i32 786445, metadata !1, metadata !17, metadata !"size", i32 3, i64 32, i64 32, i64 0, i32 0, metadata !8} ; [ DW_TAG_member ] [size] [line 3, size 32, align 32, offset 0] [from int]
!20 = metadata !{i32 786445, metadata !1, metadata !17, metadata !"selected", i32 4, i64 32, i64 32, i64 32, i32 0, metadata !8} ; [ DW_TAG_member ] [selected] [line 4, size 32, align 32, offset 32] [from int]
!21 = metadata !{metadata !22}
!22 = metadata !{i32 786465, i64 0, i64 100000}   ; [ DW_TAG_subrange_type ] [0, 99999]
!23 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!24 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!25 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!26 = metadata !{i32 786689, metadata !4, metadata !"size", metadata !5, i32 16777226, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 10]
!27 = metadata !{i32 10, i32 26, metadata !4, null}
!28 = metadata !{i32 11, i32 4, metadata !4, null}
!29 = metadata !{i32 786688, metadata !4, metadata !"allocatedIndex", metadata !5, i32 11, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [allocatedIndex] [line 11]
!30 = metadata !{i32 11, i32 8, metadata !4, null}
!31 = metadata !{i32 12, i32 4, metadata !4, null}
!32 = metadata !{i32 13, i32 4, metadata !4, null}
!33 = metadata !{i32 8}
!34 = metadata !{i32 786689, metadata !4, metadata !"size", metadata !5, i32 16777226, metadata !8, i32 0, metadata !35} ; [ DW_TAG_arg_variable ] [size] [line 10]
!35 = metadata !{i32 19, i32 14, metadata !9, null}
!36 = metadata !{i32 10, i32 26, metadata !4, metadata !35}
!37 = metadata !{i32 11, i32 4, metadata !4, metadata !35}
!38 = metadata !{i32 786688, metadata !4, metadata !"allocatedIndex", metadata !5, i32 11, metadata !8, i32 0, metadata !35} ; [ DW_TAG_auto_variable ] [allocatedIndex] [line 11]
!39 = metadata !{i32 11, i32 8, metadata !4, metadata !35}
!40 = metadata !{i32 12, i32 4, metadata !4, metadata !35}
!41 = metadata !{i32 786688, metadata !9, metadata !"menu", metadata !5, i32 19, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [menu] [line 19]
!42 = metadata !{i32 19, i32 7, metadata !9, null}
!43 = metadata !{i32 20, i32 3, metadata !9, null}
!44 = metadata !{i32 21, i32 3, metadata !9, null}
!45 = metadata !{i32 22, i32 3, metadata !9, null}
!46 = metadata !{i32 786688, metadata !9, metadata !"pos", metadata !5, i32 22, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pos] [line 22]
!47 = metadata !{i32 22, i32 7, metadata !9, null}
!48 = metadata !{i32 23, i32 3, metadata !9, null}
!49 = metadata !{i32 -1}
!50 = metadata !{i32 786688, metadata !9, metadata !"direction", metadata !5, i32 18, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [direction] [line 18]
!51 = metadata !{i32 18, i32 7, metadata !9, null}
!52 = metadata !{i32 25, i32 3, metadata !9, null}
!53 = metadata !{i32 28, i32 9, metadata !54, null}
!54 = metadata !{i32 786443, metadata !1, metadata !55, i32 28, i32 9, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!55 = metadata !{i32 786443, metadata !1, metadata !9, i32 26, i32 13, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!56 = metadata !{i32 30, i32 9, metadata !57, null}
!57 = metadata !{i32 786443, metadata !1, metadata !55, i32 30, i32 9, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!58 = metadata !{i32 29, i32 20, metadata !59, null}
!59 = metadata !{i32 786443, metadata !1, metadata !60, i32 29, i32 20, i32 1, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!60 = metadata !{i32 786443, metadata !1, metadata !54, i32 29, i32 11, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!61 = metadata !{i32 26, i32 3, metadata !9, null}
!62 = metadata !{i32 27, i32 5, metadata !55, null}
!63 = metadata !{i32 29, i32 11, metadata !60, null}
!64 = metadata !{i32 29, i32 17, metadata !65, null}
!65 = metadata !{i32 786443, metadata !1, metadata !66, i32 29, i32 17, i32 3, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!66 = metadata !{i32 786443, metadata !1, metadata !60, i32 29, i32 17, i32 2, i32 5} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!67 = metadata !{i32 32, i32 3, metadata !9, null}

