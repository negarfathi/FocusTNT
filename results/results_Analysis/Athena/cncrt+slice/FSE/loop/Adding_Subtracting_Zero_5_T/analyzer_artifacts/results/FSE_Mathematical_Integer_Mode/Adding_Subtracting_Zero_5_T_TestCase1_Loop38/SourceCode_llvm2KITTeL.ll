; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.NNode = type { i32 }

@"'memory0_freeIndex" = global i32 1, align 4
@memory0 = common global [100000 x %struct.NNode] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define i32 @allocate_memory0(i32 %size) #0 {
allocate_memory0_bb0:
  call void @llvm.dbg.value(metadata !{i32 %size}, i64 0, metadata !28), !dbg !29
  %"0" = load i32* @"'memory0_freeIndex", align 4, !dbg !30
  call void @llvm.dbg.value(metadata !{i32 %"0"}, i64 0, metadata !31), !dbg !32
  %"1" = load i32* @"'memory0_freeIndex", align 4, !dbg !33
  %"2" = add nsw i32 %"1", %size, !dbg !33
  store i32 %"2", i32* @"'memory0_freeIndex", align 4, !dbg !33
  ret i32 %"0", !dbg !34
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @intinitLink_slice_1() #0 {
intinitLink_slice_1_bb1:
  call void @llvm.dbg.value(metadata !35, i64 0, metadata !36), !dbg !38
  %"3" = load i32* @"'memory0_freeIndex", align 4, !dbg !39
  call void @llvm.dbg.value(metadata !{i32 %"3"}, i64 0, metadata !40), !dbg !41
  %"4" = load i32* @"'memory0_freeIndex", align 4, !dbg !42
  %"5" = add nsw i32 %"4", 4, !dbg !42
  store i32 %"5", i32* @"'memory0_freeIndex", align 4, !dbg !42
  call void @llvm.dbg.value(metadata !{i32 %"3"}, i64 0, metadata !43), !dbg !44
  call void @llvm.dbg.value(metadata !{i32 %"3"}, i64 0, metadata !45), !dbg !46
  %"6" = sext i32 %"3" to i64, !dbg !47
  %"7" = getelementptr inbounds [100000 x %struct.NNode]* @memory0, i32 0, i64 %"6", !dbg !47
  %"8" = getelementptr inbounds %struct.NNode* %"7", i32 0, i32 0, !dbg !47
  store i32 %"3", i32* %"8", align 4, !dbg !47
  ret i32 %"3", !dbg !48
}

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb2:
  %"9" = call i32 (...)* @initLink_slice_1(), !dbg !49
  call void @llvm.dbg.value(metadata !{i32 %"9"}, i64 0, metadata !50), !dbg !51
  call void @llvm.dbg.value(metadata !{i32 %"9"}, i64 0, metadata !52), !dbg !53
  ret void, !dbg !54
}

declare i32 @initLink_slice_1(...) #2

