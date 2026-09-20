CONTROL AUTOMATON ErrorPath3

INITIAL STATE ARG0;

STATE USEFIRST ARG0 :
    MATCH "" -> GOTO ARG3;
    TRUE -> STOP;

STATE USEFIRST ARG3 :
    MATCH "extern int __VERIFIER_nondet_int(void);" -> GOTO ARG6;
    TRUE -> STOP;

STATE USEFIRST ARG6 :
    MATCH "int main()" -> GOTO ARG7;
    TRUE -> STOP;

STATE USEFIRST ARG7 :
    MATCH "" -> GOTO ARG8;
    TRUE -> STOP;

STATE USEFIRST ARG8 :
    MATCH "int i,j;" -> GOTO ARG9;
    TRUE -> STOP;

STATE USEFIRST ARG9 :
    MATCH "int i,j;" -> GOTO ARG10;
    TRUE -> STOP;

STATE USEFIRST ARG10 :
    MATCH "int num_crtc = 100;" -> ASSUME {num_crtc == (100);} GOTO ARG13;
    TRUE -> STOP;

STATE USEFIRST ARG13 :
    MATCH "int num_output = 50;" -> ASSUME {num_output == (50);} GOTO ARG14;
    TRUE -> STOP;

STATE USEFIRST ARG14 :
    MATCH "[!(num_crtc > 65534 || num_output > 65534)]" -> ASSUME {num_crtc == (100);} GOTO ARG22;
    TRUE -> STOP;

STATE USEFIRST ARG22 :
    MATCH "[!(num_crtc > 65534 || num_output > 65534)]" -> ASSUME {num_output == (50);} GOTO ARG24;
    TRUE -> STOP;

STATE USEFIRST ARG24 :
    MATCH "" -> GOTO ARG25;
    TRUE -> STOP;

STATE USEFIRST ARG25 :
    MATCH "i = 0" -> ASSUME {i == (0);} GOTO ARG37;
    TRUE -> STOP;

STATE USEFIRST ARG37 :
    MATCH "[i < num_crtc]" -> ASSUME {i == (0);num_crtc == (100);} GOTO ARG40;
    TRUE -> STOP;

STATE USEFIRST ARG40 :
    MATCH "" -> GOTO ARG41;
    TRUE -> STOP;

STATE USEFIRST ARG41 :
    MATCH "i = 0" -> ASSUME {i == (0);} GOTO ARG43;
    TRUE -> STOP;

STATE USEFIRST ARG43 :
    MATCH "[i < num_output]" -> ASSUME {i == (0);num_output == (50);} GOTO ARG44;
    TRUE -> STOP;

STATE USEFIRST ARG44 :
    MATCH "" -> GOTO ARG46;
    TRUE -> STOP;

STATE USEFIRST ARG46 :
    MATCH "i++" -> ASSUME {i == (1);} GOTO ARG47;
    TRUE -> STOP;

STATE USEFIRST ARG47 :
    MATCH "[i < num_output]" -> ASSUME {i == (1);num_output == (50);} GOTO ARG56;
    TRUE -> STOP;

STATE USEFIRST ARG56 :
    MATCH "" -> GOTO ARG58;
    TRUE -> STOP;

STATE USEFIRST ARG58 :
    MATCH "i++" -> ASSUME {i == (2);} GOTO ARG67;
    TRUE -> STOP;

STATE USEFIRST ARG67 :
    MATCH "[i < num_output]" -> ASSUME {i == (2);num_output == (50);} GOTO ARG70;
    TRUE -> STOP;

STATE USEFIRST ARG70 :
    MATCH "" -> GOTO ARG71;
    TRUE -> STOP;

STATE USEFIRST ARG71 :
    MATCH "i++" -> ASSUME {i == (3);} GOTO ARG76;
    TRUE -> STOP;

STATE USEFIRST ARG76 :
    MATCH "[i < num_output]" -> ASSUME {i == (3);num_output == (50);} GOTO ARG79;
    TRUE -> STOP;

STATE USEFIRST ARG79 :
    MATCH "" -> GOTO ARG80;
    TRUE -> STOP;

STATE USEFIRST ARG80 :
    MATCH "i++" -> ASSUME {i == (4);} GOTO ARG81;
    TRUE -> STOP;

STATE USEFIRST ARG81 :
    MATCH "[i < num_output]" -> ASSUME {i == (4);num_output == (50);} GOTO ARG82;
    TRUE -> STOP;

