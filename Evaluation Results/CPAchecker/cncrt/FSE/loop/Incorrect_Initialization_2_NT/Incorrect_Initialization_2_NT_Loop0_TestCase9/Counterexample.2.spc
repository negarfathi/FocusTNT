CONTROL AUTOMATON ErrorPath2

INITIAL STATE ARG0;

STATE USEFIRST ARG0 :
    MATCH "" -> GOTO ARG3;
    TRUE -> STOP;

STATE USEFIRST ARG3 :
    MATCH "extern int __VERIFIER_nondet_int(void);" -> GOTO ARG4;
    TRUE -> STOP;

STATE USEFIRST ARG4 :
    MATCH "int matroska_deliver_packet( int q )" -> GOTO ARG7;
    TRUE -> STOP;

STATE USEFIRST ARG7 :
    MATCH "int flag = 0;" -> ASSUME {flag == (0);} GOTO ARG12;
    TRUE -> STOP;

STATE USEFIRST ARG12 :
    MATCH "int res_return()" -> GOTO ARG15;
    TRUE -> STOP;

STATE USEFIRST ARG15 :
    MATCH "int main()" -> GOTO ARG16;
    TRUE -> STOP;

STATE USEFIRST ARG16 :
    MATCH "" -> GOTO ARG17;
    TRUE -> STOP;

STATE USEFIRST ARG17 :
    MATCH "int matroska = 8;" -> ASSUME {matroska == (8);} GOTO ARG22;
    TRUE -> STOP;

STATE USEFIRST ARG22 :
    MATCH "int res = 0;" -> ASSUME {res == (0);} GOTO ARG23;
    TRUE -> STOP;

STATE USEFIRST ARG23 :
    MATCH "" -> GOTO ARG32;
    TRUE -> STOP;

STATE USEFIRST ARG32 :
    MATCH "matroska_deliver_packet( matroska)" -> GOTO ARG34;
    TRUE -> STOP;

STATE USEFIRST ARG34 :
    MATCH "matroska_deliver_packet( matroska)" -> GOTO ARG35;
    TRUE -> STOP;

STATE USEFIRST ARG35 :
    MATCH "" -> ASSUME {q == (8);} GOTO ARG36;
    TRUE -> STOP;

STATE USEFIRST ARG36 :
    MATCH "[!(q == 1)]" -> ASSUME {q == (8);} GOTO ARG39;
    TRUE -> STOP;

STATE USEFIRST ARG39 :
    MATCH "return 1;" -> GOTO ARG44;
    TRUE -> STOP;

STATE USEFIRST ARG44 :
    MATCH "" -> GOTO ARG45;
    TRUE -> STOP;

STATE USEFIRST ARG45 :
    MATCH "[matroska_deliver_packet( matroska)]" -> ASSUME {__CPAchecker_TMP_0 == (1);} GOTO ARG46;
    TRUE -> STOP;

STATE USEFIRST ARG46 :
    MATCH "" -> GOTO ARG49;
    TRUE -> STOP;

STATE USEFIRST ARG49 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG50;
    TRUE -> STOP;

STATE USEFIRST ARG50 :
    MATCH "int id = 2;" -> ASSUME {id == (2);} GOTO ARG51;
    TRUE -> STOP;

STATE USEFIRST ARG51 :
    MATCH "switch (id)" -> GOTO ARG52;
    TRUE -> STOP;

STATE USEFIRST ARG52 :
    MATCH "[!(id == 1)]" -> ASSUME {id == (2);} GOTO ARG53;
    TRUE -> STOP;

STATE USEFIRST ARG53 :
    MATCH "[id == 2]" -> ASSUME {id == (2);} GOTO ARG54;
    TRUE -> STOP;

STATE USEFIRST ARG54 :
    MATCH "res = res_return();" -> GOTO ARG55;
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
    MATCH "return 6;" -> GOTO ARG60;
    TRUE -> STOP;

STATE USEFIRST ARG60 :
    MATCH "" -> GOTO ARG61;
    TRUE -> STOP;

STATE USEFIRST ARG61 :
    MATCH "break;" -> GOTO ARG62;
    TRUE -> STOP;

STATE USEFIRST ARG62 :
    MATCH "" -> GOTO ARG63;
    TRUE -> STOP;

STATE USEFIRST ARG63 :
    MATCH "[!(res == 0)]" -> ASSUME {res == (6);} GOTO ARG101;
    TRUE -> STOP;

STATE USEFIRST ARG101 :
    MATCH "[!(res == -1)]" -> ASSUME {res == (6);} GOTO ARG107;
    TRUE -> STOP;

STATE USEFIRST ARG107 :
    MATCH "" -> GOTO ARG114;
    TRUE -> STOP;

STATE USEFIRST ARG114 :
    MATCH "matroska_deliver_packet( matroska)" -> GOTO ARG123;
    TRUE -> STOP;

STATE USEFIRST ARG123 :
    MATCH "matroska_deliver_packet( matroska)" -> GOTO ARG126;
    TRUE -> STOP;

STATE USEFIRST ARG126 :
    MATCH "" -> ASSUME {q == (8);} GOTO ARG127;
    TRUE -> STOP;

STATE USEFIRST ARG127 :
    MATCH "[!(q == 1)]" -> ASSUME {q == (8);} GOTO ARG128;
    TRUE -> STOP;

STATE USEFIRST ARG128 :
    MATCH "return 1;" -> GOTO ARG129;
    TRUE -> STOP;

STATE USEFIRST ARG129 :
    MATCH "" -> GOTO ARG132;
    TRUE -> STOP;

STATE USEFIRST ARG132 :
    MATCH "[matroska_deliver_packet( matroska)]" -> ASSUME {__CPAchecker_TMP_0 == (1);} GOTO ARG139;
    TRUE -> STOP;

STATE USEFIRST ARG139 :
    MATCH "" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG145 :
    TRUE -> STOP;

END AUTOMATON
