; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define i64 @wrap_around(i64 %value, i64 %lower_bound, i64 %upper_bound) #0 {
wrap_around_bb0:
  call void @llvm.dbg.value(metadata !{i64 %value}, i64 0, metadata !15), !dbg !16
  call void @llvm.dbg.value(metadata !{i64 %lower_bound}, i64 0, metadata !17), !dbg !18
  call void @llvm.dbg.value(metadata !{i64 %upper_bound}, i64 0, metadata !19), !dbg !20
  %"0" = sub nsw i64 %upper_bound, %lower_bound, !dbg !21
  %"1" = add nsw i64 %"0", 1, !dbg !21
  call void @llvm.dbg.value(metadata !{i64 %"1"}, i64 0, metadata !22), !dbg !23
  %"2" = icmp sgt i64 %value, %upper_bound, !dbg !24
  br i1 %"2", label %wrap_around_bb1, label %wrap_around_bb2, !dbg !24

wrap_around_bb1:                                  ; preds = %wrap_around_bb0
  %"3" = sub nsw i64 %value, %upper_bound, !dbg !26
  %"4" = sub nsw i64 %"3", 1, !dbg !26
  %"5" = srem i64 %"4", %"1", !dbg !26
  %"6" = add nsw i64 %lower_bound, %"5", !dbg !26
  br label %wrap_around_bb4, !dbg !26

wrap_around_bb2:                                  ; preds = %wrap_around_bb0
  %"7" = icmp slt i64 %value, %lower_bound, !dbg !28
  br i1 %"7", label %wrap_around_bb3, label %wrap_around_bb4, !dbg !28

wrap_around_bb3:                                  ; preds = %wrap_around_bb2
  %"8" = sub nsw i64 %lower_bound, %value, !dbg !30
  %"9" = sub nsw i64 %"8", 1, !dbg !30
  %"10" = srem i64 %"9", %"1", !dbg !30
  %"11" = sub nsw i64 %upper_bound, %"10", !dbg !30
  br label %wrap_around_bb4, !dbg !30

wrap_around_bb4:                                  ; preds = %wrap_around_bb2, %wrap_around_bb3, %wrap_around_bb1
  %.0 = phi i64 [ %"6", %wrap_around_bb1 ], [ %"11", %wrap_around_bb3 ], [ %value, %wrap_around_bb2 ]
  ret i64 %.0, !dbg !32
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb5:
  call void @llvm.dbg.value(metadata !33, i64 0, metadata !34), !dbg !35
  call void @llvm.dbg.value(metadata !36, i64 0, metadata !37), !dbg !38
  call void @llvm.dbg.value(metadata !39, i64 0, metadata !40), !dbg !41
  %"12" = icmp eq i64 1, 0, !dbg !42
  br i1 %"12", label %main_bb17, label %main_bb6, !dbg !42

main_bb6:                                         ; preds = %main_bb5
  %"13" = add nsw i64 1, 10, !dbg !44
  %"14" = add nsw i64 %"13", 1, !dbg !44
  call void @llvm.dbg.value(metadata !{i64 %"14"}, i64 0, metadata !46), !dbg !47
  call void @llvm.dbg.value(metadata !48, i64 0, metadata !49), !dbg !50
  call void @llvm.dbg.value(metadata !51, i64 0, metadata !52), !dbg !53
  call void @llvm.dbg.value(metadata !54, i64 0, metadata !55), !dbg !56
  %"15" = icmp sgt i64 %"14", 4294967295, !dbg !57
  br i1 %"15", label %main_bb7, label %main_bb8, !dbg !57

main_bb7:                                         ; preds = %main_bb6
  %"16" = sub nsw i64 %"14", 4294967295, !dbg !58
  %"17" = sub nsw i64 %"16", 1, !dbg !58
  %"18" = srem i64 %"17", 4294967296, !dbg !58
  br label %main_wrap_around.exit, !dbg !58

main_bb8:                                         ; preds = %main_bb6
  %"19" = icmp slt i64 %"14", 0, !dbg !59
  br i1 %"19", label %main_bb9, label %main_wrap_around.exit, !dbg !59

main_bb9:                                         ; preds = %main_bb8
  %"20" = sub nsw i64 0, %"14", !dbg !60
  %"21" = sub nsw i64 %"20", 1, !dbg !60
  %"22" = srem i64 %"21", 4294967296, !dbg !60
  %"23" = sub nsw i64 4294967295, %"22", !dbg !60
  br label %main_wrap_around.exit, !dbg !60

