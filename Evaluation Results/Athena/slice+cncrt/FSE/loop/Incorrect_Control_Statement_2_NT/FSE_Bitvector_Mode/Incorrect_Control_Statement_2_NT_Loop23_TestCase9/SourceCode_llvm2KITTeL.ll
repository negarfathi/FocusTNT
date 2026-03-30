; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.slots_used = private unnamed_addr constant [10 x i32] [i32 1, i32 1, i32 2, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1], align 16

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb0:
  %slots_used = alloca [10 x i32], align 16
  %ereg = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata !{[10 x i32]* %slots_used}, metadata !11), !dbg !16
  %"0" = bitcast [10 x i32]* %slots_used to i8*, !dbg !17
  %"1" = bitcast [10 x i32]* @main.slots_used to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %"0", i8* %"1", i64 40, i32 16, i1 false), !dbg !17
  call void @llvm.dbg.declare(metadata !{[10 x i32]* %ereg}, metadata !18), !dbg !19
  %"2" = bitcast [10 x i32]* %ereg to i8*, !dbg !20
  call void @llvm.memset.p0i8.i64(i8* %"2", i8 0, i64 40, i32 16, i1 false), !dbg !20
  call void @llvm.dbg.value(metadata !21, i64 0, metadata !22), !dbg !23
  call void @llvm.dbg.value(metadata !24, i64 0, metadata !25), !dbg !27
  call void @llvm.dbg.value(metadata !{i32 %"4"}, i64 0, metadata !25), !dbg !27
  br label %main_bb1, !dbg !28

main_bb1:                                         ; preds = %main_bb2, %main_bb0
  %i.0 = phi i32 [ 0, %main_bb0 ], [ %"4", %main_bb2 ]
  %"3" = icmp slt i32 %i.0, 10, !dbg !29
  br i1 %"3", label %main_bb2, label %main_bb3, !dbg !29

main_bb2:                                         ; preds = %main_bb1
  %"4" = add nsw i32 %i.0, 1, !dbg !31
  br label %main_bb1, !dbg !33

main_bb3:                                         ; preds = %main_LeafBlock1, %main_bb1, %main_bb9
  %i_0.0 = phi i32 [ %"20", %main_bb9 ], [ 0, %main_bb1 ], [ %i_0.0, %main_LeafBlock1 ]
  %"5" = icmp slt i32 %i_0.0, 10, !dbg !34
  br i1 %"5", label %main_bb4, label %main_bb10, !dbg !34

main_bb4:                                         ; preds = %main_bb3
  %"6" = sext i32 %i_0.0 to i64, !dbg !36
  %"7" = getelementptr inbounds [10 x i32]* %slots_used, i32 0, i64 %"6", !dbg !36
  %"8" = load i32* %"7", align 4, !dbg !36
  br label %main_NodeBlock

main_NodeBlock:                                   ; preds = %main_bb4
  %Pivot = icmp slt i32 %"8", 2
  br i1 %Pivot, label %main_LeafBlock, label %main_LeafBlock1

main_LeafBlock:                                   ; preds = %main_NodeBlock
  %SwitchLeaf = icmp eq i32 %"8", 0
  br i1 %SwitchLeaf, label %main_bb5, label %main_NewDefault

main_bb5:                                         ; preds = %main_LeafBlock
  %"9" = sext i32 %i_0.0 to i64, !dbg !38
  %"10" = getelementptr inbounds [10 x i32]* %ereg, i32 0, i64 %"9", !dbg !38
  %"11" = load i32* %"10", align 4, !dbg !38
  %"12" = icmp ne i32 %"11", 0, !dbg !38
  br i1 %"12", label %main_bb6, label %main_bb10, !dbg !38

main_bb6:                                         ; preds = %main_bb5
  %"13" = sext i32 %i_0.0 to i64, !dbg !41
  %"14" = getelementptr inbounds [10 x i32]* %ereg, i32 0, i64 %"13", !dbg !41
  %"15" = load i32* %"14", align 4, !dbg !41
  br label %main_bb8, !dbg !42

main_LeafBlock1:                                  ; preds = %main_NodeBlock
  %SwitchLeaf2 = icmp eq i32 %"8", 2
  br i1 %SwitchLeaf2, label %main_bb3, label %main_NewDefault

main_NewDefault:                                  ; preds = %main_LeafBlock1, %main_LeafBlock
  br label %main_bb7

