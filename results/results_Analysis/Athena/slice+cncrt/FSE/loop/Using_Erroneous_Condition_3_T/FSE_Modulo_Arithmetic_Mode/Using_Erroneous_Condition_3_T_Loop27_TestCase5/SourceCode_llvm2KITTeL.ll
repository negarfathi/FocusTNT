; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.old_ = private unnamed_addr constant [10 x i64] [i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4], align 16
@main.new_ = private unnamed_addr constant [10 x i64] [i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5], align 16

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
  call void @llvm.dbg.declare(metadata !{[10 x i64]* %old_}, metadata !33), !dbg !37
  %"12" = bitcast [10 x i64]* %old_ to i8*, !dbg !38
  %"13" = bitcast [10 x i64]* @main.old_ to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %"12", i8* %"13", i64 80, i32 16, i1 false), !dbg !38
  call void @llvm.dbg.declare(metadata !{[10 x i64]* %new_}, metadata !39), !dbg !40
  %"14" = bitcast [10 x i64]* %new_ to i8*, !dbg !41
  %"15" = bitcast [10 x i64]* @main.new_ to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %"14", i8* %"15", i64 80, i32 16, i1 false), !dbg !41
  call void @llvm.dbg.value(metadata !42, i64 0, metadata !43), !dbg !44
  call void @llvm.dbg.value(metadata !45, i64 0, metadata !46), !dbg !47
  call void @llvm.dbg.value(metadata !48, i64 0, metadata !49), !dbg !50
  call void @llvm.dbg.value(metadata !42, i64 0, metadata !51), !dbg !53
  call void @llvm.dbg.value(metadata !{i64 %"17"}, i64 0, metadata !54), !dbg !57
  call void @llvm.dbg.value(metadata !58, i64 0, metadata !59), !dbg !60
  call void @llvm.dbg.value(metadata !61, i64 0, metadata !62), !dbg !63
  call void @llvm.dbg.value(metadata !64, i64 0, metadata !65), !dbg !66
  br label %main_wrap_around.exit, !dbg !67

main_wrap_around.exit:                            ; preds = %main_bb9, %main_bb8, %main_bb7, %main_bb5
  %j.0 = phi i64 [ 0, %main_bb5 ], [ %"22", %main_bb7 ], [ %"27", %main_bb9 ], [ %"17", %main_bb8 ]
  %"16" = icmp slt i64 %j.0, 9, !dbg !68
  br i1 %"16", label %main_bb6, label %main_bb10, !dbg !68

main_bb6:                                         ; preds = %main_wrap_around.exit
  %"17" = add nsw i64 %j.0, 1, !dbg !55
  %"18" = icmp sgt i64 %"17", 2147483647, !dbg !70
  br i1 %"18", label %main_bb7, label %main_bb8, !dbg !70

main_bb7:                                         ; preds = %main_bb6
  %"19" = sub nsw i64 %"17", 2147483647, !dbg !71
  %"20" = sub nsw i64 %"19", 1, !dbg !71
  %"21" = srem i64 %"20", 4294967296, !dbg !71
  %"22" = add nsw i64 -2147483648, %"21", !dbg !71
  br label %main_wrap_around.exit, !dbg !71

main_bb8:                                         ; preds = %main_bb6
  %"23" = icmp slt i64 %"17", -2147483648, !dbg !72
  br i1 %"23", label %main_bb9, label %main_wrap_around.exit, !dbg !72

main_bb9:                                         ; preds = %main_bb8
  %"24" = sub nsw i64 -2147483648, %"17", !dbg !73
  %"25" = sub nsw i64 %"24", 1, !dbg !73
  %"26" = srem i64 %"25", 4294967296, !dbg !73
  %"27" = sub nsw i64 2147483647, %"26", !dbg !73
  br label %main_wrap_around.exit, !dbg !73

main_bb10:                                        ; preds = %main_wrap_around.exit
  %"28" = getelementptr inbounds [10 x i64]* %old_, i32 0, i64 9, !dbg !74
  store i64 0, i64* %"28", align 8, !dbg !74
  %"29" = getelementptr inbounds [10 x i64]* %new_, i32 0, i64 9, !dbg !75
  store i64 0, i64* %"29", align 8, !dbg !75
  call void @llvm.dbg.value(metadata !{i64 %base.0}, i64 0, metadata !76), !dbg !78
  call void @llvm.dbg.value(metadata !{i64 %"36"}, i64 0, metadata !79), !dbg !82
  call void @llvm.dbg.value(metadata !58, i64 0, metadata !83), !dbg !84
  call void @llvm.dbg.value(metadata !61, i64 0, metadata !85), !dbg !86
  call void @llvm.dbg.value(metadata !64, i64 0, metadata !87), !dbg !88
  call void @llvm.dbg.value(metadata !{i64 %.0.i5}, i64 0, metadata !76), !dbg !78
  br label %main_wrap_around.exit2, !dbg !89

