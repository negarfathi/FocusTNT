; ModuleID = 'FILES_DIR/SourceCode_llvm2KITTeL.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@"'flag" = global i64 0, align 8

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
define i64 @read(i64 %loc, i64 %len) #0 {
read_bb5:
  call void @llvm.dbg.value(metadata !{i64 %loc}, i64 0, metadata !39), !dbg !40
  call void @llvm.dbg.value(metadata !{i64 %len}, i64 0, metadata !41), !dbg !42
  call void @llvm.dbg.value(metadata !43, i64 0, metadata !44), !dbg !45
  %"12" = load i64* @"'flag", align 8, !dbg !46
  %"13" = icmp eq i64 %"12", 1, !dbg !46
  br i1 %"13", label %read_bb20, label %read_wrap_around.exit2, !dbg !46

read_wrap_around.exit2:                           ; preds = %read_bb18, %read_bb17, %read_bb16, %read_bb5
  %count.0 = phi i64 [ 0, %read_bb5 ], [ %.0.i3, %read_bb16 ], [ %.0.i3, %read_bb17 ], [ %.0.i3, %read_bb18 ]
  %.06 = phi i64 [ %loc, %read_bb5 ], [ %"46", %read_bb16 ], [ %"51", %read_bb18 ], [ %"41", %read_bb17 ]
  %"14" = icmp slt i64 %.06, %len, !dbg !48
  br i1 %"14", label %read_bb6, label %read_bb20, !dbg !48

read_bb6:                                         ; preds = %read_wrap_around.exit2
  %"15" = icmp eq i64 10, 0, !dbg !50
  br i1 %"15", label %read_bb20, label %read_bb7, !dbg !50

read_bb7:                                         ; preds = %read_bb6
  %"16" = icmp slt i64 10, 0, !dbg !53
  br i1 %"16", label %read_bb8, label %read_wrap_around.exit, !dbg !53

read_bb8:                                         ; preds = %read_bb7
  %"17" = sub nsw i64 0, 10, !dbg !56
  %"18" = icmp sgt i64 %"17", 2147483647, !dbg !58
  br i1 %"18", label %read_bb9, label %read_bb10, !dbg !58

read_bb9:                                         ; preds = %read_bb8
  %"19" = sub nsw i64 %"17", 2147483647, !dbg !59
  %"20" = sub nsw i64 %"19", 1, !dbg !59
  %"21" = srem i64 %"20", 4294967296, !dbg !59
  %"22" = add nsw i64 -2147483648, %"21", !dbg !59
  br label %read_wrap_around.exit, !dbg !59

read_bb10:                                        ; preds = %read_bb8
  %"23" = icmp slt i64 %"17", -2147483648, !dbg !60
  br i1 %"23", label %read_bb11, label %read_wrap_around.exit, !dbg !60

read_bb11:                                        ; preds = %read_bb10
  %"24" = sub nsw i64 -2147483648, %"17", !dbg !61
  %"25" = sub nsw i64 %"24", 1, !dbg !61
  %"26" = srem i64 %"25", 4294967296, !dbg !61
  %"27" = sub nsw i64 2147483647, %"26", !dbg !61
  br label %read_wrap_around.exit, !dbg !61

read_wrap_around.exit:                            ; preds = %read_bb11, %read_bb10, %read_bb9, %read_bb7
  %num.0 = phi i64 [ 10, %read_bb7 ], [ %"22", %read_bb9 ], [ %"27", %read_bb11 ], [ %"17", %read_bb10 ]
  %"28" = srem i64 %num.0, 1000, !dbg !62
  %"29" = add nsw i64 %count.0, 1, !dbg !63
  %"30" = icmp sgt i64 %"29", 2147483647, !dbg !64
  br i1 %"30", label %read_bb12, label %read_bb13, !dbg !64

read_bb12:                                        ; preds = %read_wrap_around.exit
  %"31" = sub nsw i64 %"29", 2147483647, !dbg !65
  %"32" = sub nsw i64 %"31", 1, !dbg !65
  %"33" = srem i64 %"32", 4294967296, !dbg !65
  %"34" = add nsw i64 -2147483648, %"33", !dbg !65
  br label %read_wrap_around.exit4, !dbg !65

read_bb13:                                        ; preds = %read_wrap_around.exit
  %"35" = icmp slt i64 %"29", -2147483648, !dbg !66
  br i1 %"35", label %read_bb14, label %read_wrap_around.exit4, !dbg !66

