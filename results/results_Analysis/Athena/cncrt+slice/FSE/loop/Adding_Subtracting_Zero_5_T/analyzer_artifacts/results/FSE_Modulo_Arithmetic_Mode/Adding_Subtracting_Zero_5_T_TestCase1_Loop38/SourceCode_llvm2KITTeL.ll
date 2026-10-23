; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.NNode = type { i32 }

@"'memory0_freeIndex" = global i32 1, align 4
@memory0 = common global [100000 x %struct.NNode] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define i64 @wrap_around(i64 %value, i64 %lower_bound, i64 %upper_bound) #0 {
wrap_around_bb0:
  call void @llvm.dbg.value(metadata !{i64 %value}, i64 0, metadata !32), !dbg !33
  call void @llvm.dbg.value(metadata !{i64 %lower_bound}, i64 0, metadata !34), !dbg !35
  call void @llvm.dbg.value(metadata !{i64 %upper_bound}, i64 0, metadata !36), !dbg !37
  %"0" = sub nsw i64 %upper_bound, %lower_bound, !dbg !38
  %"1" = add nsw i64 %"0", 1, !dbg !38
  call void @llvm.dbg.value(metadata !{i64 %"1"}, i64 0, metadata !39), !dbg !40
  %"2" = icmp sgt i64 %value, %upper_bound, !dbg !41
  br i1 %"2", label %wrap_around_bb1, label %wrap_around_bb2, !dbg !41

wrap_around_bb1:                                  ; preds = %wrap_around_bb0
  %"3" = sub nsw i64 %value, %upper_bound, !dbg !43
  %"4" = sub nsw i64 %"3", 1, !dbg !43
  %"5" = srem i64 %"4", %"1", !dbg !43
  %"6" = add nsw i64 %lower_bound, %"5", !dbg !43
  br label %wrap_around_bb4, !dbg !43

wrap_around_bb2:                                  ; preds = %wrap_around_bb0
  %"7" = icmp slt i64 %value, %lower_bound, !dbg !45
  br i1 %"7", label %wrap_around_bb3, label %wrap_around_bb4, !dbg !45

wrap_around_bb3:                                  ; preds = %wrap_around_bb2
  %"8" = sub nsw i64 %lower_bound, %value, !dbg !47
  %"9" = sub nsw i64 %"8", 1, !dbg !47
  %"10" = srem i64 %"9", %"1", !dbg !47
  %"11" = sub nsw i64 %upper_bound, %"10", !dbg !47
  br label %wrap_around_bb4, !dbg !47

wrap_around_bb4:                                  ; preds = %wrap_around_bb2, %wrap_around_bb3, %wrap_around_bb1
  %.0 = phi i64 [ %"6", %wrap_around_bb1 ], [ %"11", %wrap_around_bb3 ], [ %value, %wrap_around_bb2 ]
  ret i64 %.0, !dbg !49
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @allocate_memory0(i32 %size) #0 {
allocate_memory0_bb5:
  call void @llvm.dbg.value(metadata !{i32 %size}, i64 0, metadata !50), !dbg !51
  %"12" = load i32* @"'memory0_freeIndex", align 4, !dbg !52
  call void @llvm.dbg.value(metadata !{i32 %"12"}, i64 0, metadata !53), !dbg !54
  %"13" = load i32* @"'memory0_freeIndex", align 4, !dbg !55
  %"14" = add nsw i32 %"13", %size, !dbg !55
  store i32 %"14", i32* @"'memory0_freeIndex", align 4, !dbg !55
  ret i32 %"12", !dbg !56
}

