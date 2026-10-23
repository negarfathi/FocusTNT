; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.NNode = type { i64, i32 }

@"'memory0_freeIndex" = global i32 1, align 4
@memory0 = common global [100000 x %struct.NNode] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define i64 @wrap_around(i64 %value, i64 %lower_bound, i64 %upper_bound) #0 {
wrap_around_bb0:
  call void @llvm.dbg.value(metadata !{i64 %value}, i64 0, metadata !33), !dbg !34
  call void @llvm.dbg.value(metadata !{i64 %lower_bound}, i64 0, metadata !35), !dbg !36
  call void @llvm.dbg.value(metadata !{i64 %upper_bound}, i64 0, metadata !37), !dbg !38
  %"0" = sub nsw i64 %upper_bound, %lower_bound, !dbg !39
  %"1" = add nsw i64 %"0", 1, !dbg !39
  call void @llvm.dbg.value(metadata !{i64 %"1"}, i64 0, metadata !40), !dbg !41
  %"2" = icmp sgt i64 %value, %upper_bound, !dbg !42
  br i1 %"2", label %wrap_around_bb1, label %wrap_around_bb2, !dbg !42

wrap_around_bb1:                                  ; preds = %wrap_around_bb0
  %"3" = sub nsw i64 %value, %upper_bound, !dbg !44
  %"4" = sub nsw i64 %"3", 1, !dbg !44
  %"5" = srem i64 %"4", %"1", !dbg !44
  %"6" = add nsw i64 %lower_bound, %"5", !dbg !44
  br label %wrap_around_bb4, !dbg !44

wrap_around_bb2:                                  ; preds = %wrap_around_bb0
  %"7" = icmp slt i64 %value, %lower_bound, !dbg !46
  br i1 %"7", label %wrap_around_bb3, label %wrap_around_bb4, !dbg !46

wrap_around_bb3:                                  ; preds = %wrap_around_bb2
  %"8" = sub nsw i64 %lower_bound, %value, !dbg !48
  %"9" = sub nsw i64 %"8", 1, !dbg !48
  %"10" = srem i64 %"9", %"1", !dbg !48
  %"11" = sub nsw i64 %upper_bound, %"10", !dbg !48
  br label %wrap_around_bb4, !dbg !48

wrap_around_bb4:                                  ; preds = %wrap_around_bb2, %wrap_around_bb3, %wrap_around_bb1
  %.0 = phi i64 [ %"6", %wrap_around_bb1 ], [ %"11", %wrap_around_bb3 ], [ %value, %wrap_around_bb2 ]
  ret i64 %.0, !dbg !50
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @allocate_memory0(i32 %size) #0 {
allocate_memory0_bb5:
  call void @llvm.dbg.value(metadata !{i32 %size}, i64 0, metadata !51), !dbg !52
  %"12" = load i32* @"'memory0_freeIndex", align 4, !dbg !53
  call void @llvm.dbg.value(metadata !{i32 %"12"}, i64 0, metadata !54), !dbg !55
  %"13" = load i32* @"'memory0_freeIndex", align 4, !dbg !56
  %"14" = add nsw i32 %"13", %size, !dbg !56
  store i32 %"14", i32* @"'memory0_freeIndex", align 4, !dbg !56
  ret i32 %"12", !dbg !57
}

