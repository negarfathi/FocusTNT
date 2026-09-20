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
    MATCH "int tmpVar0;" -> GOTO ARG18;
    TRUE -> STOP;

STATE USEFIRST ARG18 :
    MATCH "int matroska = 2;" -> ASSUME {matroska == (2);} GOTO ARG19;
    TRUE -> STOP;

STATE USEFIRST ARG19 :
    MATCH "int res = 0;" -> ASSUME {res == (0);} GOTO ARG22;
    TRUE -> STOP;

STATE USEFIRST ARG22 :
    MATCH "" -> GOTO ARG32;
    TRUE -> STOP;

STATE USEFIRST ARG32 :
    MATCH "1" -> GOTO ARG34;
    TRUE -> STOP;

STATE USEFIRST ARG34 :
    MATCH "tmpVar0 = matroska_deliver_packet_slice_1(matroska);" -> GOTO ARG36;
    TRUE -> STOP;

STATE USEFIRST ARG36 :
    MATCH "" -> ASSUME {q == (2);} GOTO ARG38;
    TRUE -> STOP;

STATE USEFIRST ARG38 :
    MATCH "int __retres;" -> ASSUME {q == (2);} GOTO ARG41;
    TRUE -> STOP;

STATE USEFIRST ARG41 :
    MATCH "[!(q == 1)]" -> ASSUME {q == (2);} GOTO ARG45;
    TRUE -> STOP;

STATE USEFIRST ARG45 :
    MATCH "__retres = 1;" -> ASSUME {__retres == (1);} GOTO ARG46;
    TRUE -> STOP;

STATE USEFIRST ARG46 :
    MATCH "" -> GOTO ARG47;
    TRUE -> STOP;

STATE USEFIRST ARG47 :
    MATCH "return __retres;" -> GOTO ARG50;
    TRUE -> STOP;

STATE USEFIRST ARG50 :
    MATCH "" -> GOTO ARG55;
    TRUE -> STOP;

STATE USEFIRST ARG55 :
    MATCH "[!(! tmpVar0)]" -> ASSUME {tmpVar0 == (1);} GOTO ARG56;
    TRUE -> STOP;

STATE USEFIRST ARG56 :
    MATCH "" -> GOTO ARG59;
    TRUE -> STOP;

STATE USEFIRST ARG59 :
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
    MATCH "tmp = 0;" -> ASSUME {tmp == (0);} GOTO ARG74;
    TRUE -> STOP;

STATE USEFIRST ARG74 :
    MATCH "__retres = tmp;" -> ASSUME {__retres == (0);} GOTO ARG75;
    TRUE -> STOP;

STATE USEFIRST ARG75 :
    MATCH "goto return_label;" -> GOTO ARG76;
    TRUE -> STOP;

STATE USEFIRST ARG76 :
    MATCH "return __retres;" -> GOTO ARG77;
    TRUE -> STOP;

STATE USEFIRST ARG77 :
    MATCH "" -> GOTO ARG86;
    TRUE -> STOP;

STATE USEFIRST ARG86 :
    MATCH "res = tmp_1 < 0;" -> ASSUME {res == (0);} GOTO ARG92;
    TRUE -> STOP;

STATE USEFIRST ARG92 :
    MATCH "[!(res)]" -> ASSUME {res == (0);} GOTO ARG95;
    TRUE -> STOP;

STATE USEFIRST ARG95 :
    MATCH "tmp_2 = res_return_slice_1();" -> GOTO ARG96;
    TRUE -> STOP;

STATE USEFIRST ARG96 :
    MATCH "" -> GOTO ARG99;
    TRUE -> STOP;

STATE USEFIRST ARG99 :
    MATCH "int __retres;" -> GOTO ARG102;
    TRUE -> STOP;

STATE USEFIRST ARG102 :
    MATCH "int tmp_0;" -> GOTO ARG106;
    TRUE -> STOP;

STATE USEFIRST ARG106 :
    MATCH "tmp_0 = flag;" -> ASSUME {tmp_0 == (1);} GOTO ARG108;
    TRUE -> STOP;

STATE USEFIRST ARG108 :
    MATCH "flag ++;" -> ASSUME {__CPAchecker_TMP_0 == (1);} GOTO ARG110;
    TRUE -> STOP;