main_wrap_around.exit2:                           ; preds = %main_bb23, %main_bb22, %main_bb21, %main_bb10
  %base.0 = phi i64 [ 100, %main_bb10 ], [ %"64", %main_bb21 ], [ %"69", %main_bb23 ], [ %"59", %main_bb22 ]
  %i.0 = phi i64 [ 0, %main_bb10 ], [ %.0.i3, %main_bb21 ], [ %.0.i3, %main_bb22 ], [ %.0.i3, %main_bb23 ]
  %"30" = icmp slt i64 %base.0, 110, !dbg !90
  br i1 %"30", label %main_bb11, label %main_bb24, !dbg !90

main_bb11:                                        ; preds = %main_wrap_around.exit2
  %"31" = getelementptr inbounds [10 x i64]* %old_, i32 0, i64 %i.0, !dbg !92
  %"32" = load i64* %"31", align 8, !dbg !92
  %"33" = getelementptr inbounds [10 x i64]* %new_, i32 0, i64 %i.0, !dbg !92
  %"34" = load i64* %"33", align 8, !dbg !92
  br label %main_bb12, !dbg !94

main_bb12:                                        ; preds = %main_wrap_around.exit6, %main_bb11
  %number.0 = phi i64 [ %base.0, %main_bb11 ], [ %.0.i5, %main_wrap_around.exit6 ]
  %"35" = icmp ne i64 %"32", %"34", !dbg !92
  br i1 %"35", label %main_bb13, label %main_bb17, !dbg !92

main_bb13:                                        ; preds = %main_bb12
  %"36" = add nsw i64 %number.0, 1, !dbg !80
  %"37" = icmp sgt i64 %"36", 2147483647, !dbg !95
  br i1 %"37", label %main_bb14, label %main_bb15, !dbg !95

main_bb14:                                        ; preds = %main_bb13
  %"38" = sub nsw i64 %"36", 2147483647, !dbg !96
  %"39" = sub nsw i64 %"38", 1, !dbg !96
  %"40" = srem i64 %"39", 4294967296, !dbg !96
  %"41" = add nsw i64 -2147483648, %"40", !dbg !96
  br label %main_wrap_around.exit6, !dbg !96

main_bb15:                                        ; preds = %main_bb13
  %"42" = icmp slt i64 %"36", -2147483648, !dbg !97
  br i1 %"42", label %main_bb16, label %main_wrap_around.exit6, !dbg !97

main_bb16:                                        ; preds = %main_bb15
  %"43" = sub nsw i64 -2147483648, %"36", !dbg !98
  %"44" = sub nsw i64 %"43", 1, !dbg !98
  %"45" = srem i64 %"44", 4294967296, !dbg !98
  %"46" = sub nsw i64 2147483647, %"45", !dbg !98
  br label %main_wrap_around.exit6, !dbg !98

main_wrap_around.exit6:                           ; preds = %main_bb14, %main_bb15, %main_bb16
  %.0.i5 = phi i64 [ %"41", %main_bb14 ], [ %"46", %main_bb16 ], [ %"36", %main_bb15 ], !dbg !80
  %"47" = icmp eq i64 %.0.i5, 110, !dbg !99
  br i1 %"47", label %main_bb17, label %main_bb12, !dbg !99

main_bb17:                                        ; preds = %main_wrap_around.exit6, %main_bb12
  %"48" = add nsw i64 %i.0, 1, !dbg !101
  call void @llvm.dbg.value(metadata !{i64 %"48"}, i64 0, metadata !102), !dbg !103
  call void @llvm.dbg.value(metadata !58, i64 0, metadata !104), !dbg !105
  call void @llvm.dbg.value(metadata !61, i64 0, metadata !106), !dbg !107
  call void @llvm.dbg.value(metadata !64, i64 0, metadata !108), !dbg !109
  %"49" = icmp sgt i64 %"48", 2147483647, !dbg !110
  br i1 %"49", label %main_bb18, label %main_bb19, !dbg !110

