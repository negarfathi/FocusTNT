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
    MATCH "unsigned int pathlen = 4294967200;" -> ASSUME {pathlen == (4294967200U);} GOTO ARG11;
    TRUE -> STOP;

STATE USEFIRST ARG11 :
    MATCH "unsigned int newbufsize = 95;" -> ASSUME {newbufsize == (95U);} GOTO ARG16;
    TRUE -> STOP;

STATE USEFIRST ARG16 :
    MATCH "unsigned int len = 4294967288;" -> ASSUME {len == (4294967288U);} GOTO ARG17;
    TRUE -> STOP;

STATE USEFIRST ARG17 :
    MATCH "[!(newbufsize == 0)]" -> ASSUME {newbufsize == (95U);} GOTO ARG22;
    TRUE -> STOP;

STATE USEFIRST ARG22 :
    MATCH "[!(newbufsize + len + 1 == 0xffffffff)]" -> GOTO ARG24;
    TRUE -> STOP;

STATE USEFIRST ARG24 :
    MATCH "" -> GOTO ARG26;
    TRUE -> STOP;

STATE USEFIRST ARG26 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (95U);} GOTO ARG27;
    TRUE -> STOP;

STATE USEFIRST ARG27 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (190U);} GOTO ARG28;
    TRUE -> STOP;

STATE USEFIRST ARG28 :
    MATCH "" -> GOTO ARG29;
    TRUE -> STOP;

STATE USEFIRST ARG29 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (190U);} GOTO ARG45;
    TRUE -> STOP;

STATE USEFIRST ARG45 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (380U);} GOTO ARG48;
    TRUE -> STOP;

STATE USEFIRST ARG48 :
    MATCH "" -> GOTO ARG53;
    TRUE -> STOP;

STATE USEFIRST ARG53 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (380U);} GOTO ARG56;
    TRUE -> STOP;

STATE USEFIRST ARG56 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (760U);} GOTO ARG57;
    TRUE -> STOP;

STATE USEFIRST ARG57 :
    MATCH "" -> GOTO ARG58;
    TRUE -> STOP;

STATE USEFIRST ARG58 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (760U);} GOTO ARG59;
    TRUE -> STOP;

STATE USEFIRST ARG59 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (1520U);} GOTO ARG60;
    TRUE -> STOP;

STATE USEFIRST ARG60 :
    MATCH "" -> GOTO ARG61;
    TRUE -> STOP;

STATE USEFIRST ARG61 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (1520U);} GOTO ARG67;
    TRUE -> STOP;

STATE USEFIRST ARG67 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (3040U);} GOTO ARG69;
    TRUE -> STOP;

STATE USEFIRST ARG69 :
    MATCH "" -> GOTO ARG71;
    TRUE -> STOP;

STATE USEFIRST ARG71 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (3040U);} GOTO ARG72;
    TRUE -> STOP;

STATE USEFIRST ARG72 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (6080U);} GOTO ARG73;
    TRUE -> STOP;

STATE USEFIRST ARG73 :
    MATCH "" -> GOTO ARG74;
    TRUE -> STOP;

STATE USEFIRST ARG74 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (6080U);} GOTO ARG75;
    TRUE -> STOP;

STATE USEFIRST ARG75 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (12160U);} GOTO ARG76;
    TRUE -> STOP;

STATE USEFIRST ARG76 :
    MATCH "" -> GOTO ARG77;
    TRUE -> STOP;

STATE USEFIRST ARG77 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (12160U);} GOTO ARG78;
    TRUE -> STOP;

STATE USEFIRST ARG78 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (24320U);} GOTO ARG79;
    TRUE -> STOP;

STATE USEFIRST ARG79 :
    MATCH "" -> GOTO ARG80;
    TRUE -> STOP;

STATE USEFIRST ARG80 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (24320U);} GOTO ARG81;
    TRUE -> STOP;

STATE USEFIRST ARG81 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (48640U);} GOTO ARG82;
    TRUE -> STOP;

STATE USEFIRST ARG82 :
    MATCH "" -> GOTO ARG83;
    TRUE -> STOP;