main_wrap_around.exit:                            ; preds = %main_bb7, %main_bb8, %main_bb9
  %.0.i = phi i64 [ %"18", %main_bb7 ], [ %"23", %main_bb9 ], [ %"14", %main_bb8 ], !dbg !44
  %"24" = icmp eq i64 %.0.i, 4294967295, !dbg !44
  br i1 %"24", label %main_bb17, label %main_wrap_around.exit2, !dbg !44

main_wrap_around.exit2:                           ; preds = %main_bb16, %main_bb15, %main_bb14, %main_wrap_around.exit
  %newbufsize.0 = phi i64 [ 1, %main_wrap_around.exit ], [ %"41", %main_bb14 ], [ %"46", %main_bb16 ], [ %"37", %main_bb15 ]
  %"25" = add nsw i64 5, 10, !dbg !61
  %"26" = add nsw i64 %"25", 1, !dbg !61
  %"27" = icmp sgt i64 %"26", 4294967295, !dbg !62
  br i1 %"27", label %main_bb10, label %main_bb11, !dbg !62

main_bb10:                                        ; preds = %main_wrap_around.exit2
  %"28" = sub nsw i64 %"26", 4294967295, !dbg !63
  %"29" = sub nsw i64 %"28", 1, !dbg !63
  %"30" = srem i64 %"29", 4294967296, !dbg !63
  br label %main_wrap_around.exit4, !dbg !63

main_bb11:                                        ; preds = %main_wrap_around.exit2
  %"31" = icmp slt i64 %"26", 0, !dbg !64
  br i1 %"31", label %main_bb12, label %main_wrap_around.exit4, !dbg !64

main_bb12:                                        ; preds = %main_bb11
  %"32" = sub nsw i64 0, %"26", !dbg !65
  %"33" = sub nsw i64 %"32", 1, !dbg !65
  %"34" = srem i64 %"33", 4294967296, !dbg !65
  %"35" = sub nsw i64 4294967295, %"34", !dbg !65
  br label %main_wrap_around.exit4, !dbg !65

main_wrap_around.exit4:                           ; preds = %main_bb10, %main_bb11, %main_bb12
  %.0.i3 = phi i64 [ %"30", %main_bb10 ], [ %"35", %main_bb12 ], [ %"26", %main_bb11 ], !dbg !61
  %"36" = icmp slt i64 %newbufsize.0, %.0.i3, !dbg !61
  br i1 %"36", label %main_bb13, label %main_bb17, !dbg !61

main_bb13:                                        ; preds = %main_wrap_around.exit4
  %"37" = mul nsw i64 %newbufsize.0, 2, !dbg !66
  %"38" = icmp sgt i64 %"37", 4294967295, !dbg !68
  br i1 %"38", label %main_bb14, label %main_bb15, !dbg !68

main_bb14:                                        ; preds = %main_bb13
  %"39" = sub nsw i64 %"37", 4294967295, !dbg !69
  %"40" = sub nsw i64 %"39", 1, !dbg !69
  %"41" = srem i64 %"40", 4294967296, !dbg !69
  br label %main_wrap_around.exit2, !dbg !69

main_bb15:                                        ; preds = %main_bb13
  %"42" = icmp slt i64 %"37", 0, !dbg !70
  br i1 %"42", label %main_bb16, label %main_wrap_around.exit2, !dbg !70

main_bb16:                                        ; preds = %main_bb15
  %"43" = sub nsw i64 0, %"37", !dbg !71
  %"44" = sub nsw i64 %"43", 1, !dbg !71
  %"45" = srem i64 %"44", 4294967296, !dbg !71
  %"46" = sub nsw i64 4294967295, %"45", !dbg !71
  br label %main_wrap_around.exit2, !dbg !71

main_bb17:                                        ; preds = %main_wrap_around.exit4, %main_wrap_around.exit, %main_bb5
  ret void, !dbg !72
}

