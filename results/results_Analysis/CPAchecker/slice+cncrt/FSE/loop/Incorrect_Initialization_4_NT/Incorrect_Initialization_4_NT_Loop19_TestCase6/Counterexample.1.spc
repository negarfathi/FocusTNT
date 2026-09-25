CONTROL AUTOMATON ErrorPath1

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
    MATCH "" -> GOTO ARG7;
    TRUE -> STOP;

STATE USEFIRST ARG7 :
    MATCH "int h = 6;" -> ASSUME {h == (6);} GOTO ARG11;
    TRUE -> STOP;

STATE USEFIRST ARG11 :
    MATCH "int hash = 9;" -> ASSUME {hash == (9);} GOTO ARG12;
    TRUE -> STOP;

STATE USEFIRST ARG12 :
    MATCH "int rehash = 3;" -> ASSUME {rehash == (3);} GOTO ARG16;
    TRUE -> STOP;

STATE USEFIRST ARG16 :
    MATCH "[!(h < 0 || hash <= 0 || rehash <= 0 || rehash > hash)]" -> ASSUME {h == (6);} GOTO ARG21;
    TRUE -> STOP;

STATE USEFIRST ARG21 :
    MATCH "[!(h < 0 || hash <= 0 || rehash <= 0 || rehash > hash)]" -> ASSUME {hash == (9);} GOTO ARG23;
    TRUE -> STOP;

STATE USEFIRST ARG23 :
    MATCH "[!(h < 0 || hash <= 0 || rehash <= 0 || rehash > hash)]" -> ASSUME {rehash == (3);} GOTO ARG29;
    TRUE -> STOP;

STATE USEFIRST ARG29 :
    MATCH "[!(h < 0 || hash <= 0 || rehash <= 0 || rehash > hash)]" -> ASSUME {rehash == (3);hash == (9);} GOTO ARG33;
    TRUE -> STOP;

STATE USEFIRST ARG33 :
    MATCH "int i = h % hash;" -> ASSUME {i == (6);} GOTO ARG37;
    TRUE -> STOP;

STATE USEFIRST ARG37 :
    MATCH "int r;" -> GOTO ARG38;
    TRUE -> STOP;

STATE USEFIRST ARG38 :
    MATCH "" -> GOTO ARG43;
    TRUE -> STOP;

STATE USEFIRST ARG43 :
    MATCH "[i < hash]" -> ASSUME {i == (6);hash == (9);} GOTO ARG44;
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
    MATCH "[i < hash]" -> ASSUME {hash == (9);} GOTO ARG66;
    TRUE -> STOP;

STATE USEFIRST ARG66 :
    MATCH "[!(!r)]" -> GOTO ARG78;
    TRUE -> STOP;

STATE USEFIRST ARG78 :
    MATCH "i += r;" -> GOTO ARG85;
    TRUE -> STOP;

STATE USEFIRST ARG85 :
    MATCH "" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG90 :
    TRUE -> STOP;

END AUTOMATON