read_bb14:                                        ; preds = %read_bb13
  %"36" = sub nsw i64 -2147483648, %"29", !dbg !67
  %"37" = sub nsw i64 %"36", 1, !dbg !67
  %"38" = srem i64 %"37", 4294967296, !dbg !67
  %"39" = sub nsw i64 2147483647, %"38", !dbg !67
  br label %read_wrap_around.exit4, !dbg !67

read_wrap_around.exit4:                           ; preds = %read_bb12, %read_bb13, %read_bb14
  %.0.i3 = phi i64 [ %"34", %read_bb12 ], [ %"39", %read_bb14 ], [ %"29", %read_bb13 ], !dbg !63
  %"40" = icmp slt i64 %"28", 995, !dbg !68
  br i1 %"40", label %read_bb15, label %read_bb19, !dbg !68

read_bb15:                                        ; preds = %read_wrap_around.exit4
  %"41" = add nsw i64 %.06, 1, !dbg !70
  %"42" = icmp sgt i64 %"41", 2147483647, !dbg !72
  br i1 %"42", label %read_bb16, label %read_bb17, !dbg !72

read_bb16:                                        ; preds = %read_bb15
  %"43" = sub nsw i64 %"41", 2147483647, !dbg !73
  %"44" = sub nsw i64 %"43", 1, !dbg !73
  %"45" = srem i64 %"44", 4294967296, !dbg !73
  %"46" = add nsw i64 -2147483648, %"45", !dbg !73
  br label %read_wrap_around.exit2, !dbg !73

read_bb17:                                        ; preds = %read_bb15
  %"47" = icmp slt i64 %"41", -2147483648, !dbg !74
  br i1 %"47", label %read_bb18, label %read_wrap_around.exit2, !dbg !74

read_bb18:                                        ; preds = %read_bb17
  %"48" = sub nsw i64 -2147483648, %"41", !dbg !75
  %"49" = sub nsw i64 %"48", 1, !dbg !75
  %"50" = srem i64 %"49", 4294967296, !dbg !75
  %"51" = sub nsw i64 2147483647, %"50", !dbg !75
  br label %read_wrap_around.exit2, !dbg !75

read_bb19:                                        ; preds = %read_wrap_around.exit4
  store i64 1, i64* @"'flag", align 8, !dbg !76
  br label %read_bb20, !dbg !78

read_bb20:                                        ; preds = %read_wrap_around.exit2, %read_bb6, %read_bb5, %read_bb19
  %.0 = phi i64 [ %.0.i3, %read_bb19 ], [ 0, %read_bb5 ], [ -1, %read_bb6 ], [ %count.0, %read_wrap_around.exit2 ]
  ret i64 %.0, !dbg !79
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
main_bb21:
  call void @llvm.dbg.value(metadata !80, i64 0, metadata !81), !dbg !82
  %"52" = icmp sle i64 -5, 0, !dbg !83
  br i1 %"52", label %main_bb44, label %main_bb22, !dbg !83

main_bb22:                                        ; preds = %main_bb21
  call void @llvm.dbg.value(metadata !43, i64 0, metadata !85), !dbg !86
  call void @llvm.dbg.value(metadata !43, i64 0, metadata !87), !dbg !88
  call void @llvm.dbg.value(metadata !{i64 %buf.0}, i64 0, metadata !89), !dbg !92
  call void @llvm.dbg.value(metadata !{i64 %count.0}, i64 0, metadata !93), !dbg !94
  call void @llvm.dbg.value(metadata !43, i64 0, metadata !95), !dbg !96
  %"53" = load i64* @"'flag", align 8, !dbg !97
  call void @llvm.dbg.value(metadata !{i64 %.0.i}, i64 0, metadata !98), !dbg !99
  call void @llvm.dbg.value(metadata !{i64 %"81"}, i64 0, metadata !87), !dbg !88
  call void @llvm.dbg.value(metadata !{i64 %"81"}, i64 0, metadata !100), !dbg !106
  call void @llvm.dbg.value(metadata !107, i64 0, metadata !108), !dbg !109
  call void @llvm.dbg.value(metadata !110, i64 0, metadata !111), !dbg !112
  call void @llvm.dbg.value(metadata !113, i64 0, metadata !114), !dbg !115
  call void @llvm.dbg.value(metadata !{i64 %"93"}, i64 0, metadata !116), !dbg !118
  call void @llvm.dbg.value(metadata !107, i64 0, metadata !119), !dbg !120
  call void @llvm.dbg.value(metadata !110, i64 0, metadata !121), !dbg !122
  call void @llvm.dbg.value(metadata !113, i64 0, metadata !123), !dbg !124
  call void @llvm.dbg.value(metadata !{i64 %.0.i2}, i64 0, metadata !81), !dbg !82
  call void @llvm.dbg.value(metadata !{i64 %"104"}, i64 0, metadata !125), !dbg !127
  call void @llvm.dbg.value(metadata !107, i64 0, metadata !128), !dbg !129
  call void @llvm.dbg.value(metadata !110, i64 0, metadata !130), !dbg !131
  call void @llvm.dbg.value(metadata !113, i64 0, metadata !132), !dbg !133
  br label %main_wrap_around.exit7, !dbg !134

