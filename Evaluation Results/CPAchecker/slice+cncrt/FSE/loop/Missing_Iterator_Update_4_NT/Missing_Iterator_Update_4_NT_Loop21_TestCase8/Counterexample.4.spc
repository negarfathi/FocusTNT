CONTROL AUTOMATON ErrorPath4

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
    MATCH "int mat_colSize = 10;" -> ASSUME {mat_colSize == (10);} GOTO ARG14;
    TRUE -> STOP;

STATE USEFIRST ARG14 :
    MATCH "int mat_rowSize = 10;" -> ASSUME {mat_rowSize == (10);} GOTO ARG15;
    TRUE -> STOP;

STATE USEFIRST ARG15 :
    MATCH "[!(mat_colSize < 0)]" -> ASSUME {mat_colSize == (10);} GOTO ARG20;
    TRUE -> STOP;

STATE USEFIRST ARG20 :
    MATCH "[!(mat_rowSize < 0)]" -> ASSUME {mat_rowSize == (10);} GOTO ARG25;
    TRUE -> STOP;

STATE USEFIRST ARG25 :
    MATCH "[!(mat_colSize > 65534)]" -> ASSUME {mat_colSize == (10);} GOTO ARG34;
    TRUE -> STOP;

STATE USEFIRST ARG34 :
    MATCH "[!(mat_rowSize > 65534)]" -> ASSUME {mat_rowSize == (10);} GOTO ARG36;
    TRUE -> STOP;

STATE USEFIRST ARG36 :
    MATCH "" -> GOTO ARG38;
    TRUE -> STOP;

STATE USEFIRST ARG38 :
    MATCH "x = 0;" -> ASSUME {x == (0);} GOTO ARG41;
    TRUE -> STOP;

STATE USEFIRST ARG41 :
    MATCH "" -> GOTO ARG50;
    TRUE -> STOP;

STATE USEFIRST ARG50 :
    MATCH "[x < mat_colSize]" -> ASSUME {x == (0);mat_colSize == (10);} GOTO ARG51;
    TRUE -> STOP;

STATE USEFIRST ARG51 :
    MATCH "y = 0;" -> ASSUME {y == (0);} GOTO ARG52;
    TRUE -> STOP;

STATE USEFIRST ARG52 :
    MATCH "" -> GOTO ARG55;
    TRUE -> STOP;

STATE USEFIRST ARG55 :
    MATCH "[y < mat_rowSize]" -> ASSUME {y == (0);mat_rowSize == (10);} GOTO ARG56;
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
    MATCH "[y < mat_rowSize]" -> ASSUME {y == (1);mat_rowSize == (10);} GOTO ARG61;
    TRUE -> STOP;

STATE USEFIRST ARG61 :
    MATCH "y ++;" -> ASSUME {__CPAchecker_TMP_0 == (1);} GOTO ARG62;
    TRUE -> STOP;

STATE USEFIRST ARG62 :
    MATCH "y ++;" -> ASSUME {y == (2);} GOTO ARG71;
    TRUE -> STOP;

STATE USEFIRST ARG71 :
    MATCH "y ++;" -> GOTO ARG72;
    TRUE -> STOP;

STATE USEFIRST ARG72 :
    MATCH "" -> GOTO ARG81;
    TRUE -> STOP;

STATE USEFIRST ARG81 :
    MATCH "[y < mat_rowSize]" -> ASSUME {y == (2);mat_rowSize == (10);} GOTO ARG83;
    TRUE -> STOP;

STATE USEFIRST ARG83 :
    MATCH "y ++;" -> ASSUME {__CPAchecker_TMP_0 == (2);} GOTO ARG84;
    TRUE -> STOP;

STATE USEFIRST ARG84 :
    MATCH "y ++;" -> ASSUME {y == (3);} GOTO ARG87;
    TRUE -> STOP;

STATE USEFIRST ARG87 :
    MATCH "y ++;" -> GOTO ARG88;
    TRUE -> STOP;

STATE USEFIRST ARG88 :
    MATCH "" -> GOTO ARG93;
    TRUE -> STOP;

STATE USEFIRST ARG93 :
    MATCH "[y < mat_rowSize]" -> ASSUME {y == (3);mat_rowSize == (10);} GOTO ARG94;
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
    MATCH "[y < mat_rowSize]" -> ASSUME {y == (4);mat_rowSize == (10);} GOTO ARG106;
    TRUE -> STOP;

STATE USEFIRST ARG106 :
    MATCH "y ++;" -> ASSUME {__CPAchecker_TMP_0 == (4);} GOTO ARG107;
    TRUE -> STOP;

