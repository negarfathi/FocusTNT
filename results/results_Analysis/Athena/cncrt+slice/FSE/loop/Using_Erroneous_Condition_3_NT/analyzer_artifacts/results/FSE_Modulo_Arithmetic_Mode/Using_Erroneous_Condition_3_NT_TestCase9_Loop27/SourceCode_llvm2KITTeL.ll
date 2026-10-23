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
  call void @llvm.dbg.value(metadata !33, i64 0, metadata !36), !dbg !37
  call void @llvm.dbg.value(metadata !38, i64 0, metadata !39), !dbg !40
  call void @llvm.dbg.declare(metadata !{[10 x i64]* %old_}, metadata !41), !dbg !45
  %"12" = bitcast [10 x i64]* %old_ to i8*, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* %"12", i8 0, i64 80, i32 16, i1 false), !dbg !46
  call void @llvm.dbg.declare(metadata !{[10 x i64]* %new_}, metadata !47), !dbg !48
  %"13" = bitcast [10 x i64]* %new_ to i8*, !dbg !49
  call void @llvm.memset.p0i8.i64(i8* %"13", i8 0, i64 80, i32 16, i1 false), !dbg !49
  %"14" = bitcast i8* %"13" to [10 x i64]*, !dbg !49
  %"15" = getelementptr [10 x i64]* %"14", i32 0, i32 0, !dbg !49
  store i64 5, i64* %"15", !dbg !49
  call void @llvm.dbg.value(metadata !33, i64 0, metadata !50), !dbg !52
  %"16" = getelementptr inbounds [10 x i64]* %old_, i32 0, i64 0, !dbg !53
  %"17" = load i64* %"16", align 8, !dbg !53
  %"18" = getelementptr inbounds [10 x i64]* %new_, i32 0, i64 0, !dbg !53
  %"19" = load i64* %"18", align 8, !dbg !53
  call void @llvm.dbg.value(metadata !{i64 %"21"}, i64 0, metadata !55), !dbg !58
  call void @llvm.dbg.value(metadata !59, i64 0, metadata !60), !dbg !61
  call void @llvm.dbg.value(metadata !62, i64 0, metadata !63), !dbg !64
  call void @llvm.dbg.value(metadata !65, i64 0, metadata !66), !dbg !67
  call void @llvm.dbg.value(metadata !{i64 %.0.i}, i64 0, metadata !50), !dbg !52
  br label %main_bb6, !dbg !68

main_bb6:                                         ; preds = %main_wrap_around.exit, %main_bb5
  %number.0 = phi i64 [ 0, %main_bb5 ], [ %.0.i, %main_wrap_around.exit ]
  %"20" = icmp ne i64 %"17", %"19", !dbg !53
  br i1 %"20", label %main_bb7, label %main_bb11, !dbg !53

main_bb7:                                         ; preds = %main_bb6
  %"21" = add nsw i64 %number.0, 1, !dbg !56
  %"22" = icmp sgt i64 %"21", 2147483647, !dbg !69
  br i1 %"22", label %main_bb8, label %main_bb9, !dbg !69

main_bb8:                                         ; preds = %main_bb7
  %"23" = sub nsw i64 %"21", 2147483647, !dbg !70
  %"24" = sub nsw i64 %"23", 1, !dbg !70
  %"25" = srem i64 %"24", 4294967296, !dbg !70
  %"26" = add nsw i64 -2147483648, %"25", !dbg !70
  br label %main_wrap_around.exit, !dbg !70

main_bb9:                                         ; preds = %main_bb7
  %"27" = icmp slt i64 %"21", -2147483648, !dbg !71
  br i1 %"27", label %main_bb10, label %main_wrap_around.exit, !dbg !71

main_bb10:                                        ; preds = %main_bb9
  %"28" = sub nsw i64 -2147483648, %"21", !dbg !72
  %"29" = sub nsw i64 %"28", 1, !dbg !72
  %"30" = srem i64 %"29", 4294967296, !dbg !72
  %"31" = sub nsw i64 2147483647, %"30", !dbg !72
  br label %main_wrap_around.exit, !dbg !72

