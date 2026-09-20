CONTROL AUTOMATON ErrorPath3

INITIAL STATE ARG2;

STATE USEFIRST ARG2 :
    MATCH "" -> GOTO ARG5;
    TRUE -> STOP;

STATE USEFIRST ARG5 :
    MATCH "extern unsigned char __VERIFIER_nondet_uchar(void);" -> GOTO ARG11_1_1;
STATE USEFIRST ARG11_0_1 :
    MATCH "extern unsigned char __VERIFIER_nondet_uchar(void);" -> GOTO ARG11_1_1;
STATE USEFIRST ARG11_1_1 :
    MATCH "void main(void)" -> GOTO ARG11_2_1;
STATE USEFIRST ARG11_2_1 :
    MATCH "" -> GOTO ARG11_3_1;
STATE USEFIRST ARG11_3_1 :
    MATCH "unsigned char l = __VERIFIER_nondet_uchar();" -> GOTO ARG11_4_1;
STATE USEFIRST ARG11_4_1 :
    MATCH "unsigned char l = __VERIFIER_nondet_uchar();" -> GOTO ARG11;
    TRUE -> STOP;

STATE USEFIRST ARG11 :
    MATCH "" -> GOTO ARG13;
    TRUE -> STOP;

STATE USEFIRST ARG13 :
    MATCH "1" -> GOTO ARG32_1_2;
STATE USEFIRST ARG32_0_2 :
    MATCH "1" -> GOTO ARG32_1_2;
STATE USEFIRST ARG32_1_2 :
    MATCH "unsigned char tmp_1;" -> GOTO ARG32_2_2;
STATE USEFIRST ARG32_2_2 :
    MATCH "tmp_1 = l;" -> GOTO ARG32_3_2;
STATE USEFIRST ARG32_3_2 :
    MATCH "l = (unsigned char)((int)l - 1);" -> GOTO ARG32;
    TRUE -> STOP;

STATE USEFIRST ARG32 :
    MATCH "[[!(! tmp_1)]]" -> GOTO ARG37;
    TRUE -> STOP;

STATE USEFIRST ARG37 :
    MATCH "unsigned char tmp_0;" -> GOTO ARG43_1_3;
STATE USEFIRST ARG43_0_3 :
    MATCH "unsigned char tmp_0;" -> GOTO ARG43_1_3;
STATE USEFIRST ARG43_1_3 :
    MATCH "tmp_0 = l;" -> GOTO ARG43_2_3;
STATE USEFIRST ARG43_2_3 :
    MATCH "l = (unsigned char)((int)l - 1);" -> GOTO ARG43;
    TRUE -> STOP;

STATE USEFIRST ARG43 :
    MATCH "" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG246 :
    TRUE -> STOP;

END AUTOMATON