main_wrap_around.exit7:                           ; preds = %main_bb43, %main_bb42, %main_bb41, %main_bb36, %main_bb35, %main_bb34, %main_bb22
  %tries.0 = phi i64 [ 0, %main_bb22 ], [ %"87", %main_bb34 ], [ %"92", %main_bb36 ], [ %"81", %main_bb35 ], [ %tries.0, %main_bb41 ], [ %tries.0, %main_bb42 ], [ %tries.0, %main_bb43 ]
  %buf.0 = phi i64 [ 0, %main_bb22 ], [ %buf.0, %main_bb34 ], [ %buf.0, %main_bb35 ], [ %buf.0, %main_bb36 ], [ %"109", %main_bb41 ], [ %"114", %main_bb43 ], [ %"104", %main_bb42 ]
  %count.0 = phi i64 [ -5, %main_bb22 ], [ %count.0, %main_bb34 ], [ %count.0, %main_bb35 ], [ %count.0, %main_bb36 ], [ %.0.i2, %main_bb41 ], [ %.0.i2, %main_bb42 ], [ %.0.i2, %main_bb43 ]
  %"54" = icmp sgt i64 %count.0, 0, !dbg !135
  br i1 %"54", label %main_bb23, label %main_bb44, !dbg !135

main_bb23:                                        ; preds = %main_wrap_around.exit7
  %"55" = icmp eq i64 %"53", 1, !dbg !97
  br i1 %"55", label %main_read.exit, label %main_wrap_around.exit2.i, !dbg !97

main_wrap_around.exit2.i:                         ; preds = %main_bb30, %main_bb29, %main_bb28, %main_bb23
  %count.0.i = phi i64 [ 0, %main_bb23 ], [ %.0.i3.i, %main_bb28 ], [ %.0.i3.i, %main_bb29 ], [ %.0.i3.i, %main_bb30 ], !dbg !90
  %.06.i = phi i64 [ %buf.0, %main_bb23 ], [ %"73", %main_bb28 ], [ %"78", %main_bb30 ], [ %"68", %main_bb29 ], !dbg !90
  %"56" = icmp slt i64 %.06.i, %count.0, !dbg !137
  br i1 %"56", label %main_bb24, label %main_read.exit, !dbg !137

main_bb24:                                        ; preds = %main_wrap_around.exit2.i
  %"57" = add nsw i64 %count.0.i, 1, !dbg !138
  %"58" = icmp sgt i64 %"57", 2147483647, !dbg !139
  br i1 %"58", label %main_bb25, label %main_bb26, !dbg !139

main_bb25:                                        ; preds = %main_bb24
  %"59" = sub nsw i64 %"57", 2147483647, !dbg !140
  %"60" = sub nsw i64 %"59", 1, !dbg !140
  %"61" = srem i64 %"60", 4294967296, !dbg !140
  %"62" = add nsw i64 -2147483648, %"61", !dbg !140
  br label %main_wrap_around.exit4.i, !dbg !140

main_bb26:                                        ; preds = %main_bb24
  %"63" = icmp slt i64 %"57", -2147483648, !dbg !141
  br i1 %"63", label %main_bb27, label %main_wrap_around.exit4.i, !dbg !141

main_bb27:                                        ; preds = %main_bb26
  %"64" = sub nsw i64 -2147483648, %"57", !dbg !142
  %"65" = sub nsw i64 %"64", 1, !dbg !142
  %"66" = srem i64 %"65", 4294967296, !dbg !142
  %"67" = sub nsw i64 2147483647, %"66", !dbg !142
  br label %main_wrap_around.exit4.i, !dbg !142