main_bb7:                                         ; preds = %main_NewDefault
  %"16" = sext i32 %i_0.0 to i64, !dbg !43
  %"17" = getelementptr inbounds [10 x i32]* %ereg, i32 0, i64 %"16", !dbg !43
  %"18" = load i32* %"17", align 4, !dbg !43
  br label %main_bb8, !dbg !44

main_bb8:                                         ; preds = %main_bb7, %main_bb6
  %table.0 = phi i32 [ %"18", %main_bb7 ], [ %"15", %main_bb6 ]
  %"19" = icmp ne i32 %table.0, 0, !dbg !45
  br i1 %"19", label %main_bb10, label %main_bb9, !dbg !45

main_bb9:                                         ; preds = %main_bb8
  %"20" = add nsw i32 %i_0.0, 1, !dbg !47
  br label %main_bb3, !dbg !48

main_bb10:                                        ; preds = %main_bb3, %main_bb8, %main_bb5
  ret void, !dbg !49
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

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
!11 = metadata !{i32 786688, metadata !4, metadata !"slots_used", metadata !5, i32 7, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [slots_used] [line 7]
!12 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 320, i64 32, i32 0, i32 0, metadata !13, metadata !14, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 320, align 32, offset 0] [from int]
!13 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!14 = metadata !{metadata !15}
!15 = metadata !{i32 786465, i64 0, i64 10}       ; [ DW_TAG_subrange_type ] [0, 9]
!16 = metadata !{i32 7, i32 7, metadata !4, null}
!17 = metadata !{i32 7, i32 3, metadata !4, null}
!18 = metadata !{i32 786688, metadata !4, metadata !"ereg", metadata !5, i32 8, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ereg] [line 8]
!19 = metadata !{i32 8, i32 7, metadata !4, null} ; [ DW_TAG_imported_declaration ]
!20 = metadata !{i32 8, i32 3, metadata !4, null} ; [ DW_TAG_imported_declaration ]
!21 = metadata !{i32 10}
!22 = metadata !{i32 786688, metadata !4, metadata !"EVENT_EPOLL_TABLES", metadata !5, i32 10, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [EVENT_EPOLL_TABLES] [line 10]
!23 = metadata !{i32 10, i32 7, metadata !4, null}
!24 = metadata !{i32 0}
!25 = metadata !{i32 786688, metadata !26, metadata !"i", metadata !5, i32 12, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 12]
!26 = metadata !{i32 786443, metadata !1, metadata !4, i32 11, i32 3, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!27 = metadata !{i32 12, i32 9, metadata !26, null}
!28 = metadata !{i32 13, i32 5, metadata !26, null}
!29 = metadata !{i32 13, i32 5, metadata !30, null}
!30 = metadata !{i32 786443, metadata !1, metadata !26, i32 13, i32 5, i32 1, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!31 = metadata !{i32 16, i32 7, metadata !32, null}
!32 = metadata !{i32 786443, metadata !1, metadata !26, i32 13, i32 20, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!33 = metadata !{i32 17, i32 5, metadata !32, null}
!34 = metadata !{i32 20, i32 3, metadata !35, null}
!35 = metadata !{i32 786443, metadata !1, metadata !4, i32 20, i32 3, i32 1, i32 9} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!36 = metadata !{i32 21, i32 5, metadata !37, null}
!37 = metadata !{i32 786443, metadata !1, metadata !4, i32 20, i32 36, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!38 = metadata !{i32 24, i32 11, metadata !39, null}
!39 = metadata !{i32 786443, metadata !1, metadata !40, i32 24, i32 11, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!40 = metadata !{i32 786443, metadata !1, metadata !37, i32 21, i32 30, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!41 = metadata !{i32 28, i32 12, metadata !39, null}
!42 = metadata !{i32 30, i32 7, metadata !40, null}
!43 = metadata !{i32 31, i32 16, metadata !40, null}
!44 = metadata !{i32 33, i32 5, metadata !40, null}
!45 = metadata !{i32 34, i32 9, metadata !46, null}
!46 = metadata !{i32 786443, metadata !1, metadata !37, i32 34, i32 9, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!47 = metadata !{i32 38, i32 5, metadata !37, null}
!48 = metadata !{i32 39, i32 3, metadata !37, null}
!49 = metadata !{i32 40, i32 17, metadata !4, null}

