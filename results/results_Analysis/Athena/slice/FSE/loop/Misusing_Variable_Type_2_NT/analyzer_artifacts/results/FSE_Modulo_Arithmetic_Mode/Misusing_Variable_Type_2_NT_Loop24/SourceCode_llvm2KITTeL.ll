; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define i64 @wrap_around(i64 %value, i64 %lower_bound, i64 %upper_bound) #0 {
wrap_around_bb0:
  call void @llvm.dbg.value(metadata !{i64 %value}, i64 0, metadata !18), !dbg !19
  call void @llvm.dbg.value(metadata !{i64 %lower_bound}, i64 0, metadata !20), !dbg !21
  call void @llvm.dbg.value(metadata !{i64 %upper_bound}, i64 0, metadata !22), !dbg !23
  %"0" = sub nsw i64 %upper_bound, %lower_bound, !dbg !24
  %"1" = add nsw i64 %"0", 1, !dbg !24
  call void @llvm.dbg.value(metadata !{i64 %"1"}, i64 0, metadata !25), !dbg !26
  %"2" = icmp sgt i64 %value, %upper_bound, !dbg !27
  br i1 %"2", label %wrap_around_bb1, label %wrap_around_bb2, !dbg !27

wrap_around_bb1:                                  ; preds = %wrap_around_bb0
  %"3" = sub nsw i64 %value, %upper_bound, !dbg !29
  %"4" = sub nsw i64 %"3", 1, !dbg !29
  %"5" = srem i64 %"4", %"1", !dbg !29
  %"6" = add nsw i64 %lower_bound, %"5", !dbg !29
  br label %wrap_around_bb4, !dbg !29

wrap_around_bb2:                                  ; preds = %wrap_around_bb0
  %"7" = icmp slt i64 %value, %lower_bound, !dbg !31
  br i1 %"7", label %wrap_around_bb3, label %wrap_around_bb4, !dbg !31

wrap_around_bb3:                                  ; preds = %wrap_around_bb2
  %"8" = sub nsw i64 %lower_bound, %value, !dbg !33
  %"9" = sub nsw i64 %"8", 1, !dbg !33
  %"10" = srem i64 %"9", %"1", !dbg !33
  %"11" = sub nsw i64 %upper_bound, %"10", !dbg !33
  br label %wrap_around_bb4, !dbg !33

wrap_around_bb4:                                  ; preds = %wrap_around_bb2, %wrap_around_bb3, %wrap_around_bb1
  %.0 = phi i64 [ %"6", %wrap_around_bb1 ], [ %"11", %wrap_around_bb3 ], [ %value, %wrap_around_bb2 ]
  ret i64 %.0, !dbg !35
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i64 @gettablesize_slice_1() #0 {
gettablesize_slice_1_bb5:
  %"12" = call i64 @__VERIFIER_nondet_int(), !dbg !36
  call void @llvm.dbg.value(metadata !{i64 %"12"}, i64 0, metadata !37), !dbg !38
  %"13" = srem i64 %"12", 99999, !dbg !39
  call void @llvm.dbg.value(metadata !{i64 %"13"}, i64 0, metadata !40), !dbg !41
  call void @llvm.dbg.value(metadata !42, i64 0, metadata !43), !dbg !44
  call void @llvm.dbg.value(metadata !45, i64 0, metadata !46), !dbg !47
  call void @llvm.dbg.value(metadata !48, i64 0, metadata !49), !dbg !50
  call void @llvm.dbg.value(metadata !{i64 %"13"}, i64 0, metadata !37), !dbg !38
  %"14" = icmp slt i64 %"13", 0, !dbg !51
  br i1 %"14", label %gettablesize_slice_1_bb6, label %gettablesize_slice_1_wrap_around.exit, !dbg !51