main_bb18:                                        ; preds = %main_bb17
  %"50" = sub nsw i64 %"48", 2147483647, !dbg !111
  %"51" = sub nsw i64 %"50", 1, !dbg !111
  %"52" = srem i64 %"51", 4294967296, !dbg !111
  %"53" = add nsw i64 -2147483648, %"52", !dbg !111
  br label %main_wrap_around.exit4, !dbg !111

main_bb19:                                        ; preds = %main_bb17
  %"54" = icmp slt i64 %"48", -2147483648, !dbg !112
  br i1 %"54", label %main_bb20, label %main_wrap_around.exit4, !dbg !112

main_bb20:                                        ; preds = %main_bb19
  %"55" = sub nsw i64 -2147483648, %"48", !dbg !113
  %"56" = sub nsw i64 %"55", 1, !dbg !113
  %"57" = srem i64 %"56", 4294967296, !dbg !113
  %"58" = sub nsw i64 2147483647, %"57", !dbg !113
  br label %main_wrap_around.exit4, !dbg !113

main_wrap_around.exit4:                           ; preds = %main_bb18, %main_bb19, %main_bb20
  %.0.i3 = phi i64 [ %"53", %main_bb18 ], [ %"58", %main_bb20 ], [ %"48", %main_bb19 ], !dbg !101
  call void @llvm.dbg.value(metadata !{i64 %.0.i3}, i64 0, metadata !43), !dbg !44
  %"59" = add nsw i64 %base.0, 8, !dbg !114
  call void @llvm.dbg.value(metadata !{i64 %"59"}, i64 0, metadata !115), !dbg !116
  call void @llvm.dbg.value(metadata !58, i64 0, metadata !117), !dbg !118
  call void @llvm.dbg.value(metadata !61, i64 0, metadata !119), !dbg !120
  call void @llvm.dbg.value(metadata !64, i64 0, metadata !121), !dbg !122
  %"60" = icmp sgt i64 %"59", 2147483647, !dbg !123
  br i1 %"60", label %main_bb21, label %main_bb22, !dbg !123

main_bb21:                                        ; preds = %main_wrap_around.exit4
  %"61" = sub nsw i64 %"59", 2147483647, !dbg !124
  %"62" = sub nsw i64 %"61", 1, !dbg !124
  %"63" = srem i64 %"62", 4294967296, !dbg !124
  %"64" = add nsw i64 -2147483648, %"63", !dbg !124
  br label %main_wrap_around.exit2, !dbg !124

main_bb22:                                        ; preds = %main_wrap_around.exit4
  %"65" = icmp slt i64 %"59", -2147483648, !dbg !125
  br i1 %"65", label %main_bb23, label %main_wrap_around.exit2, !dbg !125

main_bb23:                                        ; preds = %main_bb22
  %"66" = sub nsw i64 -2147483648, %"59", !dbg !126
  %"67" = sub nsw i64 %"66", 1, !dbg !126
  %"68" = srem i64 %"67", 4294967296, !dbg !126
  %"69" = sub nsw i64 2147483647, %"68", !dbg !126
  br label %main_wrap_around.exit2, !dbg !126