main_wrap_around.exit4.i:                         ; preds = %main_bb27, %main_bb26, %main_bb25
  %.0.i3.i = phi i64 [ %"62", %main_bb25 ], [ %"67", %main_bb27 ], [ %"57", %main_bb26 ], !dbg !138
  %"68" = add nsw i64 %.06.i, 1, !dbg !143
  %"69" = icmp sgt i64 %"68", 2147483647, !dbg !144
  br i1 %"69", label %main_bb28, label %main_bb29, !dbg !144

main_bb28:                                        ; preds = %main_wrap_around.exit4.i
  %"70" = sub nsw i64 %"68", 2147483647, !dbg !145
  %"71" = sub nsw i64 %"70", 1, !dbg !145
  %"72" = srem i64 %"71", 4294967296, !dbg !145
  %"73" = add nsw i64 -2147483648, %"72", !dbg !145
  br label %main_wrap_around.exit2.i, !dbg !145

main_bb29:                                        ; preds = %main_wrap_around.exit4.i
  %"74" = icmp slt i64 %"68", -2147483648, !dbg !146
  br i1 %"74", label %main_bb30, label %main_wrap_around.exit2.i, !dbg !146

main_bb30:                                        ; preds = %main_bb29
  %"75" = sub nsw i64 -2147483648, %"68", !dbg !147
  %"76" = sub nsw i64 %"75", 1, !dbg !147
  %"77" = srem i64 %"76", 4294967296, !dbg !147
  %"78" = sub nsw i64 2147483647, %"77", !dbg !147
  br label %main_wrap_around.exit2.i, !dbg !147

main_read.exit:                                   ; preds = %main_bb23, %main_wrap_around.exit2.i
  %.0.i = phi i64 [ 0, %main_bb23 ], [ %count.0.i, %main_wrap_around.exit2.i ], !dbg !90
  %"79" = icmp sle i64 %.0.i, 0, !dbg !148
  br i1 %"79", label %main_bb31, label %main_bb37, !dbg !148

main_bb31:                                        ; preds = %main_read.exit
  %"80" = icmp eq i64 %.0.i, 0, !dbg !149
  br i1 %"80", label %main_bb32, label %main_wrap_around.exit5, !dbg !149

main_bb32:                                        ; preds = %main_bb31
  %"81" = add nsw i64 %tries.0, 1, !dbg !150
  %"82" = icmp slt i64 %tries.0, 5, !dbg !150
  br i1 %"82", label %main_bb33, label %main_wrap_around.exit5, !dbg !150

main_bb33:                                        ; preds = %main_bb32
  %"83" = icmp sgt i64 %"81", 2147483647, !dbg !152
  br i1 %"83", label %main_bb34, label %main_bb35, !dbg !152

main_bb34:                                        ; preds = %main_bb33
  %"84" = sub nsw i64 %"81", 2147483647, !dbg !153
  %"85" = sub nsw i64 %"84", 1, !dbg !153
  %"86" = srem i64 %"85", 4294967296, !dbg !153
  %"87" = add nsw i64 -2147483648, %"86", !dbg !153
  br label %main_wrap_around.exit7, !dbg !153

main_bb35:                                        ; preds = %main_bb33
  %"88" = icmp slt i64 %"81", -2147483648, !dbg !154
  br i1 %"88", label %main_bb36, label %main_wrap_around.exit7, !dbg !154

main_bb36:                                        ; preds = %main_bb35
  %"89" = sub nsw i64 -2147483648, %"81", !dbg !155
  %"90" = sub nsw i64 %"89", 1, !dbg !155
  %"91" = srem i64 %"90", 4294967296, !dbg !155
  %"92" = sub nsw i64 2147483647, %"91", !dbg !155
  br label %main_wrap_around.exit7, !dbg !155

main_wrap_around.exit5:                           ; preds = %main_bb32, %main_bb31
  call void @llvm.dbg.value(metadata !107, i64 0, metadata !156), !dbg !158
  call void @llvm.dbg.value(metadata !110, i64 0, metadata !159), !dbg !160
  call void @llvm.dbg.value(metadata !113, i64 0, metadata !161), !dbg !162
  br label %main_bb44, !dbg !163

main_bb37:                                        ; preds = %main_read.exit
  %"93" = sub nsw i64 %count.0, %.0.i, !dbg !117
  %"94" = icmp sgt i64 %"93", 2147483647, !dbg !164
  br i1 %"94", label %main_bb38, label %main_bb39, !dbg !164

