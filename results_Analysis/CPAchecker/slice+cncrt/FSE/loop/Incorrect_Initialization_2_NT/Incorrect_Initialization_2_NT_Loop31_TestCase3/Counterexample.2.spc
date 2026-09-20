CONTROL AUTOMATON ErrorPath2

INITIAL STATE ARG0;

STATE USEFIRST ARG0 :
    MATCH "" -> GOTO ARG3;
    TRUE -> STOP;

STATE USEFIRST ARG3 :
    MATCH "extern int __VERIFIER_nondet_int(void);" -> GOTO ARG5;
    TRUE -> STOP;

STATE USEFIRST ARG5 :
    MATCH "int matroska_deliver_packet_slice_1(int q)" -> GOTO ARG7;
    TRUE -> STOP;

STATE USEFIRST ARG7 :
    MATCH "int flag = 0;" -> ASSUME {flag == (0);} GOTO ARG11;
    TRUE -> STOP;

STATE USEFIRST ARG11 :
    MATCH "int res_return_slice_1(void)" -> GOTO ARG12;
    TRUE -> STOP;

STATE USEFIRST ARG12 :
    MATCH "void main(void)" -> GOTO ARG13;
    TRUE -> STOP;

STATE USEFIRST ARG13 :
    MATCH "" -> GOTO ARG14;
    TRUE -> STOP;

STATE USEFIRST ARG14 :
    MATCH "int tmpVar0;" -> GOTO ARG16;
    TRUE -> STOP;

STATE USEFIRST ARG16 :
    MATCH "int matroska = 3;" -> ASSUME {matroska == (3);} GOTO ARG19;
    TRUE -> STOP;

STATE USEFIRST ARG19 :
    MATCH "int res = 0;" -> ASSUME {res == (0);} GOTO ARG22;
    TRUE -> STOP;

STATE USEFIRST ARG22 :
    MATCH "" -> GOTO ARG33;
    TRUE -> STOP;

STATE USEFIRST ARG33 :
    MATCH "1" -> GOTO ARG35;
    TRUE -> STOP;

STATE USEFIRST ARG35 :
    MATCH "tmpVar0 = matroska_deliver_packet_slice_1(matroska);" -> GOTO ARG39;
    TRUE -> STOP;

STATE USEFIRST ARG39 :
    MATCH "" -> ASSUME {q == (3);} GOTO ARG40;
    TRUE -> STOP;

STATE USEFIRST ARG40 :
    MATCH "int __retres;" -> ASSUME {q == (3);} GOTO ARG42;
    TRUE -> STOP;

STATE USEFIRST ARG42 :
    MATCH "[!(q == 1)]" -> ASSUME {q == (3);} GOTO ARG43;
    TRUE -> STOP;

STATE USEFIRST ARG43 :
    MATCH "__retres = 1;" -> ASSUME {__retres == (1);} GOTO ARG46;
    TRUE -> STOP;

STATE USEFIRST ARG46 :
    MATCH "" -> GOTO ARG47;
    TRUE -> STOP;

STATE USEFIRST ARG47 :
    MATCH "return __retres;" -> GOTO ARG48;
    TRUE -> STOP;

STATE USEFIRST ARG48 :
    MATCH "" -> GOTO ARG51;
    TRUE -> STOP;

STATE USEFIRST ARG51 :
    MATCH "[!(! tmpVar0)]" -> ASSUME {tmpVar0 == (1);} GOTO ARG56;
    TRUE -> STOP;

STATE USEFIRST ARG56 :
    MATCH "" -> GOTO ARG57;
    TRUE -> STOP;

STATE USEFIRST ARG57 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG60;
    TRUE -> STOP;

STATE USEFIRST ARG60 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG61;
    TRUE -> STOP;

STATE USEFIRST ARG61 :
    MATCH "switch (id)" -> GOTO ARG62;
    TRUE -> STOP;

STATE USEFIRST ARG62 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG63;
    TRUE -> STOP;

STATE USEFIRST ARG63 :
    MATCH "tmp_1 = res_return_slice_1();" -> GOTO ARG64;
    TRUE -> STOP;

STATE USEFIRST ARG64 :
    MATCH "" -> GOTO ARG65;
    TRUE -> STOP;

STATE USEFIRST ARG65 :
    MATCH "int __retres;" -> GOTO ARG66;
    TRUE -> STOP;

STATE USEFIRST ARG66 :
    MATCH "int tmp_0;" -> GOTO ARG67;
    TRUE -> STOP;

