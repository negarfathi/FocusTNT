CONTROL AUTOMATON ErrorPath4

INITIAL STATE ARG0;

STATE USEFIRST ARG0 :
    MATCH "" -> GOTO ARG3;
    TRUE -> STOP;

STATE USEFIRST ARG3 :
    MATCH "extern int __VERIFIER_nondet_int(void);" -> GOTO ARG4;
    TRUE -> STOP;

STATE USEFIRST ARG4 :
    MATCH "int main()" -> GOTO ARG5;
    TRUE -> STOP;

STATE USEFIRST ARG5 :
    MATCH "" -> GOTO ARG6;
    TRUE -> STOP;

STATE USEFIRST ARG6 :
    MATCH "int needed = 2147483647;" -> ASSUME {needed == (2147483647);} GOTO ARG11;
    TRUE -> STOP;

STATE USEFIRST ARG11 :
    MATCH "int smallest = 1;" -> ASSUME {smallest == (1);} GOTO ARG13;
    TRUE -> STOP;

STATE USEFIRST ARG13 :
    MATCH "" -> GOTO ARG15;
    TRUE -> STOP;

STATE USEFIRST ARG15 :
    MATCH "[smallest <= needed]" -> ASSUME {smallest == (1);needed == (2147483647);} GOTO ARG16;
    TRUE -> STOP;

STATE USEFIRST ARG16 :
    MATCH "smallest <<= 1;" -> ASSUME {smallest == (2);} GOTO ARG17;
    TRUE -> STOP;

STATE USEFIRST ARG17 :
    MATCH "" -> GOTO ARG18;
    TRUE -> STOP;

STATE USEFIRST ARG18 :
    MATCH "[smallest <= needed]" -> ASSUME {smallest == (2);needed == (2147483647);} GOTO ARG36;
    TRUE -> STOP;

STATE USEFIRST ARG36 :
    MATCH "smallest <<= 1;" -> ASSUME {smallest == (4);} GOTO ARG37;
    TRUE -> STOP;

STATE USEFIRST ARG37 :
    MATCH "" -> GOTO ARG40;
    TRUE -> STOP;

STATE USEFIRST ARG40 :
    MATCH "[smallest <= needed]" -> ASSUME {smallest == (4);needed == (2147483647);} GOTO ARG45;
    TRUE -> STOP;

STATE USEFIRST ARG45 :
    MATCH "smallest <<= 1;" -> ASSUME {smallest == (8);} GOTO ARG46;
    TRUE -> STOP;

STATE USEFIRST ARG46 :
    MATCH "" -> GOTO ARG47;
    TRUE -> STOP;

STATE USEFIRST ARG47 :
    MATCH "[smallest <= needed]" -> ASSUME {smallest == (8);needed == (2147483647);} GOTO ARG48;
    TRUE -> STOP;

STATE USEFIRST ARG48 :
    MATCH "smallest <<= 1;" -> ASSUME {smallest == (16);} GOTO ARG49;
    TRUE -> STOP;

STATE USEFIRST ARG49 :
    MATCH "" -> GOTO ARG50;
    TRUE -> STOP;

STATE USEFIRST ARG50 :
    MATCH "[smallest <= needed]" -> ASSUME {smallest == (16);needed == (2147483647);} GOTO ARG51;
    TRUE -> STOP;

STATE USEFIRST ARG51 :
    MATCH "smallest <<= 1;" -> ASSUME {smallest == (32);} GOTO ARG52;
    TRUE -> STOP;

STATE USEFIRST ARG52 :
    MATCH "" -> GOTO ARG59;
    TRUE -> STOP;

STATE USEFIRST ARG59 :
    MATCH "[smallest <= needed]" -> ASSUME {smallest == (32);needed == (2147483647);} GOTO ARG61;
    TRUE -> STOP;

STATE USEFIRST ARG61 :
    MATCH "smallest <<= 1;" -> ASSUME {smallest == (64);} GOTO ARG62;
    TRUE -> STOP;

STATE USEFIRST ARG62 :
    MATCH "" -> GOTO ARG63;
    TRUE -> STOP;

STATE USEFIRST ARG63 :
    MATCH "[smallest <= needed]" -> ASSUME {smallest == (64);needed == (2147483647);} GOTO ARG64;
    TRUE -> STOP;

STATE USEFIRST ARG64 :
    MATCH "smallest <<= 1;" -> ASSUME {smallest == (128);} GOTO ARG65;
    TRUE -> STOP;

