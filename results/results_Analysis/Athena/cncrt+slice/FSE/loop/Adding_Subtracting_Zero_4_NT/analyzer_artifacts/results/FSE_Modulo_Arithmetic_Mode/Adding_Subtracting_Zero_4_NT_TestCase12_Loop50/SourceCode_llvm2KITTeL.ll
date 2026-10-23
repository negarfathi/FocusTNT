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
  %"12" = load i64* @"'flag", align 8, !dbg !45
  %"13" = icmp ne i64 %"12", 1, !dbg !45
  %"14" = icmp slt i64 %loc, %len, !dbg !47
  %or.cond = and i1 %"13", %"14", !dbg !45
  br i1 %or.cond, label %read_slice_1_bb6, label %read_slice_1_bb10, !dbg !45

read_slice_1_bb6:                                 ; preds = %read_slice_1_bb5
  %"15" = add nsw i64 0, 1, !dbg !49
  call void @llvm.dbg.value(metadata !{i64 %"15"}, i64 0, metadata !50), !dbg !51
  call void @llvm.dbg.value(metadata !52, i64 0, metadata !53), !dbg !54
  call void @llvm.dbg.value(metadata !55, i64 0, metadata !56), !dbg !57
  call void @llvm.dbg.value(metadata !58, i64 0, metadata !59), !dbg !60
  %"16" = icmp sgt i64 %"15", 2147483647, !dbg !61
  br i1 %"16", label %read_slice_1_bb7, label %read_slice_1_bb8, !dbg !61

read_slice_1_bb7:                                 ; preds = %read_slice_1_bb6
  %"17" = sub nsw i64 %"15", 2147483647, !dbg !62
  %"18" = sub nsw i64 %"17", 1, !dbg !62
  %"19" = srem i64 %"18", 4294967296, !dbg !62
  %"20" = add nsw i64 -2147483648, %"19", !dbg !62
  br label %read_slice_1_wrap_around.exit, !dbg !62

read_slice_1_bb8:                                 ; preds = %read_slice_1_bb6
  %"21" = icmp slt i64 %"15", -2147483648, !dbg !63
  br i1 %"21", label %read_slice_1_bb9, label %read_slice_1_wrap_around.exit, !dbg !63

read_slice_1_bb9:                                 ; preds = %read_slice_1_bb8
  %"22" = sub nsw i64 -2147483648, %"15", !dbg !64
  %"23" = sub nsw i64 %"22", 1, !dbg !64
  %"24" = srem i64 %"23", 4294967296, !dbg !64
  %"25" = sub nsw i64 2147483647, %"24", !dbg !64
  br label %read_slice_1_wrap_around.exit, !dbg !64

read_slice_1_wrap_around.exit:                    ; preds = %read_slice_1_bb7, %read_slice_1_bb8, %read_slice_1_bb9
  %.0.i = phi i64 [ %"20", %read_slice_1_bb7 ], [ %"25", %read_slice_1_bb9 ], [ %"15", %read_slice_1_bb8 ], !dbg !49
  call void @llvm.dbg.value(metadata !{i64 %.0.i}, i64 0, metadata !43), !dbg !44
  store i64 1, i64* @"'flag", align 8, !dbg !65
  call void @llvm.dbg.value(metadata !{i64 %.0.i}, i64 0, metadata !66), !dbg !67
  br label %read_slice_1_bb10, !dbg !68

read_slice_1_bb10:                                ; preds = %read_slice_1_bb5, %read_slice_1_wrap_around.exit
  %__retres.0 = phi i64 [ %.0.i, %read_slice_1_wrap_around.exit ], [ 0, %read_slice_1_bb5 ]
  ret i64 %__retres.0, !dbg !69
}

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb11:
  call void @llvm.dbg.value(metadata !70, i64 0, metadata !71), !dbg !72
  %"26" = icmp sle i64 2, 0, !dbg !73
  br i1 %"26", label %main_bb20, label %main_wrap_around.exit, !dbg !73

