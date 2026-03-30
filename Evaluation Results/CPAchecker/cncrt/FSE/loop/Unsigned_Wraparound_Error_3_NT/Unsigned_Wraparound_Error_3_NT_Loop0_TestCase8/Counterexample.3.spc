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
    MATCH "" -> GOTO ARG7;
    TRUE -> STOP;

STATE USEFIRST ARG7 :
    MATCH "unsigned int pathlen = 4294967290;" -> ASSUME {pathlen == (4294967290U);} GOTO ARG11;
    TRUE -> STOP;

STATE USEFIRST ARG11 :
    MATCH "unsigned int newbufsize = 5;" -> ASSUME {newbufsize == (5U);} GOTO ARG12;
    TRUE -> STOP;

STATE USEFIRST ARG12 :
    MATCH "unsigned int len = 4294967280;" -> ASSUME {len == (4294967280U);} GOTO ARG13;
    TRUE -> STOP;

STATE USEFIRST ARG13 :
    MATCH "[!(newbufsize == 0)]" -> ASSUME {newbufsize == (5U);} GOTO ARG18;
    TRUE -> STOP;

STATE USEFIRST ARG18 :
    MATCH "[!(newbufsize + len + 1 == 0xffffffff)]" -> GOTO ARG23;
    TRUE -> STOP;

STATE USEFIRST ARG23 :
    MATCH "" -> GOTO ARG26;
    TRUE -> STOP;

STATE USEFIRST ARG26 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (5U);} GOTO ARG27;
    TRUE -> STOP;

STATE USEFIRST ARG27 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (10U);} GOTO ARG28;
    TRUE -> STOP;

STATE USEFIRST ARG28 :
    MATCH "" -> GOTO ARG29;
    TRUE -> STOP;

STATE USEFIRST ARG29 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (10U);} GOTO ARG43;
    TRUE -> STOP;

STATE USEFIRST ARG43 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (20U);} GOTO ARG46;
    TRUE -> STOP;

STATE USEFIRST ARG46 :
    MATCH "" -> GOTO ARG51;
    TRUE -> STOP;

STATE USEFIRST ARG51 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (20U);} GOTO ARG56;
    TRUE -> STOP;

STATE USEFIRST ARG56 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (40U);} GOTO ARG57;
    TRUE -> STOP;

STATE USEFIRST ARG57 :
    MATCH "" -> GOTO ARG58;
    TRUE -> STOP;

STATE USEFIRST ARG58 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (40U);} GOTO ARG59;
    TRUE -> STOP;

STATE USEFIRST ARG59 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (80U);} GOTO ARG60;
    TRUE -> STOP;

STATE USEFIRST ARG60 :
    MATCH "" -> GOTO ARG61;
    TRUE -> STOP;

STATE USEFIRST ARG61 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (80U);} GOTO ARG68;
    TRUE -> STOP;

STATE USEFIRST ARG68 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (160U);} GOTO ARG70;
    TRUE -> STOP;

STATE USEFIRST ARG70 :
    MATCH "" -> GOTO ARG71;
    TRUE -> STOP;

STATE USEFIRST ARG71 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (160U);} GOTO ARG72;
    TRUE -> STOP;

STATE USEFIRST ARG72 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (320U);} GOTO ARG73;
    TRUE -> STOP;

STATE USEFIRST ARG73 :
    MATCH "" -> GOTO ARG74;
    TRUE -> STOP;

STATE USEFIRST ARG74 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (320U);} GOTO ARG75;
    TRUE -> STOP;

STATE USEFIRST ARG75 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (640U);} GOTO ARG76;
    TRUE -> STOP;

STATE USEFIRST ARG76 :
    MATCH "" -> GOTO ARG77;
    TRUE -> STOP;

STATE USEFIRST ARG77 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (640U);} GOTO ARG78;
    TRUE -> STOP;

STATE USEFIRST ARG78 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (1280U);} GOTO ARG79;
    TRUE -> STOP;

