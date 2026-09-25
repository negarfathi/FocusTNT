CONTROL AUTOMATON ErrorPath2

INITIAL STATE ARG0;

STATE USEFIRST ARG0 :
    MATCH "" -> GOTO ARG3;
    TRUE -> STOP;

STATE USEFIRST ARG3 :
    MATCH "extern unsigned int __VERIFIER_nondet_uint(void);" -> GOTO ARG4;
    TRUE -> STOP;

STATE USEFIRST ARG4 :
    MATCH "void main(void)" -> GOTO ARG6;
    TRUE -> STOP;

STATE USEFIRST ARG6 :
    MATCH "" -> GOTO ARG8;
    TRUE -> STOP;

STATE USEFIRST ARG8 :
    MATCH "unsigned int cur;" -> GOTO ARG9;
    TRUE -> STOP;

STATE USEFIRST ARG9 :
    MATCH "unsigned int best = __VERIFIER_nondet_uint();" -> GOTO ARG10;
    TRUE -> STOP;

STATE USEFIRST ARG10 :
    MATCH "unsigned int best = __VERIFIER_nondet_uint();" -> GOTO ARG13;
    TRUE -> STOP;

STATE USEFIRST ARG13 :
    MATCH "unsigned int st_max = __VERIFIER_nondet_uint();" -> GOTO ARG14;
    TRUE -> STOP;

STATE USEFIRST ARG14 :
    MATCH "unsigned int st_max = __VERIFIER_nondet_uint();" -> GOTO ARG15;
    TRUE -> STOP;

STATE USEFIRST ARG15 :
    MATCH "unsigned int it_min = __VERIFIER_nondet_uint();" -> GOTO ARG16;
    TRUE -> STOP;

STATE USEFIRST ARG16 :
    MATCH "unsigned int it_min = __VERIFIER_nondet_uint();" -> GOTO ARG21;
    TRUE -> STOP;

STATE USEFIRST ARG21 :
    MATCH "[!(st_max <= it_min)]" -> GOTO ARG29;
    TRUE -> STOP;

STATE USEFIRST ARG29 :
    MATCH "[!(best == (unsigned int)0)]" -> GOTO ARG33;
    TRUE -> STOP;

STATE USEFIRST ARG33 :
    MATCH "cur = best;" -> GOTO ARG34;
    TRUE -> STOP;

STATE USEFIRST ARG34 :
    MATCH "" -> GOTO ARG35;
    TRUE -> STOP;

STATE USEFIRST ARG35 :
    MATCH "1" -> GOTO ARG36;
    TRUE -> STOP;

STATE USEFIRST ARG36 :
    MATCH "[!(st_max < cur)]" -> GOTO ARG38;
    TRUE -> STOP;

STATE USEFIRST ARG38 :
    MATCH "cur += best;" -> GOTO ARG39;
    TRUE -> STOP;

STATE USEFIRST ARG39 :
    MATCH "" -> GOTO ARG40;
    TRUE -> STOP;

STATE USEFIRST ARG40 :
    MATCH "1" -> GOTO ARG63;
    TRUE -> STOP;

STATE USEFIRST ARG63 :
    MATCH "[!(st_max < cur)]" -> GOTO ARG65;
    TRUE -> STOP;

STATE USEFIRST ARG65 :
    MATCH "cur += best;" -> GOTO ARG66;
    TRUE -> STOP;

STATE USEFIRST ARG66 :
    MATCH "" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG67 :
    TRUE -> STOP;

END AUTOMATON
