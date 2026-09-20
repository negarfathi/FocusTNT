; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@"'errno" = common global i64 0, align 8

; Function Attrs: nounwind uwtable
define i64 @wrap_around(i64 %value, i64 %lower_bound, i64 %upper_bound) #0 {
wrap_around_bb0:
  call void @llvm.dbg.value(metadata !{i64 %value}, i64 0, metadata !21), !dbg !22
  call void @llvm.dbg.value(metadata !{i64 %lower_bound}, i64 0, metadata !23), !dbg !24
  call void @llvm.dbg.value(metadata !{i64 %upper_bound}, i64 0, metadata !25), !dbg !26
  %"0" = sub nsw i64 %upper_bound, %lower_bound, !dbg !27
  %"1" = add nsw i64 %"0", 1, !dbg !27
  call void @llvm.dbg.value(metadata !{i64 %"1"}, i64 0, metadata !28), !dbg !29
  %"2" = icmp sgt i64 %value, %upper_bound, !dbg !30
  br i1 %"2", label %wrap_around_bb1, label %wrap_around_bb2, !dbg !30

wrap_around_bb1:                                  ; preds = %wrap_around_bb0
  %"3" = sub nsw i64 %value, %upper_bound, !dbg !32
  %"4" = sub nsw i64 %"3", 1, !dbg !32
  %"5" = srem i64 %"4", %"1", !dbg !32
  %"6" = add nsw i64 %lower_bound, %"5", !dbg !32
  br label %wrap_around_bb4, !dbg !32

wrap_around_bb2:                                  ; preds = %wrap_around_bb0
  %"7" = icmp slt i64 %value, %lower_bound, !dbg !34
  br i1 %"7", label %wrap_around_bb3, label %wrap_around_bb4, !dbg !34

wrap_around_bb3:                                  ; preds = %wrap_around_bb2
  %"8" = sub nsw i64 %lower_bound, %value, !dbg !36
  %"9" = sub nsw i64 %"8", 1, !dbg !36
  %"10" = srem i64 %"9", %"1", !dbg !36
  %"11" = sub nsw i64 %upper_bound, %"10", !dbg !36
  br label %wrap_around_bb4, !dbg !36

wrap_around_bb4:                                  ; preds = %wrap_around_bb2, %wrap_around_bb3, %wrap_around_bb1
  %.0 = phi i64 [ %"6", %wrap_around_bb1 ], [ %"11", %wrap_around_bb3 ], [ %value, %wrap_around_bb2 ]
  ret i64 %.0, !dbg !38
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i64 @waitpid() #0 {
waitpid_bb5:
  call void @llvm.dbg.value(metadata !39, i64 0, metadata !40), !dbg !41
  %"12" = icmp slt i64 -50, 0, !dbg !42
  br i1 %"12", label %waitpid_bb6, label %waitpid_bb9, !dbg !42

waitpid_bb6:                                      ; preds = %waitpid_bb5
  %"13" = load i64* @"'errno", align 8, !dbg !44
  %"14" = icmp ne i64 %"13", 1, !dbg !44
  br i1 %"14", label %waitpid_bb7, label %waitpid_bb8, !dbg !44

waitpid_bb7:                                      ; preds = %waitpid_bb6
  store i64 1, i64* @"'errno", align 8, !dbg !47
  br label %waitpid_bb9, !dbg !49

waitpid_bb8:                                      ; preds = %waitpid_bb6
  store i64 2, i64* @"'errno", align 8, !dbg !50
  br label %waitpid_bb9

waitpid_bb9:                                      ; preds = %waitpid_bb5, %waitpid_bb7, %waitpid_bb8
  ret i64 -50, !dbg !51
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
main_bb10:
  call void @llvm.dbg.value(metadata !39, i64 0, metadata !52), !dbg !54
  %"15" = load i64* @"'errno", align 8, !dbg !55
  %"16" = icmp ne i64 %"15", 1, !dbg !55
  br i1 %"16", label %main_bb11, label %main_bb12, !dbg !55