STATE USEFIRST ARG82 :
    MATCH "" -> GOTO ARG83;
    TRUE -> STOP;

STATE USEFIRST ARG83 :
    MATCH "i++" -> ASSUME {i == (5);} GOTO ARG89;
    TRUE -> STOP;

STATE USEFIRST ARG89 :
    MATCH "[i < num_output]" -> ASSUME {i == (5);num_output == (50);} GOTO ARG92;
    TRUE -> STOP;

STATE USEFIRST ARG92 :
    MATCH "" -> GOTO ARG93;
    TRUE -> STOP;

STATE USEFIRST ARG93 :
    MATCH "i++" -> ASSUME {i == (6);} GOTO ARG94;
    TRUE -> STOP;

STATE USEFIRST ARG94 :
    MATCH "[i < num_output]" -> ASSUME {i == (6);num_output == (50);} GOTO ARG95;
    TRUE -> STOP;

STATE USEFIRST ARG95 :
    MATCH "" -> GOTO ARG96;
    TRUE -> STOP;

STATE USEFIRST ARG96 :
    MATCH "i++" -> ASSUME {i == (7);} GOTO ARG97;
    TRUE -> STOP;

STATE USEFIRST ARG97 :
    MATCH "[i < num_output]" -> ASSUME {i == (7);num_output == (50);} GOTO ARG98;
    TRUE -> STOP;

STATE USEFIRST ARG98 :
    MATCH "" -> GOTO ARG99;
    TRUE -> STOP;

STATE USEFIRST ARG99 :
    MATCH "i++" -> ASSUME {i == (8);} GOTO ARG100;
    TRUE -> STOP;

STATE USEFIRST ARG100 :
    MATCH "[i < num_output]" -> ASSUME {i == (8);num_output == (50);} GOTO ARG101;
    TRUE -> STOP;

STATE USEFIRST ARG101 :
    MATCH "" -> GOTO ARG102;
    TRUE -> STOP;

STATE USEFIRST ARG102 :
    MATCH "i++" -> ASSUME {i == (9);} GOTO ARG103;
    TRUE -> STOP;

STATE USEFIRST ARG103 :
    MATCH "[i < num_output]" -> ASSUME {i == (9);num_output == (50);} GOTO ARG104;
    TRUE -> STOP;

STATE USEFIRST ARG104 :
    MATCH "" -> GOTO ARG105;
    TRUE -> STOP;

STATE USEFIRST ARG105 :
    MATCH "i++" -> ASSUME {i == (10);} GOTO ARG106;
    TRUE -> STOP;

STATE USEFIRST ARG106 :
    MATCH "[i < num_output]" -> ASSUME {i == (10);num_output == (50);} GOTO ARG107;
    TRUE -> STOP;

STATE USEFIRST ARG107 :
    MATCH "" -> GOTO ARG108;
    TRUE -> STOP;

STATE USEFIRST ARG108 :
    MATCH "i++" -> ASSUME {i == (11);} GOTO ARG109;
    TRUE -> STOP;

STATE USEFIRST ARG109 :
    MATCH "[i < num_output]" -> ASSUME {i == (11);num_output == (50);} GOTO ARG111;
    TRUE -> STOP;

STATE USEFIRST ARG111 :
    MATCH "" -> GOTO ARG112;
    TRUE -> STOP;

STATE USEFIRST ARG112 :
    MATCH "i++" -> ASSUME {i == (12);} GOTO ARG113;
    TRUE -> STOP;

STATE USEFIRST ARG113 :
    MATCH "[i < num_output]" -> ASSUME {i == (12);num_output == (50);} GOTO ARG114;
    TRUE -> STOP;

STATE USEFIRST ARG114 :
    MATCH "" -> GOTO ARG115;
    TRUE -> STOP;

STATE USEFIRST ARG115 :
    MATCH "i++" -> ASSUME {i == (13);} GOTO ARG116;
    TRUE -> STOP;

STATE USEFIRST ARG116 :
    MATCH "[i < num_output]" -> ASSUME {i == (13);num_output == (50);} GOTO ARG117;
    TRUE -> STOP;

STATE USEFIRST ARG117 :
    MATCH "" -> GOTO ARG118;
    TRUE -> STOP;

