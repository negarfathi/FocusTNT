CONTROL AUTOMATON ErrorPath3

INITIAL STATE ARG2;

STATE USEFIRST ARG2 :
    MATCH "" -> GOTO ARG7;
    TRUE -> STOP;

STATE USEFIRST ARG7 :
    MATCH "extern unsigned char __VERIFIER_nondet_uchar(void);" -> GOTO ARG13_1_1;
STATE USEFIRST ARG13_0_1 :
    MATCH "extern unsigned char __VERIFIER_nondet_uchar(void);" -> GOTO ARG13_1_1;
STATE USEFIRST ARG13_1_1 :
    MATCH "extern char __VERIFIER_nondet_char(void);" -> GOTO ARG13_2_1;
STATE USEFIRST ARG13_2_1 :
    MATCH "void main(void)" -> GOTO ARG13_3_1;
STATE USEFIRST ARG13_3_1 :
    MATCH "" -> GOTO ARG13_4_1;
STATE USEFIRST ARG13_4_1 :
    MATCH "unsigned char ac;" -> GOTO ARG13_5_1;
STATE USEFIRST ARG13_5_1 :
    MATCH "unsigned char c1 = __VERIFIER_nondet_uchar();" -> GOTO ARG13_6_1;
STATE USEFIRST ARG13_6_1 :
    MATCH "unsigned char c1 = __VERIFIER_nondet_uchar();" -> GOTO ARG13_7_1;
STATE USEFIRST ARG13_7_1 :
    MATCH "char c2 = __VERIFIER_nondet_char();" -> GOTO ARG13_8_1;
STATE USEFIRST ARG13_8_1 :
    MATCH "char c2 = __VERIFIER_nondet_char();" -> GOTO ARG13_9_1;
STATE USEFIRST ARG13_9_1 :
    MATCH "ac = c1;" -> GOTO ARG13;
    TRUE -> STOP;

STATE USEFIRST ARG13 :
    MATCH "" -> GOTO ARG19;
    TRUE -> STOP;

STATE USEFIRST ARG19 :
    MATCH "[[(int)ac != (int)c2]]" -> GOTO ARG34;
    TRUE -> STOP;

STATE USEFIRST ARG34 :
    MATCH "ac = (unsigned char)((int)ac + 1);" -> GOTO ARG44;
    TRUE -> STOP;

STATE USEFIRST ARG44 :
    MATCH "" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG217 :
    TRUE -> STOP;

END AUTOMATON