STATE USEFIRST ARG110 :
    MATCH "flag ++;" -> ASSUME {flag == (2);} GOTO ARG113;
    TRUE -> STOP;

STATE USEFIRST ARG113 :
    MATCH "flag ++;" -> GOTO ARG114;
    TRUE -> STOP;

STATE USEFIRST ARG114 :
    MATCH "[tmp_0 < 100]" -> ASSUME {tmp_0 == (1);} GOTO ARG115;
    TRUE -> STOP;

STATE USEFIRST ARG115 :
    MATCH "int tmp;" -> GOTO ARG116;
    TRUE -> STOP;

STATE USEFIRST ARG116 :
    MATCH "tmp = 0;" -> ASSUME {tmp == (0);} GOTO ARG119;
    TRUE -> STOP;

STATE USEFIRST ARG119 :
    MATCH "__retres = tmp;" -> ASSUME {__retres == (0);} GOTO ARG126;
    TRUE -> STOP;

STATE USEFIRST ARG126 :
    MATCH "goto return_label;" -> GOTO ARG127;
    TRUE -> STOP;

STATE USEFIRST ARG127 :
    MATCH "return __retres;" -> GOTO ARG132;
    TRUE -> STOP;

STATE USEFIRST ARG132 :
    MATCH "" -> GOTO ARG141;
    TRUE -> STOP;

STATE USEFIRST ARG141 :
    MATCH "res = tmp_2 == 0;" -> ASSUME {res == (1);} GOTO ARG146;
    TRUE -> STOP;

STATE USEFIRST ARG146 :
    MATCH "[res]" -> ASSUME {res == (1);} GOTO ARG153;
    TRUE -> STOP;

STATE USEFIRST ARG153 :
    MATCH "res = 1;" -> ASSUME {res == (1);} GOTO ARG156;
    TRUE -> STOP;

STATE USEFIRST ARG156 :
    MATCH "" -> GOTO ARG157;
    TRUE -> STOP;

STATE USEFIRST ARG157 :
    MATCH "break;" -> GOTO ARG158;
    TRUE -> STOP;

STATE USEFIRST ARG158 :
    MATCH "" -> GOTO ARG159;
    TRUE -> STOP;

STATE USEFIRST ARG159 :
    MATCH "[!(res == 0)]" -> ASSUME {res == (1);} GOTO ARG206;
    TRUE -> STOP;

STATE USEFIRST ARG206 :
    MATCH "[!(res == -1)]" -> ASSUME {res == (1);} GOTO ARG207;
    TRUE -> STOP;

STATE USEFIRST ARG207 :
    MATCH "" -> GOTO ARG218;
    TRUE -> STOP;

STATE USEFIRST ARG218 :
    MATCH "1" -> GOTO ARG226;
    TRUE -> STOP;

STATE USEFIRST ARG226 :
    MATCH "tmpVar0 = matroska_deliver_packet_slice_1(matroska);" -> GOTO ARG231;
    TRUE -> STOP;

STATE USEFIRST ARG231 :
    MATCH "" -> ASSUME {q == (2);} GOTO ARG232;
    TRUE -> STOP;

STATE USEFIRST ARG232 :
    MATCH "int __retres;" -> ASSUME {q == (2);} GOTO ARG233;
    TRUE -> STOP;

STATE USEFIRST ARG233 :
    MATCH "[!(q == 1)]" -> ASSUME {q == (2);} GOTO ARG240;
    TRUE -> STOP;

STATE USEFIRST ARG240 :
    MATCH "__retres = 1;" -> ASSUME {__retres == (1);} GOTO ARG241;
    TRUE -> STOP;

STATE USEFIRST ARG241 :
    MATCH "" -> GOTO ARG244;
    TRUE -> STOP;

STATE USEFIRST ARG244 :
    MATCH "return __retres;" -> GOTO ARG247;
    TRUE -> STOP;

STATE USEFIRST ARG247 :
    MATCH "" -> GOTO ARG248;
    TRUE -> STOP;

STATE USEFIRST ARG248 :
    MATCH "[!(! tmpVar0)]" -> ASSUME {tmpVar0 == (1);} GOTO ARG256;
    TRUE -> STOP;

STATE USEFIRST ARG256 :
    MATCH "" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG267 :
    TRUE -> STOP;

END AUTOMATON
