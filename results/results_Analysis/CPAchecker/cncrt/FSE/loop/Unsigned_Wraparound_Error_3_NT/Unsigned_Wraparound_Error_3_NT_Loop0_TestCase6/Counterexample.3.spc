CONTROL AUTOMATON ErrorPath3

INITIAL STATE ARG0;

STATE USEFIRST ARG0 :
    MATCH "" -> GOTO ARG3;
    TRUE -> STOP;

STATE USEFIRST ARG3 :
    MATCH "extern unsigned int __VERIFIER_nondet_uint(void);" -> GOTO ARG4;
    TRUE -> STOP;

STATE USEFIRST ARG4 :
    MATCH "int main()" -> GOTO ARG5;
    TRUE -> STOP;

STATE USEFIRST ARG5 :
    MATCH "" -> GOTO ARG6;
    TRUE -> STOP;

STATE USEFIRST ARG6 :
    MATCH "unsigned int pathlen = 10;" -> ASSUME {pathlen == (10U);} GOTO ARG11;
    TRUE -> STOP;

STATE USEFIRST ARG11 :
    MATCH "unsigned int newbufsize = 8;" -> ASSUME {newbufsize == (8U);} GOTO ARG16;
    TRUE -> STOP;

STATE USEFIRST ARG16 :
    MATCH "unsigned int len = 4294967280;" -> ASSUME {len == (4294967280U);} GOTO ARG17;
    TRUE -> STOP;

STATE USEFIRST ARG17 :
    MATCH "[!(newbufsize == 0)]" -> ASSUME {newbufsize == (8U);} GOTO ARG22;
    TRUE -> STOP;

STATE USEFIRST ARG22 :
    MATCH "[!(newbufsize + len + 1 == 0xffffffff)]" -> GOTO ARG25;
    TRUE -> STOP;

STATE USEFIRST ARG25 :
    MATCH "" -> GOTO ARG26;
    TRUE -> STOP;

STATE USEFIRST ARG26 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (8U);} GOTO ARG27;
    TRUE -> STOP;

STATE USEFIRST ARG27 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (16U);} GOTO ARG28;
    TRUE -> STOP;

STATE USEFIRST ARG28 :
    MATCH "" -> GOTO ARG29;
    TRUE -> STOP;

STATE USEFIRST ARG29 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (16U);} GOTO ARG45;
    TRUE -> STOP;

STATE USEFIRST ARG45 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (32U);} GOTO ARG48;
    TRUE -> STOP;

STATE USEFIRST ARG48 :
    MATCH "" -> GOTO ARG53;
    TRUE -> STOP;

STATE USEFIRST ARG53 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (32U);} GOTO ARG56;
    TRUE -> STOP;

STATE USEFIRST ARG56 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (64U);} GOTO ARG57;
    TRUE -> STOP;

STATE USEFIRST ARG57 :
    MATCH "" -> GOTO ARG58;
    TRUE -> STOP;

STATE USEFIRST ARG58 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (64U);} GOTO ARG59;
    TRUE -> STOP;

STATE USEFIRST ARG59 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (128U);} GOTO ARG60;
    TRUE -> STOP;

STATE USEFIRST ARG60 :
    MATCH "" -> GOTO ARG61;
    TRUE -> STOP;

STATE USEFIRST ARG61 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (128U);} GOTO ARG68;
    TRUE -> STOP;

STATE USEFIRST ARG68 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (256U);} GOTO ARG70;
    TRUE -> STOP;

STATE USEFIRST ARG70 :
    MATCH "" -> GOTO ARG71;
    TRUE -> STOP;

STATE USEFIRST ARG71 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (256U);} GOTO ARG72;
    TRUE -> STOP;

STATE USEFIRST ARG72 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (512U);} GOTO ARG73;
    TRUE -> STOP;

STATE USEFIRST ARG73 :
    MATCH "" -> GOTO ARG74;
    TRUE -> STOP;

STATE USEFIRST ARG74 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (512U);} GOTO ARG75;
    TRUE -> STOP;

