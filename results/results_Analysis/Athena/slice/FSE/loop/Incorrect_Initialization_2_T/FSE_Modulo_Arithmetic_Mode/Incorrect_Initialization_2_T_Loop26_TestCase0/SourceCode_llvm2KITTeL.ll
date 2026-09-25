; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@"'flag" = global i64 0, align 8

; Function Attrs: nounwind uwtable
define i64 @wrap_around(i64 %value, i64 %lower_bound, i64 %upper_bound) #0 {
wrap_around_bb0:
  call void @llvm.dbg.value(metadata !{i64 %value}, i64 0, metadata !23), !dbg !24
  call void @llvm.dbg.value(metadata !{i64 %lower_bound}, i64 0, metadata !25), !dbg !26
  call void @llvm.dbg.value(metadata !{i64 %upper_bound}, i64 0, metadata !27), !dbg !28
  %"0" = sub nsw i64 %upper_bound, %lower_bound, !dbg !29
  %"1" = add nsw i64 %"0", 1, !dbg !29
  call void @llvm.dbg.value(metadata !{i64 %"1"}, i64 0, metadata !30), !dbg !31
  %"2" = icmp sgt i64 %value, %upper_bound, !dbg !32
  br i1 %"2", label %wrap_around_bb1, label %wrap_around_bb2, !dbg !32

wrap_around_bb1:                                  ; preds = %wrap_around_bb0
  %"3" = sub nsw i64 %value, %upper_bound, !dbg !34
  %"4" = sub nsw i64 %"3", 1, !dbg !34
  %"5" = srem i64 %"4", %"1", !dbg !34
  %"6" = add nsw i64 %lower_bound, %"5", !dbg !34
  br label %wrap_around_bb4, !dbg !34

wrap_around_bb2:                                  ; preds = %wrap_around_bb0
  %"7" = icmp slt i64 %value, %lower_bound, !dbg !36
  br i1 %"7", label %wrap_around_bb3, label %wrap_around_bb4, !dbg !36

wrap_around_bb3:                                  ; preds = %wrap_around_bb2
  %"8" = sub nsw i64 %lower_bound, %value, !dbg !38
  %"9" = sub nsw i64 %"8", 1, !dbg !38
  %"10" = srem i64 %"9", %"1", !dbg !38
  %"11" = sub nsw i64 %upper_bound, %"10", !dbg !38
  br label %wrap_around_bb4, !dbg !38

wrap_around_bb4:                                  ; preds = %wrap_around_bb2, %wrap_around_bb3, %wrap_around_bb1
  %.0 = phi i64 [ %"6", %wrap_around_bb1 ], [ %"11", %wrap_around_bb3 ], [ %value, %wrap_around_bb2 ]
  ret i64 %.0, !dbg !40
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i64 @matroska_deliver_packet_slice_1(i64 %q) #0 {
matroska_deliver_packet_slice_1_bb5:
  call void @llvm.dbg.value(metadata !{i64 %q}, i64 0, metadata !41), !dbg !42
  %"12" = icmp eq i64 %q, 1, !dbg !43
  %. = select i1 %"12", i64 0, i64 1, !dbg !45
  ret i64 %., !dbg !47
}

; Function Attrs: nounwind uwtable
define i64 @res_return_slice_1() #0 {
res_return_slice_1_bb6:
  %"13" = load i64* @"'flag", align 8, !dbg !48
  call void @llvm.dbg.value(metadata !{i64 %"13"}, i64 0, metadata !49), !dbg !50
  %"14" = load i64* @"'flag", align 8, !dbg !51
  %"15" = add nsw i64 %"14", 1, !dbg !51
  call void @llvm.dbg.value(metadata !{i64 %"15"}, i64 0, metadata !52), !dbg !53
  call void @llvm.dbg.value(metadata !54, i64 0, metadata !55), !dbg !56
  call void @llvm.dbg.value(metadata !57, i64 0, metadata !58), !dbg !59
  call void @llvm.dbg.value(metadata !60, i64 0, metadata !61), !dbg !62
  %"16" = icmp sgt i64 %"15", 2147483647, !dbg !63
  br i1 %"16", label %res_return_slice_1_bb7, label %res_return_slice_1_bb8, !dbg !63

res_return_slice_1_bb7:                           ; preds = %res_return_slice_1_bb6
  %"17" = sub nsw i64 %"15", 2147483647, !dbg !64
  %"18" = sub nsw i64 %"17", 1, !dbg !64
  %"19" = srem i64 %"18", 4294967296, !dbg !64
  %"20" = add nsw i64 -2147483648, %"19", !dbg !64
  br label %res_return_slice_1_wrap_around.exit, !dbg !64

