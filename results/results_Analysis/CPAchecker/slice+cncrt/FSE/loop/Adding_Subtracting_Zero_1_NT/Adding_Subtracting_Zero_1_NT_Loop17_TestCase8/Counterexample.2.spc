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
    MATCH "int linesToRead = 0;" -> ASSUME {linesToRead == (0);} GOTO ARG11;
    TRUE -> STOP;

STATE USEFIRST ARG11 :
    MATCH "[!(linesToRead < 0)]" -> ASSUME {linesToRead == (0);} GOTO ARG19;
    TRUE -> STOP;

STATE USEFIRST ARG19 :
    MATCH "int h = 1;" -> ASSUME {h == (1);} GOTO ARG21;
    TRUE -> STOP;

STATE USEFIRST ARG21 :
    MATCH "" -> GOTO ARG22;
    TRUE -> STOP;

STATE USEFIRST ARG22 :
    MATCH "[h > 0]" -> ASSUME {h == (1);} GOTO ARG23;
    TRUE -> STOP;

STATE USEFIRST ARG23 :
    MATCH "[!(linesToRead > h)]" -> ASSUME {linesToRead == (0);h == (1);} GOTO ARG24;
    TRUE -> STOP;

STATE USEFIRST ARG24 :
    MATCH "h -= linesToRead;" -> ASSUME {h == (1);} GOTO ARG25;
    TRUE -> STOP;

STATE USEFIRST ARG25 :
    MATCH "" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG26 :
    TRUE -> STOP;

END AUTOMATON
