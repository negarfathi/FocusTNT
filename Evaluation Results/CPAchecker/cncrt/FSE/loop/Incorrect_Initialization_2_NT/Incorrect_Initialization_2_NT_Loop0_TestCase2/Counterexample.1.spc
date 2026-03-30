CONTROL AUTOMATON ErrorPath1

INITIAL STATE ARG0;

STATE USEFIRST ARG0 :
    MATCH "" -> GOTO ARG3;
    TRUE -> STOP;

STATE USEFIRST ARG3 :
    MATCH "extern int __VERIFIER_nondet_int(void);" -> GOTO ARG4;
    TRUE -> STOP;

STATE USEFIRST ARG4 :
    MATCH "int matroska_deliver_packet( int q )" -> GOTO ARG5;
    TRUE -> STOP;

STATE USEFIRST ARG5 :
    MATCH "int flag = 0;" -> ASSUME {flag == (0);} GOTO ARG11;
    TRUE -> STOP;

STATE USEFIRST ARG11 :
    MATCH "int res_return()" -> GOTO ARG13;
    TRUE -> STOP;

STATE USEFIRST ARG13 :
    MATCH "int main()" -> GOTO ARG15;
    TRUE -> STOP;

STATE USEFIRST ARG15 :
    MATCH "" -> GOTO ARG17;
    TRUE -> STOP;

STATE USEFIRST ARG17 :
    MATCH "int matroska = 2;" -> ASSUME {matroska == (2);} GOTO ARG22;
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
    MATCH "" -> ASSUME {q == (2);} GOTO ARG36;
    TRUE -> STOP;

STATE USEFIRST ARG36 :
    MATCH "[!(q == 1)]" -> ASSUME {q == (2);} GOTO ARG39;
    TRUE -> STOP;

STATE USEFIRST ARG39 :
    MATCH "return 1;" -> GOTO ARG43;
    TRUE -> STOP;

STATE USEFIRST ARG43 :
    MATCH "" -> GOTO ARG45;
    TRUE -> STOP;

STATE USEFIRST ARG45 :
    MATCH "[matroska_deliver_packet( matroska)]" -> ASSUME {__CPAchecker_TMP_0 == (1);} GOTO ARG46;
    TRUE -> STOP;

STATE USEFIRST ARG46 :
    MATCH "" -> GOTO ARG47;
    TRUE -> STOP;

STATE USEFIRST ARG47 :
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
    MATCH "[res = res_return() < 0]" -> ASSUME {res == (1);} GOTO ARG63;
    TRUE -> STOP;

STATE USEFIRST ARG63 :
    MATCH "break;" -> GOTO ARG64;
    TRUE -> STOP;

STATE USEFIRST ARG64 :
    MATCH "" -> GOTO ARG76;
    TRUE -> STOP;

STATE USEFIRST ARG76 :
    MATCH "[!(res == 0)]" -> ASSUME {res == (1);} GOTO ARG126;
    TRUE -> STOP;

STATE USEFIRST ARG126 :
    MATCH "[!(res == -1)]" -> ASSUME {res == (1);} GOTO ARG131;
    TRUE -> STOP;

STATE USEFIRST ARG131 :
    MATCH "" -> GOTO ARG132;
    TRUE -> STOP;

STATE USEFIRST ARG132 :
    MATCH "matroska_deliver_packet( matroska)" -> GOTO ARG138;
    TRUE -> STOP;

STATE USEFIRST ARG138 :
    MATCH "matroska_deliver_packet( matroska)" -> GOTO ARG139;
    TRUE -> STOP;

STATE USEFIRST ARG139 :
    MATCH "" -> ASSUME {q == (2);} GOTO ARG142;
    TRUE -> STOP;

STATE USEFIRST ARG142 :
    MATCH "[!(q == 1)]" -> ASSUME {q == (2);} GOTO ARG145;
    TRUE -> STOP;

STATE USEFIRST ARG145 :
    MATCH "return 1;" -> GOTO ARG152;
    TRUE -> STOP;

STATE USEFIRST ARG152 :
    MATCH "" -> GOTO ARG155;
    TRUE -> STOP;

STATE USEFIRST ARG155 :
    MATCH "[matroska_deliver_packet( matroska)]" -> ASSUME {__CPAchecker_TMP_0 == (1);} GOTO ARG161;
    TRUE -> STOP;

STATE USEFIRST ARG161 :
    MATCH "" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG168 :
    TRUE -> STOP;

END AUTOMATON
