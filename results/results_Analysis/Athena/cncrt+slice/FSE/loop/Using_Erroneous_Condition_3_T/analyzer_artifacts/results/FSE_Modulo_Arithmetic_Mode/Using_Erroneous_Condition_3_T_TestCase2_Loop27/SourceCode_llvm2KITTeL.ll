; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.old_ = private unnamed_addr constant [10 x i64] [i64 1, i64 2, i64 3, i64 4, i64 5, i64 6, i64 7, i64 8, i64 9, i64 0], align 16
@main.new_ = private unnamed_addr constant [10 x i64] [i64 1, i64 2, i64 3, i64 4, i64 5, i64 6, i64 7, i64 8, i64 9, i64 0], align 16

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
  %old_ = alloca [10 x i64], align 16
  %new_ = alloca [10 x i64], align 16
  call void @llvm.dbg.value(metadata !33, i64 0, metadata !34), !dbg !35
  call void @llvm.dbg.value(metadata !36, i64 0, metadata !37), !dbg !38
  call void @llvm.dbg.value(metadata !39, i64 0, metadata !40), !dbg !41
  call void @llvm.dbg.declare(metadata !{[10 x i64]* %old_}, metadata !42), !dbg !46
  %"12" = bitcast [10 x i64]* %old_ to i8*, !dbg !47
  %"13" = bitcast [10 x i64]* @main.old_ to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %"12", i8* %"13", i64 80, i32 16, i1 false), !dbg !47
  call void @llvm.dbg.declare(metadata !{[10 x i64]* %new_}, metadata !48), !dbg !49
  %"14" = bitcast [10 x i64]* %new_ to i8*, !dbg !50
  %"15" = bitcast [10 x i64]* @main.new_ to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %"14", i8* %"15", i64 80, i32 16, i1 false), !dbg !50
  %"16" = getelementptr inbounds [10 x i64]* %old_, i32 0, i64 9, !dbg !51
  store i64 0, i64* %"16", align 8, !dbg !51
  %"17" = getelementptr inbounds [10 x i64]* %new_, i32 0, i64 9, !dbg !52
  store i64 0, i64* %"17", align 8, !dbg !52
  call void @llvm.dbg.value(metadata !{i64 %base.0}, i64 0, metadata !53), !dbg !55
  call void @llvm.dbg.value(metadata !{i64 %"24"}, i64 0, metadata !56), !dbg !59
  call void @llvm.dbg.value(metadata !60, i64 0, metadata !61), !dbg !62
  call void @llvm.dbg.value(metadata !63, i64 0, metadata !64), !dbg !65
  call void @llvm.dbg.value(metadata !66, i64 0, metadata !67), !dbg !68
  call void @llvm.dbg.value(metadata !{i64 %.0.i}, i64 0, metadata !53), !dbg !55
  br label %main_wrap_around.exit2, !dbg !69

main_wrap_around.exit2:                           ; preds = %main_bb18, %main_bb17, %main_bb16, %main_bb5
  %base.0 = phi i64 [ 4, %main_bb5 ], [ %"52", %main_bb16 ], [ %"57", %main_bb18 ], [ %"47", %main_bb17 ]
  %i.0 = phi i64 [ 0, %main_bb5 ], [ %.0.i3, %main_bb16 ], [ %.0.i3, %main_bb17 ], [ %.0.i3, %main_bb18 ]
  %"18" = icmp slt i64 %base.0, 12, !dbg !70
  br i1 %"18", label %main_bb6, label %main_bb19, !dbg !70

main_bb6:                                         ; preds = %main_wrap_around.exit2
  %"19" = getelementptr inbounds [10 x i64]* %old_, i32 0, i64 %i.0, !dbg !72
  %"20" = load i64* %"19", align 8, !dbg !72
  %"21" = getelementptr inbounds [10 x i64]* %new_, i32 0, i64 %i.0, !dbg !72
  %"22" = load i64* %"21", align 8, !dbg !72
  br label %main_bb7, !dbg !74

main_bb7:                                         ; preds = %main_wrap_around.exit, %main_bb6
  %number.0 = phi i64 [ %base.0, %main_bb6 ], [ %.0.i, %main_wrap_around.exit ]
  %"23" = icmp ne i64 %"20", %"22", !dbg !72
  br i1 %"23", label %main_bb8, label %main_bb12, !dbg !72

main_bb8:                                         ; preds = %main_bb7
  %"24" = add nsw i64 %number.0, 1, !dbg !57
  %"25" = icmp sgt i64 %"24", 2147483647, !dbg !75
  br i1 %"25", label %main_bb9, label %main_bb10, !dbg !75

