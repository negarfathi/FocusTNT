; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @gettablesize() #0 {
gettablesize_bb0:
  call void @llvm.dbg.value(metadata !13, i64 0, metadata !14), !dbg !15
  %"0" = srem i32 50000, 99999, !dbg !16
  call void @llvm.dbg.value(metadata !{i32 %"0"}, i64 0, metadata !14), !dbg !15
  %"1" = icmp slt i32 %"0", 0, !dbg !17
  %"2" = sub nsw i32 0, %"0", !dbg !19
  %.0 = select i1 %"1", i32 %"2", i32 %"0", !dbg !17
  ret i32 %.0, !dbg !20
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
main_bb1:
  call void @llvm.dbg.value(metadata !13, i64 0, metadata !21), !dbg !23
  call void @llvm.dbg.value(metadata !13, i64 0, metadata !21), !dbg !23
  %"3" = sext i32 50000 to i64, !dbg !22
  call void @llvm.dbg.value(metadata !{i64 %"3"}, i64 0, metadata !24), !dbg !26
  call void @llvm.dbg.value(metadata !27, i64 0, metadata !28), !dbg !30
  call void @llvm.dbg.value(metadata !{i16 %"6"}, i64 0, metadata !28), !dbg !30
  br label %main_bb2, !dbg !31

main_bb2:                                         ; preds = %main_bb3, %main_bb1
  %i.0 = phi i16 [ 0, %main_bb1 ], [ %"6", %main_bb3 ]
  %"4" = zext i16 %i.0 to i64, !dbg !33
  %"5" = icmp ult i64 %"4", %"3", !dbg !33
  br i1 %"5", label %main_bb3, label %main_bb4, !dbg !33

main_bb3:                                         ; preds = %main_bb2
  %"6" = add i16 %i.0, 1, !dbg !36
  br label %main_bb2, !dbg !36

main_bb4:                                         ; preds = %main_bb2
  ret i32 0, !dbg !37
}

declare i32 @__kittel_nondef.0()

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

declare i16 @__kittel_nondef.1()

declare i64 @__kittel_nondef.2()

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11}
!llvm.ident = !{!12}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [//FILES_DIR/SourceCode_SemanticAugmentor.c] [DW_LANG_C99]
!1 = metadata !{metadata !"FILES_DIR/SourceCode_SemanticAugmentor.c", metadata !"/"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"gettablesize", metadata !"gettablesize", metadata !"", i32 10, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @gettablesize, null, null, metadata !2, i32 11} ; [ DW_TAG_subprogram ] [line 10] [def] [scope 11] [gettablesize]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 19, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 20} ; [ DW_TAG_subprogram ] [line 19] [def] [scope 20] [main]
!10 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!11 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!12 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!13 = metadata !{i32 50000}
!14 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 12, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 12]
!15 = metadata !{i32 12, i32 9, metadata !4, null}
!16 = metadata !{i32 13, i32 5, metadata !4, null}
!17 = metadata !{i32 14, i32 9, metadata !18, null}
!18 = metadata !{i32 786443, metadata !1, metadata !4, i32 14, i32 9, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!19 = metadata !{i32 15, i32 9, metadata !18, null}
!20 = metadata !{i32 18, i32 1, metadata !4, null}
!21 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 12, metadata !8, i32 0, metadata !22} ; [ DW_TAG_auto_variable ] [i] [line 12]
!22 = metadata !{i32 22, i32 29, metadata !9, null}
!23 = metadata !{i32 12, i32 9, metadata !4, metadata !22}
!24 = metadata !{i32 786688, metadata !9, metadata !"max_fds", metadata !5, i32 22, metadata !25, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [max_fds] [line 22]
!25 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!26 = metadata !{i32 22, i32 19, metadata !9, null}
!27 = metadata !{i16 0}
!28 = metadata !{i32 786688, metadata !9, metadata !"i", metadata !5, i32 21, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 21]
!29 = metadata !{i32 786468, null, null, metadata !"unsigned short", i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned short] [line 0, size 16, align 16, offset 0, enc DW_ATE_unsigned]
!30 = metadata !{i32 21, i32 20, metadata !9, null}
!31 = metadata !{i32 23, i32 10, metadata !32, null}
!32 = metadata !{i32 786443, metadata !1, metadata !9, i32 23, i32 5, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!33 = metadata !{i32 23, i32 10, metadata !34, null}
!34 = metadata !{i32 786443, metadata !1, metadata !35, i32 23, i32 10, i32 2, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!35 = metadata !{i32 786443, metadata !1, metadata !32, i32 23, i32 10, i32 1, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!36 = metadata !{i32 23, i32 32, metadata !32, null}
!37 = metadata !{i32 28, i32 5, metadata !9, null}

