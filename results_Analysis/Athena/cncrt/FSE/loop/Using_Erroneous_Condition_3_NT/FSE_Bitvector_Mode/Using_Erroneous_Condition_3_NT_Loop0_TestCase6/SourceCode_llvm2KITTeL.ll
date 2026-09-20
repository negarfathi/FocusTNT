; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
main_bb0:
  %old_ = alloca [10 x i32], align 16
  %new_ = alloca [10 x i32], align 16
  call void @llvm.dbg.value(metadata !12, i64 0, metadata !13), !dbg !14
  call void @llvm.dbg.value(metadata !12, i64 0, metadata !15), !dbg !16
  call void @llvm.dbg.value(metadata !17, i64 0, metadata !18), !dbg !19
  call void @llvm.dbg.declare(metadata !{[10 x i32]* %old_}, metadata !20), !dbg !24
  %"0" = bitcast [10 x i32]* %old_ to i8*, !dbg !25
  call void @llvm.memset.p0i8.i64(i8* %"0", i8 0, i64 40, i32 16, i1 false), !dbg !25
  %"1" = bitcast i8* %"0" to [10 x i32]*, !dbg !25
  %"2" = getelementptr [10 x i32]* %"1", i32 0, i32 0, !dbg !25
  store i32 1, i32* %"2", !dbg !25
  call void @llvm.dbg.declare(metadata !{[10 x i32]* %new_}, metadata !26), !dbg !27
  %"3" = bitcast [10 x i32]* %new_ to i8*, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* %"3", i8 0, i64 40, i32 16, i1 false), !dbg !28
  %"4" = bitcast i8* %"3" to [10 x i32]*, !dbg !28
  %"5" = getelementptr [10 x i32]* %"4", i32 0, i32 0, !dbg !28
  store i32 2, i32* %"5", !dbg !28
  call void @llvm.dbg.value(metadata !12, i64 0, metadata !29), !dbg !31
  call void @llvm.dbg.value(metadata !{i32 %"7"}, i64 0, metadata !29), !dbg !31
  br label %main_bb1, !dbg !32

main_bb1:                                         ; preds = %main_bb2, %main_bb0
  %j.0 = phi i32 [ 0, %main_bb0 ], [ %"7", %main_bb2 ]
  %"6" = icmp slt i32 %j.0, 9, !dbg !33
  br i1 %"6", label %main_bb2, label %main_bb3, !dbg !33

main_bb2:                                         ; preds = %main_bb1
  %"7" = add nsw i32 %j.0, 1, !dbg !36
  br label %main_bb1, !dbg !36

main_bb3:                                         ; preds = %main_bb1
  %"8" = getelementptr inbounds [10 x i32]* %old_, i32 0, i64 9, !dbg !37
  store i32 0, i32* %"8", align 4, !dbg !37
  %"9" = getelementptr inbounds [10 x i32]* %new_, i32 0, i64 9, !dbg !38
  store i32 0, i32* %"9", align 4, !dbg !38
  call void @llvm.dbg.value(metadata !{i32 %base.0}, i64 0, metadata !39), !dbg !41
  call void @llvm.dbg.value(metadata !{i32 %"17"}, i64 0, metadata !39), !dbg !41
  br label %main_bb4, !dbg !42

main_bb4:                                         ; preds = %main_bb8, %main_bb3
  %base.0 = phi i32 [ 0, %main_bb3 ], [ %"20", %main_bb8 ]
  %i.0 = phi i32 [ 0, %main_bb3 ], [ %"19", %main_bb8 ]
  %"10" = sext i32 %i.0 to i64, !dbg !43
  %"11" = getelementptr inbounds [10 x i32]* %old_, i32 0, i64 %"10", !dbg !43
  %"12" = load i32* %"11", align 4, !dbg !43
  %"13" = sext i32 %i.0 to i64, !dbg !43
  %"14" = getelementptr inbounds [10 x i32]* %new_, i32 0, i64 %"13", !dbg !43
  %"15" = load i32* %"14", align 4, !dbg !43
  br label %main_bb5, !dbg !45

main_bb5:                                         ; preds = %main_bb6, %main_bb4
  %number.0 = phi i32 [ %base.0, %main_bb4 ], [ %"17", %main_bb6 ]
  %"16" = icmp ne i32 %"12", %"15", !dbg !43
  br i1 %"16", label %main_bb6, label %main_bb8, !dbg !43

main_bb6:                                         ; preds = %main_bb5
  %"17" = add nsw i32 %number.0, 1, !dbg !46
  %"18" = icmp eq i32 %"17", 100, !dbg !46
  br i1 %"18", label %main_bb7, label %main_bb5, !dbg !46