STATE USEFIRST ARG79 :
    MATCH "" -> GOTO ARG80;
    TRUE -> STOP;

STATE USEFIRST ARG80 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (1280U);} GOTO ARG81;
    TRUE -> STOP;

STATE USEFIRST ARG81 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (2560U);} GOTO ARG82;
    TRUE -> STOP;

STATE USEFIRST ARG82 :
    MATCH "" -> GOTO ARG83;
    TRUE -> STOP;

STATE USEFIRST ARG83 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (2560U);} GOTO ARG84;
    TRUE -> STOP;

STATE USEFIRST ARG84 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (5120U);} GOTO ARG86;
    TRUE -> STOP;

STATE USEFIRST ARG86 :
    MATCH "" -> GOTO ARG87;
    TRUE -> STOP;

STATE USEFIRST ARG87 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (5120U);} GOTO ARG88;
    TRUE -> STOP;

STATE USEFIRST ARG88 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (10240U);} GOTO ARG89;
    TRUE -> STOP;

STATE USEFIRST ARG89 :
    MATCH "" -> GOTO ARG90;
    TRUE -> STOP;

STATE USEFIRST ARG90 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (10240U);} GOTO ARG91;
    TRUE -> STOP;

STATE USEFIRST ARG91 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (20480U);} GOTO ARG92;
    TRUE -> STOP;

STATE USEFIRST ARG92 :
    MATCH "" -> GOTO ARG93;
    TRUE -> STOP;

STATE USEFIRST ARG93 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (20480U);} GOTO ARG94;
    TRUE -> STOP;

STATE USEFIRST ARG94 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (40960U);} GOTO ARG95;
    TRUE -> STOP;

STATE USEFIRST ARG95 :
    MATCH "" -> GOTO ARG96;
    TRUE -> STOP;

STATE USEFIRST ARG96 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (40960U);} GOTO ARG97;
    TRUE -> STOP;

STATE USEFIRST ARG97 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (81920U);} GOTO ARG98;
    TRUE -> STOP;

STATE USEFIRST ARG98 :
    MATCH "" -> GOTO ARG99;
    TRUE -> STOP;

STATE USEFIRST ARG99 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (81920U);} GOTO ARG100;
    TRUE -> STOP;

STATE USEFIRST ARG100 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (163840U);} GOTO ARG101;
    TRUE -> STOP;

STATE USEFIRST ARG101 :
    MATCH "" -> GOTO ARG102;
    TRUE -> STOP;

STATE USEFIRST ARG102 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (163840U);} GOTO ARG103;
    TRUE -> STOP;

STATE USEFIRST ARG103 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (327680U);} GOTO ARG104;
    TRUE -> STOP;

STATE USEFIRST ARG104 :
    MATCH "" -> GOTO ARG105;
    TRUE -> STOP;

STATE USEFIRST ARG105 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (327680U);} GOTO ARG106;
    TRUE -> STOP;

STATE USEFIRST ARG106 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (655360U);} GOTO ARG107;
    TRUE -> STOP;

STATE USEFIRST ARG107 :
    MATCH "" -> GOTO ARG108;
    TRUE -> STOP;

STATE USEFIRST ARG108 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (655360U);} GOTO ARG109;
    TRUE -> STOP;

STATE USEFIRST ARG109 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (1310720U);} GOTO ARG110;
    TRUE -> STOP;

STATE USEFIRST ARG110 :
    MATCH "" -> GOTO ARG111;
    TRUE -> STOP;

STATE USEFIRST ARG111 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (1310720U);} GOTO ARG112;
    TRUE -> STOP;

STATE USEFIRST ARG112 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (2621440U);} GOTO ARG113;
    TRUE -> STOP;

STATE USEFIRST ARG113 :
    MATCH "" -> GOTO ARG114;
    TRUE -> STOP;

STATE USEFIRST ARG114 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (2621440U);} GOTO ARG115;
    TRUE -> STOP;

