CONTROL AUTOMATON ErrorPath4

INITIAL STATE ARG0;

STATE USEFIRST ARG0 :
    MATCH "" -> GOTO ARG3;
    TRUE -> STOP;

STATE USEFIRST ARG3 :
    MATCH "extern unsigned int __VERIFIER_nondet_uint(void);" -> GOTO ARG4;
    TRUE -> STOP;

STATE USEFIRST ARG4 :
    MATCH "void main(void)" -> GOTO ARG5;
    TRUE -> STOP;

STATE USEFIRST ARG5 :
    MATCH "" -> GOTO ARG7;
    TRUE -> STOP;

STATE USEFIRST ARG7 :
    MATCH "int __retres;" -> GOTO ARG9;
    TRUE -> STOP;

STATE USEFIRST ARG9 :
    MATCH "unsigned int pathlen = 4294967295;" -> ASSUME {pathlen == (4294967295U);} GOTO ARG12;
    TRUE -> STOP;

STATE USEFIRST ARG12 :
    MATCH "unsigned int newbufsize = 1;" -> ASSUME {newbufsize == (1U);} GOTO ARG13;
    TRUE -> STOP;

STATE USEFIRST ARG13 :
    MATCH "unsigned int len = 3000000000;" -> ASSUME {len == (3000000000U);} GOTO ARG18;
    TRUE -> STOP;

STATE USEFIRST ARG18 :
    MATCH "[!(newbufsize == (unsigned int)0)]" -> ASSUME {newbufsize == (1U);} GOTO ARG21;
    TRUE -> STOP;

STATE USEFIRST ARG21 :
    MATCH "[!((newbufsize + len) + (unsigned int)1 == 0xffffffff)]" -> GOTO ARG24;
    TRUE -> STOP;

STATE USEFIRST ARG24 :
    MATCH "" -> GOTO ARG27;
    TRUE -> STOP;

STATE USEFIRST ARG27 :
    MATCH "[newbufsize < (pathlen + len) + (unsigned int)1]" -> ASSUME {newbufsize == (1U);} GOTO ARG28;
    TRUE -> STOP;

STATE USEFIRST ARG28 :
    MATCH "newbufsize *= (unsigned int)2;" -> ASSUME {newbufsize == (2U);} GOTO ARG29;
    TRUE -> STOP;

STATE USEFIRST ARG29 :
    MATCH "" -> GOTO ARG30;
    TRUE -> STOP;

STATE USEFIRST ARG30 :
    MATCH "[newbufsize < (pathlen + len) + (unsigned int)1]" -> ASSUME {newbufsize == (2U);} GOTO ARG48;
    TRUE -> STOP;

STATE USEFIRST ARG48 :
    MATCH "newbufsize *= (unsigned int)2;" -> ASSUME {newbufsize == (4U);} GOTO ARG51;
    TRUE -> STOP;

STATE USEFIRST ARG51 :
    MATCH "" -> GOTO ARG56;
    TRUE -> STOP;

STATE USEFIRST ARG56 :
    MATCH "[newbufsize < (pathlen + len) + (unsigned int)1]" -> ASSUME {newbufsize == (4U);} GOTO ARG57;
    TRUE -> STOP;

STATE USEFIRST ARG57 :
    MATCH "newbufsize *= (unsigned int)2;" -> ASSUME {newbufsize == (8U);} GOTO ARG58;
    TRUE -> STOP;

STATE USEFIRST ARG58 :
    MATCH "" -> GOTO ARG59;
    TRUE -> STOP;

STATE USEFIRST ARG59 :
    MATCH "[newbufsize < (pathlen + len) + (unsigned int)1]" -> ASSUME {newbufsize == (8U);} GOTO ARG60;
    TRUE -> STOP;

STATE USEFIRST ARG60 :
    MATCH "newbufsize *= (unsigned int)2;" -> ASSUME {newbufsize == (16U);} GOTO ARG61;
    TRUE -> STOP;

STATE USEFIRST ARG61 :
    MATCH "" -> GOTO ARG62;
    TRUE -> STOP;

