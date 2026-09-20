CONTROL AUTOMATON ErrorPath3

INITIAL STATE ARG2;

STATE USEFIRST ARG2 :
    MATCH "" -> GOTO ARG9;
    TRUE -> STOP;

STATE USEFIRST ARG9 :
    MATCH "extern unsigned char __VERIFIER_nondet_uchar(void);" -> GOTO ARG12_1_1;
STATE USEFIRST ARG12_0_1 :
    MATCH "extern unsigned char __VERIFIER_nondet_uchar(void);" -> GOTO ARG12_1_1;
STATE USEFIRST ARG12_1_1 :
    MATCH "extern char __VERIFIER_nondet_char(void);" -> GOTO ARG12_2_1;
STATE USEFIRST ARG12_2_1 :
    MATCH "int main()" -> GOTO ARG12_3_1;
STATE USEFIRST ARG12_3_1 :
    MATCH "" -> GOTO ARG12_4_1;
STATE USEFIRST ARG12_4_1 :
    MATCH "unsigned char c1 = __VERIFIER_nondet_uchar();" -> GOTO ARG12_5_1;
STATE USEFIRST ARG12_5_1 :
    MATCH "unsigned char c1 = __VERIFIER_nondet_uchar();" -> GOTO ARG12_6_1;
STATE USEFIRST ARG12_6_1 :
    MATCH "char c2 = __VERIFIER_nondet_char();" -> GOTO ARG12_7_1;
STATE USEFIRST ARG12_7_1 :
    MATCH "char c2 = __VERIFIER_nondet_char();" -> GOTO ARG12_8_1;
STATE USEFIRST ARG12_8_1 :
    MATCH "unsigned char ac;" -> GOTO ARG12_9_1;
STATE USEFIRST ARG12_9_1 :
    MATCH "" -> GOTO ARG12;
    TRUE -> STOP;

STATE USEFIRST ARG12 :
    MATCH "ac = (unsigned char)c1" -> GOTO ARG19;
    TRUE -> STOP;

STATE USEFIRST ARG19 :
    MATCH "[[ac != (unsigned char)c2]]" -> GOTO ARG34;
    TRUE -> STOP;

STATE USEFIRST ARG34 :
    MATCH "" -> GOTO ARG44;
    TRUE -> STOP;

STATE USEFIRST ARG44 :
    MATCH "ac++" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG216 :
    TRUE -> STOP;

END AUTOMATON