; Function Attrs: nounwind uwtable
define i32 @intinitLink_slice_1() #0 {
intinitLink_slice_1_bb6:
  call void @llvm.dbg.value(metadata !58, i64 0, metadata !59), !dbg !61
  %"15" = load i32* @"'memory0_freeIndex", align 4, !dbg !62
  call void @llvm.dbg.value(metadata !{i32 %"15"}, i64 0, metadata !63), !dbg !64
  %"16" = load i32* @"'memory0_freeIndex", align 4, !dbg !65
  %"17" = add nsw i32 %"16", 16, !dbg !65
  store i32 %"17", i32* @"'memory0_freeIndex", align 4, !dbg !65
  %"18" = sext i32 %"15" to i64, !dbg !60
  call void @llvm.dbg.value(metadata !{i64 %"18"}, i64 0, metadata !66), !dbg !67
  %"19" = getelementptr inbounds [100000 x %struct.NNode]* @memory0, i32 0, i64 %"18", !dbg !68
  %"20" = getelementptr inbounds %struct.NNode* %"19", i32 0, i32 0, !dbg !68
  store i64 1, i64* %"20", align 8, !dbg !68
  call void @llvm.dbg.value(metadata !{i64 %"18"}, i64 0, metadata !69), !dbg !70
  %"21" = trunc i64 %"18" to i32, !dbg !71
  %"22" = getelementptr inbounds [100000 x %struct.NNode]* @memory0, i32 0, i64 %"18", !dbg !71
  %"23" = getelementptr inbounds %struct.NNode* %"22", i32 0, i32 1, !dbg !71
  store i32 %"21", i32* %"23", align 4, !dbg !71
  %"24" = trunc i64 %"18" to i32, !dbg !72
  ret i32 %"24", !dbg !72
}

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb7:
  %"25" = call i32 (...)* @initLink_slice_1(), !dbg !73
  call void @llvm.dbg.value(metadata !{i32 %"25"}, i64 0, metadata !74), !dbg !75
  call void @llvm.dbg.value(metadata !{i32 %"25"}, i64 0, metadata !76), !dbg !77
  call void @llvm.dbg.value(metadata !78, i64 0, metadata !79), !dbg !80
  call void @llvm.dbg.value(metadata !{i64 %"39"}, i64 0, metadata !79), !dbg !80
  call void @llvm.dbg.value(metadata !{i32 %"43"}, i64 0, metadata !76), !dbg !77
  br label %main_bb8, !dbg !81

main_bb8:                                         ; preds = %main_bb11, %main_bb7
  %node.0 = phi i32 [ %"25", %main_bb7 ], [ %"43", %main_bb11 ]
  %h.0 = phi i64 [ 0, %main_bb7 ], [ %h.1, %main_bb11 ]
  %"26" = icmp ne i32 %node.0, 0, !dbg !82
  br i1 %"26", label %main_bb9, label %main_bb12, !dbg !82

main_bb9:                                         ; preds = %main_bb8
  %"27" = sext i32 %node.0 to i64, !dbg !84
  %"28" = getelementptr inbounds [100000 x %struct.NNode]* @memory0, i32 0, i64 %"27", !dbg !84
  %"29" = getelementptr inbounds %struct.NNode* %"28", i32 0, i32 0, !dbg !84
  %"30" = load i64* %"29", align 8, !dbg !84
  %"31" = sitofp i64 %"30" to float, !dbg !84
  %"32" = sitofp i64 %h.0 to float, !dbg !84
  %"33" = fcmp ogt float %"31", %"32", !dbg !84
  br i1 %"33", label %main_bb10, label %main_bb11, !dbg !84

main_bb10:                                        ; preds = %main_bb9
  %"34" = sext i32 %node.0 to i64, !dbg !87
  %"35" = getelementptr inbounds [100000 x %struct.NNode]* @memory0, i32 0, i64 %"34", !dbg !87
  %"36" = getelementptr inbounds %struct.NNode* %"35", i32 0, i32 0, !dbg !87
  %"37" = load i64* %"36", align 8, !dbg !87
  %"38" = sitofp i64 %"37" to float, !dbg !87
  %"39" = fptosi float %"38" to i64, !dbg !87
  br label %main_bb11, !dbg !89

main_bb11:                                        ; preds = %main_bb10, %main_bb9
  %h.1 = phi i64 [ %"39", %main_bb10 ], [ %h.0, %main_bb9 ]
  %"40" = sext i32 %node.0 to i64, !dbg !90
  %"41" = getelementptr inbounds [100000 x %struct.NNode]* @memory0, i32 0, i64 %"40", !dbg !90
  %"42" = getelementptr inbounds %struct.NNode* %"41", i32 0, i32 1, !dbg !90
  %"43" = load i32* %"42", align 4, !dbg !90
  br label %main_bb8, !dbg !91

main_bb12:                                        ; preds = %main_bb8
  ret void, !dbg !92
}

declare i32 @initLink_slice_1(...) #2

declare i64 @__kittel_nondef.0()

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