main_bb11:                                        ; preds = %main_bb10
  store i64 1, i64* @"'errno", align 8, !dbg !56
  br label %main_waitpid.exit, !dbg !57

main_bb12:                                        ; preds = %main_bb10
  store i64 2, i64* @"'errno", align 8, !dbg !58
  br label %main_waitpid.exit, !dbg !53

main_waitpid.exit:                                ; preds = %main_bb12, %main_bb11
  call void @llvm.dbg.value(metadata !39, i64 0, metadata !59), !dbg !60
  %"17" = icmp eq i64 -50, 0, !dbg !61
  br i1 %"17", label %main_bb13, label %main_.critedge, !dbg !61

main_bb13:                                        ; preds = %main_waitpid.exit1, %main_waitpid.exit
  %"18" = load i64* @"'errno", align 8, !dbg !63
  %"19" = icmp ne i64 %"18", 1, !dbg !63
  br i1 %"19", label %main_bb14, label %main_bb15, !dbg !63

main_bb14:                                        ; preds = %main_bb13
  store i64 1, i64* @"'errno", align 8, !dbg !67
  br label %main_waitpid.exit1, !dbg !68

main_bb15:                                        ; preds = %main_bb13
  store i64 2, i64* @"'errno", align 8, !dbg !69
  br label %main_waitpid.exit1, !dbg !64

main_waitpid.exit1:                               ; preds = %main_bb15, %main_bb14
  %"20" = icmp slt i64 -50, 0, !dbg !70
  %"21" = load i64* @"'errno", align 8
  %"22" = icmp eq i64 %"21", 1, !dbg !72
  %or.cond = and i1 %"20", %"22", !dbg !70
  br i1 %or.cond, label %main_bb13, label %main_.critedge, !dbg !70

main_.critedge:                                   ; preds = %main_waitpid.exit1, %main_waitpid.exit
  ret i32 0, !dbg !74
}

declare i64 @__kittel_nondef.0()

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