; Function Attrs: nounwind uwtable
define i32 @intinitLink_slice_1() #0 {
intinitLink_slice_1_bb6:
  call void @llvm.dbg.value(metadata !57, i64 0, metadata !58), !dbg !60
  %"15" = load i32* @"'memory0_freeIndex", align 4, !dbg !61
  call void @llvm.dbg.value(metadata !{i32 %"15"}, i64 0, metadata !62), !dbg !63
  %"16" = load i32* @"'memory0_freeIndex", align 4, !dbg !64
  %"17" = add nsw i32 %"16", 4, !dbg !64
  store i32 %"17", i32* @"'memory0_freeIndex", align 4, !dbg !64
  %"18" = sext i32 %"15" to i64, !dbg !59
  call void @llvm.dbg.value(metadata !{i64 %"18"}, i64 0, metadata !65), !dbg !66
  call void @llvm.dbg.value(metadata !{i64 %"18"}, i64 0, metadata !67), !dbg !68
  %"19" = trunc i64 %"18" to i32, !dbg !69
  %"20" = getelementptr inbounds [100000 x %struct.NNode]* @memory0, i32 0, i64 %"18", !dbg !69
  %"21" = getelementptr inbounds %struct.NNode* %"20", i32 0, i32 0, !dbg !69
  store i32 %"19", i32* %"21", align 4, !dbg !69
  %"22" = trunc i64 %"18" to i32, !dbg !70
  ret i32 %"22", !dbg !70
}

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb7:
  %"23" = call i32 (...)* @initLink_slice_1(), !dbg !71
  call void @llvm.dbg.value(metadata !{i32 %"23"}, i64 0, metadata !72), !dbg !73
  call void @llvm.dbg.value(metadata !{i32 %"23"}, i64 0, metadata !74), !dbg !75
  ret void, !dbg !76
}

declare i32 @initLink_slice_1(...) #2

declare i64 @__kittel_nondef.0()

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

