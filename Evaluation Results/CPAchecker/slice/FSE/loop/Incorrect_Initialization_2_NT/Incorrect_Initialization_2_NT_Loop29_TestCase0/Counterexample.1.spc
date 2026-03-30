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
    MATCH "int flag = 0;" -> ASSUME {flag == (0);} GOTO ARG8;
    TRUE -> STOP;

STATE USEFIRST ARG8 :
    MATCH "int res_return_slice_1(void)" -> GOTO ARG9;
    TRUE -> STOP;

STATE USEFIRST ARG9 :
    MATCH "void main(void)" -> GOTO ARG10;
    TRUE -> STOP;

STATE USEFIRST ARG10 :
    MATCH "" -> GOTO ARG11;
    TRUE -> STOP;

STATE USEFIRST ARG11 :
    MATCH "int tmpVar0;" -> GOTO ARG12;
    TRUE -> STOP;

STATE USEFIRST ARG12 :
    MATCH "int matroska = __VERIFIER_nondet_int();" -> GOTO ARG13;
    TRUE -> STOP;

STATE USEFIRST ARG13 :
    MATCH "int matroska = __VERIFIER_nondet_int();" -> GOTO ARG17;
    TRUE -> STOP;

STATE USEFIRST ARG17 :
    MATCH "int res = 0;" -> ASSUME {res == (0);} GOTO ARG21;
    TRUE -> STOP;

STATE USEFIRST ARG21 :
    MATCH "" -> GOTO ARG26;
    TRUE -> STOP;

STATE USEFIRST ARG26 :
    MATCH "1" -> GOTO ARG27;
    TRUE -> STOP;

STATE USEFIRST ARG27 :
    MATCH "tmpVar0 = matroska_deliver_packet_slice_1(matroska);" -> GOTO ARG28;
    TRUE -> STOP;

STATE USEFIRST ARG28 :
    MATCH "" -> GOTO ARG31;
    TRUE -> STOP;

STATE USEFIRST ARG31 :
    MATCH "int __retres;" -> GOTO ARG34;
    TRUE -> STOP;

STATE USEFIRST ARG34 :
    MATCH "[!(q == 1)]" -> GOTO ARG44;
    TRUE -> STOP;

STATE USEFIRST ARG44 :
    MATCH "__retres = 1;" -> ASSUME {__retres == (1);} GOTO ARG46;
    TRUE -> STOP;

STATE USEFIRST ARG46 :
    MATCH "" -> GOTO ARG47;
    TRUE -> STOP;

STATE USEFIRST ARG47 :
    MATCH "return __retres;" -> GOTO ARG50;
    TRUE -> STOP;

STATE USEFIRST ARG50 :
    MATCH "" -> GOTO ARG51;
    TRUE -> STOP;

STATE USEFIRST ARG51 :
    MATCH "[!(! tmpVar0)]" -> ASSUME {tmpVar0 == (1);} GOTO ARG58;
    TRUE -> STOP;

STATE USEFIRST ARG58 :
    MATCH "" -> GOTO ARG59;
    TRUE -> STOP;

STATE USEFIRST ARG59 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG62;
    TRUE -> STOP;

STATE USEFIRST ARG62 :
    MATCH "int id = __VERIFIER_nondet_int();" -> GOTO ARG63;
    TRUE -> STOP;

STATE USEFIRST ARG63 :
    MATCH "int id = __VERIFIER_nondet_int();" -> GOTO ARG64;
    TRUE -> STOP;

STATE USEFIRST ARG64 :
    MATCH "switch (id)" -> GOTO ARG65;
    TRUE -> STOP;

STATE USEFIRST ARG65 :
    MATCH "[!(id == 1)]" -> GOTO ARG67;
    TRUE -> STOP;

STATE USEFIRST ARG67 :
    MATCH "[!(id == 2)]" -> GOTO ARG69;
    TRUE -> STOP;

STATE USEFIRST ARG69 :
    MATCH "switch (id) {\n        int tmp_1;\n        int tmp_2;\n        case 1:\n        {\n          tmp_1 = res_return_slice_1();\n          res = tmp_1 < 0;\n        }\n        if (res) {\n\n\n          break;\n        }\n        tmp_2 = res_return_slice_1();\n        res = tmp_2 == 0;\n        if (res) res = 1;\n\n\n        break;\n        default: case 2: res = res_return_slice_1();\n\n\n      }" -> GOTO ARG70;
    TRUE -> STOP;

