; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@"'flag" = global i64 0, align 8
@"'count" = global i64 0, align 8

; Function Attrs: nounwind uwtable
define i64 @wrap_around(i64 %value, i64 %lower_bound, i64 %upper_bound) #0 {
wrap_around_bb0:
  call void @llvm.dbg.value(metadata !{i64 %value}, i64 0, metadata !22), !dbg !23
  call void @llvm.dbg.value(metadata !{i64 %lower_bound}, i64 0, metadata !24), !dbg !25
  call void @llvm.dbg.value(metadata !{i64 %upper_bound}, i64 0, metadata !26), !dbg !27
  %"0" = sub nsw i64 %upper_bound, %lower_bound, !dbg !28
  %"1" = add nsw i64 %"0", 1, !dbg !28
  call void @llvm.dbg.value(metadata !{i64 %"1"}, i64 0, metadata !29), !dbg !30
  %"2" = icmp sgt i64 %value, %upper_bound, !dbg !31
  br i1 %"2", label %wrap_around_bb1, label %wrap_around_bb2, !dbg !31

wrap_around_bb1:                                  ; preds = %wrap_around_bb0
  %"3" = sub nsw i64 %value, %upper_bound, !dbg !33
  %"4" = sub nsw i64 %"3", 1, !dbg !33
  %"5" = srem i64 %"4", %"1", !dbg !33
  %"6" = add nsw i64 %lower_bound, %"5", !dbg !33
  br label %wrap_around_bb4, !dbg !33

wrap_around_bb2:                                  ; preds = %wrap_around_bb0
  %"7" = icmp slt i64 %value, %lower_bound, !dbg !35
  br i1 %"7", label %wrap_around_bb3, label %wrap_around_bb4, !dbg !35

wrap_around_bb3:                                  ; preds = %wrap_around_bb2
  %"8" = sub nsw i64 %lower_bound, %value, !dbg !37
  %"9" = sub nsw i64 %"8", 1, !dbg !37
  %"10" = srem i64 %"9", %"1", !dbg !37
  %"11" = sub nsw i64 %upper_bound, %"10", !dbg !37
  br label %wrap_around_bb4, !dbg !37

wrap_around_bb4:                                  ; preds = %wrap_around_bb2, %wrap_around_bb3, %wrap_around_bb1
  %.0 = phi i64 [ %"6", %wrap_around_bb1 ], [ %"11", %wrap_around_bb3 ], [ %value, %wrap_around_bb2 ]
  ret i64 %.0, !dbg !39
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i64 @read() #0 {
read_bb5:
  %"12" = load i64* @"'flag", align 8, !dbg !40
  %"13" = icmp eq i64 %"12", 1, !dbg !40
  %"14" = load i64* @"'count", align 8
  %"15" = icmp sgt i64 %"14", 100, !dbg !42
  %or.cond = or i1 %"13", %"15", !dbg !40
  br i1 %or.cond, label %read_bb13, label %read_bb6, !dbg !40

read_bb6:                                         ; preds = %read_bb5
  call void @llvm.dbg.value(metadata !44, i64 0, metadata !45), !dbg !46
  %"16" = icmp sle i64 -100, 0, !dbg !47
  br i1 %"16", label %read_bb13, label %read_bb7, !dbg !47

read_bb7:                                         ; preds = %read_bb6
  %"17" = srem i64 -100, 1000, !dbg !49
  call void @llvm.dbg.value(metadata !{i64 %"17"}, i64 0, metadata !51), !dbg !52
  call void @llvm.dbg.value(metadata !53, i64 0, metadata !54), !dbg !55
  call void @llvm.dbg.value(metadata !56, i64 0, metadata !57), !dbg !58
  call void @llvm.dbg.value(metadata !59, i64 0, metadata !60), !dbg !61
  call void @llvm.dbg.value(metadata !{i64 %"17"}, i64 0, metadata !45), !dbg !46
  %"18" = icmp slt i64 %"17", 995, !dbg !62
  br i1 %"18", label %read_bb8, label %read_bb12, !dbg !62

read_bb8:                                         ; preds = %read_bb7
  %"19" = load i64* @"'count", align 8, !dbg !64
  %"20" = add nsw i64 %"19", 1, !dbg !64
  call void @llvm.dbg.value(metadata !{i64 %"20"}, i64 0, metadata !66), !dbg !67
  call void @llvm.dbg.value(metadata !53, i64 0, metadata !68), !dbg !69
  call void @llvm.dbg.value(metadata !56, i64 0, metadata !70), !dbg !71
  call void @llvm.dbg.value(metadata !59, i64 0, metadata !72), !dbg !73
  %"21" = icmp sgt i64 %"20", 2147483647, !dbg !74
  br i1 %"21", label %read_bb9, label %read_bb10, !dbg !74

read_bb9:                                         ; preds = %read_bb8
  %"22" = sub nsw i64 %"20", 2147483647, !dbg !75
  %"23" = sub nsw i64 %"22", 1, !dbg !75
  %"24" = srem i64 %"23", 4294967296, !dbg !75
  %"25" = add nsw i64 -2147483648, %"24", !dbg !75
  br label %read_wrap_around.exit, !dbg !75