STATE USEFIRST ARG118 :
    MATCH "i++" -> ASSUME {i == (14);} GOTO ARG119;
    TRUE -> STOP;

STATE USEFIRST ARG119 :
    MATCH "[i < num_output]" -> ASSUME {i == (14);num_output == (50);} GOTO ARG120;
    TRUE -> STOP;

STATE USEFIRST ARG120 :
    MATCH "" -> GOTO ARG121;
    TRUE -> STOP;

STATE USEFIRST ARG121 :
    MATCH "i++" -> ASSUME {i == (15);} GOTO ARG122;
    TRUE -> STOP;

STATE USEFIRST ARG122 :
    MATCH "[i < num_output]" -> ASSUME {i == (15);num_output == (50);} GOTO ARG123;
    TRUE -> STOP;

STATE USEFIRST ARG123 :
    MATCH "" -> GOTO ARG124;
    TRUE -> STOP;

STATE USEFIRST ARG124 :
    MATCH "i++" -> ASSUME {i == (16);} GOTO ARG125;
    TRUE -> STOP;

STATE USEFIRST ARG125 :
    MATCH "[i < num_output]" -> ASSUME {i == (16);num_output == (50);} GOTO ARG126;
    TRUE -> STOP;

STATE USEFIRST ARG126 :
    MATCH "" -> GOTO ARG127;
    TRUE -> STOP;

STATE USEFIRST ARG127 :
    MATCH "i++" -> ASSUME {i == (17);} GOTO ARG128;
    TRUE -> STOP;

STATE USEFIRST ARG128 :
    MATCH "[i < num_output]" -> ASSUME {i == (17);num_output == (50);} GOTO ARG129;
    TRUE -> STOP;

STATE USEFIRST ARG129 :
    MATCH "" -> GOTO ARG130;
    TRUE -> STOP;

STATE USEFIRST ARG130 :
    MATCH "i++" -> ASSUME {i == (18);} GOTO ARG131;
    TRUE -> STOP;

STATE USEFIRST ARG131 :
    MATCH "[i < num_output]" -> ASSUME {i == (18);num_output == (50);} GOTO ARG132;
    TRUE -> STOP;

STATE USEFIRST ARG132 :
    MATCH "" -> GOTO ARG133;
    TRUE -> STOP;

STATE USEFIRST ARG133 :
    MATCH "i++" -> ASSUME {i == (19);} GOTO ARG134;
    TRUE -> STOP;

STATE USEFIRST ARG134 :
    MATCH "[i < num_output]" -> ASSUME {i == (19);num_output == (50);} GOTO ARG135;
    TRUE -> STOP;

STATE USEFIRST ARG135 :
    MATCH "" -> GOTO ARG136;
    TRUE -> STOP;

STATE USEFIRST ARG136 :
    MATCH "i++" -> ASSUME {i == (20);} GOTO ARG137;
    TRUE -> STOP;

STATE USEFIRST ARG137 :
    MATCH "[i < num_output]" -> ASSUME {i == (20);num_output == (50);} GOTO ARG138;
    TRUE -> STOP;

STATE USEFIRST ARG138 :
    MATCH "" -> GOTO ARG139;
    TRUE -> STOP;

STATE USEFIRST ARG139 :
    MATCH "i++" -> ASSUME {i == (21);} GOTO ARG140;
    TRUE -> STOP;

STATE USEFIRST ARG140 :
    MATCH "[i < num_output]" -> ASSUME {i == (21);num_output == (50);} GOTO ARG141;
    TRUE -> STOP;

STATE USEFIRST ARG141 :
    MATCH "" -> GOTO ARG142;
    TRUE -> STOP;

STATE USEFIRST ARG142 :
    MATCH "i++" -> ASSUME {i == (22);} GOTO ARG143;
    TRUE -> STOP;

STATE USEFIRST ARG143 :
    MATCH "[i < num_output]" -> ASSUME {i == (22);num_output == (50);} GOTO ARG144;
    TRUE -> STOP;

STATE USEFIRST ARG144 :
    MATCH "" -> GOTO ARG145;
    TRUE -> STOP;

STATE USEFIRST ARG145 :
    MATCH "i++" -> ASSUME {i == (23);} GOTO ARG146;
    TRUE -> STOP;

STATE USEFIRST ARG146 :
    MATCH "[i < num_output]" -> ASSUME {i == (23);num_output == (50);} GOTO ARG147;
    TRUE -> STOP;

