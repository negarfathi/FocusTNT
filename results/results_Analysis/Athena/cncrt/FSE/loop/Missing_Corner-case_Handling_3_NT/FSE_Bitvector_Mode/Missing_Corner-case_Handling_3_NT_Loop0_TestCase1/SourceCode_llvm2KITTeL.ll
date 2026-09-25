; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
main_bb0:
  call void @llvm.dbg.value(metadata !12, i64 0, metadata !13), !dbg !14
  call void @llvm.dbg.value(metadata !12, i64 0, metadata !15), !dbg !16
  %"0" = icmp sle i32 1, 0, !dbg !17
  %"1" = icmp sle i32 1, 0, !dbg !19
  %or.cond = or i1 %"0", %"1", !dbg !17
  %"2" = icmp sgt i32 1, 65534, !dbg !21
  %or.cond1 = or i1 %or.cond, %"2", !dbg !17
  %"3" = icmp sgt i32 1, 65534, !dbg !23
  %or.cond2 = or i1 %or.cond1, %"3", !dbg !17
  br i1 %or.cond2, label %main_bb13, label %main_bb1, !dbg !17

main_bb1:                                         ; preds = %main_bb0
  %"4" = zext i32 1 to i64, !dbg !25
  %"5" = zext i32 1 to i64, !dbg !25
  %"6" = call i8* @llvm.stacksave(), !dbg !25
  %"7" = mul nuw i64 %"4", %"5", !dbg !25
  %"8" = alloca i32, i64 %"7", align 16, !dbg !25
  call void @llvm.dbg.declare(metadata !{i32* %"8"}, metadata !26), !dbg !30
  call void @llvm.dbg.value(metadata !31, i64 0, metadata !32), !dbg !34
  call void @llvm.dbg.value(metadata !31, i64 0, metadata !35), !dbg !38
  call void @llvm.dbg.value(metadata !31, i64 0, metadata !39), !dbg !41
  call void @llvm.dbg.value(metadata !{i32 %"13"}, i64 0, metadata !39), !dbg !41
  call void @llvm.dbg.value(metadata !{i32 %"19"}, i64 0, metadata !35), !dbg !38
  br label %main_bb2, !dbg !42

main_bb2:                                         ; preds = %main_bb6, %main_bb1
  %i.0 = phi i32 [ 0, %main_bb1 ], [ %"20", %main_bb6 ]
  %"9" = icmp slt i32 %i.0, 1, !dbg !43
  br i1 %"9", label %main_bb3, label %main_bb7, !dbg !43

main_bb3:                                         ; preds = %main_bb2
  %"10" = sext i32 %i.0 to i64, !dbg !46
  br label %main_bb4, !dbg !47

main_bb4:                                         ; preds = %main_bb5, %main_bb3
  %j.0 = phi i32 [ 0, %main_bb3 ], [ %"19", %main_bb5 ]
  %"11" = icmp slt i32 %j.0, 1, !dbg !48
  br i1 %"11", label %main_bb5, label %main_bb6, !dbg !48

main_bb5:                                         ; preds = %main_bb4
  %"12" = icmp sgt i32 0, 0, !dbg !51
  %"13" = sub nsw i32 0, 0, !dbg !53
  %. = select i1 %"12", i32 %"13", i32 0, !dbg !51
  %"14" = srem i32 %., 4, !dbg !46
  %"15" = sext i32 %j.0 to i64, !dbg !46
  %"16" = mul nsw i64 %"10", %"5", !dbg !46
  %"17" = getelementptr inbounds i32* %"8", i64 %"16", !dbg !46
  %"18" = getelementptr inbounds i32* %"17", i64 %"15", !dbg !46
  store i32 %"14", i32* %"18", align 4, !dbg !46
  %"19" = add nsw i32 %j.0, 1, !dbg !54
  br label %main_bb4, !dbg !54

main_bb6:                                         ; preds = %main_bb4
  %"20" = add nsw i32 %i.0, 1, !dbg !55
  call void @llvm.dbg.value(metadata !{i32 %"20"}, i64 0, metadata !32), !dbg !34
  br label %main_bb2, !dbg !55

