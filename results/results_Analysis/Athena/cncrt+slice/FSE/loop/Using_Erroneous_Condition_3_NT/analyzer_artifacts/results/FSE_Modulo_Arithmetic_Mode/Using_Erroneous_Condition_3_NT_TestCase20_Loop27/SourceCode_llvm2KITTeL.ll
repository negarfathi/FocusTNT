; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.old_ = private unnamed_addr constant [10 x i64] [i64 11, i64 22, i64 33, i64 44, i64 55, i64 66, i64 77, i64 88, i64 99, i64 0], align 16
@main.new_ = private unnamed_addr constant [10 x i64] [i64 11, i64 22, i64 33, i64 44, i64 55, i64 66, i64 77, i64 88, i64 99, i64 0], align 16

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
  call void @llvm.dbg.declare(metadata !{[10 x i64]* %old_}, metadata !36), !dbg !40
  %"12" = bitcast [10 x i64]* %old_ to i8*, !dbg !41
  %"13" = bitcast [10 x i64]* @main.old_ to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %"12", i8* %"13", i64 80, i32 16, i1 false), !dbg !41
  call void @llvm.dbg.declare(metadata !{[10 x i64]* %new_}, metadata !42), !dbg !43
  %"14" = bitcast [10 x i64]* %new_ to i8*, !dbg !44
  %"15" = bitcast [10 x i64]* @main.new_ to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %"14", i8* %"15", i64 80, i32 16, i1 false), !dbg !44
  %"16" = getelementptr inbounds [10 x i64]* %old_, i32 0, i64 9, !dbg !45
  store i64 0, i64* %"16", align 8, !dbg !45
  %"17" = getelementptr inbounds [10 x i64]* %new_, i32 0, i64 9, !dbg !46
  store i64 0, i64* %"17", align 8, !dbg !46
  br label %main_wrap_around.exit, !dbg !47

main_wrap_around.exit:                            ; preds = %main_bb10, %main_bb9, %main_bb8, %main_bb5
  %i.0 = phi i64 [ 0, %main_bb5 ], [ %"28", %main_bb8 ], [ %"33", %main_bb10 ], [ %"23", %main_bb9 ]
  %"18" = getelementptr inbounds [10 x i64]* %old_, i32 0, i64 %i.0, !dbg !48
  %"19" = load i64* %"18", align 8, !dbg !48
  %"20" = getelementptr inbounds [10 x i64]* %new_, i32 0, i64 %i.0, !dbg !48
  %"21" = load i64* %"20", align 8, !dbg !48
  br label %main_bb6, !dbg !51

main_bb6:                                         ; preds = %main_bb6, %main_wrap_around.exit
  %"22" = icmp ne i64 %"19", %"21", !dbg !48
  br i1 %"22", label %main_bb6, label %main_bb7, !dbg !48

main_bb7:                                         ; preds = %main_bb6
  %"23" = add nsw i64 %i.0, 1, !dbg !52
  call void @llvm.dbg.value(metadata !{i64 %"23"}, i64 0, metadata !53), !dbg !54
  call void @llvm.dbg.value(metadata !55, i64 0, metadata !56), !dbg !57
  call void @llvm.dbg.value(metadata !58, i64 0, metadata !59), !dbg !60
  call void @llvm.dbg.value(metadata !61, i64 0, metadata !62), !dbg !63
  %"24" = icmp sgt i64 %"23", 2147483647, !dbg !64
  br i1 %"24", label %main_bb8, label %main_bb9, !dbg !64

main_bb8:                                         ; preds = %main_bb7
  %"25" = sub nsw i64 %"23", 2147483647, !dbg !65
  %"26" = sub nsw i64 %"25", 1, !dbg !65
  %"27" = srem i64 %"26", 4294967296, !dbg !65
  %"28" = add nsw i64 -2147483648, %"27", !dbg !65
  br label %main_wrap_around.exit, !dbg !65

main_bb9:                                         ; preds = %main_bb7
  %"29" = icmp slt i64 %"23", -2147483648, !dbg !66
  br i1 %"29", label %main_bb10, label %main_wrap_around.exit, !dbg !66

main_bb10:                                        ; preds = %main_bb9
  %"30" = sub nsw i64 -2147483648, %"23", !dbg !67
  %"31" = sub nsw i64 %"30", 1, !dbg !67
  %"32" = srem i64 %"31", 4294967296, !dbg !67
  %"33" = sub nsw i64 2147483647, %"32", !dbg !67
  br label %main_wrap_around.exit, !dbg !67
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
!36 = metadata !{i32 786688, metadata !9, metadata !"old_", metadata !5, i32 17, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [old_] [line 17]
!37 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 640, i64 64, i32 0, i32 0, metadata !8, metadata !38, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 640, align 64, offset 0] [from long long int]
!38 = metadata !{metadata !39}
!39 = metadata !{i32 786465, i64 0, i64 10}       ; [ DW_TAG_subrange_type ] [0, 9]
!40 = metadata !{i32 17, i32 13, metadata !9, null}
!41 = metadata !{i32 17, i32 3, metadata !9, null}
!42 = metadata !{i32 786688, metadata !9, metadata !"new_", metadata !5, i32 18, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [new_] [line 18]
!43 = metadata !{i32 18, i32 13, metadata !9, null}
!44 = metadata !{i32 18, i32 3, metadata !9, null}
!45 = metadata !{i32 19, i32 3, metadata !9, null}
!46 = metadata !{i32 20, i32 3, metadata !9, null}
!47 = metadata !{i32 21, i32 3, metadata !9, null}
!48 = metadata !{i32 22, i32 5, metadata !49, null}
!49 = metadata !{i32 786443, metadata !1, metadata !50, i32 22, i32 5, i32 1, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!50 = metadata !{i32 786443, metadata !1, metadata !9, i32 21, i32 13, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!51 = metadata !{i32 22, i32 5, metadata !50, null}
!52 = metadata !{i32 25, i32 10, metadata !50, null}
!53 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777220, metadata !8, i32 0, metadata !52} ; [ DW_TAG_arg_variable ] [value] [line 4]
!54 = metadata !{i32 4, i32 33, metadata !4, metadata !52}
!55 = metadata !{i64 -2147483648}
!56 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554436, metadata !8, i32 0, metadata !52} ; [ DW_TAG_arg_variable ] [lower_bound] [line 4]
!57 = metadata !{i32 4, i32 50, metadata !4, metadata !52}
!58 = metadata !{i64 2147483647}
!59 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331652, metadata !8, i32 0, metadata !52} ; [ DW_TAG_arg_variable ] [upper_bound] [line 4]
!60 = metadata !{i32 4, i32 73, metadata !4, metadata !52}
!61 = metadata !{i64 4294967296}
!62 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 5, metadata !8, i32 0, metadata !52} ; [ DW_TAG_auto_variable ] [range] [line 5]
!63 = metadata !{i32 5, i32 15, metadata !4, metadata !52}
!64 = metadata !{i32 6, i32 9, metadata !25, metadata !52}
!65 = metadata !{i32 7, i32 9, metadata !27, metadata !52}
!66 = metadata !{i32 9, i32 14, metadata !29, metadata !52}
!67 = metadata !{i32 10, i32 9, metadata !31, metadata !52}