res_return_slice_1_bb8:                           ; preds = %res_return_slice_1_bb6
  %"21" = icmp slt i64 %"15", -2147483648, !dbg !65
  br i1 %"21", label %res_return_slice_1_bb9, label %res_return_slice_1_wrap_around.exit, !dbg !65

res_return_slice_1_bb9:                           ; preds = %res_return_slice_1_bb8
  %"22" = sub nsw i64 -2147483648, %"15", !dbg !66
  %"23" = sub nsw i64 %"22", 1, !dbg !66
  %"24" = srem i64 %"23", 4294967296, !dbg !66
  %"25" = sub nsw i64 2147483647, %"24", !dbg !66
  br label %res_return_slice_1_wrap_around.exit, !dbg !66

res_return_slice_1_wrap_around.exit:              ; preds = %res_return_slice_1_bb7, %res_return_slice_1_bb8, %res_return_slice_1_bb9
  %.0.i = phi i64 [ %"20", %res_return_slice_1_bb7 ], [ %"25", %res_return_slice_1_bb9 ], [ %"15", %res_return_slice_1_bb8 ], !dbg !51
  store i64 %.0.i, i64* @"'flag", align 8, !dbg !51
  %"26" = icmp slt i64 %"13", 100, !dbg !67
  br i1 %"26", label %res_return_slice_1_bb10, label %res_return_slice_1_bb11, !dbg !67

res_return_slice_1_bb10:                          ; preds = %res_return_slice_1_wrap_around.exit
  %"27" = call i64 @__VERIFIER_nondet_int(), !dbg !69
  call void @llvm.dbg.value(metadata !{i64 %"27"}, i64 0, metadata !71), !dbg !72
  call void @llvm.dbg.value(metadata !{i64 %"27"}, i64 0, metadata !73), !dbg !74
  br label %res_return_slice_1_bb11, !dbg !75

res_return_slice_1_bb11:                          ; preds = %res_return_slice_1_wrap_around.exit, %res_return_slice_1_bb10
  %__retres.0 = phi i64 [ %"27", %res_return_slice_1_bb10 ], [ -1, %res_return_slice_1_wrap_around.exit ]
  ret i64 %__retres.0, !dbg !76
}

declare i64 @__VERIFIER_nondet_int() #2

; Function Attrs: nounwind uwtable
define void @main() #0 {
main_bb12:
  %"28" = call i64 @__VERIFIER_nondet_int(), !dbg !77
  call void @llvm.dbg.value(metadata !{i64 %"28"}, i64 0, metadata !78), !dbg !79
  call void @llvm.dbg.value(metadata !{i64 %matroska.0}, i64 0, metadata !80), !dbg !83
  call void @llvm.dbg.value(metadata !{i64 %..i}, i64 0, metadata !84), !dbg !85
  call void @llvm.dbg.value(metadata !86, i64 0, metadata !87), !dbg !88
  call void @llvm.dbg.value(metadata !{i64 %"31"}, i64 0, metadata !89), !dbg !91
  call void @llvm.dbg.value(metadata !{i64 %"32"}, i64 0, metadata !92) #3, !dbg !95
  call void @llvm.dbg.value(metadata !{i64 %"34"}, i64 0, metadata !96) #3, !dbg !98
  call void @llvm.dbg.value(metadata !54, i64 0, metadata !99) #3, !dbg !100
  call void @llvm.dbg.value(metadata !57, i64 0, metadata !101) #3, !dbg !102
  call void @llvm.dbg.value(metadata !60, i64 0, metadata !103) #3, !dbg !104
  call void @llvm.dbg.value(metadata !{i64 %"80"}, i64 0, metadata !105) #3, !dbg !106
  call void @llvm.dbg.value(metadata !{i64 %"80"}, i64 0, metadata !107) #3, !dbg !108
  call void @llvm.dbg.value(metadata !{i64 %"32"}, i64 0, metadata !109) #3, !dbg !112
  call void @llvm.dbg.value(metadata !{i64 %"34"}, i64 0, metadata !113) #3, !dbg !115
  call void @llvm.dbg.value(metadata !54, i64 0, metadata !116) #3, !dbg !117
  call void @llvm.dbg.value(metadata !57, i64 0, metadata !118) #3, !dbg !119
  call void @llvm.dbg.value(metadata !60, i64 0, metadata !120) #3, !dbg !121
  call void @llvm.dbg.value(metadata !{i64 %"46"}, i64 0, metadata !122) #3, !dbg !123
  call void @llvm.dbg.value(metadata !{i64 %"46"}, i64 0, metadata !124) #3, !dbg !125
  call void @llvm.dbg.value(metadata !{i64 %"49"}, i64 0, metadata !87), !dbg !88
  call void @llvm.dbg.value(metadata !{i64 %"51"}, i64 0, metadata !126) #3, !dbg !128
  call void @llvm.dbg.value(metadata !{i64 %"53"}, i64 0, metadata !129) #3, !dbg !131
  call void @llvm.dbg.value(metadata !54, i64 0, metadata !132) #3, !dbg !133
  call void @llvm.dbg.value(metadata !57, i64 0, metadata !134) #3, !dbg !135
  call void @llvm.dbg.value(metadata !60, i64 0, metadata !136) #3, !dbg !137
  call void @llvm.dbg.value(metadata !{i64 %"65"}, i64 0, metadata !138) #3, !dbg !139
  call void @llvm.dbg.value(metadata !{i64 %"65"}, i64 0, metadata !140) #3, !dbg !141
  call void @llvm.dbg.value(metadata !{i64 %"68"}, i64 0, metadata !87), !dbg !88
  call void @llvm.dbg.value(metadata !142, i64 0, metadata !87), !dbg !88
  br label %main_bb13, !dbg !143