STATE USEFIRST ARG83 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (48640U);} GOTO ARG85;
    TRUE -> STOP;

STATE USEFIRST ARG85 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (97280U);} GOTO ARG86;
    TRUE -> STOP;

STATE USEFIRST ARG86 :
    MATCH "" -> GOTO ARG87;
    TRUE -> STOP;

STATE USEFIRST ARG87 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (97280U);} GOTO ARG88;
    TRUE -> STOP;

STATE USEFIRST ARG88 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (194560U);} GOTO ARG89;
    TRUE -> STOP;

STATE USEFIRST ARG89 :
    MATCH "" -> GOTO ARG90;
    TRUE -> STOP;

STATE USEFIRST ARG90 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (194560U);} GOTO ARG91;
    TRUE -> STOP;

STATE USEFIRST ARG91 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (389120U);} GOTO ARG92;
    TRUE -> STOP;

STATE USEFIRST ARG92 :
    MATCH "" -> GOTO ARG93;
    TRUE -> STOP;

STATE USEFIRST ARG93 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (389120U);} GOTO ARG94;
    TRUE -> STOP;

STATE USEFIRST ARG94 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (778240U);} GOTO ARG95;
    TRUE -> STOP;

STATE USEFIRST ARG95 :
    MATCH "" -> GOTO ARG96;
    TRUE -> STOP;

STATE USEFIRST ARG96 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (778240U);} GOTO ARG97;
    TRUE -> STOP;

STATE USEFIRST ARG97 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (1556480U);} GOTO ARG98;
    TRUE -> STOP;

STATE USEFIRST ARG98 :
    MATCH "" -> GOTO ARG99;
    TRUE -> STOP;

STATE USEFIRST ARG99 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (1556480U);} GOTO ARG100;
    TRUE -> STOP;

STATE USEFIRST ARG100 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (3112960U);} GOTO ARG101;
    TRUE -> STOP;

STATE USEFIRST ARG101 :
    MATCH "" -> GOTO ARG102;
    TRUE -> STOP;

STATE USEFIRST ARG102 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (3112960U);} GOTO ARG103;
    TRUE -> STOP;

STATE USEFIRST ARG103 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (6225920U);} GOTO ARG104;
    TRUE -> STOP;

STATE USEFIRST ARG104 :
    MATCH "" -> GOTO ARG105;
    TRUE -> STOP;

STATE USEFIRST ARG105 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (6225920U);} GOTO ARG106;
    TRUE -> STOP;

STATE USEFIRST ARG106 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (12451840U);} GOTO ARG107;
    TRUE -> STOP;

STATE USEFIRST ARG107 :
    MATCH "" -> GOTO ARG108;
    TRUE -> STOP;

STATE USEFIRST ARG108 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (12451840U);} GOTO ARG109;
    TRUE -> STOP;

STATE USEFIRST ARG109 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (24903680U);} GOTO ARG110;
    TRUE -> STOP;

STATE USEFIRST ARG110 :
    MATCH "" -> GOTO ARG111;
    TRUE -> STOP;

STATE USEFIRST ARG111 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (24903680U);} GOTO ARG112;
    TRUE -> STOP;

STATE USEFIRST ARG112 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (49807360U);} GOTO ARG113;
    TRUE -> STOP;

STATE USEFIRST ARG113 :
    MATCH "" -> GOTO ARG114;
    TRUE -> STOP;

STATE USEFIRST ARG114 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (49807360U);} GOTO ARG115;
    TRUE -> STOP;

STATE USEFIRST ARG115 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (99614720U);} GOTO ARG116;
    TRUE -> STOP;

STATE USEFIRST ARG116 :
    MATCH "" -> GOTO ARG117;
    TRUE -> STOP;

STATE USEFIRST ARG117 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (99614720U);} GOTO ARG118;
    TRUE -> STOP;

STATE USEFIRST ARG118 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (199229440U);} GOTO ARG119;
    TRUE -> STOP;

STATE USEFIRST ARG119 :
    MATCH "" -> GOTO ARG120;
    TRUE -> STOP;

