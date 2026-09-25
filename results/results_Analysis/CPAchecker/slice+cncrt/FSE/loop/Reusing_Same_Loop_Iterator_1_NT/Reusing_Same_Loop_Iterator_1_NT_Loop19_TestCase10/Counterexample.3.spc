CONTROL AUTOMATON ErrorPath3

INITIAL STATE ARG0;

STATE USEFIRST ARG0 :
    MATCH "" -> GOTO ARG3;
    TRUE -> STOP;

STATE USEFIRST ARG3 :
    MATCH "extern int __VERIFIER_nondet_int(void);" -> GOTO ARG4;
    TRUE -> STOP;

STATE USEFIRST ARG4 :
    MATCH "void main(void)" -> GOTO ARG5;
    TRUE -> STOP;

STATE USEFIRST ARG5 :
    MATCH "" -> GOTO ARG8;
    TRUE -> STOP;

STATE USEFIRST ARG8 :
    MATCH "int __retres;" -> GOTO ARG9;
    TRUE -> STOP;

STATE USEFIRST ARG9 :
    MATCH "int i;" -> GOTO ARG10;
    TRUE -> STOP;

STATE USEFIRST ARG10 :
    MATCH "int num_crtc = 20;" -> ASSUME {num_crtc == (20);} GOTO ARG13;
    TRUE -> STOP;

STATE USEFIRST ARG13 :
    MATCH "int num_output = 10;" -> ASSUME {num_output == (10);} GOTO ARG14;
    TRUE -> STOP;

STATE USEFIRST ARG14 :
    MATCH "[!(num_crtc > 65534)]" -> ASSUME {num_crtc == (20);} GOTO ARG19;
    TRUE -> STOP;

STATE USEFIRST ARG19 :
    MATCH "[!(num_output > 65534)]" -> ASSUME {num_output == (10);} GOTO ARG24;
    TRUE -> STOP;

STATE USEFIRST ARG24 :
    MATCH "" -> GOTO ARG25;
    TRUE -> STOP;

STATE USEFIRST ARG25 :
    MATCH "i = 0;" -> ASSUME {i == (0);} GOTO ARG29;
    TRUE -> STOP;

STATE USEFIRST ARG29 :
    MATCH "" -> GOTO ARG39;
    TRUE -> STOP;

STATE USEFIRST ARG39 :
    MATCH "[i < num_crtc]" -> ASSUME {i == (0);num_crtc == (20);} GOTO ARG40;
    TRUE -> STOP;

STATE USEFIRST ARG40 :
    MATCH "i = 0;" -> ASSUME {i == (0);} GOTO ARG41;
    TRUE -> STOP;

STATE USEFIRST ARG41 :
    MATCH "" -> GOTO ARG44;
    TRUE -> STOP;

STATE USEFIRST ARG44 :
    MATCH "[i < num_output]" -> ASSUME {i == (0);num_output == (10);} GOTO ARG45;
    TRUE -> STOP;

STATE USEFIRST ARG45 :
    MATCH "i ++;" -> ASSUME {__CPAchecker_TMP_0 == (0);} GOTO ARG46;
    TRUE -> STOP;

STATE USEFIRST ARG46 :
    MATCH "i ++;" -> ASSUME {i == (1);} GOTO ARG47;
    TRUE -> STOP;

STATE USEFIRST ARG47 :
    MATCH "i ++;" -> GOTO ARG48;
    TRUE -> STOP;

STATE USEFIRST ARG48 :
    MATCH "" -> GOTO ARG49;
    TRUE -> STOP;

STATE USEFIRST ARG49 :
    MATCH "[i < num_output]" -> ASSUME {i == (1);num_output == (10);} GOTO ARG50;
    TRUE -> STOP;

STATE USEFIRST ARG50 :
    MATCH "i ++;" -> ASSUME {__CPAchecker_TMP_0 == (1);} GOTO ARG51;
    TRUE -> STOP;