gettablesize_slice_1_bb6:                         ; preds = %gettablesize_slice_1_bb5
  %"15" = sub nsw i64 0, %"13", !dbg !53
  call void @llvm.dbg.value(metadata !{i64 %"15"}, i64 0, metadata !55), !dbg !56
  call void @llvm.dbg.value(metadata !42, i64 0, metadata !57), !dbg !58
  call void @llvm.dbg.value(metadata !45, i64 0, metadata !59), !dbg !60
  call void @llvm.dbg.value(metadata !48, i64 0, metadata !61), !dbg !62
  %"16" = icmp sgt i64 %"15", 2147483647, !dbg !63
  br i1 %"16", label %gettablesize_slice_1_bb7, label %gettablesize_slice_1_bb8, !dbg !63

gettablesize_slice_1_bb7:                         ; preds = %gettablesize_slice_1_bb6
  %"17" = sub nsw i64 %"15", 2147483647, !dbg !64
  %"18" = sub nsw i64 %"17", 1, !dbg !64
  %"19" = srem i64 %"18", 4294967296, !dbg !64
  %"20" = add nsw i64 -2147483648, %"19", !dbg !64
  br label %gettablesize_slice_1_wrap_around.exit, !dbg !64

gettablesize_slice_1_bb8:                         ; preds = %gettablesize_slice_1_bb6
  %"21" = icmp slt i64 %"15", -2147483648, !dbg !65
  br i1 %"21", label %gettablesize_slice_1_bb9, label %gettablesize_slice_1_wrap_around.exit, !dbg !65

gettablesize_slice_1_bb9:                         ; preds = %gettablesize_slice_1_bb8
  %"22" = sub nsw i64 -2147483648, %"15", !dbg !66
  %"23" = sub nsw i64 %"22", 1, !dbg !66
  %"24" = srem i64 %"23", 4294967296, !dbg !66
  %"25" = sub nsw i64 2147483647, %"24", !dbg !66
  br label %gettablesize_slice_1_wrap_around.exit, !dbg !66

gettablesize_slice_1_wrap_around.exit:            ; preds = %gettablesize_slice_1_bb5, %gettablesize_slice_1_bb9, %gettablesize_slice_1_bb8, %gettablesize_slice_1_bb7
  %__retres.0 = phi i64 [ %"20", %gettablesize_slice_1_bb7 ], [ %"25", %gettablesize_slice_1_bb9 ], [ %"15", %gettablesize_slice_1_bb8 ], [ %"13", %gettablesize_slice_1_bb5 ]
  ret i64 %__retres.0, !dbg !67
}

declare i64 @__VERIFIER_nondet_int() #2

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb10:
  %"26" = call i64 @__VERIFIER_nondet_int() #3, !dbg !68
  call void @llvm.dbg.value(metadata !{i64 %"26"}, i64 0, metadata !70) #3, !dbg !71
  %"27" = srem i64 %"26", 99999, !dbg !72
  call void @llvm.dbg.value(metadata !{i64 %"27"}, i64 0, metadata !73) #3, !dbg !74
  call void @llvm.dbg.value(metadata !42, i64 0, metadata !75) #3, !dbg !76
  call void @llvm.dbg.value(metadata !45, i64 0, metadata !77) #3, !dbg !78
  call void @llvm.dbg.value(metadata !48, i64 0, metadata !79) #3, !dbg !80
  call void @llvm.dbg.value(metadata !{i64 %"27"}, i64 0, metadata !70) #3, !dbg !71
  %"28" = icmp slt i64 %"27", 0, !dbg !81
  br i1 %"28", label %main_bb11, label %main_gettablesize_slice_1.exit, !dbg !81

main_bb11:                                        ; preds = %main_bb10
  %"29" = sub nsw i64 0, %"27", !dbg !82
  call void @llvm.dbg.value(metadata !{i64 %"29"}, i64 0, metadata !83) #3, !dbg !84
  call void @llvm.dbg.value(metadata !42, i64 0, metadata !85) #3, !dbg !86
  call void @llvm.dbg.value(metadata !45, i64 0, metadata !87) #3, !dbg !88
  call void @llvm.dbg.value(metadata !48, i64 0, metadata !89) #3, !dbg !90
  %"30" = icmp sgt i64 %"29", 2147483647, !dbg !91
  br i1 %"30", label %main_bb12, label %main_bb13, !dbg !91