STATE USEFIRST ARG115 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (5242880U);} GOTO ARG116;
    TRUE -> STOP;

STATE USEFIRST ARG116 :
    MATCH "" -> GOTO ARG117;
    TRUE -> STOP;

STATE USEFIRST ARG117 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (5242880U);} GOTO ARG118;
    TRUE -> STOP;

STATE USEFIRST ARG118 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (10485760U);} GOTO ARG119;
    TRUE -> STOP;

STATE USEFIRST ARG119 :
    MATCH "" -> GOTO ARG120;
    TRUE -> STOP;

STATE USEFIRST ARG120 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (10485760U);} GOTO ARG121;
    TRUE -> STOP;

STATE USEFIRST ARG121 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (20971520U);} GOTO ARG122;
    TRUE -> STOP;

STATE USEFIRST ARG122 :
    MATCH "" -> GOTO ARG123;
    TRUE -> STOP;

STATE USEFIRST ARG123 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (20971520U);} GOTO ARG124;
    TRUE -> STOP;

STATE USEFIRST ARG124 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (41943040U);} GOTO ARG125;
    TRUE -> STOP;

STATE USEFIRST ARG125 :
    MATCH "" -> GOTO ARG126;
    TRUE -> STOP;

STATE USEFIRST ARG126 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (41943040U);} GOTO ARG127;
    TRUE -> STOP;

STATE USEFIRST ARG127 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (83886080U);} GOTO ARG128;
    TRUE -> STOP;

STATE USEFIRST ARG128 :
    MATCH "" -> GOTO ARG129;
    TRUE -> STOP;

STATE USEFIRST ARG129 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (83886080U);} GOTO ARG130;
    TRUE -> STOP;

STATE USEFIRST ARG130 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (167772160U);} GOTO ARG131;
    TRUE -> STOP;

STATE USEFIRST ARG131 :
    MATCH "" -> GOTO ARG132;
    TRUE -> STOP;

STATE USEFIRST ARG132 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (167772160U);} GOTO ARG133;
    TRUE -> STOP;

STATE USEFIRST ARG133 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (335544320U);} GOTO ARG134;
    TRUE -> STOP;

STATE USEFIRST ARG134 :
    MATCH "" -> GOTO ARG135;
    TRUE -> STOP;

STATE USEFIRST ARG135 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (335544320U);} GOTO ARG136;
    TRUE -> STOP;

STATE USEFIRST ARG136 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (671088640U);} GOTO ARG137;
    TRUE -> STOP;

STATE USEFIRST ARG137 :
    MATCH "" -> GOTO ARG138;
    TRUE -> STOP;

STATE USEFIRST ARG138 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (671088640U);} GOTO ARG139;
    TRUE -> STOP;

STATE USEFIRST ARG139 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (1342177280U);} GOTO ARG140;
    TRUE -> STOP;

STATE USEFIRST ARG140 :
    MATCH "" -> GOTO ARG141;
    TRUE -> STOP;

STATE USEFIRST ARG141 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (1342177280U);} GOTO ARG142;
    TRUE -> STOP;

STATE USEFIRST ARG142 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (2684354560U);} GOTO ARG143;
    TRUE -> STOP;

STATE USEFIRST ARG143 :
    MATCH "" -> GOTO ARG144;
    TRUE -> STOP;

STATE USEFIRST ARG144 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (2684354560U);} GOTO ARG145;
    TRUE -> STOP;

STATE USEFIRST ARG145 :
    MATCH "newbufsize *= 2;" -> ASSUME {newbufsize == (1073741824U);} GOTO ARG146;
    TRUE -> STOP;

STATE USEFIRST ARG146 :
    MATCH "" -> GOTO ARG147;
    TRUE -> STOP;

STATE USEFIRST ARG147 :
    MATCH "[newbufsize < pathlen + len + 1]" -> ASSUME {newbufsize == (1073741824U);} GOTO ARG148;
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