main_bb13:                                        ; preds = %main_NewDefault, %main_bb14, %main_bb12
  %matroska.0 = phi i64 [ %"28", %main_bb12 ], [ 1, %main_bb14 ], [ %matroska.0, %main_NewDefault ]
  %"29" = icmp eq i64 %matroska.0, 1, !dbg !144
  %..i = select i1 %"29", i64 0, i64 1, !dbg !145
  %"30" = icmp ne i64 %..i, 0, !dbg !146
  br i1 %"30", label %main_res_return_slice_1.exit, label %main_bb31, !dbg !146

main_res_return_slice_1.exit:                     ; preds = %main_res_return_slice_1.exit8, %main_res_return_slice_1.exit4, %main_wrap_around.exit.i, %main_bb30, %main_bb13
  %res.0 = phi i64 [ 0, %main_bb13 ], [ %., %main_res_return_slice_1.exit8 ], [ %"49", %main_res_return_slice_1.exit4 ], [ %"80", %main_bb30 ], [ -1, %main_wrap_around.exit.i ]
  br label %main_NodeBlock

main_NodeBlock:                                   ; preds = %main_res_return_slice_1.exit
  %Pivot = icmp slt i64 %res.0, 0
  br i1 %Pivot, label %main_LeafBlock, label %main_LeafBlock9

main_LeafBlock:                                   ; preds = %main_NodeBlock
  %SwitchLeaf = icmp eq i64 %res.0, -1
  br i1 %SwitchLeaf, label %main_bb14, label %main_NewDefault

main_bb14:                                        ; preds = %main_LeafBlock
  call void @llvm.dbg.value(metadata !142, i64 0, metadata !78), !dbg !79
  br label %main_bb13, !dbg !148

main_LeafBlock9:                                  ; preds = %main_NodeBlock
  %SwitchLeaf10 = icmp eq i64 %res.0, 0
  br i1 %SwitchLeaf10, label %main_bb15, label %main_NewDefault

main_bb15:                                        ; preds = %main_LeafBlock9
  %"31" = call i64 @__VERIFIER_nondet_int(), !dbg !151
  %cond = icmp eq i64 %"31", 1, !dbg !152
  %"32" = load i64* @"'flag", align 8, !dbg !153
  %"33" = load i64* @"'flag", align 8, !dbg !114
  %"34" = add nsw i64 %"33", 1, !dbg !114
  %"35" = icmp sgt i64 %"34", 2147483647, !dbg !154
  br i1 %cond, label %main_bb16, label %main_bb26, !dbg !152

main_bb16:                                        ; preds = %main_bb15
  br i1 %"35", label %main_bb17, label %main_bb18, !dbg !154

main_bb17:                                        ; preds = %main_bb16
  %"36" = sub nsw i64 %"34", 2147483647, !dbg !155
  %"37" = sub nsw i64 %"36", 1, !dbg !155
  %"38" = srem i64 %"37", 4294967296, !dbg !155
  %"39" = add nsw i64 -2147483648, %"38", !dbg !155
  br label %main_wrap_around.exit.i2, !dbg !155

main_bb18:                                        ; preds = %main_bb16
  %"40" = icmp slt i64 %"34", -2147483648, !dbg !156
  br i1 %"40", label %main_bb19, label %main_wrap_around.exit.i2, !dbg !156

main_bb19:                                        ; preds = %main_bb18
  %"41" = sub nsw i64 -2147483648, %"34", !dbg !157
  %"42" = sub nsw i64 %"41", 1, !dbg !157
  %"43" = srem i64 %"42", 4294967296, !dbg !157
  %"44" = sub nsw i64 2147483647, %"43", !dbg !157
  br label %main_wrap_around.exit.i2, !dbg !157

