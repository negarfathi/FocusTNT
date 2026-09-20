CONTROL AUTOMATON ErrorPath3

INITIAL STATE ARG2;

STATE USEFIRST ARG2 :
    MATCH "" -> GOTO ARG7;
    TRUE -> STOP;

STATE USEFIRST ARG7 :
    MATCH "extern unsigned char __VERIFIER_nondet_uchar(void);" -> GOTO ARG12_1_1;
STATE USEFIRST ARG12_0_1 :
    MATCH "extern unsigned char __VERIFIER_nondet_uchar(void);" -> GOTO ARG12_1_1;
STATE USEFIRST ARG12_1_1 :
    MATCH "extern char __VERIFIER_nondet_char(void);" -> GOTO ARG12_2_1;
STATE USEFIRST ARG12_2_1 :
    MATCH "void main(void)" -> GOTO ARG12_3_1;
STATE USEFIRST ARG12_3_1 :
    MATCH "" -> GOTO ARG12_4_1;
STATE USEFIRST ARG12_4_1 :
    MATCH "unsigned char ac;" -> GOTO ARG12_5_1;
STATE USEFIRST ARG12_5_1 :
    MATCH "unsigned char c1 = 25;" -> GOTO ARG12_6_1;
STATE USEFIRST ARG12_6_1 :
    MATCH "char c2 = 12;" -> GOTO ARG12_7_1;
STATE USEFIRST ARG12_7_1 :
    MATCH "ac = c1;" -> GOTO ARG12;
    TRUE -> STOP;

STATE USEFIRST ARG12 :
    MATCH "" -> GOTO ARG17;
    TRUE -> STOP;

STATE USEFIRST ARG17 :
    MATCH "[[(int)ac != (int)c2]]" -> GOTO ARG30;
    TRUE -> STOP;

STATE USEFIRST ARG30 :
    MATCH "ac = (unsigned char)((int)ac + 1);" -> GOTO ARG40;
    TRUE -> STOP;

STATE USEFIRST ARG40 :
    MATCH "" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG166 :
    TRUE -> STOP;

END AUTOMATON
