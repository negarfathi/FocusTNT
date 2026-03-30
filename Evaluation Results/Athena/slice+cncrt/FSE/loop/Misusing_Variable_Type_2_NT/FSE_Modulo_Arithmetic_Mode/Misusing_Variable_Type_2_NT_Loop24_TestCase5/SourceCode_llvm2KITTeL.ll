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
  call void @llvm.dbg.value(metadata !36, i64 0, metadata !37), !dbg !38
  %"12" = srem i64 65535, 99999, !dbg !39
  call void @llvm.dbg.value(metadata !{i64 %"12"}, i64 0, metadata !40), !dbg !41
  call void @llvm.dbg.value(metadata !42, i64 0, metadata !43), !dbg !44
  call void @llvm.dbg.value(metadata !45, i64 0, metadata !46), !dbg !47
  call void @llvm.dbg.value(metadata !48, i64 0, metadata !49), !dbg !50
  call void @llvm.dbg.value(metadata !{i64 %"12"}, i64 0, metadata !37), !dbg !38
  %"13" = icmp slt i64 %"12", 0, !dbg !51
  br i1 %"13", label %gettablesize_slice_1_bb6, label %gettablesize_slice_1_wrap_around.exit, !dbg !51

gettablesize_slice_1_bb6:                         ; preds = %gettablesize_slice_1_bb5
  %"14" = sub nsw i64 0, %"12", !dbg !53
  call void @llvm.dbg.value(metadata !{i64 %"14"}, i64 0, metadata !55), !dbg !56
  call void @llvm.dbg.value(metadata !42, i64 0, metadata !57), !dbg !58
  call void @llvm.dbg.value(metadata !45, i64 0, metadata !59), !dbg !60
  call void @llvm.dbg.value(metadata !48, i64 0, metadata !61), !dbg !62
  %"15" = icmp sgt i64 %"14", 2147483647, !dbg !63
  br i1 %"15", label %gettablesize_slice_1_bb7, label %gettablesize_slice_1_bb8, !dbg !63

gettablesize_slice_1_bb7:                         ; preds = %gettablesize_slice_1_bb6
  %"16" = sub nsw i64 %"14", 2147483647, !dbg !64
  %"17" = sub nsw i64 %"16", 1, !dbg !64
  %"18" = srem i64 %"17", 4294967296, !dbg !64
  %"19" = add nsw i64 -2147483648, %"18", !dbg !64
  br label %gettablesize_slice_1_wrap_around.exit, !dbg !64

gettablesize_slice_1_bb8:                         ; preds = %gettablesize_slice_1_bb6
  %"20" = icmp slt i64 %"14", -2147483648, !dbg !65
  br i1 %"20", label %gettablesize_slice_1_bb9, label %gettablesize_slice_1_wrap_around.exit, !dbg !65

gettablesize_slice_1_bb9:                         ; preds = %gettablesize_slice_1_bb8
  %"21" = sub nsw i64 -2147483648, %"14", !dbg !66
  %"22" = sub nsw i64 %"21", 1, !dbg !66
  %"23" = srem i64 %"22", 4294967296, !dbg !66
  %"24" = sub nsw i64 2147483647, %"23", !dbg !66
  br label %gettablesize_slice_1_wrap_around.exit, !dbg !66

gettablesize_slice_1_wrap_around.exit:            ; preds = %gettablesize_slice_1_bb5, %gettablesize_slice_1_bb9, %gettablesize_slice_1_bb8, %gettablesize_slice_1_bb7
  %__retres.0 = phi i64 [ %"19", %gettablesize_slice_1_bb7 ], [ %"24", %gettablesize_slice_1_bb9 ], [ %"14", %gettablesize_slice_1_bb8 ], [ %"12", %gettablesize_slice_1_bb5 ]
  ret i64 %__retres.0, !dbg !67
}

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb10:
  call void @llvm.dbg.value(metadata !36, i64 0, metadata !68), !dbg !70
  call void @llvm.dbg.value(metadata !36, i64 0, metadata !71), !dbg !73
  call void @llvm.dbg.value(metadata !42, i64 0, metadata !74), !dbg !75
  call void @llvm.dbg.value(metadata !45, i64 0, metadata !76), !dbg !77
  call void @llvm.dbg.value(metadata !48, i64 0, metadata !78), !dbg !79
  call void @llvm.dbg.value(metadata !36, i64 0, metadata !68), !dbg !70
  call void @llvm.dbg.value(metadata !36, i64 0, metadata !80), !dbg !81
  call void @llvm.dbg.value(metadata !36, i64 0, metadata !82), !dbg !83
  call void @llvm.dbg.value(metadata !84, i64 0, metadata !85), !dbg !86
  call void @llvm.dbg.value(metadata !{i64 %"29"}, i64 0, metadata !85), !dbg !86
  br label %main_bb11, !dbg !87

