; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@"'__fc_errno" = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @waitpid_slice_1() #0 {
waitpid_slice_1_bb0:
  call void @llvm.dbg.value(metadata !17, i64 0, metadata !18), !dbg !19
  ret i32 -999, !dbg !20
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb1:
  call void @llvm.dbg.value(metadata !17, i64 0, metadata !21), !dbg !23
  call void @llvm.dbg.value(metadata !17, i64 0, metadata !24), !dbg !25
  %"0" = icmp eq i32 -999, 0, !dbg !26
  br i1 %"0", label %main_bb2, label %main_bb4, !dbg !26

main_bb2:                                         ; preds = %main_bb1
  call void @llvm.dbg.value(metadata !17, i64 0, metadata !28), !dbg !31
  call void @llvm.dbg.value(metadata !17, i64 0, metadata !24), !dbg !25
  %"1" = load i32* @"'__fc_errno", align 4, !dbg !32
  %.old = icmp slt i32 -999, 0, !dbg !36
  br i1 %.old, label %main_bb3, label %main_bb4, !dbg !36

main_bb3:                                         ; preds = %main_bb3, %main_bb2
  %"2" = icmp eq i32 %"1", 1, !dbg !32
  %"3" = icmp slt i32 -999, 0, !dbg !36
  %or.cond = and i1 %"2", %"3", !dbg !32
  br i1 %or.cond, label %main_bb3, label %main_bb4, !dbg !32

main_bb4:                                         ; preds = %main_bb3, %main_bb2, %main_bb1
  ret void, !dbg !37
}

declare i32 @__kittel_nondef.0()

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!14, !15}
!llvm.ident = !{!16}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !12, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [//FILES_DIR/SourceCode_SemanticAugmentor.c] [DW_LANG_C99]
!1 = metadata !{metadata !"FILES_DIR/SourceCode_SemanticAugmentor.c", metadata !"/"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"waitpid_slice_1", metadata !"waitpid_slice_1", metadata !"", i32 6, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @waitpid_slice_1, null, null, metadata !2, i32 7} ; [ DW_TAG_subprogram ] [line 6] [def] [scope 7] [waitpid_slice_1]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 18, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @main, null, null, metadata !2, i32 19} ; [ DW_TAG_subprogram ] [line 18] [def] [scope 19] [main]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{null}
!12 = metadata !{metadata !13}
!13 = metadata !{i32 786484, i32 0, null, metadata !"__fc_errno", metadata !"__fc_errno", metadata !"", metadata !5, i32 5, metadata !8, i32 0, i32 1, i32* @"'__fc_errno", null} ; [ DW_TAG_variable ] [__fc_errno] [line 5] [def]
!14 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!15 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!16 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!17 = metadata !{i32 -999}
!18 = metadata !{i32 786688, metadata !4, metadata !"num", metadata !5, i32 9, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [num] [line 9]
!19 = metadata !{i32 9, i32 7, metadata !4, null}
!20 = metadata !{i32 15, i32 17, metadata !4, null}
!21 = metadata !{i32 786688, metadata !4, metadata !"num", metadata !5, i32 9, metadata !8, i32 0, metadata !22} ; [ DW_TAG_auto_variable ] [num] [line 9]
!22 = metadata !{i32 20, i32 13, metadata !9, null}
!23 = metadata !{i32 9, i32 7, metadata !4, metadata !22}
!24 = metadata !{i32 786688, metadata !9, metadata !"ret", metadata !5, i32 20, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ret] [line 20]
!25 = metadata !{i32 20, i32 7, metadata !9, null}
!26 = metadata !{i32 21, i32 7, metadata !27, null}
!27 = metadata !{i32 786443, metadata !1, metadata !9, i32 21, i32 7, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!28 = metadata !{i32 786688, metadata !4, metadata !"num", metadata !5, i32 9, metadata !8, i32 0, metadata !29} ; [ DW_TAG_auto_variable ] [num] [line 9]
!29 = metadata !{i32 23, i32 13, metadata !30, null}
!30 = metadata !{i32 786443, metadata !1, metadata !27, i32 22, i32 15, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!31 = metadata !{i32 9, i32 7, metadata !4, metadata !29}
!32 = metadata !{i32 25, i32 13, metadata !33, null}
!33 = metadata !{i32 786443, metadata !1, metadata !34, i32 25, i32 13, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!34 = metadata !{i32 786443, metadata !1, metadata !35, i32 24, i32 20, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!35 = metadata !{i32 786443, metadata !1, metadata !30, i32 24, i32 11, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!36 = metadata !{i32 24, i32 11, metadata !35, null}
!37 = metadata !{i32 29, i32 3, metadata !9, null}

