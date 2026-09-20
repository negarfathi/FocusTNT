; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb0:
  %old_ = alloca [10 x i32], align 16
  %new_ = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata !{[10 x i32]* %old_}, metadata !11), !dbg !16
  call void @llvm.dbg.declare(metadata !{[10 x i32]* %new_}, metadata !17), !dbg !18
  call void @llvm.dbg.value(metadata !19, i64 0, metadata !20), !dbg !22
  call void @llvm.dbg.value(metadata !{i32 %"7"}, i64 0, metadata !20), !dbg !22
  br label %main_bb1, !dbg !23

main_bb1:                                         ; preds = %main_bb2, %main_bb0
  %j.0 = phi i32 [ 0, %main_bb0 ], [ %"7", %main_bb2 ]
  %"0" = icmp slt i32 %j.0, 9, !dbg !24
  br i1 %"0", label %main_bb2, label %main_bb3, !dbg !24

main_bb2:                                         ; preds = %main_bb1
  %"1" = call i32 @__VERIFIER_nondet_int(), !dbg !26
  %"2" = sext i32 %j.0 to i64, !dbg !26
  %"3" = getelementptr inbounds [10 x i32]* %old_, i32 0, i64 %"2", !dbg !26
  store i32 %"1", i32* %"3", align 4, !dbg !26
  %"4" = call i32 @__VERIFIER_nondet_int(), !dbg !28
  %"5" = sext i32 %j.0 to i64, !dbg !28
  %"6" = getelementptr inbounds [10 x i32]* %new_, i32 0, i64 %"5", !dbg !28
  store i32 %"4", i32* %"6", align 4, !dbg !28
  %"7" = add nsw i32 %j.0, 1, !dbg !29
  br label %main_bb1, !dbg !30

main_bb3:                                         ; preds = %main_bb1
  ret void, !dbg !31
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

declare i32 @__VERIFIER_nondet_int() #2

declare i32 @__kittel_nondef.0()

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
!11 = metadata !{i32 786688, metadata !4, metadata !"old_", metadata !5, i32 7, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [old_] [line 7]
!12 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 320, i64 32, i32 0, i32 0, metadata !13, metadata !14, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 320, align 32, offset 0] [from int]
!13 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!14 = metadata !{metadata !15}
!15 = metadata !{i32 786465, i64 0, i64 10}       ; [ DW_TAG_subrange_type ] [0, 9]
!16 = metadata !{i32 7, i32 7, metadata !4, null}
!17 = metadata !{i32 786688, metadata !4, metadata !"new_", metadata !5, i32 8, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [new_] [line 8]
!18 = metadata !{i32 8, i32 7, metadata !4, null} ; [ DW_TAG_imported_declaration ]
!19 = metadata !{i32 0}
!20 = metadata !{i32 786688, metadata !21, metadata !"j", metadata !5, i32 10, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 10]
!21 = metadata !{i32 786443, metadata !1, metadata !4, i32 9, i32 3, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!22 = metadata !{i32 10, i32 9, metadata !21, null}
!23 = metadata !{i32 11, i32 5, metadata !21, null}
!24 = metadata !{i32 11, i32 5, metadata !25, null}
!25 = metadata !{i32 786443, metadata !1, metadata !21, i32 11, i32 5, i32 1, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!26 = metadata !{i32 12, i32 17, metadata !27, null}
!27 = metadata !{i32 786443, metadata !1, metadata !21, i32 11, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!28 = metadata !{i32 13, i32 17, metadata !27, null}
!29 = metadata !{i32 14, i32 7, metadata !27, null}
!30 = metadata !{i32 15, i32 5, metadata !27, null}
!31 = metadata !{i32 17, i32 3, metadata !4, null}