main_bb9:                                         ; preds = %main_bb8
  %"26" = sub nsw i64 %"24", 2147483647, !dbg !76
  %"27" = sub nsw i64 %"26", 1, !dbg !76
  %"28" = srem i64 %"27", 4294967296, !dbg !76
  %"29" = add nsw i64 -2147483648, %"28", !dbg !76
  br label %main_wrap_around.exit, !dbg !76

main_bb10:                                        ; preds = %main_bb8
  %"30" = icmp slt i64 %"24", -2147483648, !dbg !77
  br i1 %"30", label %main_bb11, label %main_wrap_around.exit, !dbg !77

main_bb11:                                        ; preds = %main_bb10
  %"31" = sub nsw i64 -2147483648, %"24", !dbg !78
  %"32" = sub nsw i64 %"31", 1, !dbg !78
  %"33" = srem i64 %"32", 4294967296, !dbg !78
  %"34" = sub nsw i64 2147483647, %"33", !dbg !78
  br label %main_wrap_around.exit, !dbg !78

main_wrap_around.exit:                            ; preds = %main_bb9, %main_bb10, %main_bb11
  %.0.i = phi i64 [ %"29", %main_bb9 ], [ %"34", %main_bb11 ], [ %"24", %main_bb10 ], !dbg !57
  %"35" = icmp eq i64 %.0.i, 12, !dbg !79
  br i1 %"35", label %main_bb12, label %main_bb7, !dbg !79

main_bb12:                                        ; preds = %main_wrap_around.exit, %main_bb7
  %"36" = add nsw i64 %i.0, 1, !dbg !81
  call void @llvm.dbg.value(metadata !{i64 %"36"}, i64 0, metadata !82), !dbg !83
  call void @llvm.dbg.value(metadata !60, i64 0, metadata !84), !dbg !85
  call void @llvm.dbg.value(metadata !63, i64 0, metadata !86), !dbg !87
  call void @llvm.dbg.value(metadata !66, i64 0, metadata !88), !dbg !89
  %"37" = icmp sgt i64 %"36", 2147483647, !dbg !90
  br i1 %"37", label %main_bb13, label %main_bb14, !dbg !90

main_bb13:                                        ; preds = %main_bb12
  %"38" = sub nsw i64 %"36", 2147483647, !dbg !91
  %"39" = sub nsw i64 %"38", 1, !dbg !91
  %"40" = srem i64 %"39", 4294967296, !dbg !91
  %"41" = add nsw i64 -2147483648, %"40", !dbg !91
  br label %main_wrap_around.exit4, !dbg !91

main_bb14:                                        ; preds = %main_bb12
  %"42" = icmp slt i64 %"36", -2147483648, !dbg !92
  br i1 %"42", label %main_bb15, label %main_wrap_around.exit4, !dbg !92

main_bb15:                                        ; preds = %main_bb14
  %"43" = sub nsw i64 -2147483648, %"36", !dbg !93
  %"44" = sub nsw i64 %"43", 1, !dbg !93
  %"45" = srem i64 %"44", 4294967296, !dbg !93
  %"46" = sub nsw i64 2147483647, %"45", !dbg !93
  br label %main_wrap_around.exit4, !dbg !93

main_wrap_around.exit4:                           ; preds = %main_bb13, %main_bb14, %main_bb15
  %.0.i3 = phi i64 [ %"41", %main_bb13 ], [ %"46", %main_bb15 ], [ %"36", %main_bb14 ], !dbg !81
  call void @llvm.dbg.value(metadata !{i64 %.0.i3}, i64 0, metadata !34), !dbg !35
  %"47" = add nsw i64 %base.0, 8, !dbg !94
  call void @llvm.dbg.value(metadata !{i64 %"47"}, i64 0, metadata !95), !dbg !96
  call void @llvm.dbg.value(metadata !60, i64 0, metadata !97), !dbg !98
  call void @llvm.dbg.value(metadata !63, i64 0, metadata !99), !dbg !100
  call void @llvm.dbg.value(metadata !66, i64 0, metadata !101), !dbg !102
  %"48" = icmp sgt i64 %"47", 2147483647, !dbg !103
  br i1 %"48", label %main_bb16, label %main_bb17, !dbg !103

main_bb16:                                        ; preds = %main_wrap_around.exit4
  %"49" = sub nsw i64 %"47", 2147483647, !dbg !104
  %"50" = sub nsw i64 %"49", 1, !dbg !104
  %"51" = srem i64 %"50", 4294967296, !dbg !104
  %"52" = add nsw i64 -2147483648, %"51", !dbg !104
  br label %main_wrap_around.exit2, !dbg !104