STATE USEFIRST ARG65 :
    MATCH "" -> GOTO ARG66;
    TRUE -> STOP;

STATE USEFIRST ARG66 :
    MATCH "[smallest <= needed]" -> ASSUME {smallest == (128);needed == (2147483647);} GOTO ARG67;
    TRUE -> STOP;

STATE USEFIRST ARG67 :
    MATCH "smallest <<= 1;" -> ASSUME {smallest == (256);} GOTO ARG68;
    TRUE -> STOP;

STATE USEFIRST ARG68 :
    MATCH "" -> GOTO ARG69;
    TRUE -> STOP;

STATE USEFIRST ARG69 :
    MATCH "[smallest <= needed]" -> ASSUME {smallest == (256);needed == (2147483647);} GOTO ARG70;
    TRUE -> STOP;

STATE USEFIRST ARG70 :
    MATCH "smallest <<= 1;" -> ASSUME {smallest == (512);} GOTO ARG71;
    TRUE -> STOP;

STATE USEFIRST ARG71 :
    MATCH "" -> GOTO ARG72;
    TRUE -> STOP;

STATE USEFIRST ARG72 :
    MATCH "[smallest <= needed]" -> ASSUME {smallest == (512);needed == (2147483647);} GOTO ARG73;
    TRUE -> STOP;

STATE USEFIRST ARG73 :
    MATCH "smallest <<= 1;" -> ASSUME {smallest == (1024);} GOTO ARG74;
    TRUE -> STOP;

STATE USEFIRST ARG74 :
    MATCH "" -> GOTO ARG75;
    TRUE -> STOP;

STATE USEFIRST ARG75 :
    MATCH "[smallest <= needed]" -> ASSUME {smallest == (1024);needed == (2147483647);} GOTO ARG76;
    TRUE -> STOP;

STATE USEFIRST ARG76 :
    MATCH "smallest <<= 1;" -> ASSUME {smallest == (2048);} GOTO ARG77;
    TRUE -> STOP;

STATE USEFIRST ARG77 :
    MATCH "" -> GOTO ARG79;
    TRUE -> STOP;

STATE USEFIRST ARG79 :
    MATCH "[smallest <= needed]" -> ASSUME {smallest == (2048);needed == (2147483647);} GOTO ARG80;
    TRUE -> STOP;

STATE USEFIRST ARG80 :
    MATCH "smallest <<= 1;" -> ASSUME {smallest == (4096);} GOTO ARG81;
    TRUE -> STOP;

STATE USEFIRST ARG81 :
    MATCH "" -> GOTO ARG82;
    TRUE -> STOP;

STATE USEFIRST ARG82 :
    MATCH "[smallest <= needed]" -> ASSUME {smallest == (4096);needed == (2147483647);} GOTO ARG83;
    TRUE -> STOP;

STATE USEFIRST ARG83 :
    MATCH "smallest <<= 1;" -> ASSUME {smallest == (8192);} GOTO ARG84;
    TRUE -> STOP;

STATE USEFIRST ARG84 :
    MATCH "" -> GOTO ARG85;
    TRUE -> STOP;

STATE USEFIRST ARG85 :
    MATCH "[smallest <= needed]" -> ASSUME {smallest == (8192);needed == (2147483647);} GOTO ARG86;
    TRUE -> STOP;

STATE USEFIRST ARG86 :
    MATCH "smallest <<= 1;" -> ASSUME {smallest == (16384);} GOTO ARG87;
    TRUE -> STOP;

STATE USEFIRST ARG87 :
    MATCH "" -> GOTO ARG88;
    TRUE -> STOP;

STATE USEFIRST ARG88 :
    MATCH "[smallest <= needed]" -> ASSUME {smallest == (16384);needed == (2147483647);} GOTO ARG89;
    TRUE -> STOP;

STATE USEFIRST ARG89 :
    MATCH "smallest <<= 1;" -> ASSUME {smallest == (32768);} GOTO ARG90;
    TRUE -> STOP;

STATE USEFIRST ARG90 :
    MATCH "" -> GOTO ARG91;
    TRUE -> STOP;

STATE USEFIRST ARG91 :
    MATCH "[smallest <= needed]" -> ASSUME {smallest == (32768);needed == (2147483647);} GOTO ARG92;
    TRUE -> STOP;