main_wrap_around.exit:                            ; preds = %main_bb19, %main_bb18, %main_bb17, %main_bb11
  %buf.0 = phi i64 [ 0, %main_bb11 ], [ %"47", %main_bb17 ], [ %"52", %main_bb19 ], [ %"42", %main_bb18 ]
  %count.0 = phi i64 [ 2, %main_bb11 ], [ %.0.i1, %main_bb17 ], [ %.0.i1, %main_bb18 ], [ %.0.i1, %main_bb19 ]
  %"27" = icmp sgt i64 %count.0, 0, !dbg !75
  br i1 %"27", label %main_bb12, label %main_bb20, !dbg !75

main_bb12:                                        ; preds = %main_wrap_around.exit
  %"28" = load i64* @"'flag", align 8, !dbg !77
  %"29" = icmp ne i64 %"28", 1, !dbg !77
  %"30" = icmp slt i64 %buf.0, %count.0, !dbg !80
  %or.cond.i = and i1 %"29", %"30", !dbg !77
  br i1 %or.cond.i, label %main_bb13, label %main_read_slice_1.exit, !dbg !77

main_bb13:                                        ; preds = %main_bb12
  store i64 1, i64* @"'flag", align 8, !dbg !81
  br label %main_read_slice_1.exit, !dbg !82

main_read_slice_1.exit:                           ; preds = %main_bb12, %main_bb13
  %__retres.0.i = phi i64 [ 1, %main_bb13 ], [ 0, %main_bb12 ], !dbg !78
  %"31" = sub nsw i64 %count.0, %__retres.0.i, !dbg !83
  %"32" = icmp sgt i64 %"31", 2147483647, !dbg !84
  br i1 %"32", label %main_bb14, label %main_bb15, !dbg !84

main_bb14:                                        ; preds = %main_read_slice_1.exit
  %"33" = sub nsw i64 %"31", 2147483647, !dbg !85
  %"34" = sub nsw i64 %"33", 1, !dbg !85
  %"35" = srem i64 %"34", 4294967296, !dbg !85
  %"36" = add nsw i64 -2147483648, %"35", !dbg !85
  br label %main_wrap_around.exit2, !dbg !85

main_bb15:                                        ; preds = %main_read_slice_1.exit
  %"37" = icmp slt i64 %"31", -2147483648, !dbg !86
  br i1 %"37", label %main_bb16, label %main_wrap_around.exit2, !dbg !86

main_bb16:                                        ; preds = %main_bb15
  %"38" = sub nsw i64 -2147483648, %"31", !dbg !87
  %"39" = sub nsw i64 %"38", 1, !dbg !87
  %"40" = srem i64 %"39", 4294967296, !dbg !87
  %"41" = sub nsw i64 2147483647, %"40", !dbg !87
  br label %main_wrap_around.exit2, !dbg !87

main_wrap_around.exit2:                           ; preds = %main_bb14, %main_bb15, %main_bb16
  %.0.i1 = phi i64 [ %"36", %main_bb14 ], [ %"41", %main_bb16 ], [ %"31", %main_bb15 ], !dbg !83
  %"42" = add nsw i64 %buf.0, %__retres.0.i, !dbg !88
  %"43" = icmp sgt i64 %"42", 2147483647, !dbg !89
  br i1 %"43", label %main_bb17, label %main_bb18, !dbg !89

main_bb17:                                        ; preds = %main_wrap_around.exit2
  %"44" = sub nsw i64 %"42", 2147483647, !dbg !90
  %"45" = sub nsw i64 %"44", 1, !dbg !90
  %"46" = srem i64 %"45", 4294967296, !dbg !90
  %"47" = add nsw i64 -2147483648, %"46", !dbg !90
  br label %main_wrap_around.exit, !dbg !90

main_bb18:                                        ; preds = %main_wrap_around.exit2
  %"48" = icmp slt i64 %"42", -2147483648, !dbg !91
  br i1 %"48", label %main_bb19, label %main_wrap_around.exit, !dbg !91

main_bb19:                                        ; preds = %main_bb18
  %"49" = sub nsw i64 -2147483648, %"42", !dbg !92
  %"50" = sub nsw i64 %"49", 1, !dbg !92
  %"51" = srem i64 %"50", 4294967296, !dbg !92
  %"52" = sub nsw i64 2147483647, %"51", !dbg !92
  br label %main_wrap_around.exit, !dbg !92

