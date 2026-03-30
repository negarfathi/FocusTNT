; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@"'flag" = global i64 0, align 8
@"'count" = global i64 0, align 8

; Function Attrs: nounwind uwtable
define i64 @wrap_around(i64 %value, i64 %lower_bound, i64 %upper_bound) #0 {
wrap_around_bb0:
  call void @llvm.dbg.value(metadata !{i64 %value}, i64 0, metadata !21), !dbg !22
  call void @llvm.dbg.value(metadata !{i64 %lower_bound}, i64 0, metadata !23), !dbg !24
  call void @llvm.dbg.value(metadata !{i64 %upper_bound}, i64 0, metadata !25), !dbg !26
  %"0" = sub nsw i64 %upper_bound, %lower_bound, !dbg !27
  %"1" = add nsw i64 %"0", 1, !dbg !27
  call void @llvm.dbg.value(metadata !{i64 %"1"}, i64 0, metadata !28), !dbg !29
  %"2" = icmp sgt i64 %value, %upper_bound, !dbg !30
  br i1 %"2", label %wrap_around_bb1, label %wrap_around_bb2, !dbg !30

wrap_around_bb1:                                  ; preds = %wrap_around_bb0
  %"3" = sub nsw i64 %value, %upper_bound, !dbg !32
  %"4" = sub nsw i64 %"3", 1, !dbg !32
  %"5" = srem i64 %"4", %"1", !dbg !32
  %"6" = add nsw i64 %lower_bound, %"5", !dbg !32
  br label %wrap_around_bb4, !dbg !32

wrap_around_bb2:                                  ; preds = %wrap_around_bb0
  %"7" = icmp slt i64 %value, %lower_bound, !dbg !34
  br i1 %"7", label %wrap_around_bb3, label %wrap_around_bb4, !dbg !34

wrap_around_bb3:                                  ; preds = %wrap_around_bb2
  %"8" = sub nsw i64 %lower_bound, %value, !dbg !36
  %"9" = sub nsw i64 %"8", 1, !dbg !36
  %"10" = srem i64 %"9", %"1", !dbg !36
  %"11" = sub nsw i64 %upper_bound, %"10", !dbg !36
  br label %wrap_around_bb4, !dbg !36

wrap_around_bb4:                                  ; preds = %wrap_around_bb2, %wrap_around_bb3, %wrap_around_bb1
  %.0 = phi i64 [ %"6", %wrap_around_bb1 ], [ %"11", %wrap_around_bb3 ], [ %value, %wrap_around_bb2 ]
  ret i64 %.0, !dbg !38
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i64 @read_slice_1() #0 {
read_slice_1_bb5:
  %"12" = load i64* @"'flag", align 8, !dbg !39
  %"13" = icmp eq i64 %"12", 1, !dbg !39
  %"14" = load i64* @"'count", align 8
  %"15" = icmp sgt i64 %"14", 100, !dbg !41
  %or.cond = or i1 %"13", %"15", !dbg !39
  br i1 %or.cond, label %read_slice_1_bb13, label %read_slice_1_bb6, !dbg !39

read_slice_1_bb6:                                 ; preds = %read_slice_1_bb5
  call void @llvm.dbg.value(metadata !43, i64 0, metadata !44), !dbg !45
  %"16" = icmp sle i64 -10, 0, !dbg !46
  br i1 %"16", label %read_slice_1_bb13, label %read_slice_1_bb7, !dbg !46

read_slice_1_bb7:                                 ; preds = %read_slice_1_bb6
  %"17" = srem i64 -10, 1000, !dbg !48
  call void @llvm.dbg.value(metadata !{i64 %"17"}, i64 0, metadata !50), !dbg !51
  call void @llvm.dbg.value(metadata !52, i64 0, metadata !53), !dbg !54
  call void @llvm.dbg.value(metadata !55, i64 0, metadata !56), !dbg !57
  call void @llvm.dbg.value(metadata !58, i64 0, metadata !59), !dbg !60
  call void @llvm.dbg.value(metadata !{i64 %"17"}, i64 0, metadata !44), !dbg !45
  %"18" = icmp slt i64 %"17", 995, !dbg !61
  br i1 %"18", label %read_slice_1_bb8, label %read_slice_1_bb12, !dbg !61

