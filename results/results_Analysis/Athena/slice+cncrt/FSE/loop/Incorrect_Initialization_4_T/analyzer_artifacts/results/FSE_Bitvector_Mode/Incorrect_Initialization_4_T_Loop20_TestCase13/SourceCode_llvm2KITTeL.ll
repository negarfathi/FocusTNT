; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb0:
  call void @llvm.dbg.value(metadata !11, i64 0, metadata !12), !dbg !14
  call void @llvm.dbg.value(metadata !15, i64 0, metadata !16), !dbg !17
  call void @llvm.dbg.value(metadata !18, i64 0, metadata !19), !dbg !20
  %"0" = icmp slt i32 10, 0, !dbg !21
  %"1" = icmp sle i32 20, 0, !dbg !23
  %or.cond = or i1 %"0", %"1", !dbg !21
  %"2" = icmp sle i32 5, 0, !dbg !25
  %or.cond1 = or i1 %or.cond, %"2", !dbg !21
  %"3" = icmp sgt i32 5, 20, !dbg !27
  %or.cond2 = or i1 %or.cond1, %"3", !dbg !21
  %"4" = icmp sgt i32 20, 65534, !dbg !29
  %or.cond3 = or i1 %or.cond2, %"4", !dbg !21
  br i1 %or.cond3, label %main_bb4, label %main_bb1, !dbg !21

main_bb1:                                         ; preds = %main_bb0
  %"5" = srem i32 10, 20, !dbg !31
  call void @llvm.dbg.value(metadata !{i32 %"5"}, i64 0, metadata !32), !dbg !33
  call void @llvm.dbg.value(metadata !34, i64 0, metadata !35), !dbg !36
  call void @llvm.dbg.value(metadata !{i32 %"10"}, i64 0, metadata !32), !dbg !33
  %"6" = srem i32 10, 5, !dbg !37
  call void @llvm.dbg.value(metadata !{i32 %"9"}, i64 0, metadata !35), !dbg !36
  br label %main_bb2, !dbg !40

main_bb2:                                         ; preds = %main_bb3, %main_bb1
  %r.0 = phi i32 [ 0, %main_bb1 ], [ %r.0., %main_bb3 ]
  %i.0 = phi i32 [ %"5", %main_bb1 ], [ %"10", %main_bb3 ]
  %"7" = icmp slt i32 %i.0, 20, !dbg !41
  br i1 %"7", label %main_bb3, label %main_bb4, !dbg !41

main_bb3:                                         ; preds = %main_bb2
  %"8" = icmp ne i32 %r.0, 0, !dbg !43
  %"9" = add nsw i32 %"6", 1, !dbg !37
  %r.0. = select i1 %"8", i32 %r.0, i32 %"9", !dbg !43
  %"10" = add nsw i32 %i.0, %r.0., !dbg !44
  br label %main_bb2, !dbg !45

main_bb4:                                         ; preds = %main_bb2, %main_bb0
  ret void, !dbg !46
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

declare i32 @__kittel_nondef.0()

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9}
!llvm.ident = !{!10}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [//FILES_DIR/SourceCode_SemanticAugmentor.c] [DW_LANG_C99]
!1 = metadata !{metadata !"FILES_DIR/SourceCode_SemanticAugmentor.c", metadata !"/"}
!2 = metadata !{}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 5, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @main, null, null, metadata !2, i32 6} ; [ DW_TAG_subprogram ] [line 5] [def] [scope 6] [main]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{null}
!8 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!9 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!10 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!11 = metadata !{i32 10}
!12 = metadata !{i32 786688, metadata !4, metadata !"h", metadata !5, i32 7, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [h] [line 7]
!13 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!14 = metadata !{i32 7, i32 7, metadata !4, null}
!15 = metadata !{i32 20}
!16 = metadata !{i32 786688, metadata !4, metadata !"hash", metadata !5, i32 8, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [hash] [line 8]
!17 = metadata !{i32 8, i32 7, metadata !4, null} ; [ DW_TAG_imported_declaration ]
!18 = metadata !{i32 5}
!19 = metadata !{i32 786688, metadata !4, metadata !"rehash", metadata !5, i32 9, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rehash] [line 9]
!20 = metadata !{i32 9, i32 7, metadata !4, null}
!21 = metadata !{i32 11, i32 7, metadata !22, null}
!22 = metadata !{i32 786443, metadata !1, metadata !4, i32 11, i32 7, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!23 = metadata !{i32 14, i32 9, metadata !24, null}
!24 = metadata !{i32 786443, metadata !1, metadata !22, i32 14, i32 9, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!25 = metadata !{i32 17, i32 11, metadata !26, null}
!26 = metadata !{i32 786443, metadata !1, metadata !24, i32 17, i32 11, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!27 = metadata !{i32 20, i32 13, metadata !28, null}
!28 = metadata !{i32 786443, metadata !1, metadata !26, i32 20, i32 13, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!29 = metadata !{i32 23, i32 15, metadata !30, null}
!30 = metadata !{i32 786443, metadata !1, metadata !28, i32 23, i32 15, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!31 = metadata !{i32 26, i32 3, metadata !4, null}
!32 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 26, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 26]
!33 = metadata !{i32 26, i32 7, metadata !4, null}
!34 = metadata !{i32 0}
!35 = metadata !{i32 786688, metadata !4, metadata !"r", metadata !5, i32 27, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 27]
!36 = metadata !{i32 27, i32 7, metadata !4, null}
!37 = metadata !{i32 31, i32 7, metadata !38, null}
!38 = metadata !{i32 786443, metadata !1, metadata !39, i32 30, i32 9, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!39 = metadata !{i32 786443, metadata !1, metadata !4, i32 29, i32 20, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!40 = metadata !{i32 29, i32 3, metadata !4, null}
!41 = metadata !{i32 29, i32 3, metadata !42, null}
!42 = metadata !{i32 786443, metadata !1, metadata !4, i32 29, i32 3, i32 1, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!43 = metadata !{i32 30, i32 9, metadata !38, null}
!44 = metadata !{i32 32, i32 5, metadata !39, null}
!45 = metadata !{i32 33, i32 3, metadata !39, null}
!46 = metadata !{i32 36, i32 3, metadata !4, null}

