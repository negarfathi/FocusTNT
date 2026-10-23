; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@"'memory0_freeIndex" = global i32 1, align 4
@memory0 = common global [100000 x i64] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define i64 @wrap_around(i64 %value, i64 %lower_bound, i64 %upper_bound) #0 {
wrap_around_bb0:
  call void @llvm.dbg.value(metadata !{i64 %value}, i64 0, metadata !25), !dbg !26
  call void @llvm.dbg.value(metadata !{i64 %lower_bound}, i64 0, metadata !27), !dbg !28
  call void @llvm.dbg.value(metadata !{i64 %upper_bound}, i64 0, metadata !29), !dbg !30
  %"0" = sub nsw i64 %upper_bound, %lower_bound, !dbg !31
  %"1" = add nsw i64 %"0", 1, !dbg !31
  call void @llvm.dbg.value(metadata !{i64 %"1"}, i64 0, metadata !32), !dbg !33
  %"2" = icmp sgt i64 %value, %upper_bound, !dbg !34
  br i1 %"2", label %wrap_around_bb1, label %wrap_around_bb2, !dbg !34

wrap_around_bb1:                                  ; preds = %wrap_around_bb0
  %"3" = sub nsw i64 %value, %upper_bound, !dbg !36
  %"4" = sub nsw i64 %"3", 1, !dbg !36
  %"5" = srem i64 %"4", %"1", !dbg !36
  %"6" = add nsw i64 %lower_bound, %"5", !dbg !36
  br label %wrap_around_bb4, !dbg !36

wrap_around_bb2:                                  ; preds = %wrap_around_bb0
  %"7" = icmp slt i64 %value, %lower_bound, !dbg !38
  br i1 %"7", label %wrap_around_bb3, label %wrap_around_bb4, !dbg !38

wrap_around_bb3:                                  ; preds = %wrap_around_bb2
  %"8" = sub nsw i64 %lower_bound, %value, !dbg !40
  %"9" = sub nsw i64 %"8", 1, !dbg !40
  %"10" = srem i64 %"9", %"1", !dbg !40
  %"11" = sub nsw i64 %upper_bound, %"10", !dbg !40
  br label %wrap_around_bb4, !dbg !40

wrap_around_bb4:                                  ; preds = %wrap_around_bb2, %wrap_around_bb3, %wrap_around_bb1
  %.0 = phi i64 [ %"6", %wrap_around_bb1 ], [ %"11", %wrap_around_bb3 ], [ %value, %wrap_around_bb2 ]
  ret i64 %.0, !dbg !42
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @allocate_memory0(i32 %size) #0 {
allocate_memory0_bb5:
  call void @llvm.dbg.value(metadata !{i32 %size}, i64 0, metadata !43), !dbg !44
  %"12" = load i32* @"'memory0_freeIndex", align 4, !dbg !45
  call void @llvm.dbg.value(metadata !{i32 %"12"}, i64 0, metadata !46), !dbg !47
  %"13" = load i32* @"'memory0_freeIndex", align 4, !dbg !48
  %"14" = add nsw i32 %"13", %size, !dbg !48
  store i32 %"14", i32* @"'memory0_freeIndex", align 4, !dbg !48
  ret i32 %"12", !dbg !49
}

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb6:
  call void @llvm.dbg.value(metadata !50, i64 0, metadata !51), !dbg !53
  %"15" = load i32* @"'memory0_freeIndex", align 4, !dbg !54
  call void @llvm.dbg.value(metadata !{i32 %"15"}, i64 0, metadata !55), !dbg !56
  %"16" = load i32* @"'memory0_freeIndex", align 4, !dbg !57
  %"17" = add nsw i32 %"16", 1, !dbg !57
  store i32 %"17", i32* @"'memory0_freeIndex", align 4, !dbg !57
  call void @llvm.dbg.value(metadata !{i32 %"15"}, i64 0, metadata !58), !dbg !59
  call void @llvm.dbg.value(metadata !60, i64 0, metadata !61), !dbg !62
  %"18" = sext i32 %"15" to i64, !dbg !63
  %"19" = sub nsw i64 1, 1, !dbg !63
  %"20" = add nsw i64 %"18", %"19", !dbg !63
  %"21" = getelementptr inbounds [100000 x i64]* @memory0, i32 0, i64 %"20", !dbg !63
  store i64 0, i64* %"21", align 8, !dbg !63
  call void @llvm.dbg.value(metadata !{i32 %"15"}, i64 0, metadata !64), !dbg !65
  %"22" = sext i32 %"15" to i64, !dbg !66
  %"23" = getelementptr inbounds [100000 x i64]* @memory0, i32 0, i64 %"22", !dbg !66
  %"24" = load i64* %"23", align 8, !dbg !66
  br label %main_bb7, !dbg !68

main_bb7:                                         ; preds = %main_bb7, %main_bb6
  %"25" = icmp ne i64 %"24", 0, !dbg !66
  br i1 %"25", label %main_bb7, label %main_bb8, !dbg !66

main_bb8:                                         ; preds = %main_bb7
  ret void, !dbg !69
}

declare i64 @__kittel_nondef.0()

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