main_wrap_around.exit.i2:                         ; preds = %main_bb19, %main_bb18, %main_bb17
  %.0.i.i1 = phi i64 [ %"39", %main_bb17 ], [ %"44", %main_bb19 ], [ %"34", %main_bb18 ], !dbg !114
  store i64 %.0.i.i1, i64* @"'flag", align 8, !dbg !114
  %"45" = icmp slt i64 %"32", 100, !dbg !158
  br i1 %"45", label %main_bb20, label %main_res_return_slice_1.exit4, !dbg !158

main_bb20:                                        ; preds = %main_wrap_around.exit.i2
  %"46" = call i64 @__VERIFIER_nondet_int() #3, !dbg !159
  br label %main_res_return_slice_1.exit4, !dbg !160

main_res_return_slice_1.exit4:                    ; preds = %main_wrap_around.exit.i2, %main_bb20
  %__retres.0.i3 = phi i64 [ %"46", %main_bb20 ], [ -1, %main_wrap_around.exit.i2 ], !dbg !110
  %"47" = icmp slt i64 %__retres.0.i3, 0, !dbg !161
  %"48" = zext i1 %"47" to i32, !dbg !161
  %"49" = sext i32 %"48" to i64, !dbg !161
  %"50" = icmp ne i64 %"49", 0, !dbg !162
  br i1 %"50", label %main_res_return_slice_1.exit, label %main_bb21, !dbg !162

main_bb21:                                        ; preds = %main_res_return_slice_1.exit4
  %"51" = load i64* @"'flag", align 8, !dbg !164
  %"52" = load i64* @"'flag", align 8, !dbg !130
  %"53" = add nsw i64 %"52", 1, !dbg !130
  %"54" = icmp sgt i64 %"53", 2147483647, !dbg !165
  br i1 %"54", label %main_bb22, label %main_bb23, !dbg !165

main_bb22:                                        ; preds = %main_bb21
  %"55" = sub nsw i64 %"53", 2147483647, !dbg !166
  %"56" = sub nsw i64 %"55", 1, !dbg !166
  %"57" = srem i64 %"56", 4294967296, !dbg !166
  %"58" = add nsw i64 -2147483648, %"57", !dbg !166
  br label %main_wrap_around.exit.i6, !dbg !166

main_bb23:                                        ; preds = %main_bb21
  %"59" = icmp slt i64 %"53", -2147483648, !dbg !167
  br i1 %"59", label %main_bb24, label %main_wrap_around.exit.i6, !dbg !167

main_bb24:                                        ; preds = %main_bb23
  %"60" = sub nsw i64 -2147483648, %"53", !dbg !168
  %"61" = sub nsw i64 %"60", 1, !dbg !168
  %"62" = srem i64 %"61", 4294967296, !dbg !168
  %"63" = sub nsw i64 2147483647, %"62", !dbg !168
  br label %main_wrap_around.exit.i6, !dbg !168

main_wrap_around.exit.i6:                         ; preds = %main_bb24, %main_bb23, %main_bb22
  %.0.i.i5 = phi i64 [ %"58", %main_bb22 ], [ %"63", %main_bb24 ], [ %"53", %main_bb23 ], !dbg !130
  store i64 %.0.i.i5, i64* @"'flag", align 8, !dbg !130
  %"64" = icmp slt i64 %"51", 100, !dbg !169
  br i1 %"64", label %main_bb25, label %main_res_return_slice_1.exit8, !dbg !169

main_bb25:                                        ; preds = %main_wrap_around.exit.i6
  %"65" = call i64 @__VERIFIER_nondet_int() #3, !dbg !170
  br label %main_res_return_slice_1.exit8, !dbg !171

main_res_return_slice_1.exit8:                    ; preds = %main_wrap_around.exit.i6, %main_bb25
  %__retres.0.i7 = phi i64 [ %"65", %main_bb25 ], [ -1, %main_wrap_around.exit.i6 ], !dbg !127
  %"66" = icmp eq i64 %__retres.0.i7, 0, !dbg !172
  %"67" = zext i1 %"66" to i32, !dbg !172
  %"68" = sext i32 %"67" to i64, !dbg !172
  %"69" = icmp ne i64 %"68", 0, !dbg !173
  %. = select i1 %"69", i64 1, i64 %"68", !dbg !173
  br label %main_res_return_slice_1.exit, !dbg !175

main_bb26:                                        ; preds = %main_bb15
  br i1 %"35", label %main_bb27, label %main_bb28, !dbg !176

main_bb27:                                        ; preds = %main_bb26
  %"70" = sub nsw i64 %"34", 2147483647, !dbg !177
  %"71" = sub nsw i64 %"70", 1, !dbg !177
  %"72" = srem i64 %"71", 4294967296, !dbg !177
  %"73" = add nsw i64 -2147483648, %"72", !dbg !177
  br label %main_wrap_around.exit.i, !dbg !177