main_bb38:                                        ; preds = %main_bb37
  %"95" = sub nsw i64 %"93", 2147483647, !dbg !165
  %"96" = sub nsw i64 %"95", 1, !dbg !165
  %"97" = srem i64 %"96", 4294967296, !dbg !165
  %"98" = add nsw i64 -2147483648, %"97", !dbg !165
  br label %main_wrap_around.exit3, !dbg !165

main_bb39:                                        ; preds = %main_bb37
  %"99" = icmp slt i64 %"93", -2147483648, !dbg !166
  br i1 %"99", label %main_bb40, label %main_wrap_around.exit3, !dbg !166

main_bb40:                                        ; preds = %main_bb39
  %"100" = sub nsw i64 -2147483648, %"93", !dbg !167
  %"101" = sub nsw i64 %"100", 1, !dbg !167
  %"102" = srem i64 %"101", 4294967296, !dbg !167
  %"103" = sub nsw i64 2147483647, %"102", !dbg !167
  br label %main_wrap_around.exit3, !dbg !167

main_wrap_around.exit3:                           ; preds = %main_bb38, %main_bb39, %main_bb40
  %.0.i2 = phi i64 [ %"98", %main_bb38 ], [ %"103", %main_bb40 ], [ %"93", %main_bb39 ], !dbg !117
  %"104" = add nsw i64 %buf.0, %.0.i, !dbg !126
  %"105" = icmp sgt i64 %"104", 2147483647, !dbg !168
  br i1 %"105", label %main_bb41, label %main_bb42, !dbg !168

main_bb41:                                        ; preds = %main_wrap_around.exit3
  %"106" = sub nsw i64 %"104", 2147483647, !dbg !169
  %"107" = sub nsw i64 %"106", 1, !dbg !169
  %"108" = srem i64 %"107", 4294967296, !dbg !169
  %"109" = add nsw i64 -2147483648, %"108", !dbg !169
  br label %main_wrap_around.exit7, !dbg !169

main_bb42:                                        ; preds = %main_wrap_around.exit3
  %"110" = icmp slt i64 %"104", -2147483648, !dbg !170
  br i1 %"110", label %main_bb43, label %main_wrap_around.exit7, !dbg !170

main_bb43:                                        ; preds = %main_bb42
  %"111" = sub nsw i64 -2147483648, %"104", !dbg !171
  %"112" = sub nsw i64 %"111", 1, !dbg !171
  %"113" = srem i64 %"112", 4294967296, !dbg !171
  %"114" = sub nsw i64 2147483647, %"113", !dbg !171
  br label %main_wrap_around.exit7, !dbg !171

