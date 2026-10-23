; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@"'flag" = global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @read_slice_1(i32 %loc, i32 %len) #0 {
read_slice_1_bb0:
  call void @llvm.dbg.value(metadata !{i32 %loc}, i64 0, metadata !17), !dbg !18
  call void @llvm.dbg.value(metadata !{i32 %len}, i64 0, metadata !19), !dbg !20
  call void @llvm.dbg.value(metadata !21, i64 0, metadata !22), !dbg !23
  %"0" = icmp slt i32 %loc, %len, !dbg !24
  %"1" = add nsw i32 0, 1, !dbg !26
  call void @llvm.dbg.value(metadata !{i32 %"1"}, i64 0, metadata !22), !dbg !23
  call void @llvm.dbg.value(metadata !{i32 %"1"}, i64 0, metadata !27), !dbg !28
  %__retres.0 = select i1 %"0", i32 %"1", i32 0, !dbg !24
  ret i32 %__retres.0, !dbg !29
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb1:
  call void @llvm.dbg.value(metadata !30, i64 0, metadata !31), !dbg !32
  call void @llvm.dbg.value(metadata !21, i64 0, metadata !33), !dbg !34
  call void @llvm.dbg.value(metadata !{i32 %buf.0}, i64 0, metadata !35), !dbg !38
  call void @llvm.dbg.value(metadata !{i32 %count.0}, i64 0, metadata !39), !dbg !40
  call void @llvm.dbg.value(metadata !21, i64 0, metadata !41), !dbg !42
  call void @llvm.dbg.value(metadata !43, i64 0, metadata !41), !dbg !42
  call void @llvm.dbg.value(metadata !43, i64 0, metadata !44), !dbg !45
  call void @llvm.dbg.value(metadata !{i32 %__retres.0.i}, i64 0, metadata !46), !dbg !47
  call void @llvm.dbg.value(metadata !{i32 %"4"}, i64 0, metadata !31), !dbg !32
  call void @llvm.dbg.value(metadata !{i32 %"5"}, i64 0, metadata !33), !dbg !34
  br label %main_bb2, !dbg !48

main_bb2:                                         ; preds = %main_bb3, %main_bb1
  %buf.0 = phi i32 [ 0, %main_bb1 ], [ %"5", %main_bb3 ]
  %count.0 = phi i32 [ 2, %main_bb1 ], [ %"4", %main_bb3 ]
  %"2" = icmp sgt i32 %count.0, 0, !dbg !49
  br i1 %"2", label %main_bb3, label %main_bb4, !dbg !49

main_bb3:                                         ; preds = %main_bb2
  %"3" = icmp slt i32 %buf.0, %count.0, !dbg !51
  %__retres.0.i = select i1 %"3", i32 1, i32 0, !dbg !51
  %"4" = sub nsw i32 %count.0, %__retres.0.i, !dbg !52
  %"5" = add nsw i32 %buf.0, %__retres.0.i, !dbg !53
  br label %main_bb2, !dbg !54

main_bb4:                                         ; preds = %main_bb2
  ret void, !dbg !55
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
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"read_slice_1", metadata !"read_slice_1", metadata !"", i32 3, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i32)* @read_slice_1, null, null, metadata !2, i32 4} ; [ DW_TAG_subprogram ] [line 3] [def] [scope 4] [read_slice_1]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 15, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @main, null, null, metadata !2, i32 16} ; [ DW_TAG_subprogram ] [line 15] [def] [scope 16] [main]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{null}
!12 = metadata !{metadata !13}
!13 = metadata !{i32 786484, i32 0, null, metadata !"flag", metadata !"flag", metadata !"", metadata !5, i32 2, metadata !8, i32 0, i32 1, i32* @"'flag", null} ; [ DW_TAG_variable ] [flag] [line 2] [def]
!14 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!15 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!16 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!17 = metadata !{i32 786689, metadata !4, metadata !"loc", metadata !5, i32 16777219, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [loc] [line 3]
!18 = metadata !{i32 3, i32 22, metadata !4, null}
!19 = metadata !{i32 786689, metadata !4, metadata !"len", metadata !5, i32 33554435, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 3]
!20 = metadata !{i32 3, i32 31, metadata !4, null}
!21 = metadata !{i32 0}
!22 = metadata !{i32 786688, metadata !4, metadata !"count", metadata !5, i32 6, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 6]
!23 = metadata !{i32 6, i32 7, metadata !4, null}
!24 = metadata !{i32 7, i32 7, metadata !25, null}
!25 = metadata !{i32 786443, metadata !1, metadata !4, i32 7, i32 7, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!26 = metadata !{i32 8, i32 3, metadata !4, null} ; [ DW_TAG_imported_declaration ]
!27 = metadata !{i32 786688, metadata !4, metadata !"__retres", metadata !5, i32 5, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__retres] [line 5]
!28 = metadata !{i32 5, i32 7, metadata !4, null}
!29 = metadata !{i32 12, i32 17, metadata !4, null}
!30 = metadata !{i32 2}
!31 = metadata !{i32 786688, metadata !9, metadata !"count", metadata !5, i32 18, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 18]
!32 = metadata !{i32 18, i32 7, metadata !9, null}
!33 = metadata !{i32 786688, metadata !9, metadata !"buf", metadata !5, i32 19, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [buf] [line 19]
!34 = metadata !{i32 19, i32 7, metadata !9, null}
!35 = metadata !{i32 786689, metadata !4, metadata !"loc", metadata !5, i32 16777219, metadata !8, i32 0, metadata !36} ; [ DW_TAG_arg_variable ] [loc] [line 3]
!36 = metadata !{i32 21, i32 11, metadata !37, null}
!37 = metadata !{i32 786443, metadata !1, metadata !9, i32 20, i32 21, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!38 = metadata !{i32 3, i32 22, metadata !4, metadata !36}
!39 = metadata !{i32 786689, metadata !4, metadata !"len", metadata !5, i32 33554435, metadata !8, i32 0, metadata !36} ; [ DW_TAG_arg_variable ] [len] [line 3]
!40 = metadata !{i32 3, i32 31, metadata !4, metadata !36}
!41 = metadata !{i32 786688, metadata !4, metadata !"count", metadata !5, i32 6, metadata !8, i32 0, metadata !36} ; [ DW_TAG_auto_variable ] [count] [line 6]
!42 = metadata !{i32 6, i32 7, metadata !4, metadata !36}
!43 = metadata !{i32 1}
!44 = metadata !{i32 786688, metadata !4, metadata !"__retres", metadata !5, i32 5, metadata !8, i32 0, metadata !36} ; [ DW_TAG_auto_variable ] [__retres] [line 5]
!45 = metadata !{i32 5, i32 7, metadata !4, metadata !36}
!46 = metadata !{i32 786688, metadata !9, metadata !"ret", metadata !5, i32 17, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ret] [line 17]
!47 = metadata !{i32 17, i32 7, metadata !9, null}
!48 = metadata !{i32 20, i32 3, metadata !9, null}
!49 = metadata !{i32 20, i32 3, metadata !50, null}
!50 = metadata !{i32 786443, metadata !1, metadata !9, i32 20, i32 3, i32 1, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!51 = metadata !{i32 7, i32 7, metadata !25, metadata !36}
!52 = metadata !{i32 22, i32 5, metadata !37, null}
!53 = metadata !{i32 23, i32 5, metadata !37, null}
!54 = metadata !{i32 24, i32 3, metadata !37, null}
!55 = metadata !{i32 25, i32 3, metadata !9, null}

