; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

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
  call void @llvm.dbg.value(metadata !34, i64 0, metadata !35), !dbg !36
  call void @llvm.dbg.value(metadata !34, i64 0, metadata !37), !dbg !38
  call void @llvm.dbg.value(metadata !34, i64 0, metadata !39), !dbg !40
  call void @llvm.dbg.value(metadata !{i64 %"13"}, i64 0, metadata !41), !dbg !44
  call void @llvm.dbg.value(metadata !45, i64 0, metadata !46), !dbg !47
  call void @llvm.dbg.value(metadata !48, i64 0, metadata !49), !dbg !50
  call void @llvm.dbg.value(metadata !51, i64 0, metadata !52), !dbg !53
  br label %main_wrap_around.exit, !dbg !54

main_wrap_around.exit:                            ; preds = %main_bb9, %main_bb8, %main_bb7, %main_bb5
  %ac.0 = phi i64 [ 250, %main_bb5 ], [ %"17", %main_bb7 ], [ %"22", %main_bb9 ], [ %"13", %main_bb8 ]
  %"12" = icmp ne i64 %ac.0, 250, !dbg !55
  br i1 %"12", label %main_bb6, label %main_bb10, !dbg !55

main_bb6:                                         ; preds = %main_wrap_around.exit
  %"13" = add nsw i64 %ac.0, 1, !dbg !42
  %"14" = icmp sgt i64 %"13", 255, !dbg !58
  br i1 %"14", label %main_bb7, label %main_bb8, !dbg !58

main_bb7:                                         ; preds = %main_bb6
  %"15" = sub nsw i64 %"13", 255, !dbg !59
  %"16" = sub nsw i64 %"15", 1, !dbg !59
  %"17" = srem i64 %"16", 256, !dbg !59
  br label %main_wrap_around.exit, !dbg !59

main_bb8:                                         ; preds = %main_bb6
  %"18" = icmp slt i64 %"13", 0, !dbg !60
  br i1 %"18", label %main_bb9, label %main_wrap_around.exit, !dbg !60

main_bb9:                                         ; preds = %main_bb8
  %"19" = sub nsw i64 0, %"13", !dbg !61
  %"20" = sub nsw i64 %"19", 1, !dbg !61
  %"21" = srem i64 %"20", 256, !dbg !61
  %"22" = sub nsw i64 255, %"21", !dbg !61
  br label %main_wrap_around.exit, !dbg !61

main_bb10:                                        ; preds = %main_wrap_around.exit
  ret i32 0, !dbg !62
}

declare i64 @__kittel_nondef.0()

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

declare i32 @__kittel_nondef.1()

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

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
!34 = metadata !{i64 250}
!35 = metadata !{i32 786688, metadata !9, metadata !"c1", metadata !5, i32 25, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [c1] [line 25]
!36 = metadata !{i32 25, i32 12, metadata !9, null}
!37 = metadata !{i32 786688, metadata !9, metadata !"c2", metadata !5, i32 26, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [c2] [line 26]
!38 = metadata !{i32 26, i32 12, metadata !9, null}
!39 = metadata !{i32 786688, metadata !9, metadata !"ac", metadata !5, i32 27, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ac] [line 27]
!40 = metadata !{i32 27, i32 12, metadata !9, null}
!41 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777229, metadata !8, i32 0, metadata !42} ; [ DW_TAG_arg_variable ] [value] [line 13]
!42 = metadata !{i32 28, i32 34, metadata !43, null}
!43 = metadata !{i32 786443, metadata !1, metadata !9, i32 28, i32 2, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!44 = metadata !{i32 13, i32 33, metadata !4, metadata !42}
!45 = metadata !{i64 0}
!46 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554445, metadata !8, i32 0, metadata !42} ; [ DW_TAG_arg_variable ] [lower_bound] [line 13]
!47 = metadata !{i32 13, i32 50, metadata !4, metadata !42}
!48 = metadata !{i64 255}
!49 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331661, metadata !8, i32 0, metadata !42} ; [ DW_TAG_arg_variable ] [upper_bound] [line 13]
!50 = metadata !{i32 13, i32 73, metadata !4, metadata !42}
!51 = metadata !{i64 256}
!52 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 14, metadata !8, i32 0, metadata !42} ; [ DW_TAG_auto_variable ] [range] [line 14]
!53 = metadata !{i32 14, i32 15, metadata !4, metadata !42}
!54 = metadata !{i32 28, i32 7, metadata !43, null}
!55 = metadata !{i32 28, i32 7, metadata !56, null}
!56 = metadata !{i32 786443, metadata !1, metadata !57, i32 28, i32 7, i32 2, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!57 = metadata !{i32 786443, metadata !1, metadata !43, i32 28, i32 7, i32 1, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!58 = metadata !{i32 15, i32 9, metadata !26, metadata !42}
!59 = metadata !{i32 16, i32 9, metadata !28, metadata !42}
!60 = metadata !{i32 18, i32 14, metadata !30, metadata !42}
!61 = metadata !{i32 19, i32 9, metadata !32, metadata !42}
!62 = metadata !{i32 32, i32 2, metadata !9, null}

