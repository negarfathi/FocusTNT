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
define i64 @read_slice_1(i64 %loc, i64 %len) #0 {
read_slice_1_bb5:
  call void @llvm.dbg.value(metadata !{i64 %loc}, i64 0, metadata !38), !dbg !39
  call void @llvm.dbg.value(metadata !{i64 %len}, i64 0, metadata !40), !dbg !41
  call void @llvm.dbg.value(metadata !42, i64 0, metadata !43), !dbg !44
  %"12" = icmp slt i64 %loc, %len, !dbg !45
  br i1 %"12", label %read_slice_1_bb6, label %read_slice_1_wrap_around.exit, !dbg !45

read_slice_1_bb6:                                 ; preds = %read_slice_1_bb5
  %"13" = add nsw i64 0, 1, !dbg !47
  call void @llvm.dbg.value(metadata !{i64 %"13"}, i64 0, metadata !48), !dbg !49
  call void @llvm.dbg.value(metadata !50, i64 0, metadata !51), !dbg !52
  call void @llvm.dbg.value(metadata !53, i64 0, metadata !54), !dbg !55
  call void @llvm.dbg.value(metadata !56, i64 0, metadata !57), !dbg !58
  %"14" = icmp sgt i64 %"13", 2147483647, !dbg !59
  br i1 %"14", label %read_slice_1_bb7, label %read_slice_1_bb8, !dbg !59

read_slice_1_bb7:                                 ; preds = %read_slice_1_bb6
  %"15" = sub nsw i64 %"13", 2147483647, !dbg !60
  %"16" = sub nsw i64 %"15", 1, !dbg !60
  %"17" = srem i64 %"16", 4294967296, !dbg !60
  %"18" = add nsw i64 -2147483648, %"17", !dbg !60
  br label %read_slice_1_wrap_around.exit, !dbg !60

read_slice_1_bb8:                                 ; preds = %read_slice_1_bb6
  %"19" = icmp slt i64 %"13", -2147483648, !dbg !61
  br i1 %"19", label %read_slice_1_bb9, label %read_slice_1_wrap_around.exit, !dbg !61

read_slice_1_bb9:                                 ; preds = %read_slice_1_bb8
  %"20" = sub nsw i64 -2147483648, %"13", !dbg !62
  %"21" = sub nsw i64 %"20", 1, !dbg !62
  %"22" = srem i64 %"21", 4294967296, !dbg !62
  %"23" = sub nsw i64 2147483647, %"22", !dbg !62
  br label %read_slice_1_wrap_around.exit, !dbg !62

read_slice_1_wrap_around.exit:                    ; preds = %read_slice_1_bb5, %read_slice_1_bb9, %read_slice_1_bb8, %read_slice_1_bb7
  %__retres.0 = phi i64 [ %"18", %read_slice_1_bb7 ], [ %"23", %read_slice_1_bb9 ], [ %"13", %read_slice_1_bb8 ], [ 0, %read_slice_1_bb5 ]
  ret i64 %__retres.0, !dbg !63
}

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb10:
  call void @llvm.dbg.value(metadata !64, i64 0, metadata !65), !dbg !66
  call void @llvm.dbg.value(metadata !42, i64 0, metadata !67), !dbg !68
  call void @llvm.dbg.value(metadata !{i64 %buf.0}, i64 0, metadata !69), !dbg !72
  call void @llvm.dbg.value(metadata !{i64 %count.0}, i64 0, metadata !73), !dbg !74
  call void @llvm.dbg.value(metadata !42, i64 0, metadata !75), !dbg !76
  call void @llvm.dbg.value(metadata !77, i64 0, metadata !78), !dbg !80
  call void @llvm.dbg.value(metadata !50, i64 0, metadata !81), !dbg !82
  call void @llvm.dbg.value(metadata !53, i64 0, metadata !83), !dbg !84
  call void @llvm.dbg.value(metadata !56, i64 0, metadata !85), !dbg !86
  call void @llvm.dbg.value(metadata !{i64 %.}, i64 0, metadata !87), !dbg !88
  call void @llvm.dbg.value(metadata !{i64 %"26"}, i64 0, metadata !89), !dbg !91
  call void @llvm.dbg.value(metadata !50, i64 0, metadata !92), !dbg !93
  call void @llvm.dbg.value(metadata !53, i64 0, metadata !94), !dbg !95
  call void @llvm.dbg.value(metadata !56, i64 0, metadata !96), !dbg !97
  call void @llvm.dbg.value(metadata !{i64 %.0.i1}, i64 0, metadata !65), !dbg !66
  call void @llvm.dbg.value(metadata !{i64 %"37"}, i64 0, metadata !98), !dbg !100
  call void @llvm.dbg.value(metadata !50, i64 0, metadata !101), !dbg !102
  call void @llvm.dbg.value(metadata !53, i64 0, metadata !103), !dbg !104
  call void @llvm.dbg.value(metadata !56, i64 0, metadata !105), !dbg !106
  br label %main_wrap_around.exit, !dbg !107

