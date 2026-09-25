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
    MATCH "int mdb_cursor_get()" -> GOTO ARG12;
    TRUE -> STOP;

STATE USEFIRST ARG12 :
    MATCH "int main()" -> GOTO ARG13;
    TRUE -> STOP;

STATE USEFIRST ARG13 :
    MATCH "" -> GOTO ARG14;
    TRUE -> STOP;

STATE USEFIRST ARG14 :
    MATCH "int rc;" -> GOTO ARG17;
    TRUE -> STOP;

STATE USEFIRST ARG17 :
    MATCH "rc = mdb_cursor_get();" -> GOTO ARG18;
    TRUE -> STOP;

STATE USEFIRST ARG18 :
    MATCH "" -> GOTO ARG19;
    TRUE -> STOP;

STATE USEFIRST ARG19 :
    MATCH "int i = 0;" -> ASSUME {i == (0);} GOTO ARG20;
    TRUE -> STOP;

STATE USEFIRST ARG20 :
    MATCH "flag++;" -> ASSUME {__CPAchecker_TMP_0 == (0);} GOTO ARG21;
    TRUE -> STOP;

STATE USEFIRST ARG21 :
    MATCH "flag++;" -> ASSUME {flag == (1);} GOTO ARG30;
    TRUE -> STOP;

STATE USEFIRST ARG30 :
    MATCH "flag++;" -> GOTO ARG31;
    TRUE -> STOP;

STATE USEFIRST ARG31 :
    MATCH "[!(flag > 1000)]" -> ASSUME {flag == (1);} GOTO ARG37;
    TRUE -> STOP;

STATE USEFIRST ARG37 :
    MATCH "[i >= 0]" -> ASSUME {i == (0);} GOTO ARG41;
    TRUE -> STOP;

STATE USEFIRST ARG41 :
    MATCH "return 0;" -> GOTO ARG42;
    TRUE -> STOP;

STATE USEFIRST ARG42 :
    MATCH "" -> GOTO ARG47;
    TRUE -> STOP;

STATE USEFIRST ARG47 :
    MATCH "int dval_mv_size = 0;" -> ASSUME {dval_mv_size == (0);} GOTO ARG48;
    TRUE -> STOP;

STATE USEFIRST ARG48 :
    MATCH "" -> GOTO ARG51;
    TRUE -> STOP;

STATE USEFIRST ARG51 :
    MATCH "[rc == 0]" -> ASSUME {rc == (0);} GOTO ARG52;
    TRUE -> STOP;

STATE USEFIRST ARG52 :
    MATCH "[dval_mv_size <= 0]" -> ASSUME {dval_mv_size == (0);} GOTO ARG53;
    TRUE -> STOP;

STATE USEFIRST ARG53 :
    MATCH "continue;" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG54 :
    TRUE -> STOP;

END AUTOMATON