STATE USEFIRST ARG75 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (1024U);} GOTO ARG76;
    TRUE -> STOP;

STATE USEFIRST ARG76 :
    MATCH "" -> GOTO ARG77;
    TRUE -> STOP;

STATE USEFIRST ARG77 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (1024U);} GOTO ARG78;
    TRUE -> STOP;

STATE USEFIRST ARG78 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (2048U);} GOTO ARG79;
    TRUE -> STOP;

STATE USEFIRST ARG79 :
    MATCH "" -> GOTO ARG80;
    TRUE -> STOP;

STATE USEFIRST ARG80 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (2048U);} GOTO ARG81;
    TRUE -> STOP;

STATE USEFIRST ARG81 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (4096U);} GOTO ARG82;
    TRUE -> STOP;

STATE USEFIRST ARG82 :
    MATCH "" -> GOTO ARG83;
    TRUE -> STOP;

STATE USEFIRST ARG83 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (4096U);} GOTO ARG84;
    TRUE -> STOP;

STATE USEFIRST ARG84 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (8192U);} GOTO ARG86;
    TRUE -> STOP;

STATE USEFIRST ARG86 :
    MATCH "" -> GOTO ARG87;
    TRUE -> STOP;

STATE USEFIRST ARG87 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (8192U);} GOTO ARG88;
    TRUE -> STOP;

STATE USEFIRST ARG88 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (16384U);} GOTO ARG89;
    TRUE -> STOP;

STATE USEFIRST ARG89 :
    MATCH "" -> GOTO ARG90;
    TRUE -> STOP;

STATE USEFIRST ARG90 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (16384U);} GOTO ARG91;
    TRUE -> STOP;

STATE USEFIRST ARG91 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (32768U);} GOTO ARG92;
    TRUE -> STOP;

STATE USEFIRST ARG92 :
    MATCH "" -> GOTO ARG93;
    TRUE -> STOP;

STATE USEFIRST ARG93 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (32768U);} GOTO ARG94;
    TRUE -> STOP;

STATE USEFIRST ARG94 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (65536U);} GOTO ARG95;
    TRUE -> STOP;

STATE USEFIRST ARG95 :
    MATCH "" -> GOTO ARG96;
    TRUE -> STOP;

STATE USEFIRST ARG96 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (65536U);} GOTO ARG97;
    TRUE -> STOP;

STATE USEFIRST ARG97 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (131072U);} GOTO ARG98;
    TRUE -> STOP;

STATE USEFIRST ARG98 :
    MATCH "" -> GOTO ARG99;
    TRUE -> STOP;

STATE USEFIRST ARG99 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (131072U);} GOTO ARG100;
    TRUE -> STOP;

STATE USEFIRST ARG100 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (262144U);} GOTO ARG101;
    TRUE -> STOP;

STATE USEFIRST ARG101 :
    MATCH "" -> GOTO ARG102;
    TRUE -> STOP;

STATE USEFIRST ARG102 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (262144U);} GOTO ARG103;
    TRUE -> STOP;

STATE USEFIRST ARG103 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (524288U);} GOTO ARG104;
    TRUE -> STOP;

STATE USEFIRST ARG104 :
    MATCH "" -> GOTO ARG105;
    TRUE -> STOP;

STATE USEFIRST ARG105 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (524288U);} GOTO ARG106;
    TRUE -> STOP;

STATE USEFIRST ARG106 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (1048576U);} GOTO ARG107;
    TRUE -> STOP;

STATE USEFIRST ARG107 :
    MATCH "" -> GOTO ARG108;
    TRUE -> STOP;

STATE USEFIRST ARG108 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (1048576U);} GOTO ARG109;
    TRUE -> STOP;

STATE USEFIRST ARG109 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (2097152U);} GOTO ARG110;
    TRUE -> STOP;

STATE USEFIRST ARG110 :
    MATCH "" -> GOTO ARG111;
    TRUE -> STOP;

STATE USEFIRST ARG111 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (2097152U);} GOTO ARG112;
    TRUE -> STOP;

