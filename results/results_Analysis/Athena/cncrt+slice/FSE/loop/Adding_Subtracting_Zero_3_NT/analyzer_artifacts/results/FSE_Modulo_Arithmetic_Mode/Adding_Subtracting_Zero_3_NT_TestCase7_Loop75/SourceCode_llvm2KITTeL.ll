; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@"'flag" = global i64 0, align 8

; Function Attrs: nounwind uwtable
define i64 @wrap_around(i64 %value, i64 %lower_bound, i64 %upper_bound) #0 {
wrap_around_bb0:
  call void @llvm.dbg.value(metadata !{i64 %value}, i64 0, metadata !20), !dbg !21
  call void @llvm.dbg.value(metadata !{i64 %lower_bound}, i64 0, metadata !22), !dbg !23
  call void @llvm.dbg.value(metadata !{i64 %upper_bound}, i64 0, metadata !24), !dbg !25
  %"0" = sub nsw i64 %upper_bound, %lower_bound, !dbg !26
  %"1" = add nsw i64 %"0", 1, !dbg !26
  call void @llvm.dbg.value(metadata !{i64 %"1"}, i64 0, metadata !27), !dbg !28
  %"2" = icmp sgt i64 %value, %upper_bound, !dbg !29
  br i1 %"2", label %wrap_around_bb1, label %wrap_around_bb2, !dbg !29

wrap_around_bb1:                                  ; preds = %wrap_around_bb0
  %"3" = sub nsw i64 %value, %upper_bound, !dbg !31
  %"4" = sub nsw i64 %"3", 1, !dbg !31
  %"5" = srem i64 %"4", %"1", !dbg !31
  %"6" = add nsw i64 %lower_bound, %"5", !dbg !31
  br label %wrap_around_bb4, !dbg !31

wrap_around_bb2:                                  ; preds = %wrap_around_bb0
  %"7" = icmp slt i64 %value, %lower_bound, !dbg !33
  br i1 %"7", label %wrap_around_bb3, label %wrap_around_bb4, !dbg !33

wrap_around_bb3:                                  ; preds = %wrap_around_bb2
  %"8" = sub nsw i64 %lower_bound, %value, !dbg !35
  %"9" = sub nsw i64 %"8", 1, !dbg !35
  %"10" = srem i64 %"9", %"1", !dbg !35
  %"11" = sub nsw i64 %upper_bound, %"10", !dbg !35
  br label %wrap_around_bb4, !dbg !35

wrap_around_bb4:                                  ; preds = %wrap_around_bb2, %wrap_around_bb3, %wrap_around_bb1
  %.0 = phi i64 [ %"6", %wrap_around_bb1 ], [ %"11", %wrap_around_bb3 ], [ %value, %wrap_around_bb2 ]
  ret i64 %.0, !dbg !37
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i64 @read_slice_1() #0 {
read_slice_1_bb5:
  call void @llvm.dbg.value(metadata !38, i64 0, metadata !39), !dbg !40
  %"12" = load i64* @"'flag", align 8, !dbg !41
  %"13" = icmp eq i64 %"12", 1, !dbg !41
  br i1 %"13", label %read_slice_1_bb10, label %read_slice_1_bb6, !dbg !41

read_slice_1_bb6:                                 ; preds = %read_slice_1_bb5
  %"14" = add nsw i64 0, 1, !dbg !43
  call void @llvm.dbg.value(metadata !{i64 %"14"}, i64 0, metadata !44), !dbg !45
  call void @llvm.dbg.value(metadata !46, i64 0, metadata !47), !dbg !48
  call void @llvm.dbg.value(metadata !49, i64 0, metadata !50), !dbg !51
  call void @llvm.dbg.value(metadata !52, i64 0, metadata !53), !dbg !54
  %"15" = icmp sgt i64 %"14", 2147483647, !dbg !55
  br i1 %"15", label %read_slice_1_bb7, label %read_slice_1_bb8, !dbg !55