main_bb7:                                         ; preds = %main_bb2, %main_bb11
  %xmin.0 = phi i32 [ %"33", %main_bb11 ], [ 0, %main_bb2 ]
  %found.0 = phi i32 [ %found.1, %main_bb11 ], [ 0, %main_bb2 ]
  %"21" = icmp ne i32 %found.0, 0, !dbg !56
  %"22" = xor i1 %"21", true, !dbg !56
  br i1 %"22", label %main_bb8, label %main_bb12, !dbg !56

main_bb8:                                         ; preds = %main_bb7
  %"23" = sext i32 %xmin.0 to i64, !dbg !60
  br label %main_bb9, !dbg !65

main_bb9:                                         ; preds = %main_bb10, %main_bb8
  %y.0 = phi i32 [ 0, %main_bb8 ], [ %"32", %main_bb10 ]
  %found.1 = phi i32 [ %found.0, %main_bb8 ], [ %.found.1, %main_bb10 ]
  %"24" = sub nsw i32 1, 1, !dbg !66
  %"25" = icmp sle i32 %y.0, %"24", !dbg !66
  br i1 %"25", label %main_bb10, label %main_bb11, !dbg !66

main_bb10:                                        ; preds = %main_bb9
  %"26" = sext i32 %y.0 to i64, !dbg !60
  %"27" = mul nsw i64 %"23", %"5", !dbg !60
  %"28" = getelementptr inbounds i32* %"8", i64 %"27", !dbg !60
  %"29" = getelementptr inbounds i32* %"28", i64 %"26", !dbg !60
  %"30" = load i32* %"29", align 4, !dbg !60
  %"31" = icmp ne i32 %"30", 0, !dbg !60
  %.found.1 = select i1 %"31", i32 1, i32 %found.1, !dbg !60
  %"32" = add nsw i32 %y.0, 1, !dbg !69
  br label %main_bb9, !dbg !69

main_bb11:                                        ; preds = %main_bb9
  %"33" = add nsw i32 %xmin.0, 1, !dbg !70
  call void @llvm.dbg.value(metadata !{i32 %"33"}, i64 0, metadata !71), !dbg !72
  br label %main_bb7, !dbg !70

main_bb12:                                        ; preds = %main_bb7
  call void @llvm.stackrestore(i8* %"6"), !dbg !73
  br label %main_bb13

main_bb13:                                        ; preds = %main_bb0, %main_bb12
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind
declare i8* @llvm.stacksave() #2

; Function Attrs: nounwind
declare void @llvm.stackrestore(i8*) #2

declare i32 @__kittel_nondef.0()

