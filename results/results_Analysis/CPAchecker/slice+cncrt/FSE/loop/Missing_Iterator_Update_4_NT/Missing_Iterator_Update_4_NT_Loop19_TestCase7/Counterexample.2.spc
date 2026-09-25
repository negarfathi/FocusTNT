CONTROL AUTOMATON ErrorPath2

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
    MATCH "int x;" -> GOTO ARG10;
    TRUE -> STOP;

STATE USEFIRST ARG10 :
    MATCH "int mat_colSize = 2;" -> ASSUME {mat_colSize == (2);} GOTO ARG13;
    TRUE -> STOP;

STATE USEFIRST ARG13 :
    MATCH "int mat_rowSize = 5;" -> ASSUME {mat_rowSize == (5);} GOTO ARG14;
    TRUE -> STOP;

STATE USEFIRST ARG14 :
    MATCH "[!(mat_colSize < 0)]" -> ASSUME {mat_colSize == (2);} GOTO ARG31;
    TRUE -> STOP;

STATE USEFIRST ARG31 :
    MATCH "[!(mat_rowSize < 0)]" -> ASSUME {mat_rowSize == (5);} GOTO ARG34;
    TRUE -> STOP;

STATE USEFIRST ARG34 :
    MATCH "[!(mat_colSize > 65534)]" -> ASSUME {mat_colSize == (2);} GOTO ARG35;
    TRUE -> STOP;

STATE USEFIRST ARG35 :
    MATCH "[!(mat_rowSize > 65534)]" -> ASSUME {mat_rowSize == (5);} GOTO ARG37;
    TRUE -> STOP;

STATE USEFIRST ARG37 :
    MATCH "" -> GOTO ARG38;
    TRUE -> STOP;

STATE USEFIRST ARG38 :
    MATCH "x = 0;" -> ASSUME {x == (0);} GOTO ARG40;
    TRUE -> STOP;

STATE USEFIRST ARG40 :
    MATCH "" -> GOTO ARG41;
    TRUE -> STOP;

STATE USEFIRST ARG41 :
    MATCH "[x < mat_colSize]" -> ASSUME {x == (0);mat_colSize == (2);} GOTO ARG42;
    TRUE -> STOP;

STATE USEFIRST ARG42 :
    MATCH "" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG43 :
    TRUE -> STOP;

END AUTOMATON