declare i32 @__kittel_nondef.1()

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!22, !23}
!llvm.ident = !{!24}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !16, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [//FILES_DIR/SourceCode_SemanticAugmentor.c] [DW_LANG_C99]
!1 = metadata !{metadata !"FILES_DIR/SourceCode_SemanticAugmentor.c", metadata !"/"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9, metadata !13}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"wrap_around", metadata !"wrap_around", metadata !"", i32 7, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i64, i64, i64)* @wrap_around, null, null, metadata !2, i32 7} ; [ DW_TAG_subprogram ] [line 7] [def] [wrap_around]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"allocate_memory0", metadata !"allocate_memory0", metadata !"", i32 17, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @allocate_memory0, null, null, metadata !2, i32 17} ; [ DW_TAG_subprogram ] [line 17] [def] [allocate_memory0]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !12, metadata !12}
!12 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!13 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 23, metadata !14, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @main, null, null, metadata !2, i32 24} ; [ DW_TAG_subprogram ] [line 23] [def] [scope 24] [main]
!14 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !15, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!15 = metadata !{null}
!16 = metadata !{metadata !17, metadata !18}
!17 = metadata !{i32 786484, i32 0, null, metadata !"memory0_freeIndex", metadata !"memory0_freeIndex", metadata !"", metadata !5, i32 6, metadata !12, i32 0, i32 1, i32* @"'memory0_freeIndex", null} ; [ DW_TAG_variable ] [memory0_freeIndex] [line 6] [def]
!18 = metadata !{i32 786484, i32 0, null, metadata !"memory0", metadata !"memory0", metadata !"", metadata !5, i32 5, metadata !19, i32 0, i32 1, [100000 x i64]* @memory0, null} ; [ DW_TAG_variable ] [memory0] [line 5] [def]
!19 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 6400000, i64 64, i32 0, i32 0, metadata !8, metadata !20, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 6400000, align 64, offset 0] [from long long int]
!20 = metadata !{metadata !21}
!21 = metadata !{i32 786465, i64 0, i64 100000}   ; [ DW_TAG_subrange_type ] [0, 99999]
!22 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!23 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!24 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!25 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777223, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 7]
!26 = metadata !{i32 7, i32 33, metadata !4, null}
!27 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554439, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [lower_bound] [line 7]
!28 = metadata !{i32 7, i32 50, metadata !4, null}
!29 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331655, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [upper_bound] [line 7]
!30 = metadata !{i32 7, i32 73, metadata !4, null}
!31 = metadata !{i32 8, i32 5, metadata !4, null} ; [ DW_TAG_imported_declaration ]
!32 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 8, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [range] [line 8]
!33 = metadata !{i32 8, i32 15, metadata !4, null} ; [ DW_TAG_imported_declaration ]
!34 = metadata !{i32 9, i32 9, metadata !35, null}
!35 = metadata !{i32 786443, metadata !1, metadata !4, i32 9, i32 9, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!36 = metadata !{i32 10, i32 9, metadata !37, null}
!37 = metadata !{i32 786443, metadata !1, metadata !35, i32 9, i32 30, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!38 = metadata !{i32 12, i32 14, metadata !39, null}
!39 = metadata !{i32 786443, metadata !1, metadata !35, i32 12, i32 14, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!40 = metadata !{i32 13, i32 9, metadata !41, null}
!41 = metadata !{i32 786443, metadata !1, metadata !39, i32 12, i32 35, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!42 = metadata !{i32 16, i32 1, metadata !4, null}
!43 = metadata !{i32 786689, metadata !9, metadata !"size", metadata !5, i32 16777233, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 17]
!44 = metadata !{i32 17, i32 26, metadata !9, null}
!45 = metadata !{i32 18, i32 4, metadata !9, null}
!46 = metadata !{i32 786688, metadata !9, metadata !"allocatedIndex", metadata !5, i32 18, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [allocatedIndex] [line 18]
!47 = metadata !{i32 18, i32 8, metadata !9, null}
!48 = metadata !{i32 19, i32 4, metadata !9, null}
!49 = metadata !{i32 20, i32 4, metadata !9, null}
!50 = metadata !{i32 1}
!51 = metadata !{i32 786689, metadata !9, metadata !"size", metadata !5, i32 16777233, metadata !12, i32 0, metadata !52} ; [ DW_TAG_arg_variable ] [size] [line 17]
!52 = metadata !{i32 25, i32 21, metadata !13, null}
!53 = metadata !{i32 17, i32 26, metadata !9, metadata !52}
!54 = metadata !{i32 18, i32 4, metadata !9, metadata !52}
!55 = metadata !{i32 786688, metadata !9, metadata !"allocatedIndex", metadata !5, i32 18, metadata !12, i32 0, metadata !52} ; [ DW_TAG_auto_variable ] [allocatedIndex] [line 18]
!56 = metadata !{i32 18, i32 8, metadata !9, metadata !52}
!57 = metadata !{i32 19, i32 4, metadata !9, metadata !52}
!58 = metadata !{i32 786688, metadata !13, metadata !"argv1_index", metadata !5, i32 25, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [argv1_index] [line 25]
!59 = metadata !{i32 25, i32 7, metadata !13, null}
!60 = metadata !{i64 1}
!61 = metadata !{i32 786688, metadata !13, metadata !"len", metadata !5, i32 26, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [len] [line 26]
!62 = metadata !{i32 26, i32 13, metadata !13, null}
!63 = metadata !{i32 27, i32 3, metadata !13, null}
!64 = metadata !{i32 786688, metadata !13, metadata !"argv", metadata !5, i32 28, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [argv] [line 28]
!65 = metadata !{i32 28, i32 7, metadata !13, null}
!66 = metadata !{i32 29, i32 3, metadata !67, null}
!67 = metadata !{i32 786443, metadata !1, metadata !13, i32 29, i32 3, i32 1, i32 5} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!68 = metadata !{i32 29, i32 3, metadata !13, null}
!69 = metadata !{i32 32, i32 3, metadata !13, null}