read_slice_1_bb7:                                 ; preds = %read_slice_1_bb6
  %"16" = sub nsw i64 %"14", 2147483647, !dbg !56
  %"17" = sub nsw i64 %"16", 1, !dbg !56
  %"18" = srem i64 %"17", 4294967296, !dbg !56
  %"19" = add nsw i64 -2147483648, %"18", !dbg !56
  br label %read_slice_1_wrap_around.exit, !dbg !56

read_slice_1_bb8:                                 ; preds = %read_slice_1_bb6
  %"20" = icmp slt i64 %"14", -2147483648, !dbg !57
  br i1 %"20", label %read_slice_1_bb9, label %read_slice_1_wrap_around.exit, !dbg !57

read_slice_1_bb9:                                 ; preds = %read_slice_1_bb8
  %"21" = sub nsw i64 -2147483648, %"14", !dbg !58
  %"22" = sub nsw i64 %"21", 1, !dbg !58
  %"23" = srem i64 %"22", 4294967296, !dbg !58
  %"24" = sub nsw i64 2147483647, %"23", !dbg !58
  br label %read_slice_1_wrap_around.exit, !dbg !58

read_slice_1_wrap_around.exit:                    ; preds = %read_slice_1_bb7, %read_slice_1_bb8, %read_slice_1_bb9
  %.0.i = phi i64 [ %"19", %read_slice_1_bb7 ], [ %"24", %read_slice_1_bb9 ], [ %"14", %read_slice_1_bb8 ], !dbg !43
  call void @llvm.dbg.value(metadata !{i64 %.0.i}, i64 0, metadata !39), !dbg !40
  store i64 1, i64* @"'flag", align 8, !dbg !59
  call void @llvm.dbg.value(metadata !{i64 %.0.i}, i64 0, metadata !60), !dbg !61
  br label %read_slice_1_bb10, !dbg !62

read_slice_1_bb10:                                ; preds = %read_slice_1_bb5, %read_slice_1_wrap_around.exit
  %__retres.0 = phi i64 [ %.0.i, %read_slice_1_wrap_around.exit ], [ 0, %read_slice_1_bb5 ]
  ret i64 %__retres.0, !dbg !63
}

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb11:
  call void @llvm.dbg.value(metadata !38, i64 0, metadata !64), !dbg !65
  call void @llvm.dbg.value(metadata !66, i64 0, metadata !67), !dbg !68
  store i64 0, i64* @"'flag", align 8, !dbg !69
  %"25" = icmp sle i64 1, 0, !dbg !70
  %"26" = icmp sgt i64 1, 65536, !dbg !72
  %or.cond = or i1 %"25", %"26", !dbg !70
  br i1 %or.cond, label %main_bb17, label %main_wrap_around.exit, !dbg !70

main_wrap_around.exit:                            ; preds = %main_bb11, %main_bb16, %main_bb15, %main_bb14
  %pos.0 = phi i64 [ %"35", %main_bb14 ], [ %"40", %main_bb16 ], [ %"30", %main_bb15 ], [ 0, %main_bb11 ]
  %"27" = icmp slt i64 %pos.0, 1, !dbg !74
  br i1 %"27", label %main_bb12, label %main_bb17, !dbg !74

main_bb12:                                        ; preds = %main_wrap_around.exit
  %"28" = load i64* @"'flag", align 8, !dbg !76
  %"29" = icmp eq i64 %"28", 1, !dbg !76
  br i1 %"29", label %main_read_slice_1.exit, label %main_bb13, !dbg !76

main_bb13:                                        ; preds = %main_bb12
  store i64 1, i64* @"'flag", align 8, !dbg !79
  br label %main_read_slice_1.exit, !dbg !80

main_read_slice_1.exit:                           ; preds = %main_bb12, %main_bb13
  %__retres.0.i = phi i64 [ 1, %main_bb13 ], [ 0, %main_bb12 ], !dbg !77
  %"30" = add nsw i64 %pos.0, %__retres.0.i, !dbg !81
  %"31" = icmp sgt i64 %"30", 2147483647, !dbg !82
  br i1 %"31", label %main_bb14, label %main_bb15, !dbg !82