main_bb17:                                        ; preds = %main_wrap_around.exit4
  %"53" = icmp slt i64 %"47", -2147483648, !dbg !105
  br i1 %"53", label %main_bb18, label %main_wrap_around.exit2, !dbg !105

main_bb18:                                        ; preds = %main_bb17
  %"54" = sub nsw i64 -2147483648, %"47", !dbg !106
  %"55" = sub nsw i64 %"54", 1, !dbg !106
  %"56" = srem i64 %"55", 4294967296, !dbg !106
  %"57" = sub nsw i64 2147483647, %"56", !dbg !106
  br label %main_wrap_around.exit2, !dbg !106

main_bb19:                                        ; preds = %main_wrap_around.exit2
  ret void, !dbg !107
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

declare i64 @__kittel_nondef.0()

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13}
!llvm.ident = !{!14}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [//FILES_DIR/SourceCode_SemanticAugmentor.c] [DW_LANG_C99]
!1 = metadata !{metadata !"FILES_DIR/SourceCode_SemanticAugmentor.c", metadata !"/"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"wrap_around", metadata !"wrap_around", metadata !"", i32 4, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i64, i64, i64)* @wrap_around, null, null, metadata !2, i32 4} ; [ DW_TAG_subprogram ] [line 4] [def] [wrap_around]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 14, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @main, null, null, metadata !2, i32 15} ; [ DW_TAG_subprogram ] [line 14] [def] [scope 15] [main]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{null}
!12 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!13 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!14 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!15 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777220, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 4]
!16 = metadata !{i32 4, i32 33, metadata !4, null}
!17 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554436, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [lower_bound] [line 4]
!18 = metadata !{i32 4, i32 50, metadata !4, null}
!19 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331652, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [upper_bound] [line 4]
!20 = metadata !{i32 4, i32 73, metadata !4, null}
!21 = metadata !{i32 5, i32 5, metadata !4, null}
!22 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 5, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [range] [line 5]
!23 = metadata !{i32 5, i32 15, metadata !4, null}
!24 = metadata !{i32 6, i32 9, metadata !25, null}
!25 = metadata !{i32 786443, metadata !1, metadata !4, i32 6, i32 9, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!26 = metadata !{i32 7, i32 9, metadata !27, null}
!27 = metadata !{i32 786443, metadata !1, metadata !25, i32 6, i32 30, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!28 = metadata !{i32 9, i32 14, metadata !29, null}
!29 = metadata !{i32 786443, metadata !1, metadata !25, i32 9, i32 14, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!30 = metadata !{i32 10, i32 9, metadata !31, null}
!31 = metadata !{i32 786443, metadata !1, metadata !29, i32 9, i32 35, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!32 = metadata !{i32 13, i32 1, metadata !4, null}
!33 = metadata !{i64 0}
!34 = metadata !{i32 786688, metadata !9, metadata !"i", metadata !5, i32 16, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 16]
!35 = metadata !{i32 16, i32 13, metadata !9, null}
!36 = metadata !{i64 4}
!37 = metadata !{i32 786688, metadata !9, metadata !"base", metadata !5, i32 17, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [base] [line 17]
!38 = metadata !{i32 17, i32 13, metadata !9, null}
!39 = metadata !{i64 12}
!40 = metadata !{i32 786688, metadata !9, metadata !"count", metadata !5, i32 18, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 18]
!41 = metadata !{i32 18, i32 13, metadata !9, null}
!42 = metadata !{i32 786688, metadata !9, metadata !"old_", metadata !5, i32 19, metadata !43, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [old_] [line 19]
!43 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 640, i64 64, i32 0, i32 0, metadata !8, metadata !44, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 640, align 64, offset 0] [from long long int]
!44 = metadata !{metadata !45}
!45 = metadata !{i32 786465, i64 0, i64 10}       ; [ DW_TAG_subrange_type ] [0, 9]
!46 = metadata !{i32 19, i32 13, metadata !9, null}
!47 = metadata !{i32 19, i32 3, metadata !9, null}
!48 = metadata !{i32 786688, metadata !9, metadata !"new_", metadata !5, i32 20, metadata !43, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [new_] [line 20]
!49 = metadata !{i32 20, i32 13, metadata !9, null}
!50 = metadata !{i32 20, i32 3, metadata !9, null}
!51 = metadata !{i32 21, i32 3, metadata !9, null}
!52 = metadata !{i32 22, i32 3, metadata !9, null}
!53 = metadata !{i32 786688, metadata !54, metadata !"number", metadata !5, i32 24, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [number] [line 24]
!54 = metadata !{i32 786443, metadata !1, metadata !9, i32 23, i32 24, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!55 = metadata !{i32 24, i32 15, metadata !54, null}
!56 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777220, metadata !8, i32 0, metadata !57} ; [ DW_TAG_arg_variable ] [value] [line 4]
!57 = metadata !{i32 26, i32 17, metadata !58, null}
!58 = metadata !{i32 786443, metadata !1, metadata !54, i32 25, i32 32, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!59 = metadata !{i32 4, i32 33, metadata !4, metadata !57}
!60 = metadata !{i64 -2147483648}
!61 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554436, metadata !8, i32 0, metadata !57} ; [ DW_TAG_arg_variable ] [lower_bound] [line 4]
!62 = metadata !{i32 4, i32 50, metadata !4, metadata !57}
!63 = metadata !{i64 2147483647}
!64 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331652, metadata !8, i32 0, metadata !57} ; [ DW_TAG_arg_variable ] [upper_bound] [line 4]
!65 = metadata !{i32 4, i32 73, metadata !4, metadata !57}
!66 = metadata !{i64 4294967296}
!67 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 5, metadata !8, i32 0, metadata !57} ; [ DW_TAG_auto_variable ] [range] [line 5]
!68 = metadata !{i32 5, i32 15, metadata !4, metadata !57}
!69 = metadata !{i32 23, i32 3, metadata !9, null}
!70 = metadata !{i32 23, i32 3, metadata !71, null}
!71 = metadata !{i32 786443, metadata !1, metadata !9, i32 23, i32 3, i32 1, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!72 = metadata !{i32 25, i32 5, metadata !73, null}
!73 = metadata !{i32 786443, metadata !1, metadata !54, i32 25, i32 5, i32 1, i32 9} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!74 = metadata !{i32 25, i32 5, metadata !54, null}
!75 = metadata !{i32 6, i32 9, metadata !25, metadata !57}
!76 = metadata !{i32 7, i32 9, metadata !27, metadata !57}
!77 = metadata !{i32 9, i32 14, metadata !29, metadata !57}
!78 = metadata !{i32 10, i32 9, metadata !31, metadata !57}
!79 = metadata !{i32 27, i32 11, metadata !80, null}
!80 = metadata !{i32 786443, metadata !1, metadata !58, i32 27, i32 11, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!81 = metadata !{i32 31, i32 10, metadata !54, null}
!82 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777220, metadata !8, i32 0, metadata !81} ; [ DW_TAG_arg_variable ] [value] [line 4]
!83 = metadata !{i32 4, i32 33, metadata !4, metadata !81}
!84 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554436, metadata !8, i32 0, metadata !81} ; [ DW_TAG_arg_variable ] [lower_bound] [line 4]
!85 = metadata !{i32 4, i32 50, metadata !4, metadata !81}
!86 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331652, metadata !8, i32 0, metadata !81} ; [ DW_TAG_arg_variable ] [upper_bound] [line 4]
!87 = metadata !{i32 4, i32 73, metadata !4, metadata !81}
!88 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 5, metadata !8, i32 0, metadata !81} ; [ DW_TAG_auto_variable ] [range] [line 5]
!89 = metadata !{i32 5, i32 15, metadata !4, metadata !81}
!90 = metadata !{i32 6, i32 9, metadata !25, metadata !81}
!91 = metadata !{i32 7, i32 9, metadata !27, metadata !81}
!92 = metadata !{i32 9, i32 14, metadata !29, metadata !81}
!93 = metadata !{i32 10, i32 9, metadata !31, metadata !81}
!94 = metadata !{i32 32, i32 12, metadata !54, null}
!95 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777220, metadata !8, i32 0, metadata !94} ; [ DW_TAG_arg_variable ] [value] [line 4]
!96 = metadata !{i32 4, i32 33, metadata !4, metadata !94}
!97 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554436, metadata !8, i32 0, metadata !94} ; [ DW_TAG_arg_variable ] [lower_bound] [line 4]
!98 = metadata !{i32 4, i32 50, metadata !4, metadata !94}
!99 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331652, metadata !8, i32 0, metadata !94} ; [ DW_TAG_arg_variable ] [upper_bound] [line 4]
!100 = metadata !{i32 4, i32 73, metadata !4, metadata !94}
!101 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 5, metadata !8, i32 0, metadata !94} ; [ DW_TAG_auto_variable ] [range] [line 5]
!102 = metadata !{i32 5, i32 15, metadata !4, metadata !94}
!103 = metadata !{i32 6, i32 9, metadata !25, metadata !94}
!104 = metadata !{i32 7, i32 9, metadata !27, metadata !94}
!105 = metadata !{i32 9, i32 14, metadata !29, metadata !94}
!106 = metadata !{i32 10, i32 9, metadata !31, metadata !94}
!107 = metadata !{i32 34, i32 3, metadata !9, null}