declare i32 @__kittel_nondef.1()

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!18, !19}
!llvm.ident = !{!20}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !16, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [//FILES_DIR/SourceCode_SemanticAugmentor.c] [DW_LANG_C99]
!1 = metadata !{metadata !"FILES_DIR/SourceCode_SemanticAugmentor.c", metadata !"/"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9, metadata !12}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"wrap_around", metadata !"wrap_around", metadata !"", i32 15, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i64, i64, i64)* @wrap_around, null, null, metadata !2, i32 15} ; [ DW_TAG_subprogram ] [line 15] [def] [wrap_around]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"waitpid", metadata !"waitpid", metadata !"", i32 25, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i64 ()* @waitpid, null, null, metadata !2, i32 26} ; [ DW_TAG_subprogram ] [line 25] [def] [scope 26] [waitpid]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !8}
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 41, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 42} ; [ DW_TAG_subprogram ] [line 41] [def] [scope 42] [main]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{metadata !15}
!15 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!16 = metadata !{metadata !17}
!17 = metadata !{i32 786484, i32 0, null, metadata !"errno", metadata !"errno", metadata !"", metadata !5, i32 14, metadata !8, i32 0, i32 1, i64* @"'errno", null} ; [ DW_TAG_variable ] [errno] [line 14] [def]
!18 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!19 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!20 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!21 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777231, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 15]
!22 = metadata !{i32 15, i32 33, metadata !4, null}
!23 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554447, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [lower_bound] [line 15]
!24 = metadata !{i32 15, i32 50, metadata !4, null}
!25 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331663, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [upper_bound] [line 15]
!26 = metadata !{i32 15, i32 73, metadata !4, null}
!27 = metadata !{i32 16, i32 5, metadata !4, null}
!28 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 16, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [range] [line 16]
!29 = metadata !{i32 16, i32 15, metadata !4, null}
!30 = metadata !{i32 17, i32 9, metadata !31, null}
!31 = metadata !{i32 786443, metadata !1, metadata !4, i32 17, i32 9, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!32 = metadata !{i32 18, i32 9, metadata !33, null}
!33 = metadata !{i32 786443, metadata !1, metadata !31, i32 17, i32 30, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!34 = metadata !{i32 20, i32 14, metadata !35, null}
!35 = metadata !{i32 786443, metadata !1, metadata !31, i32 20, i32 14, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!36 = metadata !{i32 21, i32 9, metadata !37, null}
!37 = metadata !{i32 786443, metadata !1, metadata !35, i32 20, i32 35, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!38 = metadata !{i32 24, i32 1, metadata !4, null}
!39 = metadata !{i64 -50}
!40 = metadata !{i32 786688, metadata !9, metadata !"num", metadata !5, i32 27, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [num] [line 27]
!41 = metadata !{i32 27, i32 15, metadata !9, null}
!42 = metadata !{i32 28, i32 5, metadata !43, null}
!43 = metadata !{i32 786443, metadata !1, metadata !9, i32 28, i32 5, i32 1, i32 10} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!44 = metadata !{i32 30, i32 13, metadata !45, null}
!45 = metadata !{i32 786443, metadata !1, metadata !46, i32 30, i32 13, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!46 = metadata !{i32 786443, metadata !1, metadata !9, i32 29, i32 5, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!47 = metadata !{i32 32, i32 13, metadata !48, null}
!48 = metadata !{i32 786443, metadata !1, metadata !45, i32 31, i32 1, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!49 = metadata !{i32 33, i32 1, metadata !48, null}
!50 = metadata !{i32 35, i32 13, metadata !45, null}
!51 = metadata !{i32 39, i32 1, metadata !9, null}
!52 = metadata !{i32 786688, metadata !9, metadata !"num", metadata !5, i32 27, metadata !8, i32 0, metadata !53} ; [ DW_TAG_auto_variable ] [num] [line 27]
!53 = metadata !{i32 44, i32 21, metadata !12, null}
!54 = metadata !{i32 27, i32 15, metadata !9, metadata !53}
!55 = metadata !{i32 30, i32 13, metadata !45, metadata !53}
!56 = metadata !{i32 32, i32 13, metadata !48, metadata !53}
!57 = metadata !{i32 33, i32 1, metadata !48, metadata !53}
!58 = metadata !{i32 35, i32 13, metadata !45, metadata !53}
!59 = metadata !{i32 786688, metadata !12, metadata !"ret", metadata !5, i32 44, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ret] [line 44]
!60 = metadata !{i32 44, i32 15, metadata !12, null}
!61 = metadata !{i32 46, i32 9, metadata !62, null}
!62 = metadata !{i32 786443, metadata !1, metadata !12, i32 46, i32 9, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!63 = metadata !{i32 30, i32 13, metadata !45, metadata !64}
!64 = metadata !{i32 49, i32 19, metadata !65, null}
!65 = metadata !{i32 786443, metadata !1, metadata !66, i32 48, i32 11, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!66 = metadata !{i32 786443, metadata !1, metadata !62, i32 47, i32 5, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!67 = metadata !{i32 32, i32 13, metadata !48, metadata !64}
!68 = metadata !{i32 33, i32 1, metadata !48, metadata !64}
!69 = metadata !{i32 35, i32 13, metadata !45, metadata !64}
!70 = metadata !{i32 50, i32 9, metadata !71, null}
!71 = metadata !{i32 786443, metadata !1, metadata !65, i32 50, i32 9, i32 1, i32 11} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!72 = metadata !{i32 50, i32 9, metadata !73, null}
!73 = metadata !{i32 786443, metadata !1, metadata !65, i32 50, i32 9, i32 2, i32 12} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!74 = metadata !{i32 52, i32 5, metadata !12, null}

