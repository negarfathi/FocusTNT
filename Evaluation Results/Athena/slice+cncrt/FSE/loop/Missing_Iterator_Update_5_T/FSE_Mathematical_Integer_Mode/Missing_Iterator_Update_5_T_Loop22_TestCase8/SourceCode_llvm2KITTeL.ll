; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@"'memory0_freeIndex" = global i32 1, align 4
@memory0 = common global [100000 x i32] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define i32 @allocate_memory0(i32 %size) #0 {
allocate_memory0_bb0:
  call void @llvm.dbg.value(metadata !{i32 %size}, i64 0, metadata !21), !dbg !22
  %"0" = load i32* @"'memory0_freeIndex", align 4, !dbg !23
  call void @llvm.dbg.value(metadata !{i32 %"0"}, i64 0, metadata !24), !dbg !25
  %"1" = load i32* @"'memory0_freeIndex", align 4, !dbg !26
  %"2" = add nsw i32 %"1", %size, !dbg !26
  store i32 %"2", i32* @"'memory0_freeIndex", align 4, !dbg !26
  ret i32 %"0", !dbg !27
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb1:
  call void @llvm.dbg.value(metadata !28, i64 0, metadata !29), !dbg !31
  %"3" = icmp sle i32 5, 0, !dbg !32
  %"4" = icmp sgt i32 5, 1000, !dbg !34
  %or.cond = or i1 %"3", %"4", !dbg !32
  br i1 %or.cond, label %main_bb9, label %main_bb2, !dbg !32

main_bb2:                                         ; preds = %main_bb1
  %"5" = sext i32 5 to i64, !dbg !36
  call void @llvm.dbg.value(metadata !{i64 %"5"}, i64 0, metadata !37), !dbg !39
  %"6" = mul i64 4, %"5", !dbg !40
  %"7" = call i8* @__fc_vla_alloc(i64 %"6"), !dbg !40
  %"8" = ptrtoint i8* %"7" to i32, !dbg !40
  call void @llvm.dbg.value(metadata !{i32 %"8"}, i64 0, metadata !41), !dbg !42
  call void @llvm.dbg.value(metadata !43, i64 0, metadata !44), !dbg !46
  call void @llvm.dbg.value(metadata !{i32 %"14"}, i64 0, metadata !44), !dbg !46
  br label %main_bb3, !dbg !47

main_bb3:                                         ; preds = %main_bb4, %main_bb2
  %i.0 = phi i32 [ 0, %main_bb2 ], [ %"14", %main_bb4 ]
  %"9" = icmp slt i32 %i.0, 5, !dbg !48
  br i1 %"9", label %main_bb4, label %main_bb5, !dbg !48

main_bb4:                                         ; preds = %main_bb3
  %"10" = call i32 @__VERIFIER_nondet_int(), !dbg !50
  %"11" = add nsw i32 %"8", %i.0, !dbg !50
  %"12" = sext i32 %"11" to i64, !dbg !50
  %"13" = getelementptr inbounds [100000 x i32]* @memory0, i32 0, i64 %"12", !dbg !50
  store i32 %"10", i32* %"13", align 4, !dbg !50
  %"14" = add nsw i32 %i.0, 1, !dbg !52
  br label %main_bb3, !dbg !53

main_bb5:                                         ; preds = %main_bb3
  call void @llvm.dbg.value(metadata !54, i64 0, metadata !55), !dbg !56
  %"15" = icmp slt i32 2, 0, !dbg !57
  br i1 %"15", label %main_bb9, label %main_bb6, !dbg !57

main_bb6:                                         ; preds = %main_bb5, %main_bb8
  %entry.0 = phi i32 [ %"22", %main_bb8 ], [ 2, %main_bb5 ]
  %"16" = icmp sge i32 %entry.0, 5, !dbg !59
  br i1 %"16", label %main_bb9, label %main_bb7, !dbg !59

main_bb7:                                         ; preds = %main_bb6
  %"17" = add nsw i32 %"8", %entry.0, !dbg !62
  %"18" = sext i32 %"17" to i64, !dbg !62
  %"19" = getelementptr inbounds [100000 x i32]* @memory0, i32 0, i64 %"18", !dbg !62
  %"20" = load i32* %"19", align 4, !dbg !62
  %"21" = icmp ne i32 %"20", 0, !dbg !62
  br i1 %"21", label %main_bb8, label %main_bb9, !dbg !62

main_bb8:                                         ; preds = %main_bb7
  %"22" = add nsw i32 %entry.0, 1, !dbg !64
  br label %main_bb6, !dbg !66

main_bb9:                                         ; preds = %main_bb7, %main_bb6, %main_bb5, %main_bb1
  ret void, !dbg !67
}

declare i8* @__fc_vla_alloc(i64) #2

declare i32 @__VERIFIER_nondet_int() #2

declare i32 @__kittel_nondef.0()

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