declare i32 @__kittel_nondef.1()

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!30, !31}
!llvm.ident = !{!32}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !19, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [//FILES_DIR/SourceCode_SemanticAugmentor.c] [DW_LANG_C99]
!1 = metadata !{metadata !"FILES_DIR/SourceCode_SemanticAugmentor.c", metadata !"/"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9, metadata !13, metadata !16}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"wrap_around", metadata !"wrap_around", metadata !"", i32 12, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i64, i64, i64)* @wrap_around, null, null, metadata !2, i32 12} ; [ DW_TAG_subprogram ] [line 12] [def] [wrap_around]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"allocate_memory0", metadata !"allocate_memory0", metadata !"", i32 22, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @allocate_memory0, null, null, metadata !2, i32 22} ; [ DW_TAG_subprogram ] [line 22] [def] [allocate_memory0]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !12, metadata !12}
!12 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!13 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"intinitLink_slice_1", metadata !"intinitLink_slice_1", metadata !"", i32 28, metadata !14, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @intinitLink_slice_1, null, null, metadata !2, i32 29} ; [ DW_TAG_subprogram ] [line 28] [def] [scope 29] [intinitLink_slice_1]
!14 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !15, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!15 = metadata !{metadata !12}
!16 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 37, metadata !17, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @main, null, null, metadata !2, i32 38} ; [ DW_TAG_subprogram ] [line 37] [def] [scope 38] [main]
!17 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = metadata !{null}
!19 = metadata !{metadata !20, metadata !21}
!20 = metadata !{i32 786484, i32 0, null, metadata !"memory0_freeIndex", metadata !"memory0_freeIndex", metadata !"", metadata !5, i32 11, metadata !12, i32 0, i32 1, i32* @"'memory0_freeIndex", null} ; [ DW_TAG_variable ] [memory0_freeIndex] [line 11] [def]
!21 = metadata !{i32 786484, i32 0, null, metadata !"memory0", metadata !"memory0", metadata !"", metadata !5, i32 10, metadata !22, i32 0, i32 1, [100000 x %struct.NNode]* @memory0, null} ; [ DW_TAG_variable ] [memory0] [line 10] [def]
!22 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 12800000, i64 64, i32 0, i32 0, metadata !23, metadata !28, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 12800000, align 64, offset 0] [from Node]
!23 = metadata !{i32 786454, metadata !1, null, metadata !"Node", i32 8, i64 0, i64 0, i64 0, i32 0, metadata !24} ; [ DW_TAG_typedef ] [Node] [line 8, size 0, align 0, offset 0] [from NNode]
!24 = metadata !{i32 786451, metadata !1, null, metadata !"NNode", i32 4, i64 128, i64 64, i32 0, i32 0, null, metadata !25, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [NNode] [line 4, size 128, align 64, offset 0] [def] [from ]
!25 = metadata !{metadata !26, metadata !27}
!26 = metadata !{i32 786445, metadata !1, metadata !24, metadata !"h", i32 5, i64 64, i64 64, i64 0, i32 0, metadata !8} ; [ DW_TAG_member ] [h] [line 5, size 64, align 64, offset 0] [from long long int]
!27 = metadata !{i32 786445, metadata !1, metadata !24, metadata !"next", i32 6, i64 32, i64 32, i64 64, i32 0, metadata !12} ; [ DW_TAG_member ] [next] [line 6, size 32, align 32, offset 64] [from int]
!28 = metadata !{metadata !29}
!29 = metadata !{i32 786465, i64 0, i64 100000}   ; [ DW_TAG_subrange_type ] [0, 99999]
!30 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!31 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!32 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!33 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777228, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 12]
!34 = metadata !{i32 12, i32 33, metadata !4, null}
!35 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554444, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [lower_bound] [line 12]
!36 = metadata !{i32 12, i32 50, metadata !4, null}
!37 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331660, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [upper_bound] [line 12]
!38 = metadata !{i32 12, i32 73, metadata !4, null}
!39 = metadata !{i32 13, i32 5, metadata !4, null}
!40 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 13, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [range] [line 13]
!41 = metadata !{i32 13, i32 15, metadata !4, null}
!42 = metadata !{i32 14, i32 9, metadata !43, null}
!43 = metadata !{i32 786443, metadata !1, metadata !4, i32 14, i32 9, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!44 = metadata !{i32 15, i32 9, metadata !45, null}
!45 = metadata !{i32 786443, metadata !1, metadata !43, i32 14, i32 30, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!46 = metadata !{i32 17, i32 14, metadata !47, null}
!47 = metadata !{i32 786443, metadata !1, metadata !43, i32 17, i32 14, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!48 = metadata !{i32 18, i32 9, metadata !49, null}
!49 = metadata !{i32 786443, metadata !1, metadata !47, i32 17, i32 35, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!50 = metadata !{i32 21, i32 1, metadata !4, null}
!51 = metadata !{i32 786689, metadata !9, metadata !"size", metadata !5, i32 16777238, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 22]
!52 = metadata !{i32 22, i32 26, metadata !9, null}
!53 = metadata !{i32 23, i32 4, metadata !9, null}
!54 = metadata !{i32 786688, metadata !9, metadata !"allocatedIndex", metadata !5, i32 23, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [allocatedIndex] [line 23]
!55 = metadata !{i32 23, i32 8, metadata !9, null}
!56 = metadata !{i32 24, i32 4, metadata !9, null}
!57 = metadata !{i32 25, i32 4, metadata !9, null}
!58 = metadata !{i32 16}
!59 = metadata !{i32 786689, metadata !9, metadata !"size", metadata !5, i32 16777238, metadata !12, i32 0, metadata !60} ; [ DW_TAG_arg_variable ] [size] [line 22]
!60 = metadata !{i32 30, i32 20, metadata !13, null}
!61 = metadata !{i32 22, i32 26, metadata !9, metadata !60}
!62 = metadata !{i32 23, i32 4, metadata !9, metadata !60}
!63 = metadata !{i32 786688, metadata !9, metadata !"allocatedIndex", metadata !5, i32 23, metadata !12, i32 0, metadata !60} ; [ DW_TAG_auto_variable ] [allocatedIndex] [line 23]
!64 = metadata !{i32 23, i32 8, metadata !9, metadata !60}
!65 = metadata !{i32 24, i32 4, metadata !9, metadata !60}
!66 = metadata !{i32 786688, metadata !13, metadata !"head", metadata !5, i32 30, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [head] [line 30]
!67 = metadata !{i32 30, i32 13, metadata !13, null}
!68 = metadata !{i32 31, i32 3, metadata !13, null}
!69 = metadata !{i32 786688, metadata !13, metadata !"cyclic", metadata !5, i32 32, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cyclic] [line 32]
!70 = metadata !{i32 32, i32 13, metadata !13, null}
!71 = metadata !{i32 33, i32 3, metadata !13, null}
!72 = metadata !{i32 34, i32 3, metadata !13, null}
!73 = metadata !{i32 39, i32 14, metadata !16, null}
!74 = metadata !{i32 786688, metadata !16, metadata !"list", metadata !5, i32 39, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [list] [line 39]
!75 = metadata !{i32 39, i32 7, metadata !16, null}
!76 = metadata !{i32 786688, metadata !16, metadata !"node", metadata !5, i32 40, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [node] [line 40]
!77 = metadata !{i32 40, i32 7, metadata !16, null}
!78 = metadata !{i64 0}
!79 = metadata !{i32 786688, metadata !16, metadata !"h", metadata !5, i32 41, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [h] [line 41]
!80 = metadata !{i32 41, i32 13, metadata !16, null}
!81 = metadata !{i32 42, i32 3, metadata !16, null}
!82 = metadata !{i32 42, i32 3, metadata !83, null}
!83 = metadata !{i32 786443, metadata !1, metadata !16, i32 42, i32 3, i32 1, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!84 = metadata !{i32 43, i32 9, metadata !85, null}
!85 = metadata !{i32 786443, metadata !1, metadata !86, i32 43, i32 9, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!86 = metadata !{i32 786443, metadata !1, metadata !16, i32 42, i32 16, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!87 = metadata !{i32 44, i32 3, metadata !88, null}
!88 = metadata !{i32 786443, metadata !1, metadata !85, i32 44, i32 1, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!89 = metadata !{i32 45, i32 1, metadata !88, null}
!90 = metadata !{i32 46, i32 5, metadata !86, null}
!91 = metadata !{i32 47, i32 3, metadata !86, null}
!92 = metadata !{i32 48, i32 3, metadata !16, null}