main_bb20:                                        ; preds = %main_wrap_around.exit, %main_bb11
  ret void, !dbg !93
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
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 34, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @main, null, null, metadata !2, i32 35} ; [ DW_TAG_subprogram ] [line 34] [def] [scope 35] [main]
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
!47 = metadata !{i32 23, i32 7, metadata !48, null}
!48 = metadata !{i32 786443, metadata !1, metadata !9, i32 23, i32 7, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!49 = metadata !{i32 26, i32 12, metadata !9, null}
!50 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777221, metadata !8, i32 0, metadata !49} ; [ DW_TAG_arg_variable ] [value] [line 5]
!51 = metadata !{i32 5, i32 33, metadata !4, metadata !49}
!52 = metadata !{i64 -2147483648}
!53 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554437, metadata !8, i32 0, metadata !49} ; [ DW_TAG_arg_variable ] [lower_bound] [line 5]
!54 = metadata !{i32 5, i32 50, metadata !4, metadata !49}
!55 = metadata !{i64 2147483647}
!56 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331653, metadata !8, i32 0, metadata !49} ; [ DW_TAG_arg_variable ] [upper_bound] [line 5]
!57 = metadata !{i32 5, i32 73, metadata !4, metadata !49}
!58 = metadata !{i64 4294967296}
!59 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 6, metadata !8, i32 0, metadata !49} ; [ DW_TAG_auto_variable ] [range] [line 6]
!60 = metadata !{i32 6, i32 15, metadata !4, metadata !49}
!61 = metadata !{i32 7, i32 9, metadata !30, metadata !49}
!62 = metadata !{i32 8, i32 9, metadata !32, metadata !49} ; [ DW_TAG_imported_declaration ]
!63 = metadata !{i32 10, i32 14, metadata !34, metadata !49}
!64 = metadata !{i32 11, i32 9, metadata !36, metadata !49}
!65 = metadata !{i32 27, i32 3, metadata !9, null}
!66 = metadata !{i32 786688, metadata !9, metadata !"__retres", metadata !5, i32 17, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__retres] [line 17]
!67 = metadata !{i32 17, i32 13, metadata !9, null}
!68 = metadata !{i32 29, i32 3, metadata !9, null}
!69 = metadata !{i32 31, i32 17, metadata !9, null}
!70 = metadata !{i64 2}
!71 = metadata !{i32 786688, metadata !12, metadata !"count", metadata !5, i32 37, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 37]
!72 = metadata !{i32 37, i32 13, metadata !12, null}
!73 = metadata !{i32 38, i32 7, metadata !74, null}
!74 = metadata !{i32 786443, metadata !1, metadata !12, i32 38, i32 7, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!75 = metadata !{i32 42, i32 3, metadata !76, null}
!76 = metadata !{i32 786443, metadata !1, metadata !12, i32 42, i32 3, i32 1, i32 11} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!77 = metadata !{i32 19, i32 7, metadata !46, metadata !78}
!78 = metadata !{i32 43, i32 11, metadata !79, null}
!79 = metadata !{i32 786443, metadata !1, metadata !12, i32 42, i32 21, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!80 = metadata !{i32 23, i32 7, metadata !48, metadata !78}
!81 = metadata !{i32 27, i32 3, metadata !9, metadata !78}
!82 = metadata !{i32 29, i32 3, metadata !9, metadata !78}
!83 = metadata !{i32 44, i32 13, metadata !79, null}
!84 = metadata !{i32 7, i32 9, metadata !30, metadata !83}
!85 = metadata !{i32 8, i32 9, metadata !32, metadata !83} ; [ DW_TAG_imported_declaration ]
!86 = metadata !{i32 10, i32 14, metadata !34, metadata !83}
!87 = metadata !{i32 11, i32 9, metadata !36, metadata !83}
!88 = metadata !{i32 45, i32 11, metadata !79, null}
!89 = metadata !{i32 7, i32 9, metadata !30, metadata !88}
!90 = metadata !{i32 8, i32 9, metadata !32, metadata !88} ; [ DW_TAG_imported_declaration ]
!91 = metadata !{i32 10, i32 14, metadata !34, metadata !88}
!92 = metadata !{i32 11, i32 9, metadata !36, metadata !88}
!93 = metadata !{i32 47, i32 17, metadata !12, null}