STATE USEFIRST ARG112 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (4194304U);} GOTO ARG113;
    TRUE -> STOP;

STATE USEFIRST ARG113 :
    MATCH "" -> GOTO ARG114;
    TRUE -> STOP;

STATE USEFIRST ARG114 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (4194304U);} GOTO ARG115;
    TRUE -> STOP;

STATE USEFIRST ARG115 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (8388608U);} GOTO ARG116;
    TRUE -> STOP;

STATE USEFIRST ARG116 :
    MATCH "" -> GOTO ARG117;
    TRUE -> STOP;

STATE USEFIRST ARG117 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (8388608U);} GOTO ARG118;
    TRUE -> STOP;

STATE USEFIRST ARG118 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (16777216U);} GOTO ARG119;
    TRUE -> STOP;

STATE USEFIRST ARG119 :
    MATCH "" -> GOTO ARG120;
    TRUE -> STOP;

STATE USEFIRST ARG120 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (16777216U);} GOTO ARG121;
    TRUE -> STOP;

STATE USEFIRST ARG121 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (33554432U);} GOTO ARG122;
    TRUE -> STOP;

STATE USEFIRST ARG122 :
    MATCH "" -> GOTO ARG123;
    TRUE -> STOP;

STATE USEFIRST ARG123 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (33554432U);} GOTO ARG124;
    TRUE -> STOP;

STATE USEFIRST ARG124 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (67108864U);} GOTO ARG125;
    TRUE -> STOP;

STATE USEFIRST ARG125 :
    MATCH "" -> GOTO ARG126;
    TRUE -> STOP;

STATE USEFIRST ARG126 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (67108864U);} GOTO ARG127;
    TRUE -> STOP;

STATE USEFIRST ARG127 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (134217728U);} GOTO ARG128;
    TRUE -> STOP;

STATE USEFIRST ARG128 :
    MATCH "" -> GOTO ARG129;
    TRUE -> STOP;

STATE USEFIRST ARG129 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (134217728U);} GOTO ARG130;
    TRUE -> STOP;

STATE USEFIRST ARG130 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (268435456U);} GOTO ARG131;
    TRUE -> STOP;

STATE USEFIRST ARG131 :
    MATCH "" -> GOTO ARG132;
    TRUE -> STOP;

STATE USEFIRST ARG132 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (268435456U);} GOTO ARG133;
    TRUE -> STOP;

STATE USEFIRST ARG133 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (536870912U);} GOTO ARG134;
    TRUE -> STOP;

STATE USEFIRST ARG134 :
    MATCH "" -> GOTO ARG135;
    TRUE -> STOP;

STATE USEFIRST ARG135 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (536870912U);} GOTO ARG136;
    TRUE -> STOP;

STATE USEFIRST ARG136 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (1073741824U);} GOTO ARG137;
    TRUE -> STOP;

STATE USEFIRST ARG137 :
    MATCH "" -> GOTO ARG138;
    TRUE -> STOP;

STATE USEFIRST ARG138 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (1073741824U);} GOTO ARG139;
    TRUE -> STOP;

STATE USEFIRST ARG139 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (2147483648U);} GOTO ARG140;
    TRUE -> STOP;

STATE USEFIRST ARG140 :
    MATCH "" -> GOTO ARG141;
    TRUE -> STOP;

STATE USEFIRST ARG141 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (2147483648U);} GOTO ARG142;
    TRUE -> STOP;

STATE USEFIRST ARG142 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (0U);} GOTO ARG143;
    TRUE -> STOP;

STATE USEFIRST ARG143 :
    MATCH "" -> GOTO ARG144;
    TRUE -> STOP;

STATE USEFIRST ARG144 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (0U);} GOTO ARG145;
    TRUE -> STOP;

STATE USEFIRST ARG145 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (0U);} GOTO ARG146;
    TRUE -> STOP;

STATE USEFIRST ARG146 :
    MATCH "" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG147 :
    TRUE -> STOP;

END AUTOMATON