declare i8* @__kittel_nondef.1()

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
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 11, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 12} ; [ DW_TAG_subprogram ] [line 11] [def] [scope 12] [main]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!10 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!11 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!12 = metadata !{i32 1}
!13 = metadata !{i32 786688, metadata !4, metadata !"ROWNO", metadata !5, i32 13, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ROWNO] [line 13]
!14 = metadata !{i32 13, i32 9, metadata !4, null}
!15 = metadata !{i32 786688, metadata !4, metadata !"COLNO", metadata !5, i32 14, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [COLNO] [line 14]
!16 = metadata !{i32 14, i32 9, metadata !4, null}
!17 = metadata !{i32 15, i32 9, metadata !18, null}
!18 = metadata !{i32 786443, metadata !1, metadata !4, i32 15, i32 9, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!19 = metadata !{i32 15, i32 9, metadata !20, null}
!20 = metadata !{i32 786443, metadata !1, metadata !18, i32 15, i32 9, i32 1, i32 11} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!21 = metadata !{i32 15, i32 9, metadata !22, null}
!22 = metadata !{i32 786443, metadata !1, metadata !18, i32 15, i32 9, i32 2, i32 12} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!23 = metadata !{i32 15, i32 9, metadata !24, null}
!24 = metadata !{i32 786443, metadata !1, metadata !18, i32 15, i32 9, i32 3, i32 13} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!25 = metadata !{i32 17, i32 5, metadata !4, null}
!26 = metadata !{i32 786688, metadata !4, metadata !"levl", metadata !5, i32 17, metadata !27, i32 8192, i32 0} ; [ DW_TAG_auto_variable ] [levl] [line 17]
!27 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 0, i64 32, i32 0, i32 0, metadata !8, metadata !28, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 0, align 32, offset 0] [from int]
!28 = metadata !{metadata !29, metadata !29}
!29 = metadata !{i32 786465, i64 0, i64 -1}       ; [ DW_TAG_subrange_type ] [unbounded]
!30 = metadata !{i32 17, i32 9, metadata !4, null}
!31 = metadata !{i32 0}
!32 = metadata !{i32 786688, metadata !33, metadata !"i", metadata !5, i32 18, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 18]
!33 = metadata !{i32 786443, metadata !1, metadata !4, i32 18, i32 5, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!34 = metadata !{i32 18, i32 14, metadata !33, null}
!35 = metadata !{i32 786688, metadata !36, metadata !"j", metadata !5, i32 20, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 20]
!36 = metadata !{i32 786443, metadata !1, metadata !37, i32 20, i32 9, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!37 = metadata !{i32 786443, metadata !1, metadata !33, i32 19, i32 5, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!38 = metadata !{i32 20, i32 18, metadata !36, null}
!39 = metadata !{i32 786688, metadata !40, metadata !"num", metadata !5, i32 22, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [num] [line 22]
!40 = metadata !{i32 786443, metadata !1, metadata !36, i32 21, i32 9, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!41 = metadata !{i32 22, i32 17, metadata !40, null}
!42 = metadata !{i32 18, i32 10, metadata !33, null}
!43 = metadata !{i32 18, i32 10, metadata !44, null}
!44 = metadata !{i32 786443, metadata !1, metadata !45, i32 18, i32 10, i32 2, i32 17} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!45 = metadata !{i32 786443, metadata !1, metadata !33, i32 18, i32 10, i32 1, i32 14} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!46 = metadata !{i32 25, i32 13, metadata !40, null}
!47 = metadata !{i32 20, i32 14, metadata !36, null}
!48 = metadata !{i32 20, i32 14, metadata !49, null}
!49 = metadata !{i32 786443, metadata !1, metadata !50, i32 20, i32 14, i32 2, i32 16} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!50 = metadata !{i32 786443, metadata !1, metadata !36, i32 20, i32 14, i32 1, i32 15} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!51 = metadata !{i32 23, i32 17, metadata !52, null}
!52 = metadata !{i32 786443, metadata !1, metadata !40, i32 23, i32 17, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!53 = metadata !{i32 24, i32 17, metadata !52, null}
!54 = metadata !{i32 20, i32 38, metadata !36, null}
!55 = metadata !{i32 18, i32 34, metadata !33, null}
!56 = metadata !{i32 30, i32 10, metadata !57, null}
!57 = metadata !{i32 786443, metadata !1, metadata !58, i32 30, i32 10, i32 2, i32 21} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!58 = metadata !{i32 786443, metadata !1, metadata !59, i32 30, i32 10, i32 1, i32 18} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!59 = metadata !{i32 786443, metadata !1, metadata !4, i32 30, i32 5, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!60 = metadata !{i32 34, i32 17, metadata !61, null}
!61 = metadata !{i32 786443, metadata !1, metadata !62, i32 34, i32 17, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!62 = metadata !{i32 786443, metadata !1, metadata !63, i32 33, i32 9, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!63 = metadata !{i32 786443, metadata !1, metadata !64, i32 32, i32 9, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!64 = metadata !{i32 786443, metadata !1, metadata !59, i32 31, i32 5, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!65 = metadata !{i32 32, i32 14, metadata !63, null}
!66 = metadata !{i32 32, i32 14, metadata !67, null}
!67 = metadata !{i32 786443, metadata !1, metadata !68, i32 32, i32 14, i32 2, i32 20} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!68 = metadata !{i32 786443, metadata !1, metadata !63, i32 32, i32 14, i32 1, i32 19} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!69 = metadata !{i32 32, i32 42, metadata !63, null}
!70 = metadata !{i32 30, i32 33, metadata !59, null}
!71 = metadata !{i32 786688, metadata !59, metadata !"xmin", metadata !5, i32 30, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [xmin] [line 30]
!72 = metadata !{i32 30, i32 14, metadata !59, null}
!73 = metadata !{i32 39, i32 1, metadata !4, null}