main_wrap_around.exit:                            ; preds = %main_bb16, %main_bb15, %main_bb14, %main_bb10
  %buf.0 = phi i64 [ 0, %main_bb10 ], [ %"42", %main_bb14 ], [ %"47", %main_bb16 ], [ %"37", %main_bb15 ]
  %count.0 = phi i64 [ 3, %main_bb10 ], [ %.0.i1, %main_bb14 ], [ %.0.i1, %main_bb15 ], [ %.0.i1, %main_bb16 ]
  %"24" = icmp sgt i64 %count.0, 0, !dbg !108
  br i1 %"24", label %main_read_slice_1.exit, label %main_bb17, !dbg !108

main_read_slice_1.exit:                           ; preds = %main_wrap_around.exit
  %"25" = icmp slt i64 %buf.0, %count.0, !dbg !110
  %. = select i1 %"25", i64 1, i64 0, !dbg !110
  %"26" = sub nsw i64 %count.0, %., !dbg !90
  %"27" = icmp sgt i64 %"26", 2147483647, !dbg !111
  br i1 %"27", label %main_bb11, label %main_bb12, !dbg !111

main_bb11:                                        ; preds = %main_read_slice_1.exit
  %"28" = sub nsw i64 %"26", 2147483647, !dbg !112
  %"29" = sub nsw i64 %"28", 1, !dbg !112
  %"30" = srem i64 %"29", 4294967296, !dbg !112
  %"31" = add nsw i64 -2147483648, %"30", !dbg !112
  br label %main_wrap_around.exit2, !dbg !112

main_bb12:                                        ; preds = %main_read_slice_1.exit
  %"32" = icmp slt i64 %"26", -2147483648, !dbg !113
  br i1 %"32", label %main_bb13, label %main_wrap_around.exit2, !dbg !113

main_bb13:                                        ; preds = %main_bb12
  %"33" = sub nsw i64 -2147483648, %"26", !dbg !114
  %"34" = sub nsw i64 %"33", 1, !dbg !114
  %"35" = srem i64 %"34", 4294967296, !dbg !114
  %"36" = sub nsw i64 2147483647, %"35", !dbg !114
  br label %main_wrap_around.exit2, !dbg !114

main_wrap_around.exit2:                           ; preds = %main_bb11, %main_bb12, %main_bb13
  %.0.i1 = phi i64 [ %"31", %main_bb11 ], [ %"36", %main_bb13 ], [ %"26", %main_bb12 ], !dbg !90
  %"37" = add nsw i64 %buf.0, %., !dbg !99
  %"38" = icmp sgt i64 %"37", 2147483647, !dbg !115
  br i1 %"38", label %main_bb14, label %main_bb15, !dbg !115

main_bb14:                                        ; preds = %main_wrap_around.exit2
  %"39" = sub nsw i64 %"37", 2147483647, !dbg !116
  %"40" = sub nsw i64 %"39", 1, !dbg !116
  %"41" = srem i64 %"40", 4294967296, !dbg !116
  %"42" = add nsw i64 -2147483648, %"41", !dbg !116
  br label %main_wrap_around.exit, !dbg !116

main_bb15:                                        ; preds = %main_wrap_around.exit2
  %"43" = icmp slt i64 %"37", -2147483648, !dbg !117
  br i1 %"43", label %main_bb16, label %main_wrap_around.exit, !dbg !117

main_bb16:                                        ; preds = %main_bb15
  %"44" = sub nsw i64 -2147483648, %"37", !dbg !118
  %"45" = sub nsw i64 %"44", 1, !dbg !118
  %"46" = srem i64 %"45", 4294967296, !dbg !118
  %"47" = sub nsw i64 2147483647, %"46", !dbg !118
  br label %main_wrap_around.exit, !dbg !118