declare i64 @__kittel_nondef.0()

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
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"wrap_around", metadata !"wrap_around", metadata !"", i32 7, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i64, i64, i64)* @wrap_around, null, null, metadata !2, i32 7} ; [ DW_TAG_subprogram ] [line 7] [def] [wrap_around]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 17, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @main, null, null, metadata !2, i32 18} ; [ DW_TAG_subprogram ] [line 17] [def] [scope 18] [main]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{null}
!12 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!13 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!14 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!15 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777223, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 7]
!16 = metadata !{i32 7, i32 33, metadata !4, null}
!17 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554439, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [lower_bound] [line 7]
!18 = metadata !{i32 7, i32 50, metadata !4, null}
!19 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331655, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [upper_bound] [line 7]
!20 = metadata !{i32 7, i32 73, metadata !4, null}
!21 = metadata !{i32 8, i32 5, metadata !4, null} ; [ DW_TAG_imported_declaration ]
!22 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 8, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [range] [line 8]
!23 = metadata !{i32 8, i32 15, metadata !4, null} ; [ DW_TAG_imported_declaration ]
!24 = metadata !{i32 9, i32 9, metadata !25, null}
!25 = metadata !{i32 786443, metadata !1, metadata !4, i32 9, i32 9, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!26 = metadata !{i32 10, i32 9, metadata !27, null}
!27 = metadata !{i32 786443, metadata !1, metadata !25, i32 9, i32 30, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!28 = metadata !{i32 12, i32 14, metadata !29, null}
!29 = metadata !{i32 786443, metadata !1, metadata !25, i32 12, i32 14, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!30 = metadata !{i32 13, i32 9, metadata !31, null}
!31 = metadata !{i32 786443, metadata !1, metadata !29, i32 12, i32 35, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!32 = metadata !{i32 16, i32 1, metadata !4, null}
!33 = metadata !{i64 5}
!34 = metadata !{i32 786688, metadata !9, metadata !"pathlen", metadata !5, i32 20, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pathlen] [line 20]
!35 = metadata !{i32 20, i32 13, metadata !9, null}
!36 = metadata !{i64 1}
!37 = metadata !{i32 786688, metadata !9, metadata !"newbufsize", metadata !5, i32 21, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [newbufsize] [line 21]
!38 = metadata !{i32 21, i32 13, metadata !9, null}
!39 = metadata !{i64 10}
!40 = metadata !{i32 786688, metadata !9, metadata !"len", metadata !5, i32 22, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [len] [line 22]
!41 = metadata !{i32 22, i32 13, metadata !9, null}
!42 = metadata !{i32 23, i32 7, metadata !43, null}
!43 = metadata !{i32 786443, metadata !1, metadata !9, i32 23, i32 7, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!44 = metadata !{i32 27, i32 7, metadata !45, null}
!45 = metadata !{i32 786443, metadata !1, metadata !9, i32 27, i32 7, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!46 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777223, metadata !8, i32 0, metadata !44} ; [ DW_TAG_arg_variable ] [value] [line 7]
!47 = metadata !{i32 7, i32 33, metadata !4, metadata !44}
!48 = metadata !{i64 0}
!49 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554439, metadata !8, i32 0, metadata !44} ; [ DW_TAG_arg_variable ] [lower_bound] [line 7]
!50 = metadata !{i32 7, i32 50, metadata !4, metadata !44}
!51 = metadata !{i64 4294967295}
!52 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331655, metadata !8, i32 0, metadata !44} ; [ DW_TAG_arg_variable ] [upper_bound] [line 7]
!53 = metadata !{i32 7, i32 73, metadata !4, metadata !44}
!54 = metadata !{i64 4294967296}
!55 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 8, metadata !8, i32 0, metadata !44} ; [ DW_TAG_auto_variable ] [range] [line 8]
!56 = metadata !{i32 8, i32 15, metadata !4, metadata !44} ; [ DW_TAG_imported_declaration ]
!57 = metadata !{i32 9, i32 9, metadata !25, metadata !44}
!58 = metadata !{i32 10, i32 9, metadata !27, metadata !44}
!59 = metadata !{i32 12, i32 14, metadata !29, metadata !44}
!60 = metadata !{i32 13, i32 9, metadata !31, metadata !44}
!61 = metadata !{i32 31, i32 23, metadata !9, null}
!62 = metadata !{i32 9, i32 9, metadata !25, metadata !61}
!63 = metadata !{i32 10, i32 9, metadata !27, metadata !61}
!64 = metadata !{i32 12, i32 14, metadata !29, metadata !61}
!65 = metadata !{i32 13, i32 9, metadata !31, metadata !61}
!66 = metadata !{i32 32, i32 16, metadata !67, null}
!67 = metadata !{i32 786443, metadata !1, metadata !9, i32 32, i32 1, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!68 = metadata !{i32 9, i32 9, metadata !25, metadata !66}
!69 = metadata !{i32 10, i32 9, metadata !27, metadata !66}
!70 = metadata !{i32 12, i32 14, metadata !29, metadata !66}
!71 = metadata !{i32 13, i32 9, metadata !31, metadata !66}
!72 = metadata !{i32 34, i32 17, metadata !9, null}