STATE USEFIRST ARG147 :
    MATCH "" -> GOTO ARG148;
    TRUE -> STOP;

STATE USEFIRST ARG148 :
    MATCH "i++" -> ASSUME {i == (24);} GOTO ARG149;
    TRUE -> STOP;

STATE USEFIRST ARG149 :
    MATCH "[i < num_output]" -> ASSUME {i == (24);num_output == (50);} GOTO ARG150;
    TRUE -> STOP;

STATE USEFIRST ARG150 :
    MATCH "" -> GOTO ARG151;
    TRUE -> STOP;

STATE USEFIRST ARG151 :
    MATCH "i++" -> ASSUME {i == (25);} GOTO ARG152;
    TRUE -> STOP;

STATE USEFIRST ARG152 :
    MATCH "[i < num_output]" -> ASSUME {i == (25);num_output == (50);} GOTO ARG153;
    TRUE -> STOP;

STATE USEFIRST ARG153 :
    MATCH "" -> GOTO ARG154;
    TRUE -> STOP;

STATE USEFIRST ARG154 :
    MATCH "i++" -> ASSUME {i == (26);} GOTO ARG155;
    TRUE -> STOP;

STATE USEFIRST ARG155 :
    MATCH "[i < num_output]" -> ASSUME {i == (26);num_output == (50);} GOTO ARG156;
    TRUE -> STOP;

STATE USEFIRST ARG156 :
    MATCH "" -> GOTO ARG157;
    TRUE -> STOP;

STATE USEFIRST ARG157 :
    MATCH "i++" -> ASSUME {i == (27);} GOTO ARG158;
    TRUE -> STOP;

STATE USEFIRST ARG158 :
    MATCH "[i < num_output]" -> ASSUME {i == (27);num_output == (50);} GOTO ARG159;
    TRUE -> STOP;

STATE USEFIRST ARG159 :
    MATCH "" -> GOTO ARG160;
    TRUE -> STOP;

STATE USEFIRST ARG160 :
    MATCH "i++" -> ASSUME {i == (28);} GOTO ARG161;
    TRUE -> STOP;

STATE USEFIRST ARG161 :
    MATCH "[i < num_output]" -> ASSUME {i == (28);num_output == (50);} GOTO ARG162;
    TRUE -> STOP;

STATE USEFIRST ARG162 :
    MATCH "" -> GOTO ARG163;
    TRUE -> STOP;

STATE USEFIRST ARG163 :
    MATCH "i++" -> ASSUME {i == (29);} GOTO ARG164;
    TRUE -> STOP;

STATE USEFIRST ARG164 :
    MATCH "[i < num_output]" -> ASSUME {i == (29);num_output == (50);} GOTO ARG165;
    TRUE -> STOP;

STATE USEFIRST ARG165 :
    MATCH "" -> GOTO ARG166;
    TRUE -> STOP;

STATE USEFIRST ARG166 :
    MATCH "i++" -> ASSUME {i == (30);} GOTO ARG167;
    TRUE -> STOP;

STATE USEFIRST ARG167 :
    MATCH "[i < num_output]" -> ASSUME {i == (30);num_output == (50);} GOTO ARG168;
    TRUE -> STOP;

STATE USEFIRST ARG168 :
    MATCH "" -> GOTO ARG169;
    TRUE -> STOP;

STATE USEFIRST ARG169 :
    MATCH "i++" -> ASSUME {i == (31);} GOTO ARG170;
    TRUE -> STOP;

STATE USEFIRST ARG170 :
    MATCH "[i < num_output]" -> ASSUME {i == (31);num_output == (50);} GOTO ARG171;
    TRUE -> STOP;

STATE USEFIRST ARG171 :
    MATCH "" -> GOTO ARG172;
    TRUE -> STOP;

STATE USEFIRST ARG172 :
    MATCH "i++" -> ASSUME {i == (32);} GOTO ARG173;
    TRUE -> STOP;

STATE USEFIRST ARG173 :
    MATCH "[i < num_output]" -> ASSUME {i == (32);num_output == (50);} GOTO ARG174;
    TRUE -> STOP;

STATE USEFIRST ARG174 :
    MATCH "" -> GOTO ARG175;
    TRUE -> STOP;

STATE USEFIRST ARG175 :
    MATCH "i++" -> ASSUME {i == (33);} GOTO ARG176;
    TRUE -> STOP;