main_bb17:                                        ; preds = %main_wrap_around.exit
  ret void, !dbg !119
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
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"read_slice_1", metadata !"read_slice_1", metadata !"", i32 15, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i64, i64)* @read_slice_1, null, null, metadata !2, i32 16} ; [ DW_TAG_subprogram ] [line 15] [def] [scope 16] [read_slice_1]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !8, metadata !8, metadata !8}
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 29, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @main, null, null, metadata !2, i32 30} ; [ DW_TAG_subprogram ] [line 29] [def] [scope 30] [main]
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
!38 = metadata !{i32 786689, metadata !9, metadata !"loc", metadata !5, i32 16777231, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [loc] [line 15]
!39 = metadata !{i32 15, i32 34, metadata !9, null}
!40 = metadata !{i32 786689, metadata !9, metadata !"len", metadata !5, i32 33554447, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 15]
!41 = metadata !{i32 15, i32 49, metadata !9, null}
!42 = metadata !{i64 0}
!43 = metadata !{i32 786688, metadata !9, metadata !"count", metadata !5, i32 18, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 18]
!44 = metadata !{i32 18, i32 13, metadata !9, null}
!45 = metadata !{i32 19, i32 7, metadata !46, null}
!46 = metadata !{i32 786443, metadata !1, metadata !9, i32 19, i32 7, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!47 = metadata !{i32 22, i32 12, metadata !9, null}
!48 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777221, metadata !8, i32 0, metadata !47} ; [ DW_TAG_arg_variable ] [value] [line 5]
!49 = metadata !{i32 5, i32 33, metadata !4, metadata !47}
!50 = metadata !{i64 -2147483648}
!51 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554437, metadata !8, i32 0, metadata !47} ; [ DW_TAG_arg_variable ] [lower_bound] [line 5]
!52 = metadata !{i32 5, i32 50, metadata !4, metadata !47}
!53 = metadata !{i64 2147483647}
!54 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331653, metadata !8, i32 0, metadata !47} ; [ DW_TAG_arg_variable ] [upper_bound] [line 5]
!55 = metadata !{i32 5, i32 73, metadata !4, metadata !47}
!56 = metadata !{i64 4294967296}
!57 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 6, metadata !8, i32 0, metadata !47} ; [ DW_TAG_auto_variable ] [range] [line 6]
!58 = metadata !{i32 6, i32 15, metadata !4, metadata !47}
!59 = metadata !{i32 7, i32 9, metadata !30, metadata !47}
!60 = metadata !{i32 8, i32 9, metadata !32, metadata !47} ; [ DW_TAG_imported_declaration ]
!61 = metadata !{i32 10, i32 14, metadata !34, metadata !47}
!62 = metadata !{i32 11, i32 9, metadata !36, metadata !47}
!63 = metadata !{i32 26, i32 17, metadata !9, null}
!64 = metadata !{i64 3}
!65 = metadata !{i32 786688, metadata !12, metadata !"count", metadata !5, i32 32, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 32]
!66 = metadata !{i32 32, i32 13, metadata !12, null}
!67 = metadata !{i32 786688, metadata !12, metadata !"buf", metadata !5, i32 33, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [buf] [line 33]
!68 = metadata !{i32 33, i32 13, metadata !12, null}
!69 = metadata !{i32 786689, metadata !9, metadata !"loc", metadata !5, i32 16777231, metadata !8, i32 0, metadata !70} ; [ DW_TAG_arg_variable ] [loc] [line 15]
!70 = metadata !{i32 35, i32 11, metadata !71, null}
!71 = metadata !{i32 786443, metadata !1, metadata !12, i32 34, i32 21, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!72 = metadata !{i32 15, i32 34, metadata !9, metadata !70}
!73 = metadata !{i32 786689, metadata !9, metadata !"len", metadata !5, i32 33554447, metadata !8, i32 0, metadata !70} ; [ DW_TAG_arg_variable ] [len] [line 15]
!74 = metadata !{i32 15, i32 49, metadata !9, metadata !70}
!75 = metadata !{i32 786688, metadata !9, metadata !"count", metadata !5, i32 18, metadata !8, i32 0, metadata !70} ; [ DW_TAG_auto_variable ] [count] [line 18]
!76 = metadata !{i32 18, i32 13, metadata !9, metadata !70}
!77 = metadata !{i64 1}
!78 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777221, metadata !8, i32 0, metadata !79} ; [ DW_TAG_arg_variable ] [value] [line 5]
!79 = metadata !{i32 22, i32 12, metadata !9, metadata !70}
!80 = metadata !{i32 5, i32 33, metadata !4, metadata !79}
!81 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554437, metadata !8, i32 0, metadata !79} ; [ DW_TAG_arg_variable ] [lower_bound] [line 5]
!82 = metadata !{i32 5, i32 50, metadata !4, metadata !79}
!83 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331653, metadata !8, i32 0, metadata !79} ; [ DW_TAG_arg_variable ] [upper_bound] [line 5]
!84 = metadata !{i32 5, i32 73, metadata !4, metadata !79}
!85 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 6, metadata !8, i32 0, metadata !79} ; [ DW_TAG_auto_variable ] [range] [line 6]
!86 = metadata !{i32 6, i32 15, metadata !4, metadata !79}
!87 = metadata !{i32 786688, metadata !12, metadata !"ret", metadata !5, i32 31, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ret] [line 31]
!88 = metadata !{i32 31, i32 13, metadata !12, null}
!89 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777221, metadata !8, i32 0, metadata !90} ; [ DW_TAG_arg_variable ] [value] [line 5]
!90 = metadata !{i32 36, i32 13, metadata !71, null}
!91 = metadata !{i32 5, i32 33, metadata !4, metadata !90}
!92 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554437, metadata !8, i32 0, metadata !90} ; [ DW_TAG_arg_variable ] [lower_bound] [line 5]
!93 = metadata !{i32 5, i32 50, metadata !4, metadata !90}
!94 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331653, metadata !8, i32 0, metadata !90} ; [ DW_TAG_arg_variable ] [upper_bound] [line 5]
!95 = metadata !{i32 5, i32 73, metadata !4, metadata !90}
!96 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 6, metadata !8, i32 0, metadata !90} ; [ DW_TAG_auto_variable ] [range] [line 6]
!97 = metadata !{i32 6, i32 15, metadata !4, metadata !90}
!98 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777221, metadata !8, i32 0, metadata !99} ; [ DW_TAG_arg_variable ] [value] [line 5]
!99 = metadata !{i32 37, i32 11, metadata !71, null}
!100 = metadata !{i32 5, i32 33, metadata !4, metadata !99}
!101 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554437, metadata !8, i32 0, metadata !99} ; [ DW_TAG_arg_variable ] [lower_bound] [line 5]
!102 = metadata !{i32 5, i32 50, metadata !4, metadata !99}
!103 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331653, metadata !8, i32 0, metadata !99} ; [ DW_TAG_arg_variable ] [upper_bound] [line 5]
!104 = metadata !{i32 5, i32 73, metadata !4, metadata !99}
!105 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 6, metadata !8, i32 0, metadata !99} ; [ DW_TAG_auto_variable ] [range] [line 6]
!106 = metadata !{i32 6, i32 15, metadata !4, metadata !99}
!107 = metadata !{i32 34, i32 3, metadata !12, null}
!108 = metadata !{i32 34, i32 3, metadata !109, null}
!109 = metadata !{i32 786443, metadata !1, metadata !12, i32 34, i32 3, i32 1, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!110 = metadata !{i32 19, i32 7, metadata !46, metadata !70}
!111 = metadata !{i32 7, i32 9, metadata !30, metadata !90}
!112 = metadata !{i32 8, i32 9, metadata !32, metadata !90} ; [ DW_TAG_imported_declaration ]
!113 = metadata !{i32 10, i32 14, metadata !34, metadata !90}
!114 = metadata !{i32 11, i32 9, metadata !36, metadata !90}
!115 = metadata !{i32 7, i32 9, metadata !30, metadata !99}
!116 = metadata !{i32 8, i32 9, metadata !32, metadata !99} ; [ DW_TAG_imported_declaration ]
!117 = metadata !{i32 10, i32 14, metadata !34, metadata !99}
!118 = metadata !{i32 11, i32 9, metadata !36, metadata !99}
!119 = metadata !{i32 39, i32 3, metadata !12, null}

