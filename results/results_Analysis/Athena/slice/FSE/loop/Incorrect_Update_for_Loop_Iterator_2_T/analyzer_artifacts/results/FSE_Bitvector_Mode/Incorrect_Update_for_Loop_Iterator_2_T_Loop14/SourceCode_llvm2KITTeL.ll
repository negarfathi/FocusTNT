; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb0:
  %"0" = call zeroext i8 @__VERIFIER_nondet_uchar(), !dbg !11
  call void @llvm.dbg.value(metadata !{i8 %"0"}, i64 0, metadata !12), !dbg !14
  call void @llvm.dbg.value(metadata !{i8 %l.0}, i64 0, metadata !15), !dbg !17
  call void @llvm.dbg.value(metadata !{i8 %"3"}, i64 0, metadata !12), !dbg !14
  call void @llvm.dbg.value(metadata !{i8 %"3"}, i64 0, metadata !18), !dbg !21
  call void @llvm.dbg.value(metadata !{i8 %"8"}, i64 0, metadata !12), !dbg !14
  br label %main_bb1, !dbg !22

main_bb1:                                         ; preds = %main_bb2, %main_bb3, %main_bb0
  %l.0 = phi i8 [ %"0", %main_bb0 ], [ %"8", %main_bb3 ], [ %"3", %main_bb2 ]
  %"1" = zext i8 %l.0 to i32, !dbg !23
  %"2" = sub nsw i32 %"1", 1, !dbg !23
  %"3" = trunc i32 %"2" to i8, !dbg !23
  %"4" = icmp ne i8 %l.0, 0, !dbg !24
  br i1 %"4", label %main_bb2, label %main_bb4, !dbg !24

main_bb2:                                         ; preds = %main_bb1
  %"5" = icmp ne i8 %"3", 0, !dbg !26
  br i1 %"5", label %main_bb3, label %main_bb1, !dbg !26

main_bb3:                                         ; preds = %main_bb2
  %"6" = zext i8 %"3" to i32, !dbg !27
  %"7" = sub nsw i32 %"6", 1, !dbg !27
  %"8" = trunc i32 %"7" to i8, !dbg !27
  br label %main_bb1, !dbg !28

main_bb4:                                         ; preds = %main_bb1
  ret void, !dbg !29
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

declare zeroext i8 @__VERIFIER_nondet_uchar() #2

declare i8 @__kittel_nondef.0()

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

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
!11 = metadata !{i32 7, i32 21, metadata !4, null}
!12 = metadata !{i32 786688, metadata !4, metadata !"l", metadata !5, i32 7, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [l] [line 7]
!13 = metadata !{i32 786468, null, null, metadata !"unsigned char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!14 = metadata !{i32 7, i32 17, metadata !4, null}
!15 = metadata !{i32 786688, metadata !16, metadata !"tmp_1", metadata !5, i32 9, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmp_1] [line 9]
!16 = metadata !{i32 786443, metadata !1, metadata !4, i32 8, i32 13, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!17 = metadata !{i32 9, i32 19, metadata !16, null}
!18 = metadata !{i32 786688, metadata !19, metadata !"tmp_0", metadata !5, i32 14, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmp_0] [line 14]
!19 = metadata !{i32 786443, metadata !1, metadata !20, i32 13, i32 12, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!20 = metadata !{i32 786443, metadata !1, metadata !16, i32 13, i32 9, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!21 = metadata !{i32 14, i32 21, metadata !19, null}
!22 = metadata !{i32 8, i32 3, metadata !4, null} ; [ DW_TAG_imported_declaration ]
!23 = metadata !{i32 11, i32 5, metadata !16, null}
!24 = metadata !{i32 12, i32 9, metadata !25, null}
!25 = metadata !{i32 786443, metadata !1, metadata !16, i32 12, i32 9, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!26 = metadata !{i32 13, i32 9, metadata !20, null}
!27 = metadata !{i32 16, i32 7, metadata !19, null}
!28 = metadata !{i32 17, i32 5, metadata !19, null}
!29 = metadata !{i32 19, i32 3, metadata !4, null}

