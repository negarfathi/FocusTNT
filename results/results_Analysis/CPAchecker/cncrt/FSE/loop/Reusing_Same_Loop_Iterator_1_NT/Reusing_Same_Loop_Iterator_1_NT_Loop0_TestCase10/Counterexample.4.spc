CONTROL AUTOMATON ErrorPath4

INITIAL STATE ARG0;

STATE USEFIRST ARG0 :
    MATCH "" -> GOTO ARG3;
    TRUE -> STOP;

STATE USEFIRST ARG3 :
    MATCH "extern int __VERIFIER_nondet_int(void);" -> GOTO ARG5;
    TRUE -> STOP;

STATE USEFIRST ARG5 :
    MATCH "int main()" -> GOTO ARG6;
    TRUE -> STOP;

STATE USEFIRST ARG6 :
    MATCH "" -> GOTO ARG8;
    TRUE -> STOP;

STATE USEFIRST ARG8 :
    MATCH "int i,j;" -> GOTO ARG9;
    TRUE -> STOP;

STATE USEFIRST ARG9 :
    MATCH "int i,j;" -> GOTO ARG10;
    TRUE -> STOP;

STATE USEFIRST ARG10 :
    MATCH "int num_crtc = 20;" -> ASSUME {num_crtc == (20);} GOTO ARG13;
    TRUE -> STOP;

STATE USEFIRST ARG13 :
    MATCH "int num_output = 10;" -> ASSUME {num_output == (10);} GOTO ARG14;
    TRUE -> STOP;

STATE USEFIRST ARG14 :
    MATCH "[!(num_crtc > 65534 || num_output > 65534)]" -> ASSUME {num_crtc == (20);} GOTO ARG19;
    TRUE -> STOP;

STATE USEFIRST ARG19 :
    MATCH "[!(num_crtc > 65534 || num_output > 65534)]" -> ASSUME {num_output == (10);} GOTO ARG24;
    TRUE -> STOP;

STATE USEFIRST ARG24 :
    MATCH "" -> GOTO ARG25;
    TRUE -> STOP;

STATE USEFIRST ARG25 :
    MATCH "i = 0" -> ASSUME {i == (0);} GOTO ARG39;
    TRUE -> STOP;

STATE USEFIRST ARG39 :
    MATCH "[i < num_crtc]" -> ASSUME {i == (0);num_crtc == (20);} GOTO ARG40;
    TRUE -> STOP;

STATE USEFIRST ARG40 :
    MATCH "" -> GOTO ARG41;
    TRUE -> STOP;

STATE USEFIRST ARG41 :
    MATCH "i = 0" -> ASSUME {i == (0);} GOTO ARG44;
    TRUE -> STOP;

STATE USEFIRST ARG44 :
    MATCH "[i < num_output]" -> ASSUME {i == (0);num_output == (10);} GOTO ARG45;
    TRUE -> STOP;

STATE USEFIRST ARG45 :
    MATCH "" -> GOTO ARG46;
    TRUE -> STOP;

STATE USEFIRST ARG46 :
    MATCH "i++" -> ASSUME {i == (1);} GOTO ARG47;
    TRUE -> STOP;

STATE USEFIRST ARG47 :
    MATCH "[i < num_output]" -> ASSUME {i == (1);num_output == (10);} GOTO ARG63;
    TRUE -> STOP;

STATE USEFIRST ARG63 :
    MATCH "" -> GOTO ARG66;
    TRUE -> STOP;

STATE USEFIRST ARG66 :
    MATCH "i++" -> ASSUME {i == (2);} GOTO ARG69;
    TRUE -> STOP;

STATE USEFIRST ARG69 :
    MATCH "[i < num_output]" -> ASSUME {i == (2);num_output == (10);} GOTO ARG72;
    TRUE -> STOP;

STATE USEFIRST ARG72 :
    MATCH "" -> GOTO ARG75;
    TRUE -> STOP;

STATE USEFIRST ARG75 :
    MATCH "i++" -> ASSUME {i == (3);} GOTO ARG78;
    TRUE -> STOP;

