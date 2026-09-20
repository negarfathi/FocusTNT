; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.mcelog_entry = private unnamed_addr constant [3 x i64] [i64 7, i64 7, i64 7], align 16

; Function Attrs: nounwind uwtable
define i64 @wrap_around(i64 %value, i64 %lower_bound, i64 %upper_bound) #0 {
wrap_around_bb0:
  call void @llvm.dbg.value(metadata !{i64 %value}, i64 0, metadata !16), !dbg !17
  call void @llvm.dbg.value(metadata !{i64 %lower_bound}, i64 0, metadata !18), !dbg !19
  call void @llvm.dbg.value(metadata !{i64 %upper_bound}, i64 0, metadata !20), !dbg !21
  %"0" = sub nsw i64 %upper_bound, %lower_bound, !dbg !22
  %"1" = add nsw i64 %"0", 1, !dbg !22
  call void @llvm.dbg.value(metadata !{i64 %"1"}, i64 0, metadata !23), !dbg !24
  %"2" = icmp sgt i64 %value, %upper_bound, !dbg !25
  br i1 %"2", label %wrap_around_bb1, label %wrap_around_bb2, !dbg !25

wrap_around_bb1:                                  ; preds = %wrap_around_bb0
  %"3" = sub nsw i64 %value, %upper_bound, !dbg !27
  %"4" = sub nsw i64 %"3", 1, !dbg !27
  %"5" = srem i64 %"4", %"1", !dbg !27
  %"6" = add nsw i64 %lower_bound, %"5", !dbg !27
  br label %wrap_around_bb4, !dbg !27

wrap_around_bb2:                                  ; preds = %wrap_around_bb0
  %"7" = icmp slt i64 %value, %lower_bound, !dbg !29
  br i1 %"7", label %wrap_around_bb3, label %wrap_around_bb4, !dbg !29

wrap_around_bb3:                                  ; preds = %wrap_around_bb2
  %"8" = sub nsw i64 %lower_bound, %value, !dbg !31
  %"9" = sub nsw i64 %"8", 1, !dbg !31
  %"10" = srem i64 %"9", %"1", !dbg !31
  %"11" = sub nsw i64 %upper_bound, %"10", !dbg !31
  br label %wrap_around_bb4, !dbg !31

wrap_around_bb4:                                  ; preds = %wrap_around_bb2, %wrap_around_bb3, %wrap_around_bb1
  %.0 = phi i64 [ %"6", %wrap_around_bb1 ], [ %"11", %wrap_around_bb3 ], [ %value, %wrap_around_bb2 ]
  ret i64 %.0, !dbg !33
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
main_bb5:
  %mcelog_entry = alloca [3 x i64], align 16
  call void @llvm.dbg.value(metadata !34, i64 0, metadata !35), !dbg !36
  %"12" = icmp sle i64 3, 0, !dbg !37
  %"13" = icmp sgt i64 3, 1000, !dbg !39
  %or.cond = or i1 %"12", %"13", !dbg !37
  br i1 %or.cond, label %main_bb12, label %main_bb6, !dbg !37

main_bb6:                                         ; preds = %main_bb5
  call void @llvm.dbg.declare(metadata !{[3 x i64]* %mcelog_entry}, metadata !41), !dbg !45
  %"14" = bitcast [3 x i64]* %mcelog_entry to i8*, !dbg !46
  %"15" = bitcast [3 x i64]* @main.mcelog_entry to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %"14", i8* %"15", i64 24, i32 16, i1 false), !dbg !46
  call void @llvm.dbg.value(metadata !47, i64 0, metadata !48), !dbg !50
  call void @llvm.dbg.value(metadata !{i64 %"17"}, i64 0, metadata !51), !dbg !53
  call void @llvm.dbg.value(metadata !54, i64 0, metadata !55), !dbg !56
  call void @llvm.dbg.value(metadata !57, i64 0, metadata !58), !dbg !59
  call void @llvm.dbg.value(metadata !60, i64 0, metadata !61), !dbg !62
  br label %main_wrap_around.exit, !dbg !63

main_wrap_around.exit:                            ; preds = %main_bb10, %main_bb9, %main_bb8, %main_bb6
  %i.0 = phi i64 [ 0, %main_bb6 ], [ %"22", %main_bb8 ], [ %"27", %main_bb10 ], [ %"17", %main_bb9 ]
  %"16" = icmp slt i64 %i.0, 3, !dbg !64
  br i1 %"16", label %main_bb7, label %main_bb11, !dbg !64

main_bb7:                                         ; preds = %main_wrap_around.exit
  %"17" = add nsw i64 %i.0, 1, !dbg !52
  %"18" = icmp sgt i64 %"17", 2147483647, !dbg !67
  br i1 %"18", label %main_bb8, label %main_bb9, !dbg !67

main_bb8:                                         ; preds = %main_bb7
  %"19" = sub nsw i64 %"17", 2147483647, !dbg !68
  %"20" = sub nsw i64 %"19", 1, !dbg !68
  %"21" = srem i64 %"20", 4294967296, !dbg !68
  %"22" = add nsw i64 -2147483648, %"21", !dbg !68
  br label %main_wrap_around.exit, !dbg !68

