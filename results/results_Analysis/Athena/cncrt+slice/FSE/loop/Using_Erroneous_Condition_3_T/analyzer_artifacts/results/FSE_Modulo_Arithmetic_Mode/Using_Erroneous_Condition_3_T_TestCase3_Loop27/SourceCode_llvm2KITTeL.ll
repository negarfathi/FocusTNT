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
  %old_ = alloca [10 x i64], align 16
  %new_ = alloca [10 x i64], align 16
  call void @llvm.dbg.value(metadata !33, i64 0, metadata !34), !dbg !35
  call void @llvm.dbg.value(metadata !36, i64 0, metadata !37), !dbg !38
  call void @llvm.dbg.value(metadata !39, i64 0, metadata !40), !dbg !41
  call void @llvm.dbg.declare(metadata !{[10 x i64]* %old_}, metadata !42), !dbg !46
  %"12" = bitcast [10 x i64]* %old_ to i8*, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* %"12", i8 0, i64 80, i32 16, i1 false), !dbg !47
  call void @llvm.dbg.declare(metadata !{[10 x i64]* %new_}, metadata !48), !dbg !49
  %"13" = bitcast [10 x i64]* %new_ to i8*, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* %"13", i8 0, i64 80, i32 16, i1 false), !dbg !50
  %"14" = getelementptr inbounds [10 x i64]* %old_, i32 0, i64 9, !dbg !51
  store i64 0, i64* %"14", align 8, !dbg !51
  %"15" = getelementptr inbounds [10 x i64]* %new_, i32 0, i64 9, !dbg !52
  store i64 0, i64* %"15", align 8, !dbg !52
  call void @llvm.dbg.value(metadata !{i64 %"17"}, i64 0, metadata !53), !dbg !56
  call void @llvm.dbg.value(metadata !57, i64 0, metadata !58), !dbg !59
  call void @llvm.dbg.value(metadata !60, i64 0, metadata !61), !dbg !62
  call void @llvm.dbg.value(metadata !63, i64 0, metadata !64), !dbg !65
  call void @llvm.dbg.value(metadata !{i64 %.0.i}, i64 0, metadata !34), !dbg !35
  call void @llvm.dbg.value(metadata !{i64 %"28"}, i64 0, metadata !66), !dbg !68
  call void @llvm.dbg.value(metadata !57, i64 0, metadata !69), !dbg !70
  call void @llvm.dbg.value(metadata !60, i64 0, metadata !71), !dbg !72
  call void @llvm.dbg.value(metadata !63, i64 0, metadata !73), !dbg !74
  br label %main_wrap_around.exit2, !dbg !75

main_wrap_around.exit2:                           ; preds = %main_bb12, %main_bb11, %main_bb10, %main_bb5
  %base.0 = phi i64 [ 5, %main_bb5 ], [ %"33", %main_bb10 ], [ %"38", %main_bb12 ], [ %"28", %main_bb11 ]
  %i.0 = phi i64 [ 0, %main_bb5 ], [ %.0.i, %main_bb10 ], [ %.0.i, %main_bb11 ], [ %.0.i, %main_bb12 ]
  %"16" = icmp slt i64 %base.0, 30, !dbg !76
  br i1 %"16", label %main_bb6, label %main_bb13, !dbg !76

main_bb6:                                         ; preds = %main_wrap_around.exit2
  %"17" = add nsw i64 %i.0, 1, !dbg !54
  %"18" = icmp sgt i64 %"17", 2147483647, !dbg !78
  br i1 %"18", label %main_bb7, label %main_bb8, !dbg !78

main_bb7:                                         ; preds = %main_bb6
  %"19" = sub nsw i64 %"17", 2147483647, !dbg !79
  %"20" = sub nsw i64 %"19", 1, !dbg !79
  %"21" = srem i64 %"20", 4294967296, !dbg !79
  %"22" = add nsw i64 -2147483648, %"21", !dbg !79
  br label %main_wrap_around.exit, !dbg !79

main_bb8:                                         ; preds = %main_bb6
  %"23" = icmp slt i64 %"17", -2147483648, !dbg !80
  br i1 %"23", label %main_bb9, label %main_wrap_around.exit, !dbg !80

main_bb9:                                         ; preds = %main_bb8
  %"24" = sub nsw i64 -2147483648, %"17", !dbg !81
  %"25" = sub nsw i64 %"24", 1, !dbg !81
  %"26" = srem i64 %"25", 4294967296, !dbg !81
  %"27" = sub nsw i64 2147483647, %"26", !dbg !81
  br label %main_wrap_around.exit, !dbg !81