main_bb44:                                        ; preds = %main_wrap_around.exit7, %main_bb21, %main_wrap_around.exit5
  ret i32 0, !dbg !172
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
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"wrap_around", metadata !"wrap_around", metadata !"", i32 12, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i64, i64, i64)* @wrap_around, null, null, metadata !2, i32 12} ; [ DW_TAG_subprogram ] [line 12] [def] [wrap_around]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"read", metadata !"read", metadata !"", i32 22, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i64, i64)* @read, null, null, metadata !2, i32 23} ; [ DW_TAG_subprogram ] [line 22] [def] [scope 23] [read]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !8, metadata !8, metadata !8}
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 58, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 59} ; [ DW_TAG_subprogram ] [line 58] [def] [scope 59] [main]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{metadata !15}
!15 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!16 = metadata !{metadata !17}
!17 = metadata !{i32 786484, i32 0, null, metadata !"flag", metadata !"flag", metadata !"", metadata !5, i32 11, metadata !8, i32 0, i32 1, i64* @"'flag", null} ; [ DW_TAG_variable ] [flag] [line 11] [def]
!18 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!19 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!20 = metadata !{metadata !"clang version 3.5.2 (http://llvm.org/git/clang.git 395a76d5372abd34fa791f6c10ebcdf43d74c8bd) (http://llvm.org/git/llvm.git a4cf325e41fca33c7ce7deef39a7bcf25fb38266)"}
!21 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777228, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 12]
!22 = metadata !{i32 12, i32 33, metadata !4, null}
!23 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554444, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [lower_bound] [line 12]
!24 = metadata !{i32 12, i32 50, metadata !4, null}
!25 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331660, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [upper_bound] [line 12]
!26 = metadata !{i32 12, i32 73, metadata !4, null}
!27 = metadata !{i32 13, i32 5, metadata !4, null}
!28 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 13, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [range] [line 13]
!29 = metadata !{i32 13, i32 15, metadata !4, null}
!30 = metadata !{i32 14, i32 9, metadata !31, null}
!31 = metadata !{i32 786443, metadata !1, metadata !4, i32 14, i32 9, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!32 = metadata !{i32 15, i32 9, metadata !33, null}
!33 = metadata !{i32 786443, metadata !1, metadata !31, i32 14, i32 30, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!34 = metadata !{i32 17, i32 14, metadata !35, null}
!35 = metadata !{i32 786443, metadata !1, metadata !31, i32 17, i32 14, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!36 = metadata !{i32 18, i32 9, metadata !37, null}
!37 = metadata !{i32 786443, metadata !1, metadata !35, i32 17, i32 35, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!38 = metadata !{i32 21, i32 1, metadata !4, null}
!39 = metadata !{i32 786689, metadata !9, metadata !"loc", metadata !5, i32 16777238, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [loc] [line 22]
!40 = metadata !{i32 22, i32 27, metadata !9, null}
!41 = metadata !{i32 786689, metadata !9, metadata !"len", metadata !5, i32 33554454, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 22]
!42 = metadata !{i32 22, i32 43, metadata !9, null}
!43 = metadata !{i64 0}
!44 = metadata !{i32 786688, metadata !9, metadata !"count", metadata !5, i32 24, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 24]
!45 = metadata !{i32 24, i32 15, metadata !9, null}
!46 = metadata !{i32 25, i32 9, metadata !47, null}
!47 = metadata !{i32 786443, metadata !1, metadata !9, i32 25, i32 9, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!48 = metadata !{i32 29, i32 5, metadata !49, null}
!49 = metadata !{i32 786443, metadata !1, metadata !9, i32 29, i32 5, i32 1, i32 22} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!50 = metadata !{i32 32, i32 13, metadata !51, null}
!51 = metadata !{i32 786443, metadata !1, metadata !52, i32 32, i32 13, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!52 = metadata !{i32 786443, metadata !1, metadata !9, i32 30, i32 5, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!53 = metadata !{i32 38, i32 17, metadata !54, null}
!54 = metadata !{i32 786443, metadata !1, metadata !55, i32 38, i32 17, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!55 = metadata !{i32 786443, metadata !1, metadata !51, i32 37, i32 9, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!56 = metadata !{i32 40, i32 24, metadata !57, null}
!57 = metadata !{i32 786443, metadata !1, metadata !54, i32 39, i32 1, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!58 = metadata !{i32 14, i32 9, metadata !31, metadata !56}
!59 = metadata !{i32 15, i32 9, metadata !33, metadata !56}
!60 = metadata !{i32 17, i32 14, metadata !35, metadata !56}
!61 = metadata !{i32 18, i32 9, metadata !37, metadata !56}
!62 = metadata !{i32 42, i32 19, metadata !55, null}
!63 = metadata !{i32 43, i32 22, metadata !55, null}
!64 = metadata !{i32 14, i32 9, metadata !31, metadata !63}
!65 = metadata !{i32 15, i32 9, metadata !33, metadata !63}
!66 = metadata !{i32 17, i32 14, metadata !35, metadata !63}
!67 = metadata !{i32 18, i32 9, metadata !37, metadata !63}
!68 = metadata !{i32 44, i32 17, metadata !69, null}
!69 = metadata !{i32 786443, metadata !1, metadata !55, i32 44, i32 17, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!70 = metadata !{i32 46, i32 24, metadata !71, null}
!71 = metadata !{i32 786443, metadata !1, metadata !69, i32 45, i32 13, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!72 = metadata !{i32 14, i32 9, metadata !31, metadata !70}
!73 = metadata !{i32 15, i32 9, metadata !33, metadata !70}
!74 = metadata !{i32 17, i32 14, metadata !35, metadata !70}
!75 = metadata !{i32 18, i32 9, metadata !37, metadata !70}
!76 = metadata !{i32 51, i32 17, metadata !77, null}
!77 = metadata !{i32 786443, metadata !1, metadata !69, i32 50, i32 13, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!78 = metadata !{i32 52, i32 17, metadata !77, null}
!79 = metadata !{i32 57, i32 1, metadata !9, null}
!80 = metadata !{i64 -5}
!81 = metadata !{i32 786688, metadata !12, metadata !"count", metadata !5, i32 60, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 60]
!82 = metadata !{i32 60, i32 15, metadata !12, null}
!83 = metadata !{i32 61, i32 9, metadata !84, null}
!84 = metadata !{i32 786443, metadata !1, metadata !12, i32 61, i32 9, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!85 = metadata !{i32 786688, metadata !12, metadata !"buf", metadata !5, i32 66, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [buf] [line 66]
!86 = metadata !{i32 66, i32 15, metadata !12, null}
!87 = metadata !{i32 786688, metadata !12, metadata !"tries", metadata !5, i32 67, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tries] [line 67]
!88 = metadata !{i32 67, i32 15, metadata !12, null}
!89 = metadata !{i32 786689, metadata !9, metadata !"loc", metadata !5, i32 16777238, metadata !8, i32 0, metadata !90} ; [ DW_TAG_arg_variable ] [loc] [line 22]
!90 = metadata !{i32 70, i32 15, metadata !91, null}
!91 = metadata !{i32 786443, metadata !1, metadata !12, i32 69, i32 5, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!92 = metadata !{i32 22, i32 27, metadata !9, metadata !90}
!93 = metadata !{i32 786689, metadata !9, metadata !"len", metadata !5, i32 33554454, metadata !8, i32 0, metadata !90} ; [ DW_TAG_arg_variable ] [len] [line 22]
!94 = metadata !{i32 22, i32 43, metadata !9, metadata !90}
!95 = metadata !{i32 786688, metadata !9, metadata !"count", metadata !5, i32 24, metadata !8, i32 0, metadata !90} ; [ DW_TAG_auto_variable ] [count] [line 24]
!96 = metadata !{i32 24, i32 15, metadata !9, metadata !90}
!97 = metadata !{i32 25, i32 9, metadata !47, metadata !90}
!98 = metadata !{i32 786688, metadata !12, metadata !"ret", metadata !5, i32 65, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ret] [line 65]
!99 = metadata !{i32 65, i32 15, metadata !12, null}
!100 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777228, metadata !8, i32 0, metadata !101} ; [ DW_TAG_arg_variable ] [value] [line 12]
!101 = metadata !{i32 75, i32 9, metadata !102, null}
!102 = metadata !{i32 786443, metadata !1, metadata !103, i32 74, i32 1, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!103 = metadata !{i32 786443, metadata !1, metadata !104, i32 73, i32 17, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!104 = metadata !{i32 786443, metadata !1, metadata !105, i32 72, i32 9, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!105 = metadata !{i32 786443, metadata !1, metadata !91, i32 71, i32 13, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!106 = metadata !{i32 12, i32 33, metadata !4, metadata !101}
!107 = metadata !{i64 -2147483648}
!108 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554444, metadata !8, i32 0, metadata !101} ; [ DW_TAG_arg_variable ] [lower_bound] [line 12]
!109 = metadata !{i32 12, i32 50, metadata !4, metadata !101}
!110 = metadata !{i64 2147483647}
!111 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331660, metadata !8, i32 0, metadata !101} ; [ DW_TAG_arg_variable ] [upper_bound] [line 12]
!112 = metadata !{i32 12, i32 73, metadata !4, metadata !101}
!113 = metadata !{i64 4294967296}
!114 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 13, metadata !8, i32 0, metadata !101} ; [ DW_TAG_auto_variable ] [range] [line 13]
!115 = metadata !{i32 13, i32 15, metadata !4, metadata !101}
!116 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777228, metadata !8, i32 0, metadata !117} ; [ DW_TAG_arg_variable ] [value] [line 12]
!117 = metadata !{i32 81, i32 17, metadata !91, null}
!118 = metadata !{i32 12, i32 33, metadata !4, metadata !117}
!119 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554444, metadata !8, i32 0, metadata !117} ; [ DW_TAG_arg_variable ] [lower_bound] [line 12]
!120 = metadata !{i32 12, i32 50, metadata !4, metadata !117}
!121 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331660, metadata !8, i32 0, metadata !117} ; [ DW_TAG_arg_variable ] [upper_bound] [line 12]
!122 = metadata !{i32 12, i32 73, metadata !4, metadata !117}
!123 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 13, metadata !8, i32 0, metadata !117} ; [ DW_TAG_auto_variable ] [range] [line 13]
!124 = metadata !{i32 13, i32 15, metadata !4, metadata !117}
!125 = metadata !{i32 786689, metadata !4, metadata !"value", metadata !5, i32 16777228, metadata !8, i32 0, metadata !126} ; [ DW_TAG_arg_variable ] [value] [line 12]
!126 = metadata !{i32 82, i32 15, metadata !91, null}
!127 = metadata !{i32 12, i32 33, metadata !4, metadata !126}
!128 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554444, metadata !8, i32 0, metadata !126} ; [ DW_TAG_arg_variable ] [lower_bound] [line 12]
!129 = metadata !{i32 12, i32 50, metadata !4, metadata !126}
!130 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331660, metadata !8, i32 0, metadata !126} ; [ DW_TAG_arg_variable ] [upper_bound] [line 12]
!131 = metadata !{i32 12, i32 73, metadata !4, metadata !126}
!132 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 13, metadata !8, i32 0, metadata !126} ; [ DW_TAG_auto_variable ] [range] [line 13]
!133 = metadata !{i32 13, i32 15, metadata !4, metadata !126}
!134 = metadata !{i32 68, i32 5, metadata !12, null}
!135 = metadata !{i32 68, i32 5, metadata !136, null}
!136 = metadata !{i32 786443, metadata !1, metadata !12, i32 68, i32 5, i32 1, i32 23} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!137 = metadata !{i32 29, i32 5, metadata !49, metadata !90}
!138 = metadata !{i32 43, i32 22, metadata !55, metadata !90}
!139 = metadata !{i32 14, i32 9, metadata !31, metadata !138}
!140 = metadata !{i32 15, i32 9, metadata !33, metadata !138}
!141 = metadata !{i32 17, i32 14, metadata !35, metadata !138}
!142 = metadata !{i32 18, i32 9, metadata !37, metadata !138}
!143 = metadata !{i32 46, i32 24, metadata !71, metadata !90}
!144 = metadata !{i32 14, i32 9, metadata !31, metadata !143}
!145 = metadata !{i32 15, i32 9, metadata !33, metadata !143}
!146 = metadata !{i32 17, i32 14, metadata !35, metadata !143}
!147 = metadata !{i32 18, i32 9, metadata !37, metadata !143}
!148 = metadata !{i32 71, i32 13, metadata !105, null}
!149 = metadata !{i32 73, i32 17, metadata !103, null}
!150 = metadata !{i32 73, i32 17, metadata !151, null}
!151 = metadata !{i32 786443, metadata !1, metadata !103, i32 73, i32 17, i32 1, i32 24} ; [ DW_TAG_lexical_block ] [//FILES_DIR/SourceCode_SemanticAugmentor.c]
!152 = metadata !{i32 14, i32 9, metadata !31, metadata !101}
!153 = metadata !{i32 15, i32 9, metadata !33, metadata !101}
!154 = metadata !{i32 17, i32 14, metadata !35, metadata !101}
!155 = metadata !{i32 18, i32 9, metadata !37, metadata !101}
!156 = metadata !{i32 786689, metadata !4, metadata !"lower_bound", metadata !5, i32 33554444, metadata !8, i32 0, metadata !157} ; [ DW_TAG_arg_variable ] [lower_bound] [line 12]
!157 = metadata !{i32 78, i32 9, metadata !104, null}
!158 = metadata !{i32 12, i32 50, metadata !4, metadata !157}
!159 = metadata !{i32 786689, metadata !4, metadata !"upper_bound", metadata !5, i32 50331660, metadata !8, i32 0, metadata !157} ; [ DW_TAG_arg_variable ] [upper_bound] [line 12]
!160 = metadata !{i32 12, i32 73, metadata !4, metadata !157}
!161 = metadata !{i32 786688, metadata !4, metadata !"range", metadata !5, i32 13, metadata !8, i32 0, metadata !157} ; [ DW_TAG_auto_variable ] [range] [line 13]
!162 = metadata !{i32 13, i32 15, metadata !4, metadata !157}
!163 = metadata !{i32 79, i32 13, metadata !104, null}
!164 = metadata !{i32 14, i32 9, metadata !31, metadata !117}
!165 = metadata !{i32 15, i32 9, metadata !33, metadata !117}
!166 = metadata !{i32 17, i32 14, metadata !35, metadata !117}
!167 = metadata !{i32 18, i32 9, metadata !37, metadata !117}
!168 = metadata !{i32 14, i32 9, metadata !31, metadata !126}
!169 = metadata !{i32 15, i32 9, metadata !33, metadata !126}
!170 = metadata !{i32 17, i32 14, metadata !35, metadata !126}
!171 = metadata !{i32 18, i32 9, metadata !37, metadata !126}
!172 = metadata !{i32 85, i32 1, metadata !12, null}