main_bb14:                                        ; preds = %main_read_slice_1.exit
  %"32" = sub nsw i64 %"30", 2147483647, !dbg !83
  %"33" = sub nsw i64 %"32", 1, !dbg !83
  %"34" = srem i64 %"33", 4294967296, !dbg !83
  %"35" = add nsw i64 -2147483648, %"34", !dbg !83
  br label %main_wrap_around.exit, !dbg !83

main_bb15:                                        ; preds = %main_read_slice_1.exit
  %"36" = icmp slt i64 %"30", -2147483648, !dbg !84
  br i1 %"36", label %main_bb16, label %main_wrap_around.exit, !dbg !84

main_bb16:                                        ; preds = %main_bb15
  %"37" = sub nsw i64 -2147483648, %"30", !dbg !85
  %"38" = sub nsw i64 %"37", 1, !dbg !85
  %"39" = srem i64 %"38", 4294967296, !dbg !85
  %"40" = sub nsw i64 2147483647, %"39", !dbg !85
  br label %main_wrap_around.exit, !dbg !85

main_bb17:                                        ; preds = %main_wrap_around.exit, %main_bb11
  ret void, !dbg !86
}

declare i64 @__kittel_nondef.0()

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!17, !18}
!llvm.ident = !{!19}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !15, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [//FILES_DIR/SourceCode_SemanticAugmentor.c] [DW_LANG_C99]
!1 = metadata !{metadata !"FILES_DIR/SourceCode_SemanticAugmentor.c", metadata !"/"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9, metadata !12}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"wrap_around", metadata !"wrap_around", metadata !"", i32 5, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i64, i64, i64)* @wrap_around, null, null, metadata !2, i32 5} ; [ DW_TAG_subprogram ] [line 5] [def] [wrap_around]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"read_slice_1", metadata !"read_slice_1", metadata !"", i32 15, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 ()* @read_slice_1, null, null, metadata !2, i32 16} ; [ DW_TAG_subprogram ] [line 15] [def] [scope 16] [read_slice_1]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !8}
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 30, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @main, null, null, metadata !2, i32 31} ; [ DW_TAG_subprogram ] [line 30] [def] [scope 31] [main]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{null}
!15 = metadata !{metadata !16}
!16 = metadata !{i32 786484, i32 0, null, metadata !"flag", metadata !"flag", metadata !"", metadata !5, i32 4, metadata !8, i32 0, i32 1, i64* @"'flag", null} ; [ DW_TAG_variable ] [flag] [line 4] [def]
!17 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!18 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!19 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!20 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777221, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 5]
!21 = metadata !{i32 5, i32 33, metadata !4, null}
!22 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554437, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [lower_bound] [line 5]
!23 = metadata !{i32 5, i32 50, metadata !4, null}
!24 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331653, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [upper_bound] [line 5]
!25 = metadata !{i32 5, i32 73, metadata !4, null}
!26 = metadata !{i32 6, i32 5, metadata !4, null}
!27 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 6, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [range] [line 6]
!28 = metadata !{i32 6, i32 15, metadata !4, null}
!29 = metadata !{i32 7, i32 9, metadata !30, null}
!30 = metadata !{i32 786443, metadata !1, metadata !4, i32 7, i32 9, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!31 = metadata !{i32 8, i32 9, metadata !32, null} ; [ DW_TAG_imported_declaration ]
!32 = metadata !{i32 786443, metadata !1, metadata !30, i32 7, i32 30, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!33 = metadata !{i32 10, i32 14, metadata !34, null}
!34 = metadata !{i32 786443, metadata !1, metadata !30, i32 10, i32 14, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!35 = metadata !{i32 11, i32 9, metadata !36, null}
!36 = metadata !{i32 786443, metadata !1, metadata !34, i32 10, i32 35, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!37 = metadata !{i32 14, i32 1, metadata !4, null}
!38 = metadata !{i64 0}
!39 = metadata !{i32 786688, metadata !9, metadata !"count", metadata !5, i32 18, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 18]
!40 = metadata !{i32 18, i32 13, metadata !9, null}
!41 = metadata !{i32 19, i32 7, metadata !42, null}
!42 = metadata !{i32 786443, metadata !1, metadata !9, i32 19, i32 7, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!43 = metadata !{i32 23, i32 12, metadata !9, null}
!44 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777221, metadata !8, i32 0, metadata !43} ; [ DW_TAG_arg_variable ] [value] [line 5]
!45 = metadata !{i32 5, i32 33, metadata !4, metadata !43}
!46 = metadata !{i64 -2147483648}
!47 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554437, metadata !8, i32 0, metadata !43} ; [ DW_TAG_arg_variable ] [lower_bound] [line 5]
!48 = metadata !{i32 5, i32 50, metadata !4, metadata !43}
!49 = metadata !{i64 2147483647}
!50 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331653, metadata !8, i32 0, metadata !43} ; [ DW_TAG_arg_variable ] [upper_bound] [line 5]
!51 = metadata !{i32 5, i32 73, metadata !4, metadata !43}
!52 = metadata !{i64 4294967296}
!53 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 6, metadata !8, i32 0, metadata !43} ; [ DW_TAG_auto_variable ] [range] [line 6]
!54 = metadata !{i32 6, i32 15, metadata !4, metadata !43}
!55 = metadata !{i32 7, i32 9, metadata !30, metadata !43}
!56 = metadata !{i32 8, i32 9, metadata !32, metadata !43} ; [ DW_TAG_imported_declaration ]
!57 = metadata !{i32 10, i32 14, metadata !34, metadata !43}
!58 = metadata !{i32 11, i32 9, metadata !36, metadata !43}
!59 = metadata !{i32 24, i32 3, metadata !9, null}
!60 = metadata !{i32 786688, metadata !9, metadata !"__retres", metadata !5, i32 17, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__retres] [line 17]
!61 = metadata !{i32 17, i32 13, metadata !9, null}
!62 = metadata !{i32 26, i32 3, metadata !9, null}
!63 = metadata !{i32 27, i32 17, metadata !9, null}
!64 = metadata !{i32 786688, metadata !12, metadata !"pos", metadata !5, i32 32, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pos] [line 32]
!65 = metadata !{i32 32, i32 13, metadata !12, null}
!66 = metadata !{i64 1}
!67 = metadata !{i32 786688, metadata !12, metadata !"size", metadata !5, i32 33, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [size] [line 33]
!68 = metadata !{i32 33, i32 13, metadata !12, null}
!69 = metadata !{i32 34, i32 3, metadata !12, null}
!70 = metadata !{i32 35, i32 7, metadata !71, null}
!71 = metadata !{i32 786443, metadata !1, metadata !12, i32 35, i32 7, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!72 = metadata !{i32 39, i32 9, metadata !73, null}
!73 = metadata !{i32 786443, metadata !1, metadata !71, i32 39, i32 9, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!74 = metadata !{i32 42, i32 3, metadata !75, null}
!75 = metadata !{i32 786443, metadata !1, metadata !12, i32 42, i32 3, i32 1, i32 11} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!76 = metadata !{i32 19, i32 7, metadata !42, metadata !77}
!77 = metadata !{i32 43, i32 20, metadata !78, null}
!78 = metadata !{i32 786443, metadata !1, metadata !12, i32 42, i32 22, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!79 = metadata !{i32 24, i32 3, metadata !9, metadata !77}
!80 = metadata !{i32 26, i32 3, metadata !9, metadata !77}
!81 = metadata !{i32 44, i32 11, metadata !78, null}
!82 = metadata !{i32 7, i32 9, metadata !30, metadata !81}
!83 = metadata !{i32 8, i32 9, metadata !32, metadata !81} ; [ DW_TAG_imported_declaration ]
!84 = metadata !{i32 10, i32 14, metadata !34, metadata !81}
!85 = metadata !{i32 11, i32 9, metadata !36, metadata !81}
!86 = metadata !{i32 46, i32 17, metadata !12, null}

