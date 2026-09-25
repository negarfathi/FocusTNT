CONTROL AUTOMATON ErrorPath1

INITIAL STATE ARG0;

STATE USEFIRST ARG0 :
    MATCH "" -> GOTO ARG3;
    TRUE -> STOP;

STATE USEFIRST ARG3 :
    MATCH "extern int __VERIFIER_nondet_int(void);" -> GOTO ARG4;
    TRUE -> STOP;

STATE USEFIRST ARG4 :
    MATCH "int errno;" -> ASSUME {errno == (0);} GOTO ARG11;
    TRUE -> STOP;

STATE USEFIRST ARG11 :
    MATCH "int waitpid()" -> GOTO ARG14;
    TRUE -> STOP;

STATE USEFIRST ARG14 :
    MATCH "int main()" -> GOTO ARG15;
    TRUE -> STOP;

STATE USEFIRST ARG15 :
    MATCH "" -> GOTO ARG16;
    TRUE -> STOP;

STATE USEFIRST ARG16 :
    MATCH "int ret = waitpid();" -> GOTO ARG17;
    TRUE -> STOP;

STATE USEFIRST ARG17 :
    MATCH "int ret = waitpid();" -> GOTO ARG18;
    TRUE -> STOP;

STATE USEFIRST ARG18 :
    MATCH "" -> GOTO ARG19;
    TRUE -> STOP;

STATE USEFIRST ARG19 :
    MATCH "int num = -1;" -> ASSUME {num == (-1);} GOTO ARG20;
    TRUE -> STOP;

STATE USEFIRST ARG20 :
    MATCH "" -> GOTO ARG37;
    TRUE -> STOP;

STATE USEFIRST ARG37 :
    MATCH "[num < 0]" -> ASSUME {num == (-1);} GOTO ARG43;
    TRUE -> STOP;

STATE USEFIRST ARG43 :
    MATCH "1 && errno != 1" -> GOTO ARG44;
    TRUE -> STOP;

STATE USEFIRST ARG44 :
    MATCH "[1 && errno != 1]" -> ASSUME {errno == (0);} GOTO ARG48;
    TRUE -> STOP;

STATE USEFIRST ARG48 :
    MATCH "errno = 1;" -> ASSUME {errno == (1);} GOTO ARG49;
    TRUE -> STOP;

STATE USEFIRST ARG49 :
    MATCH "" -> GOTO ARG51;
    TRUE -> STOP;

STATE USEFIRST ARG51 :
    MATCH "return num;" -> GOTO ARG53;
    TRUE -> STOP;

STATE USEFIRST ARG53 :
    MATCH "" -> GOTO ARG55;
    TRUE -> STOP;

STATE USEFIRST ARG55 :
    MATCH "again:\n    if( ret == 0 )\n    {\n        ret = waitpid();\n    }" -> GOTO ARG57;
    TRUE -> STOP;

STATE USEFIRST ARG57 :
    MATCH "[!(ret == 0)]" -> ASSUME {ret == (-1);} GOTO ARG58;
    TRUE -> STOP;

STATE USEFIRST ARG58 :
    MATCH "[ret < 0]" -> ASSUME {ret == (-1);} GOTO ARG59;
    TRUE -> STOP;

STATE USEFIRST ARG59 :
    MATCH "[errno == 1]" -> ASSUME {errno == (1);} GOTO ARG60;
    TRUE -> STOP;

STATE USEFIRST ARG60 :
    MATCH "goto again;" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG61 :
    TRUE -> STOP;

END AUTOMATON
