; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.slots_used = private unnamed_addr constant [10 x i32] [i32 2, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1], align 16
@main.ereg = private unnamed_addr constant [10 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1], align 16

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
main_bb0:
  %slots_used = alloca [10 x i32], align 16
  %ereg = alloca [10 x i32], align 16
  %"0" = call i32 @__kittel_nondef.0()
  call void @llvm.dbg.value(metadata !{i32 %"0"}, i64 0, metadata !12), !dbg !13
  call void @llvm.dbg.value(metadata !14, i64 0, metadata !15), !dbg !16
  call void @llvm.dbg.declare(metadata !{[10 x i32]* %slots_used}, metadata !17), !dbg !21
  %"1" = bitcast [10 x i32]* %slots_used to i8*, !dbg !22
  %"2" = bitcast [10 x i32]* @main.slots_used to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %"1", i8* %"2", i64 40, i32 16, i1 false), !dbg !22
  call void @llvm.dbg.declare(metadata !{[10 x i32]* %ereg}, metadata !23), !dbg !24
  %"3" = bitcast [10 x i32]* %ereg to i8*, !dbg !25
  %"4" = bitcast [10 x i32]* @main.ereg to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %"3", i8* %"4", i64 40, i32 16, i1 false), !dbg !25
  call void @llvm.dbg.value(metadata !26, i64 0, metadata !27), !dbg !29
  call void @llvm.dbg.value(metadata !{i32 %"6"}, i64 0, metadata !27), !dbg !29
  br label %main_bb1, !dbg !30

main_bb1:                                         ; preds = %main_bb2, %main_bb0
  %i.0 = phi i32 [ 0, %main_bb0 ], [ %"6", %main_bb2 ]
  %"5" = icmp slt i32 %i.0, 10, !dbg !31
  br i1 %"5", label %main_bb2, label %main_bb3, !dbg !31

main_bb2:                                         ; preds = %main_bb1
  %"6" = add nsw i32 %i.0, 1, !dbg !34
  br label %main_bb1, !dbg !34

main_bb3:                                         ; preds = %main_bb1, %main_bb9
  %i1.0 = phi i32 [ %"22", %main_bb9 ], [ 0, %main_bb1 ]
  %table.0 = phi i32 [ %table.1, %main_bb9 ], [ %"0", %main_bb1 ]
  %"7" = icmp slt i32 %i1.0, 10, !dbg !35
  br i1 %"7", label %main_bb4, label %main_bb10, !dbg !35

main_bb4:                                         ; preds = %main_bb3
  %"8" = sext i32 %i1.0 to i64, !dbg !37
  %"9" = getelementptr inbounds [10 x i32]* %slots_used, i32 0, i64 %"8", !dbg !37
  %"10" = load i32* %"9", align 4, !dbg !37
  br label %main_NodeBlock

main_NodeBlock:                                   ; preds = %main_bb4
  %Pivot = icmp slt i32 %"10", 2
  br i1 %Pivot, label %main_LeafBlock, label %main_LeafBlock1

main_LeafBlock:                                   ; preds = %main_NodeBlock
  %SwitchLeaf = icmp eq i32 %"10", 0
  br i1 %SwitchLeaf, label %main_bb5, label %main_NewDefault

main_bb5:                                         ; preds = %main_LeafBlock
  %"11" = sext i32 %i1.0 to i64, !dbg !39
  %"12" = getelementptr inbounds [10 x i32]* %ereg, i32 0, i64 %"11", !dbg !39
  %"13" = load i32* %"12", align 4, !dbg !39
  %"14" = icmp ne i32 %"13", 0, !dbg !39
  br i1 %"14", label %main_bb6, label %main_bb10, !dbg !39

main_bb6:                                         ; preds = %main_bb5
  %"15" = sext i32 %i1.0 to i64, !dbg !42
  %"16" = getelementptr inbounds [10 x i32]* %ereg, i32 0, i64 %"15", !dbg !42
  %"17" = load i32* %"16", align 4, !dbg !42
  br label %main_bb8, !dbg !43

main_LeafBlock1:                                  ; preds = %main_NodeBlock
  %SwitchLeaf2 = icmp eq i32 %"10", 2
  br i1 %SwitchLeaf2, label %main_bb8, label %main_NewDefault

main_NewDefault:                                  ; preds = %main_LeafBlock1, %main_LeafBlock
  br label %main_bb7