STATE USEFIRST ARG176 :
    MATCH "[i < num_output]" -> ASSUME {i == (33);num_output == (50);} GOTO ARG177;
    TRUE -> STOP;

STATE USEFIRST ARG177 :
    MATCH "" -> GOTO ARG178;
    TRUE -> STOP;

STATE USEFIRST ARG178 :
    MATCH "i++" -> ASSUME {i == (34);} GOTO ARG179;
    TRUE -> STOP;

STATE USEFIRST ARG179 :
    MATCH "[i < num_output]" -> ASSUME {i == (34);num_output == (50);} GOTO ARG180;
    TRUE -> STOP;

STATE USEFIRST ARG180 :
    MATCH "" -> GOTO ARG181;
    TRUE -> STOP;

STATE USEFIRST ARG181 :
    MATCH "i++" -> ASSUME {i == (35);} GOTO ARG182;
    TRUE -> STOP;

STATE USEFIRST ARG182 :
    MATCH "[i < num_output]" -> ASSUME {i == (35);num_output == (50);} GOTO ARG183;
    TRUE -> STOP;

STATE USEFIRST ARG183 :
    MATCH "" -> GOTO ARG184;
    TRUE -> STOP;

STATE USEFIRST ARG184 :
    MATCH "i++" -> ASSUME {i == (36);} GOTO ARG185;
    TRUE -> STOP;

STATE USEFIRST ARG185 :
    MATCH "[i < num_output]" -> ASSUME {i == (36);num_output == (50);} GOTO ARG186;
    TRUE -> STOP;

STATE USEFIRST ARG186 :
    MATCH "" -> GOTO ARG187;
    TRUE -> STOP;

STATE USEFIRST ARG187 :
    MATCH "i++" -> ASSUME {i == (37);} GOTO ARG188;
    TRUE -> STOP;

STATE USEFIRST ARG188 :
    MATCH "[i < num_output]" -> ASSUME {i == (37);num_output == (50);} GOTO ARG189;
    TRUE -> STOP;

STATE USEFIRST ARG189 :
    MATCH "" -> GOTO ARG190;
    TRUE -> STOP;

STATE USEFIRST ARG190 :
    MATCH "i++" -> ASSUME {i == (38);} GOTO ARG191;
    TRUE -> STOP;

STATE USEFIRST ARG191 :
    MATCH "[i < num_output]" -> ASSUME {i == (38);num_output == (50);} GOTO ARG192;
    TRUE -> STOP;

STATE USEFIRST ARG192 :
    MATCH "" -> GOTO ARG193;
    TRUE -> STOP;

STATE USEFIRST ARG193 :
    MATCH "i++" -> ASSUME {i == (39);} GOTO ARG194;
    TRUE -> STOP;

STATE USEFIRST ARG194 :
    MATCH "[i < num_output]" -> ASSUME {i == (39);num_output == (50);} GOTO ARG195;
    TRUE -> STOP;

STATE USEFIRST ARG195 :
    MATCH "" -> GOTO ARG196;
    TRUE -> STOP;

STATE USEFIRST ARG196 :
    MATCH "i++" -> ASSUME {i == (40);} GOTO ARG197;
    TRUE -> STOP;

STATE USEFIRST ARG197 :
    MATCH "[i < num_output]" -> ASSUME {i == (40);num_output == (50);} GOTO ARG198;
    TRUE -> STOP;

STATE USEFIRST ARG198 :
    MATCH "" -> GOTO ARG199;
    TRUE -> STOP;

STATE USEFIRST ARG199 :
    MATCH "i++" -> ASSUME {i == (41);} GOTO ARG200;
    TRUE -> STOP;

STATE USEFIRST ARG200 :
    MATCH "[i < num_output]" -> ASSUME {i == (41);num_output == (50);} GOTO ARG201;
    TRUE -> STOP;

STATE USEFIRST ARG201 :
    MATCH "" -> GOTO ARG202;
    TRUE -> STOP;

STATE USEFIRST ARG202 :
    MATCH "i++" -> ASSUME {i == (42);} GOTO ARG203;
    TRUE -> STOP;

STATE USEFIRST ARG203 :
    MATCH "[i < num_output]" -> ASSUME {i == (42);num_output == (50);} GOTO ARG204;
    TRUE -> STOP;

