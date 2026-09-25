; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @ffs_slice_1(i32 %w) #0 {
ffs_slice_1_bb0:
  call void @llvm.dbg.value(metadata !{i32 %w}, i64 0, metadata !15), !dbg !16
  call void @llvm.dbg.value(metadata !17, i64 0, metadata !18), !dbg !19
  call void @llvm.dbg.value(metadata !{i32 %"2"}, i64 0, metadata !18), !dbg !19
  call void @llvm.dbg.value(metadata !{i32 %"3"}, i64 0, metadata !15), !dbg !16
  br label %ffs_slice_1_bb1, !dbg !20

ffs_slice_1_bb1:                                  ; preds = %ffs_slice_1_bb2, %ffs_slice_1_bb0
  %i.0 = phi i32 [ 1, %ffs_slice_1_bb0 ], [ %"2", %ffs_slice_1_bb2 ]
  %.0 = phi i32 [ %w, %ffs_slice_1_bb0 ], [ %"3", %ffs_slice_1_bb2 ]
  %"0" = urem i32 %.0, 2, !dbg !21
  %"1" = icmp eq i32 %"0", 0, !dbg !21
  br i1 %"1", label %ffs_slice_1_bb2, label %ffs_slice_1_bb3, !dbg !21

ffs_slice_1_bb2:                                  ; preds = %ffs_slice_1_bb1
  %"2" = add i32 %i.0, 1, !dbg !23
  %"3" = udiv i32 %.0, 2, !dbg !25
  br label %ffs_slice_1_bb1, !dbg !26

ffs_slice_1_bb3:                                  ; preds = %ffs_slice_1_bb1
  ret i32 %i.0, !dbg !27
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb4:
  call void @llvm.dbg.value(metadata !28, i64 0, metadata !29), !dbg !30
  call void @llvm.dbg.value(metadata !{i32 %w.0}, i64 0, metadata !31), !dbg !34
  call void @llvm.dbg.value(metadata !17, i64 0, metadata !35), !dbg !36
  br label %main_bb5, !dbg !37

main_bb5:                                         ; preds = %main_ffs_slice_1.exit, %main_bb4
  %w.0 = phi i32 [ -2147483648, %main_bb4 ], [ %w.1, %main_ffs_slice_1.exit ]
  %"4" = icmp ne i32 %w.0, 0, !dbg !38
  br i1 %"4", label %main_bb6, label %main_bb8, !dbg !38

main_bb6:                                         ; preds = %main_bb5, %main_bb7
  %i.0.i = phi i32 [ %"7", %main_bb7 ], [ 1, %main_bb5 ], !dbg !32
  %.0.i = phi i32 [ %"8", %main_bb7 ], [ %w.0, %main_bb5 ], !dbg !32
  %"5" = urem i32 %.0.i, 2, !dbg !40
  %"6" = icmp eq i32 %"5", 0, !dbg !40
  br i1 %"6", label %main_bb7, label %main_ffs_slice_1.exit, !dbg !40

main_bb7:                                         ; preds = %main_bb6
  %"7" = add i32 %i.0.i, 1, !dbg !41
  %"8" = udiv i32 %.0.i, 2, !dbg !42
  br label %main_bb6, !dbg !43

main_ffs_slice_1.exit:                            ; preds = %main_bb6
  call void @llvm.dbg.value(metadata !{i32 %i.0.i}, i64 0, metadata !44), !dbg !45
  %"9" = icmp ult i32 %i.0.i, 32, !dbg !46
  %"10" = lshr i32 %w.0, %i.0.i, !dbg !48
  call void @llvm.dbg.value(metadata !{i32 %"10"}, i64 0, metadata !29), !dbg !30
  %w.1 = select i1 %"9", i32 %"10", i32 0, !dbg !46
  br label %main_bb5, !dbg !46

main_bb8:                                         ; preds = %main_bb5
  ret void, !dbg !50
}