STATE USEFIRST ARG62 :
    MATCH "[newbufsize < (pathlen + len) + (unsigned int)1]" -> ASSUME {newbufsize == (16U);} GOTO ARG65;
    TRUE -> STOP;

STATE USEFIRST ARG65 :
    MATCH "newbufsize *= (unsigned int)2;" -> ASSUME {newbufsize == (32U);} GOTO ARG71;
    TRUE -> STOP;

STATE USEFIRST ARG71 :
    MATCH "" -> GOTO ARG72;
    TRUE -> STOP;

STATE USEFIRST ARG72 :
    MATCH "[newbufsize < (pathlen + len) + (unsigned int)1]" -> ASSUME {newbufsize == (32U);} GOTO ARG73;
    TRUE -> STOP;

STATE USEFIRST ARG73 :
    MATCH "newbufsize *= (unsigned int)2;" -> ASSUME {newbufsize == (64U);} GOTO ARG74;
    TRUE -> STOP;

STATE USEFIRST ARG74 :
    MATCH "" -> GOTO ARG75;
    TRUE -> STOP;

STATE USEFIRST ARG75 :
    MATCH "[newbufsize < (pathlen + len) + (unsigned int)1]" -> ASSUME {newbufsize == (64U);} GOTO ARG76;
    TRUE -> STOP;

STATE USEFIRST ARG76 :
    MATCH "newbufsize *= (unsigned int)2;" -> ASSUME {newbufsize == (128U);} GOTO ARG77;
    TRUE -> STOP;

STATE USEFIRST ARG77 :
    MATCH "" -> GOTO ARG78;
    TRUE -> STOP;

STATE USEFIRST ARG78 :
    MATCH "[newbufsize < (pathlen + len) + (unsigned int)1]" -> ASSUME {newbufsize == (128U);} GOTO ARG79;
    TRUE -> STOP;

STATE USEFIRST ARG79 :
    MATCH "newbufsize *= (unsigned int)2;" -> ASSUME {newbufsize == (256U);} GOTO ARG80;
    TRUE -> STOP;

STATE USEFIRST ARG80 :
    MATCH "" -> GOTO ARG81;
    TRUE -> STOP;

STATE USEFIRST ARG81 :
    MATCH "[newbufsize < (pathlen + len) + (unsigned int)1]" -> ASSUME {newbufsize == (256U);} GOTO ARG82;
    TRUE -> STOP;

STATE USEFIRST ARG82 :
    MATCH "newbufsize *= (unsigned int)2;" -> ASSUME {newbufsize == (512U);} GOTO ARG83;
    TRUE -> STOP;

STATE USEFIRST ARG83 :
    MATCH "" -> GOTO ARG84;
    TRUE -> STOP;

STATE USEFIRST ARG84 :
    MATCH "[newbufsize < (pathlen + len) + (unsigned int)1]" -> ASSUME {newbufsize == (512U);} GOTO ARG85;
    TRUE -> STOP;

STATE USEFIRST ARG85 :
    MATCH "newbufsize *= (unsigned int)2;" -> ASSUME {newbufsize == (1024U);} GOTO ARG86;
    TRUE -> STOP;

STATE USEFIRST ARG86 :
    MATCH "" -> GOTO ARG87;
    TRUE -> STOP;

STATE USEFIRST ARG87 :
    MATCH "[newbufsize < (pathlen + len) + (unsigned int)1]" -> ASSUME {newbufsize == (1024U);} GOTO ARG89;
    TRUE -> STOP;

STATE USEFIRST ARG89 :
    MATCH "newbufsize *= (unsigned int)2;" -> ASSUME {newbufsize == (2048U);} GOTO ARG90;
    TRUE -> STOP;

STATE USEFIRST ARG90 :
    MATCH "" -> GOTO ARG91;
    TRUE -> STOP;

STATE USEFIRST ARG91 :
    MATCH "[newbufsize < (pathlen + len) + (unsigned int)1]" -> ASSUME {newbufsize == (2048U);} GOTO ARG92;
    TRUE -> STOP;