STATE USEFIRST ARG70 :
    MATCH "" -> GOTO ARG71;
    TRUE -> STOP;

STATE USEFIRST ARG71 :
    MATCH "res = res_return_slice_1();" -> GOTO ARG72;
    TRUE -> STOP;

STATE USEFIRST ARG72 :
    MATCH "" -> GOTO ARG73;
    TRUE -> STOP;

STATE USEFIRST ARG73 :
    MATCH "int __retres;" -> GOTO ARG74;
    TRUE -> STOP;

STATE USEFIRST ARG74 :
    MATCH "int tmp_0;" -> GOTO ARG75;
    TRUE -> STOP;

STATE USEFIRST ARG75 :
    MATCH "tmp_0 = flag;" -> ASSUME {tmp_0 == (0);} GOTO ARG76;
    TRUE -> STOP;

STATE USEFIRST ARG76 :
    MATCH "flag ++;" -> ASSUME {__CPAchecker_TMP_0 == (0);} GOTO ARG77;
    TRUE -> STOP;

STATE USEFIRST ARG77 :
    MATCH "flag ++;" -> ASSUME {flag == (1);} GOTO ARG78;
    TRUE -> STOP;

STATE USEFIRST ARG78 :
    MATCH "flag ++;" -> GOTO ARG79;
    TRUE -> STOP;

STATE USEFIRST ARG79 :
    MATCH "[tmp_0 < 100]" -> ASSUME {tmp_0 == (0);} GOTO ARG80;
    TRUE -> STOP;

STATE USEFIRST ARG80 :
    MATCH "int tmp;" -> GOTO ARG81;
    TRUE -> STOP;

STATE USEFIRST ARG81 :
    MATCH "tmp = __VERIFIER_nondet_int();" -> GOTO ARG82;
    TRUE -> STOP;

STATE USEFIRST ARG82 :
    MATCH "__retres = tmp;" -> GOTO ARG83;
    TRUE -> STOP;

STATE USEFIRST ARG83 :
    MATCH "goto return_label;" -> GOTO ARG84;
    TRUE -> STOP;

STATE USEFIRST ARG84 :
    MATCH "return __retres;" -> GOTO ARG85;
    TRUE -> STOP;

STATE USEFIRST ARG85 :
    MATCH "" -> GOTO ARG103;
    TRUE -> STOP;

STATE USEFIRST ARG103 :
    MATCH "" -> GOTO ARG106;
    TRUE -> STOP;

STATE USEFIRST ARG106 :
    MATCH "" -> GOTO ARG112;
    TRUE -> STOP;

STATE USEFIRST ARG112 :
    MATCH "[!(res == 0)]" -> GOTO ARG148;
    TRUE -> STOP;

STATE USEFIRST ARG148 :
    MATCH "[!(res == -1)]" -> GOTO ARG150;
    TRUE -> STOP;

STATE USEFIRST ARG150 :
    MATCH "" -> GOTO ARG158;
    TRUE -> STOP;

STATE USEFIRST ARG158 :
    MATCH "1" -> GOTO ARG162;
    TRUE -> STOP;

STATE USEFIRST ARG162 :
    MATCH "tmpVar0 = matroska_deliver_packet_slice_1(matroska);" -> GOTO ARG164;
    TRUE -> STOP;

STATE USEFIRST ARG164 :
    MATCH "" -> GOTO ARG166;
    TRUE -> STOP;

STATE USEFIRST ARG166 :
    MATCH "int __retres;" -> GOTO ARG170;
    TRUE -> STOP;

STATE USEFIRST ARG170 :
    MATCH "[!(q == 1)]" -> GOTO ARG174;
    TRUE -> STOP;

STATE USEFIRST ARG174 :
    MATCH "__retres = 1;" -> ASSUME {__retres == (1);} GOTO ARG179;
    TRUE -> STOP;

STATE USEFIRST ARG179 :
    MATCH "" -> GOTO ARG180;
    TRUE -> STOP;

STATE USEFIRST ARG180 :
    MATCH "return __retres;" -> GOTO ARG181;
    TRUE -> STOP;

STATE USEFIRST ARG181 :
    MATCH "" -> GOTO ARG182;
    TRUE -> STOP;

STATE USEFIRST ARG182 :
    MATCH "[!(! tmpVar0)]" -> ASSUME {tmpVar0 == (1);} GOTO ARG183;
    TRUE -> STOP;

STATE USEFIRST ARG183 :
    MATCH "" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG194 :
    TRUE -> STOP;

END AUTOMATON