declare i32 @__kittel_nondef.0()

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13}
!llvm.ident = !{!14}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [//FILES_DIR/SourceCode_SemanticAugmentor.c] [DW_LANG_C99]
!1 = metadata !{metadata !"FILES_DIR/SourceCode_SemanticAugmentor.c", metadata !"/"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"ffs_slice_1", metadata !"ffs_slice_1", metadata !"", i32 5, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @ffs_slice_1, null, null, metadata !2, i32 6} ; [ DW_TAG_subprogram ] [line 5] [def] [scope 6] [ffs_slice_1]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 15, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @main, null, null, metadata !2, i32 16} ; [ DW_TAG_subprogram ] [line 15] [def] [scope 16] [main]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{null}
!12 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!13 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!14 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!15 = metadata !{i32 786689, metadata !4, metadata !"w", metadata !5, i32 16777221, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [w] [line 5]
!16 = metadata !{i32 5, i32 39, metadata !4, null}
!17 = metadata !{i32 1}
!18 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 7, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 7]
!19 = metadata !{i32 7, i32 16, metadata !4, null}
!20 = metadata !{i32 8, i32 3, metadata !4, null} ; [ DW_TAG_imported_declaration ]
!21 = metadata !{i32 8, i32 3, metadata !22, null} ; [ DW_TAG_imported_declaration ]
!22 = metadata !{i32 786443, metadata !1, metadata !4, i32 8, i32 3, i32 1, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!23 = metadata !{i32 9, i32 5, metadata !24, null}
!24 = metadata !{i32 786443, metadata !1, metadata !4, i32 8, i32 50, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!25 = metadata !{i32 10, i32 5, metadata !24, null}
!26 = metadata !{i32 11, i32 3, metadata !24, null}
!27 = metadata !{i32 12, i32 3, metadata !4, null}
!28 = metadata !{i32 -2147483648}
!29 = metadata !{i32 786688, metadata !9, metadata !"w", metadata !5, i32 17, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [w] [line 17]
!30 = metadata !{i32 17, i32 16, metadata !9, null}
!31 = metadata !{i32 786689, metadata !4, metadata !"w", metadata !5, i32 16777221, metadata !8, i32 0, metadata !32} ; [ DW_TAG_arg_variable ] [w] [line 5]
!32 = metadata !{i32 19, i32 22, metadata !33, null}
!33 = metadata !{i32 786443, metadata !1, metadata !9, i32 18, i32 32, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!34 = metadata !{i32 5, i32 39, metadata !4, metadata !32}
!35 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 7, metadata !8, i32 0, metadata !32} ; [ DW_TAG_auto_variable ] [i] [line 7]
!36 = metadata !{i32 7, i32 16, metadata !4, metadata !32}
!37 = metadata !{i32 18, i32 3, metadata !9, null}
!38 = metadata !{i32 18, i32 3, metadata !39, null}
!39 = metadata !{i32 786443, metadata !1, metadata !9, i32 18, i32 3, i32 1, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!40 = metadata !{i32 8, i32 3, metadata !22, metadata !32} ; [ DW_TAG_imported_declaration ]
!41 = metadata !{i32 9, i32 5, metadata !24, metadata !32}
!42 = metadata !{i32 10, i32 5, metadata !24, metadata !32}
!43 = metadata !{i32 11, i32 3, metadata !24, metadata !32}
!44 = metadata !{i32 786688, metadata !33, metadata !"n", metadata !5, i32 19, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 19]
!45 = metadata !{i32 19, i32 18, metadata !33, null}
!46 = metadata !{i32 20, i32 9, metadata !47, null}
!47 = metadata !{i32 786443, metadata !1, metadata !33, i32 20, i32 9, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!48 = metadata !{i32 20, i32 31, metadata !49, null}
!49 = metadata !{i32 786443, metadata !1, metadata !47, i32 20, i32 31, i32 1, i32 5} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!50 = metadata !{i32 22, i32 3, metadata !9, null}

