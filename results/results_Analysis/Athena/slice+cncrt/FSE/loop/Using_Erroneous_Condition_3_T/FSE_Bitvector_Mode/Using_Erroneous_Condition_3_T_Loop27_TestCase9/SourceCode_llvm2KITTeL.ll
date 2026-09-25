; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb0:
  %old_ = alloca [10 x i32], align 16
  %new_ = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata !{[10 x i32]* %old_}, metadata !11), !dbg !16
  %"0" = bitcast [10 x i32]* %old_ to i8*, !dbg !17
  call void @llvm.memset.p0i8.i64(i8* %"0", i8 0, i64 40, i32 16, i1 false), !dbg !17
  %"1" = bitcast i8* %"0" to [10 x i32]*, !dbg !17
  %"2" = getelementptr [10 x i32]* %"1", i32 0, i32 0, !dbg !17
  store i32 7, i32* %"2", !dbg !17
  call void @llvm.dbg.declare(metadata !{[10 x i32]* %new_}, metadata !18), !dbg !19
  %"3" = bitcast [10 x i32]* %new_ to i8*, !dbg !20
  call void @llvm.memset.p0i8.i64(i8* %"3", i8 0, i64 40, i32 16, i1 false), !dbg !20
  %"4" = bitcast i8* %"3" to [10 x i32]*, !dbg !20
  %"5" = getelementptr [10 x i32]* %"4", i32 0, i32 0, !dbg !20
  store i32 6, i32* %"5", !dbg !20
  call void @llvm.dbg.value(metadata !21, i64 0, metadata !22), !dbg !23
  call void @llvm.dbg.value(metadata !24, i64 0, metadata !25), !dbg !26
  call void @llvm.dbg.value(metadata !27, i64 0, metadata !28), !dbg !29
  call void @llvm.dbg.value(metadata !21, i64 0, metadata !30), !dbg !32
  call void @llvm.dbg.value(metadata !{i32 %"7"}, i64 0, metadata !30), !dbg !32
  br label %main_bb1, !dbg !33

main_bb1:                                         ; preds = %main_bb2, %main_bb0
  %j.0 = phi i32 [ 0, %main_bb0 ], [ %"7", %main_bb2 ]
  %"6" = icmp slt i32 %j.0, 9, !dbg !34
  br i1 %"6", label %main_bb2, label %main_bb3, !dbg !34

main_bb2:                                         ; preds = %main_bb1
  %"7" = add nsw i32 %j.0, 1, !dbg !36
  br label %main_bb1, !dbg !38

main_bb3:                                         ; preds = %main_bb1
  %"8" = getelementptr inbounds [10 x i32]* %old_, i32 0, i64 9, !dbg !39
  store i32 0, i32* %"8", align 4, !dbg !39
  %"9" = getelementptr inbounds [10 x i32]* %new_, i32 0, i64 9, !dbg !40
  store i32 0, i32* %"9", align 4, !dbg !40
  call void @llvm.dbg.value(metadata !{i32 %base.0}, i64 0, metadata !41), !dbg !43
  call void @llvm.dbg.value(metadata !{i32 %"18"}, i64 0, metadata !41), !dbg !43
  br label %main_bb4, !dbg !44

main_bb4:                                         ; preds = %main_bb8, %main_bb3
  %base.0 = phi i32 [ 5, %main_bb3 ], [ %"21", %main_bb8 ]
  %i.0 = phi i32 [ 0, %main_bb3 ], [ %"20", %main_bb8 ]
  %"10" = icmp slt i32 %base.0, 9, !dbg !45
  br i1 %"10", label %main_bb5, label %main_bb9, !dbg !45

main_bb5:                                         ; preds = %main_bb4
  %"11" = sext i32 %i.0 to i64, !dbg !47
  %"12" = getelementptr inbounds [10 x i32]* %old_, i32 0, i64 %"11", !dbg !47
  %"13" = load i32* %"12", align 4, !dbg !47
  %"14" = sext i32 %i.0 to i64, !dbg !47
  %"15" = getelementptr inbounds [10 x i32]* %new_, i32 0, i64 %"14", !dbg !47
  %"16" = load i32* %"15", align 4, !dbg !47
  br label %main_bb6, !dbg !49

