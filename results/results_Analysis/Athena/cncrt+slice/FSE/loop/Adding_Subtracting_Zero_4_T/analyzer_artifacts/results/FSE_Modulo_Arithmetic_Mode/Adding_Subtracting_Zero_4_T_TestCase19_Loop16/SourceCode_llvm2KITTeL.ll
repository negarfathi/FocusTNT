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
  call void @llvm.dbg.value(metadata !42, i64 0, metadata !69), !dbg !70
  call void @llvm.dbg.value(metadata !{i64 %buf.0}, i64 0, metadata !71), !dbg !74
  call void @llvm.dbg.value(metadata !{i64 %count.0}, i64 0, metadata !75), !dbg !76
  call void @llvm.dbg.value(metadata !42, i64 0, metadata !77), !dbg !78
  call void @llvm.dbg.value(metadata !79, i64 0, metadata !80), !dbg !82
  call void @llvm.dbg.value(metadata !50, i64 0, metadata !83), !dbg !84
  call void @llvm.dbg.value(metadata !53, i64 0, metadata !85), !dbg !86
  call void @llvm.dbg.value(metadata !56, i64 0, metadata !87), !dbg !88
  call void @llvm.dbg.value(metadata !{i64 %.}, i64 0, metadata !89), !dbg !90
  call void @llvm.dbg.value(metadata !{i64 %tries.0}, i64 0, metadata !91), !dbg !95
  call void @llvm.dbg.value(metadata !{i64 %"27"}, i64 0, metadata !96), !dbg !98
  call void @llvm.dbg.value(metadata !50, i64 0, metadata !99), !dbg !100
  call void @llvm.dbg.value(metadata !53, i64 0, metadata !101), !dbg !102
  call void @llvm.dbg.value(metadata !56, i64 0, metadata !103), !dbg !104
  call void @llvm.dbg.value(metadata !{i64 %.0.i3}, i64 0, metadata !69), !dbg !70
  call void @llvm.dbg.value(metadata !{i64 %"39"}, i64 0, metadata !105), !dbg !107
  call void @llvm.dbg.value(metadata !50, i64 0, metadata !108), !dbg !109
  call void @llvm.dbg.value(metadata !53, i64 0, metadata !110), !dbg !111
  call void @llvm.dbg.value(metadata !56, i64 0, metadata !112), !dbg !113
  call void @llvm.dbg.value(metadata !{i64 %.0.i1}, i64 0, metadata !65), !dbg !66
  call void @llvm.dbg.value(metadata !{i64 %"50"}, i64 0, metadata !114), !dbg !116
  call void @llvm.dbg.value(metadata !50, i64 0, metadata !117), !dbg !118
  call void @llvm.dbg.value(metadata !53, i64 0, metadata !119), !dbg !120
  call void @llvm.dbg.value(metadata !56, i64 0, metadata !121), !dbg !122
  br label %main_wrap_around.exit, !dbg !123

main_wrap_around.exit:                            ; preds = %main_bb21, %main_bb20, %main_bb19, %main_wrap_around.exit4, %main_bb10
  %tries.0 = phi i64 [ 0, %main_bb10 ], [ %.0.i3, %main_wrap_around.exit4 ], [ %tries.0, %main_bb19 ], [ %tries.0, %main_bb20 ], [ %tries.0, %main_bb21 ]
  %buf.0 = phi i64 [ 0, %main_bb10 ], [ %buf.0, %main_wrap_around.exit4 ], [ %"55", %main_bb19 ], [ %"60", %main_bb21 ], [ %"50", %main_bb20 ]
  %count.0 = phi i64 [ 7, %main_bb10 ], [ %count.0, %main_wrap_around.exit4 ], [ %.0.i1, %main_bb19 ], [ %.0.i1, %main_bb20 ], [ %.0.i1, %main_bb21 ]
  %"24" = icmp sgt i64 %count.0, 0, !dbg !124
  br i1 %"24", label %main_read_slice_1.exit, label %main_bb22, !dbg !124

main_read_slice_1.exit:                           ; preds = %main_wrap_around.exit
  %"25" = icmp slt i64 %buf.0, %count.0, !dbg !126
  %. = select i1 %"25", i64 1, i64 0, !dbg !126
  %"26" = icmp sle i64 %., 0, !dbg !127
  br i1 %"26", label %main_bb11, label %main_bb15, !dbg !127