STATE USEFIRST ARG51 :
    MATCH "i ++;" -> ASSUME {i == (2);} GOTO ARG60;
    TRUE -> STOP;

STATE USEFIRST ARG60 :
    MATCH "i ++;" -> GOTO ARG61;
    TRUE -> STOP;

STATE USEFIRST ARG61 :
    MATCH "" -> GOTO ARG63;
    TRUE -> STOP;

STATE USEFIRST ARG63 :
    MATCH "[i < num_output]" -> ASSUME {i == (2);num_output == (10);} GOTO ARG72;
    TRUE -> STOP;

STATE USEFIRST ARG72 :
    MATCH "i ++;" -> ASSUME {__CPAchecker_TMP_0 == (2);} GOTO ARG74;
    TRUE -> STOP;

STATE USEFIRST ARG74 :
    MATCH "i ++;" -> ASSUME {i == (3);} GOTO ARG76;
    TRUE -> STOP;

STATE USEFIRST ARG76 :
    MATCH "i ++;" -> GOTO ARG77;
    TRUE -> STOP;

STATE USEFIRST ARG77 :
    MATCH "" -> GOTO ARG78;
    TRUE -> STOP;

STATE USEFIRST ARG78 :
    MATCH "[i < num_output]" -> ASSUME {i == (3);num_output == (10);} GOTO ARG85;
    TRUE -> STOP;

STATE USEFIRST ARG85 :
    MATCH "i ++;" -> ASSUME {__CPAchecker_TMP_0 == (3);} GOTO ARG86;
    TRUE -> STOP;

STATE USEFIRST ARG86 :
    MATCH "i ++;" -> ASSUME {i == (4);} GOTO ARG87;
    TRUE -> STOP;

STATE USEFIRST ARG87 :
    MATCH "i ++;" -> GOTO ARG88;
    TRUE -> STOP;

STATE USEFIRST ARG88 :
    MATCH "" -> GOTO ARG89;
    TRUE -> STOP;

STATE USEFIRST ARG89 :
    MATCH "[i < num_output]" -> ASSUME {i == (4);num_output == (10);} GOTO ARG90;
    TRUE -> STOP;

STATE USEFIRST ARG90 :
    MATCH "i ++;" -> ASSUME {__CPAchecker_TMP_0 == (4);} GOTO ARG91;
    TRUE -> STOP;

STATE USEFIRST ARG91 :
    MATCH "i ++;" -> ASSUME {i == (5);} GOTO ARG92;
    TRUE -> STOP;

STATE USEFIRST ARG92 :
    MATCH "i ++;" -> GOTO ARG93;
    TRUE -> STOP;

STATE USEFIRST ARG93 :
    MATCH "" -> GOTO ARG101;
    TRUE -> STOP;

STATE USEFIRST ARG101 :
    MATCH "[i < num_output]" -> ASSUME {i == (5);num_output == (10);} GOTO ARG102;
    TRUE -> STOP;

STATE USEFIRST ARG102 :
    MATCH "i ++;" -> ASSUME {__CPAchecker_TMP_0 == (5);} GOTO ARG103;
    TRUE -> STOP;

STATE USEFIRST ARG103 :
    MATCH "i ++;" -> ASSUME {i == (6);} GOTO ARG104;
    TRUE -> STOP;

STATE USEFIRST ARG104 :
    MATCH "i ++;" -> GOTO ARG105;
    TRUE -> STOP;

STATE USEFIRST ARG105 :
    MATCH "" -> GOTO ARG106;
    TRUE -> STOP;

STATE USEFIRST ARG106 :
    MATCH "[i < num_output]" -> ASSUME {i == (6);num_output == (10);} GOTO ARG107;
    TRUE -> STOP;

STATE USEFIRST ARG107 :
    MATCH "i ++;" -> ASSUME {__CPAchecker_TMP_0 == (6);} GOTO ARG108;
    TRUE -> STOP;