declare i32 @__kittel_nondef.0()

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!25, !26}
!llvm.ident = !{!27}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !15, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [//FILES_DIR/SourceCode_SemanticAugmentor.c] [DW_LANG_C99]
!1 = metadata !{metadata !"FILES_DIR/SourceCode_SemanticAugmentor.c", metadata !"/"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9, metadata !12}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"allocate_memory0", metadata !"allocate_memory0", metadata !"", i32 9, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @allocate_memory0, null, null, metadata !2, i32 9} ; [ DW_TAG_subprogram ] [line 9] [def] [allocate_memory0]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"intinitLink_slice_1", metadata !"intinitLink_slice_1", metadata !"", i32 15, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @intinitLink_slice_1, null, null, metadata !2, i32 16} ; [ DW_TAG_subprogram ] [line 15] [def] [scope 16] [intinitLink_slice_1]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !8}
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 23, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @main, null, null, metadata !2, i32 24} ; [ DW_TAG_subprogram ] [line 23] [def] [scope 24] [main]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{null}
!15 = metadata !{metadata !16, metadata !17}
!16 = metadata !{i32 786484, i32 0, null, metadata !"memory0_freeIndex", metadata !"memory0_freeIndex", metadata !"", metadata !5, i32 8, metadata !8, i32 0, i32 1, i32* @"'memory0_freeIndex", null} ; [ DW_TAG_variable ] [memory0_freeIndex] [line 8] [def]
!17 = metadata !{i32 786484, i32 0, null, metadata !"memory0", metadata !"memory0", metadata !"", metadata !5, i32 7, metadata !18, i32 0, i32 1, [100000 x %struct.NNode]* @memory0, null} ; [ DW_TAG_variable ] [memory0] [line 7] [def]
!18 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 3200000, i64 32, i32 0, i32 0, metadata !19, metadata !23, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 3200000, align 32, offset 0] [from INSDS]
!19 = metadata !{i32 786454, metadata !1, null, metadata !"INSDS", i32 5, i64 0, i64 0, i64 0, i32 0, metadata !20} ; [ DW_TAG_typedef ] [INSDS] [line 5, size 0, align 0, offset 0] [from NNode]
!20 = metadata !{i32 786451, metadata !1, null, metadata !"NNode", i32 2, i64 32, i64 32, i32 0, i32 0, null, metadata !21, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [NNode] [line 2, size 32, align 32, offset 0] [def] [from ]
!21 = metadata !{metadata !22}
!22 = metadata !{i32 786445, metadata !1, metadata !20, metadata !"nxtact", i32 3, i64 32, i64 32, i64 0, i32 0, metadata !8} ; [ DW_TAG_member ] [nxtact] [line 3, size 32, align 32, offset 0] [from int]
!23 = metadata !{metadata !24}
!24 = metadata !{i32 786465, i64 0, i64 100000}   ; [ DW_TAG_subrange_type ] [0, 99999]
!25 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!26 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!27 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!28 = metadata !{i32 786689, metadata !4, metadata !"size", metadata !5, i32 16777225, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 9]
!29 = metadata !{i32 9, i32 26, metadata !4, null}
!30 = metadata !{i32 10, i32 4, metadata !4, null}
!31 = metadata !{i32 786688, metadata !4, metadata !"allocatedIndex", metadata !5, i32 10, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [allocatedIndex] [line 10]
!32 = metadata !{i32 10, i32 8, metadata !4, null}
!33 = metadata !{i32 11, i32 4, metadata !4, null}
!34 = metadata !{i32 12, i32 4, metadata !4, null}
!35 = metadata !{i32 4}
!36 = metadata !{i32 786689, metadata !4, metadata !"size", metadata !5, i32 16777225, metadata !8, i32 0, metadata !37} ; [ DW_TAG_arg_variable ] [size] [line 9]
!37 = metadata !{i32 17, i32 14, metadata !9, null}
!38 = metadata !{i32 9, i32 26, metadata !4, metadata !37}
!39 = metadata !{i32 10, i32 4, metadata !4, metadata !37}
!40 = metadata !{i32 786688, metadata !4, metadata !"allocatedIndex", metadata !5, i32 10, metadata !8, i32 0, metadata !37} ; [ DW_TAG_auto_variable ] [allocatedIndex] [line 10]
!41 = metadata !{i32 10, i32 8, metadata !4, metadata !37}
!42 = metadata !{i32 11, i32 4, metadata !4, metadata !37}
!43 = metadata !{i32 786688, metadata !9, metadata !"head", metadata !5, i32 17, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [head] [line 17]
!44 = metadata !{i32 17, i32 7, metadata !9, null}
!45 = metadata !{i32 786688, metadata !9, metadata !"cyclic", metadata !5, i32 18, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cyclic] [line 18]
!46 = metadata !{i32 18, i32 7, metadata !9, null}
!47 = metadata !{i32 19, i32 3, metadata !9, null}
!48 = metadata !{i32 20, i32 3, metadata !9, null}
!49 = metadata !{i32 25, i32 14, metadata !12, null}
!50 = metadata !{i32 786688, metadata !12, metadata !"list", metadata !5, i32 25, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [list] [line 25]
!51 = metadata !{i32 25, i32 7, metadata !12, null}
!52 = metadata !{i32 786688, metadata !12, metadata !"ip", metadata !5, i32 26, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ip] [line 26]
!53 = metadata !{i32 26, i32 7, metadata !12, null}
!54 = metadata !{i32 33, i32 3, metadata !12, null}

