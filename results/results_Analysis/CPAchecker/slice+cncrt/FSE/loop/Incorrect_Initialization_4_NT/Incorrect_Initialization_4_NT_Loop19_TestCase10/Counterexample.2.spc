CONTROL AUTOMATON ErrorPath2

INITIAL STATE ARG0;

STATE USEFIRST ARG0 :
    MATCH "" -> GOTO ARG3;
    TRUE -> STOP;

STATE USEFIRST ARG3 :
    MATCH "extern int __VERIFIER_nondet_int(void);" -> GOTO ARG4;
    TRUE -> STOP;

STATE USEFIRST ARG4 :
    MATCH "int main()" -> GOTO ARG5;
    TRUE -> STOP;

STATE USEFIRST ARG5 :
    MATCH "" -> GOTO ARG8;
    TRUE -> STOP;

STATE USEFIRST ARG8 :
    MATCH "int h = 10;" -> ASSUME {h == (10);} GOTO ARG11;
    TRUE -> STOP;

STATE USEFIRST ARG11 :
    MATCH "int hash = 15;" -> ASSUME {hash == (15);} GOTO ARG12;
    TRUE -> STOP;

STATE USEFIRST ARG12 :
    MATCH "int rehash = 5;" -> ASSUME {rehash == (5);} GOTO ARG17;
    TRUE -> STOP;

STATE USEFIRST ARG17 :
    MATCH "[!(h < 0 || hash <= 0 || rehash <= 0 || rehash > hash)]" -> ASSUME {h == (10);} GOTO ARG21;
    TRUE -> STOP;

STATE USEFIRST ARG21 :
    MATCH "[!(h < 0 || hash <= 0 || rehash <= 0 || rehash > hash)]" -> ASSUME {hash == (15);} GOTO ARG24;
    TRUE -> STOP;

STATE USEFIRST ARG24 :
    MATCH "[!(h < 0 || hash <= 0 || rehash <= 0 || rehash > hash)]" -> ASSUME {rehash == (5);} GOTO ARG30;
    TRUE -> STOP;

STATE USEFIRST ARG30 :
    MATCH "[!(h < 0 || hash <= 0 || rehash <= 0 || rehash > hash)]" -> ASSUME {rehash == (5);hash == (15);} GOTO ARG33;
    TRUE -> STOP;

STATE USEFIRST ARG33 :
    MATCH "int i = h % hash;" -> ASSUME {i == (10);} GOTO ARG37;
    TRUE -> STOP;

STATE USEFIRST ARG37 :
    MATCH "int r;" -> GOTO ARG38;
    TRUE -> STOP;

STATE USEFIRST ARG38 :
    MATCH "" -> GOTO ARG43;
    TRUE -> STOP;

STATE USEFIRST ARG43 :
    MATCH "[i < hash]" -> ASSUME {i == (10);hash == (15);} GOTO ARG44;
    TRUE -> STOP;

STATE USEFIRST ARG44 :
    MATCH "[!(!r)]" -> GOTO ARG46;
    TRUE -> STOP;

STATE USEFIRST ARG46 :
    MATCH "i += r;" -> GOTO ARG47;
    TRUE -> STOP;

STATE USEFIRST ARG47 :
    MATCH "" -> GOTO ARG48;
    TRUE -> STOP;

STATE USEFIRST ARG48 :
    MATCH "[i < hash]" -> ASSUME {hash == (15);} GOTO ARG70;
    TRUE -> STOP;

STATE USEFIRST ARG70 :
    MATCH "[!(!r)]" -> GOTO ARG80;
    TRUE -> STOP;

STATE USEFIRST ARG80 :
    MATCH "i += r;" -> GOTO ARG86;
    TRUE -> STOP;

STATE USEFIRST ARG86 :
    MATCH "" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG90 :
    TRUE -> STOP;

END AUTOMATON