main_bb7:                                         ; preds = %main_bb6
  ret i32 0, !dbg !49

main_bb8:                                         ; preds = %main_bb5
  %"19" = add nsw i32 %i.0, 1, !dbg !50
  call void @llvm.dbg.value(metadata !{i32 %"19"}, i64 0, metadata !13), !dbg !14
  %"20" = add nsw i32 %base.0, 8, !dbg !51
  call void @llvm.dbg.value(metadata !{i32 %"20"}, i64 0, metadata !15), !dbg !16
  br label %main_bb4, !dbg !52
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #2

declare i32 @__kittel_nondef.0()

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10}
!llvm.ident = !{!11}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [//FILES_DIR/SourceCode_SemanticAugmentor.c] [DW_LANG_C99]
!1 = metadata !{metadata !"FILES_DIR/SourceCode_SemanticAugmentor.c", metadata !"/"}
!2 = metadata !{}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 9, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 10} ; [ DW_TAG_subprogram ] [line 9] [def] [scope 10] [main]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!10 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!11 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!12 = metadata !{i32 0}
!13 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 11, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 11]
!14 = metadata !{i32 11, i32 9, metadata !4, null}
!15 = metadata !{i32 786688, metadata !4, metadata !"base", metadata !5, i32 12, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [base] [line 12]
!16 = metadata !{i32 12, i32 9, metadata !4, null}
!17 = metadata !{i32 100}
!18 = metadata !{i32 786688, metadata !4, metadata !"count", metadata !5, i32 13, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 13]
!19 = metadata !{i32 13, i32 9, metadata !4, null}
!20 = metadata !{i32 786688, metadata !4, metadata !"old_", metadata !5, i32 14, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [old_] [line 14]
!21 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 320, i64 32, i32 0, i32 0, metadata !8, metadata !22, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 320, align 32, offset 0] [from int]
!22 = metadata !{metadata !23}
!23 = metadata !{i32 786465, i64 0, i64 10}       ; [ DW_TAG_subrange_type ] [0, 9]
!24 = metadata !{i32 14, i32 9, metadata !4, null}
!25 = metadata !{i32 14, i32 5, metadata !4, null}
!26 = metadata !{i32 786688, metadata !4, metadata !"new_", metadata !5, i32 15, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [new_] [line 15]
!27 = metadata !{i32 15, i32 9, metadata !4, null}
!28 = metadata !{i32 15, i32 5, metadata !4, null}
!29 = metadata !{i32 786688, metadata !30, metadata !"j", metadata !5, i32 16, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 16]
!30 = metadata !{i32 786443, metadata !1, metadata !4, i32 16, i32 5, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!31 = metadata !{i32 16, i32 14, metadata !30, null}
!32 = metadata !{i32 16, i32 10, metadata !30, null}
!33 = metadata !{i32 16, i32 10, metadata !34, null}
!34 = metadata !{i32 786443, metadata !1, metadata !35, i32 16, i32 10, i32 2, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!35 = metadata !{i32 786443, metadata !1, metadata !30, i32 16, i32 10, i32 1, i32 5} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!36 = metadata !{i32 16, i32 30, metadata !30, null}
!37 = metadata !{i32 21, i32 5, metadata !4, null}
!38 = metadata !{i32 22, i32 5, metadata !4, null}
!39 = metadata !{i32 786688, metadata !40, metadata !"number", metadata !5, i32 25, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [number] [line 25]
!40 = metadata !{i32 786443, metadata !1, metadata !4, i32 24, i32 5, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!41 = metadata !{i32 25, i32 13, metadata !40, null}
!42 = metadata !{i32 23, i32 5, metadata !4, null}
!43 = metadata !{i32 26, i32 9, metadata !44, null}
!44 = metadata !{i32 786443, metadata !1, metadata !40, i32 26, i32 9, i32 1, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!45 = metadata !{i32 26, i32 9, metadata !40, null}
!46 = metadata !{i32 28, i32 17, metadata !47, null}
!47 = metadata !{i32 786443, metadata !1, metadata !48, i32 28, i32 17, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!48 = metadata !{i32 786443, metadata !1, metadata !40, i32 27, i32 9, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!49 = metadata !{i32 35, i32 5, metadata !4, null}
!50 = metadata !{i32 31, i32 9, metadata !40, null}
!51 = metadata !{i32 32, i32 9, metadata !40, null}
!52 = metadata !{i32 33, i32 5, metadata !40, null}