STATE USEFIRST ARG67 :
    MATCH "tmp_0 = flag;" -> ASSUME {tmp_0 == (0);} GOTO ARG68;
    TRUE -> STOP;

STATE USEFIRST ARG68 :
    MATCH "flag ++;" -> ASSUME {__CPAchecker_TMP_0 == (0);} GOTO ARG69;
    TRUE -> STOP;

STATE USEFIRST ARG69 :
    MATCH "flag ++;" -> ASSUME {flag == (1);} GOTO ARG70;
    TRUE -> STOP;

STATE USEFIRST ARG70 :
    MATCH "flag ++;" -> GOTO ARG71;
    TRUE -> STOP;

STATE USEFIRST ARG71 :
    MATCH "[tmp_0 < 100]" -> ASSUME {tmp_0 == (0);} GOTO ARG72;
    TRUE -> STOP;

STATE USEFIRST ARG72 :
    MATCH "int tmp;" -> GOTO ARG73;
    TRUE -> STOP;

STATE USEFIRST ARG73 :
    MATCH "tmp = -1;" -> ASSUME {tmp == (-1);} GOTO ARG74;
    TRUE -> STOP;

STATE USEFIRST ARG74 :
    MATCH "__retres = tmp;" -> ASSUME {__retres == (-1);} GOTO ARG75;
    TRUE -> STOP;

STATE USEFIRST ARG75 :
    MATCH "goto return_label;" -> GOTO ARG76;
    TRUE -> STOP;

STATE USEFIRST ARG76 :
    MATCH "return __retres;" -> GOTO ARG77;
    TRUE -> STOP;

STATE USEFIRST ARG77 :
    MATCH "" -> GOTO ARG78;
    TRUE -> STOP;

STATE USEFIRST ARG78 :
    MATCH "res = tmp_1 < 0;" -> ASSUME {res == (1);} GOTO ARG79;
    TRUE -> STOP;

STATE USEFIRST ARG79 :
    MATCH "[res]" -> ASSUME {res == (1);} GOTO ARG89;
    TRUE -> STOP;

STATE USEFIRST ARG89 :
    MATCH "break;" -> GOTO ARG91;
    TRUE -> STOP;

STATE USEFIRST ARG91 :
    MATCH "" -> GOTO ARG105;
    TRUE -> STOP;

STATE USEFIRST ARG105 :
    MATCH "[!(res == 0)]" -> ASSUME {res == (1);} GOTO ARG147;
    TRUE -> STOP;

STATE USEFIRST ARG147 :
    MATCH "[!(res == -1)]" -> ASSUME {res == (1);} GOTO ARG150;
    TRUE -> STOP;

STATE USEFIRST ARG150 :
    MATCH "" -> GOTO ARG158;
    TRUE -> STOP;

STATE USEFIRST ARG158 :
    MATCH "1" -> GOTO ARG161;
    TRUE -> STOP;

STATE USEFIRST ARG161 :
    MATCH "tmpVar0 = matroska_deliver_packet_slice_1(matroska);" -> GOTO ARG162;
    TRUE -> STOP;

STATE USEFIRST ARG162 :
    MATCH "" -> ASSUME {q == (3);} GOTO ARG165;
    TRUE -> STOP;

STATE USEFIRST ARG165 :
    MATCH "int __retres;" -> ASSUME {q == (3);} GOTO ARG168;
    TRUE -> STOP;

STATE USEFIRST ARG168 :
    MATCH "[!(q == 1)]" -> ASSUME {q == (3);} GOTO ARG169;
    TRUE -> STOP;

STATE USEFIRST ARG169 :
    MATCH "__retres = 1;" -> ASSUME {__retres == (1);} GOTO ARG170;
    TRUE -> STOP;

STATE USEFIRST ARG170 :
    MATCH "" -> GOTO ARG171;
    TRUE -> STOP;

STATE USEFIRST ARG171 :
    MATCH "return __retres;" -> GOTO ARG174;
    TRUE -> STOP;

STATE USEFIRST ARG174 :
    MATCH "" -> GOTO ARG179;
    TRUE -> STOP;

STATE USEFIRST ARG179 :
    MATCH "[!(! tmpVar0)]" -> ASSUME {tmpVar0 == (1);} GOTO ARG184;
    TRUE -> STOP;

STATE USEFIRST ARG184 :
    MATCH "" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG192 :
    TRUE -> STOP;

END AUTOMATON
