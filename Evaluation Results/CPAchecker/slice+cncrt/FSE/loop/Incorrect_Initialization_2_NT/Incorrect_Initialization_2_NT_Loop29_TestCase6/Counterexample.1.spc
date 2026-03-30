CONTROL AUTOMATON ErrorPath1

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
    MATCH "int tmpVar0;" -> GOTO ARG18;
    TRUE -> STOP;

STATE USEFIRST ARG18 :
    MATCH "int matroska = 2;" -> ASSUME {matroska == (2);} GOTO ARG22;
    TRUE -> STOP;

STATE USEFIRST ARG22 :
    MATCH "int res = 0;" -> ASSUME {res == (0);} GOTO ARG24;
    TRUE -> STOP;

STATE USEFIRST ARG24 :
    MATCH "" -> GOTO ARG37;
    TRUE -> STOP;

STATE USEFIRST ARG37 :
    MATCH "1" -> GOTO ARG38;
    TRUE -> STOP;

STATE USEFIRST ARG38 :
    MATCH "tmpVar0 = matroska_deliver_packet_slice_1(matroska);" -> GOTO ARG39;
    TRUE -> STOP;

STATE USEFIRST ARG39 :
    MATCH "" -> ASSUME {q == (2);} GOTO ARG41;
    TRUE -> STOP;

STATE USEFIRST ARG41 :
    MATCH "int __retres;" -> ASSUME {q == (2);} GOTO ARG42;
    TRUE -> STOP;

STATE USEFIRST ARG42 :
    MATCH "[!(q == 1)]" -> ASSUME {q == (2);} GOTO ARG45;
    TRUE -> STOP;

STATE USEFIRST ARG45 :
    MATCH "__retres = 1;" -> ASSUME {__retres == (1);} GOTO ARG48;
    TRUE -> STOP;

STATE USEFIRST ARG48 :
    MATCH "" -> GOTO ARG52;
    TRUE -> STOP;

STATE USEFIRST ARG52 :
    MATCH "return __retres;" -> GOTO ARG54;
    TRUE -> STOP;

STATE USEFIRST ARG54 :
    MATCH "" -> GOTO ARG56;
    TRUE -> STOP;

STATE USEFIRST ARG56 :
    MATCH "[!(! tmpVar0)]" -> ASSUME {tmpVar0 == (1);} GOTO ARG58;
    TRUE -> STOP;

STATE USEFIRST ARG58 :
    MATCH "" -> GOTO ARG59;
    TRUE -> STOP;

STATE USEFIRST ARG59 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG60;
    TRUE -> STOP;

STATE USEFIRST ARG60 :
    MATCH "int id = 2;" -> ASSUME {id == (2);} GOTO ARG61;
    TRUE -> STOP;

STATE USEFIRST ARG61 :
    MATCH "switch (id)" -> GOTO ARG62;
    TRUE -> STOP;

STATE USEFIRST ARG62 :
    MATCH "[!(id == 1)]" -> ASSUME {id == (2);} GOTO ARG63;
    TRUE -> STOP;

STATE USEFIRST ARG63 :
    MATCH "[id == 2]" -> ASSUME {id == (2);} GOTO ARG64;
    TRUE -> STOP;

STATE USEFIRST ARG64 :
    MATCH "res = res_return_slice_1();" -> GOTO ARG65;
    TRUE -> STOP;

STATE USEFIRST ARG65 :
    MATCH "" -> GOTO ARG66;
    TRUE -> STOP;

STATE USEFIRST ARG66 :
    MATCH "int __retres;" -> GOTO ARG67;
    TRUE -> STOP;

STATE USEFIRST ARG67 :
    MATCH "int tmp_0;" -> GOTO ARG68;
    TRUE -> STOP;

STATE USEFIRST ARG68 :
    MATCH "tmp_0 = flag;" -> ASSUME {tmp_0 == (0);} GOTO ARG69;
    TRUE -> STOP;

