CONTROL AUTOMATON ErrorPath2

INITIAL STATE ARG0;

STATE USEFIRST ARG0 :
    MATCH "" -> GOTO ARG3;
    TRUE -> STOP;

STATE USEFIRST ARG3 :
    MATCH "extern int __VERIFIER_nondet_int(void);" -> GOTO ARG4;
    TRUE -> STOP;

STATE USEFIRST ARG4 :
    MATCH "int matroska_deliver_packet_slice_1(int q)" -> GOTO ARG6;
    TRUE -> STOP;

STATE USEFIRST ARG6 :
    MATCH "int flag = 0;" -> ASSUME {flag == (0);} GOTO ARG10;
    TRUE -> STOP;

STATE USEFIRST ARG10 :
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
    MATCH "int matroska = 11;" -> ASSUME {matroska == (11);} GOTO ARG19;
    TRUE -> STOP;

STATE USEFIRST ARG19 :
    MATCH "int res = 0;" -> ASSUME {res == (0);} GOTO ARG22;
    TRUE -> STOP;

STATE USEFIRST ARG22 :
    MATCH "" -> GOTO ARG33;
    TRUE -> STOP;

STATE USEFIRST ARG33 :
    MATCH "1" -> GOTO ARG36;
    TRUE -> STOP;

STATE USEFIRST ARG36 :
    MATCH "tmpVar0 = matroska_deliver_packet_slice_1(matroska);" -> GOTO ARG39;
    TRUE -> STOP;

STATE USEFIRST ARG39 :
    MATCH "" -> ASSUME {q == (11);} GOTO ARG40;
    TRUE -> STOP;

STATE USEFIRST ARG40 :
    MATCH "int __retres;" -> ASSUME {q == (11);} GOTO ARG41;
    TRUE -> STOP;

STATE USEFIRST ARG41 :
    MATCH "[!(q == 1)]" -> ASSUME {q == (11);} GOTO ARG45;
    TRUE -> STOP;

STATE USEFIRST ARG45 :
    MATCH "__retres = 1;" -> ASSUME {__retres == (1);} GOTO ARG46;
    TRUE -> STOP;

STATE USEFIRST ARG46 :
    MATCH "" -> GOTO ARG47;
    TRUE -> STOP;

STATE USEFIRST ARG47 :
    MATCH "return __retres;" -> GOTO ARG48;
    TRUE -> STOP;

STATE USEFIRST ARG48 :
    MATCH "" -> GOTO ARG53;
    TRUE -> STOP;

STATE USEFIRST ARG53 :
    MATCH "[!(! tmpVar0)]" -> ASSUME {tmpVar0 == (1);} GOTO ARG56;
    TRUE -> STOP;

STATE USEFIRST ARG56 :
    MATCH "" -> GOTO ARG57;
    TRUE -> STOP;

STATE USEFIRST ARG57 :
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
    MATCH "tmp = 3;" -> ASSUME {tmp == (3);} GOTO ARG75;
    TRUE -> STOP;

STATE USEFIRST ARG75 :
    MATCH "__retres = tmp;" -> ASSUME {__retres == (3);} GOTO ARG76;
    TRUE -> STOP;

STATE USEFIRST ARG76 :
    MATCH "goto return_label;" -> GOTO ARG77;
    TRUE -> STOP;

STATE USEFIRST ARG77 :
    MATCH "return __retres;" -> GOTO ARG78;
    TRUE -> STOP;

STATE USEFIRST ARG78 :
    MATCH "" -> GOTO ARG79;
    TRUE -> STOP;

STATE USEFIRST ARG79 :
    MATCH "" -> GOTO ARG80;
    TRUE -> STOP;

STATE USEFIRST ARG80 :
    MATCH "" -> GOTO ARG81;
    TRUE -> STOP;

STATE USEFIRST ARG81 :
    MATCH "[!(res == 0)]" -> ASSUME {res == (3);} GOTO ARG120;
    TRUE -> STOP;

STATE USEFIRST ARG120 :
    MATCH "[!(res == -1)]" -> ASSUME {res == (3);} GOTO ARG125;
    TRUE -> STOP;

STATE USEFIRST ARG125 :
    MATCH "" -> GOTO ARG137;
    TRUE -> STOP;

STATE USEFIRST ARG137 :
    MATCH "1" -> GOTO ARG143;
    TRUE -> STOP;

STATE USEFIRST ARG143 :
    MATCH "tmpVar0 = matroska_deliver_packet_slice_1(matroska);" -> GOTO ARG144;
    TRUE -> STOP;

STATE USEFIRST ARG144 :
    MATCH "" -> ASSUME {q == (11);} GOTO ARG145;
    TRUE -> STOP;

STATE USEFIRST ARG145 :
    MATCH "int __retres;" -> ASSUME {q == (11);} GOTO ARG146;
    TRUE -> STOP;

STATE USEFIRST ARG146 :
    MATCH "[!(q == 1)]" -> ASSUME {q == (11);} GOTO ARG147;
    TRUE -> STOP;

STATE USEFIRST ARG147 :
    MATCH "__retres = 1;" -> ASSUME {__retres == (1);} GOTO ARG148;
    TRUE -> STOP;

STATE USEFIRST ARG148 :
    MATCH "" -> GOTO ARG151;
    TRUE -> STOP;

STATE USEFIRST ARG151 :
    MATCH "return __retres;" -> GOTO ARG152;
    TRUE -> STOP;

STATE USEFIRST ARG152 :
    MATCH "" -> GOTO ARG153;
    TRUE -> STOP;

STATE USEFIRST ARG153 :
    MATCH "[!(! tmpVar0)]" -> ASSUME {tmpVar0 == (1);} GOTO ARG158;
    TRUE -> STOP;

STATE USEFIRST ARG158 :
    MATCH "" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG165 :
    TRUE -> STOP;

END AUTOMATON
