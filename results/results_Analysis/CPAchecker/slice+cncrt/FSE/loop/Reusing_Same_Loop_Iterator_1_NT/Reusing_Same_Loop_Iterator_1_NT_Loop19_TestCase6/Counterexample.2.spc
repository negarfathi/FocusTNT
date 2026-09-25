CONTROL AUTOMATON ErrorPath2

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
    MATCH "int num_crtc = 10;" -> ASSUME {num_crtc == (10);} GOTO ARG13;
    TRUE -> STOP;

STATE USEFIRST ARG13 :
    MATCH "int num_output = 5;" -> ASSUME {num_output == (5);} GOTO ARG14;
    TRUE -> STOP;

STATE USEFIRST ARG14 :
    MATCH "[!(num_crtc > 65534)]" -> ASSUME {num_crtc == (10);} GOTO ARG19;
    TRUE -> STOP;

STATE USEFIRST ARG19 :
    MATCH "[!(num_output > 65534)]" -> ASSUME {num_output == (5);} GOTO ARG24;
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
    MATCH "[i < num_crtc]" -> ASSUME {i == (0);num_crtc == (10);} GOTO ARG40;
    TRUE -> STOP;

STATE USEFIRST ARG40 :
    MATCH "i = 0;" -> ASSUME {i == (0);} GOTO ARG41;
    TRUE -> STOP;

STATE USEFIRST ARG41 :
    MATCH "" -> GOTO ARG42;
    TRUE -> STOP;

STATE USEFIRST ARG42 :
    MATCH "[i < num_output]" -> ASSUME {i == (0);num_output == (5);} GOTO ARG45;
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
    MATCH "[i < num_output]" -> ASSUME {i == (1);num_output == (5);} GOTO ARG50;
    TRUE -> STOP;

STATE USEFIRST ARG50 :
    MATCH "i ++;" -> ASSUME {__CPAchecker_TMP_0 == (1);} GOTO ARG51;
    TRUE -> STOP;

STATE USEFIRST ARG51 :
    MATCH "i ++;" -> ASSUME {i == (2);} GOTO ARG52;
    TRUE -> STOP;

STATE USEFIRST ARG52 :
    MATCH "i ++;" -> GOTO ARG53;
    TRUE -> STOP;

STATE USEFIRST ARG53 :
    MATCH "" -> GOTO ARG54;
    TRUE -> STOP;

STATE USEFIRST ARG54 :
    MATCH "[i < num_output]" -> ASSUME {i == (2);num_output == (5);} GOTO ARG64;
    TRUE -> STOP;

STATE USEFIRST ARG64 :
    MATCH "i ++;" -> ASSUME {__CPAchecker_TMP_0 == (2);} GOTO ARG71;
    TRUE -> STOP;

STATE USEFIRST ARG71 :
    MATCH "i ++;" -> ASSUME {i == (3);} GOTO ARG72;
    TRUE -> STOP;

STATE USEFIRST ARG72 :
    MATCH "i ++;" -> GOTO ARG73;
    TRUE -> STOP;

STATE USEFIRST ARG73 :
    MATCH "" -> GOTO ARG78;
    TRUE -> STOP;

STATE USEFIRST ARG78 :
    MATCH "[i < num_output]" -> ASSUME {i == (3);num_output == (5);} GOTO ARG81;
    TRUE -> STOP;

STATE USEFIRST ARG81 :
    MATCH "i ++;" -> ASSUME {__CPAchecker_TMP_0 == (3);} GOTO ARG82;
    TRUE -> STOP;

STATE USEFIRST ARG82 :
    MATCH "i ++;" -> ASSUME {i == (4);} GOTO ARG87;
    TRUE -> STOP;

STATE USEFIRST ARG87 :
    MATCH "i ++;" -> GOTO ARG88;
    TRUE -> STOP;

STATE USEFIRST ARG88 :
    MATCH "" -> GOTO ARG89;
    TRUE -> STOP;

STATE USEFIRST ARG89 :
    MATCH "[i < num_output]" -> ASSUME {i == (4);num_output == (5);} GOTO ARG90;
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
    MATCH "" -> GOTO ARG94;
    TRUE -> STOP;

STATE USEFIRST ARG94 :
    MATCH "[!(i < num_output)]" -> ASSUME {i == (5);num_output == (5);} GOTO ARG102;
    TRUE -> STOP;

STATE USEFIRST ARG102 :
    MATCH "i ++;" -> ASSUME {__CPAchecker_TMP_1 == (5);} GOTO ARG103;
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
    MATCH "[i < num_crtc]" -> ASSUME {i == (6);num_crtc == (10);} GOTO ARG107;
    TRUE -> STOP;

STATE USEFIRST ARG107 :
    MATCH "i = 0;" -> ASSUME {i == (0);} GOTO ARG108;
    TRUE -> STOP;

STATE USEFIRST ARG108 :
    MATCH "" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG109 :
    TRUE -> STOP;

END AUTOMATON
