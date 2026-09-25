CONTROL AUTOMATON ErrorPath1

INITIAL STATE ARG0;

STATE USEFIRST ARG0 :
    MATCH "" -> GOTO ARG3;
    TRUE -> STOP;

STATE USEFIRST ARG3 :
    MATCH "extern int __VERIFIER_nondet_int(void);" -> GOTO ARG4;
    TRUE -> STOP;

STATE USEFIRST ARG4 :
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
    MATCH "" -> GOTO ARG19;
    TRUE -> STOP;

STATE USEFIRST ARG19 :
    MATCH "int __retres;" -> GOTO ARG20;
    TRUE -> STOP;

STATE USEFIRST ARG20 :
    MATCH "int i = 1;" -> ASSUME {i == (1);} GOTO ARG21;
    TRUE -> STOP;

STATE USEFIRST ARG21 :
    MATCH "flag ++;" -> ASSUME {__CPAchecker_TMP_0 == (0);} GOTO ARG26;
    TRUE -> STOP;

STATE USEFIRST ARG26 :
    MATCH "flag ++;" -> ASSUME {flag == (1);} GOTO ARG33;
    TRUE -> STOP;

STATE USEFIRST ARG33 :
    MATCH "flag ++;" -> GOTO ARG36;
    TRUE -> STOP;

STATE USEFIRST ARG36 :
    MATCH "[!(flag > 1000)]" -> ASSUME {flag == (1);} GOTO ARG41;
    TRUE -> STOP;

STATE USEFIRST ARG41 :
    MATCH "[i >= 0]" -> ASSUME {i == (1);} GOTO ARG43;
    TRUE -> STOP;

STATE USEFIRST ARG43 :
    MATCH "__retres = 0;" -> ASSUME {__retres == (0);} GOTO ARG44;
    TRUE -> STOP;

STATE USEFIRST ARG44 :
    MATCH "" -> GOTO ARG46;
    TRUE -> STOP;

STATE USEFIRST ARG46 :
    MATCH "return_label: return __retres;" -> GOTO ARG48;
    TRUE -> STOP;

STATE USEFIRST ARG48 :
    MATCH "return __retres;" -> GOTO ARG54;
    TRUE -> STOP;

STATE USEFIRST ARG54 :
    MATCH "" -> GOTO ARG58;
    TRUE -> STOP;

STATE USEFIRST ARG58 :
    MATCH "int dval_mv_size = -1;" -> ASSUME {dval_mv_size == (-1);} GOTO ARG62;
    TRUE -> STOP;

STATE USEFIRST ARG62 :
    MATCH "" -> GOTO ARG65;
    TRUE -> STOP;

STATE USEFIRST ARG65 :
    MATCH "[rc == 0]" -> ASSUME {rc == (0);} GOTO ARG66;
    TRUE -> STOP;

STATE USEFIRST ARG66 :
    MATCH "[dval_mv_size <= 0]" -> ASSUME {dval_mv_size == (-1);} GOTO ARG67;
    TRUE -> STOP;

STATE USEFIRST ARG67 :
    MATCH "continue;" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG68 :
    TRUE -> STOP;

END AUTOMATON