read_bb10:                                        ; preds = %read_bb8
  %"26" = icmp slt i64 %"20", -2147483648, !dbg !76
  br i1 %"26", label %read_bb11, label %read_wrap_around.exit, !dbg !76

read_bb11:                                        ; preds = %read_bb10
  %"27" = sub nsw i64 -2147483648, %"20", !dbg !77
  %"28" = sub nsw i64 %"27", 1, !dbg !77
  %"29" = srem i64 %"28", 4294967296, !dbg !77
  %"30" = sub nsw i64 2147483647, %"29", !dbg !77
  br label %read_wrap_around.exit, !dbg !77

read_wrap_around.exit:                            ; preds = %read_bb9, %read_bb10, %read_bb11
  %.0.i = phi i64 [ %"25", %read_bb9 ], [ %"30", %read_bb11 ], [ %"20", %read_bb10 ], !dbg !64
  store i64 %.0.i, i64* @"'count", align 8, !dbg !64
  br label %read_bb13, !dbg !78

read_bb12:                                        ; preds = %read_bb7
  store i64 1, i64* @"'flag", align 8, !dbg !79
  br label %read_bb13, !dbg !81

read_bb13:                                        ; preds = %read_bb6, %read_bb5, %read_bb12, %read_wrap_around.exit
  %.0 = phi i64 [ %"17", %read_wrap_around.exit ], [ 0, %read_bb12 ], [ 0, %read_bb5 ], [ -1, %read_bb6 ]
  ret i64 %.0, !dbg !82
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
main_bb14:
  %"31" = load i64* @"'flag", align 8, !dbg !83
  %"32" = load i64* @"'count", align 8, !dbg !84
  call void @llvm.dbg.value(metadata !44, i64 0, metadata !87), !dbg !88
  br label %main_read.exit, !dbg !89

main_read.exit:                                   ; preds = %main_read.exit, %main_bb14
  %"33" = icmp eq i64 %"31", 1, !dbg !83
  %"34" = icmp sgt i64 %"32", 100, !dbg !90
  %or.cond.i = or i1 %"33", %"34", !dbg !83
  %. = select i1 %or.cond.i, i64 0, i64 -1, !dbg !83
  %"35" = icmp slt i64 %., 0, !dbg !84
  br i1 %"35", label %main_bb15, label %main_read.exit, !dbg !84

main_bb15:                                        ; preds = %main_read.exit
  ret i32 0, !dbg !91
}

declare i64 @__kittel_nondef.0()

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