main_bb11:                                        ; preds = %main_read_slice_1.exit
  %"27" = add nsw i64 %tries.0, 1, !dbg !97
  %"28" = icmp sgt i64 %"27", 2147483647, !dbg !128
  br i1 %"28", label %main_bb12, label %main_bb13, !dbg !128

main_bb12:                                        ; preds = %main_bb11
  %"29" = sub nsw i64 %"27", 2147483647, !dbg !129
  %"30" = sub nsw i64 %"29", 1, !dbg !129
  %"31" = srem i64 %"30", 4294967296, !dbg !129
  %"32" = add nsw i64 -2147483648, %"31", !dbg !129
  br label %main_wrap_around.exit4, !dbg !129

main_bb13:                                        ; preds = %main_bb11
  %"33" = icmp slt i64 %"27", -2147483648, !dbg !130
  br i1 %"33", label %main_bb14, label %main_wrap_around.exit4, !dbg !130

main_bb14:                                        ; preds = %main_bb13
  %"34" = sub nsw i64 -2147483648, %"27", !dbg !131
  %"35" = sub nsw i64 %"34", 1, !dbg !131
  %"36" = srem i64 %"35", 4294967296, !dbg !131
  %"37" = sub nsw i64 2147483647, %"36", !dbg !131
  br label %main_wrap_around.exit4, !dbg !131

main_wrap_around.exit4:                           ; preds = %main_bb12, %main_bb13, %main_bb14
  %.0.i3 = phi i64 [ %"32", %main_bb12 ], [ %"37", %main_bb14 ], [ %"27", %main_bb13 ], !dbg !97
  %"38" = icmp slt i64 %tries.0, 5, !dbg !132
  br i1 %"38", label %main_wrap_around.exit, label %main_bb22, !dbg !132

main_bb15:                                        ; preds = %main_read_slice_1.exit
  %"39" = sub nsw i64 %count.0, %., !dbg !106
  %"40" = icmp sgt i64 %"39", 2147483647, !dbg !134
  br i1 %"40", label %main_bb16, label %main_bb17, !dbg !134

main_bb16:                                        ; preds = %main_bb15
  %"41" = sub nsw i64 %"39", 2147483647, !dbg !135
  %"42" = sub nsw i64 %"41", 1, !dbg !135
  %"43" = srem i64 %"42", 4294967296, !dbg !135
  %"44" = add nsw i64 -2147483648, %"43", !dbg !135
  br label %main_wrap_around.exit2, !dbg !135

main_bb17:                                        ; preds = %main_bb15
  %"45" = icmp slt i64 %"39", -2147483648, !dbg !136
  br i1 %"45", label %main_bb18, label %main_wrap_around.exit2, !dbg !136

main_bb18:                                        ; preds = %main_bb17
  %"46" = sub nsw i64 -2147483648, %"39", !dbg !137
  %"47" = sub nsw i64 %"46", 1, !dbg !137
  %"48" = srem i64 %"47", 4294967296, !dbg !137
  %"49" = sub nsw i64 2147483647, %"48", !dbg !137
  br label %main_wrap_around.exit2, !dbg !137

main_wrap_around.exit2:                           ; preds = %main_bb16, %main_bb17, %main_bb18
  %.0.i1 = phi i64 [ %"44", %main_bb16 ], [ %"49", %main_bb18 ], [ %"39", %main_bb17 ], !dbg !106
  %"50" = add nsw i64 %buf.0, %., !dbg !115
  %"51" = icmp sgt i64 %"50", 2147483647, !dbg !138
  br i1 %"51", label %main_bb19, label %main_bb20, !dbg !138

main_bb19:                                        ; preds = %main_wrap_around.exit2
  %"52" = sub nsw i64 %"50", 2147483647, !dbg !139
  %"53" = sub nsw i64 %"52", 1, !dbg !139
  %"54" = srem i64 %"53", 4294967296, !dbg !139
  %"55" = add nsw i64 -2147483648, %"54", !dbg !139
  br label %main_wrap_around.exit, !dbg !139

