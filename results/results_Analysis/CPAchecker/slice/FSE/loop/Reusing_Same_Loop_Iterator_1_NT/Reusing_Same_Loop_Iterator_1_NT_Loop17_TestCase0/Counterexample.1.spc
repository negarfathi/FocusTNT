CONTROL AUTOMATON ErrorPath1

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
    MATCH "" -> GOTO ARG6;
    TRUE -> STOP;

STATE USEFIRST ARG6 :
    MATCH "int __retres;" -> GOTO ARG9;
    TRUE -> STOP;

STATE USEFIRST ARG9 :
    MATCH "int i;" -> GOTO ARG10;
    TRUE -> STOP;

STATE USEFIRST ARG10 :
    MATCH "int num_crtc = __VERIFIER_nondet_int();" -> GOTO ARG11;
    TRUE -> STOP;

STATE USEFIRST ARG11 :
    MATCH "int num_crtc = __VERIFIER_nondet_int();" -> GOTO ARG14;
    TRUE -> STOP;

STATE USEFIRST ARG14 :
    MATCH "int num_output = __VERIFIER_nondet_int();" -> GOTO ARG15;
    TRUE -> STOP;

STATE USEFIRST ARG15 :
    MATCH "int num_output = __VERIFIER_nondet_int();" -> GOTO ARG16;
    TRUE -> STOP;

STATE USEFIRST ARG16 :
    MATCH "[!(num_crtc > 65534)]" -> GOTO ARG26;
    TRUE -> STOP;

STATE USEFIRST ARG26 :
    MATCH "[!(num_output > 65534)]" -> GOTO ARG31;
    TRUE -> STOP;

STATE USEFIRST ARG31 :
    MATCH "" -> GOTO ARG32;
    TRUE -> STOP;

STATE USEFIRST ARG32 :
    MATCH "i = 0;" -> ASSUME {i == (0);} GOTO ARG40;
    TRUE -> STOP;

STATE USEFIRST ARG40 :
    MATCH "" -> GOTO ARG43;
    TRUE -> STOP;

STATE USEFIRST ARG43 :
    MATCH "[i < num_crtc]" -> ASSUME {i == (0);} GOTO ARG44;
    TRUE -> STOP;

STATE USEFIRST ARG44 :
    MATCH "i = 0;" -> ASSUME {i == (0);} GOTO ARG50;
    TRUE -> STOP;

STATE USEFIRST ARG50 :
    MATCH "" -> GOTO ARG51;
    TRUE -> STOP;

STATE USEFIRST ARG51 :
    MATCH "[!(i < num_output)]" -> ASSUME {i == (0);} GOTO ARG53;
    TRUE -> STOP;

STATE USEFIRST ARG53 :
    MATCH "i ++;" -> ASSUME {__CPAchecker_TMP_1 == (0);} GOTO ARG54;
    TRUE -> STOP;

STATE USEFIRST ARG54 :
    MATCH "i ++;" -> ASSUME {i == (1);} GOTO ARG55;
    TRUE -> STOP;

STATE USEFIRST ARG55 :
    MATCH "i ++;" -> GOTO ARG56;
    TRUE -> STOP;

STATE USEFIRST ARG56 :
    MATCH "" -> GOTO ARG57;
    TRUE -> STOP;

STATE USEFIRST ARG57 :
    MATCH "[i < num_crtc]" -> ASSUME {i == (1);} GOTO ARG72;
    TRUE -> STOP;

STATE USEFIRST ARG72 :
    MATCH "i = 0;" -> ASSUME {i == (0);} GOTO ARG80;
    TRUE -> STOP;

STATE USEFIRST ARG80 :
    MATCH "" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG82 :
    TRUE -> STOP;

END AUTOMATON
