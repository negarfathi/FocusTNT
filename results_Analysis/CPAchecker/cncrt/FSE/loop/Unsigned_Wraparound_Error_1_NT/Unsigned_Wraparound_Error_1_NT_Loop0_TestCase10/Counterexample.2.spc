CONTROL AUTOMATON ErrorPath2

INITIAL STATE ARG1;

STATE USEFIRST ARG1 :
    MATCH "" -> GOTO ARG3;
    TRUE -> STOP;

STATE USEFIRST ARG3 :
    MATCH "extern unsigned int __VERIFIER_nondet_uint(void);" -> GOTO ARG4;
    TRUE -> STOP;

STATE USEFIRST ARG4 :
    MATCH "int main()" -> GOTO ARG5;
    TRUE -> STOP;

STATE USEFIRST ARG5 :
    MATCH "" -> GOTO ARG6;
    TRUE -> STOP;

STATE USEFIRST ARG6 :
    MATCH "unsigned int best = 2147483648;" -> ASSUME {best == (2147483648U);} GOTO ARG11;
    TRUE -> STOP;

STATE USEFIRST ARG11 :
    MATCH "unsigned int pre;" -> GOTO ARG12;
    TRUE -> STOP;

STATE USEFIRST ARG12 :
    MATCH "unsigned int cur;" -> GOTO ARG13;
    TRUE -> STOP;

STATE USEFIRST ARG13 :
    MATCH "unsigned int st_max = 4294967295;" -> ASSUME {st_max == (4294967295U);} GOTO ARG18;
    TRUE -> STOP;

STATE USEFIRST ARG18 :
    MATCH "unsigned int it_min = 0;" -> ASSUME {it_min == (0U);} GOTO ARG23;
    TRUE -> STOP;

STATE USEFIRST ARG23 :
    MATCH "[!(st_max <= it_min)]" -> ASSUME {st_max == (4294967295U);it_min == (0U);} GOTO ARG26;
    TRUE -> STOP;

STATE USEFIRST ARG26 :
    MATCH "[!(best == 0)]" -> ASSUME {best == (2147483648U);} GOTO ARG27;
    TRUE -> STOP;

STATE USEFIRST ARG27 :
    MATCH "" -> GOTO ARG28;
    TRUE -> STOP;

STATE USEFIRST ARG28 :
    MATCH "cur = best" -> ASSUME {cur == (2147483648U);} GOTO ARG31;
    TRUE -> STOP;

STATE USEFIRST ARG31 :
    MATCH "" -> GOTO ARG32;
    TRUE -> STOP;

STATE USEFIRST ARG32 :
    MATCH "[!(st_max < cur)]" -> ASSUME {st_max == (4294967295U);cur == (2147483648U);} GOTO ARG33;
    TRUE -> STOP;

STATE USEFIRST ARG33 :
    MATCH "[!(it_min > cur)]" -> ASSUME {it_min == (0U);cur == (2147483648U);} GOTO ARG34;
    TRUE -> STOP;

STATE USEFIRST ARG34 :
    MATCH "" -> GOTO ARG35;
    TRUE -> STOP;

STATE USEFIRST ARG35 :
    MATCH "cur += best" -> ASSUME {cur == (0U);} GOTO ARG36;
    TRUE -> STOP;

STATE USEFIRST ARG36 :
    MATCH "" -> GOTO ARG52;
    TRUE -> STOP;

STATE USEFIRST ARG52 :
    MATCH "[!(st_max < cur)]" -> ASSUME {st_max == (4294967295U);cur == (0U);} GOTO ARG54;
    TRUE -> STOP;

STATE USEFIRST ARG54 :
    MATCH "[!(it_min > cur)]" -> ASSUME {it_min == (0U);cur == (0U);} GOTO ARG59;
    TRUE -> STOP;

STATE USEFIRST ARG59 :
    MATCH "" -> GOTO ARG60;
    TRUE -> STOP;

STATE USEFIRST ARG60 :
    MATCH "cur += best" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG69 :
    TRUE -> STOP;

END AUTOMATON
