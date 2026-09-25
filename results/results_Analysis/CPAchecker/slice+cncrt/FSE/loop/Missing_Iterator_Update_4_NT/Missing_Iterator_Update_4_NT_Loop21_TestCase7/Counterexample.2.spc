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
    MATCH "int mat_colSize = 2;" -> ASSUME {mat_colSize == (2);} GOTO ARG14;
    TRUE -> STOP;

STATE USEFIRST ARG14 :
    MATCH "int mat_rowSize = 5;" -> ASSUME {mat_rowSize == (5);} GOTO ARG15;
    TRUE -> STOP;

STATE USEFIRST ARG15 :
    MATCH "[!(mat_colSize < 0)]" -> ASSUME {mat_colSize == (2);} GOTO ARG20;
    TRUE -> STOP;

STATE USEFIRST ARG20 :
    MATCH "[!(mat_rowSize < 0)]" -> ASSUME {mat_rowSize == (5);} GOTO ARG25;
    TRUE -> STOP;

STATE USEFIRST ARG25 :
    MATCH "[!(mat_colSize > 65534)]" -> ASSUME {mat_colSize == (2);} GOTO ARG30;
    TRUE -> STOP;

STATE USEFIRST ARG30 :
    MATCH "[!(mat_rowSize > 65534)]" -> ASSUME {mat_rowSize == (5);} GOTO ARG35;
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
    MATCH "[x < mat_colSize]" -> ASSUME {x == (0);mat_colSize == (2);} GOTO ARG51;
    TRUE -> STOP;

STATE USEFIRST ARG51 :
    MATCH "y = 0;" -> ASSUME {y == (0);} GOTO ARG52;
    TRUE -> STOP;

STATE USEFIRST ARG52 :
    MATCH "" -> GOTO ARG55;
    TRUE -> STOP;

STATE USEFIRST ARG55 :
    MATCH "[y < mat_rowSize]" -> ASSUME {y == (0);mat_rowSize == (5);} GOTO ARG56;
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
    MATCH "[y < mat_rowSize]" -> ASSUME {y == (1);mat_rowSize == (5);} GOTO ARG61;
    TRUE -> STOP;

STATE USEFIRST ARG61 :
    MATCH "y ++;" -> ASSUME {__CPAchecker_TMP_0 == (1);} GOTO ARG62;
    TRUE -> STOP;

STATE USEFIRST ARG62 :
    MATCH "y ++;" -> ASSUME {y == (2);} GOTO ARG63;
    TRUE -> STOP;

STATE USEFIRST ARG63 :
    MATCH "y ++;" -> GOTO ARG72;
    TRUE -> STOP;

STATE USEFIRST ARG72 :
    MATCH "" -> GOTO ARG75;
    TRUE -> STOP;

STATE USEFIRST ARG75 :
    MATCH "[y < mat_rowSize]" -> ASSUME {y == (2);mat_rowSize == (5);} GOTO ARG83;
    TRUE -> STOP;

STATE USEFIRST ARG83 :
    MATCH "y ++;" -> ASSUME {__CPAchecker_TMP_0 == (2);} GOTO ARG84;
    TRUE -> STOP;

STATE USEFIRST ARG84 :
    MATCH "y ++;" -> ASSUME {y == (3);} GOTO ARG85;
    TRUE -> STOP;

STATE USEFIRST ARG85 :
    MATCH "y ++;" -> GOTO ARG86;
    TRUE -> STOP;

STATE USEFIRST ARG86 :
    MATCH "" -> GOTO ARG89;
    TRUE -> STOP;

STATE USEFIRST ARG89 :
    MATCH "[y < mat_rowSize]" -> ASSUME {y == (3);mat_rowSize == (5);} GOTO ARG94;
    TRUE -> STOP;

STATE USEFIRST ARG94 :
    MATCH "y ++;" -> ASSUME {__CPAchecker_TMP_0 == (3);} GOTO ARG95;
    TRUE -> STOP;

STATE USEFIRST ARG95 :
    MATCH "y ++;" -> ASSUME {y == (4);} GOTO ARG96;
    TRUE -> STOP;

STATE USEFIRST ARG96 :
    MATCH "y ++;" -> GOTO ARG97;
    TRUE -> STOP;

STATE USEFIRST ARG97 :
    MATCH "" -> GOTO ARG98;
    TRUE -> STOP;

STATE USEFIRST ARG98 :
    MATCH "[y < mat_rowSize]" -> ASSUME {y == (4);mat_rowSize == (5);} GOTO ARG99;
    TRUE -> STOP;

STATE USEFIRST ARG99 :
    MATCH "y ++;" -> ASSUME {__CPAchecker_TMP_0 == (4);} GOTO ARG100;
    TRUE -> STOP;

STATE USEFIRST ARG100 :
    MATCH "y ++;" -> ASSUME {y == (5);} GOTO ARG101;
    TRUE -> STOP;

STATE USEFIRST ARG101 :
    MATCH "y ++;" -> GOTO ARG102;
    TRUE -> STOP;

STATE USEFIRST ARG102 :
    MATCH "" -> GOTO ARG109;
    TRUE -> STOP;

STATE USEFIRST ARG109 :
    MATCH "[!(y < mat_rowSize)]" -> ASSUME {y == (5);mat_rowSize == (5);} GOTO ARG111;
    TRUE -> STOP;

STATE USEFIRST ARG111 :
    MATCH "" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG112 :
    TRUE -> STOP;

END AUTOMATON