main_bb28:                                        ; preds = %main_bb26
  %"74" = icmp slt i64 %"34", -2147483648, !dbg !178
  br i1 %"74", label %main_bb29, label %main_wrap_around.exit.i, !dbg !178

main_bb29:                                        ; preds = %main_bb28
  %"75" = sub nsw i64 -2147483648, %"34", !dbg !179
  %"76" = sub nsw i64 %"75", 1, !dbg !179
  %"77" = srem i64 %"76", 4294967296, !dbg !179
  %"78" = sub nsw i64 2147483647, %"77", !dbg !179
  br label %main_wrap_around.exit.i, !dbg !179

main_wrap_around.exit.i:                          ; preds = %main_bb29, %main_bb28, %main_bb27
  %.0.i.i = phi i64 [ %"73", %main_bb27 ], [ %"78", %main_bb29 ], [ %"34", %main_bb28 ], !dbg !97
  store i64 %.0.i.i, i64* @"'flag", align 8, !dbg !97
  %"79" = icmp slt i64 %"32", 100, !dbg !180
  br i1 %"79", label %main_bb30, label %main_res_return_slice_1.exit, !dbg !180

main_bb30:                                        ; preds = %main_wrap_around.exit.i
  %"80" = call i64 @__VERIFIER_nondet_int() #3, !dbg !181
  br label %main_res_return_slice_1.exit, !dbg !182

main_NewDefault:                                  ; preds = %main_LeafBlock9, %main_LeafBlock
  br label %main_bb13

main_bb31:                                        ; preds = %main_bb13
  ret void, !dbg !183
}

