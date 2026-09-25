CONTROL AUTOMATON ErrorPath1

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
    MATCH "rc = mdb_cursor_get_slice_1();" -> GOTO ARG18;
    TRUE -> STOP;

STATE USEFIRST ARG18 :
    MATCH "" -> GOTO ARG19;
    TRUE -> STOP;

STATE USEFIRST ARG19 :
    MATCH "int __retres;" -> GOTO ARG20;
    TRUE -> STOP;

STATE USEFIRST ARG20 :
    MATCH "int i = 0;" -> ASSUME {i == (0);} GOTO ARG24;
    TRUE -> STOP;

STATE USEFIRST ARG24 :
    MATCH "flag ++;" -> ASSUME {__CPAchecker_TMP_0 == (0);} GOTO ARG30;
    TRUE -> STOP;

STATE USEFIRST ARG30 :
    MATCH "flag ++;" -> ASSUME {flag == (1);} GOTO ARG37;
    TRUE -> STOP;

STATE USEFIRST ARG37 :
    MATCH "flag ++;" -> GOTO ARG40;
    TRUE -> STOP;

STATE USEFIRST ARG40 :
    MATCH "[!(flag > 1000)]" -> ASSUME {flag == (1);} GOTO ARG42;
    TRUE -> STOP;

STATE USEFIRST ARG42 :
    MATCH "[i >= 0]" -> ASSUME {i == (0);} GOTO ARG45;
    TRUE -> STOP;

STATE USEFIRST ARG45 :
    MATCH "__retres = 0;" -> ASSUME {__retres == (0);} GOTO ARG51;
    TRUE -> STOP;

STATE USEFIRST ARG51 :
    MATCH "" -> GOTO ARG52;
    TRUE -> STOP;

STATE USEFIRST ARG52 :
    MATCH "return_label: return __retres;" -> GOTO ARG53;
    TRUE -> STOP;

STATE USEFIRST ARG53 :
    MATCH "return __retres;" -> GOTO ARG56;
    TRUE -> STOP;

STATE USEFIRST ARG56 :
    MATCH "" -> GOTO ARG59;
    TRUE -> STOP;

STATE USEFIRST ARG59 :
    MATCH "int dval_mv_size = 0;" -> ASSUME {dval_mv_size == (0);} GOTO ARG62;
    TRUE -> STOP;

STATE USEFIRST ARG62 :
    MATCH "" -> GOTO ARG65;
    TRUE -> STOP;

STATE USEFIRST ARG65 :
    MATCH "[rc == 0]" -> ASSUME {rc == (0);} GOTO ARG66;
    TRUE -> STOP;

STATE USEFIRST ARG66 :
    MATCH "[dval_mv_size <= 0]" -> ASSUME {dval_mv_size == (0);} GOTO ARG67;
    TRUE -> STOP;

STATE USEFIRST ARG67 :
    MATCH "continue;" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG68 :
    TRUE -> STOP;

END AUTOMATON