main_bb6:                                         ; preds = %main_bb7, %main_bb5
  %number.0 = phi i32 [ %base.0, %main_bb5 ], [ %"18", %main_bb7 ]
  %"17" = icmp ne i32 %"13", %"16", !dbg !47
  br i1 %"17", label %main_bb7, label %main_bb8, !dbg !47

main_bb7:                                         ; preds = %main_bb6
  %"18" = add nsw i32 %number.0, 1, !dbg !50
  %"19" = icmp eq i32 %"18", 9, !dbg !52
  br i1 %"19", label %main_bb8, label %main_bb6, !dbg !52

main_bb8:                                         ; preds = %main_bb7, %main_bb6
  %"20" = add nsw i32 %i.0, 1, !dbg !54
  call void @llvm.dbg.value(metadata !{i32 %"20"}, i64 0, metadata !22), !dbg !23
  %"21" = add nsw i32 %base.0, 8, !dbg !55
  call void @llvm.dbg.value(metadata !{i32 %"21"}, i64 0, metadata !25), !dbg !26
  br label %main_bb4, !dbg !56

main_bb9:                                         ; preds = %main_bb4
  ret void, !dbg !57
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
!17 = metadata !{i32 7, i32 3, metadata !4, null}
!18 = metadata !{i32 786688, metadata !4, metadata !"new_", metadata !5, i32 8, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [new_] [line 8]
!19 = metadata !{i32 8, i32 7, metadata !4, null} ; [ DW_TAG_imported_declaration ]
!20 = metadata !{i32 8, i32 3, metadata !4, null} ; [ DW_TAG_imported_declaration ]
!21 = metadata !{i32 0}
!22 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 9, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 9]
!23 = metadata !{i32 9, i32 7, metadata !4, null}
!24 = metadata !{i32 5}
!25 = metadata !{i32 786688, metadata !4, metadata !"base", metadata !5, i32 10, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [base] [line 10]
!26 = metadata !{i32 10, i32 7, metadata !4, null}
!27 = metadata !{i32 9}
!28 = metadata !{i32 786688, metadata !4, metadata !"count", metadata !5, i32 11, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 11]
!29 = metadata !{i32 11, i32 7, metadata !4, null}
!30 = metadata !{i32 786688, metadata !31, metadata !"j", metadata !5, i32 13, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 13]
!31 = metadata !{i32 786443, metadata !1, metadata !4, i32 12, i32 3, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!32 = metadata !{i32 13, i32 9, metadata !31, null}
!33 = metadata !{i32 14, i32 5, metadata !31, null}
!34 = metadata !{i32 14, i32 5, metadata !35, null}
!35 = metadata !{i32 786443, metadata !1, metadata !31, i32 14, i32 5, i32 1, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!36 = metadata !{i32 17, i32 7, metadata !37, null}
!37 = metadata !{i32 786443, metadata !1, metadata !31, i32 14, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!38 = metadata !{i32 18, i32 5, metadata !37, null}
!39 = metadata !{i32 20, i32 3, metadata !4, null}
!40 = metadata !{i32 21, i32 3, metadata !4, null}
!41 = metadata !{i32 786688, metadata !42, metadata !"number", metadata !5, i32 23, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [number] [line 23]
!42 = metadata !{i32 786443, metadata !1, metadata !4, i32 22, i32 24, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!43 = metadata !{i32 23, i32 9, metadata !42, null}
!44 = metadata !{i32 22, i32 3, metadata !4, null}
!45 = metadata !{i32 22, i32 3, metadata !46, null}
!46 = metadata !{i32 786443, metadata !1, metadata !4, i32 22, i32 3, i32 1, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!47 = metadata !{i32 24, i32 5, metadata !48, null}
!48 = metadata !{i32 786443, metadata !1, metadata !42, i32 24, i32 5, i32 1, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!49 = metadata !{i32 24, i32 5, metadata !42, null}
!50 = metadata !{i32 25, i32 7, metadata !51, null}
!51 = metadata !{i32 786443, metadata !1, metadata !42, i32 24, i32 32, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!52 = metadata !{i32 26, i32 11, metadata !53, null}
!53 = metadata !{i32 786443, metadata !1, metadata !51, i32 26, i32 11, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!54 = metadata !{i32 32, i32 5, metadata !42, null}
!55 = metadata !{i32 33, i32 5, metadata !42, null}
!56 = metadata !{i32 34, i32 3, metadata !42, null}
!57 = metadata !{i32 35, i32 3, metadata !4, null}