declare i64 @__kittel_nondef.0()

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!20, !21}
!llvm.ident = !{!22}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !18, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [//FILES_DIR/SourceCode_SemanticAugmentor.c] [DW_LANG_C99]
!1 = metadata !{metadata !"FILES_DIR/SourceCode_SemanticAugmentor.c", metadata !"/"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9, metadata !12, metadata !15}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"wrap_around", metadata !"wrap_around", metadata !"", i32 7, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i64, i64, i64)* @wrap_around, null, null, metadata !2, i32 7} ; [ DW_TAG_subprogram ] [line 7] [def] [wrap_around]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"matroska_deliver_packet_slice_1", metadata !"matroska_deliver_packet_slice_1", metadata !"", i32 17, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i64)* @matroska_deliver_packet_slice_1, null, null, metadata !2, i32 18} ; [ DW_TAG_subprogram ] [line 17] [def] [scope 18] [matroska_deliver_packet_slice_1]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !8, metadata !8}
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"res_return_slice_1", metadata !"res_return_slice_1", metadata !"", i32 27, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 ()* @res_return_slice_1, null, null, metadata !2, i32 28} ; [ DW_TAG_subprogram ] [line 27] [def] [scope 28] [res_return_slice_1]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{metadata !8}
!15 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 43, metadata !16, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @main, null, null, metadata !2, i32 44} ; [ DW_TAG_subprogram ] [line 43] [def] [scope 44] [main]
!16 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !17, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!17 = metadata !{null}
!18 = metadata !{metadata !19}
!19 = metadata !{i32 786484, i32 0, null, metadata !"flag", metadata !"flag", metadata !"", metadata !5, i32 26, metadata !8, i32 0, i32 1, i64* @"'flag", null} ; [ DW_TAG_variable ] [flag] [line 26] [def]
!20 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!21 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!22 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!23 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777223, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 7]
!24 = metadata !{i32 7, i32 33, metadata !4, null}
!25 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554439, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [lower_bound] [line 7]
!26 = metadata !{i32 7, i32 50, metadata !4, null}
!27 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331655, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [upper_bound] [line 7]
!28 = metadata !{i32 7, i32 73, metadata !4, null}
!29 = metadata !{i32 8, i32 5, metadata !4, null} ; [ DW_TAG_imported_declaration ]
!30 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 8, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [range] [line 8]
!31 = metadata !{i32 8, i32 15, metadata !4, null} ; [ DW_TAG_imported_declaration ]
!32 = metadata !{i32 9, i32 9, metadata !33, null}
!33 = metadata !{i32 786443, metadata !1, metadata !4, i32 9, i32 9, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!34 = metadata !{i32 10, i32 9, metadata !35, null}
!35 = metadata !{i32 786443, metadata !1, metadata !33, i32 9, i32 30, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!36 = metadata !{i32 12, i32 14, metadata !37, null}
!37 = metadata !{i32 786443, metadata !1, metadata !33, i32 12, i32 14, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!38 = metadata !{i32 13, i32 9, metadata !39, null}
!39 = metadata !{i32 786443, metadata !1, metadata !37, i32 12, i32 35, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!40 = metadata !{i32 16, i32 1, metadata !4, null}
!41 = metadata !{i32 786689, metadata !9, metadata !"q", metadata !5, i32 16777233, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [q] [line 17]
!42 = metadata !{i32 17, i32 53, metadata !9, null}
!43 = metadata !{i32 20, i32 7, metadata !44, null}
!44 = metadata !{i32 786443, metadata !1, metadata !9, i32 20, i32 7, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!45 = metadata !{i32 22, i32 1, metadata !46, null}
!46 = metadata !{i32 786443, metadata !1, metadata !44, i32 21, i32 1, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!47 = metadata !{i32 23, i32 3, metadata !9, null}
!48 = metadata !{i32 31, i32 3, metadata !12, null}
!49 = metadata !{i32 786688, metadata !12, metadata !"tmp_0", metadata !5, i32 30, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmp_0] [line 30]
!50 = metadata !{i32 30, i32 13, metadata !12, null}
!51 = metadata !{i32 32, i32 11, metadata !12, null}
!52 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777223, metadata !8, i32 0, metadata !51} ; [ DW_TAG_arg_variable ] [value] [line 7]
!53 = metadata !{i32 7, i32 33, metadata !4, metadata !51}
!54 = metadata !{i64 -2147483648}
!55 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554439, metadata !8, i32 0, metadata !51} ; [ DW_TAG_arg_variable ] [lower_bound] [line 7]
!56 = metadata !{i32 7, i32 50, metadata !4, metadata !51}
!57 = metadata !{i64 2147483647}
!58 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331655, metadata !8, i32 0, metadata !51} ; [ DW_TAG_arg_variable ] [upper_bound] [line 7]
!59 = metadata !{i32 7, i32 73, metadata !4, metadata !51}
!60 = metadata !{i64 4294967296}
!61 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 8, metadata !8, i32 0, metadata !51} ; [ DW_TAG_auto_variable ] [range] [line 8]
!62 = metadata !{i32 8, i32 15, metadata !4, metadata !51} ; [ DW_TAG_imported_declaration ]
!63 = metadata !{i32 9, i32 9, metadata !33, metadata !51}
!64 = metadata !{i32 10, i32 9, metadata !35, metadata !51}
!65 = metadata !{i32 12, i32 14, metadata !37, metadata !51}
!66 = metadata !{i32 13, i32 9, metadata !39, metadata !51}
!67 = metadata !{i32 33, i32 7, metadata !68, null}
!68 = metadata !{i32 786443, metadata !1, metadata !12, i32 33, i32 7, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!69 = metadata !{i32 35, i32 11, metadata !70, null}
!70 = metadata !{i32 786443, metadata !1, metadata !68, i32 33, i32 20, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!71 = metadata !{i32 786688, metadata !70, metadata !"tmp", metadata !5, i32 34, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmp] [line 34]
!72 = metadata !{i32 34, i32 15, metadata !70, null}
!73 = metadata !{i32 786688, metadata !12, metadata !"__retres", metadata !5, i32 29, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__retres] [line 29]
!74 = metadata !{i32 29, i32 13, metadata !12, null}
!75 = metadata !{i32 37, i32 5, metadata !70, null}
!76 = metadata !{i32 40, i32 17, metadata !12, null}
!77 = metadata !{i32 47, i32 24, metadata !15, null}
!78 = metadata !{i32 786688, metadata !15, metadata !"matroska", metadata !5, i32 47, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [matroska] [line 47]
!79 = metadata !{i32 47, i32 13, metadata !15, null}
!80 = metadata !{i32 786689, metadata !9, metadata !"q", metadata !5, i32 16777233, metadata !8, i32 0, metadata !81} ; [ DW_TAG_arg_variable ] [q] [line 17]
!81 = metadata !{i32 49, i32 15, metadata !82, null}
!82 = metadata !{i32 786443, metadata !1, metadata !15, i32 48, i32 13, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!83 = metadata !{i32 17, i32 53, metadata !9, metadata !81}
!84 = metadata !{i32 786688, metadata !15, metadata !"tmpVar0", metadata !5, i32 46, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmpVar0] [line 46]
!85 = metadata !{i32 46, i32 13, metadata !15, null}
!86 = metadata !{i64 0}
!87 = metadata !{i32 786688, metadata !15, metadata !"res", metadata !5, i32 45, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [res] [line 45]
!88 = metadata !{i32 45, i32 13, metadata !15, null}
!89 = metadata !{i32 786688, metadata !90, metadata !"id", metadata !5, i32 55, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [id] [line 55]
!90 = metadata !{i32 786443, metadata !1, metadata !82, i32 54, i32 22, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!91 = metadata !{i32 55, i32 17, metadata !90, null}
!92 = metadata !{i32 786688, metadata !12, metadata !"tmp_0", metadata !5, i32 30, metadata !8, i32 0, metadata !93} ; [ DW_TAG_auto_variable ] [tmp_0] [line 30]
!93 = metadata !{i32 77, i32 32, metadata !94, null}
!94 = metadata !{i32 786443, metadata !1, metadata !90, i32 56, i32 19, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!95 = metadata !{i32 30, i32 13, metadata !12, metadata !93}
!96 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777223, metadata !8, i32 0, metadata !97} ; [ DW_TAG_arg_variable ] [value] [line 7]
!97 = metadata !{i32 32, i32 11, metadata !12, metadata !93}
!98 = metadata !{i32 7, i32 33, metadata !4, metadata !97}
!99 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554439, metadata !8, i32 0, metadata !97} ; [ DW_TAG_arg_variable ] [lower_bound] [line 7]
!100 = metadata !{i32 7, i32 50, metadata !4, metadata !97}
!101 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331655, metadata !8, i32 0, metadata !97} ; [ DW_TAG_arg_variable ] [upper_bound] [line 7]
!102 = metadata !{i32 7, i32 73, metadata !4, metadata !97}
!103 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 8, metadata !8, i32 0, metadata !97} ; [ DW_TAG_auto_variable ] [range] [line 8]
!104 = metadata !{i32 8, i32 15, metadata !4, metadata !97} ; [ DW_TAG_imported_declaration ]
!105 = metadata !{i32 786688, metadata !70, metadata !"tmp", metadata !5, i32 34, metadata !8, i32 0, metadata !93} ; [ DW_TAG_auto_variable ] [tmp] [line 34]
!106 = metadata !{i32 34, i32 15, metadata !70, metadata !93}
!107 = metadata !{i32 786688, metadata !12, metadata !"__retres", metadata !5, i32 29, metadata !8, i32 0, metadata !93} ; [ DW_TAG_auto_variable ] [__retres] [line 29]
!108 = metadata !{i32 29, i32 13, metadata !12, metadata !93}
!109 = metadata !{i32 786688, metadata !12, metadata !"tmp_0", metadata !5, i32 30, metadata !8, i32 0, metadata !110} ; [ DW_TAG_auto_variable ] [tmp_0] [line 30]
!110 = metadata !{i32 61, i32 19, metadata !111, null}
!111 = metadata !{i32 786443, metadata !1, metadata !94, i32 60, i32 9, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!112 = metadata !{i32 30, i32 13, metadata !12, metadata !110}
!113 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777223, metadata !8, i32 0, metadata !114} ; [ DW_TAG_arg_variable ] [value] [line 7]
!114 = metadata !{i32 32, i32 11, metadata !12, metadata !110}
!115 = metadata !{i32 7, i32 33, metadata !4, metadata !114}
!116 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554439, metadata !8, i32 0, metadata !114} ; [ DW_TAG_arg_variable ] [lower_bound] [line 7]
!117 = metadata !{i32 7, i32 50, metadata !4, metadata !114}
!118 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331655, metadata !8, i32 0, metadata !114} ; [ DW_TAG_arg_variable ] [upper_bound] [line 7]
!119 = metadata !{i32 7, i32 73, metadata !4, metadata !114}
!120 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 8, metadata !8, i32 0, metadata !114} ; [ DW_TAG_auto_variable ] [range] [line 8]
!121 = metadata !{i32 8, i32 15, metadata !4, metadata !114} ; [ DW_TAG_imported_declaration ]
!122 = metadata !{i32 786688, metadata !70, metadata !"tmp", metadata !5, i32 34, metadata !8, i32 0, metadata !110} ; [ DW_TAG_auto_variable ] [tmp] [line 34]
!123 = metadata !{i32 34, i32 15, metadata !70, metadata !110}
!124 = metadata !{i32 786688, metadata !12, metadata !"__retres", metadata !5, i32 29, metadata !8, i32 0, metadata !110} ; [ DW_TAG_auto_variable ] [__retres] [line 29]
!125 = metadata !{i32 29, i32 13, metadata !12, metadata !110}
!126 = metadata !{i32 786688, metadata !12, metadata !"tmp_0", metadata !5, i32 30, metadata !8, i32 0, metadata !127} ; [ DW_TAG_auto_variable ] [tmp_0] [line 30]
!127 = metadata !{i32 69, i32 17, metadata !94, null}
!128 = metadata !{i32 30, i32 13, metadata !12, metadata !127}
!129 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777223, metadata !8, i32 0, metadata !130} ; [ DW_TAG_arg_variable ] [value] [line 7]
!130 = metadata !{i32 32, i32 11, metadata !12, metadata !127}
!131 = metadata !{i32 7, i32 33, metadata !4, metadata !130}
!132 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554439, metadata !8, i32 0, metadata !130} ; [ DW_TAG_arg_variable ] [lower_bound] [line 7]
!133 = metadata !{i32 7, i32 50, metadata !4, metadata !130}
!134 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331655, metadata !8, i32 0, metadata !130} ; [ DW_TAG_arg_variable ] [upper_bound] [line 7]
!135 = metadata !{i32 7, i32 73, metadata !4, metadata !130}
!136 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 8, metadata !8, i32 0, metadata !130} ; [ DW_TAG_auto_variable ] [range] [line 8]
!137 = metadata !{i32 8, i32 15, metadata !4, metadata !130} ; [ DW_TAG_imported_declaration ]
!138 = metadata !{i32 786688, metadata !70, metadata !"tmp", metadata !5, i32 34, metadata !8, i32 0, metadata !127} ; [ DW_TAG_auto_variable ] [tmp] [line 34]
!139 = metadata !{i32 34, i32 15, metadata !70, metadata !127}
!140 = metadata !{i32 786688, metadata !12, metadata !"__retres", metadata !5, i32 29, metadata !8, i32 0, metadata !127} ; [ DW_TAG_auto_variable ] [__retres] [line 29]
!141 = metadata !{i32 29, i32 13, metadata !12, metadata !127}
!142 = metadata !{i64 1}
!143 = metadata !{i32 48, i32 3, metadata !15, null}
!144 = metadata !{i32 20, i32 7, metadata !44, metadata !81}
!145 = metadata !{i32 22, i32 1, metadata !46, metadata !81}
!146 = metadata !{i32 50, i32 9, metadata !147, null}
!147 = metadata !{i32 786443, metadata !1, metadata !82, i32 50, i32 9, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!148 = metadata !{i32 84, i32 1, metadata !149, null}
!149 = metadata !{i32 786443, metadata !1, metadata !150, i32 83, i32 1, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!150 = metadata !{i32 786443, metadata !1, metadata !82, i32 82, i32 9, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!151 = metadata !{i32 55, i32 22, metadata !90, null}
!152 = metadata !{i32 56, i32 7, metadata !90, null}
!153 = metadata !{i32 31, i32 3, metadata !12, metadata !110}
!154 = metadata !{i32 9, i32 9, metadata !33, metadata !114}
!155 = metadata !{i32 10, i32 9, metadata !35, metadata !114}
!156 = metadata !{i32 12, i32 14, metadata !37, metadata !114}
!157 = metadata !{i32 13, i32 9, metadata !39, metadata !114}
!158 = metadata !{i32 33, i32 7, metadata !68, metadata !110}
!159 = metadata !{i32 35, i32 11, metadata !70, metadata !110}
!160 = metadata !{i32 37, i32 5, metadata !70, metadata !110}
!161 = metadata !{i32 62, i32 11, metadata !111, null}
!162 = metadata !{i32 64, i32 13, metadata !163, null}
!163 = metadata !{i32 786443, metadata !1, metadata !94, i32 64, i32 13, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!164 = metadata !{i32 31, i32 3, metadata !12, metadata !127}
!165 = metadata !{i32 9, i32 9, metadata !33, metadata !130}
!166 = metadata !{i32 10, i32 9, metadata !35, metadata !130}
!167 = metadata !{i32 12, i32 14, metadata !37, metadata !130}
!168 = metadata !{i32 13, i32 9, metadata !39, metadata !130}
!169 = metadata !{i32 33, i32 7, metadata !68, metadata !127}
!170 = metadata !{i32 35, i32 11, metadata !70, metadata !127}
!171 = metadata !{i32 37, i32 5, metadata !70, metadata !127}
!172 = metadata !{i32 70, i32 9, metadata !94, null}
!173 = metadata !{i32 71, i32 13, metadata !174, null}
!174 = metadata !{i32 786443, metadata !1, metadata !94, i32 71, i32 13, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!175 = metadata !{i32 76, i32 9, metadata !94, null}
!176 = metadata !{i32 9, i32 9, metadata !33, metadata !97}
!177 = metadata !{i32 10, i32 9, metadata !35, metadata !97}
!178 = metadata !{i32 12, i32 14, metadata !37, metadata !97}
!179 = metadata !{i32 13, i32 9, metadata !39, metadata !97}
!180 = metadata !{i32 33, i32 7, metadata !68, metadata !93}
!181 = metadata !{i32 35, i32 11, metadata !70, metadata !93}
!182 = metadata !{i32 37, i32 5, metadata !70, metadata !93}
!183 = metadata !{i32 86, i32 3, metadata !15, null}