main_bb11:                                        ; preds = %main_bb12, %main_bb10
  %i.0 = phi i64 [ 0, %main_bb10 ], [ %"29", %main_bb12 ]
  %"25" = icmp ult i64 %i.0, 65535, !dbg !88
  br i1 %"25", label %main_bb12, label %main_bb13, !dbg !88

main_bb12:                                        ; preds = %main_bb11
  %"26" = trunc i64 %i.0 to i32, !dbg !90
  %"27" = add nsw i32 %"26", 1, !dbg !90
  %"28" = trunc i32 %"27" to i16, !dbg !90
  %"29" = zext i16 %"28" to i64, !dbg !90
  br label %main_bb11, !dbg !92

main_bb13:                                        ; preds = %main_bb11
  ret void, !dbg !93
}

declare i64 @__kittel_nondef.0()

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

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
!36 = metadata !{i64 65535}
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
!68 = metadata !{i32 786688, metadata !9, metadata !"i", metadata !5, i32 20, metadata !8, i32 0, metadata !69} ; [ DW_TAG_auto_variable ] [i] [line 20]
!69 = metadata !{i32 32, i32 9, metadata !12, null}
!70 = metadata !{i32 20, i32 13, metadata !9, metadata !69}
!71 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777223, metadata !8, i32 0, metadata !72} ; [ DW_TAG_arg_variable ] [value] [line 7]
!72 = metadata !{i32 21, i32 7, metadata !9, metadata !69}
!73 = metadata !{i32 7, i32 33, metadata !4, metadata !72}
!74 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554439, metadata !8, i32 0, metadata !72} ; [ DW_TAG_arg_variable ] [lower_bound] [line 7]
!75 = metadata !{i32 7, i32 50, metadata !4, metadata !72}
!76 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331655, metadata !8, i32 0, metadata !72} ; [ DW_TAG_arg_variable ] [upper_bound] [line 7]
!77 = metadata !{i32 7, i32 73, metadata !4, metadata !72}
!78 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 8, metadata !8, i32 0, metadata !72} ; [ DW_TAG_auto_variable ] [range] [line 8]
!79 = metadata !{i32 8, i32 15, metadata !4, metadata !72} ; [ DW_TAG_imported_declaration ]
!80 = metadata !{i32 786688, metadata !12, metadata !"tmp", metadata !5, i32 31, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmp] [line 31]
!81 = metadata !{i32 31, i32 13, metadata !12, null}
!82 = metadata !{i32 786688, metadata !12, metadata !"max_fds", metadata !5, i32 33, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [max_fds] [line 33]
!83 = metadata !{i32 33, i32 13, metadata !12, null}
!84 = metadata !{i64 0}
!85 = metadata !{i32 786688, metadata !12, metadata !"i", metadata !5, i32 30, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 30]
!86 = metadata !{i32 30, i32 13, metadata !12, null}
!87 = metadata !{i32 35, i32 3, metadata !12, null}
!88 = metadata !{i32 35, i32 3, metadata !89, null}
!89 = metadata !{i32 786443, metadata !1, metadata !12, i32 35, i32 3, i32 1, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!90 = metadata !{i32 36, i32 3, metadata !91, null}
!91 = metadata !{i32 786443, metadata !1, metadata !12, i32 36, i32 1, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!92 = metadata !{i32 37, i32 1, metadata !91, null}
!93 = metadata !{i32 38, i32 3, metadata !12, null}