main_bb9:                                         ; preds = %main_bb7
  %"23" = icmp slt i64 %"17", -2147483648, !dbg !69
  br i1 %"23", label %main_bb10, label %main_wrap_around.exit, !dbg !69

main_bb10:                                        ; preds = %main_bb9
  %"24" = sub nsw i64 -2147483648, %"17", !dbg !70
  %"25" = sub nsw i64 %"24", 1, !dbg !70
  %"26" = srem i64 %"25", 4294967296, !dbg !70
  %"27" = sub nsw i64 2147483647, %"26", !dbg !70
  br label %main_wrap_around.exit, !dbg !70

main_bb11:                                        ; preds = %main_wrap_around.exit
  call void @llvm.dbg.value(metadata !71, i64 0, metadata !72), !dbg !73
  %"28" = icmp slt i64 1, 0, !dbg !74
  br i1 %"28", label %main_bb12, label %main_wrap_around.exit2, !dbg !74

main_wrap_around.exit2:                           ; preds = %main_bb13, %main_bb17, %main_bb16, %main_bb15, %main_bb11
  %entry.0 = phi i64 [ 1, %main_bb11 ], [ %"38", %main_bb15 ], [ %"43", %main_bb17 ], [ %"33", %main_bb16 ], [ %entry.0, %main_bb13 ]
  %"29" = icmp sge i64 %entry.0, 3, !dbg !76
  br i1 %"29", label %main_bb12, label %main_bb13, !dbg !76

main_bb12:                                        ; preds = %main_wrap_around.exit2, %main_bb11, %main_bb5
  ret i32 0, !dbg !80

main_bb13:                                        ; preds = %main_wrap_around.exit2
  %"30" = getelementptr inbounds [3 x i64]* %mcelog_entry, i32 0, i64 %entry.0, !dbg !81
  %"31" = load i64* %"30", align 8, !dbg !81
  %"32" = icmp ne i64 %"31", 0, !dbg !81
  br i1 %"32", label %main_bb14, label %main_wrap_around.exit2, !dbg !81

main_bb14:                                        ; preds = %main_bb13
  %"33" = add nsw i64 %entry.0, 1, !dbg !83
  %"34" = icmp sgt i64 %"33", 2147483647, !dbg !85
  br i1 %"34", label %main_bb15, label %main_bb16, !dbg !85

main_bb15:                                        ; preds = %main_bb14
  %"35" = sub nsw i64 %"33", 2147483647, !dbg !86
  %"36" = sub nsw i64 %"35", 1, !dbg !86
  %"37" = srem i64 %"36", 4294967296, !dbg !86
  %"38" = add nsw i64 -2147483648, %"37", !dbg !86
  br label %main_wrap_around.exit2, !dbg !86

main_bb16:                                        ; preds = %main_bb14
  %"39" = icmp slt i64 %"33", -2147483648, !dbg !87
  br i1 %"39", label %main_bb17, label %main_wrap_around.exit2, !dbg !87

main_bb17:                                        ; preds = %main_bb16
  %"40" = sub nsw i64 -2147483648, %"33", !dbg !88
  %"41" = sub nsw i64 %"40", 1, !dbg !88
  %"42" = srem i64 %"41", 4294967296, !dbg !88
  %"43" = sub nsw i64 2147483647, %"42", !dbg !88
  br label %main_wrap_around.exit2, !dbg !88
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

declare i64 @__kittel_nondef.0()

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