main_wrap_around.exit:                            ; preds = %main_bb8, %main_bb9, %main_bb10
  %.0.i = phi i64 [ %"26", %main_bb8 ], [ %"31", %main_bb10 ], [ %"21", %main_bb9 ], !dbg !56
  %"32" = icmp eq i64 %.0.i, 5, !dbg !73
  br i1 %"32", label %main_bb11, label %main_bb6, !dbg !73

main_bb11:                                        ; preds = %main_bb6, %main_wrap_around.exit
  ret void, !dbg !75
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
!36 = metadata !{i32 786688, metadata !9, metadata !"base", metadata !5, i32 17, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [base] [line 17]
!37 = metadata !{i32 17, i32 13, metadata !9, null}
!38 = metadata !{i64 5}
!39 = metadata !{i32 786688, metadata !9, metadata !"count", metadata !5, i32 18, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 18]
!40 = metadata !{i32 18, i32 13, metadata !9, null}
!41 = metadata !{i32 786688, metadata !9, metadata !"old_", metadata !5, i32 19, metadata !42, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [old_] [line 19]
!42 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 640, i64 64, i32 0, i32 0, metadata !8, metadata !43, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 640, align 64, offset 0] [from long long int]
!43 = metadata !{metadata !44}
!44 = metadata !{i32 786465, i64 0, i64 10}       ; [ DW_TAG_subrange_type ] [0, 9]
!45 = metadata !{i32 19, i32 13, metadata !9, null}
!46 = metadata !{i32 19, i32 3, metadata !9, null}
!47 = metadata !{i32 786688, metadata !9, metadata !"new_", metadata !5, i32 20, metadata !42, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [new_] [line 20]
!48 = metadata !{i32 20, i32 13, metadata !9, null}
!49 = metadata !{i32 20, i32 3, metadata !9, null}
!50 = metadata !{i32 786688, metadata !51, metadata !"number", metadata !5, i32 22, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [number] [line 22]
!51 = metadata !{i32 786443, metadata !1, metadata !9, i32 21, i32 3, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!52 = metadata !{i32 22, i32 15, metadata !51, null}
!53 = metadata !{i32 23, i32 5, metadata !54, null}
!54 = metadata !{i32 786443, metadata !1, metadata !51, i32 23, i32 5, i32 1, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!55 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777220, metadata !8, i32 0, metadata !56} ; [ DW_TAG_arg_variable ] [value] [line 4]
!56 = metadata !{i32 24, i32 17, metadata !57, null}
!57 = metadata !{i32 786443, metadata !1, metadata !51, i32 23, i32 32, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!58 = metadata !{i32 4, i32 33, metadata !4, metadata !56}
!59 = metadata !{i64 -2147483648}
!60 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554436, metadata !8, i32 0, metadata !56} ; [ DW_TAG_arg_variable ] [lower_bound] [line 4]
!61 = metadata !{i32 4, i32 50, metadata !4, metadata !56}
!62 = metadata !{i64 2147483647}
!63 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331652, metadata !8, i32 0, metadata !56} ; [ DW_TAG_arg_variable ] [upper_bound] [line 4]
!64 = metadata !{i32 4, i32 73, metadata !4, metadata !56}
!65 = metadata !{i64 4294967296}
!66 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 5, metadata !8, i32 0, metadata !56} ; [ DW_TAG_auto_variable ] [range] [line 5]
!67 = metadata !{i32 5, i32 15, metadata !4, metadata !56}
!68 = metadata !{i32 23, i32 5, metadata !51, null}
!69 = metadata !{i32 6, i32 9, metadata !25, metadata !56}
!70 = metadata !{i32 7, i32 9, metadata !27, metadata !56}
!71 = metadata !{i32 9, i32 14, metadata !29, metadata !56}
!72 = metadata !{i32 10, i32 9, metadata !31, metadata !56}
!73 = metadata !{i32 25, i32 11, metadata !74, null}
!74 = metadata !{i32 786443, metadata !1, metadata !57, i32 25, i32 11, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!75 = metadata !{i32 31, i32 3, metadata !9, null}

