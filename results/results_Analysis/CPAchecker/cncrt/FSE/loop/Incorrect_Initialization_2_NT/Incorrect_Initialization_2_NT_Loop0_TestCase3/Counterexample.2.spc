CONTROL AUTOMATON ErrorPath2

INITIAL STATE ARG0;

STATE USEFIRST ARG0 :
    MATCH "" -> GOTO ARG3;
    TRUE -> STOP;

STATE USEFIRST ARG3 :
    MATCH "extern int __VERIFIER_nondet_int(void);" -> GOTO ARG5;
    TRUE -> STOP;

STATE USEFIRST ARG5 :
    MATCH "int matroska_deliver_packet( int q )" -> GOTO ARG7;
    TRUE -> STOP;

STATE USEFIRST ARG7 :
    MATCH "int flag = 0;" -> ASSUME {flag == (0);} GOTO ARG13;
    TRUE -> STOP;

STATE USEFIRST ARG13 :
    MATCH "int res_return()" -> GOTO ARG15;
    TRUE -> STOP;

STATE USEFIRST ARG15 :
    MATCH "int main()" -> GOTO ARG16;
    TRUE -> STOP;

STATE USEFIRST ARG16 :
    MATCH "" -> GOTO ARG17;
    TRUE -> STOP;

STATE USEFIRST ARG17 :
    MATCH "int matroska = 3;" -> ASSUME {matroska == (3);} GOTO ARG19;
    TRUE -> STOP;

STATE USEFIRST ARG19 :
    MATCH "int res = 0;" -> ASSUME {res == (0);} GOTO ARG23;
    TRUE -> STOP;

STATE USEFIRST ARG23 :
    MATCH "" -> GOTO ARG33;
    TRUE -> STOP;

STATE USEFIRST ARG33 :
    MATCH "matroska_deliver_packet( matroska)" -> GOTO ARG34;
    TRUE -> STOP;

STATE USEFIRST ARG34 :
    MATCH "matroska_deliver_packet( matroska)" -> GOTO ARG35;
    TRUE -> STOP;

STATE USEFIRST ARG35 :
    MATCH "" -> ASSUME {q == (3);} GOTO ARG36;
    TRUE -> STOP;

STATE USEFIRST ARG36 :
    MATCH "[!(q == 1)]" -> ASSUME {q == (3);} GOTO ARG43;
    TRUE -> STOP;

STATE USEFIRST ARG43 :
    MATCH "return 1;" -> GOTO ARG44;
    TRUE -> STOP;

STATE USEFIRST ARG44 :
    MATCH "" -> GOTO ARG45;
    TRUE -> STOP;

STATE USEFIRST ARG45 :
    MATCH "[matroska_deliver_packet( matroska)]" -> ASSUME {__CPAchecker_TMP_0 == (1);} GOTO ARG47;
    TRUE -> STOP;

STATE USEFIRST ARG47 :
    MATCH "" -> GOTO ARG49;
    TRUE -> STOP;

STATE USEFIRST ARG49 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG50;
    TRUE -> STOP;

STATE USEFIRST ARG50 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG51;
    TRUE -> STOP;

STATE USEFIRST ARG51 :
    MATCH "switch (id)" -> GOTO ARG52;
    TRUE -> STOP;

STATE USEFIRST ARG52 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG53;
    TRUE -> STOP;

STATE USEFIRST ARG53 :
    MATCH "res = res_return() < 0" -> GOTO ARG54;
    TRUE -> STOP;

STATE USEFIRST ARG54 :
    MATCH "res = res_return() < 0" -> GOTO ARG55;
    TRUE -> STOP;

STATE USEFIRST ARG55 :
    MATCH "" -> GOTO ARG56;
    TRUE -> STOP;

STATE USEFIRST ARG56 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (0);} GOTO ARG57;
    TRUE -> STOP;

STATE USEFIRST ARG57 :
    MATCH "flag++ < 100" -> ASSUME {flag == (1);} GOTO ARG58;
    TRUE -> STOP;

STATE USEFIRST ARG58 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (0);} GOTO ARG59;
    TRUE -> STOP;

STATE USEFIRST ARG59 :
    MATCH "return -1;" -> GOTO ARG60;
    TRUE -> STOP;

STATE USEFIRST ARG60 :
    MATCH "" -> GOTO ARG61;
    TRUE -> STOP;

STATE USEFIRST ARG61 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (1);} GOTO ARG62;
    TRUE -> STOP;

STATE USEFIRST ARG62 :
    MATCH "[res = res_return() < 0]" -> ASSUME {res == (1);} GOTO ARG70;
    TRUE -> STOP;

STATE USEFIRST ARG70 :
    MATCH "break;" -> GOTO ARG72;
    TRUE -> STOP;

STATE USEFIRST ARG72 :
    MATCH "" -> GOTO ARG80;
    TRUE -> STOP;

STATE USEFIRST ARG80 :
    MATCH "[!(res == 0)]" -> ASSUME {res == (1);} GOTO ARG124;
    TRUE -> STOP;

STATE USEFIRST ARG124 :
    MATCH "[!(res == -1)]" -> ASSUME {res == (1);} GOTO ARG127;
    TRUE -> STOP;

STATE USEFIRST ARG127 :
    MATCH "" -> GOTO ARG128;
    TRUE -> STOP;

STATE USEFIRST ARG128 :
    MATCH "matroska_deliver_packet( matroska)" -> GOTO ARG138;
    TRUE -> STOP;

STATE USEFIRST ARG138 :
    MATCH "matroska_deliver_packet( matroska)" -> GOTO ARG141;
    TRUE -> STOP;

STATE USEFIRST ARG141 :
    MATCH "" -> ASSUME {q == (3);} GOTO ARG144;
    TRUE -> STOP;

STATE USEFIRST ARG144 :
    MATCH "[!(q == 1)]" -> ASSUME {q == (3);} GOTO ARG145;
    TRUE -> STOP;

STATE USEFIRST ARG145 :
    MATCH "return 1;" -> GOTO ARG148;
    TRUE -> STOP;

STATE USEFIRST ARG148 :
    MATCH "" -> GOTO ARG149;
    TRUE -> STOP;

STATE USEFIRST ARG149 :
    MATCH "[matroska_deliver_packet( matroska)]" -> ASSUME {__CPAchecker_TMP_0 == (1);} GOTO ARG154;
    TRUE -> STOP;

STATE USEFIRST ARG154 :
    MATCH "" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG160 :
    TRUE -> STOP;

END AUTOMATON