main_bb12:                                        ; preds = %main_bb11
  %"31" = sub nsw i64 %"29", 2147483647, !dbg !92
  %"32" = sub nsw i64 %"31", 1, !dbg !92
  %"33" = srem i64 %"32", 4294967296, !dbg !92
  %"34" = add nsw i64 -2147483648, %"33", !dbg !92
  br label %main_gettablesize_slice_1.exit, !dbg !92

main_bb13:                                        ; preds = %main_bb11
  %"35" = icmp slt i64 %"29", -2147483648, !dbg !93
  br i1 %"35", label %main_bb14, label %main_gettablesize_slice_1.exit, !dbg !93

main_bb14:                                        ; preds = %main_bb13
  %"36" = sub nsw i64 -2147483648, %"29", !dbg !94
  %"37" = sub nsw i64 %"36", 1, !dbg !94
  %"38" = srem i64 %"37", 4294967296, !dbg !94
  %"39" = sub nsw i64 2147483647, %"38", !dbg !94
  br label %main_gettablesize_slice_1.exit, !dbg !94

main_gettablesize_slice_1.exit:                   ; preds = %main_bb10, %main_bb12, %main_bb13, %main_bb14
  %__retres.0.i = phi i64 [ %"34", %main_bb12 ], [ %"39", %main_bb14 ], [ %"29", %main_bb13 ], [ %"27", %main_bb10 ], !dbg !69
  call void @llvm.dbg.value(metadata !{i64 %__retres.0.i}, i64 0, metadata !95), !dbg !96
  call void @llvm.dbg.value(metadata !{i64 %__retres.0.i}, i64 0, metadata !97), !dbg !98
  call void @llvm.dbg.value(metadata !99, i64 0, metadata !100), !dbg !101
  call void @llvm.dbg.value(metadata !{i64 %"44"}, i64 0, metadata !100), !dbg !101
  br label %main_bb15, !dbg !102

main_bb15:                                        ; preds = %main_bb16, %main_gettablesize_slice_1.exit
  %i.0 = phi i64 [ 0, %main_gettablesize_slice_1.exit ], [ %"44", %main_bb16 ]
  %"40" = icmp ult i64 %i.0, %__retres.0.i, !dbg !103
  br i1 %"40", label %main_bb16, label %main_bb17, !dbg !103

main_bb16:                                        ; preds = %main_bb15
  %"41" = trunc i64 %i.0 to i32, !dbg !105
  %"42" = add nsw i32 %"41", 1, !dbg !105
  %"43" = trunc i32 %"42" to i16, !dbg !105
  %"44" = zext i16 %"43" to i64, !dbg !105
  br label %main_bb15, !dbg !107

main_bb17:                                        ; preds = %main_bb15
  ret void, !dbg !108
}

