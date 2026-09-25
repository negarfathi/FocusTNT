CONTROL AUTOMATON ErrorPath1

INITIAL STATE ARG0;

STATE USEFIRST ARG0 :
    MATCH "" -> GOTO ARG3;
    TRUE -> STOP;

STATE USEFIRST ARG3 :
    MATCH "extern int __VERIFIER_nondet_int(void);" -> GOTO ARG4;
    TRUE -> STOP;

STATE USEFIRST ARG4 :
    MATCH "void main(void)" -> GOTO ARG7;
    TRUE -> STOP;

STATE USEFIRST ARG7 :
    MATCH "" -> GOTO ARG8;
    TRUE -> STOP;

STATE USEFIRST ARG8 :
    MATCH "int __retres;" -> GOTO ARG9;
    TRUE -> STOP;

STATE USEFIRST ARG9 :
    MATCH "int x;" -> GOTO ARG10;
    TRUE -> STOP;

STATE USEFIRST ARG10 :
    MATCH "int y;" -> GOTO ARG11;
    TRUE -> STOP;

STATE USEFIRST ARG11 :
    MATCH "int mat_colSize = 1;" -> ASSUME {mat_colSize == (1);} GOTO ARG14;
    TRUE -> STOP;

STATE USEFIRST ARG14 :
    MATCH "int mat_rowSize = 1;" -> ASSUME {mat_rowSize == (1);} GOTO ARG15;
    TRUE -> STOP;

STATE USEFIRST ARG15 :
    MATCH "[!(mat_colSize < 0)]" -> ASSUME {mat_colSize == (1);} GOTO ARG24;
    TRUE -> STOP;

STATE USEFIRST ARG24 :
    MATCH "[!(mat_rowSize < 0)]" -> ASSUME {mat_rowSize == (1);} GOTO ARG25;
    TRUE -> STOP;

STATE USEFIRST ARG25 :
    MATCH "[!(mat_colSize > 65534)]" -> ASSUME {mat_colSize == (1);} GOTO ARG34;
    TRUE -> STOP;

STATE USEFIRST ARG34 :
    MATCH "[!(mat_rowSize > 65534)]" -> ASSUME {mat_rowSize == (1);} GOTO ARG35;
    TRUE -> STOP;

STATE USEFIRST ARG35 :
    MATCH "" -> GOTO ARG38;
    TRUE -> STOP;

STATE USEFIRST ARG38 :
    MATCH "x = 0;" -> ASSUME {x == (0);} GOTO ARG40;
    TRUE -> STOP;

STATE USEFIRST ARG40 :
    MATCH "" -> GOTO ARG50;
    TRUE -> STOP;

STATE USEFIRST ARG50 :
    MATCH "[x < mat_colSize]" -> ASSUME {x == (0);mat_colSize == (1);} GOTO ARG51;
    TRUE -> STOP;

STATE USEFIRST ARG51 :
    MATCH "y = 0;" -> ASSUME {y == (0);} GOTO ARG52;
    TRUE -> STOP;

STATE USEFIRST ARG52 :
    MATCH "" -> GOTO ARG55;
    TRUE -> STOP;

STATE USEFIRST ARG55 :
    MATCH "[y < mat_rowSize]" -> ASSUME {y == (0);mat_rowSize == (1);} GOTO ARG56;
    TRUE -> STOP;

STATE USEFIRST ARG56 :
    MATCH "y ++;" -> ASSUME {__CPAchecker_TMP_0 == (0);} GOTO ARG57;
    TRUE -> STOP;

STATE USEFIRST ARG57 :
    MATCH "y ++;" -> ASSUME {y == (1);} GOTO ARG58;
    TRUE -> STOP;

STATE USEFIRST ARG58 :
    MATCH "y ++;" -> GOTO ARG59;
    TRUE -> STOP;

STATE USEFIRST ARG59 :
    MATCH "" -> GOTO ARG60;
    TRUE -> STOP;

STATE USEFIRST ARG60 :
    MATCH "[!(y < mat_rowSize)]" -> ASSUME {y == (1);mat_rowSize == (1);} GOTO ARG61;
    TRUE -> STOP;

STATE USEFIRST ARG61 :
    MATCH "" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG62 :
    TRUE -> STOP;

END AUTOMATON
