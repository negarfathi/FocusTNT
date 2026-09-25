CONTROL AUTOMATON ErrorPath3

INITIAL STATE ARG2;

STATE USEFIRST ARG2 :
    MATCH "" -> GOTO ARG5;
    TRUE -> STOP;

STATE USEFIRST ARG5 :
    MATCH "extern unsigned int __VERIFIER_nondet_uint(void);" -> GOTO ARG13_1_1;
STATE USEFIRST ARG13_0_1 :
    MATCH "extern unsigned int __VERIFIER_nondet_uint(void);" -> GOTO ARG13_1_1;
STATE USEFIRST ARG13_1_1 :
    MATCH "void main(void)" -> GOTO ARG13_2_1;
STATE USEFIRST ARG13_2_1 :
    MATCH "" -> GOTO ARG13_3_1;
STATE USEFIRST ARG13_3_1 :
    MATCH "int __retres;" -> GOTO ARG13_4_1;
STATE USEFIRST ARG13_4_1 :
    MATCH "unsigned int pathlen = __VERIFIER_nondet_uint();" -> GOTO ARG13_5_1;
STATE USEFIRST ARG13_5_1 :
    MATCH "unsigned int pathlen = __VERIFIER_nondet_uint();" -> GOTO ARG13_6_1;
STATE USEFIRST ARG13_6_1 :
    MATCH "unsigned int newbufsize = __VERIFIER_nondet_uint();" -> GOTO ARG13_7_1;
STATE USEFIRST ARG13_7_1 :
    MATCH "unsigned int newbufsize = __VERIFIER_nondet_uint();" -> GOTO ARG13_8_1;
STATE USEFIRST ARG13_8_1 :
    MATCH "unsigned int len = __VERIFIER_nondet_uint();" -> GOTO ARG13_9_1;
STATE USEFIRST ARG13_9_1 :
    MATCH "unsigned int len = __VERIFIER_nondet_uint();" -> GOTO ARG13;
    TRUE -> STOP;

STATE USEFIRST ARG13 :
    MATCH "[[!((newbufsize + len) + (unsigned int)1 == 0xffffffff)]]" -> GOTO ARG21;
    TRUE -> STOP;

STATE USEFIRST ARG21 :
    MATCH "[[!(newbufsize == (unsigned int)0)]]" -> GOTO ARG25;
    TRUE -> STOP;

STATE USEFIRST ARG25 :
    MATCH "" -> GOTO ARG29;
    TRUE -> STOP;

STATE USEFIRST ARG29 :
    MATCH "[[newbufsize < (pathlen + len) + (unsigned int)1]]" -> GOTO ARG50;
    TRUE -> STOP;

STATE USEFIRST ARG50 :
    MATCH "[[newbufsize >= 0x80000000]]" -> GOTO ARG61;
    MATCH "[[!(newbufsize >= 0x80000000)]]" -> GOTO ARG62;
    TRUE -> STOP;

STATE USEFIRST ARG61 :
    MATCH "newbufsize = 0xffffffff;" -> GOTO ARG80;
    TRUE -> STOP;

STATE USEFIRST ARG62 :
    MATCH "newbufsize *= (unsigned int)2;" -> GOTO ARG68;
    TRUE -> STOP;

STATE USEFIRST ARG68 :
    MATCH "" -> GOTO ARG87;
    TRUE -> STOP;

STATE USEFIRST ARG80 :
    MATCH "" -> GOTO ARG87;
    TRUE -> STOP;

STATE USEFIRST ARG87 :
    MATCH "" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG319 :
    TRUE -> STOP;

END AUTOMATON
