CONTROL AUTOMATON ErrorPath3

INITIAL STATE ARG2;

STATE USEFIRST ARG2 :
    MATCH "" -> GOTO ARG6;
    TRUE -> STOP;

STATE USEFIRST ARG6 :
    MATCH "extern unsigned int __VERIFIER_nondet_uint(void);" -> GOTO ARG11_1_1;
STATE USEFIRST ARG11_0_1 :
    MATCH "extern unsigned int __VERIFIER_nondet_uint(void);" -> GOTO ARG11_1_1;
STATE USEFIRST ARG11_1_1 :
    MATCH "int main()" -> GOTO ARG11_2_1;
STATE USEFIRST ARG11_2_1 :
    MATCH "" -> GOTO ARG11_3_1;
STATE USEFIRST ARG11_3_1 :
    MATCH "unsigned int pathlen = __VERIFIER_nondet_uint();" -> GOTO ARG11_4_1;
STATE USEFIRST ARG11_4_1 :
    MATCH "unsigned int pathlen = __VERIFIER_nondet_uint();" -> GOTO ARG11_5_1;
STATE USEFIRST ARG11_5_1 :
    MATCH "unsigned int newbufsize = __VERIFIER_nondet_uint();" -> GOTO ARG11_6_1;
STATE USEFIRST ARG11_6_1 :
    MATCH "unsigned int newbufsize = __VERIFIER_nondet_uint();" -> GOTO ARG11_7_1;
STATE USEFIRST ARG11_7_1 :
    MATCH "unsigned int len = __VERIFIER_nondet_uint();" -> GOTO ARG11_8_1;
STATE USEFIRST ARG11_8_1 :
    MATCH "unsigned int len = __VERIFIER_nondet_uint();" -> GOTO ARG11;
    TRUE -> STOP;

STATE USEFIRST ARG11 :
    MATCH "[[!(newbufsize + len + 1 == 0xffffffff)]]" -> GOTO ARG19;
    TRUE -> STOP;

STATE USEFIRST ARG19 :
    MATCH "[[!(newbufsize == 0)]]" -> GOTO ARG24;
    TRUE -> STOP;

STATE USEFIRST ARG24 :
    MATCH "" -> GOTO ARG26;
    TRUE -> STOP;

STATE USEFIRST ARG26 :
    MATCH "[[newbufsize < pathlen + len + 1]]" -> GOTO ARG48;
    TRUE -> STOP;

STATE USEFIRST ARG48 :
    MATCH "[[newbufsize >= 0x80000000]]" -> GOTO ARG59;
    MATCH "[[!(newbufsize >= 0x80000000)]]" -> GOTO ARG60;
    TRUE -> STOP;

STATE USEFIRST ARG59 :
    MATCH "newbufsize = 0xffffffff;" -> GOTO ARG74;
    TRUE -> STOP;

STATE USEFIRST ARG60 :
    MATCH "newbufsize *= 2;" -> GOTO ARG66;
    TRUE -> STOP;

STATE USEFIRST ARG66 :
    MATCH "" -> GOTO ARG79;
    TRUE -> STOP;

STATE USEFIRST ARG74 :
    MATCH "" -> GOTO ARG79;
    TRUE -> STOP;

STATE USEFIRST ARG79 :
    MATCH "" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG268 :
    TRUE -> STOP;

END AUTOMATON
