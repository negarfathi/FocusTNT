CONTROL AUTOMATON ErrorPath2

INITIAL STATE ARG0;

STATE USEFIRST ARG0 :
    MATCH "" -> GOTO ARG3;
    TRUE -> STOP;

STATE USEFIRST ARG3 :
    MATCH "extern int __VERIFIER_nondet_int(void);" -> GOTO ARG5;
    TRUE -> STOP;

STATE USEFIRST ARG5 :
    MATCH "int flag = 0;" -> ASSUME {flag == (0);} GOTO ARG11;
    TRUE -> STOP;

STATE USEFIRST ARG11 :
    MATCH "int mdb_cursor_get_slice_1(void)" -> GOTO ARG12;
    TRUE -> STOP;

STATE USEFIRST ARG12 :
    MATCH "void main(void)" -> GOTO ARG13;
    TRUE -> STOP;

STATE USEFIRST ARG13 :
    MATCH "" -> GOTO ARG14;
    TRUE -> STOP;

STATE USEFIRST ARG14 :
    MATCH "int rc;" -> GOTO ARG15;
    TRUE -> STOP;

STATE USEFIRST ARG15 :
    MATCH "rc = mdb_cursor_get_slice_1();" -> GOTO ARG16;
    TRUE -> STOP;

STATE USEFIRST ARG16 :
    MATCH "" -> GOTO ARG17;
    TRUE -> STOP;

STATE USEFIRST ARG17 :
    MATCH "int __retres;" -> GOTO ARG20;
    TRUE -> STOP;

STATE USEFIRST ARG20 :
    MATCH "int i = 5;" -> ASSUME {i == (5);} GOTO ARG21;
    TRUE -> STOP;

STATE USEFIRST ARG21 :
    MATCH "flag ++;" -> ASSUME {__CPAchecker_TMP_0 == (0);} GOTO ARG22;
    TRUE -> STOP;

STATE USEFIRST ARG22 :
    MATCH "flag ++;" -> ASSUME {flag == (1);} GOTO ARG31;
    TRUE -> STOP;

STATE USEFIRST ARG31 :
    MATCH "flag ++;" -> GOTO ARG32;
    TRUE -> STOP;

STATE USEFIRST ARG32 :
    MATCH "[!(flag > 1000)]" -> ASSUME {flag == (1);} GOTO ARG41;
    TRUE -> STOP;

STATE USEFIRST ARG41 :
    MATCH "[i >= 0]" -> ASSUME {i == (5);} GOTO ARG43;
    TRUE -> STOP;

STATE USEFIRST ARG43 :
    MATCH "__retres = 0;" -> ASSUME {__retres == (0);} GOTO ARG45;
    TRUE -> STOP;

STATE USEFIRST ARG45 :
    MATCH "" -> GOTO ARG47;
    TRUE -> STOP;

STATE USEFIRST ARG47 :
    MATCH "return_label: return __retres;" -> GOTO ARG48;
    TRUE -> STOP;

STATE USEFIRST ARG48 :
    MATCH "return __retres;" -> GOTO ARG55;
    TRUE -> STOP;

STATE USEFIRST ARG55 :
    MATCH "" -> GOTO ARG57;
    TRUE -> STOP;

STATE USEFIRST ARG57 :
    MATCH "int dval_mv_size = -5;" -> ASSUME {dval_mv_size == (-5);} GOTO ARG61;
    TRUE -> STOP;

STATE USEFIRST ARG61 :
    MATCH "" -> GOTO ARG65;
    TRUE -> STOP;

STATE USEFIRST ARG65 :
    MATCH "[rc == 0]" -> ASSUME {rc == (0);} GOTO ARG66;
    TRUE -> STOP;

STATE USEFIRST ARG66 :
    MATCH "[dval_mv_size <= 0]" -> ASSUME {dval_mv_size == (-5);} GOTO ARG67;
    TRUE -> STOP;

STATE USEFIRST ARG67 :
    MATCH "continue;" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG68 :
    TRUE -> STOP;

END AUTOMATON