main_bb24:                                        ; preds = %main_wrap_around.exit2
  ret void, !dbg !127
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
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"wrap_around", metadata !"wrap_around", metadata !"", i32 7, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i64, i64, i64)* @wrap_around, null, null, metadata !2, i32 7} ; [ DW_TAG_subprogram ] [line 7] [def] [wrap_around]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 17, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @main, null, null, metadata !2, i32 18} ; [ DW_TAG_subprogram ] [line 17] [def] [scope 18] [main]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{null}
!12 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!13 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!14 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!15 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777223, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 7]
!16 = metadata !{i32 7, i32 33, metadata !4, null}
!17 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554439, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [lower_bound] [line 7]
!18 = metadata !{i32 7, i32 50, metadata !4, null}
!19 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331655, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [upper_bound] [line 7]
!20 = metadata !{i32 7, i32 73, metadata !4, null}
!21 = metadata !{i32 8, i32 5, metadata !4, null} ; [ DW_TAG_imported_declaration ]
!22 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 8, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [range] [line 8]
!23 = metadata !{i32 8, i32 15, metadata !4, null} ; [ DW_TAG_imported_declaration ]
!24 = metadata !{i32 9, i32 9, metadata !25, null}
!25 = metadata !{i32 786443, metadata !1, metadata !4, i32 9, i32 9, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!26 = metadata !{i32 10, i32 9, metadata !27, null}
!27 = metadata !{i32 786443, metadata !1, metadata !25, i32 9, i32 30, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!28 = metadata !{i32 12, i32 14, metadata !29, null}
!29 = metadata !{i32 786443, metadata !1, metadata !25, i32 12, i32 14, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!30 = metadata !{i32 13, i32 9, metadata !31, null}
!31 = metadata !{i32 786443, metadata !1, metadata !29, i32 12, i32 35, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!32 = metadata !{i32 16, i32 1, metadata !4, null}
!33 = metadata !{i32 786688, metadata !9, metadata !"old_", metadata !5, i32 19, metadata !34, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [old_] [line 19]
!34 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 640, i64 64, i32 0, i32 0, metadata !8, metadata !35, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 640, align 64, offset 0] [from long long int]
!35 = metadata !{metadata !36}
!36 = metadata !{i32 786465, i64 0, i64 10}       ; [ DW_TAG_subrange_type ] [0, 9]
!37 = metadata !{i32 19, i32 13, metadata !9, null}
!38 = metadata !{i32 19, i32 3, metadata !9, null}
!39 = metadata !{i32 786688, metadata !9, metadata !"new_", metadata !5, i32 20, metadata !34, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [new_] [line 20]
!40 = metadata !{i32 20, i32 13, metadata !9, null}
!41 = metadata !{i32 20, i32 3, metadata !9, null}
!42 = metadata !{i64 0}
!43 = metadata !{i32 786688, metadata !9, metadata !"i", metadata !5, i32 21, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 21]
!44 = metadata !{i32 21, i32 13, metadata !9, null}
!45 = metadata !{i64 100}
!46 = metadata !{i32 786688, metadata !9, metadata !"base", metadata !5, i32 22, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [base] [line 22]
!47 = metadata !{i32 22, i32 13, metadata !9, null}
!48 = metadata !{i64 110}
!49 = metadata !{i32 786688, metadata !9, metadata !"count", metadata !5, i32 23, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 23]
!50 = metadata !{i32 23, i32 13, metadata !9, null}
!51 = metadata !{i32 786688, metadata !52, metadata !"j", metadata !5, i32 25, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 25]
!52 = metadata !{i32 786443, metadata !1, metadata !9, i32 24, i32 3, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!53 = metadata !{i32 25, i32 15, metadata !52, null}
!54 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777223, metadata !8, i32 0, metadata !55} ; [ DW_TAG_arg_variable ] [value] [line 7]
!55 = metadata !{i32 29, i32 12, metadata !56, null}
!56 = metadata !{i32 786443, metadata !1, metadata !52, i32 26, i32 19, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!57 = metadata !{i32 7, i32 33, metadata !4, metadata !55}
!58 = metadata !{i64 -2147483648}
!59 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554439, metadata !8, i32 0, metadata !55} ; [ DW_TAG_arg_variable ] [lower_bound] [line 7]
!60 = metadata !{i32 7, i32 50, metadata !4, metadata !55}
!61 = metadata !{i64 2147483647}
!62 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331655, metadata !8, i32 0, metadata !55} ; [ DW_TAG_arg_variable ] [upper_bound] [line 7]
!63 = metadata !{i32 7, i32 73, metadata !4, metadata !55}
!64 = metadata !{i64 4294967296}
!65 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 8, metadata !8, i32 0, metadata !55} ; [ DW_TAG_auto_variable ] [range] [line 8]
!66 = metadata !{i32 8, i32 15, metadata !4, metadata !55} ; [ DW_TAG_imported_declaration ]
!67 = metadata !{i32 26, i32 5, metadata !52, null}
!68 = metadata !{i32 26, i32 5, metadata !69, null}
!69 = metadata !{i32 786443, metadata !1, metadata !52, i32 26, i32 5, i32 1, i32 10} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!70 = metadata !{i32 9, i32 9, metadata !25, metadata !55}
!71 = metadata !{i32 10, i32 9, metadata !27, metadata !55}
!72 = metadata !{i32 12, i32 14, metadata !29, metadata !55}
!73 = metadata !{i32 13, i32 9, metadata !31, metadata !55}
!74 = metadata !{i32 32, i32 3, metadata !9, null}
!75 = metadata !{i32 33, i32 3, metadata !9, null}
!76 = metadata !{i32 786688, metadata !77, metadata !"number", metadata !5, i32 35, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [number] [line 35]
!77 = metadata !{i32 786443, metadata !1, metadata !9, i32 34, i32 24, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!78 = metadata !{i32 35, i32 15, metadata !77, null}
!79 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777223, metadata !8, i32 0, metadata !80} ; [ DW_TAG_arg_variable ] [value] [line 7]
!80 = metadata !{i32 37, i32 17, metadata !81, null}
!81 = metadata !{i32 786443, metadata !1, metadata !77, i32 36, i32 32, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!82 = metadata !{i32 7, i32 33, metadata !4, metadata !80}
!83 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554439, metadata !8, i32 0, metadata !80} ; [ DW_TAG_arg_variable ] [lower_bound] [line 7]
!84 = metadata !{i32 7, i32 50, metadata !4, metadata !80}
!85 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331655, metadata !8, i32 0, metadata !80} ; [ DW_TAG_arg_variable ] [upper_bound] [line 7]
!86 = metadata !{i32 7, i32 73, metadata !4, metadata !80}
!87 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 8, metadata !8, i32 0, metadata !80} ; [ DW_TAG_auto_variable ] [range] [line 8]
!88 = metadata !{i32 8, i32 15, metadata !4, metadata !80} ; [ DW_TAG_imported_declaration ]
!89 = metadata !{i32 34, i32 3, metadata !9, null}
!90 = metadata !{i32 34, i32 3, metadata !91, null}
!91 = metadata !{i32 786443, metadata !1, metadata !9, i32 34, i32 3, i32 1, i32 11} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!92 = metadata !{i32 36, i32 5, metadata !93, null}
!93 = metadata !{i32 786443, metadata !1, metadata !77, i32 36, i32 5, i32 1, i32 12} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!94 = metadata !{i32 36, i32 5, metadata !77, null}
!95 = metadata !{i32 9, i32 9, metadata !25, metadata !80}
!96 = metadata !{i32 10, i32 9, metadata !27, metadata !80}
!97 = metadata !{i32 12, i32 14, metadata !29, metadata !80}
!98 = metadata !{i32 13, i32 9, metadata !31, metadata !80}
!99 = metadata !{i32 38, i32 11, metadata !100, null}
!100 = metadata !{i32 786443, metadata !1, metadata !81, i32 38, i32 11, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!101 = metadata !{i32 44, i32 10, metadata !77, null}
!102 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777223, metadata !8, i32 0, metadata !101} ; [ DW_TAG_arg_variable ] [value] [line 7]
!103 = metadata !{i32 7, i32 33, metadata !4, metadata !101}
!104 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554439, metadata !8, i32 0, metadata !101} ; [ DW_TAG_arg_variable ] [lower_bound] [line 7]
!105 = metadata !{i32 7, i32 50, metadata !4, metadata !101}
!106 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331655, metadata !8, i32 0, metadata !101} ; [ DW_TAG_arg_variable ] [upper_bound] [line 7]
!107 = metadata !{i32 7, i32 73, metadata !4, metadata !101}
!108 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 8, metadata !8, i32 0, metadata !101} ; [ DW_TAG_auto_variable ] [range] [line 8]
!109 = metadata !{i32 8, i32 15, metadata !4, metadata !101} ; [ DW_TAG_imported_declaration ]
!110 = metadata !{i32 9, i32 9, metadata !25, metadata !101}
!111 = metadata !{i32 10, i32 9, metadata !27, metadata !101}
!112 = metadata !{i32 12, i32 14, metadata !29, metadata !101}
!113 = metadata !{i32 13, i32 9, metadata !31, metadata !101}
!114 = metadata !{i32 45, i32 12, metadata !77, null}
!115 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777223, metadata !8, i32 0, metadata !114} ; [ DW_TAG_arg_variable ] [value] [line 7]
!116 = metadata !{i32 7, i32 33, metadata !4, metadata !114}
!117 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554439, metadata !8, i32 0, metadata !114} ; [ DW_TAG_arg_variable ] [lower_bound] [line 7]
!118 = metadata !{i32 7, i32 50, metadata !4, metadata !114}
!119 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331655, metadata !8, i32 0, metadata !114} ; [ DW_TAG_arg_variable ] [upper_bound] [line 7]
!120 = metadata !{i32 7, i32 73, metadata !4, metadata !114}
!121 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 8, metadata !8, i32 0, metadata !114} ; [ DW_TAG_auto_variable ] [range] [line 8]
!122 = metadata !{i32 8, i32 15, metadata !4, metadata !114} ; [ DW_TAG_imported_declaration ]
!123 = metadata !{i32 9, i32 9, metadata !25, metadata !114}
!124 = metadata !{i32 10, i32 9, metadata !27, metadata !114}
!125 = metadata !{i32 12, i32 14, metadata !29, metadata !114}
!126 = metadata !{i32 13, i32 9, metadata !31, metadata !114}
!127 = metadata !{i32 47, i32 3, metadata !9, null}