main_wrap_around.exit:                            ; preds = %main_bb7, %main_bb8, %main_bb9
  %.0.i = phi i64 [ %"22", %main_bb7 ], [ %"27", %main_bb9 ], [ %"17", %main_bb8 ], !dbg !54
  %"28" = add nsw i64 %base.0, 8, !dbg !67
  %"29" = icmp sgt i64 %"28", 2147483647, !dbg !82
  br i1 %"29", label %main_bb10, label %main_bb11, !dbg !82

main_bb10:                                        ; preds = %main_wrap_around.exit
  %"30" = sub nsw i64 %"28", 2147483647, !dbg !83
  %"31" = sub nsw i64 %"30", 1, !dbg !83
  %"32" = srem i64 %"31", 4294967296, !dbg !83
  %"33" = add nsw i64 -2147483648, %"32", !dbg !83
  br label %main_wrap_around.exit2, !dbg !83

main_bb11:                                        ; preds = %main_wrap_around.exit
  %"34" = icmp slt i64 %"28", -2147483648, !dbg !84
  br i1 %"34", label %main_bb12, label %main_wrap_around.exit2, !dbg !84

main_bb12:                                        ; preds = %main_bb11
  %"35" = sub nsw i64 -2147483648, %"28", !dbg !85
  %"36" = sub nsw i64 %"35", 1, !dbg !85
  %"37" = srem i64 %"36", 4294967296, !dbg !85
  %"38" = sub nsw i64 2147483647, %"37", !dbg !85
  br label %main_wrap_around.exit2, !dbg !85

main_bb13:                                        ; preds = %main_wrap_around.exit2
  ret void, !dbg !86
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #2

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
!36 = metadata !{i64 5}
!37 = metadata !{i32 786688, metadata !9, metadata !"base", metadata !5, i32 17, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [base] [line 17]
!38 = metadata !{i32 17, i32 13, metadata !9, null}
!39 = metadata !{i64 30}
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
!53 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777220, metadata !8, i32 0, metadata !54} ; [ DW_TAG_arg_variable ] [value] [line 4]
!54 = metadata !{i32 27, i32 24, metadata !55, null}
!55 = metadata !{i32 786443, metadata !1, metadata !9, i32 23, i32 24, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!56 = metadata !{i32 4, i32 33, metadata !4, metadata !54}
!57 = metadata !{i64 -2147483648}
!58 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554436, metadata !8, i32 0, metadata !54} ; [ DW_TAG_arg_variable ] [lower_bound] [line 4]
!59 = metadata !{i32 4, i32 50, metadata !4, metadata !54}
!60 = metadata !{i64 2147483647}
!61 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331652, metadata !8, i32 0, metadata !54} ; [ DW_TAG_arg_variable ] [upper_bound] [line 4]
!62 = metadata !{i32 4, i32 73, metadata !4, metadata !54}
!63 = metadata !{i64 4294967296}
!64 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 5, metadata !8, i32 0, metadata !54} ; [ DW_TAG_auto_variable ] [range] [line 5]
!65 = metadata !{i32 5, i32 15, metadata !4, metadata !54}
!66 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777220, metadata !8, i32 0, metadata !67} ; [ DW_TAG_arg_variable ] [value] [line 4]
!67 = metadata !{i32 28, i32 12, metadata !55, null}
!68 = metadata !{i32 4, i32 33, metadata !4, metadata !67}
!69 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554436, metadata !8, i32 0, metadata !67} ; [ DW_TAG_arg_variable ] [lower_bound] [line 4]
!70 = metadata !{i32 4, i32 50, metadata !4, metadata !67}
!71 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331652, metadata !8, i32 0, metadata !67} ; [ DW_TAG_arg_variable ] [upper_bound] [line 4]
!72 = metadata !{i32 4, i32 73, metadata !4, metadata !67}
!73 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 5, metadata !8, i32 0, metadata !67} ; [ DW_TAG_auto_variable ] [range] [line 5]
!74 = metadata !{i32 5, i32 15, metadata !4, metadata !67}
!75 = metadata !{i32 23, i32 3, metadata !9, null}
!76 = metadata !{i32 23, i32 3, metadata !77, null}
!77 = metadata !{i32 786443, metadata !1, metadata !9, i32 23, i32 3, i32 1, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!78 = metadata !{i32 6, i32 9, metadata !25, metadata !54}
!79 = metadata !{i32 7, i32 9, metadata !27, metadata !54}
!80 = metadata !{i32 9, i32 14, metadata !29, metadata !54}
!81 = metadata !{i32 10, i32 9, metadata !31, metadata !54}
!82 = metadata !{i32 6, i32 9, metadata !25, metadata !67}
!83 = metadata !{i32 7, i32 9, metadata !27, metadata !67}
!84 = metadata !{i32 9, i32 14, metadata !29, metadata !67}
!85 = metadata !{i32 10, i32 9, metadata !31, metadata !67}
!86 = metadata !{i32 30, i32 3, metadata !9, null}