STATE USEFIRST ARG69 :
    MATCH "flag ++;" -> ASSUME {__CPAchecker_TMP_0 == (0);} GOTO ARG70;
    TRUE -> STOP;

STATE USEFIRST ARG70 :
    MATCH "flag ++;" -> ASSUME {flag == (1);} GOTO ARG71;
    TRUE -> STOP;

STATE USEFIRST ARG71 :
    MATCH "flag ++;" -> GOTO ARG72;
    TRUE -> STOP;

STATE USEFIRST ARG72 :
    MATCH "[tmp_0 < 100]" -> ASSUME {tmp_0 == (0);} GOTO ARG73;
    TRUE -> STOP;

STATE USEFIRST ARG73 :
    MATCH "int tmp;" -> GOTO ARG74;
    TRUE -> STOP;

STATE USEFIRST ARG74 :
    MATCH "tmp = 5;" -> ASSUME {tmp == (5);} GOTO ARG75;
    TRUE -> STOP;

STATE USEFIRST ARG75 :
    MATCH "__retres = tmp;" -> ASSUME {__retres == (5);} GOTO ARG76;
    TRUE -> STOP;

STATE USEFIRST ARG76 :
    MATCH "goto return_label;" -> GOTO ARG77;
    TRUE -> STOP;

STATE USEFIRST ARG77 :
    MATCH "return __retres;" -> GOTO ARG78;
    TRUE -> STOP;

STATE USEFIRST ARG78 :
    MATCH "" -> GOTO ARG94;
    TRUE -> STOP;

STATE USEFIRST ARG94 :
    MATCH "" -> GOTO ARG95;
    TRUE -> STOP;

STATE USEFIRST ARG95 :
    MATCH "" -> GOTO ARG106;
    TRUE -> STOP;

STATE USEFIRST ARG106 :
    MATCH "[!(res == 0)]" -> ASSUME {res == (5);} GOTO ARG140;
    TRUE -> STOP;

STATE USEFIRST ARG140 :
    MATCH "[!(res == -1)]" -> ASSUME {res == (5);} GOTO ARG141;
    TRUE -> STOP;

STATE USEFIRST ARG141 :
    MATCH "" -> GOTO ARG148;
    TRUE -> STOP;

STATE USEFIRST ARG148 :
    MATCH "1" -> GOTO ARG153;
    TRUE -> STOP;

STATE USEFIRST ARG153 :
    MATCH "tmpVar0 = matroska_deliver_packet_slice_1(matroska);" -> GOTO ARG159;
    TRUE -> STOP;

STATE USEFIRST ARG159 :
    MATCH "" -> ASSUME {q == (2);} GOTO ARG160;
    TRUE -> STOP;

STATE USEFIRST ARG160 :
    MATCH "int __retres;" -> ASSUME {q == (2);} GOTO ARG161;
    TRUE -> STOP;

STATE USEFIRST ARG161 :
    MATCH "[!(q == 1)]" -> ASSUME {q == (2);} GOTO ARG164;
    TRUE -> STOP;

STATE USEFIRST ARG164 :
    MATCH "__retres = 1;" -> ASSUME {__retres == (1);} GOTO ARG169;
    TRUE -> STOP;

STATE USEFIRST ARG169 :
    MATCH "" -> GOTO ARG170;
    TRUE -> STOP;

STATE USEFIRST ARG170 :
    MATCH "return __retres;" -> GOTO ARG171;
    TRUE -> STOP;

STATE USEFIRST ARG171 :
    MATCH "" -> GOTO ARG172;
    TRUE -> STOP;

STATE USEFIRST ARG172 :
    MATCH "[!(! tmpVar0)]" -> ASSUME {tmpVar0 == (1);} GOTO ARG173;
    TRUE -> STOP;

STATE USEFIRST ARG173 :
    MATCH "" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG185 :
    TRUE -> STOP;

END AUTOMATON