STATE USEFIRST ARG204 :
    MATCH "" -> GOTO ARG205;
    TRUE -> STOP;

STATE USEFIRST ARG205 :
    MATCH "i++" -> ASSUME {i == (43);} GOTO ARG206;
    TRUE -> STOP;

STATE USEFIRST ARG206 :
    MATCH "[i < num_output]" -> ASSUME {i == (43);num_output == (50);} GOTO ARG207;
    TRUE -> STOP;

STATE USEFIRST ARG207 :
    MATCH "" -> GOTO ARG208;
    TRUE -> STOP;

STATE USEFIRST ARG208 :
    MATCH "i++" -> ASSUME {i == (44);} GOTO ARG209;
    TRUE -> STOP;

STATE USEFIRST ARG209 :
    MATCH "[i < num_output]" -> ASSUME {i == (44);num_output == (50);} GOTO ARG210;
    TRUE -> STOP;

STATE USEFIRST ARG210 :
    MATCH "" -> GOTO ARG211;
    TRUE -> STOP;

STATE USEFIRST ARG211 :
    MATCH "i++" -> ASSUME {i == (45);} GOTO ARG212;
    TRUE -> STOP;

STATE USEFIRST ARG212 :
    MATCH "[i < num_output]" -> ASSUME {i == (45);num_output == (50);} GOTO ARG213;
    TRUE -> STOP;

STATE USEFIRST ARG213 :
    MATCH "" -> GOTO ARG214;
    TRUE -> STOP;

STATE USEFIRST ARG214 :
    MATCH "i++" -> ASSUME {i == (46);} GOTO ARG215;
    TRUE -> STOP;

STATE USEFIRST ARG215 :
    MATCH "[i < num_output]" -> ASSUME {i == (46);num_output == (50);} GOTO ARG216;
    TRUE -> STOP;

STATE USEFIRST ARG216 :
    MATCH "" -> GOTO ARG217;
    TRUE -> STOP;

STATE USEFIRST ARG217 :
    MATCH "i++" -> ASSUME {i == (47);} GOTO ARG218;
    TRUE -> STOP;

STATE USEFIRST ARG218 :
    MATCH "[i < num_output]" -> ASSUME {i == (47);num_output == (50);} GOTO ARG219;
    TRUE -> STOP;

STATE USEFIRST ARG219 :
    MATCH "" -> GOTO ARG220;
    TRUE -> STOP;

STATE USEFIRST ARG220 :
    MATCH "i++" -> ASSUME {i == (48);} GOTO ARG221;
    TRUE -> STOP;

STATE USEFIRST ARG221 :
    MATCH "[i < num_output]" -> ASSUME {i == (48);num_output == (50);} GOTO ARG222;
    TRUE -> STOP;

STATE USEFIRST ARG222 :
    MATCH "" -> GOTO ARG223;
    TRUE -> STOP;

STATE USEFIRST ARG223 :
    MATCH "i++" -> ASSUME {i == (49);} GOTO ARG224;
    TRUE -> STOP;

STATE USEFIRST ARG224 :
    MATCH "[i < num_output]" -> ASSUME {i == (49);num_output == (50);} GOTO ARG225;
    TRUE -> STOP;

STATE USEFIRST ARG225 :
    MATCH "" -> GOTO ARG226;
    TRUE -> STOP;

STATE USEFIRST ARG226 :
    MATCH "i++" -> ASSUME {i == (50);} GOTO ARG227;
    TRUE -> STOP;

STATE USEFIRST ARG227 :
    MATCH "[!(i < num_output)]" -> ASSUME {i == (50);num_output == (50);} GOTO ARG228;
    TRUE -> STOP;

STATE USEFIRST ARG228 :
    MATCH "" -> GOTO ARG229;
    TRUE -> STOP;

STATE USEFIRST ARG229 :
    MATCH "i++" -> ASSUME {i == (51);} GOTO ARG230;
    TRUE -> STOP;

STATE USEFIRST ARG230 :
    MATCH "[i < num_crtc]" -> ASSUME {i == (51);num_crtc == (100);} GOTO ARG231;
    TRUE -> STOP;

STATE USEFIRST ARG231 :
    MATCH "" -> GOTO ARG232;
    TRUE -> STOP;

STATE USEFIRST ARG232 :
    MATCH "i = 0" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG233 :
    TRUE -> STOP;

END AUTOMATON
