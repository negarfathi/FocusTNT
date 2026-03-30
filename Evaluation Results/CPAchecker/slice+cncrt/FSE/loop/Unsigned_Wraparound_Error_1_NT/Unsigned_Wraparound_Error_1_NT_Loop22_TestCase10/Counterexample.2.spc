CONTROL AUTOMATON ErrorPath2

INITIAL STATE ARG0;

STATE USEFIRST ARG0 :
    MATCH "" -> GOTO ARG3;
    TRUE -> STOP;

STATE USEFIRST ARG3 :
    MATCH "extern unsigned int __VERIFIER_nondet_uint(void);" -> GOTO ARG4;
    TRUE -> STOP;

STATE USEFIRST ARG4 :
    MATCH "void main(void)" -> GOTO ARG5;
    TRUE -> STOP;

STATE USEFIRST ARG5 :
    MATCH "" -> GOTO ARG7;
    TRUE -> STOP;

STATE USEFIRST ARG7 :
    MATCH "unsigned int cur;" -> GOTO ARG9;
    TRUE -> STOP;

STATE USEFIRST ARG9 :
    MATCH "unsigned int best = 2147483648;" -> ASSUME {best == (2147483648U);} GOTO ARG12;
    TRUE -> STOP;

STATE USEFIRST ARG12 :
    MATCH "unsigned int st_max = 4294967295;" -> ASSUME {st_max == (4294967295U);} GOTO ARG13;
    TRUE -> STOP;

STATE USEFIRST ARG13 :
    MATCH "unsigned int it_min = 0;" -> ASSUME {it_min == (0U);} GOTO ARG14;
    TRUE -> STOP;

STATE USEFIRST ARG14 :
    MATCH "[!(st_max <= it_min)]" -> ASSUME {st_max == (4294967295U);it_min == (0U);} GOTO ARG19;
    TRUE -> STOP;

STATE USEFIRST ARG19 :
    MATCH "[!(best == (unsigned int)0)]" -> ASSUME {best == (2147483648U);} GOTO ARG25;
    TRUE -> STOP;

STATE USEFIRST ARG25 :
    MATCH "cur = best;" -> ASSUME {cur == (2147483648U);} GOTO ARG27;
    TRUE -> STOP;

STATE USEFIRST ARG27 :
    MATCH "" -> GOTO ARG30;
    TRUE -> STOP;

STATE USEFIRST ARG30 :
    MATCH "1" -> GOTO ARG31;
    TRUE -> STOP;

STATE USEFIRST ARG31 :
    MATCH "[!(st_max < cur)]" -> ASSUME {st_max == (4294967295U);cur == (2147483648U);} GOTO ARG32;
    TRUE -> STOP;

STATE USEFIRST ARG32 :
    MATCH "cur += best;" -> ASSUME {cur == (0U);} GOTO ARG33;
    TRUE -> STOP;

STATE USEFIRST ARG33 :
    MATCH "" -> GOTO ARG34;
    TRUE -> STOP;

STATE USEFIRST ARG34 :
    MATCH "1" -> GOTO ARG45;
    TRUE -> STOP;

STATE USEFIRST ARG45 :
    MATCH "[!(st_max < cur)]" -> ASSUME {st_max == (4294967295U);cur == (0U);} GOTO ARG48;
    TRUE -> STOP;

STATE USEFIRST ARG48 :
    MATCH "cur += best;" -> ASSUME {cur == (2147483648U);} GOTO ARG53;
    TRUE -> STOP;

STATE USEFIRST ARG53 :
    MATCH "" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG56 :
    TRUE -> STOP;

END AUTOMATON