STATE USEFIRST ARG92 :
    MATCH "smallest <<= 1;" -> ASSUME {smallest == (65536);} GOTO ARG93;
    TRUE -> STOP;

STATE USEFIRST ARG93 :
    MATCH "" -> GOTO ARG94;
    TRUE -> STOP;

STATE USEFIRST ARG94 :
    MATCH "[smallest <= needed]" -> ASSUME {smallest == (65536);needed == (2147483647);} GOTO ARG95;
    TRUE -> STOP;

STATE USEFIRST ARG95 :
    MATCH "smallest <<= 1;" -> ASSUME {smallest == (131072);} GOTO ARG96;
    TRUE -> STOP;

STATE USEFIRST ARG96 :
    MATCH "" -> GOTO ARG97;
    TRUE -> STOP;

STATE USEFIRST ARG97 :
    MATCH "[smallest <= needed]" -> ASSUME {smallest == (131072);needed == (2147483647);} GOTO ARG98;
    TRUE -> STOP;

STATE USEFIRST ARG98 :
    MATCH "smallest <<= 1;" -> ASSUME {smallest == (262144);} GOTO ARG99;
    TRUE -> STOP;

STATE USEFIRST ARG99 :
    MATCH "" -> GOTO ARG100;
    TRUE -> STOP;

STATE USEFIRST ARG100 :
    MATCH "[smallest <= needed]" -> ASSUME {smallest == (262144);needed == (2147483647);} GOTO ARG101;
    TRUE -> STOP;

STATE USEFIRST ARG101 :
    MATCH "smallest <<= 1;" -> ASSUME {smallest == (524288);} GOTO ARG102;
    TRUE -> STOP;

STATE USEFIRST ARG102 :
    MATCH "" -> GOTO ARG103;
    TRUE -> STOP;

STATE USEFIRST ARG103 :
    MATCH "[smallest <= needed]" -> ASSUME {smallest == (524288);needed == (2147483647);} GOTO ARG104;
    TRUE -> STOP;

STATE USEFIRST ARG104 :
    MATCH "smallest <<= 1;" -> ASSUME {smallest == (1048576);} GOTO ARG105;
    TRUE -> STOP;

STATE USEFIRST ARG105 :
    MATCH "" -> GOTO ARG106;
    TRUE -> STOP;

STATE USEFIRST ARG106 :
    MATCH "[smallest <= needed]" -> ASSUME {smallest == (1048576);needed == (2147483647);} GOTO ARG107;
    TRUE -> STOP;

STATE USEFIRST ARG107 :
    MATCH "smallest <<= 1;" -> ASSUME {smallest == (2097152);} GOTO ARG108;
    TRUE -> STOP;

STATE USEFIRST ARG108 :
    MATCH "" -> GOTO ARG109;
    TRUE -> STOP;

STATE USEFIRST ARG109 :
    MATCH "[smallest <= needed]" -> ASSUME {smallest == (2097152);needed == (2147483647);} GOTO ARG110;
    TRUE -> STOP;

STATE USEFIRST ARG110 :
    MATCH "smallest <<= 1;" -> ASSUME {smallest == (4194304);} GOTO ARG111;
    TRUE -> STOP;

STATE USEFIRST ARG111 :
    MATCH "" -> GOTO ARG112;
    TRUE -> STOP;

STATE USEFIRST ARG112 :
    MATCH "[smallest <= needed]" -> ASSUME {smallest == (4194304);needed == (2147483647);} GOTO ARG113;
    TRUE -> STOP;

STATE USEFIRST ARG113 :
    MATCH "smallest <<= 1;" -> ASSUME {smallest == (8388608);} GOTO ARG114;
    TRUE -> STOP;

STATE USEFIRST ARG114 :
    MATCH "" -> GOTO ARG115;
    TRUE -> STOP;

STATE USEFIRST ARG115 :
    MATCH "[smallest <= needed]" -> ASSUME {smallest == (8388608);needed == (2147483647);} GOTO ARG116;
    TRUE -> STOP;

STATE USEFIRST ARG116 :
    MATCH "smallest <<= 1;" -> ASSUME {smallest == (16777216);} GOTO ARG117;
    TRUE -> STOP;

STATE USEFIRST ARG117 :
    MATCH "" -> GOTO ARG118;
    TRUE -> STOP;

STATE USEFIRST ARG118 :
    MATCH "[smallest <= needed]" -> ASSUME {smallest == (16777216);needed == (2147483647);} GOTO ARG119;
    TRUE -> STOP;