STATE USEFIRST ARG92 :
    MATCH "newbufsize *= (unsigned int)2;" -> ASSUME {newbufsize == (4096U);} GOTO ARG93;
    TRUE -> STOP;

STATE USEFIRST ARG93 :
    MATCH "" -> GOTO ARG94;
    TRUE -> STOP;

STATE USEFIRST ARG94 :
    MATCH "[newbufsize < (pathlen + len) + (unsigned int)1]" -> ASSUME {newbufsize == (4096U);} GOTO ARG95;
    TRUE -> STOP;

STATE USEFIRST ARG95 :
    MATCH "newbufsize *= (unsigned int)2;" -> ASSUME {newbufsize == (8192U);} GOTO ARG96;
    TRUE -> STOP;

STATE USEFIRST ARG96 :
    MATCH "" -> GOTO ARG97;
    TRUE -> STOP;

STATE USEFIRST ARG97 :
    MATCH "[newbufsize < (pathlen + len) + (unsigned int)1]" -> ASSUME {newbufsize == (8192U);} GOTO ARG98;
    TRUE -> STOP;

STATE USEFIRST ARG98 :
    MATCH "newbufsize *= (unsigned int)2;" -> ASSUME {newbufsize == (16384U);} GOTO ARG99;
    TRUE -> STOP;

STATE USEFIRST ARG99 :
    MATCH "" -> GOTO ARG100;
    TRUE -> STOP;

STATE USEFIRST ARG100 :
    MATCH "[newbufsize < (pathlen + len) + (unsigned int)1]" -> ASSUME {newbufsize == (16384U);} GOTO ARG101;
    TRUE -> STOP;

STATE USEFIRST ARG101 :
    MATCH "newbufsize *= (unsigned int)2;" -> ASSUME {newbufsize == (32768U);} GOTO ARG102;
    TRUE -> STOP;

STATE USEFIRST ARG102 :
    MATCH "" -> GOTO ARG103;
    TRUE -> STOP;

STATE USEFIRST ARG103 :
    MATCH "[newbufsize < (pathlen + len) + (unsigned int)1]" -> ASSUME {newbufsize == (32768U);} GOTO ARG104;
    TRUE -> STOP;

STATE USEFIRST ARG104 :
    MATCH "newbufsize *= (unsigned int)2;" -> ASSUME {newbufsize == (65536U);} GOTO ARG105;
    TRUE -> STOP;

STATE USEFIRST ARG105 :
    MATCH "" -> GOTO ARG106;
    TRUE -> STOP;

STATE USEFIRST ARG106 :
    MATCH "[newbufsize < (pathlen + len) + (unsigned int)1]" -> ASSUME {newbufsize == (65536U);} GOTO ARG107;
    TRUE -> STOP;

STATE USEFIRST ARG107 :
    MATCH "newbufsize *= (unsigned int)2;" -> ASSUME {newbufsize == (131072U);} GOTO ARG108;
    TRUE -> STOP;

STATE USEFIRST ARG108 :
    MATCH "" -> GOTO ARG109;
    TRUE -> STOP;

STATE USEFIRST ARG109 :
    MATCH "[newbufsize < (pathlen + len) + (unsigned int)1]" -> ASSUME {newbufsize == (131072U);} GOTO ARG110;
    TRUE -> STOP;

STATE USEFIRST ARG110 :
    MATCH "newbufsize *= (unsigned int)2;" -> ASSUME {newbufsize == (262144U);} GOTO ARG111;
    TRUE -> STOP;

STATE USEFIRST ARG111 :
    MATCH "" -> GOTO ARG112;
    TRUE -> STOP;

STATE USEFIRST ARG112 :
    MATCH "[newbufsize < (pathlen + len) + (unsigned int)1]" -> ASSUME {newbufsize == (262144U);} GOTO ARG113;
    TRUE -> STOP;

