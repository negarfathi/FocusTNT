CONTROL AUTOMATON ErrorPath1

INITIAL STATE ARG0;

STATE USEFIRST ARG0 :
    MATCH "" -> GOTO ARG3;
    TRUE -> STOP;

STATE USEFIRST ARG3 :
    MATCH "extern int __VERIFIER_nondet_int(void);" -> GOTO ARG6;
    TRUE -> STOP;

STATE USEFIRST ARG6 :
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
    MATCH "int rc;" -> GOTO ARG15;
    TRUE -> STOP;

STATE USEFIRST ARG15 :
    MATCH "rc = mdb_cursor_get();" -> GOTO ARG16;
    TRUE -> STOP;

STATE USEFIRST ARG16 :
    MATCH "" -> GOTO ARG19;
    TRUE -> STOP;

STATE USEFIRST ARG19 :
    MATCH "int i = 5;" -> ASSUME {i == (5);} GOTO ARG20;
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
    MATCH "[!(flag > 1000)]" -> ASSUME {flag == (1);} GOTO ARG36;
    TRUE -> STOP;

STATE USEFIRST ARG36 :
    MATCH "[i >= 0]" -> ASSUME {i == (5);} GOTO ARG38;
    TRUE -> STOP;

STATE USEFIRST ARG38 :
    MATCH "return 0;" -> GOTO ARG39;
    TRUE -> STOP;

STATE USEFIRST ARG39 :
    MATCH "" -> GOTO ARG43;
    TRUE -> STOP;

STATE USEFIRST ARG43 :
    MATCH "int dval_mv_size = -5;" -> ASSUME {dval_mv_size == (-5);} GOTO ARG47;
    TRUE -> STOP;

STATE USEFIRST ARG47 :
    MATCH "" -> GOTO ARG51;
    TRUE -> STOP;

STATE USEFIRST ARG51 :
    MATCH "[rc == 0]" -> ASSUME {rc == (0);} GOTO ARG52;
    TRUE -> STOP;

STATE USEFIRST ARG52 :
    MATCH "[dval_mv_size <= 0]" -> ASSUME {dval_mv_size == (-5);} GOTO ARG53;
    TRUE -> STOP;

STATE USEFIRST ARG53 :
    MATCH "continue;" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG54 :
    TRUE -> STOP;

END AUTOMATON
