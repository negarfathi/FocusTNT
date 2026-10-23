; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @gettablesize_slice_1() #0 {
gettablesize_slice_1_bb0:
  call void @llvm.dbg.value(metadata !15, i64 0, metadata !16), !dbg !17
  %"0" = srem i32 65535, 99999, !dbg !18
  call void @llvm.dbg.value(metadata !{i32 %"0"}, i64 0, metadata !16), !dbg !17
  %"1" = icmp slt i32 %"0", 0, !dbg !19
  %"2" = sub nsw i32 0, %"0", !dbg !21
  call void @llvm.dbg.value(metadata !{i32 %"2"}, i64 0, metadata !23), !dbg !24
  %__retres.0 = select i1 %"1", i32 %"2", i32 %"0", !dbg !19
  ret i32 %__retres.0, !dbg !25
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb1:
  call void @llvm.dbg.value(metadata !15, i64 0, metadata !26), !dbg !28
  call void @llvm.dbg.value(metadata !15, i64 0, metadata !26), !dbg !28
  call void @llvm.dbg.value(metadata !29, i64 0, metadata !30), !dbg !31
  call void @llvm.dbg.value(metadata !15, i64 0, metadata !32), !dbg !33
  %"3" = sext i32 65535 to i64, !dbg !34
  call void @llvm.dbg.value(metadata !{i64 %"3"}, i64 0, metadata !35), !dbg !37
  call void @llvm.dbg.value(metadata !38, i64 0, metadata !39), !dbg !41
  call void @llvm.dbg.value(metadata !{i16 %"8"}, i64 0, metadata !39), !dbg !41
  br label %main_bb2, !dbg !42

main_bb2:                                         ; preds = %main_bb3, %main_bb1
  %i.0 = phi i16 [ 0, %main_bb1 ], [ %"8", %main_bb3 ]
  %"4" = zext i16 %i.0 to i64, !dbg !43
  %"5" = icmp ult i64 %"4", %"3", !dbg !43
  br i1 %"5", label %main_bb3, label %main_bb4, !dbg !43

main_bb3:                                         ; preds = %main_bb2
  %"6" = zext i16 %i.0 to i32, !dbg !46
  %"7" = add nsw i32 %"6", 1, !dbg !46
  %"8" = trunc i32 %"7" to i16, !dbg !46
  br label %main_bb2, !dbg !46

main_bb4:                                         ; preds = %main_bb2
  ret void, !dbg !48
}

declare i32 @__kittel_nondef.0()

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

declare i16 @__kittel_nondef.1()

declare i64 @__kittel_nondef.2()

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13}
!llvm.ident = !{!14}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [//FILES_DIR/SourceCode_SemanticAugmentor.c] [DW_LANG_C99]
!1 = metadata !{metadata !"FILES_DIR/SourceCode_SemanticAugmentor.c", metadata !"/"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"gettablesize_slice_1", metadata !"gettablesize_slice_1", metadata !"", i32 5, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @gettablesize_slice_1, null, null, metadata !2, i32 6} ; [ DW_TAG_subprogram ] [line 5] [def] [scope 6] [gettablesize_slice_1]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 14, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @main, null, null, metadata !2, i32 15} ; [ DW_TAG_subprogram ] [line 14] [def] [scope 15] [main]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{null}
!12 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!13 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!14 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!15 = metadata !{i32 65535}
!16 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 8, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 8]
!17 = metadata !{i32 8, i32 7, metadata !4, null} ; [ DW_TAG_imported_declaration ]
!18 = metadata !{i32 9, i32 3, metadata !4, null}
!19 = metadata !{i32 10, i32 7, metadata !20, null}
!20 = metadata !{i32 786443, metadata !1, metadata !4, i32 10, i32 7, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!21 = metadata !{i32 10, i32 14, metadata !22, null}
!22 = metadata !{i32 786443, metadata !1, metadata !20, i32 10, i32 14, i32 1, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!23 = metadata !{i32 786688, metadata !4, metadata !"__retres", metadata !5, i32 7, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__retres] [line 7]
!24 = metadata !{i32 7, i32 7, metadata !4, null}
!25 = metadata !{i32 11, i32 3, metadata !4, null}
!26 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 8, metadata !8, i32 0, metadata !27} ; [ DW_TAG_auto_variable ] [i] [line 8]
!27 = metadata !{i32 18, i32 9, metadata !9, null}
!28 = metadata !{i32 8, i32 7, metadata !4, metadata !27} ; [ DW_TAG_imported_declaration ]
!29 = metadata !{i32 -65535}
!30 = metadata !{i32 786688, metadata !4, metadata !"__retres", metadata !5, i32 7, metadata !8, i32 0, metadata !27} ; [ DW_TAG_auto_variable ] [__retres] [line 7]
!31 = metadata !{i32 7, i32 7, metadata !4, metadata !27}
!32 = metadata !{i32 786688, metadata !9, metadata !"tmp", metadata !5, i32 17, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmp] [line 17]
!33 = metadata !{i32 17, i32 7, metadata !9, null}
!34 = metadata !{i32 19, i32 3, metadata !9, null}
!35 = metadata !{i32 786688, metadata !9, metadata !"max_fds", metadata !5, i32 19, metadata !36, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [max_fds] [line 19]
!36 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!37 = metadata !{i32 19, i32 17, metadata !9, null}
!38 = metadata !{i16 0}
!39 = metadata !{i32 786688, metadata !9, metadata !"i", metadata !5, i32 16, metadata !40, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 16]
!40 = metadata !{i32 786468, null, null, metadata !"unsigned short", i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned short] [line 0, size 16, align 16, offset 0, enc DW_ATE_unsigned]
!41 = metadata !{i32 16, i32 18, metadata !9, null}
!42 = metadata !{i32 21, i32 3, metadata !9, null}
!43 = metadata !{i32 21, i32 3, metadata !44, null}
!44 = metadata !{i32 786443, metadata !1, metadata !45, i32 21, i32 3, i32 3, i32 5} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!45 = metadata !{i32 786443, metadata !1, metadata !9, i32 21, i32 3, i32 1, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!46 = metadata !{i32 21, i32 38, metadata !47, null}
!47 = metadata !{i32 786443, metadata !1, metadata !9, i32 21, i32 38, i32 2, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!48 = metadata !{i32 22, i32 3, metadata !9, null}

