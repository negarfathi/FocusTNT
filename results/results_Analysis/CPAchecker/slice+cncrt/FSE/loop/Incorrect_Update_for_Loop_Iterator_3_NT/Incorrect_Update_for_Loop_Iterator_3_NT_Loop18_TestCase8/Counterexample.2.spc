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
    MATCH "" -> GOTO ARG7;
    TRUE -> STOP;

STATE USEFIRST ARG7 :
    MATCH "int nfds = 2;" -> ASSUME {nfds == (2);} GOTO ARG12;
    TRUE -> STOP;

STATE USEFIRST ARG12 :
    MATCH "int nr = 200;" -> ASSUME {nr == (200);} GOTO ARG14;
    TRUE -> STOP;

STATE USEFIRST ARG14 :
    MATCH "int NR_OPEN = 100;" -> ASSUME {NR_OPEN == (100);} GOTO ARG15;
    TRUE -> STOP;

STATE USEFIRST ARG15 :
    MATCH "" -> GOTO ARG16;
    TRUE -> STOP;

STATE USEFIRST ARG16 :
    MATCH "[nfds <= nr]" -> ASSUME {nfds == (2);nr == (200);} GOTO ARG17;
    TRUE -> STOP;

STATE USEFIRST ARG17 :
    MATCH "nfds *= 2;" -> ASSUME {nfds == (4);} GOTO ARG18;
    TRUE -> STOP;

STATE USEFIRST ARG18 :
    MATCH "[!(nfds > NR_OPEN)]" -> ASSUME {nfds == (4);NR_OPEN == (100);} GOTO ARG19;
    TRUE -> STOP;

STATE USEFIRST ARG19 :
    MATCH "" -> GOTO ARG20;
    TRUE -> STOP;

STATE USEFIRST ARG20 :
    MATCH "[nfds <= nr]" -> ASSUME {nfds == (4);nr == (200);} GOTO ARG56;
    TRUE -> STOP;

STATE USEFIRST ARG56 :
    MATCH "nfds *= 2;" -> ASSUME {nfds == (8);} GOTO ARG61;
    TRUE -> STOP;

STATE USEFIRST ARG61 :
    MATCH "[!(nfds > NR_OPEN)]" -> ASSUME {nfds == (8);NR_OPEN == (100);} GOTO ARG63;
    TRUE -> STOP;

STATE USEFIRST ARG63 :
    MATCH "" -> GOTO ARG65;
    TRUE -> STOP;

STATE USEFIRST ARG65 :
    MATCH "[nfds <= nr]" -> ASSUME {nfds == (8);nr == (200);} GOTO ARG66;
    TRUE -> STOP;

STATE USEFIRST ARG66 :
    MATCH "nfds *= 2;" -> ASSUME {nfds == (16);} GOTO ARG67;
    TRUE -> STOP;

STATE USEFIRST ARG67 :
    MATCH "[!(nfds > NR_OPEN)]" -> ASSUME {nfds == (16);NR_OPEN == (100);} GOTO ARG68;
    TRUE -> STOP;

STATE USEFIRST ARG68 :
    MATCH "" -> GOTO ARG69;
    TRUE -> STOP;

STATE USEFIRST ARG69 :
    MATCH "[nfds <= nr]" -> ASSUME {nfds == (16);nr == (200);} GOTO ARG70;
    TRUE -> STOP;

STATE USEFIRST ARG70 :
    MATCH "nfds *= 2;" -> ASSUME {nfds == (32);} GOTO ARG71;
    TRUE -> STOP;

STATE USEFIRST ARG71 :
    MATCH "[!(nfds > NR_OPEN)]" -> ASSUME {nfds == (32);NR_OPEN == (100);} GOTO ARG79;
    TRUE -> STOP;

STATE USEFIRST ARG79 :
    MATCH "" -> GOTO ARG80;
    TRUE -> STOP;

STATE USEFIRST ARG80 :
    MATCH "[nfds <= nr]" -> ASSUME {nfds == (32);nr == (200);} GOTO ARG81;
    TRUE -> STOP;

STATE USEFIRST ARG81 :
    MATCH "nfds *= 2;" -> ASSUME {nfds == (64);} GOTO ARG82;
    TRUE -> STOP;

STATE USEFIRST ARG82 :
    MATCH "[!(nfds > NR_OPEN)]" -> ASSUME {nfds == (64);NR_OPEN == (100);} GOTO ARG83;
    TRUE -> STOP;

STATE USEFIRST ARG83 :
    MATCH "" -> GOTO ARG84;
    TRUE -> STOP;

STATE USEFIRST ARG84 :
    MATCH "[nfds <= nr]" -> ASSUME {nfds == (64);nr == (200);} GOTO ARG85;
    TRUE -> STOP;

STATE USEFIRST ARG85 :
    MATCH "nfds *= 2;" -> ASSUME {nfds == (128);} GOTO ARG86;
    TRUE -> STOP;

STATE USEFIRST ARG86 :
    MATCH "[nfds > NR_OPEN]" -> ASSUME {nfds == (128);NR_OPEN == (100);} GOTO ARG87;
    TRUE -> STOP;

STATE USEFIRST ARG87 :
    MATCH "nfds = NR_OPEN;" -> ASSUME {nfds == (100);} GOTO ARG88;
    TRUE -> STOP;

STATE USEFIRST ARG88 :
    MATCH "" -> GOTO ARG89;
    TRUE -> STOP;

STATE USEFIRST ARG89 :
    MATCH "" -> GOTO ARG90;
    TRUE -> STOP;

STATE USEFIRST ARG90 :
    MATCH "[nfds <= nr]" -> ASSUME {nfds == (100);nr == (200);} GOTO ARG91;
    TRUE -> STOP;

STATE USEFIRST ARG91 :
    MATCH "nfds *= 2;" -> ASSUME {nfds == (200);} GOTO ARG92;
    TRUE -> STOP;

STATE USEFIRST ARG92 :
    MATCH "[nfds > NR_OPEN]" -> ASSUME {nfds == (200);NR_OPEN == (100);} GOTO ARG93;
    TRUE -> STOP;

STATE USEFIRST ARG93 :
    MATCH "nfds = NR_OPEN;" -> ASSUME {nfds == (100);} GOTO ARG94;
    TRUE -> STOP;

STATE USEFIRST ARG94 :
    MATCH "" -> GOTO ARG95;
    TRUE -> STOP;

STATE USEFIRST ARG95 :
    MATCH "" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG96 :
    TRUE -> STOP;

END AUTOMATON