STATE USEFIRST ARG78 :
    MATCH "[i < num_output]" -> ASSUME {i == (3);num_output == (10);} GOTO ARG79;
    TRUE -> STOP;

STATE USEFIRST ARG79 :
    MATCH "" -> GOTO ARG80;
    TRUE -> STOP;

STATE USEFIRST ARG80 :
    MATCH "i++" -> ASSUME {i == (4);} GOTO ARG81;
    TRUE -> STOP;

STATE USEFIRST ARG81 :
    MATCH "[i < num_output]" -> ASSUME {i == (4);num_output == (10);} GOTO ARG89;
    TRUE -> STOP;

STATE USEFIRST ARG89 :
    MATCH "" -> GOTO ARG90;
    TRUE -> STOP;

STATE USEFIRST ARG90 :
    MATCH "i++" -> ASSUME {i == (5);} GOTO ARG91;
    TRUE -> STOP;

STATE USEFIRST ARG91 :
    MATCH "[i < num_output]" -> ASSUME {i == (5);num_output == (10);} GOTO ARG92;
    TRUE -> STOP;

STATE USEFIRST ARG92 :
    MATCH "" -> GOTO ARG93;
    TRUE -> STOP;

STATE USEFIRST ARG93 :
    MATCH "i++" -> ASSUME {i == (6);} GOTO ARG94;
    TRUE -> STOP;

STATE USEFIRST ARG94 :
    MATCH "[i < num_output]" -> ASSUME {i == (6);num_output == (10);} GOTO ARG95;
    TRUE -> STOP;

STATE USEFIRST ARG95 :
    MATCH "" -> GOTO ARG96;
    TRUE -> STOP;

STATE USEFIRST ARG96 :
    MATCH "i++" -> ASSUME {i == (7);} GOTO ARG97;
    TRUE -> STOP;

STATE USEFIRST ARG97 :
    MATCH "[i < num_output]" -> ASSUME {i == (7);num_output == (10);} GOTO ARG98;
    TRUE -> STOP;

STATE USEFIRST ARG98 :
    MATCH "" -> GOTO ARG99;
    TRUE -> STOP;

STATE USEFIRST ARG99 :
    MATCH "i++" -> ASSUME {i == (8);} GOTO ARG100;
    TRUE -> STOP;

STATE USEFIRST ARG100 :
    MATCH "[i < num_output]" -> ASSUME {i == (8);num_output == (10);} GOTO ARG101;
    TRUE -> STOP;

STATE USEFIRST ARG101 :
    MATCH "" -> GOTO ARG102;
    TRUE -> STOP;

STATE USEFIRST ARG102 :
    MATCH "i++" -> ASSUME {i == (9);} GOTO ARG103;
    TRUE -> STOP;

STATE USEFIRST ARG103 :
    MATCH "[i < num_output]" -> ASSUME {i == (9);num_output == (10);} GOTO ARG104;
    TRUE -> STOP;

STATE USEFIRST ARG104 :
    MATCH "" -> GOTO ARG105;
    TRUE -> STOP;

STATE USEFIRST ARG105 :
    MATCH "i++" -> ASSUME {i == (10);} GOTO ARG106;
    TRUE -> STOP;

STATE USEFIRST ARG106 :
    MATCH "[!(i < num_output)]" -> ASSUME {i == (10);num_output == (10);} GOTO ARG107;
    TRUE -> STOP;

STATE USEFIRST ARG107 :
    MATCH "" -> GOTO ARG108;
    TRUE -> STOP;

STATE USEFIRST ARG108 :
    MATCH "i++" -> ASSUME {i == (11);} GOTO ARG109;
    TRUE -> STOP;

STATE USEFIRST ARG109 :
    MATCH "[i < num_crtc]" -> ASSUME {i == (11);num_crtc == (20);} GOTO ARG111;
    TRUE -> STOP;

STATE USEFIRST ARG111 :
    MATCH "" -> GOTO ARG112;
    TRUE -> STOP;

STATE USEFIRST ARG112 :
    MATCH "i = 0" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG113 :
    TRUE -> STOP;

END AUTOMATON