main_bb7:                                         ; preds = %main_NewDefault
  %"18" = sext i32 %i1.0 to i64, !dbg !44
  %"19" = getelementptr inbounds [10 x i32]* %ereg, i32 0, i64 %"18", !dbg !44
  %"20" = load i32* %"19", align 4, !dbg !44
  br label %main_bb8, !dbg !45

main_bb8:                                         ; preds = %main_LeafBlock1, %main_bb7, %main_bb6
  %table.1 = phi i32 [ %"20", %main_bb7 ], [ %"17", %main_bb6 ], [ %table.0, %main_LeafBlock1 ]
  %"21" = icmp ne i32 %table.1, 0, !dbg !46
  br i1 %"21", label %main_bb10, label %main_bb9, !dbg !46

main_bb9:                                         ; preds = %main_bb8
  %"22" = add nsw i32 %i1.0, 1, !dbg !48
  br label %main_bb3, !dbg !49

main_bb10:                                        ; preds = %main_bb3, %main_bb8, %main_bb5
  ret i32 0, !dbg !50
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

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
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 10, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 11} ; [ DW_TAG_subprogram ] [line 10] [def] [scope 11] [main]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!10 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!11 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!12 = metadata !{i32 786688, metadata !4, metadata !"table", metadata !5, i32 15, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [table] [line 15]
!13 = metadata !{i32 15, i32 9, metadata !4, null}
!14 = metadata !{i32 10}
!15 = metadata !{i32 786688, metadata !4, metadata !"EVENT_EPOLL_TABLES", metadata !5, i32 12, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [EVENT_EPOLL_TABLES] [line 12]
!16 = metadata !{i32 12, i32 9, metadata !4, null}
!17 = metadata !{i32 786688, metadata !4, metadata !"slots_used", metadata !5, i32 13, metadata !18, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [slots_used] [line 13]
!18 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 320, i64 32, i32 0, i32 0, metadata !8, metadata !19, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 320, align 32, offset 0] [from int]
!19 = metadata !{metadata !20}
!20 = metadata !{i32 786465, i64 0, i64 10}       ; [ DW_TAG_subrange_type ] [0, 9]
!21 = metadata !{i32 13, i32 9, metadata !4, null}
!22 = metadata !{i32 13, i32 5, metadata !4, null}
!23 = metadata !{i32 786688, metadata !4, metadata !"ereg", metadata !5, i32 14, metadata !18, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ereg] [line 14]
!24 = metadata !{i32 14, i32 9, metadata !4, null}
!25 = metadata !{i32 14, i32 5, metadata !4, null}
!26 = metadata !{i32 0}
!27 = metadata !{i32 786688, metadata !28, metadata !"i", metadata !5, i32 16, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 16]
!28 = metadata !{i32 786443, metadata !1, metadata !4, i32 16, i32 5, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!29 = metadata !{i32 16, i32 14, metadata !28, null}
!30 = metadata !{i32 16, i32 10, metadata !28, null}
!31 = metadata !{i32 16, i32 10, metadata !32, null}
!32 = metadata !{i32 786443, metadata !1, metadata !33, i32 16, i32 10, i32 2, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!33 = metadata !{i32 786443, metadata !1, metadata !28, i32 16, i32 10, i32 1, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!34 = metadata !{i32 16, i32 31, metadata !28, null}
!35 = metadata !{i32 22, i32 5, metadata !36, null}
!36 = metadata !{i32 786443, metadata !1, metadata !4, i32 22, i32 5, i32 1, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!37 = metadata !{i32 24, i32 9, metadata !38, null}
!38 = metadata !{i32 786443, metadata !1, metadata !4, i32 23, i32 5, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!39 = metadata !{i32 29, i32 21, metadata !40, null}
!40 = metadata !{i32 786443, metadata !1, metadata !41, i32 29, i32 21, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!41 = metadata !{i32 786443, metadata !1, metadata !38, i32 25, i32 9, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!42 = metadata !{i32 32, i32 21, metadata !40, null}
!43 = metadata !{i32 33, i32 17, metadata !41, null}
!44 = metadata !{i32 35, i32 17, metadata !41, null}
!45 = metadata !{i32 36, i32 17, metadata !41, null}
!46 = metadata !{i32 38, i32 13, metadata !47, null}
!47 = metadata !{i32 786443, metadata !1, metadata !38, i32 38, i32 13, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!48 = metadata !{i32 40, i32 9, metadata !38, null}
!49 = metadata !{i32 41, i32 5, metadata !38, null}
!50 = metadata !{i32 43, i32 1, metadata !4, null}