STATE USEFIRST ARG107 :
    MATCH "y ++;" -> ASSUME {y == (5);} GOTO ARG108;
    TRUE -> STOP;

STATE USEFIRST ARG108 :
    MATCH "y ++;" -> GOTO ARG109;
    TRUE -> STOP;

STATE USEFIRST ARG109 :
    MATCH "" -> GOTO ARG110;
    TRUE -> STOP;

STATE USEFIRST ARG110 :
    MATCH "[y < mat_rowSize]" -> ASSUME {y == (5);mat_rowSize == (10);} GOTO ARG111;
    TRUE -> STOP;

STATE USEFIRST ARG111 :
    MATCH "y ++;" -> ASSUME {__CPAchecker_TMP_0 == (5);} GOTO ARG112;
    TRUE -> STOP;

STATE USEFIRST ARG112 :
    MATCH "y ++;" -> ASSUME {y == (6);} GOTO ARG113;
    TRUE -> STOP;

STATE USEFIRST ARG113 :
    MATCH "y ++;" -> GOTO ARG114;
    TRUE -> STOP;

STATE USEFIRST ARG114 :
    MATCH "" -> GOTO ARG115;
    TRUE -> STOP;

STATE USEFIRST ARG115 :
    MATCH "[y < mat_rowSize]" -> ASSUME {y == (6);mat_rowSize == (10);} GOTO ARG116;
    TRUE -> STOP;

STATE USEFIRST ARG116 :
    MATCH "y ++;" -> ASSUME {__CPAchecker_TMP_0 == (6);} GOTO ARG117;
    TRUE -> STOP;

STATE USEFIRST ARG117 :
    MATCH "y ++;" -> ASSUME {y == (7);} GOTO ARG118;
    TRUE -> STOP;

STATE USEFIRST ARG118 :
    MATCH "y ++;" -> GOTO ARG119;
    TRUE -> STOP;

STATE USEFIRST ARG119 :
    MATCH "" -> GOTO ARG120;
    TRUE -> STOP;

STATE USEFIRST ARG120 :
    MATCH "[y < mat_rowSize]" -> ASSUME {y == (7);mat_rowSize == (10);} GOTO ARG121;
    TRUE -> STOP;

STATE USEFIRST ARG121 :
    MATCH "y ++;" -> ASSUME {__CPAchecker_TMP_0 == (7);} GOTO ARG122;
    TRUE -> STOP;

STATE USEFIRST ARG122 :
    MATCH "y ++;" -> ASSUME {y == (8);} GOTO ARG123;
    TRUE -> STOP;

STATE USEFIRST ARG123 :
    MATCH "y ++;" -> GOTO ARG124;
    TRUE -> STOP;

STATE USEFIRST ARG124 :
    MATCH "" -> GOTO ARG125;
    TRUE -> STOP;

STATE USEFIRST ARG125 :
    MATCH "[y < mat_rowSize]" -> ASSUME {y == (8);mat_rowSize == (10);} GOTO ARG126;
    TRUE -> STOP;

STATE USEFIRST ARG126 :
    MATCH "y ++;" -> ASSUME {__CPAchecker_TMP_0 == (8);} GOTO ARG127;
    TRUE -> STOP;

STATE USEFIRST ARG127 :
    MATCH "y ++;" -> ASSUME {y == (9);} GOTO ARG128;
    TRUE -> STOP;

STATE USEFIRST ARG128 :
    MATCH "y ++;" -> GOTO ARG129;
    TRUE -> STOP;

STATE USEFIRST ARG129 :
    MATCH "" -> GOTO ARG130;
    TRUE -> STOP;

STATE USEFIRST ARG130 :
    MATCH "[y < mat_rowSize]" -> ASSUME {y == (9);mat_rowSize == (10);} GOTO ARG131;
    TRUE -> STOP;

STATE USEFIRST ARG131 :
    MATCH "y ++;" -> ASSUME {__CPAchecker_TMP_0 == (9);} GOTO ARG132;
    TRUE -> STOP;

STATE USEFIRST ARG132 :
    MATCH "y ++;" -> ASSUME {y == (10);} GOTO ARG133;
    TRUE -> STOP;

STATE USEFIRST ARG133 :
    MATCH "y ++;" -> GOTO ARG134;
    TRUE -> STOP;

STATE USEFIRST ARG134 :
    MATCH "" -> GOTO ARG135;
    TRUE -> STOP;

STATE USEFIRST ARG135 :
    MATCH "[!(y < mat_rowSize)]" -> ASSUME {y == (10);mat_rowSize == (10);} GOTO ARG137;
    TRUE -> STOP;

STATE USEFIRST ARG137 :
    MATCH "" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG138 :
    TRUE -> STOP;

END AUTOMATON