STATE USEFIRST ARG120 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (199229440U);} GOTO ARG121;
    TRUE -> STOP;

STATE USEFIRST ARG121 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (398458880U);} GOTO ARG122;
    TRUE -> STOP;

STATE USEFIRST ARG122 :
    MATCH "" -> GOTO ARG123;
    TRUE -> STOP;

STATE USEFIRST ARG123 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (398458880U);} GOTO ARG124;
    TRUE -> STOP;

STATE USEFIRST ARG124 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (796917760U);} GOTO ARG125;
    TRUE -> STOP;

STATE USEFIRST ARG125 :
    MATCH "" -> GOTO ARG126;
    TRUE -> STOP;

STATE USEFIRST ARG126 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (796917760U);} GOTO ARG127;
    TRUE -> STOP;

STATE USEFIRST ARG127 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (1593835520U);} GOTO ARG128;
    TRUE -> STOP;

STATE USEFIRST ARG128 :
    MATCH "" -> GOTO ARG129;
    TRUE -> STOP;

STATE USEFIRST ARG129 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (1593835520U);} GOTO ARG130;
    TRUE -> STOP;

STATE USEFIRST ARG130 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (3187671040U);} GOTO ARG131;
    TRUE -> STOP;

STATE USEFIRST ARG131 :
    MATCH "" -> GOTO ARG132;
    TRUE -> STOP;

STATE USEFIRST ARG132 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (3187671040U);} GOTO ARG133;
    TRUE -> STOP;

STATE USEFIRST ARG133 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (2080374784U);} GOTO ARG134;
    TRUE -> STOP;

STATE USEFIRST ARG134 :
    MATCH "" -> GOTO ARG135;
    TRUE -> STOP;

STATE USEFIRST ARG135 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (2080374784U);} GOTO ARG136;
    TRUE -> STOP;

STATE USEFIRST ARG136 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (4160749568U);} GOTO ARG137;
    TRUE -> STOP;

STATE USEFIRST ARG137 :
    MATCH "" -> GOTO ARG138;
    TRUE -> STOP;

STATE USEFIRST ARG138 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (4160749568U);} GOTO ARG139;
    TRUE -> STOP;

STATE USEFIRST ARG139 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (4026531840U);} GOTO ARG140;
    TRUE -> STOP;

STATE USEFIRST ARG140 :
    MATCH "" -> GOTO ARG141;
    TRUE -> STOP;

STATE USEFIRST ARG141 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (4026531840U);} GOTO ARG142;
    TRUE -> STOP;

STATE USEFIRST ARG142 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (3758096384U);} GOTO ARG143;
    TRUE -> STOP;

STATE USEFIRST ARG143 :
    MATCH "" -> GOTO ARG144;
    TRUE -> STOP;

STATE USEFIRST ARG144 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (3758096384U);} GOTO ARG145;
    TRUE -> STOP;

STATE USEFIRST ARG145 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (3221225472U);} GOTO ARG146;
    TRUE -> STOP;

STATE USEFIRST ARG146 :
    MATCH "" -> GOTO ARG147;
    TRUE -> STOP;

STATE USEFIRST ARG147 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (3221225472U);} GOTO ARG148;
    TRUE -> STOP;

STATE USEFIRST ARG148 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (2147483648U);} GOTO ARG149;
    TRUE -> STOP;

STATE USEFIRST ARG149 :
    MATCH "" -> GOTO ARG150;
    TRUE -> STOP;

STATE USEFIRST ARG150 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (2147483648U);} GOTO ARG151;
    TRUE -> STOP;

STATE USEFIRST ARG151 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (0U);} GOTO ARG152;
    TRUE -> STOP;

STATE USEFIRST ARG152 :
    MATCH "" -> GOTO ARG153;
    TRUE -> STOP;

STATE USEFIRST ARG153 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (0U);} GOTO ARG154;
    TRUE -> STOP;

STATE USEFIRST ARG154 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (0U);} GOTO ARG155;
    TRUE -> STOP;

STATE USEFIRST ARG155 :
    MATCH "" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG156 :
    TRUE -> STOP;

END AUTOMATON