read_slice_1_bb8:                                 ; preds = %read_slice_1_bb7
  %"19" = load i64* @"'count", align 8, !dbg !63
  %"20" = add nsw i64 %"19", 1, !dbg !63
  call void @llvm.dbg.value(metadata !{i64 %"20"}, i64 0, metadata !65), !dbg !66
  call void @llvm.dbg.value(metadata !52, i64 0, metadata !67), !dbg !68
  call void @llvm.dbg.value(metadata !55, i64 0, metadata !69), !dbg !70
  call void @llvm.dbg.value(metadata !58, i64 0, metadata !71), !dbg !72
  %"21" = icmp sgt i64 %"20", 2147483647, !dbg !73
  br i1 %"21", label %read_slice_1_bb9, label %read_slice_1_bb10, !dbg !73

read_slice_1_bb9:                                 ; preds = %read_slice_1_bb8
  %"22" = sub nsw i64 %"20", 2147483647, !dbg !74
  %"23" = sub nsw i64 %"22", 1, !dbg !74
  %"24" = srem i64 %"23", 4294967296, !dbg !74
  %"25" = add nsw i64 -2147483648, %"24", !dbg !74
  br label %read_slice_1_wrap_around.exit, !dbg !74

read_slice_1_bb10:                                ; preds = %read_slice_1_bb8
  %"26" = icmp slt i64 %"20", -2147483648, !dbg !75
  br i1 %"26", label %read_slice_1_bb11, label %read_slice_1_wrap_around.exit, !dbg !75

read_slice_1_bb11:                                ; preds = %read_slice_1_bb10
  %"27" = sub nsw i64 -2147483648, %"20", !dbg !76
  %"28" = sub nsw i64 %"27", 1, !dbg !76
  %"29" = srem i64 %"28", 4294967296, !dbg !76
  %"30" = sub nsw i64 2147483647, %"29", !dbg !76
  br label %read_slice_1_wrap_around.exit, !dbg !76

read_slice_1_wrap_around.exit:                    ; preds = %read_slice_1_bb9, %read_slice_1_bb10, %read_slice_1_bb11
  %.0.i = phi i64 [ %"25", %read_slice_1_bb9 ], [ %"30", %read_slice_1_bb11 ], [ %"20", %read_slice_1_bb10 ], !dbg !63
  store i64 %.0.i, i64* @"'count", align 8, !dbg !63
  call void @llvm.dbg.value(metadata !{i64 %"17"}, i64 0, metadata !77), !dbg !78
  br label %read_slice_1_bb13, !dbg !79

read_slice_1_bb12:                                ; preds = %read_slice_1_bb7
  store i64 1, i64* @"'flag", align 8, !dbg !80
  call void @llvm.dbg.value(metadata !82, i64 0, metadata !77), !dbg !78
  br label %read_slice_1_bb13

read_slice_1_bb13:                                ; preds = %read_slice_1_bb6, %read_slice_1_bb12, %read_slice_1_wrap_around.exit, %read_slice_1_bb5
  %__retres.2 = phi i64 [ 0, %read_slice_1_bb5 ], [ -1, %read_slice_1_bb6 ], [ %"17", %read_slice_1_wrap_around.exit ], [ 0, %read_slice_1_bb12 ]
  ret i64 %__retres.2, !dbg !83
}

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb14:
  %"31" = load i64* @"'flag", align 8, !dbg !84
  %"32" = load i64* @"'count", align 8, !dbg !85
  call void @llvm.dbg.value(metadata !{i64 %.}, i64 0, metadata !87), !dbg !88
  call void @llvm.dbg.value(metadata !43, i64 0, metadata !89), !dbg !90
  br label %main_read_slice_1.exit, !dbg !91

main_read_slice_1.exit:                           ; preds = %main_read_slice_1.exit, %main_bb14
  %"33" = icmp eq i64 %"31", 1, !dbg !84
  %"34" = icmp sgt i64 %"32", 100, !dbg !92
  %or.cond.i = or i1 %"33", %"34", !dbg !84
  %. = select i1 %or.cond.i, i64 0, i64 -1, !dbg !84
  %"35" = icmp slt i64 %., 0, !dbg !93
  br i1 %"35", label %main_bb15, label %main_read_slice_1.exit, !dbg !93

