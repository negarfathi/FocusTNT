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
    MATCH "int flag = 0;" -> ASSUME {flag == (0);} GOTO ARG8;
    TRUE -> STOP;

STATE USEFIRST ARG8 :
    MATCH "int res_return()" -> GOTO ARG9;
    TRUE -> STOP;

STATE USEFIRST ARG9 :
    MATCH "int main()" -> GOTO ARG10;
    TRUE -> STOP;

STATE USEFIRST ARG10 :
    MATCH "" -> GOTO ARG11;
    TRUE -> STOP;

STATE USEFIRST ARG11 :
    MATCH "int matroska = __VERIFIER_nondet_int();" -> GOTO ARG12;
    TRUE -> STOP;

STATE USEFIRST ARG12 :
    MATCH "int matroska = __VERIFIER_nondet_int();" -> GOTO ARG16;
    TRUE -> STOP;

STATE USEFIRST ARG16 :
    MATCH "int res = 0;" -> ASSUME {res == (0);} GOTO ARG19;
    TRUE -> STOP;

STATE USEFIRST ARG19 :
    MATCH "" -> GOTO ARG25;
    TRUE -> STOP;

STATE USEFIRST ARG25 :
    MATCH "matroska_deliver_packet( matroska)" -> GOTO ARG26;
    TRUE -> STOP;

STATE USEFIRST ARG26 :
    MATCH "matroska_deliver_packet( matroska)" -> GOTO ARG27;
    TRUE -> STOP;

STATE USEFIRST ARG27 :
    MATCH "" -> GOTO ARG31;
    TRUE -> STOP;

STATE USEFIRST ARG31 :
    MATCH "[!(q == 1)]" -> GOTO ARG38;
    TRUE -> STOP;

STATE USEFIRST ARG38 :
    MATCH "return 1;" -> GOTO ARG40;
    TRUE -> STOP;

STATE USEFIRST ARG40 :
    MATCH "" -> GOTO ARG41;
    TRUE -> STOP;

STATE USEFIRST ARG41 :
    MATCH "[matroska_deliver_packet( matroska)]" -> ASSUME {__CPAchecker_TMP_0 == (1);} GOTO ARG44;
    TRUE -> STOP;

STATE USEFIRST ARG44 :
    MATCH "" -> GOTO ARG49;
    TRUE -> STOP;

STATE USEFIRST ARG49 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG50;
    TRUE -> STOP;

STATE USEFIRST ARG50 :
    MATCH "int id = __VERIFIER_nondet_int();" -> GOTO ARG51;
    TRUE -> STOP;

STATE USEFIRST ARG51 :
    MATCH "int id = __VERIFIER_nondet_int();" -> GOTO ARG53;
    TRUE -> STOP;

STATE USEFIRST ARG53 :
    MATCH "switch (id)" -> GOTO ARG54;
    TRUE -> STOP;

STATE USEFIRST ARG54 :
    MATCH "[!(id == 1)]" -> GOTO ARG57;
    TRUE -> STOP;

STATE USEFIRST ARG57 :
    MATCH "[!(id == 2)]" -> GOTO ARG59;
    TRUE -> STOP;

STATE USEFIRST ARG59 :
    MATCH "switch( id ){\n                case 1:\n                    if( res = res_return() < 0 )\n                        break;\n                    if( res = res_return() == 0 )\n                        res = 1;\n                    break;\n\n                default:\n                case 2:\n                    res = res_return();\n                    break;\n            }" -> GOTO ARG60;
    TRUE -> STOP;

STATE USEFIRST ARG60 :
    MATCH "" -> GOTO ARG61;
    TRUE -> STOP;

STATE USEFIRST ARG61 :
    MATCH "res = res_return();" -> GOTO ARG62;
    TRUE -> STOP;

STATE USEFIRST ARG62 :
    MATCH "" -> GOTO ARG63;
    TRUE -> STOP;

STATE USEFIRST ARG63 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (0);} GOTO ARG64;
    TRUE -> STOP;

STATE USEFIRST ARG64 :
    MATCH "flag++ < 100" -> ASSUME {flag == (1);} GOTO ARG65;
    TRUE -> STOP;

STATE USEFIRST ARG65 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (0);} GOTO ARG66;
    TRUE -> STOP;

STATE USEFIRST ARG66 :
    MATCH "return __VERIFIER_nondet_int();" -> GOTO ARG67;
    TRUE -> STOP;

STATE USEFIRST ARG67 :
    MATCH "return __VERIFIER_nondet_int();" -> GOTO ARG68;
    TRUE -> STOP;

STATE USEFIRST ARG68 :
    MATCH "return __VERIFIER_nondet_int();" -> GOTO ARG69;
    TRUE -> STOP;

STATE USEFIRST ARG69 :
    MATCH "" -> GOTO ARG70;
    TRUE -> STOP;

STATE USEFIRST ARG70 :
    MATCH "break;" -> GOTO ARG71;
    TRUE -> STOP;

STATE USEFIRST ARG71 :
    MATCH "" -> GOTO ARG72;
    TRUE -> STOP;

STATE USEFIRST ARG72 :
    MATCH "[!(res == 0)]" -> GOTO ARG124;
    TRUE -> STOP;

STATE USEFIRST ARG124 :
    MATCH "[!(res == -1)]" -> GOTO ARG134;
    TRUE -> STOP;

STATE USEFIRST ARG134 :
    MATCH "" -> GOTO ARG135;
    TRUE -> STOP;

STATE USEFIRST ARG135 :
    MATCH "matroska_deliver_packet( matroska)" -> GOTO ARG141;
    TRUE -> STOP;

STATE USEFIRST ARG141 :
    MATCH "matroska_deliver_packet( matroska)" -> GOTO ARG143;
    TRUE -> STOP;

STATE USEFIRST ARG143 :
    MATCH "" -> GOTO ARG146;
    TRUE -> STOP;

STATE USEFIRST ARG146 :
    MATCH "[!(q == 1)]" -> GOTO ARG152;
    TRUE -> STOP;

STATE USEFIRST ARG152 :
    MATCH "return 1;" -> GOTO ARG154;
    TRUE -> STOP;

STATE USEFIRST ARG154 :
    MATCH "" -> GOTO ARG159;
    TRUE -> STOP;

STATE USEFIRST ARG159 :
    MATCH "[matroska_deliver_packet( matroska)]" -> ASSUME {__CPAchecker_TMP_0 == (1);} GOTO ARG160;
    TRUE -> STOP;

STATE USEFIRST ARG160 :
    MATCH "" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG163 :
    TRUE -> STOP;

END AUTOMATON