STATE USEFIRST ARG108 :
    MATCH "i ++;" -> ASSUME {i == (7);} GOTO ARG109;
    TRUE -> STOP;

STATE USEFIRST ARG109 :
    MATCH "i ++;" -> GOTO ARG110;
    TRUE -> STOP;

STATE USEFIRST ARG110 :
    MATCH "" -> GOTO ARG111;
    TRUE -> STOP;

STATE USEFIRST ARG111 :
    MATCH "[i < num_output]" -> ASSUME {i == (7);num_output == (10);} GOTO ARG112;
    TRUE -> STOP;

STATE USEFIRST ARG112 :
    MATCH "i ++;" -> ASSUME {__CPAchecker_TMP_0 == (7);} GOTO ARG113;
    TRUE -> STOP;

STATE USEFIRST ARG113 :
    MATCH "i ++;" -> ASSUME {i == (8);} GOTO ARG114;
    TRUE -> STOP;

STATE USEFIRST ARG114 :
    MATCH "i ++;" -> GOTO ARG115;
    TRUE -> STOP;

STATE USEFIRST ARG115 :
    MATCH "" -> GOTO ARG116;
    TRUE -> STOP;

STATE USEFIRST ARG116 :
    MATCH "[i < num_output]" -> ASSUME {i == (8);num_output == (10);} GOTO ARG117;
    TRUE -> STOP;

STATE USEFIRST ARG117 :
    MATCH "i ++;" -> ASSUME {__CPAchecker_TMP_0 == (8);} GOTO ARG118;
    TRUE -> STOP;

STATE USEFIRST ARG118 :
    MATCH "i ++;" -> ASSUME {i == (9);} GOTO ARG119;
    TRUE -> STOP;

STATE USEFIRST ARG119 :
    MATCH "i ++;" -> GOTO ARG120;
    TRUE -> STOP;

STATE USEFIRST ARG120 :
    MATCH "" -> GOTO ARG121;
    TRUE -> STOP;

STATE USEFIRST ARG121 :
    MATCH "[i < num_output]" -> ASSUME {i == (9);num_output == (10);} GOTO ARG122;
    TRUE -> STOP;

STATE USEFIRST ARG122 :
    MATCH "i ++;" -> ASSUME {__CPAchecker_TMP_0 == (9);} GOTO ARG123;
    TRUE -> STOP;

STATE USEFIRST ARG123 :
    MATCH "i ++;" -> ASSUME {i == (10);} GOTO ARG124;
    TRUE -> STOP;

STATE USEFIRST ARG124 :
    MATCH "i ++;" -> GOTO ARG125;
    TRUE -> STOP;

STATE USEFIRST ARG125 :
    MATCH "" -> GOTO ARG126;
    TRUE -> STOP;

STATE USEFIRST ARG126 :
    MATCH "[!(i < num_output)]" -> ASSUME {i == (10);num_output == (10);} GOTO ARG127;
    TRUE -> STOP;

STATE USEFIRST ARG127 :
    MATCH "i ++;" -> ASSUME {__CPAchecker_TMP_1 == (10);} GOTO ARG128;
    TRUE -> STOP;

STATE USEFIRST ARG128 :
    MATCH "i ++;" -> ASSUME {i == (11);} GOTO ARG130;
    TRUE -> STOP;

STATE USEFIRST ARG130 :
    MATCH "i ++;" -> GOTO ARG131;
    TRUE -> STOP;

STATE USEFIRST ARG131 :
    MATCH "" -> GOTO ARG132;
    TRUE -> STOP;

STATE USEFIRST ARG132 :
    MATCH "[i < num_crtc]" -> ASSUME {i == (11);num_crtc == (20);} GOTO ARG133;
    TRUE -> STOP;

STATE USEFIRST ARG133 :
    MATCH "i = 0;" -> ASSUME {i == (0);} GOTO ARG134;
    TRUE -> STOP;

STATE USEFIRST ARG134 :
    MATCH "" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG135 :
    TRUE -> STOP;

END AUTOMATON