declare i64 @__kittel_nondef.1()

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!18, !19}
!llvm.ident = !{!20}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !12, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [//FILES_DIR/SourceCode_SemanticAugmentor.c] [DW_LANG_C99]
!1 = metadata !{metadata !"FILES_DIR/SourceCode_SemanticAugmentor.c", metadata !"/"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"allocate_memory0", metadata !"allocate_memory0", metadata !"", i32 11, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @allocate_memory0, null, null, metadata !2, i32 11} ; [ DW_TAG_subprogram ] [line 11] [def] [allocate_memory0]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 17, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @main, null, null, metadata !2, i32 18} ; [ DW_TAG_subprogram ] [line 17] [def] [scope 18] [main]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{null}
!12 = metadata !{metadata !13, metadata !14}
!13 = metadata !{i32 786484, i32 0, null, metadata !"memory0_freeIndex", metadata !"memory0_freeIndex", metadata !"", metadata !5, i32 10, metadata !8, i32 0, i32 1, i32* @"'memory0_freeIndex", null} ; [ DW_TAG_variable ] [memory0_freeIndex] [line 10] [def]
!14 = metadata !{i32 786484, i32 0, null, metadata !"memory0", metadata !"memory0", metadata !"", metadata !5, i32 9, metadata !15, i32 0, i32 1, [100000 x i32]* @memory0, null} ; [ DW_TAG_variable ] [memory0] [line 9] [def]
!15 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 3200000, i64 32, i32 0, i32 0, metadata !8, metadata !16, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 3200000, align 32, offset 0] [from int]
!16 = metadata !{metadata !17}
!17 = metadata !{i32 786465, i64 0, i64 100000}   ; [ DW_TAG_subrange_type ] [0, 99999]
!18 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!19 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!20 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!21 = metadata !{i32 786689, metadata !4, metadata !"size", metadata !5, i32 16777227, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 11]
!22 = metadata !{i32 11, i32 26, metadata !4, null}
!23 = metadata !{i32 12, i32 4, metadata !4, null}
!24 = metadata !{i32 786688, metadata !4, metadata !"allocatedIndex", metadata !5, i32 12, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [allocatedIndex] [line 12]
!25 = metadata !{i32 12, i32 8, metadata !4, null}
!26 = metadata !{i32 13, i32 4, metadata !4, null}
!27 = metadata !{i32 14, i32 4, metadata !4, null}
!28 = metadata !{i32 5}
!29 = metadata !{i32 786688, metadata !30, metadata !"MCE_LOG_LEN", metadata !5, i32 21, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [MCE_LOG_LEN] [line 21]
!30 = metadata !{i32 786443, metadata !1, metadata !9, i32 19, i32 3, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!31 = metadata !{i32 21, i32 9, metadata !30, null}
!32 = metadata !{i32 22, i32 9, metadata !33, null}
!33 = metadata !{i32 786443, metadata !1, metadata !30, i32 22, i32 9, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!34 = metadata !{i32 24, i32 11, metadata !35, null}
!35 = metadata !{i32 786443, metadata !1, metadata !33, i32 24, i32 11, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!36 = metadata !{i32 25, i32 5, metadata !30, null}
!37 = metadata !{i32 786688, metadata !30, metadata !"__lengthof_mcelog_entry", metadata !5, i32 20, metadata !38, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__lengthof_mcelog_entry] [line 20]
!38 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!39 = metadata !{i32 20, i32 19, metadata !30, null}
!40 = metadata !{i32 27, i32 7, metadata !30, null}
!41 = metadata !{i32 786688, metadata !30, metadata !"mcelog_entry", metadata !5, i32 26, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mcelog_entry] [line 26]
!42 = metadata !{i32 26, i32 9, metadata !30, null}
!43 = metadata !{i32 0}
!44 = metadata !{i32 786688, metadata !45, metadata !"i", metadata !5, i32 29, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 29]
!45 = metadata !{i32 786443, metadata !1, metadata !30, i32 28, i32 5, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!46 = metadata !{i32 29, i32 11, metadata !45, null}
!47 = metadata !{i32 30, i32 7, metadata !45, null}
!48 = metadata !{i32 30, i32 7, metadata !49, null}
!49 = metadata !{i32 786443, metadata !1, metadata !45, i32 30, i32 7, i32 1, i32 13} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!50 = metadata !{i32 31, i32 37, metadata !51, null}
!51 = metadata !{i32 786443, metadata !1, metadata !45, i32 30, i32 31, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!52 = metadata !{i32 32, i32 9, metadata !51, null}
!53 = metadata !{i32 33, i32 7, metadata !51, null}
!54 = metadata !{i32 2}
!55 = metadata !{i32 786688, metadata !30, metadata !"entry", metadata !5, i32 35, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [entry] [line 35]
!56 = metadata !{i32 35, i32 9, metadata !30, null}
!57 = metadata !{i32 36, i32 9, metadata !58, null}
!58 = metadata !{i32 786443, metadata !1, metadata !30, i32 36, i32 9, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!59 = metadata !{i32 38, i32 11, metadata !60, null}
!60 = metadata !{i32 786443, metadata !1, metadata !61, i32 38, i32 11, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!61 = metadata !{i32 786443, metadata !1, metadata !30, i32 37, i32 15, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!62 = metadata !{i32 42, i32 11, metadata !63, null}
!63 = metadata !{i32 786443, metadata !1, metadata !61, i32 42, i32 11, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!64 = metadata !{i32 43, i32 9, metadata !65, null}
!65 = metadata !{i32 786443, metadata !1, metadata !63, i32 42, i32 42, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!66 = metadata !{i32 49, i32 5, metadata !61, null}
!67 = metadata !{i32 52, i32 17, metadata !9, null}