declare i32 @__kittel_nondef.1()

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!13, !14}
!llvm.ident = !{!15}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [//FILES_DIR/SourceCode_SemanticAugmentor.c] [DW_LANG_C99]
!1 = metadata !{metadata !"FILES_DIR/SourceCode_SemanticAugmentor.c", metadata !"/"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"wrap_around", metadata !"wrap_around", metadata !"", i32 13, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i64, i64, i64)* @wrap_around, null, null, metadata !2, i32 13} ; [ DW_TAG_subprogram ] [line 13] [def] [wrap_around]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 23, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 24} ; [ DW_TAG_subprogram ] [line 23] [def] [scope 24] [main]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !12}
!12 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!13 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!14 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!15 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!16 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777229, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 13]
!17 = metadata !{i32 13, i32 33, metadata !4, null}
!18 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554445, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [lower_bound] [line 13]
!19 = metadata !{i32 13, i32 50, metadata !4, null}
!20 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331661, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [upper_bound] [line 13]
!21 = metadata !{i32 13, i32 73, metadata !4, null}
!22 = metadata !{i32 14, i32 5, metadata !4, null}
!23 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 14, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [range] [line 14]
!24 = metadata !{i32 14, i32 15, metadata !4, null}
!25 = metadata !{i32 15, i32 9, metadata !26, null}
!26 = metadata !{i32 786443, metadata !1, metadata !4, i32 15, i32 9, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!27 = metadata !{i32 16, i32 9, metadata !28, null}
!28 = metadata !{i32 786443, metadata !1, metadata !26, i32 15, i32 30, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!29 = metadata !{i32 18, i32 14, metadata !30, null}
!30 = metadata !{i32 786443, metadata !1, metadata !26, i32 18, i32 14, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!31 = metadata !{i32 19, i32 9, metadata !32, null}
!32 = metadata !{i32 786443, metadata !1, metadata !30, i32 18, i32 35, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!33 = metadata !{i32 22, i32 1, metadata !4, null}
!34 = metadata !{i64 3}
!35 = metadata !{i32 786688, metadata !9, metadata !"MCE_LOG_LEN", metadata !5, i32 25, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [MCE_LOG_LEN] [line 25]
!36 = metadata !{i32 25, i32 15, metadata !9, null}
!37 = metadata !{i32 26, i32 9, metadata !38, null}
!38 = metadata !{i32 786443, metadata !1, metadata !9, i32 26, i32 9, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!39 = metadata !{i32 26, i32 9, metadata !40, null}
!40 = metadata !{i32 786443, metadata !1, metadata !38, i32 26, i32 9, i32 1, i32 16} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!41 = metadata !{i32 786688, metadata !9, metadata !"mcelog_entry", metadata !5, i32 30, metadata !42, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mcelog_entry] [line 30]
!42 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 192, i64 64, i32 0, i32 0, metadata !8, metadata !43, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 192, align 64, offset 0] [from long long int]
!43 = metadata !{metadata !44}
!44 = metadata !{i32 786465, i64 0, i64 3}        ; [ DW_TAG_subrange_type ] [0, 2]
!45 = metadata !{i32 30, i32 15, metadata !9, null}
!46 = metadata !{i32 30, i32 5, metadata !9, null}
!47 = metadata !{i64 0}
!48 = metadata !{i32 786688, metadata !49, metadata !"i", metadata !5, i32 31, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 31]
!49 = metadata !{i32 786443, metadata !1, metadata !9, i32 31, i32 5, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!50 = metadata !{i32 31, i32 20, metadata !49, null}
!51 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777229, metadata !8, i32 0, metadata !52} ; [ DW_TAG_arg_variable ] [value] [line 13]
!52 = metadata !{i32 31, i32 49, metadata !49, null}
!53 = metadata !{i32 13, i32 33, metadata !4, metadata !52}
!54 = metadata !{i64 -2147483648}
!55 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554445, metadata !8, i32 0, metadata !52} ; [ DW_TAG_arg_variable ] [lower_bound] [line 13]
!56 = metadata !{i32 13, i32 50, metadata !4, metadata !52}
!57 = metadata !{i64 2147483647}
!58 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331661, metadata !8, i32 0, metadata !52} ; [ DW_TAG_arg_variable ] [upper_bound] [line 13]
!59 = metadata !{i32 13, i32 73, metadata !4, metadata !52}
!60 = metadata !{i64 4294967296}
!61 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 14, metadata !8, i32 0, metadata !52} ; [ DW_TAG_auto_variable ] [range] [line 14]
!62 = metadata !{i32 14, i32 15, metadata !4, metadata !52}
!63 = metadata !{i32 31, i32 10, metadata !49, null}
!64 = metadata !{i32 31, i32 10, metadata !65, null}
!65 = metadata !{i32 786443, metadata !1, metadata !66, i32 31, i32 10, i32 2, i32 18} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!66 = metadata !{i32 786443, metadata !1, metadata !49, i32 31, i32 10, i32 1, i32 17} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!67 = metadata !{i32 15, i32 9, metadata !26, metadata !52}
!68 = metadata !{i32 16, i32 9, metadata !28, metadata !52}
!69 = metadata !{i32 18, i32 14, metadata !30, metadata !52}
!70 = metadata !{i32 19, i32 9, metadata !32, metadata !52}
!71 = metadata !{i64 1}
!72 = metadata !{i32 786688, metadata !9, metadata !"entry", metadata !5, i32 35, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [entry] [line 35]
!73 = metadata !{i32 35, i32 15, metadata !9, null}
!74 = metadata !{i32 36, i32 9, metadata !75, null}
!75 = metadata !{i32 786443, metadata !1, metadata !9, i32 36, i32 9, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!76 = metadata !{i32 42, i32 13, metadata !77, null}
!77 = metadata !{i32 786443, metadata !1, metadata !78, i32 42, i32 13, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!78 = metadata !{i32 786443, metadata !1, metadata !79, i32 41, i32 5, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!79 = metadata !{i32 786443, metadata !1, metadata !9, i32 40, i32 5, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!80 = metadata !{i32 53, i32 1, metadata !9, null}
!81 = metadata !{i32 46, i32 13, metadata !82, null}
!82 = metadata !{i32 786443, metadata !1, metadata !78, i32 46, i32 13, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!83 = metadata !{i32 48, i32 22, metadata !84, null}
!84 = metadata !{i32 786443, metadata !1, metadata !82, i32 47, i32 9, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!85 = metadata !{i32 15, i32 9, metadata !26, metadata !83}
!86 = metadata !{i32 16, i32 9, metadata !28, metadata !83}
!87 = metadata !{i32 18, i32 14, metadata !30, metadata !83}
!88 = metadata !{i32 19, i32 9, metadata !32, metadata !83}