STATE USEFIRST ARG113 :
    MATCH "newbufsize *= (unsigned int)2;" -> ASSUME {newbufsize == (524288U);} GOTO ARG114;
    TRUE -> STOP;

STATE USEFIRST ARG114 :
    MATCH "" -> GOTO ARG115;
    TRUE -> STOP;

STATE USEFIRST ARG115 :
    MATCH "[newbufsize < (pathlen + len) + (unsigned int)1]" -> ASSUME {newbufsize == (524288U);} GOTO ARG116;
    TRUE -> STOP;

STATE USEFIRST ARG116 :
    MATCH "newbufsize *= (unsigned int)2;" -> ASSUME {newbufsize == (1048576U);} GOTO ARG117;
    TRUE -> STOP;

STATE USEFIRST ARG117 :
    MATCH "" -> GOTO ARG118;
    TRUE -> STOP;

STATE USEFIRST ARG118 :
    MATCH "[newbufsize < (pathlen + len) + (unsigned int)1]" -> ASSUME {newbufsize == (1048576U);} GOTO ARG119;
    TRUE -> STOP;

STATE USEFIRST ARG119 :
    MATCH "newbufsize *= (unsigned int)2;" -> ASSUME {newbufsize == (2097152U);} GOTO ARG120;
    TRUE -> STOP;

STATE USEFIRST ARG120 :
    MATCH "" -> GOTO ARG121;
    TRUE -> STOP;

STATE USEFIRST ARG121 :
    MATCH "[newbufsize < (pathlen + len) + (unsigned int)1]" -> ASSUME {newbufsize == (2097152U);} GOTO ARG122;
    TRUE -> STOP;

STATE USEFIRST ARG122 :
    MATCH "newbufsize *= (unsigned int)2;" -> ASSUME {newbufsize == (4194304U);} GOTO ARG123;
    TRUE -> STOP;

STATE USEFIRST ARG123 :
    MATCH "" -> GOTO ARG124;
    TRUE -> STOP;

STATE USEFIRST ARG124 :
    MATCH "[newbufsize < (pathlen + len) + (unsigned int)1]" -> ASSUME {newbufsize == (4194304U);} GOTO ARG125;
    TRUE -> STOP;

STATE USEFIRST ARG125 :
    MATCH "newbufsize *= (unsigned int)2;" -> ASSUME {newbufsize == (8388608U);} GOTO ARG126;
    TRUE -> STOP;

STATE USEFIRST ARG126 :
    MATCH "" -> GOTO ARG127;
    TRUE -> STOP;

STATE USEFIRST ARG127 :
    MATCH "[newbufsize < (pathlen + len) + (unsigned int)1]" -> ASSUME {newbufsize == (8388608U);} GOTO ARG128;
    TRUE -> STOP;

STATE USEFIRST ARG128 :
    MATCH "newbufsize *= (unsigned int)2;" -> ASSUME {newbufsize == (16777216U);} GOTO ARG129;
    TRUE -> STOP;

STATE USEFIRST ARG129 :
    MATCH "" -> GOTO ARG130;
    TRUE -> STOP;

STATE USEFIRST ARG130 :
    MATCH "[newbufsize < (pathlen + len) + (unsigned int)1]" -> ASSUME {newbufsize == (16777216U);} GOTO ARG131;
    TRUE -> STOP;

STATE USEFIRST ARG131 :
    MATCH "newbufsize *= (unsigned int)2;" -> ASSUME {newbufsize == (33554432U);} GOTO ARG132;
    TRUE -> STOP;

STATE USEFIRST ARG132 :
    MATCH "" -> GOTO ARG133;
    TRUE -> STOP;

STATE USEFIRST ARG133 :
    MATCH "[newbufsize < (pathlen + len) + (unsigned int)1]" -> ASSUME {newbufsize == (33554432U);} GOTO ARG134;
    TRUE -> STOP;

STATE USEFIRST ARG134 :
    MATCH "newbufsize *= (unsigned int)2;" -> ASSUME {newbufsize == (67108864U);} GOTO ARG135;
    TRUE -> STOP;