declare i32 @__kittel_nondef.1()

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!19, !20}
!llvm.ident = !{!21}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !16, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [//FILES_DIR/SourceCode_SemanticAugmentor.c] [DW_LANG_C99]
!1 = metadata !{metadata !"FILES_DIR/SourceCode_SemanticAugmentor.c", metadata !"/"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9, metadata !12}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"wrap_around", metadata !"wrap_around", metadata !"", i32 14, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i64, i64, i64)* @wrap_around, null, null, metadata !2, i32 14} ; [ DW_TAG_subprogram ] [line 14] [def] [wrap_around]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"read", metadata !"read", metadata !"", i32 24, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i64 ()* @read, null, null, metadata !2, i32 25} ; [ DW_TAG_subprogram ] [line 24] [def] [scope 25] [read]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !8}
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 51, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 52} ; [ DW_TAG_subprogram ] [line 51] [def] [scope 52] [main]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{metadata !15}
!15 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!16 = metadata !{metadata !17, metadata !18}
!17 = metadata !{i32 786484, i32 0, null, metadata !"flag", metadata !"flag", metadata !"", metadata !5, i32 12, metadata !8, i32 0, i32 1, i64* @"'flag", null} ; [ DW_TAG_variable ] [flag] [line 12] [def]
!18 = metadata !{i32 786484, i32 0, null, metadata !"count", metadata !"count", metadata !"", metadata !5, i32 13, metadata !8, i32 0, i32 1, i64* @"'count", null} ; [ DW_TAG_variable ] [count] [line 13] [def]
!19 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!20 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!21 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!22 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777230, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 14]
!23 = metadata !{i32 14, i32 33, metadata !4, null}
!24 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554446, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [lower_bound] [line 14]
!25 = metadata !{i32 14, i32 50, metadata !4, null}
!26 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331662, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [upper_bound] [line 14]
!27 = metadata !{i32 14, i32 73, metadata !4, null}
!28 = metadata !{i32 15, i32 5, metadata !4, null}
!29 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 15, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [range] [line 15]
!30 = metadata !{i32 15, i32 15, metadata !4, null}
!31 = metadata !{i32 16, i32 9, metadata !32, null}
!32 = metadata !{i32 786443, metadata !1, metadata !4, i32 16, i32 9, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!33 = metadata !{i32 17, i32 9, metadata !34, null}
!34 = metadata !{i32 786443, metadata !1, metadata !32, i32 16, i32 30, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!35 = metadata !{i32 19, i32 14, metadata !36, null}
!36 = metadata !{i32 786443, metadata !1, metadata !32, i32 19, i32 14, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!37 = metadata !{i32 20, i32 9, metadata !38, null}
!38 = metadata !{i32 786443, metadata !1, metadata !36, i32 19, i32 35, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!39 = metadata !{i32 23, i32 1, metadata !4, null}
!40 = metadata !{i32 26, i32 9, metadata !41, null}
!41 = metadata !{i32 786443, metadata !1, metadata !9, i32 26, i32 9, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!42 = metadata !{i32 26, i32 9, metadata !43, null}
!43 = metadata !{i32 786443, metadata !1, metadata !41, i32 26, i32 9, i32 1, i32 15} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!44 = metadata !{i64 -100}
!45 = metadata !{i32 786688, metadata !9, metadata !"num", metadata !5, i32 30, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [num] [line 30]
!46 = metadata !{i32 30, i32 15, metadata !9, null}
!47 = metadata !{i32 31, i32 9, metadata !48, null}
!48 = metadata !{i32 786443, metadata !1, metadata !9, i32 31, i32 9, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!49 = metadata !{i32 37, i32 15, metadata !50, null}
!50 = metadata !{i32 786443, metadata !1, metadata !48, i32 36, i32 5, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!51 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777230, metadata !8, i32 0, metadata !49} ; [ DW_TAG_arg_variable ] [value] [line 14]
!52 = metadata !{i32 14, i32 33, metadata !4, metadata !49}
!53 = metadata !{i64 -2147483648}
!54 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554446, metadata !8, i32 0, metadata !49} ; [ DW_TAG_arg_variable ] [lower_bound] [line 14]
!55 = metadata !{i32 14, i32 50, metadata !4, metadata !49}
!56 = metadata !{i64 2147483647}
!57 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331662, metadata !8, i32 0, metadata !49} ; [ DW_TAG_arg_variable ] [upper_bound] [line 14]
!58 = metadata !{i32 14, i32 73, metadata !4, metadata !49}
!59 = metadata !{i64 4294967296}
!60 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 15, metadata !8, i32 0, metadata !49} ; [ DW_TAG_auto_variable ] [range] [line 15]
!61 = metadata !{i32 15, i32 15, metadata !4, metadata !49}
!62 = metadata !{i32 38, i32 13, metadata !63, null}
!63 = metadata !{i32 786443, metadata !1, metadata !50, i32 38, i32 13, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!64 = metadata !{i32 40, i32 22, metadata !65, null}
!65 = metadata !{i32 786443, metadata !1, metadata !63, i32 39, i32 9, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!66 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777230, metadata !8, i32 0, metadata !64} ; [ DW_TAG_arg_variable ] [value] [line 14]
!67 = metadata !{i32 14, i32 33, metadata !4, metadata !64}
!68 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554446, metadata !8, i32 0, metadata !64} ; [ DW_TAG_arg_variable ] [lower_bound] [line 14]
!69 = metadata !{i32 14, i32 50, metadata !4, metadata !64}
!70 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331662, metadata !8, i32 0, metadata !64} ; [ DW_TAG_arg_variable ] [upper_bound] [line 14]
!71 = metadata !{i32 14, i32 73, metadata !4, metadata !64}
!72 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 15, metadata !8, i32 0, metadata !64} ; [ DW_TAG_auto_variable ] [range] [line 15]
!73 = metadata !{i32 15, i32 15, metadata !4, metadata !64}
!74 = metadata !{i32 16, i32 9, metadata !32, metadata !64}
!75 = metadata !{i32 17, i32 9, metadata !34, metadata !64}
!76 = metadata !{i32 19, i32 14, metadata !36, metadata !64}
!77 = metadata !{i32 20, i32 9, metadata !38, metadata !64}
!78 = metadata !{i32 41, i32 13, metadata !65, null}
!79 = metadata !{i32 45, i32 13, metadata !80, null}
!80 = metadata !{i32 786443, metadata !1, metadata !63, i32 44, i32 9, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!81 = metadata !{i32 46, i32 13, metadata !80, null}
!82 = metadata !{i32 50, i32 1, metadata !9, null}
!83 = metadata !{i32 26, i32 9, metadata !41, metadata !84}
!84 = metadata !{i32 55, i32 13, metadata !85, null}
!85 = metadata !{i32 786443, metadata !1, metadata !86, i32 55, i32 13, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!86 = metadata !{i32 786443, metadata !1, metadata !12, i32 54, i32 5, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!87 = metadata !{i32 786688, metadata !9, metadata !"num", metadata !5, i32 30, metadata !8, i32 0, metadata !84} ; [ DW_TAG_auto_variable ] [num] [line 30]
!88 = metadata !{i32 30, i32 15, metadata !9, metadata !84}
!89 = metadata !{i32 53, i32 5, metadata !12, null}
!90 = metadata !{i32 26, i32 9, metadata !43, metadata !84}
!91 = metadata !{i32 60, i32 5, metadata !12, null}