STATE USEFIRST ARG119 :
    MATCH "smallest <<= 1;" -> ASSUME {smallest == (33554432);} GOTO ARG120;
    TRUE -> STOP;

STATE USEFIRST ARG120 :
    MATCH "" -> GOTO ARG121;
    TRUE -> STOP;

STATE USEFIRST ARG121 :
    MATCH "[smallest <= needed]" -> ASSUME {smallest == (33554432);needed == (2147483647);} GOTO ARG122;
    TRUE -> STOP;

STATE USEFIRST ARG122 :
    MATCH "smallest <<= 1;" -> ASSUME {smallest == (67108864);} GOTO ARG123;
    TRUE -> STOP;

STATE USEFIRST ARG123 :
    MATCH "" -> GOTO ARG124;
    TRUE -> STOP;

STATE USEFIRST ARG124 :
    MATCH "[smallest <= needed]" -> ASSUME {smallest == (67108864);needed == (2147483647);} GOTO ARG125;
    TRUE -> STOP;

STATE USEFIRST ARG125 :
    MATCH "smallest <<= 1;" -> ASSUME {smallest == (134217728);} GOTO ARG126;
    TRUE -> STOP;

STATE USEFIRST ARG126 :
    MATCH "" -> GOTO ARG127;
    TRUE -> STOP;

STATE USEFIRST ARG127 :
    MATCH "[smallest <= needed]" -> ASSUME {smallest == (134217728);needed == (2147483647);} GOTO ARG128;
    TRUE -> STOP;

STATE USEFIRST ARG128 :
    MATCH "smallest <<= 1;" -> ASSUME {smallest == (268435456);} GOTO ARG129;
    TRUE -> STOP;

STATE USEFIRST ARG129 :
    MATCH "" -> GOTO ARG130;
    TRUE -> STOP;

STATE USEFIRST ARG130 :
    MATCH "[smallest <= needed]" -> ASSUME {smallest == (268435456);needed == (2147483647);} GOTO ARG131;
    TRUE -> STOP;

STATE USEFIRST ARG131 :
    MATCH "smallest <<= 1;" -> ASSUME {smallest == (536870912);} GOTO ARG132;
    TRUE -> STOP;

STATE USEFIRST ARG132 :
    MATCH "" -> GOTO ARG133;
    TRUE -> STOP;

STATE USEFIRST ARG133 :
    MATCH "[smallest <= needed]" -> ASSUME {smallest == (536870912);needed == (2147483647);} GOTO ARG134;
    TRUE -> STOP;

STATE USEFIRST ARG134 :
    MATCH "smallest <<= 1;" -> ASSUME {smallest == (1073741824);} GOTO ARG135;
    TRUE -> STOP;

STATE USEFIRST ARG135 :
    MATCH "" -> GOTO ARG136;
    TRUE -> STOP;

STATE USEFIRST ARG136 :
    MATCH "[smallest <= needed]" -> ASSUME {smallest == (1073741824);needed == (2147483647);} GOTO ARG137;
    TRUE -> STOP;

STATE USEFIRST ARG137 :
    MATCH "smallest <<= 1;" -> ASSUME {smallest == (-2147483648);} GOTO ARG138;
    TRUE -> STOP;

STATE USEFIRST ARG138 :
    MATCH "" -> GOTO ARG139;
    TRUE -> STOP;

STATE USEFIRST ARG139 :
    MATCH "[smallest <= needed]" -> ASSUME {smallest == (-2147483648);needed == (2147483647);} GOTO ARG140;
    TRUE -> STOP;

STATE USEFIRST ARG140 :
    MATCH "smallest <<= 1;" -> ASSUME {smallest == (0);} GOTO ARG141;
    TRUE -> STOP;

STATE USEFIRST ARG141 :
    MATCH "" -> GOTO ARG142;
    TRUE -> STOP;

STATE USEFIRST ARG142 :
    MATCH "[smallest <= needed]" -> ASSUME {smallest == (0);needed == (2147483647);} GOTO ARG143;
    TRUE -> STOP;

STATE USEFIRST ARG143 :
    MATCH "smallest <<= 1;" -> ASSUME {smallest == (0);} GOTO ARG144;
    TRUE -> STOP;

STATE USEFIRST ARG144 :
    MATCH "" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG145 :
    TRUE -> STOP;

END AUTOMATON