main_bb15:                                        ; preds = %main_read_slice_1.exit
  ret void, !dbg !95
}

declare i64 @__kittel_nondef.0()

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!18, !19}
!llvm.ident = !{!20}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !15, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [//FILES_DIR/SourceCode_SemanticAugmentor.c] [DW_LANG_C99]
!1 = metadata !{metadata !"FILES_DIR/SourceCode_SemanticAugmentor.c", metadata !"/"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9, metadata !12}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"wrap_around", metadata !"wrap_around", metadata !"", i32 9, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i64, i64, i64)* @wrap_around, null, null, metadata !2, i32 9} ; [ DW_TAG_subprogram ] [line 9] [def] [wrap_around]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"read_slice_1", metadata !"read_slice_1", metadata !"", i32 19, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 ()* @read_slice_1, null, null, metadata !2, i32 20} ; [ DW_TAG_subprogram ] [line 19] [def] [scope 20] [read_slice_1]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !8}
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 49, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @main, null, null, metadata !2, i32 50} ; [ DW_TAG_subprogram ] [line 49] [def] [scope 50] [main]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{null}
!15 = metadata !{metadata !16, metadata !17}
!16 = metadata !{i32 786484, i32 0, null, metadata !"flag", metadata !"flag", metadata !"", metadata !5, i32 7, metadata !8, i32 0, i32 1, i64* @"'flag", null} ; [ DW_TAG_variable ] [flag] [line 7] [def]
!17 = metadata !{i32 786484, i32 0, null, metadata !"count", metadata !"count", metadata !"", metadata !5, i32 8, metadata !8, i32 0, i32 1, i64* @"'count", null} ; [ DW_TAG_variable ] [count] [line 8] [def]
!18 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!19 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!20 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!21 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777225, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 9]
!22 = metadata !{i32 9, i32 33, metadata !4, null}
!23 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554441, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [lower_bound] [line 9]
!24 = metadata !{i32 9, i32 50, metadata !4, null}
!25 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331657, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [upper_bound] [line 9]
!26 = metadata !{i32 9, i32 73, metadata !4, null}
!27 = metadata !{i32 10, i32 5, metadata !4, null}
!28 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 10, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [range] [line 10]
!29 = metadata !{i32 10, i32 15, metadata !4, null}
!30 = metadata !{i32 11, i32 9, metadata !31, null}
!31 = metadata !{i32 786443, metadata !1, metadata !4, i32 11, i32 9, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!32 = metadata !{i32 12, i32 9, metadata !33, null}
!33 = metadata !{i32 786443, metadata !1, metadata !31, i32 11, i32 30, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!34 = metadata !{i32 14, i32 14, metadata !35, null}
!35 = metadata !{i32 786443, metadata !1, metadata !31, i32 14, i32 14, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!36 = metadata !{i32 15, i32 9, metadata !37, null}
!37 = metadata !{i32 786443, metadata !1, metadata !35, i32 14, i32 35, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!38 = metadata !{i32 18, i32 1, metadata !4, null}
!39 = metadata !{i32 22, i32 7, metadata !40, null}
!40 = metadata !{i32 786443, metadata !1, metadata !9, i32 22, i32 7, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!41 = metadata !{i32 27, i32 9, metadata !42, null}
!42 = metadata !{i32 786443, metadata !1, metadata !40, i32 27, i32 9, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!43 = metadata !{i64 -10}
!44 = metadata !{i32 786688, metadata !9, metadata !"num", metadata !5, i32 31, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [num] [line 31]
!45 = metadata !{i32 31, i32 13, metadata !9, null}
!46 = metadata !{i32 32, i32 7, metadata !47, null}
!47 = metadata !{i32 786443, metadata !1, metadata !9, i32 32, i32 7, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!48 = metadata !{i32 36, i32 11, metadata !49, null}
!49 = metadata !{i32 786443, metadata !1, metadata !47, i32 35, i32 8, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!50 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777225, metadata !8, i32 0, metadata !48} ; [ DW_TAG_arg_variable ] [value] [line 9]
!51 = metadata !{i32 9, i32 33, metadata !4, metadata !48}
!52 = metadata !{i64 -2147483648}
!53 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554441, metadata !8, i32 0, metadata !48} ; [ DW_TAG_arg_variable ] [lower_bound] [line 9]
!54 = metadata !{i32 9, i32 50, metadata !4, metadata !48}
!55 = metadata !{i64 2147483647}
!56 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331657, metadata !8, i32 0, metadata !48} ; [ DW_TAG_arg_variable ] [upper_bound] [line 9]
!57 = metadata !{i32 9, i32 73, metadata !4, metadata !48}
!58 = metadata !{i64 4294967296}
!59 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 10, metadata !8, i32 0, metadata !48} ; [ DW_TAG_auto_variable ] [range] [line 10]
!60 = metadata !{i32 10, i32 15, metadata !4, metadata !48}
!61 = metadata !{i32 37, i32 9, metadata !62, null}
!62 = metadata !{i32 786443, metadata !1, metadata !49, i32 37, i32 9, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!63 = metadata !{i32 38, i32 16, metadata !64, null}
!64 = metadata !{i32 786443, metadata !1, metadata !62, i32 37, i32 20, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!65 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777225, metadata !8, i32 0, metadata !63} ; [ DW_TAG_arg_variable ] [value] [line 9]
!66 = metadata !{i32 9, i32 33, metadata !4, metadata !63}
!67 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554441, metadata !8, i32 0, metadata !63} ; [ DW_TAG_arg_variable ] [lower_bound] [line 9]
!68 = metadata !{i32 9, i32 50, metadata !4, metadata !63}
!69 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331657, metadata !8, i32 0, metadata !63} ; [ DW_TAG_arg_variable ] [upper_bound] [line 9]
!70 = metadata !{i32 9, i32 73, metadata !4, metadata !63}
!71 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 10, metadata !8, i32 0, metadata !63} ; [ DW_TAG_auto_variable ] [range] [line 10]
!72 = metadata !{i32 10, i32 15, metadata !4, metadata !63}
!73 = metadata !{i32 11, i32 9, metadata !31, metadata !63}
!74 = metadata !{i32 12, i32 9, metadata !33, metadata !63}
!75 = metadata !{i32 14, i32 14, metadata !35, metadata !63}
!76 = metadata !{i32 15, i32 9, metadata !37, metadata !63}
!77 = metadata !{i32 786688, metadata !9, metadata !"__retres", metadata !5, i32 21, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__retres] [line 21]
!78 = metadata !{i32 21, i32 13, metadata !9, null}
!79 = metadata !{i32 40, i32 5, metadata !64, null}
!80 = metadata !{i32 42, i32 7, metadata !81, null}
!81 = metadata !{i32 786443, metadata !1, metadata !62, i32 41, i32 10, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!82 = metadata !{i64 0}
!83 = metadata !{i32 46, i32 17, metadata !9, null}
!84 = metadata !{i32 22, i32 7, metadata !40, metadata !85}
!85 = metadata !{i32 53, i32 11, metadata !86, null}
!86 = metadata !{i32 786443, metadata !1, metadata !12, i32 51, i32 13, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!87 = metadata !{i32 786688, metadata !86, metadata !"tmp", metadata !5, i32 52, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmp] [line 52]
!88 = metadata !{i32 52, i32 15, metadata !86, null}
!89 = metadata !{i32 786688, metadata !9, metadata !"num", metadata !5, i32 31, metadata !8, i32 0, metadata !85} ; [ DW_TAG_auto_variable ] [num] [line 31]
!90 = metadata !{i32 31, i32 13, metadata !9, metadata !85}
!91 = metadata !{i32 51, i32 3, metadata !12, null}
!92 = metadata !{i32 27, i32 9, metadata !42, metadata !85}
!93 = metadata !{i32 54, i32 9, metadata !94, null}
!94 = metadata !{i32 786443, metadata !1, metadata !86, i32 54, i32 9, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!95 = metadata !{i32 59, i32 3, metadata !12, null}

