CONTROL AUTOMATON ErrorPath2

INITIAL STATE ARG0;

STATE USEFIRST ARG0 :
    MATCH "" -> GOTO ARG3;
    TRUE -> STOP;

STATE USEFIRST ARG3 :
    MATCH "extern int __VERIFIER_nondet_int(void);" -> GOTO ARG5;
    TRUE -> STOP;

STATE USEFIRST ARG5 :
    MATCH "int errno;" -> ASSUME {errno == (0);} GOTO ARG11;
    TRUE -> STOP;

STATE USEFIRST ARG11 :
    MATCH "int waitpid()" -> GOTO ARG12;
    TRUE -> STOP;

STATE USEFIRST ARG12 :
    MATCH "int main()" -> GOTO ARG13;
    TRUE -> STOP;

STATE USEFIRST ARG13 :
    MATCH "" -> GOTO ARG14;
    TRUE -> STOP;

STATE USEFIRST ARG14 :
    MATCH "int ret = waitpid();" -> GOTO ARG15;
    TRUE -> STOP;

STATE USEFIRST ARG15 :
    MATCH "int ret = waitpid();" -> GOTO ARG16;
    TRUE -> STOP;

STATE USEFIRST ARG16 :
    MATCH "" -> GOTO ARG17;
    TRUE -> STOP;

STATE USEFIRST ARG17 :
    MATCH "int num = __VERIFIER_nondet_int();" -> GOTO ARG20;
    TRUE -> STOP;

STATE USEFIRST ARG20 :
    MATCH "int num = __VERIFIER_nondet_int();" -> GOTO ARG25;
    TRUE -> STOP;

STATE USEFIRST ARG25 :
    MATCH "" -> GOTO ARG28;
    TRUE -> STOP;

STATE USEFIRST ARG28 :
    MATCH "[!(num < 0)]" -> GOTO ARG40;
    TRUE -> STOP;

STATE USEFIRST ARG40 :
    MATCH "return num;" -> GOTO ARG42;
    TRUE -> STOP;

STATE USEFIRST ARG42 :
    MATCH "" -> GOTO ARG52;
    TRUE -> STOP;

STATE USEFIRST ARG52 :
    MATCH "again:\n    if( ret == 0 )\n    {\n        ret = waitpid();\n    }" -> GOTO ARG56;
    TRUE -> STOP;

STATE USEFIRST ARG56 :
    MATCH "[ret == 0]" -> ASSUME {ret == (0);} GOTO ARG57;
    TRUE -> STOP;

STATE USEFIRST ARG57 :
    MATCH "ret = waitpid();" -> GOTO ARG70;
    TRUE -> STOP;

STATE USEFIRST ARG70 :
    MATCH "" -> GOTO ARG71;
    TRUE -> STOP;

STATE USEFIRST ARG71 :
    MATCH "int num = __VERIFIER_nondet_int();" -> GOTO ARG72;
    TRUE -> STOP;

STATE USEFIRST ARG72 :
    MATCH "int num = __VERIFIER_nondet_int();" -> GOTO ARG73;
    TRUE -> STOP;

STATE USEFIRST ARG73 :
    MATCH "" -> GOTO ARG74;
    TRUE -> STOP;

STATE USEFIRST ARG74 :
    MATCH "[num < 0]" -> GOTO ARG75;
    TRUE -> STOP;

STATE USEFIRST ARG75 :
    MATCH "__VERIFIER_nondet_int() && errno != 1" -> GOTO ARG101;
    TRUE -> STOP;

STATE USEFIRST ARG101 :
    MATCH "__VERIFIER_nondet_int() && errno != 1" -> GOTO ARG108;
    TRUE -> STOP;

STATE USEFIRST ARG108 :
    MATCH "[__VERIFIER_nondet_int() && errno != 1]" -> ASSUME {__CPAchecker_TMP_0 == (1);} GOTO ARG112;
    TRUE -> STOP;

STATE USEFIRST ARG112 :
    MATCH "[__VERIFIER_nondet_int() && errno != 1]" -> ASSUME {errno == (0);} GOTO ARG115;
    TRUE -> STOP;

STATE USEFIRST ARG115 :
    MATCH "errno = 1;" -> ASSUME {errno == (1);} GOTO ARG122;
    TRUE -> STOP;

STATE USEFIRST ARG122 :
    MATCH "" -> GOTO ARG123;
    TRUE -> STOP;

STATE USEFIRST ARG123 :
    MATCH "return num;" -> GOTO ARG126;
    TRUE -> STOP;

STATE USEFIRST ARG126 :
    MATCH "" -> GOTO ARG131;
    TRUE -> STOP;

STATE USEFIRST ARG131 :
    MATCH "" -> GOTO ARG136;
    TRUE -> STOP;

STATE USEFIRST ARG136 :
    MATCH "[ret < 0]" -> GOTO ARG140;
    TRUE -> STOP;

STATE USEFIRST ARG140 :
    MATCH "[errno == 1]" -> ASSUME {errno == (1);} GOTO ARG153;
    TRUE -> STOP;

STATE USEFIRST ARG153 :
    MATCH "goto again;" -> GOTO ARG158;
    TRUE -> STOP;

STATE USEFIRST ARG158 :
    MATCH "[!(ret == 0)]" -> GOTO ARG210;
    TRUE -> STOP;

STATE USEFIRST ARG210 :
    MATCH "[ret < 0]" -> GOTO ARG216;
    TRUE -> STOP;

STATE USEFIRST ARG216 :
    MATCH "[errno == 1]" -> ASSUME {errno == (1);} GOTO ARG222;
    TRUE -> STOP;

STATE USEFIRST ARG222 :
    MATCH "goto again;" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG223 :
    TRUE -> STOP;

END AUTOMATON
