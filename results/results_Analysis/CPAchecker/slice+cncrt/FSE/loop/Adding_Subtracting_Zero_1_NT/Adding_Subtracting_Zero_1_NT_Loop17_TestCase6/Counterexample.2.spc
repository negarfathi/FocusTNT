CONTROL AUTOMATON ErrorPath2

INITIAL STATE ARG0;

STATE USEFIRST ARG0 :
    MATCH "" -> GOTO ARG3;
    TRUE -> STOP;

STATE USEFIRST ARG3 :
    MATCH "extern int __VERIFIER_nondet_int(void);" -> GOTO ARG4;
    TRUE -> STOP;

STATE USEFIRST ARG4 :
    MATCH "void main(void)" -> GOTO ARG6;
    TRUE -> STOP;

STATE USEFIRST ARG6 :
    MATCH "" -> GOTO ARG8;
    TRUE -> STOP;

STATE USEFIRST ARG8 :
    MATCH "int linesToRead = 0;" -> ASSUME {linesToRead == (0);} GOTO ARG11;
    TRUE -> STOP;

STATE USEFIRST ARG11 :
    MATCH "[!(linesToRead < 0)]" -> ASSUME {linesToRead == (0);} GOTO ARG18;
    TRUE -> STOP;

STATE USEFIRST ARG18 :
    MATCH "int h = 5;" -> ASSUME {h == (5);} GOTO ARG20;
    TRUE -> STOP;

STATE USEFIRST ARG20 :
    MATCH "" -> GOTO ARG22;
    TRUE -> STOP;

STATE USEFIRST ARG22 :
    MATCH "[h > 0]" -> ASSUME {h == (5);} GOTO ARG23;
    TRUE -> STOP;

STATE USEFIRST ARG23 :
    MATCH "[!(linesToRead > h)]" -> ASSUME {linesToRead == (0);h == (5);} GOTO ARG24;
    TRUE -> STOP;

STATE USEFIRST ARG24 :
    MATCH "h -= linesToRead;" -> ASSUME {h == (5);} GOTO ARG25;
    TRUE -> STOP;

STATE USEFIRST ARG25 :
    MATCH "" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG26 :
    TRUE -> STOP;

END AUTOMATON