declare i32 @__kittel_nondef.1()

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!29, !30}
!llvm.ident = !{!31}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !19, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [//FILES_DIR/SourceCode_SemanticAugmentor.c] [DW_LANG_C99]
!1 = metadata !{metadata !"FILES_DIR/SourceCode_SemanticAugmentor.c", metadata !"/"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9, metadata !13, metadata !16}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"wrap_around", metadata !"wrap_around", metadata !"", i32 11, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i64, i64, i64)* @wrap_around, null, null, metadata !2, i32 11} ; [ DW_TAG_subprogram ] [line 11] [def] [wrap_around]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"allocate_memory0", metadata !"allocate_memory0", metadata !"", i32 21, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @allocate_memory0, null, null, metadata !2, i32 21} ; [ DW_TAG_subprogram ] [line 21] [def] [allocate_memory0]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !12, metadata !12}
!12 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!13 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"intinitLink_slice_1", metadata !"intinitLink_slice_1", metadata !"", i32 27, metadata !14, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @intinitLink_slice_1, null, null, metadata !2, i32 28} ; [ DW_TAG_subprogram ] [line 27] [def] [scope 28] [intinitLink_slice_1]
!14 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !15, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!15 = metadata !{metadata !12}
!16 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 35, metadata !17, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @main, null, null, metadata !2, i32 36} ; [ DW_TAG_subprogram ] [line 35] [def] [scope 36] [main]
!17 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = metadata !{null}
!19 = metadata !{metadata !20, metadata !21}
!20 = metadata !{i32 786484, i32 0, null, metadata !"memory0_freeIndex", metadata !"memory0_freeIndex", metadata !"", metadata !5, i32 10, metadata !12, i32 0, i32 1, i32* @"'memory0_freeIndex", null} ; [ DW_TAG_variable ] [memory0_freeIndex] [line 10] [def]
!21 = metadata !{i32 786484, i32 0, null, metadata !"memory0", metadata !"memory0", metadata !"", metadata !5, i32 9, metadata !22, i32 0, i32 1, [100000 x %struct.NNode]* @memory0, null} ; [ DW_TAG_variable ] [memory0] [line 9] [def]
!22 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 3200000, i64 32, i32 0, i32 0, metadata !23, metadata !27, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 3200000, align 32, offset 0] [from INSDS]
!23 = metadata !{i32 786454, metadata !1, null, metadata !"INSDS", i32 7, i64 0, i64 0, i64 0, i32 0, metadata !24} ; [ DW_TAG_typedef ] [INSDS] [line 7, size 0, align 0, offset 0] [from NNode]
!24 = metadata !{i32 786451, metadata !1, null, metadata !"NNode", i32 4, i64 32, i64 32, i32 0, i32 0, null, metadata !25, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [NNode] [line 4, size 32, align 32, offset 0] [def] [from ]
!25 = metadata !{metadata !26}
!26 = metadata !{i32 786445, metadata !1, metadata !24, metadata !"nxtact", i32 5, i64 32, i64 32, i64 0, i32 0, metadata !12} ; [ DW_TAG_member ] [nxtact] [line 5, size 32, align 32, offset 0] [from int]
!27 = metadata !{metadata !28}
!28 = metadata !{i32 786465, i64 0, i64 100000}   ; [ DW_TAG_subrange_type ] [0, 99999]
!29 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!30 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!31 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!32 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777227, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 11]
!33 = metadata !{i32 11, i32 33, metadata !4, null}
!34 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554443, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [lower_bound] [line 11]
!35 = metadata !{i32 11, i32 50, metadata !4, null}
!36 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331659, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [upper_bound] [line 11]
!37 = metadata !{i32 11, i32 73, metadata !4, null}
!38 = metadata !{i32 12, i32 5, metadata !4, null}
!39 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 12, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [range] [line 12]
!40 = metadata !{i32 12, i32 15, metadata !4, null}
!41 = metadata !{i32 13, i32 9, metadata !42, null}
!42 = metadata !{i32 786443, metadata !1, metadata !4, i32 13, i32 9, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!43 = metadata !{i32 14, i32 9, metadata !44, null}
!44 = metadata !{i32 786443, metadata !1, metadata !42, i32 13, i32 30, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!45 = metadata !{i32 16, i32 14, metadata !46, null}
!46 = metadata !{i32 786443, metadata !1, metadata !42, i32 16, i32 14, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!47 = metadata !{i32 17, i32 9, metadata !48, null}
!48 = metadata !{i32 786443, metadata !1, metadata !46, i32 16, i32 35, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!49 = metadata !{i32 20, i32 1, metadata !4, null}
!50 = metadata !{i32 786689, metadata !9, metadata !"size", metadata !5, i32 16777237, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 21]
!51 = metadata !{i32 21, i32 26, metadata !9, null}
!52 = metadata !{i32 22, i32 4, metadata !9, null}
!53 = metadata !{i32 786688, metadata !9, metadata !"allocatedIndex", metadata !5, i32 22, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [allocatedIndex] [line 22]
!54 = metadata !{i32 22, i32 8, metadata !9, null}
!55 = metadata !{i32 23, i32 4, metadata !9, null}
!56 = metadata !{i32 24, i32 4, metadata !9, null}
!57 = metadata !{i32 4}
!58 = metadata !{i32 786689, metadata !9, metadata !"size", metadata !5, i32 16777237, metadata !12, i32 0, metadata !59} ; [ DW_TAG_arg_variable ] [size] [line 21]
!59 = metadata !{i32 29, i32 20, metadata !13, null}
!60 = metadata !{i32 21, i32 26, metadata !9, metadata !59}
!61 = metadata !{i32 22, i32 4, metadata !9, metadata !59}
!62 = metadata !{i32 786688, metadata !9, metadata !"allocatedIndex", metadata !5, i32 22, metadata !12, i32 0, metadata !59} ; [ DW_TAG_auto_variable ] [allocatedIndex] [line 22]
!63 = metadata !{i32 22, i32 8, metadata !9, metadata !59}
!64 = metadata !{i32 23, i32 4, metadata !9, metadata !59}
!65 = metadata !{i32 786688, metadata !13, metadata !"head", metadata !5, i32 29, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [head] [line 29]
!66 = metadata !{i32 29, i32 13, metadata !13, null}
!67 = metadata !{i32 786688, metadata !13, metadata !"cyclic", metadata !5, i32 30, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cyclic] [line 30]
!68 = metadata !{i32 30, i32 13, metadata !13, null}
!69 = metadata !{i32 31, i32 3, metadata !13, null}
!70 = metadata !{i32 32, i32 3, metadata !13, null}
!71 = metadata !{i32 37, i32 14, metadata !16, null}
!72 = metadata !{i32 786688, metadata !16, metadata !"list", metadata !5, i32 37, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [list] [line 37]
!73 = metadata !{i32 37, i32 7, metadata !16, null}
!74 = metadata !{i32 786688, metadata !16, metadata !"ip", metadata !5, i32 38, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ip] [line 38]
!75 = metadata !{i32 38, i32 7, metadata !16, null}
!76 = metadata !{i32 49, i32 3, metadata !16, null}