declare i64 @__kittel_nondef.0()

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!15, !16}
!llvm.ident = !{!17}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [//FILES_DIR/SourceCode_SemanticAugmentor.c] [DW_LANG_C99]
!1 = metadata !{metadata !"FILES_DIR/SourceCode_SemanticAugmentor.c", metadata !"/"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9, metadata !12}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"wrap_around", metadata !"wrap_around", metadata !"", i32 7, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i64, i64, i64)* @wrap_around, null, null, metadata !2, i32 7} ; [ DW_TAG_subprogram ] [line 7] [def] [wrap_around]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"gettablesize_slice_1", metadata !"gettablesize_slice_1", metadata !"", i32 17, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 ()* @gettablesize_slice_1, null, null, metadata !2, i32 18} ; [ DW_TAG_subprogram ] [line 17] [def] [scope 18] [gettablesize_slice_1]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !8}
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 28, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @main, null, null, metadata !2, i32 29} ; [ DW_TAG_subprogram ] [line 28] [def] [scope 29] [main]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{null}
!15 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!16 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!17 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!18 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777223, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 7]
!19 = metadata !{i32 7, i32 33, metadata !4, null}
!20 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554439, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [lower_bound] [line 7]
!21 = metadata !{i32 7, i32 50, metadata !4, null}
!22 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331655, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [upper_bound] [line 7]
!23 = metadata !{i32 7, i32 73, metadata !4, null}
!24 = metadata !{i32 8, i32 5, metadata !4, null} ; [ DW_TAG_imported_declaration ]
!25 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 8, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [range] [line 8]
!26 = metadata !{i32 8, i32 15, metadata !4, null} ; [ DW_TAG_imported_declaration ]
!27 = metadata !{i32 9, i32 9, metadata !28, null}
!28 = metadata !{i32 786443, metadata !1, metadata !4, i32 9, i32 9, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!29 = metadata !{i32 10, i32 9, metadata !30, null}
!30 = metadata !{i32 786443, metadata !1, metadata !28, i32 9, i32 30, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!31 = metadata !{i32 12, i32 14, metadata !32, null}
!32 = metadata !{i32 786443, metadata !1, metadata !28, i32 12, i32 14, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!33 = metadata !{i32 13, i32 9, metadata !34, null}
!34 = metadata !{i32 786443, metadata !1, metadata !32, i32 12, i32 35, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!35 = metadata !{i32 16, i32 1, metadata !4, null}
!36 = metadata !{i32 20, i32 17, metadata !9, null}
!37 = metadata !{i32 786688, metadata !9, metadata !"i", metadata !5, i32 20, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 20]
!38 = metadata !{i32 20, i32 13, metadata !9, null}
!39 = metadata !{i32 21, i32 7, metadata !9, null}
!40 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777223, metadata !8, i32 0, metadata !39} ; [ DW_TAG_arg_variable ] [value] [line 7]
!41 = metadata !{i32 7, i32 33, metadata !4, metadata !39}
!42 = metadata !{i64 -2147483648}
!43 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554439, metadata !8, i32 0, metadata !39} ; [ DW_TAG_arg_variable ] [lower_bound] [line 7]
!44 = metadata !{i32 7, i32 50, metadata !4, metadata !39}
!45 = metadata !{i64 2147483647}
!46 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331655, metadata !8, i32 0, metadata !39} ; [ DW_TAG_arg_variable ] [upper_bound] [line 7]
!47 = metadata !{i32 7, i32 73, metadata !4, metadata !39}
!48 = metadata !{i64 4294967296}
!49 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 8, metadata !8, i32 0, metadata !39} ; [ DW_TAG_auto_variable ] [range] [line 8]
!50 = metadata !{i32 8, i32 15, metadata !4, metadata !39} ; [ DW_TAG_imported_declaration ]
!51 = metadata !{i32 22, i32 7, metadata !52, null}
!52 = metadata !{i32 786443, metadata !1, metadata !9, i32 22, i32 7, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!53 = metadata !{i32 23, i32 14, metadata !54, null}
!54 = metadata !{i32 786443, metadata !1, metadata !52, i32 23, i32 1, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!55 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777223, metadata !8, i32 0, metadata !53} ; [ DW_TAG_arg_variable ] [value] [line 7]
!56 = metadata !{i32 7, i32 33, metadata !4, metadata !53}
!57 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554439, metadata !8, i32 0, metadata !53} ; [ DW_TAG_arg_variable ] [lower_bound] [line 7]
!58 = metadata !{i32 7, i32 50, metadata !4, metadata !53}
!59 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331655, metadata !8, i32 0, metadata !53} ; [ DW_TAG_arg_variable ] [upper_bound] [line 7]
!60 = metadata !{i32 7, i32 73, metadata !4, metadata !53}
!61 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 8, metadata !8, i32 0, metadata !53} ; [ DW_TAG_auto_variable ] [range] [line 8]
!62 = metadata !{i32 8, i32 15, metadata !4, metadata !53} ; [ DW_TAG_imported_declaration ]
!63 = metadata !{i32 9, i32 9, metadata !28, metadata !53}
!64 = metadata !{i32 10, i32 9, metadata !30, metadata !53}
!65 = metadata !{i32 12, i32 14, metadata !32, metadata !53}
!66 = metadata !{i32 13, i32 9, metadata !34, metadata !53}
!67 = metadata !{i32 25, i32 3, metadata !9, null}
!68 = metadata !{i32 20, i32 17, metadata !9, metadata !69}
!69 = metadata !{i32 32, i32 9, metadata !12, null}
!70 = metadata !{i32 786688, metadata !9, metadata !"i", metadata !5, i32 20, metadata !8, i32 0, metadata !69} ; [ DW_TAG_auto_variable ] [i] [line 20]
!71 = metadata !{i32 20, i32 13, metadata !9, metadata !69}
!72 = metadata !{i32 21, i32 7, metadata !9, metadata !69}
!73 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777223, metadata !8, i32 0, metadata !72} ; [ DW_TAG_arg_variable ] [value] [line 7]
!74 = metadata !{i32 7, i32 33, metadata !4, metadata !72}
!75 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554439, metadata !8, i32 0, metadata !72} ; [ DW_TAG_arg_variable ] [lower_bound] [line 7]
!76 = metadata !{i32 7, i32 50, metadata !4, metadata !72}
!77 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331655, metadata !8, i32 0, metadata !72} ; [ DW_TAG_arg_variable ] [upper_bound] [line 7]
!78 = metadata !{i32 7, i32 73, metadata !4, metadata !72}
!79 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 8, metadata !8, i32 0, metadata !72} ; [ DW_TAG_auto_variable ] [range] [line 8]
!80 = metadata !{i32 8, i32 15, metadata !4, metadata !72} ; [ DW_TAG_imported_declaration ]
!81 = metadata !{i32 22, i32 7, metadata !52, metadata !69}
!82 = metadata !{i32 23, i32 14, metadata !54, metadata !69}
!83 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777223, metadata !8, i32 0, metadata !82} ; [ DW_TAG_arg_variable ] [value] [line 7]
!84 = metadata !{i32 7, i32 33, metadata !4, metadata !82}
!85 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554439, metadata !8, i32 0, metadata !82} ; [ DW_TAG_arg_variable ] [lower_bound] [line 7]
!86 = metadata !{i32 7, i32 50, metadata !4, metadata !82}
!87 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331655, metadata !8, i32 0, metadata !82} ; [ DW_TAG_arg_variable ] [upper_bound] [line 7]
!88 = metadata !{i32 7, i32 73, metadata !4, metadata !82}
!89 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 8, metadata !8, i32 0, metadata !82} ; [ DW_TAG_auto_variable ] [range] [line 8]
!90 = metadata !{i32 8, i32 15, metadata !4, metadata !82} ; [ DW_TAG_imported_declaration ]
!91 = metadata !{i32 9, i32 9, metadata !28, metadata !82}
!92 = metadata !{i32 10, i32 9, metadata !30, metadata !82}
!93 = metadata !{i32 12, i32 14, metadata !32, metadata !82}
!94 = metadata !{i32 13, i32 9, metadata !34, metadata !82}
!95 = metadata !{i32 786688, metadata !12, metadata !"tmp", metadata !5, i32 31, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmp] [line 31]
!96 = metadata !{i32 31, i32 13, metadata !12, null}
!97 = metadata !{i32 786688, metadata !12, metadata !"max_fds", metadata !5, i32 33, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [max_fds] [line 33]
!98 = metadata !{i32 33, i32 13, metadata !12, null}
!99 = metadata !{i64 0}
!100 = metadata !{i32 786688, metadata !12, metadata !"i", metadata !5, i32 30, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 30]
!101 = metadata !{i32 30, i32 13, metadata !12, null}
!102 = metadata !{i32 35, i32 3, metadata !12, null}
!103 = metadata !{i32 35, i32 3, metadata !104, null}
!104 = metadata !{i32 786443, metadata !1, metadata !12, i32 35, i32 3, i32 1, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!105 = metadata !{i32 36, i32 3, metadata !106, null}
!106 = metadata !{i32 786443, metadata !1, metadata !12, i32 36, i32 1, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!107 = metadata !{i32 37, i32 1, metadata !106, null}
!108 = metadata !{i32 38, i32 3, metadata !12, null}

