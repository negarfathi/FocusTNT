CONTROL AUTOMATON ErrorPath1

INITIAL STATE ARG0;

STATE USEFIRST ARG0 :
    MATCH "" -> GOTO ARG3;
    TRUE -> STOP;

STATE USEFIRST ARG3 :
    MATCH "extern int __VERIFIER_nondet_int(void);" -> GOTO ARG5;
    TRUE -> STOP;

STATE USEFIRST ARG5 :
    MATCH "int main()" -> GOTO ARG7;
    TRUE -> STOP;

STATE USEFIRST ARG7 :
    MATCH "" -> GOTO ARG8;
    TRUE -> STOP;

STATE USEFIRST ARG8 :
    MATCH "int i,j;" -> GOTO ARG9;
    TRUE -> STOP;

STATE USEFIRST ARG9 :
    MATCH "int i,j;" -> GOTO ARG10;
    TRUE -> STOP;

STATE USEFIRST ARG10 :
    MATCH "int num_crtc = 50;" -> ASSUME {num_crtc == (50);} GOTO ARG13;
    TRUE -> STOP;

STATE USEFIRST ARG13 :
    MATCH "int num_output = 0;" -> ASSUME {num_output == (0);} GOTO ARG18;
    TRUE -> STOP;

STATE USEFIRST ARG18 :
    MATCH "[!(num_crtc > 65534 || num_output > 65534)]" -> ASSUME {num_crtc == (50);} GOTO ARG23;
    TRUE -> STOP;

STATE USEFIRST ARG23 :
    MATCH "[!(num_crtc > 65534 || num_output > 65534)]" -> ASSUME {num_output == (0);} GOTO ARG28;
    TRUE -> STOP;

STATE USEFIRST ARG28 :
    MATCH "" -> GOTO ARG29;
    TRUE -> STOP;

STATE USEFIRST ARG29 :
    MATCH "i = 0" -> ASSUME {i == (0);} GOTO ARG39;
    TRUE -> STOP;

STATE USEFIRST ARG39 :
    MATCH "[i < num_crtc]" -> ASSUME {i == (0);num_crtc == (50);} GOTO ARG41;
    TRUE -> STOP;

STATE USEFIRST ARG41 :
    MATCH "" -> GOTO ARG43;
    TRUE -> STOP;

STATE USEFIRST ARG43 :
    MATCH "i = 0" -> ASSUME {i == (0);} GOTO ARG44;
    TRUE -> STOP;

STATE USEFIRST ARG44 :
    MATCH "[!(i < num_output)]" -> ASSUME {i == (0);num_output == (0);} GOTO ARG45;
    TRUE -> STOP;

STATE USEFIRST ARG45 :
    MATCH "" -> GOTO ARG46;
    TRUE -> STOP;

STATE USEFIRST ARG46 :
    MATCH "i++" -> ASSUME {i == (1);} GOTO ARG47;
    TRUE -> STOP;

STATE USEFIRST ARG47 :
    MATCH "[i < num_crtc]" -> ASSUME {i == (1);num_crtc == (50);} GOTO ARG63;
    TRUE -> STOP;

STATE USEFIRST ARG63 :
    MATCH "" -> GOTO ARG66;
    TRUE -> STOP;

STATE USEFIRST ARG66 :
    MATCH "i = 0" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG69 :
    TRUE -> STOP;

END AUTOMATON
