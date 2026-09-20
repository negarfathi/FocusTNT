CONTROL AUTOMATON ErrorPath1

INITIAL STATE ARG0;

STATE USEFIRST ARG0 :
    MATCH "" -> GOTO ARG3;
    TRUE -> STOP;

STATE USEFIRST ARG3 :
    MATCH "extern int __VERIFIER_nondet_int(void);" -> GOTO ARG4;
    TRUE -> STOP;

STATE USEFIRST ARG4 :
    MATCH "int main()" -> GOTO ARG6;
    TRUE -> STOP;

STATE USEFIRST ARG6 :
    MATCH "" -> GOTO ARG8;
    TRUE -> STOP;

STATE USEFIRST ARG8 :
    MATCH "int nfds = 7;" -> ASSUME {nfds == (7);} GOTO ARG12;
    TRUE -> STOP;

STATE USEFIRST ARG12 :
    MATCH "int nr = 1000;" -> ASSUME {nr == (1000);} GOTO ARG14;
    TRUE -> STOP;

STATE USEFIRST ARG14 :
    MATCH "int NR_OPEN = 300;" -> ASSUME {NR_OPEN == (300);} GOTO ARG15;
    TRUE -> STOP;

STATE USEFIRST ARG15 :
    MATCH "" -> GOTO ARG16;
    TRUE -> STOP;

STATE USEFIRST ARG16 :
    MATCH "[nfds <= nr]" -> ASSUME {nfds == (7);nr == (1000);} GOTO ARG17;
    TRUE -> STOP;

STATE USEFIRST ARG17 :
    MATCH "nfds = nfds * 2;" -> ASSUME {nfds == (14);} GOTO ARG18;
    TRUE -> STOP;

STATE USEFIRST ARG18 :
    MATCH "[!(nfds > NR_OPEN)]" -> ASSUME {nfds == (14);NR_OPEN == (300);} GOTO ARG19;
    TRUE -> STOP;

STATE USEFIRST ARG19 :
    MATCH "" -> GOTO ARG20;
    TRUE -> STOP;

STATE USEFIRST ARG20 :
    MATCH "[nfds <= nr]" -> ASSUME {nfds == (14);nr == (1000);} GOTO ARG46;
    TRUE -> STOP;

STATE USEFIRST ARG46 :
    MATCH "nfds = nfds * 2;" -> ASSUME {nfds == (28);} GOTO ARG51;
    TRUE -> STOP;

STATE USEFIRST ARG51 :
    MATCH "[!(nfds > NR_OPEN)]" -> ASSUME {nfds == (28);NR_OPEN == (300);} GOTO ARG54;
    TRUE -> STOP;

STATE USEFIRST ARG54 :
    MATCH "" -> GOTO ARG59;
    TRUE -> STOP;

STATE USEFIRST ARG59 :
    MATCH "[nfds <= nr]" -> ASSUME {nfds == (28);nr == (1000);} GOTO ARG66;
    TRUE -> STOP;

STATE USEFIRST ARG66 :
    MATCH "nfds = nfds * 2;" -> ASSUME {nfds == (56);} GOTO ARG67;
    TRUE -> STOP;

STATE USEFIRST ARG67 :
    MATCH "[!(nfds > NR_OPEN)]" -> ASSUME {nfds == (56);NR_OPEN == (300);} GOTO ARG68;
    TRUE -> STOP;

STATE USEFIRST ARG68 :
    MATCH "" -> GOTO ARG69;
    TRUE -> STOP;

STATE USEFIRST ARG69 :
    MATCH "[nfds <= nr]" -> ASSUME {nfds == (56);nr == (1000);} GOTO ARG70;
    TRUE -> STOP;

STATE USEFIRST ARG70 :
    MATCH "nfds = nfds * 2;" -> ASSUME {nfds == (112);} GOTO ARG71;
    TRUE -> STOP;

STATE USEFIRST ARG71 :
    MATCH "[!(nfds > NR_OPEN)]" -> ASSUME {nfds == (112);NR_OPEN == (300);} GOTO ARG72;
    TRUE -> STOP;

STATE USEFIRST ARG72 :
    MATCH "" -> GOTO ARG73;
    TRUE -> STOP;

STATE USEFIRST ARG73 :
    MATCH "[nfds <= nr]" -> ASSUME {nfds == (112);nr == (1000);} GOTO ARG80;
    TRUE -> STOP;

STATE USEFIRST ARG80 :
    MATCH "nfds = nfds * 2;" -> ASSUME {nfds == (224);} GOTO ARG82;
    TRUE -> STOP;

STATE USEFIRST ARG82 :
    MATCH "[!(nfds > NR_OPEN)]" -> ASSUME {nfds == (224);NR_OPEN == (300);} GOTO ARG83;
    TRUE -> STOP;

STATE USEFIRST ARG83 :
    MATCH "" -> GOTO ARG84;
    TRUE -> STOP;

STATE USEFIRST ARG84 :
    MATCH "[nfds <= nr]" -> ASSUME {nfds == (224);nr == (1000);} GOTO ARG85;
    TRUE -> STOP;

STATE USEFIRST ARG85 :
    MATCH "nfds = nfds * 2;" -> ASSUME {nfds == (448);} GOTO ARG86;
    TRUE -> STOP;

STATE USEFIRST ARG86 :
    MATCH "[nfds > NR_OPEN]" -> ASSUME {nfds == (448);NR_OPEN == (300);} GOTO ARG87;
    TRUE -> STOP;

STATE USEFIRST ARG87 :
    MATCH "nfds = NR_OPEN;" -> ASSUME {nfds == (300);} GOTO ARG88;
    TRUE -> STOP;

STATE USEFIRST ARG88 :
    MATCH "" -> GOTO ARG89;
    TRUE -> STOP;

STATE USEFIRST ARG89 :
    MATCH "" -> GOTO ARG90;
    TRUE -> STOP;

STATE USEFIRST ARG90 :
    MATCH "[nfds <= nr]" -> ASSUME {nfds == (300);nr == (1000);} GOTO ARG91;
    TRUE -> STOP;

STATE USEFIRST ARG91 :
    MATCH "nfds = nfds * 2;" -> ASSUME {nfds == (600);} GOTO ARG92;
    TRUE -> STOP;

STATE USEFIRST ARG92 :
    MATCH "[nfds > NR_OPEN]" -> ASSUME {nfds == (600);NR_OPEN == (300);} GOTO ARG93;
    TRUE -> STOP;

STATE USEFIRST ARG93 :
    MATCH "nfds = NR_OPEN;" -> ASSUME {nfds == (300);} GOTO ARG94;
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
