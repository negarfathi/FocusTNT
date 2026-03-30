CONTROL AUTOMATON ErrorPath2

INITIAL STATE ARG0;

STATE USEFIRST ARG0 :
    MATCH "" -> GOTO ARG3;
    TRUE -> STOP;

STATE USEFIRST ARG3 :
    MATCH "extern int __VERIFIER_nondet_int(void);" -> GOTO ARG4;
    TRUE -> STOP;

STATE USEFIRST ARG4 :
    MATCH "int main()" -> GOTO ARG7;
    TRUE -> STOP;

STATE USEFIRST ARG7 :
    MATCH "" -> GOTO ARG8;
    TRUE -> STOP;

STATE USEFIRST ARG8 :
    MATCH "int nfds = 10;" -> ASSUME {nfds == (10);} GOTO ARG12;
    TRUE -> STOP;

STATE USEFIRST ARG12 :
    MATCH "int nr = 500;" -> ASSUME {nr == (500);} GOTO ARG14;
    TRUE -> STOP;

STATE USEFIRST ARG14 :
    MATCH "int NR_OPEN = 250;" -> ASSUME {NR_OPEN == (250);} GOTO ARG15;
    TRUE -> STOP;

STATE USEFIRST ARG15 :
    MATCH "" -> GOTO ARG16;
    TRUE -> STOP;

STATE USEFIRST ARG16 :
    MATCH "[nfds <= nr]" -> ASSUME {nfds == (10);nr == (500);} GOTO ARG17;
    TRUE -> STOP;

STATE USEFIRST ARG17 :
    MATCH "nfds = nfds * 2;" -> ASSUME {nfds == (20);} GOTO ARG18;
    TRUE -> STOP;

STATE USEFIRST ARG18 :
    MATCH "[!(nfds > NR_OPEN)]" -> ASSUME {nfds == (20);NR_OPEN == (250);} GOTO ARG19;
    TRUE -> STOP;

STATE USEFIRST ARG19 :
    MATCH "" -> GOTO ARG20;
    TRUE -> STOP;

STATE USEFIRST ARG20 :
    MATCH "[nfds <= nr]" -> ASSUME {nfds == (20);nr == (500);} GOTO ARG49;
    TRUE -> STOP;

STATE USEFIRST ARG49 :
    MATCH "nfds = nfds * 2;" -> ASSUME {nfds == (40);} GOTO ARG53;
    TRUE -> STOP;

STATE USEFIRST ARG53 :
    MATCH "[!(nfds > NR_OPEN)]" -> ASSUME {nfds == (40);NR_OPEN == (250);} GOTO ARG55;
    TRUE -> STOP;

STATE USEFIRST ARG55 :
    MATCH "" -> GOTO ARG59;
    TRUE -> STOP;

STATE USEFIRST ARG59 :
    MATCH "[nfds <= nr]" -> ASSUME {nfds == (40);nr == (500);} GOTO ARG66;
    TRUE -> STOP;

STATE USEFIRST ARG66 :
    MATCH "nfds = nfds * 2;" -> ASSUME {nfds == (80);} GOTO ARG67;
    TRUE -> STOP;

STATE USEFIRST ARG67 :
    MATCH "[!(nfds > NR_OPEN)]" -> ASSUME {nfds == (80);NR_OPEN == (250);} GOTO ARG68;
    TRUE -> STOP;

STATE USEFIRST ARG68 :
    MATCH "" -> GOTO ARG69;
    TRUE -> STOP;

STATE USEFIRST ARG69 :
    MATCH "[nfds <= nr]" -> ASSUME {nfds == (80);nr == (500);} GOTO ARG70;
    TRUE -> STOP;

STATE USEFIRST ARG70 :
    MATCH "nfds = nfds * 2;" -> ASSUME {nfds == (160);} GOTO ARG71;
    TRUE -> STOP;

STATE USEFIRST ARG71 :
    MATCH "[!(nfds > NR_OPEN)]" -> ASSUME {nfds == (160);NR_OPEN == (250);} GOTO ARG72;
    TRUE -> STOP;

STATE USEFIRST ARG72 :
    MATCH "" -> GOTO ARG78;
    TRUE -> STOP;

STATE USEFIRST ARG78 :
    MATCH "[nfds <= nr]" -> ASSUME {nfds == (160);nr == (500);} GOTO ARG81;
    TRUE -> STOP;

STATE USEFIRST ARG81 :
    MATCH "nfds = nfds * 2;" -> ASSUME {nfds == (320);} GOTO ARG82;
    TRUE -> STOP;

STATE USEFIRST ARG82 :
    MATCH "[nfds > NR_OPEN]" -> ASSUME {nfds == (320);NR_OPEN == (250);} GOTO ARG83;
    TRUE -> STOP;

STATE USEFIRST ARG83 :
    MATCH "nfds = NR_OPEN;" -> ASSUME {nfds == (250);} GOTO ARG84;
    TRUE -> STOP;

STATE USEFIRST ARG84 :
    MATCH "" -> GOTO ARG85;
    TRUE -> STOP;

STATE USEFIRST ARG85 :
    MATCH "" -> GOTO ARG86;
    TRUE -> STOP;

STATE USEFIRST ARG86 :
    MATCH "[nfds <= nr]" -> ASSUME {nfds == (250);nr == (500);} GOTO ARG87;
    TRUE -> STOP;

STATE USEFIRST ARG87 :
    MATCH "nfds = nfds * 2;" -> ASSUME {nfds == (500);} GOTO ARG88;
    TRUE -> STOP;

STATE USEFIRST ARG88 :
    MATCH "[nfds > NR_OPEN]" -> ASSUME {nfds == (500);NR_OPEN == (250);} GOTO ARG89;
    TRUE -> STOP;

STATE USEFIRST ARG89 :
    MATCH "nfds = NR_OPEN;" -> ASSUME {nfds == (250);} GOTO ARG90;
    TRUE -> STOP;

STATE USEFIRST ARG90 :
    MATCH "" -> GOTO ARG91;
    TRUE -> STOP;

STATE USEFIRST ARG91 :
    MATCH "" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG92 :
    TRUE -> STOP;

END AUTOMATON