STATE USEFIRST ARG135 :
    MATCH "" -> GOTO ARG136;
    TRUE -> STOP;

STATE USEFIRST ARG136 :
    MATCH "[newbufsize < (pathlen + len) + (unsigned int)1]" -> ASSUME {newbufsize == (67108864U);} GOTO ARG137;
    TRUE -> STOP;

STATE USEFIRST ARG137 :
    MATCH "newbufsize *= (unsigned int)2;" -> ASSUME {newbufsize == (134217728U);} GOTO ARG138;
    TRUE -> STOP;

STATE USEFIRST ARG138 :
    MATCH "" -> GOTO ARG139;
    TRUE -> STOP;

STATE USEFIRST ARG139 :
    MATCH "[newbufsize < (pathlen + len) + (unsigned int)1]" -> ASSUME {newbufsize == (134217728U);} GOTO ARG140;
    TRUE -> STOP;

STATE USEFIRST ARG140 :
    MATCH "newbufsize *= (unsigned int)2;" -> ASSUME {newbufsize == (268435456U);} GOTO ARG141;
    TRUE -> STOP;

STATE USEFIRST ARG141 :
    MATCH "" -> GOTO ARG142;
    TRUE -> STOP;

STATE USEFIRST ARG142 :
    MATCH "[newbufsize < (pathlen + len) + (unsigned int)1]" -> ASSUME {newbufsize == (268435456U);} GOTO ARG143;
    TRUE -> STOP;

STATE USEFIRST ARG143 :
    MATCH "newbufsize *= (unsigned int)2;" -> ASSUME {newbufsize == (536870912U);} GOTO ARG144;
    TRUE -> STOP;

STATE USEFIRST ARG144 :
    MATCH "" -> GOTO ARG145;
    TRUE -> STOP;

STATE USEFIRST ARG145 :
    MATCH "[newbufsize < (pathlen + len) + (unsigned int)1]" -> ASSUME {newbufsize == (536870912U);} GOTO ARG146;
    TRUE -> STOP;

STATE USEFIRST ARG146 :
    MATCH "newbufsize *= (unsigned int)2;" -> ASSUME {newbufsize == (1073741824U);} GOTO ARG147;
    TRUE -> STOP;

STATE USEFIRST ARG147 :
    MATCH "" -> GOTO ARG148;
    TRUE -> STOP;

STATE USEFIRST ARG148 :
    MATCH "[newbufsize < (pathlen + len) + (unsigned int)1]" -> ASSUME {newbufsize == (1073741824U);} GOTO ARG149;
    TRUE -> STOP;

STATE USEFIRST ARG149 :
    MATCH "newbufsize *= (unsigned int)2;" -> ASSUME {newbufsize == (2147483648U);} GOTO ARG150;
    TRUE -> STOP;

STATE USEFIRST ARG150 :
    MATCH "" -> GOTO ARG151;
    TRUE -> STOP;

STATE USEFIRST ARG151 :
    MATCH "[newbufsize < (pathlen + len) + (unsigned int)1]" -> ASSUME {newbufsize == (2147483648U);} GOTO ARG152;
    TRUE -> STOP;

STATE USEFIRST ARG152 :
    MATCH "newbufsize *= (unsigned int)2;" -> ASSUME {newbufsize == (0U);} GOTO ARG153;
    TRUE -> STOP;

STATE USEFIRST ARG153 :
    MATCH "" -> GOTO ARG154;
    TRUE -> STOP;

STATE USEFIRST ARG154 :
    MATCH "[newbufsize < (pathlen + len) + (unsigned int)1]" -> ASSUME {newbufsize == (0U);} GOTO ARG155;
    TRUE -> STOP;

STATE USEFIRST ARG155 :
    MATCH "newbufsize *= (unsigned int)2;" -> ASSUME {newbufsize == (0U);} GOTO ARG156;
    TRUE -> STOP;

STATE USEFIRST ARG156 :
    MATCH "" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG157 :
    TRUE -> STOP;

END AUTOMATON
