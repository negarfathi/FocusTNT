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
    MATCH "int matroska = 8;" -> ASSUME {matroska == (8);} GOTO ARG19;
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
    MATCH "" -> ASSUME {q == (8);} GOTO ARG40;
    TRUE -> STOP;

STATE USEFIRST ARG40 :
    MATCH "int __retres;" -> ASSUME {q == (8);} GOTO ARG42;
    TRUE -> STOP;

STATE USEFIRST ARG42 :
    MATCH "[!(q == 1)]" -> ASSUME {q == (8);} GOTO ARG45;
    TRUE -> STOP;

STATE USEFIRST ARG45 :
    MATCH "__retres = 1;" -> ASSUME {__retres == (1);} GOTO ARG51;
    TRUE -> STOP;

STATE USEFIRST ARG51 :
    MATCH "" -> GOTO ARG53;
    TRUE -> STOP;

STATE USEFIRST ARG53 :
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
    MATCH "tmp = 6;" -> ASSUME {tmp == (6);} GOTO ARG75;
    TRUE -> STOP;

STATE USEFIRST ARG75 :
    MATCH "__retres = tmp;" -> ASSUME {__retres == (6);} GOTO ARG76;
    TRUE -> STOP;

STATE USEFIRST ARG76 :
    MATCH "goto return_label;" -> GOTO ARG77;
    TRUE -> STOP;

STATE USEFIRST ARG77 :
    MATCH "return __retres;" -> GOTO ARG78;
    TRUE -> STOP;

STATE USEFIRST ARG78 :
    MATCH "" -> GOTO ARG93;
    TRUE -> STOP;

STATE USEFIRST ARG93 :
    MATCH "" -> GOTO ARG95;
    TRUE -> STOP;

STATE USEFIRST ARG95 :
    MATCH "" -> GOTO ARG104;
    TRUE -> STOP;

STATE USEFIRST ARG104 :
    MATCH "[!(res == 0)]" -> ASSUME {res == (6);} GOTO ARG140;
    TRUE -> STOP;

STATE USEFIRST ARG140 :
    MATCH "[!(res == -1)]" -> ASSUME {res == (6);} GOTO ARG141;
    TRUE -> STOP;

STATE USEFIRST ARG141 :
    MATCH "" -> GOTO ARG144;
    TRUE -> STOP;

STATE USEFIRST ARG144 :
    MATCH "1" -> GOTO ARG151;
    TRUE -> STOP;

STATE USEFIRST ARG151 :
    MATCH "tmpVar0 = matroska_deliver_packet_slice_1(matroska);" -> GOTO ARG154;
    TRUE -> STOP;

STATE USEFIRST ARG154 :
    MATCH "" -> ASSUME {q == (8);} GOTO ARG155;
    TRUE -> STOP;

STATE USEFIRST ARG155 :
    MATCH "int __retres;" -> ASSUME {q == (8);} GOTO ARG156;
    TRUE -> STOP;

STATE USEFIRST ARG156 :
    MATCH "[!(q == 1)]" -> ASSUME {q == (8);} GOTO ARG164;
    TRUE -> STOP;

STATE USEFIRST ARG164 :
    MATCH "__retres = 1;" -> ASSUME {__retres == (1);} GOTO ARG165;
    TRUE -> STOP;

STATE USEFIRST ARG165 :
    MATCH "" -> GOTO ARG168;
    TRUE -> STOP;

STATE USEFIRST ARG168 :
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

STATE USEFIRST ARG184 :
    TRUE -> STOP;

END AUTOMATON