main_bb20:                                        ; preds = %main_wrap_around.exit2
  %"56" = icmp slt i64 %"50", -2147483648, !dbg !140
  br i1 %"56", label %main_bb21, label %main_wrap_around.exit, !dbg !140

main_bb21:                                        ; preds = %main_bb20
  %"57" = sub nsw i64 -2147483648, %"50", !dbg !141
  %"58" = sub nsw i64 %"57", 1, !dbg !141
  %"59" = srem i64 %"58", 4294967296, !dbg !141
  %"60" = sub nsw i64 2147483647, %"59", !dbg !141
  br label %main_wrap_around.exit, !dbg !141

main_bb22:                                        ; preds = %main_wrap_around.exit, %main_wrap_around.exit4
  ret void, !dbg !142
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
!64 = metadata !{i64 7}
!65 = metadata !{i32 786688, metadata !12, metadata !"count", metadata !5, i32 32, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 32]
!66 = metadata !{i32 32, i32 13, metadata !12, null}
!67 = metadata !{i32 786688, metadata !12, metadata !"buf", metadata !5, i32 33, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [buf] [line 33]
!68 = metadata !{i32 33, i32 13, metadata !12, null}
!69 = metadata !{i32 786688, metadata !12, metadata !"tries", metadata !5, i32 34, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tries] [line 34]
!70 = metadata !{i32 34, i32 13, metadata !12, null}
!71 = metadata !{i32 786689, metadata !9, metadata !"loc", metadata !5, i32 16777231, metadata !8, i32 0, metadata !72} ; [ DW_TAG_arg_variable ] [loc] [line 15]
!72 = metadata !{i32 36, i32 11, metadata !73, null}
!73 = metadata !{i32 786443, metadata !1, metadata !12, i32 35, i32 21, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!74 = metadata !{i32 15, i32 34, metadata !9, metadata !72}
!75 = metadata !{i32 786689, metadata !9, metadata !"len", metadata !5, i32 33554447, metadata !8, i32 0, metadata !72} ; [ DW_TAG_arg_variable ] [len] [line 15]
!76 = metadata !{i32 15, i32 49, metadata !9, metadata !72}
!77 = metadata !{i32 786688, metadata !9, metadata !"count", metadata !5, i32 18, metadata !8, i32 0, metadata !72} ; [ DW_TAG_auto_variable ] [count] [line 18]
!78 = metadata !{i32 18, i32 13, metadata !9, metadata !72}
!79 = metadata !{i64 1}
!80 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777221, metadata !8, i32 0, metadata !81} ; [ DW_TAG_arg_variable ] [value] [line 5]
!81 = metadata !{i32 22, i32 12, metadata !9, metadata !72}
!82 = metadata !{i32 5, i32 33, metadata !4, metadata !81}
!83 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554437, metadata !8, i32 0, metadata !81} ; [ DW_TAG_arg_variable ] [lower_bound] [line 5]
!84 = metadata !{i32 5, i32 50, metadata !4, metadata !81}
!85 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331653, metadata !8, i32 0, metadata !81} ; [ DW_TAG_arg_variable ] [upper_bound] [line 5]
!86 = metadata !{i32 5, i32 73, metadata !4, metadata !81}
!87 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 6, metadata !8, i32 0, metadata !81} ; [ DW_TAG_auto_variable ] [range] [line 6]
!88 = metadata !{i32 6, i32 15, metadata !4, metadata !81}
!89 = metadata !{i32 786688, metadata !12, metadata !"ret", metadata !5, i32 31, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ret] [line 31]
!90 = metadata !{i32 31, i32 13, metadata !12, null}
!91 = metadata !{i32 786688, metadata !92, metadata !"tmp", metadata !5, i32 39, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmp] [line 39]
!92 = metadata !{i32 786443, metadata !1, metadata !93, i32 38, i32 7, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!93 = metadata !{i32 786443, metadata !1, metadata !94, i32 37, i32 19, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!94 = metadata !{i32 786443, metadata !1, metadata !73, i32 37, i32 9, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!95 = metadata !{i32 39, i32 19, metadata !92, null}
!96 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777221, metadata !8, i32 0, metadata !97} ; [ DW_TAG_arg_variable ] [value] [line 5]
!97 = metadata !{i32 41, i32 18, metadata !92, null}
!98 = metadata !{i32 5, i32 33, metadata !4, metadata !97}
!99 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554437, metadata !8, i32 0, metadata !97} ; [ DW_TAG_arg_variable ] [lower_bound] [line 5]
!100 = metadata !{i32 5, i32 50, metadata !4, metadata !97}
!101 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331653, metadata !8, i32 0, metadata !97} ; [ DW_TAG_arg_variable ] [upper_bound] [line 5]
!102 = metadata !{i32 5, i32 73, metadata !4, metadata !97}
!103 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 6, metadata !8, i32 0, metadata !97} ; [ DW_TAG_auto_variable ] [range] [line 6]
!104 = metadata !{i32 6, i32 15, metadata !4, metadata !97}
!105 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777221, metadata !8, i32 0, metadata !106} ; [ DW_TAG_arg_variable ] [value] [line 5]
!106 = metadata !{i32 48, i32 13, metadata !73, null}
!107 = metadata !{i32 5, i32 33, metadata !4, metadata !106}
!108 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554437, metadata !8, i32 0, metadata !106} ; [ DW_TAG_arg_variable ] [lower_bound] [line 5]
!109 = metadata !{i32 5, i32 50, metadata !4, metadata !106}
!110 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331653, metadata !8, i32 0, metadata !106} ; [ DW_TAG_arg_variable ] [upper_bound] [line 5]
!111 = metadata !{i32 5, i32 73, metadata !4, metadata !106}
!112 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 6, metadata !8, i32 0, metadata !106} ; [ DW_TAG_auto_variable ] [range] [line 6]
!113 = metadata !{i32 6, i32 15, metadata !4, metadata !106}
!114 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777221, metadata !8, i32 0, metadata !115} ; [ DW_TAG_arg_variable ] [value] [line 5]
!115 = metadata !{i32 49, i32 11, metadata !73, null}
!116 = metadata !{i32 5, i32 33, metadata !4, metadata !115}
!117 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554437, metadata !8, i32 0, metadata !115} ; [ DW_TAG_arg_variable ] [lower_bound] [line 5]
!118 = metadata !{i32 5, i32 50, metadata !4, metadata !115}
!119 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331653, metadata !8, i32 0, metadata !115} ; [ DW_TAG_arg_variable ] [upper_bound] [line 5]
!120 = metadata !{i32 5, i32 73, metadata !4, metadata !115}
!121 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 6, metadata !8, i32 0, metadata !115} ; [ DW_TAG_auto_variable ] [range] [line 6]
!122 = metadata !{i32 6, i32 15, metadata !4, metadata !115}
!123 = metadata !{i32 35, i32 3, metadata !12, null}
!124 = metadata !{i32 35, i32 3, metadata !125, null}
!125 = metadata !{i32 786443, metadata !1, metadata !12, i32 35, i32 3, i32 1, i32 12} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!126 = metadata !{i32 19, i32 7, metadata !46, metadata !72}
!127 = metadata !{i32 37, i32 9, metadata !94, null}
!128 = metadata !{i32 7, i32 9, metadata !30, metadata !97}
!129 = metadata !{i32 8, i32 9, metadata !32, metadata !97} ; [ DW_TAG_imported_declaration ]
!130 = metadata !{i32 10, i32 14, metadata !34, metadata !97}
!131 = metadata !{i32 11, i32 9, metadata !36, metadata !97}
!132 = metadata !{i32 42, i32 13, metadata !133, null}
!133 = metadata !{i32 786443, metadata !1, metadata !92, i32 42, i32 13, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!134 = metadata !{i32 7, i32 9, metadata !30, metadata !106}
!135 = metadata !{i32 8, i32 9, metadata !32, metadata !106} ; [ DW_TAG_imported_declaration ]
!136 = metadata !{i32 10, i32 14, metadata !34, metadata !106}
!137 = metadata !{i32 11, i32 9, metadata !36, metadata !106}
!138 = metadata !{i32 7, i32 9, metadata !30, metadata !115}
!139 = metadata !{i32 8, i32 9, metadata !32, metadata !115} ; [ DW_TAG_imported_declaration ]
!140 = metadata !{i32 10, i32 14, metadata !34, metadata !115}
!141 = metadata !{i32 11, i32 9, metadata !36, metadata !115}
!142 = metadata !{i32 51, i32 17, metadata !12, null}

