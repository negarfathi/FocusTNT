CONTROL AUTOMATON ErrorPath4

INITIAL STATE ARG0;

STATE USEFIRST ARG0 :
    MATCH "" -> GOTO ARG3;
    TRUE -> STOP;

STATE USEFIRST ARG3 :
    MATCH "extern int __VERIFIER_nondet_int(void);" -> GOTO ARG4;
    TRUE -> STOP;

STATE USEFIRST ARG4 :
    MATCH "int matroska_deliver_packet( int q )" -> GOTO ARG6;
    TRUE -> STOP;

STATE USEFIRST ARG6 :
    MATCH "int flag = 0;" -> ASSUME {flag == (0);} GOTO ARG11;
    TRUE -> STOP;

STATE USEFIRST ARG11 :
    MATCH "int res_return()" -> GOTO ARG13;
    TRUE -> STOP;

STATE USEFIRST ARG13 :
    MATCH "int main()" -> GOTO ARG16;
    TRUE -> STOP;

STATE USEFIRST ARG16 :
    MATCH "" -> GOTO ARG17;
    TRUE -> STOP;

STATE USEFIRST ARG17 :
    MATCH "int matroska = 2;" -> ASSUME {matroska == (2);} GOTO ARG22;
    TRUE -> STOP;

STATE USEFIRST ARG22 :
    MATCH "int res = 0;" -> ASSUME {res == (0);} GOTO ARG23;
    TRUE -> STOP;

STATE USEFIRST ARG23 :
    MATCH "" -> GOTO ARG32;
    TRUE -> STOP;

STATE USEFIRST ARG32 :
    MATCH "matroska_deliver_packet( matroska)" -> GOTO ARG33;
    TRUE -> STOP;

STATE USEFIRST ARG33 :
    MATCH "matroska_deliver_packet( matroska)" -> GOTO ARG35;
    TRUE -> STOP;

STATE USEFIRST ARG35 :
    MATCH "" -> ASSUME {q == (2);} GOTO ARG36;
    TRUE -> STOP;

STATE USEFIRST ARG36 :
    MATCH "[!(q == 1)]" -> ASSUME {q == (2);} GOTO ARG39;
    TRUE -> STOP;

STATE USEFIRST ARG39 :
    MATCH "return 1;" -> GOTO ARG40;
    TRUE -> STOP;

STATE USEFIRST ARG40 :
    MATCH "" -> GOTO ARG45;
    TRUE -> STOP;

STATE USEFIRST ARG45 :
    MATCH "[matroska_deliver_packet( matroska)]" -> ASSUME {__CPAchecker_TMP_0 == (1);} GOTO ARG46;
    TRUE -> STOP;

STATE USEFIRST ARG46 :
    MATCH "" -> GOTO ARG47;
    TRUE -> STOP;

STATE USEFIRST ARG47 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG49;
    TRUE -> STOP;

STATE USEFIRST ARG49 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG51;
    TRUE -> STOP;

STATE USEFIRST ARG51 :
    MATCH "switch (id)" -> GOTO ARG52;
    TRUE -> STOP;

STATE USEFIRST ARG52 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG53;
    TRUE -> STOP;

STATE USEFIRST ARG53 :
    MATCH "res = res_return() < 0" -> GOTO ARG54;
    TRUE -> STOP;

STATE USEFIRST ARG54 :
    MATCH "res = res_return() < 0" -> GOTO ARG55;
    TRUE -> STOP;

STATE USEFIRST ARG55 :
    MATCH "" -> GOTO ARG56;
    TRUE -> STOP;

STATE USEFIRST ARG56 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (0);} GOTO ARG57;
    TRUE -> STOP;

STATE USEFIRST ARG57 :
    MATCH "flag++ < 100" -> ASSUME {flag == (1);} GOTO ARG58;
    TRUE -> STOP;

STATE USEFIRST ARG58 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (0);} GOTO ARG59;
    TRUE -> STOP;

STATE USEFIRST ARG59 :
    MATCH "return 5;" -> GOTO ARG60;
    TRUE -> STOP;

STATE USEFIRST ARG60 :
    MATCH "" -> GOTO ARG61;
    TRUE -> STOP;

STATE USEFIRST ARG61 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (0);} GOTO ARG62;
    TRUE -> STOP;

STATE USEFIRST ARG62 :
    MATCH "[!(res = res_return() < 0)]" -> ASSUME {res == (0);} GOTO ARG63;
    TRUE -> STOP;

STATE USEFIRST ARG63 :
    MATCH "res = res_return() == 0" -> GOTO ARG64;
    TRUE -> STOP;

STATE USEFIRST ARG64 :
    MATCH "res = res_return() == 0" -> GOTO ARG65;
    TRUE -> STOP;

STATE USEFIRST ARG65 :
    MATCH "" -> GOTO ARG66;
    TRUE -> STOP;

STATE USEFIRST ARG66 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (1);} GOTO ARG67;
    TRUE -> STOP;

STATE USEFIRST ARG67 :
    MATCH "flag++ < 100" -> ASSUME {flag == (2);} GOTO ARG74;
    TRUE -> STOP;

STATE USEFIRST ARG74 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (1);} GOTO ARG81;
    TRUE -> STOP;

STATE USEFIRST ARG81 :
    MATCH "return 5;" -> GOTO ARG85;
    TRUE -> STOP;

STATE USEFIRST ARG85 :
    MATCH "" -> GOTO ARG94;
    TRUE -> STOP;

STATE USEFIRST ARG94 :
    MATCH "res = res_return() == 0" -> ASSUME {res == (0);} GOTO ARG96;
    TRUE -> STOP;

STATE USEFIRST ARG96 :
    MATCH "[!(res = res_return() == 0)]" -> ASSUME {res == (0);} GOTO ARG99;
    TRUE -> STOP;

STATE USEFIRST ARG99 :
    MATCH "break;" -> GOTO ARG100;
    TRUE -> STOP;

STATE USEFIRST ARG100 :
    MATCH "" -> GOTO ARG101;
    TRUE -> STOP;

STATE USEFIRST ARG101 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG149;
    TRUE -> STOP;

STATE USEFIRST ARG149 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG150;
    TRUE -> STOP;

STATE USEFIRST ARG150 :
    MATCH "switch (id)" -> GOTO ARG151;
    TRUE -> STOP;

STATE USEFIRST ARG151 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG154;
    TRUE -> STOP;

STATE USEFIRST ARG154 :
    MATCH "res = res_return() < 0" -> GOTO ARG155;
    TRUE -> STOP;

STATE USEFIRST ARG155 :
    MATCH "res = res_return() < 0" -> GOTO ARG160;
    TRUE -> STOP;

STATE USEFIRST ARG160 :
    MATCH "" -> GOTO ARG162;
    TRUE -> STOP;

STATE USEFIRST ARG162 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (2);} GOTO ARG166;
    TRUE -> STOP;

STATE USEFIRST ARG166 :
    MATCH "flag++ < 100" -> ASSUME {flag == (3);} GOTO ARG168;
    TRUE -> STOP;

STATE USEFIRST ARG168 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (2);} GOTO ARG176;
    TRUE -> STOP;

STATE USEFIRST ARG176 :
    MATCH "return 5;" -> GOTO ARG180;
    TRUE -> STOP;

STATE USEFIRST ARG180 :
    MATCH "" -> GOTO ARG189;
    TRUE -> STOP;

STATE USEFIRST ARG189 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (0);} GOTO ARG195;
    TRUE -> STOP;

STATE USEFIRST ARG195 :
    MATCH "[!(res = res_return() < 0)]" -> ASSUME {res == (0);} GOTO ARG199;
    TRUE -> STOP;

STATE USEFIRST ARG199 :
    MATCH "res = res_return() == 0" -> GOTO ARG201;
    TRUE -> STOP;

STATE USEFIRST ARG201 :
    MATCH "res = res_return() == 0" -> GOTO ARG202;
    TRUE -> STOP;

STATE USEFIRST ARG202 :
    MATCH "" -> GOTO ARG203;
    TRUE -> STOP;

STATE USEFIRST ARG203 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (3);} GOTO ARG204;
    TRUE -> STOP;

STATE USEFIRST ARG204 :
    MATCH "flag++ < 100" -> ASSUME {flag == (4);} GOTO ARG207;
    TRUE -> STOP;

STATE USEFIRST ARG207 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (3);} GOTO ARG212;
    TRUE -> STOP;

STATE USEFIRST ARG212 :
    MATCH "return 5;" -> GOTO ARG213;
    TRUE -> STOP;

STATE USEFIRST ARG213 :
    MATCH "" -> GOTO ARG220;
    TRUE -> STOP;

STATE USEFIRST ARG220 :
    MATCH "res = res_return() == 0" -> ASSUME {res == (0);} GOTO ARG222;
    TRUE -> STOP;

STATE USEFIRST ARG222 :
    MATCH "[!(res = res_return() == 0)]" -> ASSUME {res == (0);} GOTO ARG227;
    TRUE -> STOP;

STATE USEFIRST ARG227 :
    MATCH "break;" -> GOTO ARG228;
    TRUE -> STOP;

STATE USEFIRST ARG228 :
    MATCH "" -> GOTO ARG249;
    TRUE -> STOP;

STATE USEFIRST ARG249 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG258;
    TRUE -> STOP;

STATE USEFIRST ARG258 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG262;
    TRUE -> STOP;

STATE USEFIRST ARG262 :
    MATCH "switch (id)" -> GOTO ARG265;
    TRUE -> STOP;

STATE USEFIRST ARG265 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG268;
    TRUE -> STOP;

STATE USEFIRST ARG268 :
    MATCH "res = res_return() < 0" -> GOTO ARG271;
    TRUE -> STOP;

STATE USEFIRST ARG271 :
    MATCH "res = res_return() < 0" -> GOTO ARG272;
    TRUE -> STOP;

STATE USEFIRST ARG272 :
    MATCH "" -> GOTO ARG273;
    TRUE -> STOP;

STATE USEFIRST ARG273 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (4);} GOTO ARG278;
    TRUE -> STOP;

STATE USEFIRST ARG278 :
    MATCH "flag++ < 100" -> ASSUME {flag == (5);} GOTO ARG279;
    TRUE -> STOP;

STATE USEFIRST ARG279 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (4);} GOTO ARG285;
    TRUE -> STOP;

STATE USEFIRST ARG285 :
    MATCH "return 5;" -> GOTO ARG292;
    TRUE -> STOP;

STATE USEFIRST ARG292 :
    MATCH "" -> GOTO ARG297;
    TRUE -> STOP;

STATE USEFIRST ARG297 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (0);} GOTO ARG300;
    TRUE -> STOP;

STATE USEFIRST ARG300 :
    MATCH "[!(res = res_return() < 0)]" -> ASSUME {res == (0);} GOTO ARG303;
    TRUE -> STOP;

STATE USEFIRST ARG303 :
    MATCH "res = res_return() == 0" -> GOTO ARG306;
    TRUE -> STOP;

STATE USEFIRST ARG306 :
    MATCH "res = res_return() == 0" -> GOTO ARG309;
    TRUE -> STOP;

STATE USEFIRST ARG309 :
    MATCH "" -> GOTO ARG310;
    TRUE -> STOP;

STATE USEFIRST ARG310 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (5);} GOTO ARG316;
    TRUE -> STOP;

STATE USEFIRST ARG316 :
    MATCH "flag++ < 100" -> ASSUME {flag == (6);} GOTO ARG323;
    TRUE -> STOP;

STATE USEFIRST ARG323 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (5);} GOTO ARG325;
    TRUE -> STOP;

STATE USEFIRST ARG325 :
    MATCH "return 5;" -> GOTO ARG328;
    TRUE -> STOP;

STATE USEFIRST ARG328 :
    MATCH "" -> GOTO ARG329;
    TRUE -> STOP;

STATE USEFIRST ARG329 :
    MATCH "res = res_return() == 0" -> ASSUME {res == (0);} GOTO ARG330;
    TRUE -> STOP;

STATE USEFIRST ARG330 :
    MATCH "[!(res = res_return() == 0)]" -> ASSUME {res == (0);} GOTO ARG331;
    TRUE -> STOP;

STATE USEFIRST ARG331 :
    MATCH "break;" -> GOTO ARG332;
    TRUE -> STOP;

STATE USEFIRST ARG332 :
    MATCH "" -> GOTO ARG333;
    TRUE -> STOP;

STATE USEFIRST ARG333 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG334;
    TRUE -> STOP;

STATE USEFIRST ARG334 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG335;
    TRUE -> STOP;

STATE USEFIRST ARG335 :
    MATCH "switch (id)" -> GOTO ARG336;
    TRUE -> STOP;

STATE USEFIRST ARG336 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG337;
    TRUE -> STOP;

STATE USEFIRST ARG337 :
    MATCH "res = res_return() < 0" -> GOTO ARG342;
    TRUE -> STOP;

STATE USEFIRST ARG342 :
    MATCH "res = res_return() < 0" -> GOTO ARG345;
    TRUE -> STOP;

STATE USEFIRST ARG345 :
    MATCH "" -> GOTO ARG346;
    TRUE -> STOP;

STATE USEFIRST ARG346 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (6);} GOTO ARG348;
    TRUE -> STOP;

STATE USEFIRST ARG348 :
    MATCH "flag++ < 100" -> ASSUME {flag == (7);} GOTO ARG349;
    TRUE -> STOP;

STATE USEFIRST ARG349 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (6);} GOTO ARG350;
    TRUE -> STOP;

STATE USEFIRST ARG350 :
    MATCH "return 5;" -> GOTO ARG351;
    TRUE -> STOP;

STATE USEFIRST ARG351 :
    MATCH "" -> GOTO ARG352;
    TRUE -> STOP;

STATE USEFIRST ARG352 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (0);} GOTO ARG353;
    TRUE -> STOP;

STATE USEFIRST ARG353 :
    MATCH "[!(res = res_return() < 0)]" -> ASSUME {res == (0);} GOTO ARG354;
    TRUE -> STOP;

STATE USEFIRST ARG354 :
    MATCH "res = res_return() == 0" -> GOTO ARG355;
    TRUE -> STOP;

STATE USEFIRST ARG355 :
    MATCH "res = res_return() == 0" -> GOTO ARG356;
    TRUE -> STOP;

STATE USEFIRST ARG356 :
    MATCH "" -> GOTO ARG357;
    TRUE -> STOP;

STATE USEFIRST ARG357 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (7);} GOTO ARG358;
    TRUE -> STOP;

STATE USEFIRST ARG358 :
    MATCH "flag++ < 100" -> ASSUME {flag == (8);} GOTO ARG359;
    TRUE -> STOP;

STATE USEFIRST ARG359 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (7);} GOTO ARG360;
    TRUE -> STOP;

STATE USEFIRST ARG360 :
    MATCH "return 5;" -> GOTO ARG361;
    TRUE -> STOP;

STATE USEFIRST ARG361 :
    MATCH "" -> GOTO ARG362;
    TRUE -> STOP;

STATE USEFIRST ARG362 :
    MATCH "res = res_return() == 0" -> ASSUME {res == (0);} GOTO ARG363;
    TRUE -> STOP;

STATE USEFIRST ARG363 :
    MATCH "[!(res = res_return() == 0)]" -> ASSUME {res == (0);} GOTO ARG364;
    TRUE -> STOP;

STATE USEFIRST ARG364 :
    MATCH "break;" -> GOTO ARG365;
    TRUE -> STOP;

STATE USEFIRST ARG365 :
    MATCH "" -> GOTO ARG366;
    TRUE -> STOP;

STATE USEFIRST ARG366 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG367;
    TRUE -> STOP;

STATE USEFIRST ARG367 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG368;
    TRUE -> STOP;

STATE USEFIRST ARG368 :
    MATCH "switch (id)" -> GOTO ARG369;
    TRUE -> STOP;

STATE USEFIRST ARG369 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG370;
    TRUE -> STOP;

STATE USEFIRST ARG370 :
    MATCH "res = res_return() < 0" -> GOTO ARG371;
    TRUE -> STOP;

STATE USEFIRST ARG371 :
    MATCH "res = res_return() < 0" -> GOTO ARG372;
    TRUE -> STOP;

STATE USEFIRST ARG372 :
    MATCH "" -> GOTO ARG373;
    TRUE -> STOP;

STATE USEFIRST ARG373 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (8);} GOTO ARG374;
    TRUE -> STOP;

STATE USEFIRST ARG374 :
    MATCH "flag++ < 100" -> ASSUME {flag == (9);} GOTO ARG375;
    TRUE -> STOP;

STATE USEFIRST ARG375 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (8);} GOTO ARG376;
    TRUE -> STOP;

STATE USEFIRST ARG376 :
    MATCH "return 5;" -> GOTO ARG377;
    TRUE -> STOP;

STATE USEFIRST ARG377 :
    MATCH "" -> GOTO ARG378;
    TRUE -> STOP;

STATE USEFIRST ARG378 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (0);} GOTO ARG379;
    TRUE -> STOP;

STATE USEFIRST ARG379 :
    MATCH "[!(res = res_return() < 0)]" -> ASSUME {res == (0);} GOTO ARG380;
    TRUE -> STOP;

STATE USEFIRST ARG380 :
    MATCH "res = res_return() == 0" -> GOTO ARG381;
    TRUE -> STOP;

STATE USEFIRST ARG381 :
    MATCH "res = res_return() == 0" -> GOTO ARG382;
    TRUE -> STOP;

STATE USEFIRST ARG382 :
    MATCH "" -> GOTO ARG383;
    TRUE -> STOP;

STATE USEFIRST ARG383 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (9);} GOTO ARG384;
    TRUE -> STOP;

STATE USEFIRST ARG384 :
    MATCH "flag++ < 100" -> ASSUME {flag == (10);} GOTO ARG385;
    TRUE -> STOP;

STATE USEFIRST ARG385 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (9);} GOTO ARG386;
    TRUE -> STOP;

STATE USEFIRST ARG386 :
    MATCH "return 5;" -> GOTO ARG387;
    TRUE -> STOP;

STATE USEFIRST ARG387 :
    MATCH "" -> GOTO ARG388;
    TRUE -> STOP;

STATE USEFIRST ARG388 :
    MATCH "res = res_return() == 0" -> ASSUME {res == (0);} GOTO ARG389;
    TRUE -> STOP;

STATE USEFIRST ARG389 :
    MATCH "[!(res = res_return() == 0)]" -> ASSUME {res == (0);} GOTO ARG390;
    TRUE -> STOP;

STATE USEFIRST ARG390 :
    MATCH "break;" -> GOTO ARG391;
    TRUE -> STOP;

STATE USEFIRST ARG391 :
    MATCH "" -> GOTO ARG392;
    TRUE -> STOP;

STATE USEFIRST ARG392 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG393;
    TRUE -> STOP;

STATE USEFIRST ARG393 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG394;
    TRUE -> STOP;

STATE USEFIRST ARG394 :
    MATCH "switch (id)" -> GOTO ARG395;
    TRUE -> STOP;

STATE USEFIRST ARG395 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG396;
    TRUE -> STOP;

STATE USEFIRST ARG396 :
    MATCH "res = res_return() < 0" -> GOTO ARG397;
    TRUE -> STOP;

STATE USEFIRST ARG397 :
    MATCH "res = res_return() < 0" -> GOTO ARG398;
    TRUE -> STOP;

STATE USEFIRST ARG398 :
    MATCH "" -> GOTO ARG399;
    TRUE -> STOP;

STATE USEFIRST ARG399 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (10);} GOTO ARG400;
    TRUE -> STOP;

STATE USEFIRST ARG400 :
    MATCH "flag++ < 100" -> ASSUME {flag == (11);} GOTO ARG401;
    TRUE -> STOP;

STATE USEFIRST ARG401 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (10);} GOTO ARG402;
    TRUE -> STOP;

STATE USEFIRST ARG402 :
    MATCH "return 5;" -> GOTO ARG403;
    TRUE -> STOP;

STATE USEFIRST ARG403 :
    MATCH "" -> GOTO ARG404;
    TRUE -> STOP;

STATE USEFIRST ARG404 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (0);} GOTO ARG405;
    TRUE -> STOP;

STATE USEFIRST ARG405 :
    MATCH "[!(res = res_return() < 0)]" -> ASSUME {res == (0);} GOTO ARG406;
    TRUE -> STOP;

STATE USEFIRST ARG406 :
    MATCH "res = res_return() == 0" -> GOTO ARG407;
    TRUE -> STOP;

STATE USEFIRST ARG407 :
    MATCH "res = res_return() == 0" -> GOTO ARG408;
    TRUE -> STOP;

STATE USEFIRST ARG408 :
    MATCH "" -> GOTO ARG409;
    TRUE -> STOP;

STATE USEFIRST ARG409 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (11);} GOTO ARG410;
    TRUE -> STOP;

STATE USEFIRST ARG410 :
    MATCH "flag++ < 100" -> ASSUME {flag == (12);} GOTO ARG411;
    TRUE -> STOP;

STATE USEFIRST ARG411 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (11);} GOTO ARG412;
    TRUE -> STOP;

STATE USEFIRST ARG412 :
    MATCH "return 5;" -> GOTO ARG414;
    TRUE -> STOP;

STATE USEFIRST ARG414 :
    MATCH "" -> GOTO ARG415;
    TRUE -> STOP;

STATE USEFIRST ARG415 :
    MATCH "res = res_return() == 0" -> ASSUME {res == (0);} GOTO ARG416;
    TRUE -> STOP;

STATE USEFIRST ARG416 :
    MATCH "[!(res = res_return() == 0)]" -> ASSUME {res == (0);} GOTO ARG417;
    TRUE -> STOP;

STATE USEFIRST ARG417 :
    MATCH "break;" -> GOTO ARG418;
    TRUE -> STOP;

STATE USEFIRST ARG418 :
    MATCH "" -> GOTO ARG419;
    TRUE -> STOP;

STATE USEFIRST ARG419 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG420;
    TRUE -> STOP;

STATE USEFIRST ARG420 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG421;
    TRUE -> STOP;

STATE USEFIRST ARG421 :
    MATCH "switch (id)" -> GOTO ARG422;
    TRUE -> STOP;

STATE USEFIRST ARG422 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG423;
    TRUE -> STOP;

STATE USEFIRST ARG423 :
    MATCH "res = res_return() < 0" -> GOTO ARG424;
    TRUE -> STOP;

STATE USEFIRST ARG424 :
    MATCH "res = res_return() < 0" -> GOTO ARG425;
    TRUE -> STOP;

STATE USEFIRST ARG425 :
    MATCH "" -> GOTO ARG426;
    TRUE -> STOP;

STATE USEFIRST ARG426 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (12);} GOTO ARG427;
    TRUE -> STOP;

STATE USEFIRST ARG427 :
    MATCH "flag++ < 100" -> ASSUME {flag == (13);} GOTO ARG428;
    TRUE -> STOP;

STATE USEFIRST ARG428 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (12);} GOTO ARG429;
    TRUE -> STOP;

STATE USEFIRST ARG429 :
    MATCH "return 5;" -> GOTO ARG430;
    TRUE -> STOP;

STATE USEFIRST ARG430 :
    MATCH "" -> GOTO ARG431;
    TRUE -> STOP;

STATE USEFIRST ARG431 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (0);} GOTO ARG432;
    TRUE -> STOP;

STATE USEFIRST ARG432 :
    MATCH "[!(res = res_return() < 0)]" -> ASSUME {res == (0);} GOTO ARG433;
    TRUE -> STOP;

STATE USEFIRST ARG433 :
    MATCH "res = res_return() == 0" -> GOTO ARG434;
    TRUE -> STOP;

STATE USEFIRST ARG434 :
    MATCH "res = res_return() == 0" -> GOTO ARG435;
    TRUE -> STOP;

STATE USEFIRST ARG435 :
    MATCH "" -> GOTO ARG436;
    TRUE -> STOP;

STATE USEFIRST ARG436 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (13);} GOTO ARG437;
    TRUE -> STOP;

STATE USEFIRST ARG437 :
    MATCH "flag++ < 100" -> ASSUME {flag == (14);} GOTO ARG438;
    TRUE -> STOP;

STATE USEFIRST ARG438 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (13);} GOTO ARG439;
    TRUE -> STOP;

STATE USEFIRST ARG439 :
    MATCH "return 5;" -> GOTO ARG440;
    TRUE -> STOP;

STATE USEFIRST ARG440 :
    MATCH "" -> GOTO ARG441;
    TRUE -> STOP;

STATE USEFIRST ARG441 :
    MATCH "res = res_return() == 0" -> ASSUME {res == (0);} GOTO ARG442;
    TRUE -> STOP;

STATE USEFIRST ARG442 :
    MATCH "[!(res = res_return() == 0)]" -> ASSUME {res == (0);} GOTO ARG443;
    TRUE -> STOP;

STATE USEFIRST ARG443 :
    MATCH "break;" -> GOTO ARG444;
    TRUE -> STOP;

STATE USEFIRST ARG444 :
    MATCH "" -> GOTO ARG445;
    TRUE -> STOP;

STATE USEFIRST ARG445 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG446;
    TRUE -> STOP;

STATE USEFIRST ARG446 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG447;
    TRUE -> STOP;

STATE USEFIRST ARG447 :
    MATCH "switch (id)" -> GOTO ARG448;
    TRUE -> STOP;

STATE USEFIRST ARG448 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG449;
    TRUE -> STOP;

STATE USEFIRST ARG449 :
    MATCH "res = res_return() < 0" -> GOTO ARG450;
    TRUE -> STOP;

STATE USEFIRST ARG450 :
    MATCH "res = res_return() < 0" -> GOTO ARG451;
    TRUE -> STOP;

STATE USEFIRST ARG451 :
    MATCH "" -> GOTO ARG452;
    TRUE -> STOP;

STATE USEFIRST ARG452 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (14);} GOTO ARG453;
    TRUE -> STOP;

STATE USEFIRST ARG453 :
    MATCH "flag++ < 100" -> ASSUME {flag == (15);} GOTO ARG454;
    TRUE -> STOP;

STATE USEFIRST ARG454 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (14);} GOTO ARG455;
    TRUE -> STOP;

STATE USEFIRST ARG455 :
    MATCH "return 5;" -> GOTO ARG456;
    TRUE -> STOP;

STATE USEFIRST ARG456 :
    MATCH "" -> GOTO ARG457;
    TRUE -> STOP;

STATE USEFIRST ARG457 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (0);} GOTO ARG458;
    TRUE -> STOP;

STATE USEFIRST ARG458 :
    MATCH "[!(res = res_return() < 0)]" -> ASSUME {res == (0);} GOTO ARG459;
    TRUE -> STOP;

STATE USEFIRST ARG459 :
    MATCH "res = res_return() == 0" -> GOTO ARG460;
    TRUE -> STOP;

STATE USEFIRST ARG460 :
    MATCH "res = res_return() == 0" -> GOTO ARG461;
    TRUE -> STOP;

STATE USEFIRST ARG461 :
    MATCH "" -> GOTO ARG462;
    TRUE -> STOP;

STATE USEFIRST ARG462 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (15);} GOTO ARG463;
    TRUE -> STOP;

STATE USEFIRST ARG463 :
    MATCH "flag++ < 100" -> ASSUME {flag == (16);} GOTO ARG464;
    TRUE -> STOP;

STATE USEFIRST ARG464 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (15);} GOTO ARG465;
    TRUE -> STOP;

STATE USEFIRST ARG465 :
    MATCH "return 5;" -> GOTO ARG466;
    TRUE -> STOP;

STATE USEFIRST ARG466 :
    MATCH "" -> GOTO ARG467;
    TRUE -> STOP;

STATE USEFIRST ARG467 :
    MATCH "res = res_return() == 0" -> ASSUME {res == (0);} GOTO ARG468;
    TRUE -> STOP;

STATE USEFIRST ARG468 :
    MATCH "[!(res = res_return() == 0)]" -> ASSUME {res == (0);} GOTO ARG469;
    TRUE -> STOP;

STATE USEFIRST ARG469 :
    MATCH "break;" -> GOTO ARG470;
    TRUE -> STOP;

STATE USEFIRST ARG470 :
    MATCH "" -> GOTO ARG471;
    TRUE -> STOP;

STATE USEFIRST ARG471 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG472;
    TRUE -> STOP;

STATE USEFIRST ARG472 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG473;
    TRUE -> STOP;

STATE USEFIRST ARG473 :
    MATCH "switch (id)" -> GOTO ARG474;
    TRUE -> STOP;

STATE USEFIRST ARG474 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG475;
    TRUE -> STOP;

STATE USEFIRST ARG475 :
    MATCH "res = res_return() < 0" -> GOTO ARG476;
    TRUE -> STOP;

STATE USEFIRST ARG476 :
    MATCH "res = res_return() < 0" -> GOTO ARG477;
    TRUE -> STOP;

STATE USEFIRST ARG477 :
    MATCH "" -> GOTO ARG478;
    TRUE -> STOP;

STATE USEFIRST ARG478 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (16);} GOTO ARG479;
    TRUE -> STOP;

STATE USEFIRST ARG479 :
    MATCH "flag++ < 100" -> ASSUME {flag == (17);} GOTO ARG480;
    TRUE -> STOP;

STATE USEFIRST ARG480 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (16);} GOTO ARG481;
    TRUE -> STOP;

STATE USEFIRST ARG481 :
    MATCH "return 5;" -> GOTO ARG482;
    TRUE -> STOP;

STATE USEFIRST ARG482 :
    MATCH "" -> GOTO ARG483;
    TRUE -> STOP;

STATE USEFIRST ARG483 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (0);} GOTO ARG484;
    TRUE -> STOP;

STATE USEFIRST ARG484 :
    MATCH "[!(res = res_return() < 0)]" -> ASSUME {res == (0);} GOTO ARG485;
    TRUE -> STOP;

STATE USEFIRST ARG485 :
    MATCH "res = res_return() == 0" -> GOTO ARG486;
    TRUE -> STOP;

STATE USEFIRST ARG486 :
    MATCH "res = res_return() == 0" -> GOTO ARG487;
    TRUE -> STOP;

STATE USEFIRST ARG487 :
    MATCH "" -> GOTO ARG488;
    TRUE -> STOP;

STATE USEFIRST ARG488 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (17);} GOTO ARG489;
    TRUE -> STOP;

STATE USEFIRST ARG489 :
    MATCH "flag++ < 100" -> ASSUME {flag == (18);} GOTO ARG490;
    TRUE -> STOP;

STATE USEFIRST ARG490 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (17);} GOTO ARG491;
    TRUE -> STOP;

STATE USEFIRST ARG491 :
    MATCH "return 5;" -> GOTO ARG492;
    TRUE -> STOP;

STATE USEFIRST ARG492 :
    MATCH "" -> GOTO ARG493;
    TRUE -> STOP;

STATE USEFIRST ARG493 :
    MATCH "res = res_return() == 0" -> ASSUME {res == (0);} GOTO ARG494;
    TRUE -> STOP;

STATE USEFIRST ARG494 :
    MATCH "[!(res = res_return() == 0)]" -> ASSUME {res == (0);} GOTO ARG495;
    TRUE -> STOP;

STATE USEFIRST ARG495 :
    MATCH "break;" -> GOTO ARG496;
    TRUE -> STOP;

STATE USEFIRST ARG496 :
    MATCH "" -> GOTO ARG497;
    TRUE -> STOP;

STATE USEFIRST ARG497 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG498;
    TRUE -> STOP;

STATE USEFIRST ARG498 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG499;
    TRUE -> STOP;

STATE USEFIRST ARG499 :
    MATCH "switch (id)" -> GOTO ARG500;
    TRUE -> STOP;

STATE USEFIRST ARG500 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG501;
    TRUE -> STOP;

STATE USEFIRST ARG501 :
    MATCH "res = res_return() < 0" -> GOTO ARG502;
    TRUE -> STOP;

STATE USEFIRST ARG502 :
    MATCH "res = res_return() < 0" -> GOTO ARG503;
    TRUE -> STOP;

STATE USEFIRST ARG503 :
    MATCH "" -> GOTO ARG504;
    TRUE -> STOP;

STATE USEFIRST ARG504 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (18);} GOTO ARG505;
    TRUE -> STOP;

STATE USEFIRST ARG505 :
    MATCH "flag++ < 100" -> ASSUME {flag == (19);} GOTO ARG506;
    TRUE -> STOP;

STATE USEFIRST ARG506 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (18);} GOTO ARG507;
    TRUE -> STOP;

STATE USEFIRST ARG507 :
    MATCH "return 5;" -> GOTO ARG508;
    TRUE -> STOP;

STATE USEFIRST ARG508 :
    MATCH "" -> GOTO ARG509;
    TRUE -> STOP;

STATE USEFIRST ARG509 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (0);} GOTO ARG510;
    TRUE -> STOP;

STATE USEFIRST ARG510 :
    MATCH "[!(res = res_return() < 0)]" -> ASSUME {res == (0);} GOTO ARG511;
    TRUE -> STOP;

STATE USEFIRST ARG511 :
    MATCH "res = res_return() == 0" -> GOTO ARG512;
    TRUE -> STOP;

STATE USEFIRST ARG512 :
    MATCH "res = res_return() == 0" -> GOTO ARG513;
    TRUE -> STOP;

STATE USEFIRST ARG513 :
    MATCH "" -> GOTO ARG514;
    TRUE -> STOP;

STATE USEFIRST ARG514 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (19);} GOTO ARG515;
    TRUE -> STOP;

STATE USEFIRST ARG515 :
    MATCH "flag++ < 100" -> ASSUME {flag == (20);} GOTO ARG516;
    TRUE -> STOP;

STATE USEFIRST ARG516 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (19);} GOTO ARG517;
    TRUE -> STOP;

STATE USEFIRST ARG517 :
    MATCH "return 5;" -> GOTO ARG518;
    TRUE -> STOP;

STATE USEFIRST ARG518 :
    MATCH "" -> GOTO ARG519;
    TRUE -> STOP;

STATE USEFIRST ARG519 :
    MATCH "res = res_return() == 0" -> ASSUME {res == (0);} GOTO ARG520;
    TRUE -> STOP;

STATE USEFIRST ARG520 :
    MATCH "[!(res = res_return() == 0)]" -> ASSUME {res == (0);} GOTO ARG521;
    TRUE -> STOP;

STATE USEFIRST ARG521 :
    MATCH "break;" -> GOTO ARG522;
    TRUE -> STOP;

STATE USEFIRST ARG522 :
    MATCH "" -> GOTO ARG523;
    TRUE -> STOP;

STATE USEFIRST ARG523 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG524;
    TRUE -> STOP;

STATE USEFIRST ARG524 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG525;
    TRUE -> STOP;

STATE USEFIRST ARG525 :
    MATCH "switch (id)" -> GOTO ARG526;
    TRUE -> STOP;

STATE USEFIRST ARG526 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG527;
    TRUE -> STOP;

STATE USEFIRST ARG527 :
    MATCH "res = res_return() < 0" -> GOTO ARG528;
    TRUE -> STOP;

STATE USEFIRST ARG528 :
    MATCH "res = res_return() < 0" -> GOTO ARG529;
    TRUE -> STOP;

STATE USEFIRST ARG529 :
    MATCH "" -> GOTO ARG530;
    TRUE -> STOP;

STATE USEFIRST ARG530 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (20);} GOTO ARG531;
    TRUE -> STOP;

STATE USEFIRST ARG531 :
    MATCH "flag++ < 100" -> ASSUME {flag == (21);} GOTO ARG532;
    TRUE -> STOP;

STATE USEFIRST ARG532 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (20);} GOTO ARG533;
    TRUE -> STOP;

STATE USEFIRST ARG533 :
    MATCH "return 5;" -> GOTO ARG534;
    TRUE -> STOP;

STATE USEFIRST ARG534 :
    MATCH "" -> GOTO ARG535;
    TRUE -> STOP;

STATE USEFIRST ARG535 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (0);} GOTO ARG536;
    TRUE -> STOP;

STATE USEFIRST ARG536 :
    MATCH "[!(res = res_return() < 0)]" -> ASSUME {res == (0);} GOTO ARG537;
    TRUE -> STOP;

STATE USEFIRST ARG537 :
    MATCH "res = res_return() == 0" -> GOTO ARG538;
    TRUE -> STOP;

STATE USEFIRST ARG538 :
    MATCH "res = res_return() == 0" -> GOTO ARG539;
    TRUE -> STOP;

STATE USEFIRST ARG539 :
    MATCH "" -> GOTO ARG540;
    TRUE -> STOP;

STATE USEFIRST ARG540 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (21);} GOTO ARG541;
    TRUE -> STOP;

STATE USEFIRST ARG541 :
    MATCH "flag++ < 100" -> ASSUME {flag == (22);} GOTO ARG542;
    TRUE -> STOP;

STATE USEFIRST ARG542 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (21);} GOTO ARG543;
    TRUE -> STOP;

STATE USEFIRST ARG543 :
    MATCH "return 5;" -> GOTO ARG544;
    TRUE -> STOP;

STATE USEFIRST ARG544 :
    MATCH "" -> GOTO ARG545;
    TRUE -> STOP;

STATE USEFIRST ARG545 :
    MATCH "res = res_return() == 0" -> ASSUME {res == (0);} GOTO ARG546;
    TRUE -> STOP;

STATE USEFIRST ARG546 :
    MATCH "[!(res = res_return() == 0)]" -> ASSUME {res == (0);} GOTO ARG547;
    TRUE -> STOP;

STATE USEFIRST ARG547 :
    MATCH "break;" -> GOTO ARG548;
    TRUE -> STOP;

STATE USEFIRST ARG548 :
    MATCH "" -> GOTO ARG549;
    TRUE -> STOP;

STATE USEFIRST ARG549 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG550;
    TRUE -> STOP;

STATE USEFIRST ARG550 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG551;
    TRUE -> STOP;

STATE USEFIRST ARG551 :
    MATCH "switch (id)" -> GOTO ARG552;
    TRUE -> STOP;

STATE USEFIRST ARG552 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG553;
    TRUE -> STOP;

STATE USEFIRST ARG553 :
    MATCH "res = res_return() < 0" -> GOTO ARG554;
    TRUE -> STOP;

STATE USEFIRST ARG554 :
    MATCH "res = res_return() < 0" -> GOTO ARG555;
    TRUE -> STOP;

STATE USEFIRST ARG555 :
    MATCH "" -> GOTO ARG556;
    TRUE -> STOP;

STATE USEFIRST ARG556 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (22);} GOTO ARG557;
    TRUE -> STOP;

STATE USEFIRST ARG557 :
    MATCH "flag++ < 100" -> ASSUME {flag == (23);} GOTO ARG558;
    TRUE -> STOP;

STATE USEFIRST ARG558 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (22);} GOTO ARG559;
    TRUE -> STOP;

STATE USEFIRST ARG559 :
    MATCH "return 5;" -> GOTO ARG560;
    TRUE -> STOP;

STATE USEFIRST ARG560 :
    MATCH "" -> GOTO ARG561;
    TRUE -> STOP;

STATE USEFIRST ARG561 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (0);} GOTO ARG562;
    TRUE -> STOP;

STATE USEFIRST ARG562 :
    MATCH "[!(res = res_return() < 0)]" -> ASSUME {res == (0);} GOTO ARG563;
    TRUE -> STOP;

STATE USEFIRST ARG563 :
    MATCH "res = res_return() == 0" -> GOTO ARG564;
    TRUE -> STOP;

STATE USEFIRST ARG564 :
    MATCH "res = res_return() == 0" -> GOTO ARG565;
    TRUE -> STOP;

STATE USEFIRST ARG565 :
    MATCH "" -> GOTO ARG566;
    TRUE -> STOP;

STATE USEFIRST ARG566 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (23);} GOTO ARG567;
    TRUE -> STOP;

STATE USEFIRST ARG567 :
    MATCH "flag++ < 100" -> ASSUME {flag == (24);} GOTO ARG568;
    TRUE -> STOP;

STATE USEFIRST ARG568 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (23);} GOTO ARG569;
    TRUE -> STOP;

STATE USEFIRST ARG569 :
    MATCH "return 5;" -> GOTO ARG570;
    TRUE -> STOP;

STATE USEFIRST ARG570 :
    MATCH "" -> GOTO ARG571;
    TRUE -> STOP;

STATE USEFIRST ARG571 :
    MATCH "res = res_return() == 0" -> ASSUME {res == (0);} GOTO ARG572;
    TRUE -> STOP;

STATE USEFIRST ARG572 :
    MATCH "[!(res = res_return() == 0)]" -> ASSUME {res == (0);} GOTO ARG573;
    TRUE -> STOP;

STATE USEFIRST ARG573 :
    MATCH "break;" -> GOTO ARG574;
    TRUE -> STOP;

STATE USEFIRST ARG574 :
    MATCH "" -> GOTO ARG575;
    TRUE -> STOP;

STATE USEFIRST ARG575 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG576;
    TRUE -> STOP;

STATE USEFIRST ARG576 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG577;
    TRUE -> STOP;

STATE USEFIRST ARG577 :
    MATCH "switch (id)" -> GOTO ARG578;
    TRUE -> STOP;

STATE USEFIRST ARG578 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG579;
    TRUE -> STOP;

STATE USEFIRST ARG579 :
    MATCH "res = res_return() < 0" -> GOTO ARG580;
    TRUE -> STOP;

STATE USEFIRST ARG580 :
    MATCH "res = res_return() < 0" -> GOTO ARG581;
    TRUE -> STOP;

STATE USEFIRST ARG581 :
    MATCH "" -> GOTO ARG582;
    TRUE -> STOP;

STATE USEFIRST ARG582 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (24);} GOTO ARG583;
    TRUE -> STOP;

STATE USEFIRST ARG583 :
    MATCH "flag++ < 100" -> ASSUME {flag == (25);} GOTO ARG584;
    TRUE -> STOP;

STATE USEFIRST ARG584 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (24);} GOTO ARG585;
    TRUE -> STOP;

STATE USEFIRST ARG585 :
    MATCH "return 5;" -> GOTO ARG586;
    TRUE -> STOP;

STATE USEFIRST ARG586 :
    MATCH "" -> GOTO ARG587;
    TRUE -> STOP;

STATE USEFIRST ARG587 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (0);} GOTO ARG588;
    TRUE -> STOP;

STATE USEFIRST ARG588 :
    MATCH "[!(res = res_return() < 0)]" -> ASSUME {res == (0);} GOTO ARG589;
    TRUE -> STOP;

STATE USEFIRST ARG589 :
    MATCH "res = res_return() == 0" -> GOTO ARG590;
    TRUE -> STOP;

STATE USEFIRST ARG590 :
    MATCH "res = res_return() == 0" -> GOTO ARG591;
    TRUE -> STOP;

STATE USEFIRST ARG591 :
    MATCH "" -> GOTO ARG592;
    TRUE -> STOP;

STATE USEFIRST ARG592 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (25);} GOTO ARG593;
    TRUE -> STOP;

STATE USEFIRST ARG593 :
    MATCH "flag++ < 100" -> ASSUME {flag == (26);} GOTO ARG594;
    TRUE -> STOP;

STATE USEFIRST ARG594 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (25);} GOTO ARG595;
    TRUE -> STOP;

STATE USEFIRST ARG595 :
    MATCH "return 5;" -> GOTO ARG596;
    TRUE -> STOP;

STATE USEFIRST ARG596 :
    MATCH "" -> GOTO ARG597;
    TRUE -> STOP;

STATE USEFIRST ARG597 :
    MATCH "res = res_return() == 0" -> ASSUME {res == (0);} GOTO ARG598;
    TRUE -> STOP;

STATE USEFIRST ARG598 :
    MATCH "[!(res = res_return() == 0)]" -> ASSUME {res == (0);} GOTO ARG599;
    TRUE -> STOP;

STATE USEFIRST ARG599 :
    MATCH "break;" -> GOTO ARG600;
    TRUE -> STOP;

STATE USEFIRST ARG600 :
    MATCH "" -> GOTO ARG601;
    TRUE -> STOP;

STATE USEFIRST ARG601 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG602;
    TRUE -> STOP;

STATE USEFIRST ARG602 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG603;
    TRUE -> STOP;

STATE USEFIRST ARG603 :
    MATCH "switch (id)" -> GOTO ARG604;
    TRUE -> STOP;

STATE USEFIRST ARG604 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG605;
    TRUE -> STOP;

STATE USEFIRST ARG605 :
    MATCH "res = res_return() < 0" -> GOTO ARG606;
    TRUE -> STOP;

STATE USEFIRST ARG606 :
    MATCH "res = res_return() < 0" -> GOTO ARG607;
    TRUE -> STOP;

STATE USEFIRST ARG607 :
    MATCH "" -> GOTO ARG608;
    TRUE -> STOP;

STATE USEFIRST ARG608 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (26);} GOTO ARG609;
    TRUE -> STOP;

STATE USEFIRST ARG609 :
    MATCH "flag++ < 100" -> ASSUME {flag == (27);} GOTO ARG610;
    TRUE -> STOP;

STATE USEFIRST ARG610 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (26);} GOTO ARG611;
    TRUE -> STOP;

STATE USEFIRST ARG611 :
    MATCH "return 5;" -> GOTO ARG612;
    TRUE -> STOP;

STATE USEFIRST ARG612 :
    MATCH "" -> GOTO ARG613;
    TRUE -> STOP;

STATE USEFIRST ARG613 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (0);} GOTO ARG614;
    TRUE -> STOP;

STATE USEFIRST ARG614 :
    MATCH "[!(res = res_return() < 0)]" -> ASSUME {res == (0);} GOTO ARG615;
    TRUE -> STOP;

STATE USEFIRST ARG615 :
    MATCH "res = res_return() == 0" -> GOTO ARG616;
    TRUE -> STOP;

STATE USEFIRST ARG616 :
    MATCH "res = res_return() == 0" -> GOTO ARG617;
    TRUE -> STOP;

STATE USEFIRST ARG617 :
    MATCH "" -> GOTO ARG618;
    TRUE -> STOP;

STATE USEFIRST ARG618 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (27);} GOTO ARG619;
    TRUE -> STOP;

STATE USEFIRST ARG619 :
    MATCH "flag++ < 100" -> ASSUME {flag == (28);} GOTO ARG620;
    TRUE -> STOP;

STATE USEFIRST ARG620 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (27);} GOTO ARG621;
    TRUE -> STOP;

STATE USEFIRST ARG621 :
    MATCH "return 5;" -> GOTO ARG622;
    TRUE -> STOP;

STATE USEFIRST ARG622 :
    MATCH "" -> GOTO ARG623;
    TRUE -> STOP;

STATE USEFIRST ARG623 :
    MATCH "res = res_return() == 0" -> ASSUME {res == (0);} GOTO ARG624;
    TRUE -> STOP;

STATE USEFIRST ARG624 :
    MATCH "[!(res = res_return() == 0)]" -> ASSUME {res == (0);} GOTO ARG625;
    TRUE -> STOP;

STATE USEFIRST ARG625 :
    MATCH "break;" -> GOTO ARG626;
    TRUE -> STOP;

STATE USEFIRST ARG626 :
    MATCH "" -> GOTO ARG627;
    TRUE -> STOP;

STATE USEFIRST ARG627 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG628;
    TRUE -> STOP;

STATE USEFIRST ARG628 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG629;
    TRUE -> STOP;

STATE USEFIRST ARG629 :
    MATCH "switch (id)" -> GOTO ARG630;
    TRUE -> STOP;

STATE USEFIRST ARG630 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG631;
    TRUE -> STOP;

STATE USEFIRST ARG631 :
    MATCH "res = res_return() < 0" -> GOTO ARG632;
    TRUE -> STOP;

STATE USEFIRST ARG632 :
    MATCH "res = res_return() < 0" -> GOTO ARG633;
    TRUE -> STOP;

STATE USEFIRST ARG633 :
    MATCH "" -> GOTO ARG634;
    TRUE -> STOP;

STATE USEFIRST ARG634 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (28);} GOTO ARG635;
    TRUE -> STOP;

STATE USEFIRST ARG635 :
    MATCH "flag++ < 100" -> ASSUME {flag == (29);} GOTO ARG636;
    TRUE -> STOP;

STATE USEFIRST ARG636 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (28);} GOTO ARG637;
    TRUE -> STOP;

STATE USEFIRST ARG637 :
    MATCH "return 5;" -> GOTO ARG638;
    TRUE -> STOP;

STATE USEFIRST ARG638 :
    MATCH "" -> GOTO ARG639;
    TRUE -> STOP;

STATE USEFIRST ARG639 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (0);} GOTO ARG640;
    TRUE -> STOP;

STATE USEFIRST ARG640 :
    MATCH "[!(res = res_return() < 0)]" -> ASSUME {res == (0);} GOTO ARG641;
    TRUE -> STOP;

STATE USEFIRST ARG641 :
    MATCH "res = res_return() == 0" -> GOTO ARG642;
    TRUE -> STOP;

STATE USEFIRST ARG642 :
    MATCH "res = res_return() == 0" -> GOTO ARG643;
    TRUE -> STOP;

STATE USEFIRST ARG643 :
    MATCH "" -> GOTO ARG644;
    TRUE -> STOP;

STATE USEFIRST ARG644 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (29);} GOTO ARG645;
    TRUE -> STOP;

STATE USEFIRST ARG645 :
    MATCH "flag++ < 100" -> ASSUME {flag == (30);} GOTO ARG646;
    TRUE -> STOP;

STATE USEFIRST ARG646 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (29);} GOTO ARG647;
    TRUE -> STOP;

STATE USEFIRST ARG647 :
    MATCH "return 5;" -> GOTO ARG648;
    TRUE -> STOP;

STATE USEFIRST ARG648 :
    MATCH "" -> GOTO ARG649;
    TRUE -> STOP;

STATE USEFIRST ARG649 :
    MATCH "res = res_return() == 0" -> ASSUME {res == (0);} GOTO ARG650;
    TRUE -> STOP;

STATE USEFIRST ARG650 :
    MATCH "[!(res = res_return() == 0)]" -> ASSUME {res == (0);} GOTO ARG651;
    TRUE -> STOP;

STATE USEFIRST ARG651 :
    MATCH "break;" -> GOTO ARG652;
    TRUE -> STOP;

STATE USEFIRST ARG652 :
    MATCH "" -> GOTO ARG653;
    TRUE -> STOP;

STATE USEFIRST ARG653 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG654;
    TRUE -> STOP;

STATE USEFIRST ARG654 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG655;
    TRUE -> STOP;

STATE USEFIRST ARG655 :
    MATCH "switch (id)" -> GOTO ARG656;
    TRUE -> STOP;

STATE USEFIRST ARG656 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG657;
    TRUE -> STOP;

STATE USEFIRST ARG657 :
    MATCH "res = res_return() < 0" -> GOTO ARG658;
    TRUE -> STOP;

STATE USEFIRST ARG658 :
    MATCH "res = res_return() < 0" -> GOTO ARG659;
    TRUE -> STOP;

STATE USEFIRST ARG659 :
    MATCH "" -> GOTO ARG660;
    TRUE -> STOP;

STATE USEFIRST ARG660 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (30);} GOTO ARG661;
    TRUE -> STOP;

STATE USEFIRST ARG661 :
    MATCH "flag++ < 100" -> ASSUME {flag == (31);} GOTO ARG662;
    TRUE -> STOP;

STATE USEFIRST ARG662 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (30);} GOTO ARG663;
    TRUE -> STOP;

STATE USEFIRST ARG663 :
    MATCH "return 5;" -> GOTO ARG664;
    TRUE -> STOP;

STATE USEFIRST ARG664 :
    MATCH "" -> GOTO ARG665;
    TRUE -> STOP;

STATE USEFIRST ARG665 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (0);} GOTO ARG666;
    TRUE -> STOP;

STATE USEFIRST ARG666 :
    MATCH "[!(res = res_return() < 0)]" -> ASSUME {res == (0);} GOTO ARG667;
    TRUE -> STOP;

STATE USEFIRST ARG667 :
    MATCH "res = res_return() == 0" -> GOTO ARG668;
    TRUE -> STOP;

STATE USEFIRST ARG668 :
    MATCH "res = res_return() == 0" -> GOTO ARG669;
    TRUE -> STOP;

STATE USEFIRST ARG669 :
    MATCH "" -> GOTO ARG670;
    TRUE -> STOP;

STATE USEFIRST ARG670 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (31);} GOTO ARG671;
    TRUE -> STOP;

STATE USEFIRST ARG671 :
    MATCH "flag++ < 100" -> ASSUME {flag == (32);} GOTO ARG672;
    TRUE -> STOP;

STATE USEFIRST ARG672 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (31);} GOTO ARG673;
    TRUE -> STOP;

STATE USEFIRST ARG673 :
    MATCH "return 5;" -> GOTO ARG674;
    TRUE -> STOP;

STATE USEFIRST ARG674 :
    MATCH "" -> GOTO ARG675;
    TRUE -> STOP;

STATE USEFIRST ARG675 :
    MATCH "res = res_return() == 0" -> ASSUME {res == (0);} GOTO ARG676;
    TRUE -> STOP;

STATE USEFIRST ARG676 :
    MATCH "[!(res = res_return() == 0)]" -> ASSUME {res == (0);} GOTO ARG677;
    TRUE -> STOP;

STATE USEFIRST ARG677 :
    MATCH "break;" -> GOTO ARG678;
    TRUE -> STOP;

STATE USEFIRST ARG678 :
    MATCH "" -> GOTO ARG679;
    TRUE -> STOP;

STATE USEFIRST ARG679 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG680;
    TRUE -> STOP;

STATE USEFIRST ARG680 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG681;
    TRUE -> STOP;

STATE USEFIRST ARG681 :
    MATCH "switch (id)" -> GOTO ARG682;
    TRUE -> STOP;

STATE USEFIRST ARG682 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG683;
    TRUE -> STOP;

STATE USEFIRST ARG683 :
    MATCH "res = res_return() < 0" -> GOTO ARG684;
    TRUE -> STOP;

STATE USEFIRST ARG684 :
    MATCH "res = res_return() < 0" -> GOTO ARG685;
    TRUE -> STOP;

STATE USEFIRST ARG685 :
    MATCH "" -> GOTO ARG686;
    TRUE -> STOP;

STATE USEFIRST ARG686 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (32);} GOTO ARG687;
    TRUE -> STOP;

STATE USEFIRST ARG687 :
    MATCH "flag++ < 100" -> ASSUME {flag == (33);} GOTO ARG688;
    TRUE -> STOP;

STATE USEFIRST ARG688 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (32);} GOTO ARG689;
    TRUE -> STOP;

STATE USEFIRST ARG689 :
    MATCH "return 5;" -> GOTO ARG690;
    TRUE -> STOP;

STATE USEFIRST ARG690 :
    MATCH "" -> GOTO ARG691;
    TRUE -> STOP;

STATE USEFIRST ARG691 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (0);} GOTO ARG692;
    TRUE -> STOP;

STATE USEFIRST ARG692 :
    MATCH "[!(res = res_return() < 0)]" -> ASSUME {res == (0);} GOTO ARG693;
    TRUE -> STOP;

STATE USEFIRST ARG693 :
    MATCH "res = res_return() == 0" -> GOTO ARG694;
    TRUE -> STOP;

STATE USEFIRST ARG694 :
    MATCH "res = res_return() == 0" -> GOTO ARG695;
    TRUE -> STOP;

STATE USEFIRST ARG695 :
    MATCH "" -> GOTO ARG696;
    TRUE -> STOP;

STATE USEFIRST ARG696 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (33);} GOTO ARG697;
    TRUE -> STOP;

STATE USEFIRST ARG697 :
    MATCH "flag++ < 100" -> ASSUME {flag == (34);} GOTO ARG698;
    TRUE -> STOP;

STATE USEFIRST ARG698 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (33);} GOTO ARG699;
    TRUE -> STOP;

STATE USEFIRST ARG699 :
    MATCH "return 5;" -> GOTO ARG700;
    TRUE -> STOP;

STATE USEFIRST ARG700 :
    MATCH "" -> GOTO ARG701;
    TRUE -> STOP;

STATE USEFIRST ARG701 :
    MATCH "res = res_return() == 0" -> ASSUME {res == (0);} GOTO ARG702;
    TRUE -> STOP;

STATE USEFIRST ARG702 :
    MATCH "[!(res = res_return() == 0)]" -> ASSUME {res == (0);} GOTO ARG703;
    TRUE -> STOP;

STATE USEFIRST ARG703 :
    MATCH "break;" -> GOTO ARG704;
    TRUE -> STOP;

STATE USEFIRST ARG704 :
    MATCH "" -> GOTO ARG705;
    TRUE -> STOP;

STATE USEFIRST ARG705 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG706;
    TRUE -> STOP;

STATE USEFIRST ARG706 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG707;
    TRUE -> STOP;

STATE USEFIRST ARG707 :
    MATCH "switch (id)" -> GOTO ARG708;
    TRUE -> STOP;

STATE USEFIRST ARG708 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG709;
    TRUE -> STOP;

STATE USEFIRST ARG709 :
    MATCH "res = res_return() < 0" -> GOTO ARG710;
    TRUE -> STOP;

STATE USEFIRST ARG710 :
    MATCH "res = res_return() < 0" -> GOTO ARG711;
    TRUE -> STOP;

STATE USEFIRST ARG711 :
    MATCH "" -> GOTO ARG712;
    TRUE -> STOP;

STATE USEFIRST ARG712 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (34);} GOTO ARG713;
    TRUE -> STOP;

STATE USEFIRST ARG713 :
    MATCH "flag++ < 100" -> ASSUME {flag == (35);} GOTO ARG714;
    TRUE -> STOP;

STATE USEFIRST ARG714 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (34);} GOTO ARG715;
    TRUE -> STOP;

STATE USEFIRST ARG715 :
    MATCH "return 5;" -> GOTO ARG716;
    TRUE -> STOP;

STATE USEFIRST ARG716 :
    MATCH "" -> GOTO ARG717;
    TRUE -> STOP;

STATE USEFIRST ARG717 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (0);} GOTO ARG718;
    TRUE -> STOP;

STATE USEFIRST ARG718 :
    MATCH "[!(res = res_return() < 0)]" -> ASSUME {res == (0);} GOTO ARG719;
    TRUE -> STOP;

STATE USEFIRST ARG719 :
    MATCH "res = res_return() == 0" -> GOTO ARG720;
    TRUE -> STOP;

STATE USEFIRST ARG720 :
    MATCH "res = res_return() == 0" -> GOTO ARG721;
    TRUE -> STOP;

STATE USEFIRST ARG721 :
    MATCH "" -> GOTO ARG722;
    TRUE -> STOP;

STATE USEFIRST ARG722 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (35);} GOTO ARG723;
    TRUE -> STOP;

STATE USEFIRST ARG723 :
    MATCH "flag++ < 100" -> ASSUME {flag == (36);} GOTO ARG724;
    TRUE -> STOP;

STATE USEFIRST ARG724 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (35);} GOTO ARG725;
    TRUE -> STOP;

STATE USEFIRST ARG725 :
    MATCH "return 5;" -> GOTO ARG726;
    TRUE -> STOP;

STATE USEFIRST ARG726 :
    MATCH "" -> GOTO ARG727;
    TRUE -> STOP;

STATE USEFIRST ARG727 :
    MATCH "res = res_return() == 0" -> ASSUME {res == (0);} GOTO ARG728;
    TRUE -> STOP;

STATE USEFIRST ARG728 :
    MATCH "[!(res = res_return() == 0)]" -> ASSUME {res == (0);} GOTO ARG729;
    TRUE -> STOP;

STATE USEFIRST ARG729 :
    MATCH "break;" -> GOTO ARG730;
    TRUE -> STOP;

STATE USEFIRST ARG730 :
    MATCH "" -> GOTO ARG731;
    TRUE -> STOP;

STATE USEFIRST ARG731 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG732;
    TRUE -> STOP;

STATE USEFIRST ARG732 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG733;
    TRUE -> STOP;

STATE USEFIRST ARG733 :
    MATCH "switch (id)" -> GOTO ARG734;
    TRUE -> STOP;

STATE USEFIRST ARG734 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG735;
    TRUE -> STOP;

STATE USEFIRST ARG735 :
    MATCH "res = res_return() < 0" -> GOTO ARG736;
    TRUE -> STOP;

STATE USEFIRST ARG736 :
    MATCH "res = res_return() < 0" -> GOTO ARG737;
    TRUE -> STOP;

STATE USEFIRST ARG737 :
    MATCH "" -> GOTO ARG738;
    TRUE -> STOP;

STATE USEFIRST ARG738 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (36);} GOTO ARG739;
    TRUE -> STOP;

STATE USEFIRST ARG739 :
    MATCH "flag++ < 100" -> ASSUME {flag == (37);} GOTO ARG740;
    TRUE -> STOP;

STATE USEFIRST ARG740 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (36);} GOTO ARG741;
    TRUE -> STOP;

STATE USEFIRST ARG741 :
    MATCH "return 5;" -> GOTO ARG742;
    TRUE -> STOP;

STATE USEFIRST ARG742 :
    MATCH "" -> GOTO ARG743;
    TRUE -> STOP;

STATE USEFIRST ARG743 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (0);} GOTO ARG744;
    TRUE -> STOP;

STATE USEFIRST ARG744 :
    MATCH "[!(res = res_return() < 0)]" -> ASSUME {res == (0);} GOTO ARG745;
    TRUE -> STOP;

STATE USEFIRST ARG745 :
    MATCH "res = res_return() == 0" -> GOTO ARG746;
    TRUE -> STOP;

STATE USEFIRST ARG746 :
    MATCH "res = res_return() == 0" -> GOTO ARG747;
    TRUE -> STOP;

STATE USEFIRST ARG747 :
    MATCH "" -> GOTO ARG748;
    TRUE -> STOP;

STATE USEFIRST ARG748 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (37);} GOTO ARG749;
    TRUE -> STOP;

STATE USEFIRST ARG749 :
    MATCH "flag++ < 100" -> ASSUME {flag == (38);} GOTO ARG750;
    TRUE -> STOP;

STATE USEFIRST ARG750 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (37);} GOTO ARG751;
    TRUE -> STOP;

STATE USEFIRST ARG751 :
    MATCH "return 5;" -> GOTO ARG752;
    TRUE -> STOP;

STATE USEFIRST ARG752 :
    MATCH "" -> GOTO ARG753;
    TRUE -> STOP;

STATE USEFIRST ARG753 :
    MATCH "res = res_return() == 0" -> ASSUME {res == (0);} GOTO ARG754;
    TRUE -> STOP;

STATE USEFIRST ARG754 :
    MATCH "[!(res = res_return() == 0)]" -> ASSUME {res == (0);} GOTO ARG755;
    TRUE -> STOP;

STATE USEFIRST ARG755 :
    MATCH "break;" -> GOTO ARG756;
    TRUE -> STOP;

STATE USEFIRST ARG756 :
    MATCH "" -> GOTO ARG757;
    TRUE -> STOP;

STATE USEFIRST ARG757 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG758;
    TRUE -> STOP;

STATE USEFIRST ARG758 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG759;
    TRUE -> STOP;

STATE USEFIRST ARG759 :
    MATCH "switch (id)" -> GOTO ARG760;
    TRUE -> STOP;

STATE USEFIRST ARG760 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG761;
    TRUE -> STOP;

STATE USEFIRST ARG761 :
    MATCH "res = res_return() < 0" -> GOTO ARG762;
    TRUE -> STOP;

STATE USEFIRST ARG762 :
    MATCH "res = res_return() < 0" -> GOTO ARG763;
    TRUE -> STOP;

STATE USEFIRST ARG763 :
    MATCH "" -> GOTO ARG764;
    TRUE -> STOP;

STATE USEFIRST ARG764 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (38);} GOTO ARG765;
    TRUE -> STOP;

STATE USEFIRST ARG765 :
    MATCH "flag++ < 100" -> ASSUME {flag == (39);} GOTO ARG766;
    TRUE -> STOP;

STATE USEFIRST ARG766 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (38);} GOTO ARG767;
    TRUE -> STOP;

STATE USEFIRST ARG767 :
    MATCH "return 5;" -> GOTO ARG768;
    TRUE -> STOP;

STATE USEFIRST ARG768 :
    MATCH "" -> GOTO ARG769;
    TRUE -> STOP;

STATE USEFIRST ARG769 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (0);} GOTO ARG770;
    TRUE -> STOP;

STATE USEFIRST ARG770 :
    MATCH "[!(res = res_return() < 0)]" -> ASSUME {res == (0);} GOTO ARG771;
    TRUE -> STOP;

STATE USEFIRST ARG771 :
    MATCH "res = res_return() == 0" -> GOTO ARG772;
    TRUE -> STOP;

STATE USEFIRST ARG772 :
    MATCH "res = res_return() == 0" -> GOTO ARG773;
    TRUE -> STOP;

STATE USEFIRST ARG773 :
    MATCH "" -> GOTO ARG774;
    TRUE -> STOP;

STATE USEFIRST ARG774 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (39);} GOTO ARG775;
    TRUE -> STOP;

STATE USEFIRST ARG775 :
    MATCH "flag++ < 100" -> ASSUME {flag == (40);} GOTO ARG776;
    TRUE -> STOP;

STATE USEFIRST ARG776 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (39);} GOTO ARG777;
    TRUE -> STOP;

STATE USEFIRST ARG777 :
    MATCH "return 5;" -> GOTO ARG778;
    TRUE -> STOP;

STATE USEFIRST ARG778 :
    MATCH "" -> GOTO ARG779;
    TRUE -> STOP;

STATE USEFIRST ARG779 :
    MATCH "res = res_return() == 0" -> ASSUME {res == (0);} GOTO ARG780;
    TRUE -> STOP;

STATE USEFIRST ARG780 :
    MATCH "[!(res = res_return() == 0)]" -> ASSUME {res == (0);} GOTO ARG781;
    TRUE -> STOP;

STATE USEFIRST ARG781 :
    MATCH "break;" -> GOTO ARG782;
    TRUE -> STOP;

STATE USEFIRST ARG782 :
    MATCH "" -> GOTO ARG783;
    TRUE -> STOP;

STATE USEFIRST ARG783 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG784;
    TRUE -> STOP;

STATE USEFIRST ARG784 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG785;
    TRUE -> STOP;

STATE USEFIRST ARG785 :
    MATCH "switch (id)" -> GOTO ARG786;
    TRUE -> STOP;

STATE USEFIRST ARG786 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG787;
    TRUE -> STOP;

STATE USEFIRST ARG787 :
    MATCH "res = res_return() < 0" -> GOTO ARG788;
    TRUE -> STOP;

STATE USEFIRST ARG788 :
    MATCH "res = res_return() < 0" -> GOTO ARG789;
    TRUE -> STOP;

STATE USEFIRST ARG789 :
    MATCH "" -> GOTO ARG790;
    TRUE -> STOP;

STATE USEFIRST ARG790 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (40);} GOTO ARG791;
    TRUE -> STOP;

STATE USEFIRST ARG791 :
    MATCH "flag++ < 100" -> ASSUME {flag == (41);} GOTO ARG792;
    TRUE -> STOP;

STATE USEFIRST ARG792 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (40);} GOTO ARG793;
    TRUE -> STOP;

STATE USEFIRST ARG793 :
    MATCH "return 5;" -> GOTO ARG794;
    TRUE -> STOP;

STATE USEFIRST ARG794 :
    MATCH "" -> GOTO ARG795;
    TRUE -> STOP;

STATE USEFIRST ARG795 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (0);} GOTO ARG796;
    TRUE -> STOP;

STATE USEFIRST ARG796 :
    MATCH "[!(res = res_return() < 0)]" -> ASSUME {res == (0);} GOTO ARG797;
    TRUE -> STOP;

STATE USEFIRST ARG797 :
    MATCH "res = res_return() == 0" -> GOTO ARG798;
    TRUE -> STOP;

STATE USEFIRST ARG798 :
    MATCH "res = res_return() == 0" -> GOTO ARG799;
    TRUE -> STOP;

STATE USEFIRST ARG799 :
    MATCH "" -> GOTO ARG800;
    TRUE -> STOP;

STATE USEFIRST ARG800 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (41);} GOTO ARG801;
    TRUE -> STOP;

STATE USEFIRST ARG801 :
    MATCH "flag++ < 100" -> ASSUME {flag == (42);} GOTO ARG802;
    TRUE -> STOP;

STATE USEFIRST ARG802 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (41);} GOTO ARG803;
    TRUE -> STOP;

STATE USEFIRST ARG803 :
    MATCH "return 5;" -> GOTO ARG804;
    TRUE -> STOP;

STATE USEFIRST ARG804 :
    MATCH "" -> GOTO ARG805;
    TRUE -> STOP;

STATE USEFIRST ARG805 :
    MATCH "res = res_return() == 0" -> ASSUME {res == (0);} GOTO ARG806;
    TRUE -> STOP;

STATE USEFIRST ARG806 :
    MATCH "[!(res = res_return() == 0)]" -> ASSUME {res == (0);} GOTO ARG807;
    TRUE -> STOP;

STATE USEFIRST ARG807 :
    MATCH "break;" -> GOTO ARG808;
    TRUE -> STOP;

STATE USEFIRST ARG808 :
    MATCH "" -> GOTO ARG809;
    TRUE -> STOP;

STATE USEFIRST ARG809 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG810;
    TRUE -> STOP;

STATE USEFIRST ARG810 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG811;
    TRUE -> STOP;

STATE USEFIRST ARG811 :
    MATCH "switch (id)" -> GOTO ARG812;
    TRUE -> STOP;

STATE USEFIRST ARG812 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG813;
    TRUE -> STOP;

STATE USEFIRST ARG813 :
    MATCH "res = res_return() < 0" -> GOTO ARG814;
    TRUE -> STOP;

STATE USEFIRST ARG814 :
    MATCH "res = res_return() < 0" -> GOTO ARG815;
    TRUE -> STOP;

STATE USEFIRST ARG815 :
    MATCH "" -> GOTO ARG816;
    TRUE -> STOP;

STATE USEFIRST ARG816 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (42);} GOTO ARG817;
    TRUE -> STOP;

STATE USEFIRST ARG817 :
    MATCH "flag++ < 100" -> ASSUME {flag == (43);} GOTO ARG818;
    TRUE -> STOP;

STATE USEFIRST ARG818 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (42);} GOTO ARG819;
    TRUE -> STOP;

STATE USEFIRST ARG819 :
    MATCH "return 5;" -> GOTO ARG820;
    TRUE -> STOP;

STATE USEFIRST ARG820 :
    MATCH "" -> GOTO ARG821;
    TRUE -> STOP;

STATE USEFIRST ARG821 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (0);} GOTO ARG822;
    TRUE -> STOP;

STATE USEFIRST ARG822 :
    MATCH "[!(res = res_return() < 0)]" -> ASSUME {res == (0);} GOTO ARG823;
    TRUE -> STOP;

STATE USEFIRST ARG823 :
    MATCH "res = res_return() == 0" -> GOTO ARG824;
    TRUE -> STOP;

STATE USEFIRST ARG824 :
    MATCH "res = res_return() == 0" -> GOTO ARG825;
    TRUE -> STOP;

STATE USEFIRST ARG825 :
    MATCH "" -> GOTO ARG826;
    TRUE -> STOP;

STATE USEFIRST ARG826 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (43);} GOTO ARG827;
    TRUE -> STOP;

STATE USEFIRST ARG827 :
    MATCH "flag++ < 100" -> ASSUME {flag == (44);} GOTO ARG828;
    TRUE -> STOP;

STATE USEFIRST ARG828 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (43);} GOTO ARG829;
    TRUE -> STOP;

STATE USEFIRST ARG829 :
    MATCH "return 5;" -> GOTO ARG830;
    TRUE -> STOP;

STATE USEFIRST ARG830 :
    MATCH "" -> GOTO ARG831;
    TRUE -> STOP;

STATE USEFIRST ARG831 :
    MATCH "res = res_return() == 0" -> ASSUME {res == (0);} GOTO ARG832;
    TRUE -> STOP;

STATE USEFIRST ARG832 :
    MATCH "[!(res = res_return() == 0)]" -> ASSUME {res == (0);} GOTO ARG833;
    TRUE -> STOP;

STATE USEFIRST ARG833 :
    MATCH "break;" -> GOTO ARG834;
    TRUE -> STOP;

STATE USEFIRST ARG834 :
    MATCH "" -> GOTO ARG835;
    TRUE -> STOP;

STATE USEFIRST ARG835 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG836;
    TRUE -> STOP;

STATE USEFIRST ARG836 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG837;
    TRUE -> STOP;

STATE USEFIRST ARG837 :
    MATCH "switch (id)" -> GOTO ARG838;
    TRUE -> STOP;

STATE USEFIRST ARG838 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG839;
    TRUE -> STOP;

STATE USEFIRST ARG839 :
    MATCH "res = res_return() < 0" -> GOTO ARG840;
    TRUE -> STOP;

STATE USEFIRST ARG840 :
    MATCH "res = res_return() < 0" -> GOTO ARG841;
    TRUE -> STOP;

STATE USEFIRST ARG841 :
    MATCH "" -> GOTO ARG842;
    TRUE -> STOP;

STATE USEFIRST ARG842 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (44);} GOTO ARG843;
    TRUE -> STOP;

STATE USEFIRST ARG843 :
    MATCH "flag++ < 100" -> ASSUME {flag == (45);} GOTO ARG844;
    TRUE -> STOP;

STATE USEFIRST ARG844 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (44);} GOTO ARG845;
    TRUE -> STOP;

STATE USEFIRST ARG845 :
    MATCH "return 5;" -> GOTO ARG846;
    TRUE -> STOP;

STATE USEFIRST ARG846 :
    MATCH "" -> GOTO ARG847;
    TRUE -> STOP;

STATE USEFIRST ARG847 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (0);} GOTO ARG848;
    TRUE -> STOP;

STATE USEFIRST ARG848 :
    MATCH "[!(res = res_return() < 0)]" -> ASSUME {res == (0);} GOTO ARG849;
    TRUE -> STOP;

STATE USEFIRST ARG849 :
    MATCH "res = res_return() == 0" -> GOTO ARG850;
    TRUE -> STOP;

STATE USEFIRST ARG850 :
    MATCH "res = res_return() == 0" -> GOTO ARG851;
    TRUE -> STOP;

STATE USEFIRST ARG851 :
    MATCH "" -> GOTO ARG852;
    TRUE -> STOP;

STATE USEFIRST ARG852 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (45);} GOTO ARG853;
    TRUE -> STOP;

STATE USEFIRST ARG853 :
    MATCH "flag++ < 100" -> ASSUME {flag == (46);} GOTO ARG854;
    TRUE -> STOP;

STATE USEFIRST ARG854 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (45);} GOTO ARG855;
    TRUE -> STOP;

STATE USEFIRST ARG855 :
    MATCH "return 5;" -> GOTO ARG856;
    TRUE -> STOP;

STATE USEFIRST ARG856 :
    MATCH "" -> GOTO ARG857;
    TRUE -> STOP;

STATE USEFIRST ARG857 :
    MATCH "res = res_return() == 0" -> ASSUME {res == (0);} GOTO ARG858;
    TRUE -> STOP;

STATE USEFIRST ARG858 :
    MATCH "[!(res = res_return() == 0)]" -> ASSUME {res == (0);} GOTO ARG859;
    TRUE -> STOP;

STATE USEFIRST ARG859 :
    MATCH "break;" -> GOTO ARG860;
    TRUE -> STOP;

STATE USEFIRST ARG860 :
    MATCH "" -> GOTO ARG861;
    TRUE -> STOP;

STATE USEFIRST ARG861 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG862;
    TRUE -> STOP;

STATE USEFIRST ARG862 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG863;
    TRUE -> STOP;

STATE USEFIRST ARG863 :
    MATCH "switch (id)" -> GOTO ARG864;
    TRUE -> STOP;

STATE USEFIRST ARG864 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG865;
    TRUE -> STOP;

STATE USEFIRST ARG865 :
    MATCH "res = res_return() < 0" -> GOTO ARG866;
    TRUE -> STOP;

STATE USEFIRST ARG866 :
    MATCH "res = res_return() < 0" -> GOTO ARG867;
    TRUE -> STOP;

STATE USEFIRST ARG867 :
    MATCH "" -> GOTO ARG868;
    TRUE -> STOP;

STATE USEFIRST ARG868 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (46);} GOTO ARG869;
    TRUE -> STOP;

STATE USEFIRST ARG869 :
    MATCH "flag++ < 100" -> ASSUME {flag == (47);} GOTO ARG870;
    TRUE -> STOP;

STATE USEFIRST ARG870 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (46);} GOTO ARG871;
    TRUE -> STOP;

STATE USEFIRST ARG871 :
    MATCH "return 5;" -> GOTO ARG872;
    TRUE -> STOP;

STATE USEFIRST ARG872 :
    MATCH "" -> GOTO ARG873;
    TRUE -> STOP;

STATE USEFIRST ARG873 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (0);} GOTO ARG874;
    TRUE -> STOP;

STATE USEFIRST ARG874 :
    MATCH "[!(res = res_return() < 0)]" -> ASSUME {res == (0);} GOTO ARG875;
    TRUE -> STOP;

STATE USEFIRST ARG875 :
    MATCH "res = res_return() == 0" -> GOTO ARG876;
    TRUE -> STOP;

STATE USEFIRST ARG876 :
    MATCH "res = res_return() == 0" -> GOTO ARG877;
    TRUE -> STOP;

STATE USEFIRST ARG877 :
    MATCH "" -> GOTO ARG878;
    TRUE -> STOP;

STATE USEFIRST ARG878 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (47);} GOTO ARG879;
    TRUE -> STOP;

STATE USEFIRST ARG879 :
    MATCH "flag++ < 100" -> ASSUME {flag == (48);} GOTO ARG880;
    TRUE -> STOP;

STATE USEFIRST ARG880 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (47);} GOTO ARG881;
    TRUE -> STOP;

STATE USEFIRST ARG881 :
    MATCH "return 5;" -> GOTO ARG882;
    TRUE -> STOP;

STATE USEFIRST ARG882 :
    MATCH "" -> GOTO ARG883;
    TRUE -> STOP;

STATE USEFIRST ARG883 :
    MATCH "res = res_return() == 0" -> ASSUME {res == (0);} GOTO ARG884;
    TRUE -> STOP;

STATE USEFIRST ARG884 :
    MATCH "[!(res = res_return() == 0)]" -> ASSUME {res == (0);} GOTO ARG885;
    TRUE -> STOP;

STATE USEFIRST ARG885 :
    MATCH "break;" -> GOTO ARG886;
    TRUE -> STOP;

STATE USEFIRST ARG886 :
    MATCH "" -> GOTO ARG887;
    TRUE -> STOP;

STATE USEFIRST ARG887 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG888;
    TRUE -> STOP;

STATE USEFIRST ARG888 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG889;
    TRUE -> STOP;

STATE USEFIRST ARG889 :
    MATCH "switch (id)" -> GOTO ARG890;
    TRUE -> STOP;

STATE USEFIRST ARG890 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG891;
    TRUE -> STOP;

STATE USEFIRST ARG891 :
    MATCH "res = res_return() < 0" -> GOTO ARG892;
    TRUE -> STOP;

STATE USEFIRST ARG892 :
    MATCH "res = res_return() < 0" -> GOTO ARG893;
    TRUE -> STOP;

STATE USEFIRST ARG893 :
    MATCH "" -> GOTO ARG894;
    TRUE -> STOP;

STATE USEFIRST ARG894 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (48);} GOTO ARG895;
    TRUE -> STOP;

STATE USEFIRST ARG895 :
    MATCH "flag++ < 100" -> ASSUME {flag == (49);} GOTO ARG896;
    TRUE -> STOP;

STATE USEFIRST ARG896 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (48);} GOTO ARG897;
    TRUE -> STOP;

STATE USEFIRST ARG897 :
    MATCH "return 5;" -> GOTO ARG898;
    TRUE -> STOP;

STATE USEFIRST ARG898 :
    MATCH "" -> GOTO ARG899;
    TRUE -> STOP;

STATE USEFIRST ARG899 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (0);} GOTO ARG900;
    TRUE -> STOP;

STATE USEFIRST ARG900 :
    MATCH "[!(res = res_return() < 0)]" -> ASSUME {res == (0);} GOTO ARG901;
    TRUE -> STOP;

STATE USEFIRST ARG901 :
    MATCH "res = res_return() == 0" -> GOTO ARG902;
    TRUE -> STOP;

STATE USEFIRST ARG902 :
    MATCH "res = res_return() == 0" -> GOTO ARG903;
    TRUE -> STOP;

STATE USEFIRST ARG903 :
    MATCH "" -> GOTO ARG904;
    TRUE -> STOP;

STATE USEFIRST ARG904 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (49);} GOTO ARG905;
    TRUE -> STOP;

STATE USEFIRST ARG905 :
    MATCH "flag++ < 100" -> ASSUME {flag == (50);} GOTO ARG906;
    TRUE -> STOP;

STATE USEFIRST ARG906 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (49);} GOTO ARG907;
    TRUE -> STOP;

STATE USEFIRST ARG907 :
    MATCH "return 5;" -> GOTO ARG908;
    TRUE -> STOP;

STATE USEFIRST ARG908 :
    MATCH "" -> GOTO ARG909;
    TRUE -> STOP;

STATE USEFIRST ARG909 :
    MATCH "res = res_return() == 0" -> ASSUME {res == (0);} GOTO ARG910;
    TRUE -> STOP;

STATE USEFIRST ARG910 :
    MATCH "[!(res = res_return() == 0)]" -> ASSUME {res == (0);} GOTO ARG911;
    TRUE -> STOP;

STATE USEFIRST ARG911 :
    MATCH "break;" -> GOTO ARG912;
    TRUE -> STOP;

STATE USEFIRST ARG912 :
    MATCH "" -> GOTO ARG913;
    TRUE -> STOP;

STATE USEFIRST ARG913 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG914;
    TRUE -> STOP;

STATE USEFIRST ARG914 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG915;
    TRUE -> STOP;

STATE USEFIRST ARG915 :
    MATCH "switch (id)" -> GOTO ARG916;
    TRUE -> STOP;

STATE USEFIRST ARG916 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG917;
    TRUE -> STOP;

STATE USEFIRST ARG917 :
    MATCH "res = res_return() < 0" -> GOTO ARG918;
    TRUE -> STOP;

STATE USEFIRST ARG918 :
    MATCH "res = res_return() < 0" -> GOTO ARG919;
    TRUE -> STOP;

STATE USEFIRST ARG919 :
    MATCH "" -> GOTO ARG920;
    TRUE -> STOP;

STATE USEFIRST ARG920 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (50);} GOTO ARG921;
    TRUE -> STOP;

STATE USEFIRST ARG921 :
    MATCH "flag++ < 100" -> ASSUME {flag == (51);} GOTO ARG922;
    TRUE -> STOP;

STATE USEFIRST ARG922 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (50);} GOTO ARG923;
    TRUE -> STOP;

STATE USEFIRST ARG923 :
    MATCH "return 5;" -> GOTO ARG924;
    TRUE -> STOP;

STATE USEFIRST ARG924 :
    MATCH "" -> GOTO ARG925;
    TRUE -> STOP;

STATE USEFIRST ARG925 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (0);} GOTO ARG926;
    TRUE -> STOP;

STATE USEFIRST ARG926 :
    MATCH "[!(res = res_return() < 0)]" -> ASSUME {res == (0);} GOTO ARG927;
    TRUE -> STOP;

STATE USEFIRST ARG927 :
    MATCH "res = res_return() == 0" -> GOTO ARG928;
    TRUE -> STOP;

STATE USEFIRST ARG928 :
    MATCH "res = res_return() == 0" -> GOTO ARG929;
    TRUE -> STOP;

STATE USEFIRST ARG929 :
    MATCH "" -> GOTO ARG930;
    TRUE -> STOP;

STATE USEFIRST ARG930 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (51);} GOTO ARG931;
    TRUE -> STOP;

STATE USEFIRST ARG931 :
    MATCH "flag++ < 100" -> ASSUME {flag == (52);} GOTO ARG932;
    TRUE -> STOP;

STATE USEFIRST ARG932 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (51);} GOTO ARG933;
    TRUE -> STOP;

STATE USEFIRST ARG933 :
    MATCH "return 5;" -> GOTO ARG934;
    TRUE -> STOP;

STATE USEFIRST ARG934 :
    MATCH "" -> GOTO ARG935;
    TRUE -> STOP;

STATE USEFIRST ARG935 :
    MATCH "res = res_return() == 0" -> ASSUME {res == (0);} GOTO ARG936;
    TRUE -> STOP;

STATE USEFIRST ARG936 :
    MATCH "[!(res = res_return() == 0)]" -> ASSUME {res == (0);} GOTO ARG937;
    TRUE -> STOP;

STATE USEFIRST ARG937 :
    MATCH "break;" -> GOTO ARG938;
    TRUE -> STOP;

STATE USEFIRST ARG938 :
    MATCH "" -> GOTO ARG939;
    TRUE -> STOP;

STATE USEFIRST ARG939 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG940;
    TRUE -> STOP;

STATE USEFIRST ARG940 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG941;
    TRUE -> STOP;

STATE USEFIRST ARG941 :
    MATCH "switch (id)" -> GOTO ARG942;
    TRUE -> STOP;

STATE USEFIRST ARG942 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG943;
    TRUE -> STOP;

STATE USEFIRST ARG943 :
    MATCH "res = res_return() < 0" -> GOTO ARG944;
    TRUE -> STOP;

STATE USEFIRST ARG944 :
    MATCH "res = res_return() < 0" -> GOTO ARG945;
    TRUE -> STOP;

STATE USEFIRST ARG945 :
    MATCH "" -> GOTO ARG946;
    TRUE -> STOP;

STATE USEFIRST ARG946 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (52);} GOTO ARG947;
    TRUE -> STOP;

STATE USEFIRST ARG947 :
    MATCH "flag++ < 100" -> ASSUME {flag == (53);} GOTO ARG948;
    TRUE -> STOP;

STATE USEFIRST ARG948 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (52);} GOTO ARG949;
    TRUE -> STOP;

STATE USEFIRST ARG949 :
    MATCH "return 5;" -> GOTO ARG950;
    TRUE -> STOP;

STATE USEFIRST ARG950 :
    MATCH "" -> GOTO ARG951;
    TRUE -> STOP;

STATE USEFIRST ARG951 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (0);} GOTO ARG952;
    TRUE -> STOP;

STATE USEFIRST ARG952 :
    MATCH "[!(res = res_return() < 0)]" -> ASSUME {res == (0);} GOTO ARG953;
    TRUE -> STOP;

STATE USEFIRST ARG953 :
    MATCH "res = res_return() == 0" -> GOTO ARG954;
    TRUE -> STOP;

STATE USEFIRST ARG954 :
    MATCH "res = res_return() == 0" -> GOTO ARG955;
    TRUE -> STOP;

STATE USEFIRST ARG955 :
    MATCH "" -> GOTO ARG956;
    TRUE -> STOP;

STATE USEFIRST ARG956 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (53);} GOTO ARG957;
    TRUE -> STOP;

STATE USEFIRST ARG957 :
    MATCH "flag++ < 100" -> ASSUME {flag == (54);} GOTO ARG958;
    TRUE -> STOP;

STATE USEFIRST ARG958 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (53);} GOTO ARG959;
    TRUE -> STOP;

STATE USEFIRST ARG959 :
    MATCH "return 5;" -> GOTO ARG960;
    TRUE -> STOP;

STATE USEFIRST ARG960 :
    MATCH "" -> GOTO ARG961;
    TRUE -> STOP;

STATE USEFIRST ARG961 :
    MATCH "res = res_return() == 0" -> ASSUME {res == (0);} GOTO ARG962;
    TRUE -> STOP;

STATE USEFIRST ARG962 :
    MATCH "[!(res = res_return() == 0)]" -> ASSUME {res == (0);} GOTO ARG963;
    TRUE -> STOP;

STATE USEFIRST ARG963 :
    MATCH "break;" -> GOTO ARG964;
    TRUE -> STOP;

STATE USEFIRST ARG964 :
    MATCH "" -> GOTO ARG965;
    TRUE -> STOP;

STATE USEFIRST ARG965 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG966;
    TRUE -> STOP;

STATE USEFIRST ARG966 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG967;
    TRUE -> STOP;

STATE USEFIRST ARG967 :
    MATCH "switch (id)" -> GOTO ARG968;
    TRUE -> STOP;

STATE USEFIRST ARG968 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG969;
    TRUE -> STOP;

STATE USEFIRST ARG969 :
    MATCH "res = res_return() < 0" -> GOTO ARG970;
    TRUE -> STOP;

STATE USEFIRST ARG970 :
    MATCH "res = res_return() < 0" -> GOTO ARG971;
    TRUE -> STOP;

STATE USEFIRST ARG971 :
    MATCH "" -> GOTO ARG972;
    TRUE -> STOP;

STATE USEFIRST ARG972 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (54);} GOTO ARG973;
    TRUE -> STOP;

STATE USEFIRST ARG973 :
    MATCH "flag++ < 100" -> ASSUME {flag == (55);} GOTO ARG974;
    TRUE -> STOP;

STATE USEFIRST ARG974 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (54);} GOTO ARG975;
    TRUE -> STOP;

STATE USEFIRST ARG975 :
    MATCH "return 5;" -> GOTO ARG976;
    TRUE -> STOP;

STATE USEFIRST ARG976 :
    MATCH "" -> GOTO ARG977;
    TRUE -> STOP;

STATE USEFIRST ARG977 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (0);} GOTO ARG978;
    TRUE -> STOP;

STATE USEFIRST ARG978 :
    MATCH "[!(res = res_return() < 0)]" -> ASSUME {res == (0);} GOTO ARG979;
    TRUE -> STOP;

STATE USEFIRST ARG979 :
    MATCH "res = res_return() == 0" -> GOTO ARG980;
    TRUE -> STOP;

STATE USEFIRST ARG980 :
    MATCH "res = res_return() == 0" -> GOTO ARG981;
    TRUE -> STOP;

STATE USEFIRST ARG981 :
    MATCH "" -> GOTO ARG982;
    TRUE -> STOP;

STATE USEFIRST ARG982 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (55);} GOTO ARG983;
    TRUE -> STOP;

STATE USEFIRST ARG983 :
    MATCH "flag++ < 100" -> ASSUME {flag == (56);} GOTO ARG984;
    TRUE -> STOP;

STATE USEFIRST ARG984 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (55);} GOTO ARG985;
    TRUE -> STOP;

STATE USEFIRST ARG985 :
    MATCH "return 5;" -> GOTO ARG986;
    TRUE -> STOP;

STATE USEFIRST ARG986 :
    MATCH "" -> GOTO ARG987;
    TRUE -> STOP;

STATE USEFIRST ARG987 :
    MATCH "res = res_return() == 0" -> ASSUME {res == (0);} GOTO ARG988;
    TRUE -> STOP;

STATE USEFIRST ARG988 :
    MATCH "[!(res = res_return() == 0)]" -> ASSUME {res == (0);} GOTO ARG989;
    TRUE -> STOP;

STATE USEFIRST ARG989 :
    MATCH "break;" -> GOTO ARG990;
    TRUE -> STOP;

STATE USEFIRST ARG990 :
    MATCH "" -> GOTO ARG991;
    TRUE -> STOP;

STATE USEFIRST ARG991 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG992;
    TRUE -> STOP;

STATE USEFIRST ARG992 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG993;
    TRUE -> STOP;

STATE USEFIRST ARG993 :
    MATCH "switch (id)" -> GOTO ARG994;
    TRUE -> STOP;

STATE USEFIRST ARG994 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG995;
    TRUE -> STOP;

STATE USEFIRST ARG995 :
    MATCH "res = res_return() < 0" -> GOTO ARG996;
    TRUE -> STOP;

STATE USEFIRST ARG996 :
    MATCH "res = res_return() < 0" -> GOTO ARG997;
    TRUE -> STOP;

STATE USEFIRST ARG997 :
    MATCH "" -> GOTO ARG998;
    TRUE -> STOP;

STATE USEFIRST ARG998 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (56);} GOTO ARG999;
    TRUE -> STOP;

STATE USEFIRST ARG999 :
    MATCH "flag++ < 100" -> ASSUME {flag == (57);} GOTO ARG1000;
    TRUE -> STOP;

STATE USEFIRST ARG1000 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (56);} GOTO ARG1001;
    TRUE -> STOP;

STATE USEFIRST ARG1001 :
    MATCH "return 5;" -> GOTO ARG1002;
    TRUE -> STOP;

STATE USEFIRST ARG1002 :
    MATCH "" -> GOTO ARG1003;
    TRUE -> STOP;

STATE USEFIRST ARG1003 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (0);} GOTO ARG1004;
    TRUE -> STOP;

STATE USEFIRST ARG1004 :
    MATCH "[!(res = res_return() < 0)]" -> ASSUME {res == (0);} GOTO ARG1005;
    TRUE -> STOP;

STATE USEFIRST ARG1005 :
    MATCH "res = res_return() == 0" -> GOTO ARG1006;
    TRUE -> STOP;

STATE USEFIRST ARG1006 :
    MATCH "res = res_return() == 0" -> GOTO ARG1007;
    TRUE -> STOP;

STATE USEFIRST ARG1007 :
    MATCH "" -> GOTO ARG1008;
    TRUE -> STOP;

STATE USEFIRST ARG1008 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (57);} GOTO ARG1009;
    TRUE -> STOP;

STATE USEFIRST ARG1009 :
    MATCH "flag++ < 100" -> ASSUME {flag == (58);} GOTO ARG1010;
    TRUE -> STOP;

STATE USEFIRST ARG1010 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (57);} GOTO ARG1011;
    TRUE -> STOP;

STATE USEFIRST ARG1011 :
    MATCH "return 5;" -> GOTO ARG1012;
    TRUE -> STOP;

STATE USEFIRST ARG1012 :
    MATCH "" -> GOTO ARG1013;
    TRUE -> STOP;

STATE USEFIRST ARG1013 :
    MATCH "res = res_return() == 0" -> ASSUME {res == (0);} GOTO ARG1014;
    TRUE -> STOP;

STATE USEFIRST ARG1014 :
    MATCH "[!(res = res_return() == 0)]" -> ASSUME {res == (0);} GOTO ARG1015;
    TRUE -> STOP;

STATE USEFIRST ARG1015 :
    MATCH "break;" -> GOTO ARG1016;
    TRUE -> STOP;

STATE USEFIRST ARG1016 :
    MATCH "" -> GOTO ARG1017;
    TRUE -> STOP;

STATE USEFIRST ARG1017 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG1018;
    TRUE -> STOP;

STATE USEFIRST ARG1018 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG1019;
    TRUE -> STOP;

STATE USEFIRST ARG1019 :
    MATCH "switch (id)" -> GOTO ARG1020;
    TRUE -> STOP;

STATE USEFIRST ARG1020 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG1021;
    TRUE -> STOP;

STATE USEFIRST ARG1021 :
    MATCH "res = res_return() < 0" -> GOTO ARG1022;
    TRUE -> STOP;

STATE USEFIRST ARG1022 :
    MATCH "res = res_return() < 0" -> GOTO ARG1023;
    TRUE -> STOP;

STATE USEFIRST ARG1023 :
    MATCH "" -> GOTO ARG1024;
    TRUE -> STOP;

STATE USEFIRST ARG1024 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (58);} GOTO ARG1025;
    TRUE -> STOP;

STATE USEFIRST ARG1025 :
    MATCH "flag++ < 100" -> ASSUME {flag == (59);} GOTO ARG1026;
    TRUE -> STOP;

STATE USEFIRST ARG1026 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (58);} GOTO ARG1027;
    TRUE -> STOP;

STATE USEFIRST ARG1027 :
    MATCH "return 5;" -> GOTO ARG1028;
    TRUE -> STOP;

STATE USEFIRST ARG1028 :
    MATCH "" -> GOTO ARG1029;
    TRUE -> STOP;

STATE USEFIRST ARG1029 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (0);} GOTO ARG1030;
    TRUE -> STOP;

STATE USEFIRST ARG1030 :
    MATCH "[!(res = res_return() < 0)]" -> ASSUME {res == (0);} GOTO ARG1031;
    TRUE -> STOP;

STATE USEFIRST ARG1031 :
    MATCH "res = res_return() == 0" -> GOTO ARG1032;
    TRUE -> STOP;

STATE USEFIRST ARG1032 :
    MATCH "res = res_return() == 0" -> GOTO ARG1033;
    TRUE -> STOP;

STATE USEFIRST ARG1033 :
    MATCH "" -> GOTO ARG1034;
    TRUE -> STOP;

STATE USEFIRST ARG1034 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (59);} GOTO ARG1035;
    TRUE -> STOP;

STATE USEFIRST ARG1035 :
    MATCH "flag++ < 100" -> ASSUME {flag == (60);} GOTO ARG1036;
    TRUE -> STOP;

STATE USEFIRST ARG1036 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (59);} GOTO ARG1037;
    TRUE -> STOP;

STATE USEFIRST ARG1037 :
    MATCH "return 5;" -> GOTO ARG1038;
    TRUE -> STOP;

STATE USEFIRST ARG1038 :
    MATCH "" -> GOTO ARG1039;
    TRUE -> STOP;

STATE USEFIRST ARG1039 :
    MATCH "res = res_return() == 0" -> ASSUME {res == (0);} GOTO ARG1040;
    TRUE -> STOP;

STATE USEFIRST ARG1040 :
    MATCH "[!(res = res_return() == 0)]" -> ASSUME {res == (0);} GOTO ARG1041;
    TRUE -> STOP;

STATE USEFIRST ARG1041 :
    MATCH "break;" -> GOTO ARG1042;
    TRUE -> STOP;

STATE USEFIRST ARG1042 :
    MATCH "" -> GOTO ARG1043;
    TRUE -> STOP;

STATE USEFIRST ARG1043 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG1044;
    TRUE -> STOP;

STATE USEFIRST ARG1044 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG1045;
    TRUE -> STOP;

STATE USEFIRST ARG1045 :
    MATCH "switch (id)" -> GOTO ARG1046;
    TRUE -> STOP;

STATE USEFIRST ARG1046 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG1047;
    TRUE -> STOP;

STATE USEFIRST ARG1047 :
    MATCH "res = res_return() < 0" -> GOTO ARG1048;
    TRUE -> STOP;

STATE USEFIRST ARG1048 :
    MATCH "res = res_return() < 0" -> GOTO ARG1049;
    TRUE -> STOP;

STATE USEFIRST ARG1049 :
    MATCH "" -> GOTO ARG1050;
    TRUE -> STOP;

STATE USEFIRST ARG1050 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (60);} GOTO ARG1051;
    TRUE -> STOP;

STATE USEFIRST ARG1051 :
    MATCH "flag++ < 100" -> ASSUME {flag == (61);} GOTO ARG1052;
    TRUE -> STOP;

STATE USEFIRST ARG1052 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (60);} GOTO ARG1053;
    TRUE -> STOP;

STATE USEFIRST ARG1053 :
    MATCH "return 5;" -> GOTO ARG1054;
    TRUE -> STOP;

STATE USEFIRST ARG1054 :
    MATCH "" -> GOTO ARG1055;
    TRUE -> STOP;

STATE USEFIRST ARG1055 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (0);} GOTO ARG1056;
    TRUE -> STOP;

STATE USEFIRST ARG1056 :
    MATCH "[!(res = res_return() < 0)]" -> ASSUME {res == (0);} GOTO ARG1057;
    TRUE -> STOP;

STATE USEFIRST ARG1057 :
    MATCH "res = res_return() == 0" -> GOTO ARG1058;
    TRUE -> STOP;

STATE USEFIRST ARG1058 :
    MATCH "res = res_return() == 0" -> GOTO ARG1059;
    TRUE -> STOP;

STATE USEFIRST ARG1059 :
    MATCH "" -> GOTO ARG1060;
    TRUE -> STOP;

STATE USEFIRST ARG1060 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (61);} GOTO ARG1061;
    TRUE -> STOP;

STATE USEFIRST ARG1061 :
    MATCH "flag++ < 100" -> ASSUME {flag == (62);} GOTO ARG1062;
    TRUE -> STOP;

STATE USEFIRST ARG1062 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (61);} GOTO ARG1063;
    TRUE -> STOP;

STATE USEFIRST ARG1063 :
    MATCH "return 5;" -> GOTO ARG1064;
    TRUE -> STOP;

STATE USEFIRST ARG1064 :
    MATCH "" -> GOTO ARG1065;
    TRUE -> STOP;

STATE USEFIRST ARG1065 :
    MATCH "res = res_return() == 0" -> ASSUME {res == (0);} GOTO ARG1066;
    TRUE -> STOP;

STATE USEFIRST ARG1066 :
    MATCH "[!(res = res_return() == 0)]" -> ASSUME {res == (0);} GOTO ARG1067;
    TRUE -> STOP;

STATE USEFIRST ARG1067 :
    MATCH "break;" -> GOTO ARG1068;
    TRUE -> STOP;

STATE USEFIRST ARG1068 :
    MATCH "" -> GOTO ARG1069;
    TRUE -> STOP;

STATE USEFIRST ARG1069 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG1070;
    TRUE -> STOP;

STATE USEFIRST ARG1070 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG1071;
    TRUE -> STOP;

STATE USEFIRST ARG1071 :
    MATCH "switch (id)" -> GOTO ARG1072;
    TRUE -> STOP;

STATE USEFIRST ARG1072 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG1073;
    TRUE -> STOP;

STATE USEFIRST ARG1073 :
    MATCH "res = res_return() < 0" -> GOTO ARG1074;
    TRUE -> STOP;

STATE USEFIRST ARG1074 :
    MATCH "res = res_return() < 0" -> GOTO ARG1075;
    TRUE -> STOP;

STATE USEFIRST ARG1075 :
    MATCH "" -> GOTO ARG1076;
    TRUE -> STOP;

STATE USEFIRST ARG1076 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (62);} GOTO ARG1077;
    TRUE -> STOP;

STATE USEFIRST ARG1077 :
    MATCH "flag++ < 100" -> ASSUME {flag == (63);} GOTO ARG1078;
    TRUE -> STOP;

STATE USEFIRST ARG1078 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (62);} GOTO ARG1079;
    TRUE -> STOP;

STATE USEFIRST ARG1079 :
    MATCH "return 5;" -> GOTO ARG1080;
    TRUE -> STOP;

STATE USEFIRST ARG1080 :
    MATCH "" -> GOTO ARG1081;
    TRUE -> STOP;

STATE USEFIRST ARG1081 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (0);} GOTO ARG1082;
    TRUE -> STOP;

STATE USEFIRST ARG1082 :
    MATCH "[!(res = res_return() < 0)]" -> ASSUME {res == (0);} GOTO ARG1083;
    TRUE -> STOP;

STATE USEFIRST ARG1083 :
    MATCH "res = res_return() == 0" -> GOTO ARG1084;
    TRUE -> STOP;

STATE USEFIRST ARG1084 :
    MATCH "res = res_return() == 0" -> GOTO ARG1085;
    TRUE -> STOP;

STATE USEFIRST ARG1085 :
    MATCH "" -> GOTO ARG1086;
    TRUE -> STOP;

STATE USEFIRST ARG1086 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (63);} GOTO ARG1087;
    TRUE -> STOP;

STATE USEFIRST ARG1087 :
    MATCH "flag++ < 100" -> ASSUME {flag == (64);} GOTO ARG1088;
    TRUE -> STOP;

STATE USEFIRST ARG1088 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (63);} GOTO ARG1089;
    TRUE -> STOP;

STATE USEFIRST ARG1089 :
    MATCH "return 5;" -> GOTO ARG1090;
    TRUE -> STOP;

STATE USEFIRST ARG1090 :
    MATCH "" -> GOTO ARG1091;
    TRUE -> STOP;

STATE USEFIRST ARG1091 :
    MATCH "res = res_return() == 0" -> ASSUME {res == (0);} GOTO ARG1092;
    TRUE -> STOP;

STATE USEFIRST ARG1092 :
    MATCH "[!(res = res_return() == 0)]" -> ASSUME {res == (0);} GOTO ARG1093;
    TRUE -> STOP;

STATE USEFIRST ARG1093 :
    MATCH "break;" -> GOTO ARG1094;
    TRUE -> STOP;

STATE USEFIRST ARG1094 :
    MATCH "" -> GOTO ARG1095;
    TRUE -> STOP;

STATE USEFIRST ARG1095 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG1096;
    TRUE -> STOP;

STATE USEFIRST ARG1096 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG1097;
    TRUE -> STOP;

STATE USEFIRST ARG1097 :
    MATCH "switch (id)" -> GOTO ARG1098;
    TRUE -> STOP;

STATE USEFIRST ARG1098 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG1099;
    TRUE -> STOP;

STATE USEFIRST ARG1099 :
    MATCH "res = res_return() < 0" -> GOTO ARG1100;
    TRUE -> STOP;

STATE USEFIRST ARG1100 :
    MATCH "res = res_return() < 0" -> GOTO ARG1101;
    TRUE -> STOP;

STATE USEFIRST ARG1101 :
    MATCH "" -> GOTO ARG1102;
    TRUE -> STOP;

STATE USEFIRST ARG1102 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (64);} GOTO ARG1103;
    TRUE -> STOP;

STATE USEFIRST ARG1103 :
    MATCH "flag++ < 100" -> ASSUME {flag == (65);} GOTO ARG1104;
    TRUE -> STOP;

STATE USEFIRST ARG1104 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (64);} GOTO ARG1105;
    TRUE -> STOP;

STATE USEFIRST ARG1105 :
    MATCH "return 5;" -> GOTO ARG1106;
    TRUE -> STOP;

STATE USEFIRST ARG1106 :
    MATCH "" -> GOTO ARG1107;
    TRUE -> STOP;

STATE USEFIRST ARG1107 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (0);} GOTO ARG1108;
    TRUE -> STOP;

STATE USEFIRST ARG1108 :
    MATCH "[!(res = res_return() < 0)]" -> ASSUME {res == (0);} GOTO ARG1109;
    TRUE -> STOP;

STATE USEFIRST ARG1109 :
    MATCH "res = res_return() == 0" -> GOTO ARG1110;
    TRUE -> STOP;

STATE USEFIRST ARG1110 :
    MATCH "res = res_return() == 0" -> GOTO ARG1111;
    TRUE -> STOP;

STATE USEFIRST ARG1111 :
    MATCH "" -> GOTO ARG1112;
    TRUE -> STOP;

STATE USEFIRST ARG1112 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (65);} GOTO ARG1113;
    TRUE -> STOP;

STATE USEFIRST ARG1113 :
    MATCH "flag++ < 100" -> ASSUME {flag == (66);} GOTO ARG1114;
    TRUE -> STOP;

STATE USEFIRST ARG1114 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (65);} GOTO ARG1115;
    TRUE -> STOP;

STATE USEFIRST ARG1115 :
    MATCH "return 5;" -> GOTO ARG1116;
    TRUE -> STOP;

STATE USEFIRST ARG1116 :
    MATCH "" -> GOTO ARG1117;
    TRUE -> STOP;

STATE USEFIRST ARG1117 :
    MATCH "res = res_return() == 0" -> ASSUME {res == (0);} GOTO ARG1118;
    TRUE -> STOP;

STATE USEFIRST ARG1118 :
    MATCH "[!(res = res_return() == 0)]" -> ASSUME {res == (0);} GOTO ARG1119;
    TRUE -> STOP;

STATE USEFIRST ARG1119 :
    MATCH "break;" -> GOTO ARG1120;
    TRUE -> STOP;

STATE USEFIRST ARG1120 :
    MATCH "" -> GOTO ARG1121;
    TRUE -> STOP;

STATE USEFIRST ARG1121 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG1122;
    TRUE -> STOP;

STATE USEFIRST ARG1122 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG1123;
    TRUE -> STOP;

STATE USEFIRST ARG1123 :
    MATCH "switch (id)" -> GOTO ARG1124;
    TRUE -> STOP;

STATE USEFIRST ARG1124 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG1125;
    TRUE -> STOP;

STATE USEFIRST ARG1125 :
    MATCH "res = res_return() < 0" -> GOTO ARG1126;
    TRUE -> STOP;

STATE USEFIRST ARG1126 :
    MATCH "res = res_return() < 0" -> GOTO ARG1127;
    TRUE -> STOP;

STATE USEFIRST ARG1127 :
    MATCH "" -> GOTO ARG1128;
    TRUE -> STOP;

STATE USEFIRST ARG1128 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (66);} GOTO ARG1129;
    TRUE -> STOP;

STATE USEFIRST ARG1129 :
    MATCH "flag++ < 100" -> ASSUME {flag == (67);} GOTO ARG1130;
    TRUE -> STOP;

STATE USEFIRST ARG1130 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (66);} GOTO ARG1131;
    TRUE -> STOP;

STATE USEFIRST ARG1131 :
    MATCH "return 5;" -> GOTO ARG1132;
    TRUE -> STOP;

STATE USEFIRST ARG1132 :
    MATCH "" -> GOTO ARG1133;
    TRUE -> STOP;

STATE USEFIRST ARG1133 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (0);} GOTO ARG1134;
    TRUE -> STOP;

STATE USEFIRST ARG1134 :
    MATCH "[!(res = res_return() < 0)]" -> ASSUME {res == (0);} GOTO ARG1135;
    TRUE -> STOP;

STATE USEFIRST ARG1135 :
    MATCH "res = res_return() == 0" -> GOTO ARG1136;
    TRUE -> STOP;

STATE USEFIRST ARG1136 :
    MATCH "res = res_return() == 0" -> GOTO ARG1137;
    TRUE -> STOP;

STATE USEFIRST ARG1137 :
    MATCH "" -> GOTO ARG1138;
    TRUE -> STOP;

STATE USEFIRST ARG1138 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (67);} GOTO ARG1139;
    TRUE -> STOP;

STATE USEFIRST ARG1139 :
    MATCH "flag++ < 100" -> ASSUME {flag == (68);} GOTO ARG1140;
    TRUE -> STOP;

STATE USEFIRST ARG1140 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (67);} GOTO ARG1141;
    TRUE -> STOP;

STATE USEFIRST ARG1141 :
    MATCH "return 5;" -> GOTO ARG1142;
    TRUE -> STOP;

STATE USEFIRST ARG1142 :
    MATCH "" -> GOTO ARG1143;
    TRUE -> STOP;

STATE USEFIRST ARG1143 :
    MATCH "res = res_return() == 0" -> ASSUME {res == (0);} GOTO ARG1144;
    TRUE -> STOP;

STATE USEFIRST ARG1144 :
    MATCH "[!(res = res_return() == 0)]" -> ASSUME {res == (0);} GOTO ARG1145;
    TRUE -> STOP;

STATE USEFIRST ARG1145 :
    MATCH "break;" -> GOTO ARG1146;
    TRUE -> STOP;

STATE USEFIRST ARG1146 :
    MATCH "" -> GOTO ARG1147;
    TRUE -> STOP;

STATE USEFIRST ARG1147 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG1148;
    TRUE -> STOP;

STATE USEFIRST ARG1148 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG1149;
    TRUE -> STOP;

STATE USEFIRST ARG1149 :
    MATCH "switch (id)" -> GOTO ARG1150;
    TRUE -> STOP;

STATE USEFIRST ARG1150 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG1151;
    TRUE -> STOP;

STATE USEFIRST ARG1151 :
    MATCH "res = res_return() < 0" -> GOTO ARG1152;
    TRUE -> STOP;

STATE USEFIRST ARG1152 :
    MATCH "res = res_return() < 0" -> GOTO ARG1153;
    TRUE -> STOP;

STATE USEFIRST ARG1153 :
    MATCH "" -> GOTO ARG1154;
    TRUE -> STOP;

STATE USEFIRST ARG1154 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (68);} GOTO ARG1155;
    TRUE -> STOP;

STATE USEFIRST ARG1155 :
    MATCH "flag++ < 100" -> ASSUME {flag == (69);} GOTO ARG1156;
    TRUE -> STOP;

STATE USEFIRST ARG1156 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (68);} GOTO ARG1157;
    TRUE -> STOP;

STATE USEFIRST ARG1157 :
    MATCH "return 5;" -> GOTO ARG1158;
    TRUE -> STOP;

STATE USEFIRST ARG1158 :
    MATCH "" -> GOTO ARG1159;
    TRUE -> STOP;

STATE USEFIRST ARG1159 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (0);} GOTO ARG1160;
    TRUE -> STOP;

STATE USEFIRST ARG1160 :
    MATCH "[!(res = res_return() < 0)]" -> ASSUME {res == (0);} GOTO ARG1161;
    TRUE -> STOP;

STATE USEFIRST ARG1161 :
    MATCH "res = res_return() == 0" -> GOTO ARG1162;
    TRUE -> STOP;

STATE USEFIRST ARG1162 :
    MATCH "res = res_return() == 0" -> GOTO ARG1163;
    TRUE -> STOP;

STATE USEFIRST ARG1163 :
    MATCH "" -> GOTO ARG1164;
    TRUE -> STOP;

STATE USEFIRST ARG1164 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (69);} GOTO ARG1165;
    TRUE -> STOP;

STATE USEFIRST ARG1165 :
    MATCH "flag++ < 100" -> ASSUME {flag == (70);} GOTO ARG1166;
    TRUE -> STOP;

STATE USEFIRST ARG1166 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (69);} GOTO ARG1167;
    TRUE -> STOP;

STATE USEFIRST ARG1167 :
    MATCH "return 5;" -> GOTO ARG1168;
    TRUE -> STOP;

STATE USEFIRST ARG1168 :
    MATCH "" -> GOTO ARG1169;
    TRUE -> STOP;

STATE USEFIRST ARG1169 :
    MATCH "res = res_return() == 0" -> ASSUME {res == (0);} GOTO ARG1170;
    TRUE -> STOP;

STATE USEFIRST ARG1170 :
    MATCH "[!(res = res_return() == 0)]" -> ASSUME {res == (0);} GOTO ARG1171;
    TRUE -> STOP;

STATE USEFIRST ARG1171 :
    MATCH "break;" -> GOTO ARG1172;
    TRUE -> STOP;

STATE USEFIRST ARG1172 :
    MATCH "" -> GOTO ARG1173;
    TRUE -> STOP;

STATE USEFIRST ARG1173 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG1174;
    TRUE -> STOP;

STATE USEFIRST ARG1174 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG1175;
    TRUE -> STOP;

STATE USEFIRST ARG1175 :
    MATCH "switch (id)" -> GOTO ARG1176;
    TRUE -> STOP;

STATE USEFIRST ARG1176 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG1177;
    TRUE -> STOP;

STATE USEFIRST ARG1177 :
    MATCH "res = res_return() < 0" -> GOTO ARG1178;
    TRUE -> STOP;

STATE USEFIRST ARG1178 :
    MATCH "res = res_return() < 0" -> GOTO ARG1179;
    TRUE -> STOP;

STATE USEFIRST ARG1179 :
    MATCH "" -> GOTO ARG1180;
    TRUE -> STOP;

STATE USEFIRST ARG1180 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (70);} GOTO ARG1181;
    TRUE -> STOP;

STATE USEFIRST ARG1181 :
    MATCH "flag++ < 100" -> ASSUME {flag == (71);} GOTO ARG1182;
    TRUE -> STOP;

STATE USEFIRST ARG1182 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (70);} GOTO ARG1183;
    TRUE -> STOP;

STATE USEFIRST ARG1183 :
    MATCH "return 5;" -> GOTO ARG1184;
    TRUE -> STOP;

STATE USEFIRST ARG1184 :
    MATCH "" -> GOTO ARG1185;
    TRUE -> STOP;

STATE USEFIRST ARG1185 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (0);} GOTO ARG1186;
    TRUE -> STOP;

STATE USEFIRST ARG1186 :
    MATCH "[!(res = res_return() < 0)]" -> ASSUME {res == (0);} GOTO ARG1187;
    TRUE -> STOP;

STATE USEFIRST ARG1187 :
    MATCH "res = res_return() == 0" -> GOTO ARG1188;
    TRUE -> STOP;

STATE USEFIRST ARG1188 :
    MATCH "res = res_return() == 0" -> GOTO ARG1189;
    TRUE -> STOP;

STATE USEFIRST ARG1189 :
    MATCH "" -> GOTO ARG1190;
    TRUE -> STOP;

STATE USEFIRST ARG1190 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (71);} GOTO ARG1191;
    TRUE -> STOP;

STATE USEFIRST ARG1191 :
    MATCH "flag++ < 100" -> ASSUME {flag == (72);} GOTO ARG1192;
    TRUE -> STOP;

STATE USEFIRST ARG1192 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (71);} GOTO ARG1193;
    TRUE -> STOP;

STATE USEFIRST ARG1193 :
    MATCH "return 5;" -> GOTO ARG1194;
    TRUE -> STOP;

STATE USEFIRST ARG1194 :
    MATCH "" -> GOTO ARG1195;
    TRUE -> STOP;

STATE USEFIRST ARG1195 :
    MATCH "res = res_return() == 0" -> ASSUME {res == (0);} GOTO ARG1196;
    TRUE -> STOP;

STATE USEFIRST ARG1196 :
    MATCH "[!(res = res_return() == 0)]" -> ASSUME {res == (0);} GOTO ARG1197;
    TRUE -> STOP;

STATE USEFIRST ARG1197 :
    MATCH "break;" -> GOTO ARG1198;
    TRUE -> STOP;

STATE USEFIRST ARG1198 :
    MATCH "" -> GOTO ARG1199;
    TRUE -> STOP;

STATE USEFIRST ARG1199 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG1200;
    TRUE -> STOP;

STATE USEFIRST ARG1200 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG1201;
    TRUE -> STOP;

STATE USEFIRST ARG1201 :
    MATCH "switch (id)" -> GOTO ARG1202;
    TRUE -> STOP;

STATE USEFIRST ARG1202 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG1203;
    TRUE -> STOP;

STATE USEFIRST ARG1203 :
    MATCH "res = res_return() < 0" -> GOTO ARG1204;
    TRUE -> STOP;

STATE USEFIRST ARG1204 :
    MATCH "res = res_return() < 0" -> GOTO ARG1205;
    TRUE -> STOP;

STATE USEFIRST ARG1205 :
    MATCH "" -> GOTO ARG1206;
    TRUE -> STOP;

STATE USEFIRST ARG1206 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (72);} GOTO ARG1207;
    TRUE -> STOP;

STATE USEFIRST ARG1207 :
    MATCH "flag++ < 100" -> ASSUME {flag == (73);} GOTO ARG1208;
    TRUE -> STOP;

STATE USEFIRST ARG1208 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (72);} GOTO ARG1209;
    TRUE -> STOP;

STATE USEFIRST ARG1209 :
    MATCH "return 5;" -> GOTO ARG1210;
    TRUE -> STOP;

STATE USEFIRST ARG1210 :
    MATCH "" -> GOTO ARG1211;
    TRUE -> STOP;

STATE USEFIRST ARG1211 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (0);} GOTO ARG1212;
    TRUE -> STOP;

STATE USEFIRST ARG1212 :
    MATCH "[!(res = res_return() < 0)]" -> ASSUME {res == (0);} GOTO ARG1213;
    TRUE -> STOP;

STATE USEFIRST ARG1213 :
    MATCH "res = res_return() == 0" -> GOTO ARG1214;
    TRUE -> STOP;

STATE USEFIRST ARG1214 :
    MATCH "res = res_return() == 0" -> GOTO ARG1215;
    TRUE -> STOP;

STATE USEFIRST ARG1215 :
    MATCH "" -> GOTO ARG1216;
    TRUE -> STOP;

STATE USEFIRST ARG1216 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (73);} GOTO ARG1217;
    TRUE -> STOP;

STATE USEFIRST ARG1217 :
    MATCH "flag++ < 100" -> ASSUME {flag == (74);} GOTO ARG1218;
    TRUE -> STOP;

STATE USEFIRST ARG1218 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (73);} GOTO ARG1219;
    TRUE -> STOP;

STATE USEFIRST ARG1219 :
    MATCH "return 5;" -> GOTO ARG1220;
    TRUE -> STOP;

STATE USEFIRST ARG1220 :
    MATCH "" -> GOTO ARG1221;
    TRUE -> STOP;

STATE USEFIRST ARG1221 :
    MATCH "res = res_return() == 0" -> ASSUME {res == (0);} GOTO ARG1222;
    TRUE -> STOP;

STATE USEFIRST ARG1222 :
    MATCH "[!(res = res_return() == 0)]" -> ASSUME {res == (0);} GOTO ARG1223;
    TRUE -> STOP;

STATE USEFIRST ARG1223 :
    MATCH "break;" -> GOTO ARG1224;
    TRUE -> STOP;

STATE USEFIRST ARG1224 :
    MATCH "" -> GOTO ARG1225;
    TRUE -> STOP;

STATE USEFIRST ARG1225 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG1226;
    TRUE -> STOP;

STATE USEFIRST ARG1226 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG1227;
    TRUE -> STOP;

STATE USEFIRST ARG1227 :
    MATCH "switch (id)" -> GOTO ARG1228;
    TRUE -> STOP;

STATE USEFIRST ARG1228 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG1229;
    TRUE -> STOP;

STATE USEFIRST ARG1229 :
    MATCH "res = res_return() < 0" -> GOTO ARG1230;
    TRUE -> STOP;

STATE USEFIRST ARG1230 :
    MATCH "res = res_return() < 0" -> GOTO ARG1231;
    TRUE -> STOP;

STATE USEFIRST ARG1231 :
    MATCH "" -> GOTO ARG1232;
    TRUE -> STOP;

STATE USEFIRST ARG1232 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (74);} GOTO ARG1233;
    TRUE -> STOP;

STATE USEFIRST ARG1233 :
    MATCH "flag++ < 100" -> ASSUME {flag == (75);} GOTO ARG1234;
    TRUE -> STOP;

STATE USEFIRST ARG1234 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (74);} GOTO ARG1235;
    TRUE -> STOP;

STATE USEFIRST ARG1235 :
    MATCH "return 5;" -> GOTO ARG1236;
    TRUE -> STOP;

STATE USEFIRST ARG1236 :
    MATCH "" -> GOTO ARG1237;
    TRUE -> STOP;

STATE USEFIRST ARG1237 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (0);} GOTO ARG1238;
    TRUE -> STOP;

STATE USEFIRST ARG1238 :
    MATCH "[!(res = res_return() < 0)]" -> ASSUME {res == (0);} GOTO ARG1239;
    TRUE -> STOP;

STATE USEFIRST ARG1239 :
    MATCH "res = res_return() == 0" -> GOTO ARG1240;
    TRUE -> STOP;

STATE USEFIRST ARG1240 :
    MATCH "res = res_return() == 0" -> GOTO ARG1241;
    TRUE -> STOP;

STATE USEFIRST ARG1241 :
    MATCH "" -> GOTO ARG1242;
    TRUE -> STOP;

STATE USEFIRST ARG1242 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (75);} GOTO ARG1243;
    TRUE -> STOP;

STATE USEFIRST ARG1243 :
    MATCH "flag++ < 100" -> ASSUME {flag == (76);} GOTO ARG1244;
    TRUE -> STOP;

STATE USEFIRST ARG1244 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (75);} GOTO ARG1245;
    TRUE -> STOP;

STATE USEFIRST ARG1245 :
    MATCH "return 5;" -> GOTO ARG1246;
    TRUE -> STOP;

STATE USEFIRST ARG1246 :
    MATCH "" -> GOTO ARG1247;
    TRUE -> STOP;

STATE USEFIRST ARG1247 :
    MATCH "res = res_return() == 0" -> ASSUME {res == (0);} GOTO ARG1248;
    TRUE -> STOP;

STATE USEFIRST ARG1248 :
    MATCH "[!(res = res_return() == 0)]" -> ASSUME {res == (0);} GOTO ARG1249;
    TRUE -> STOP;

STATE USEFIRST ARG1249 :
    MATCH "break;" -> GOTO ARG1250;
    TRUE -> STOP;

STATE USEFIRST ARG1250 :
    MATCH "" -> GOTO ARG1251;
    TRUE -> STOP;

STATE USEFIRST ARG1251 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG1252;
    TRUE -> STOP;

STATE USEFIRST ARG1252 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG1253;
    TRUE -> STOP;

STATE USEFIRST ARG1253 :
    MATCH "switch (id)" -> GOTO ARG1254;
    TRUE -> STOP;

STATE USEFIRST ARG1254 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG1255;
    TRUE -> STOP;

STATE USEFIRST ARG1255 :
    MATCH "res = res_return() < 0" -> GOTO ARG1256;
    TRUE -> STOP;

STATE USEFIRST ARG1256 :
    MATCH "res = res_return() < 0" -> GOTO ARG1257;
    TRUE -> STOP;

STATE USEFIRST ARG1257 :
    MATCH "" -> GOTO ARG1258;
    TRUE -> STOP;

STATE USEFIRST ARG1258 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (76);} GOTO ARG1259;
    TRUE -> STOP;

STATE USEFIRST ARG1259 :
    MATCH "flag++ < 100" -> ASSUME {flag == (77);} GOTO ARG1260;
    TRUE -> STOP;

STATE USEFIRST ARG1260 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (76);} GOTO ARG1261;
    TRUE -> STOP;

STATE USEFIRST ARG1261 :
    MATCH "return 5;" -> GOTO ARG1262;
    TRUE -> STOP;

STATE USEFIRST ARG1262 :
    MATCH "" -> GOTO ARG1263;
    TRUE -> STOP;

STATE USEFIRST ARG1263 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (0);} GOTO ARG1264;
    TRUE -> STOP;

STATE USEFIRST ARG1264 :
    MATCH "[!(res = res_return() < 0)]" -> ASSUME {res == (0);} GOTO ARG1265;
    TRUE -> STOP;

STATE USEFIRST ARG1265 :
    MATCH "res = res_return() == 0" -> GOTO ARG1266;
    TRUE -> STOP;

STATE USEFIRST ARG1266 :
    MATCH "res = res_return() == 0" -> GOTO ARG1267;
    TRUE -> STOP;

STATE USEFIRST ARG1267 :
    MATCH "" -> GOTO ARG1268;
    TRUE -> STOP;

STATE USEFIRST ARG1268 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (77);} GOTO ARG1269;
    TRUE -> STOP;

STATE USEFIRST ARG1269 :
    MATCH "flag++ < 100" -> ASSUME {flag == (78);} GOTO ARG1270;
    TRUE -> STOP;

STATE USEFIRST ARG1270 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (77);} GOTO ARG1271;
    TRUE -> STOP;

STATE USEFIRST ARG1271 :
    MATCH "return 5;" -> GOTO ARG1272;
    TRUE -> STOP;

STATE USEFIRST ARG1272 :
    MATCH "" -> GOTO ARG1273;
    TRUE -> STOP;

STATE USEFIRST ARG1273 :
    MATCH "res = res_return() == 0" -> ASSUME {res == (0);} GOTO ARG1274;
    TRUE -> STOP;

STATE USEFIRST ARG1274 :
    MATCH "[!(res = res_return() == 0)]" -> ASSUME {res == (0);} GOTO ARG1275;
    TRUE -> STOP;

STATE USEFIRST ARG1275 :
    MATCH "break;" -> GOTO ARG1276;
    TRUE -> STOP;

STATE USEFIRST ARG1276 :
    MATCH "" -> GOTO ARG1277;
    TRUE -> STOP;

STATE USEFIRST ARG1277 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG1278;
    TRUE -> STOP;

STATE USEFIRST ARG1278 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG1279;
    TRUE -> STOP;

STATE USEFIRST ARG1279 :
    MATCH "switch (id)" -> GOTO ARG1280;
    TRUE -> STOP;

STATE USEFIRST ARG1280 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG1281;
    TRUE -> STOP;

STATE USEFIRST ARG1281 :
    MATCH "res = res_return() < 0" -> GOTO ARG1282;
    TRUE -> STOP;

STATE USEFIRST ARG1282 :
    MATCH "res = res_return() < 0" -> GOTO ARG1283;
    TRUE -> STOP;

STATE USEFIRST ARG1283 :
    MATCH "" -> GOTO ARG1284;
    TRUE -> STOP;

STATE USEFIRST ARG1284 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (78);} GOTO ARG1285;
    TRUE -> STOP;

STATE USEFIRST ARG1285 :
    MATCH "flag++ < 100" -> ASSUME {flag == (79);} GOTO ARG1286;
    TRUE -> STOP;

STATE USEFIRST ARG1286 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (78);} GOTO ARG1287;
    TRUE -> STOP;

STATE USEFIRST ARG1287 :
    MATCH "return 5;" -> GOTO ARG1288;
    TRUE -> STOP;

STATE USEFIRST ARG1288 :
    MATCH "" -> GOTO ARG1289;
    TRUE -> STOP;

STATE USEFIRST ARG1289 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (0);} GOTO ARG1290;
    TRUE -> STOP;

STATE USEFIRST ARG1290 :
    MATCH "[!(res = res_return() < 0)]" -> ASSUME {res == (0);} GOTO ARG1291;
    TRUE -> STOP;

STATE USEFIRST ARG1291 :
    MATCH "res = res_return() == 0" -> GOTO ARG1292;
    TRUE -> STOP;

STATE USEFIRST ARG1292 :
    MATCH "res = res_return() == 0" -> GOTO ARG1293;
    TRUE -> STOP;

STATE USEFIRST ARG1293 :
    MATCH "" -> GOTO ARG1294;
    TRUE -> STOP;

STATE USEFIRST ARG1294 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (79);} GOTO ARG1295;
    TRUE -> STOP;

STATE USEFIRST ARG1295 :
    MATCH "flag++ < 100" -> ASSUME {flag == (80);} GOTO ARG1296;
    TRUE -> STOP;

STATE USEFIRST ARG1296 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (79);} GOTO ARG1297;
    TRUE -> STOP;

STATE USEFIRST ARG1297 :
    MATCH "return 5;" -> GOTO ARG1298;
    TRUE -> STOP;

STATE USEFIRST ARG1298 :
    MATCH "" -> GOTO ARG1299;
    TRUE -> STOP;

STATE USEFIRST ARG1299 :
    MATCH "res = res_return() == 0" -> ASSUME {res == (0);} GOTO ARG1300;
    TRUE -> STOP;

STATE USEFIRST ARG1300 :
    MATCH "[!(res = res_return() == 0)]" -> ASSUME {res == (0);} GOTO ARG1301;
    TRUE -> STOP;

STATE USEFIRST ARG1301 :
    MATCH "break;" -> GOTO ARG1302;
    TRUE -> STOP;

STATE USEFIRST ARG1302 :
    MATCH "" -> GOTO ARG1303;
    TRUE -> STOP;

STATE USEFIRST ARG1303 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG1304;
    TRUE -> STOP;

STATE USEFIRST ARG1304 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG1305;
    TRUE -> STOP;

STATE USEFIRST ARG1305 :
    MATCH "switch (id)" -> GOTO ARG1306;
    TRUE -> STOP;

STATE USEFIRST ARG1306 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG1307;
    TRUE -> STOP;

STATE USEFIRST ARG1307 :
    MATCH "res = res_return() < 0" -> GOTO ARG1308;
    TRUE -> STOP;

STATE USEFIRST ARG1308 :
    MATCH "res = res_return() < 0" -> GOTO ARG1309;
    TRUE -> STOP;

STATE USEFIRST ARG1309 :
    MATCH "" -> GOTO ARG1310;
    TRUE -> STOP;

STATE USEFIRST ARG1310 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (80);} GOTO ARG1311;
    TRUE -> STOP;

STATE USEFIRST ARG1311 :
    MATCH "flag++ < 100" -> ASSUME {flag == (81);} GOTO ARG1312;
    TRUE -> STOP;

STATE USEFIRST ARG1312 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (80);} GOTO ARG1313;
    TRUE -> STOP;

STATE USEFIRST ARG1313 :
    MATCH "return 5;" -> GOTO ARG1314;
    TRUE -> STOP;

STATE USEFIRST ARG1314 :
    MATCH "" -> GOTO ARG1315;
    TRUE -> STOP;

STATE USEFIRST ARG1315 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (0);} GOTO ARG1316;
    TRUE -> STOP;

STATE USEFIRST ARG1316 :
    MATCH "[!(res = res_return() < 0)]" -> ASSUME {res == (0);} GOTO ARG1317;
    TRUE -> STOP;

STATE USEFIRST ARG1317 :
    MATCH "res = res_return() == 0" -> GOTO ARG1318;
    TRUE -> STOP;

STATE USEFIRST ARG1318 :
    MATCH "res = res_return() == 0" -> GOTO ARG1319;
    TRUE -> STOP;

STATE USEFIRST ARG1319 :
    MATCH "" -> GOTO ARG1320;
    TRUE -> STOP;

STATE USEFIRST ARG1320 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (81);} GOTO ARG1321;
    TRUE -> STOP;

STATE USEFIRST ARG1321 :
    MATCH "flag++ < 100" -> ASSUME {flag == (82);} GOTO ARG1322;
    TRUE -> STOP;

STATE USEFIRST ARG1322 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (81);} GOTO ARG1323;
    TRUE -> STOP;

STATE USEFIRST ARG1323 :
    MATCH "return 5;" -> GOTO ARG1324;
    TRUE -> STOP;

STATE USEFIRST ARG1324 :
    MATCH "" -> GOTO ARG1325;
    TRUE -> STOP;

STATE USEFIRST ARG1325 :
    MATCH "res = res_return() == 0" -> ASSUME {res == (0);} GOTO ARG1326;
    TRUE -> STOP;

STATE USEFIRST ARG1326 :
    MATCH "[!(res = res_return() == 0)]" -> ASSUME {res == (0);} GOTO ARG1327;
    TRUE -> STOP;

STATE USEFIRST ARG1327 :
    MATCH "break;" -> GOTO ARG1328;
    TRUE -> STOP;

STATE USEFIRST ARG1328 :
    MATCH "" -> GOTO ARG1329;
    TRUE -> STOP;

STATE USEFIRST ARG1329 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG1330;
    TRUE -> STOP;

STATE USEFIRST ARG1330 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG1331;
    TRUE -> STOP;

STATE USEFIRST ARG1331 :
    MATCH "switch (id)" -> GOTO ARG1332;
    TRUE -> STOP;

STATE USEFIRST ARG1332 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG1333;
    TRUE -> STOP;

STATE USEFIRST ARG1333 :
    MATCH "res = res_return() < 0" -> GOTO ARG1334;
    TRUE -> STOP;

STATE USEFIRST ARG1334 :
    MATCH "res = res_return() < 0" -> GOTO ARG1335;
    TRUE -> STOP;

STATE USEFIRST ARG1335 :
    MATCH "" -> GOTO ARG1336;
    TRUE -> STOP;

STATE USEFIRST ARG1336 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (82);} GOTO ARG1337;
    TRUE -> STOP;

STATE USEFIRST ARG1337 :
    MATCH "flag++ < 100" -> ASSUME {flag == (83);} GOTO ARG1338;
    TRUE -> STOP;

STATE USEFIRST ARG1338 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (82);} GOTO ARG1339;
    TRUE -> STOP;

STATE USEFIRST ARG1339 :
    MATCH "return 5;" -> GOTO ARG1340;
    TRUE -> STOP;

STATE USEFIRST ARG1340 :
    MATCH "" -> GOTO ARG1341;
    TRUE -> STOP;

STATE USEFIRST ARG1341 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (0);} GOTO ARG1342;
    TRUE -> STOP;

STATE USEFIRST ARG1342 :
    MATCH "[!(res = res_return() < 0)]" -> ASSUME {res == (0);} GOTO ARG1343;
    TRUE -> STOP;

STATE USEFIRST ARG1343 :
    MATCH "res = res_return() == 0" -> GOTO ARG1344;
    TRUE -> STOP;

STATE USEFIRST ARG1344 :
    MATCH "res = res_return() == 0" -> GOTO ARG1345;
    TRUE -> STOP;

STATE USEFIRST ARG1345 :
    MATCH "" -> GOTO ARG1346;
    TRUE -> STOP;

STATE USEFIRST ARG1346 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (83);} GOTO ARG1347;
    TRUE -> STOP;

STATE USEFIRST ARG1347 :
    MATCH "flag++ < 100" -> ASSUME {flag == (84);} GOTO ARG1348;
    TRUE -> STOP;

STATE USEFIRST ARG1348 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (83);} GOTO ARG1349;
    TRUE -> STOP;

STATE USEFIRST ARG1349 :
    MATCH "return 5;" -> GOTO ARG1350;
    TRUE -> STOP;

STATE USEFIRST ARG1350 :
    MATCH "" -> GOTO ARG1351;
    TRUE -> STOP;

STATE USEFIRST ARG1351 :
    MATCH "res = res_return() == 0" -> ASSUME {res == (0);} GOTO ARG1352;
    TRUE -> STOP;

STATE USEFIRST ARG1352 :
    MATCH "[!(res = res_return() == 0)]" -> ASSUME {res == (0);} GOTO ARG1353;
    TRUE -> STOP;

STATE USEFIRST ARG1353 :
    MATCH "break;" -> GOTO ARG1354;
    TRUE -> STOP;

STATE USEFIRST ARG1354 :
    MATCH "" -> GOTO ARG1355;
    TRUE -> STOP;

STATE USEFIRST ARG1355 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG1356;
    TRUE -> STOP;

STATE USEFIRST ARG1356 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG1357;
    TRUE -> STOP;

STATE USEFIRST ARG1357 :
    MATCH "switch (id)" -> GOTO ARG1358;
    TRUE -> STOP;

STATE USEFIRST ARG1358 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG1359;
    TRUE -> STOP;

STATE USEFIRST ARG1359 :
    MATCH "res = res_return() < 0" -> GOTO ARG1360;
    TRUE -> STOP;

STATE USEFIRST ARG1360 :
    MATCH "res = res_return() < 0" -> GOTO ARG1361;
    TRUE -> STOP;

STATE USEFIRST ARG1361 :
    MATCH "" -> GOTO ARG1362;
    TRUE -> STOP;

STATE USEFIRST ARG1362 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (84);} GOTO ARG1363;
    TRUE -> STOP;

STATE USEFIRST ARG1363 :
    MATCH "flag++ < 100" -> ASSUME {flag == (85);} GOTO ARG1364;
    TRUE -> STOP;

STATE USEFIRST ARG1364 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (84);} GOTO ARG1365;
    TRUE -> STOP;

STATE USEFIRST ARG1365 :
    MATCH "return 5;" -> GOTO ARG1366;
    TRUE -> STOP;

STATE USEFIRST ARG1366 :
    MATCH "" -> GOTO ARG1367;
    TRUE -> STOP;

STATE USEFIRST ARG1367 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (0);} GOTO ARG1368;
    TRUE -> STOP;

STATE USEFIRST ARG1368 :
    MATCH "[!(res = res_return() < 0)]" -> ASSUME {res == (0);} GOTO ARG1369;
    TRUE -> STOP;

STATE USEFIRST ARG1369 :
    MATCH "res = res_return() == 0" -> GOTO ARG1370;
    TRUE -> STOP;

STATE USEFIRST ARG1370 :
    MATCH "res = res_return() == 0" -> GOTO ARG1371;
    TRUE -> STOP;

STATE USEFIRST ARG1371 :
    MATCH "" -> GOTO ARG1372;
    TRUE -> STOP;

STATE USEFIRST ARG1372 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (85);} GOTO ARG1373;
    TRUE -> STOP;

STATE USEFIRST ARG1373 :
    MATCH "flag++ < 100" -> ASSUME {flag == (86);} GOTO ARG1374;
    TRUE -> STOP;

STATE USEFIRST ARG1374 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (85);} GOTO ARG1375;
    TRUE -> STOP;

STATE USEFIRST ARG1375 :
    MATCH "return 5;" -> GOTO ARG1376;
    TRUE -> STOP;

STATE USEFIRST ARG1376 :
    MATCH "" -> GOTO ARG1377;
    TRUE -> STOP;

STATE USEFIRST ARG1377 :
    MATCH "res = res_return() == 0" -> ASSUME {res == (0);} GOTO ARG1378;
    TRUE -> STOP;

STATE USEFIRST ARG1378 :
    MATCH "[!(res = res_return() == 0)]" -> ASSUME {res == (0);} GOTO ARG1379;
    TRUE -> STOP;

STATE USEFIRST ARG1379 :
    MATCH "break;" -> GOTO ARG1380;
    TRUE -> STOP;

STATE USEFIRST ARG1380 :
    MATCH "" -> GOTO ARG1381;
    TRUE -> STOP;

STATE USEFIRST ARG1381 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG1382;
    TRUE -> STOP;

STATE USEFIRST ARG1382 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG1383;
    TRUE -> STOP;

STATE USEFIRST ARG1383 :
    MATCH "switch (id)" -> GOTO ARG1384;
    TRUE -> STOP;

STATE USEFIRST ARG1384 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG1385;
    TRUE -> STOP;

STATE USEFIRST ARG1385 :
    MATCH "res = res_return() < 0" -> GOTO ARG1386;
    TRUE -> STOP;

STATE USEFIRST ARG1386 :
    MATCH "res = res_return() < 0" -> GOTO ARG1387;
    TRUE -> STOP;

STATE USEFIRST ARG1387 :
    MATCH "" -> GOTO ARG1388;
    TRUE -> STOP;

STATE USEFIRST ARG1388 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (86);} GOTO ARG1389;
    TRUE -> STOP;

STATE USEFIRST ARG1389 :
    MATCH "flag++ < 100" -> ASSUME {flag == (87);} GOTO ARG1390;
    TRUE -> STOP;

STATE USEFIRST ARG1390 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (86);} GOTO ARG1391;
    TRUE -> STOP;

STATE USEFIRST ARG1391 :
    MATCH "return 5;" -> GOTO ARG1392;
    TRUE -> STOP;

STATE USEFIRST ARG1392 :
    MATCH "" -> GOTO ARG1393;
    TRUE -> STOP;

STATE USEFIRST ARG1393 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (0);} GOTO ARG1394;
    TRUE -> STOP;

STATE USEFIRST ARG1394 :
    MATCH "[!(res = res_return() < 0)]" -> ASSUME {res == (0);} GOTO ARG1395;
    TRUE -> STOP;

STATE USEFIRST ARG1395 :
    MATCH "res = res_return() == 0" -> GOTO ARG1396;
    TRUE -> STOP;

STATE USEFIRST ARG1396 :
    MATCH "res = res_return() == 0" -> GOTO ARG1397;
    TRUE -> STOP;

STATE USEFIRST ARG1397 :
    MATCH "" -> GOTO ARG1398;
    TRUE -> STOP;

STATE USEFIRST ARG1398 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (87);} GOTO ARG1399;
    TRUE -> STOP;

STATE USEFIRST ARG1399 :
    MATCH "flag++ < 100" -> ASSUME {flag == (88);} GOTO ARG1400;
    TRUE -> STOP;

STATE USEFIRST ARG1400 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (87);} GOTO ARG1401;
    TRUE -> STOP;

STATE USEFIRST ARG1401 :
    MATCH "return 5;" -> GOTO ARG1402;
    TRUE -> STOP;

STATE USEFIRST ARG1402 :
    MATCH "" -> GOTO ARG1403;
    TRUE -> STOP;

STATE USEFIRST ARG1403 :
    MATCH "res = res_return() == 0" -> ASSUME {res == (0);} GOTO ARG1404;
    TRUE -> STOP;

STATE USEFIRST ARG1404 :
    MATCH "[!(res = res_return() == 0)]" -> ASSUME {res == (0);} GOTO ARG1405;
    TRUE -> STOP;

STATE USEFIRST ARG1405 :
    MATCH "break;" -> GOTO ARG1406;
    TRUE -> STOP;

STATE USEFIRST ARG1406 :
    MATCH "" -> GOTO ARG1407;
    TRUE -> STOP;

STATE USEFIRST ARG1407 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG1408;
    TRUE -> STOP;

STATE USEFIRST ARG1408 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG1409;
    TRUE -> STOP;

STATE USEFIRST ARG1409 :
    MATCH "switch (id)" -> GOTO ARG1410;
    TRUE -> STOP;

STATE USEFIRST ARG1410 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG1411;
    TRUE -> STOP;

STATE USEFIRST ARG1411 :
    MATCH "res = res_return() < 0" -> GOTO ARG1412;
    TRUE -> STOP;

STATE USEFIRST ARG1412 :
    MATCH "res = res_return() < 0" -> GOTO ARG1413;
    TRUE -> STOP;

STATE USEFIRST ARG1413 :
    MATCH "" -> GOTO ARG1414;
    TRUE -> STOP;

STATE USEFIRST ARG1414 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (88);} GOTO ARG1415;
    TRUE -> STOP;

STATE USEFIRST ARG1415 :
    MATCH "flag++ < 100" -> ASSUME {flag == (89);} GOTO ARG1416;
    TRUE -> STOP;

STATE USEFIRST ARG1416 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (88);} GOTO ARG1417;
    TRUE -> STOP;

STATE USEFIRST ARG1417 :
    MATCH "return 5;" -> GOTO ARG1418;
    TRUE -> STOP;

STATE USEFIRST ARG1418 :
    MATCH "" -> GOTO ARG1419;
    TRUE -> STOP;

STATE USEFIRST ARG1419 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (0);} GOTO ARG1420;
    TRUE -> STOP;

STATE USEFIRST ARG1420 :
    MATCH "[!(res = res_return() < 0)]" -> ASSUME {res == (0);} GOTO ARG1421;
    TRUE -> STOP;

STATE USEFIRST ARG1421 :
    MATCH "res = res_return() == 0" -> GOTO ARG1422;
    TRUE -> STOP;

STATE USEFIRST ARG1422 :
    MATCH "res = res_return() == 0" -> GOTO ARG1423;
    TRUE -> STOP;

STATE USEFIRST ARG1423 :
    MATCH "" -> GOTO ARG1424;
    TRUE -> STOP;

STATE USEFIRST ARG1424 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (89);} GOTO ARG1425;
    TRUE -> STOP;

STATE USEFIRST ARG1425 :
    MATCH "flag++ < 100" -> ASSUME {flag == (90);} GOTO ARG1426;
    TRUE -> STOP;

STATE USEFIRST ARG1426 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (89);} GOTO ARG1427;
    TRUE -> STOP;

STATE USEFIRST ARG1427 :
    MATCH "return 5;" -> GOTO ARG1428;
    TRUE -> STOP;

STATE USEFIRST ARG1428 :
    MATCH "" -> GOTO ARG1429;
    TRUE -> STOP;

STATE USEFIRST ARG1429 :
    MATCH "res = res_return() == 0" -> ASSUME {res == (0);} GOTO ARG1430;
    TRUE -> STOP;

STATE USEFIRST ARG1430 :
    MATCH "[!(res = res_return() == 0)]" -> ASSUME {res == (0);} GOTO ARG1431;
    TRUE -> STOP;

STATE USEFIRST ARG1431 :
    MATCH "break;" -> GOTO ARG1432;
    TRUE -> STOP;

STATE USEFIRST ARG1432 :
    MATCH "" -> GOTO ARG1433;
    TRUE -> STOP;

STATE USEFIRST ARG1433 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG1434;
    TRUE -> STOP;

STATE USEFIRST ARG1434 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG1435;
    TRUE -> STOP;

STATE USEFIRST ARG1435 :
    MATCH "switch (id)" -> GOTO ARG1436;
    TRUE -> STOP;

STATE USEFIRST ARG1436 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG1437;
    TRUE -> STOP;

STATE USEFIRST ARG1437 :
    MATCH "res = res_return() < 0" -> GOTO ARG1438;
    TRUE -> STOP;

STATE USEFIRST ARG1438 :
    MATCH "res = res_return() < 0" -> GOTO ARG1439;
    TRUE -> STOP;

STATE USEFIRST ARG1439 :
    MATCH "" -> GOTO ARG1440;
    TRUE -> STOP;

STATE USEFIRST ARG1440 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (90);} GOTO ARG1441;
    TRUE -> STOP;

STATE USEFIRST ARG1441 :
    MATCH "flag++ < 100" -> ASSUME {flag == (91);} GOTO ARG1442;
    TRUE -> STOP;

STATE USEFIRST ARG1442 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (90);} GOTO ARG1443;
    TRUE -> STOP;

STATE USEFIRST ARG1443 :
    MATCH "return 5;" -> GOTO ARG1444;
    TRUE -> STOP;

STATE USEFIRST ARG1444 :
    MATCH "" -> GOTO ARG1445;
    TRUE -> STOP;

STATE USEFIRST ARG1445 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (0);} GOTO ARG1446;
    TRUE -> STOP;

STATE USEFIRST ARG1446 :
    MATCH "[!(res = res_return() < 0)]" -> ASSUME {res == (0);} GOTO ARG1447;
    TRUE -> STOP;

STATE USEFIRST ARG1447 :
    MATCH "res = res_return() == 0" -> GOTO ARG1448;
    TRUE -> STOP;

STATE USEFIRST ARG1448 :
    MATCH "res = res_return() == 0" -> GOTO ARG1449;
    TRUE -> STOP;

STATE USEFIRST ARG1449 :
    MATCH "" -> GOTO ARG1450;
    TRUE -> STOP;

STATE USEFIRST ARG1450 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (91);} GOTO ARG1451;
    TRUE -> STOP;

STATE USEFIRST ARG1451 :
    MATCH "flag++ < 100" -> ASSUME {flag == (92);} GOTO ARG1452;
    TRUE -> STOP;

STATE USEFIRST ARG1452 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (91);} GOTO ARG1453;
    TRUE -> STOP;

STATE USEFIRST ARG1453 :
    MATCH "return 5;" -> GOTO ARG1454;
    TRUE -> STOP;

STATE USEFIRST ARG1454 :
    MATCH "" -> GOTO ARG1455;
    TRUE -> STOP;

STATE USEFIRST ARG1455 :
    MATCH "res = res_return() == 0" -> ASSUME {res == (0);} GOTO ARG1456;
    TRUE -> STOP;

STATE USEFIRST ARG1456 :
    MATCH "[!(res = res_return() == 0)]" -> ASSUME {res == (0);} GOTO ARG1457;
    TRUE -> STOP;

STATE USEFIRST ARG1457 :
    MATCH "break;" -> GOTO ARG1458;
    TRUE -> STOP;

STATE USEFIRST ARG1458 :
    MATCH "" -> GOTO ARG1459;
    TRUE -> STOP;

STATE USEFIRST ARG1459 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG1460;
    TRUE -> STOP;

STATE USEFIRST ARG1460 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG1461;
    TRUE -> STOP;

STATE USEFIRST ARG1461 :
    MATCH "switch (id)" -> GOTO ARG1462;
    TRUE -> STOP;

STATE USEFIRST ARG1462 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG1463;
    TRUE -> STOP;

STATE USEFIRST ARG1463 :
    MATCH "res = res_return() < 0" -> GOTO ARG1464;
    TRUE -> STOP;

STATE USEFIRST ARG1464 :
    MATCH "res = res_return() < 0" -> GOTO ARG1465;
    TRUE -> STOP;

STATE USEFIRST ARG1465 :
    MATCH "" -> GOTO ARG1466;
    TRUE -> STOP;

STATE USEFIRST ARG1466 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (92);} GOTO ARG1467;
    TRUE -> STOP;

STATE USEFIRST ARG1467 :
    MATCH "flag++ < 100" -> ASSUME {flag == (93);} GOTO ARG1468;
    TRUE -> STOP;

STATE USEFIRST ARG1468 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (92);} GOTO ARG1469;
    TRUE -> STOP;

STATE USEFIRST ARG1469 :
    MATCH "return 5;" -> GOTO ARG1470;
    TRUE -> STOP;

STATE USEFIRST ARG1470 :
    MATCH "" -> GOTO ARG1471;
    TRUE -> STOP;

STATE USEFIRST ARG1471 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (0);} GOTO ARG1472;
    TRUE -> STOP;

STATE USEFIRST ARG1472 :
    MATCH "[!(res = res_return() < 0)]" -> ASSUME {res == (0);} GOTO ARG1473;
    TRUE -> STOP;

STATE USEFIRST ARG1473 :
    MATCH "res = res_return() == 0" -> GOTO ARG1474;
    TRUE -> STOP;

STATE USEFIRST ARG1474 :
    MATCH "res = res_return() == 0" -> GOTO ARG1475;
    TRUE -> STOP;

STATE USEFIRST ARG1475 :
    MATCH "" -> GOTO ARG1476;
    TRUE -> STOP;

STATE USEFIRST ARG1476 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (93);} GOTO ARG1477;
    TRUE -> STOP;

STATE USEFIRST ARG1477 :
    MATCH "flag++ < 100" -> ASSUME {flag == (94);} GOTO ARG1478;
    TRUE -> STOP;

STATE USEFIRST ARG1478 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (93);} GOTO ARG1479;
    TRUE -> STOP;

STATE USEFIRST ARG1479 :
    MATCH "return 5;" -> GOTO ARG1480;
    TRUE -> STOP;

STATE USEFIRST ARG1480 :
    MATCH "" -> GOTO ARG1481;
    TRUE -> STOP;

STATE USEFIRST ARG1481 :
    MATCH "res = res_return() == 0" -> ASSUME {res == (0);} GOTO ARG1482;
    TRUE -> STOP;

STATE USEFIRST ARG1482 :
    MATCH "[!(res = res_return() == 0)]" -> ASSUME {res == (0);} GOTO ARG1483;
    TRUE -> STOP;

STATE USEFIRST ARG1483 :
    MATCH "break;" -> GOTO ARG1484;
    TRUE -> STOP;

STATE USEFIRST ARG1484 :
    MATCH "" -> GOTO ARG1485;
    TRUE -> STOP;

STATE USEFIRST ARG1485 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG1486;
    TRUE -> STOP;

STATE USEFIRST ARG1486 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG1487;
    TRUE -> STOP;

STATE USEFIRST ARG1487 :
    MATCH "switch (id)" -> GOTO ARG1488;
    TRUE -> STOP;

STATE USEFIRST ARG1488 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG1489;
    TRUE -> STOP;

STATE USEFIRST ARG1489 :
    MATCH "res = res_return() < 0" -> GOTO ARG1490;
    TRUE -> STOP;

STATE USEFIRST ARG1490 :
    MATCH "res = res_return() < 0" -> GOTO ARG1491;
    TRUE -> STOP;

STATE USEFIRST ARG1491 :
    MATCH "" -> GOTO ARG1492;
    TRUE -> STOP;

STATE USEFIRST ARG1492 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (94);} GOTO ARG1493;
    TRUE -> STOP;

STATE USEFIRST ARG1493 :
    MATCH "flag++ < 100" -> ASSUME {flag == (95);} GOTO ARG1494;
    TRUE -> STOP;

STATE USEFIRST ARG1494 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (94);} GOTO ARG1495;
    TRUE -> STOP;

STATE USEFIRST ARG1495 :
    MATCH "return 5;" -> GOTO ARG1496;
    TRUE -> STOP;

STATE USEFIRST ARG1496 :
    MATCH "" -> GOTO ARG1497;
    TRUE -> STOP;

STATE USEFIRST ARG1497 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (0);} GOTO ARG1498;
    TRUE -> STOP;

STATE USEFIRST ARG1498 :
    MATCH "[!(res = res_return() < 0)]" -> ASSUME {res == (0);} GOTO ARG1499;
    TRUE -> STOP;

STATE USEFIRST ARG1499 :
    MATCH "res = res_return() == 0" -> GOTO ARG1500;
    TRUE -> STOP;

STATE USEFIRST ARG1500 :
    MATCH "res = res_return() == 0" -> GOTO ARG1501;
    TRUE -> STOP;

STATE USEFIRST ARG1501 :
    MATCH "" -> GOTO ARG1502;
    TRUE -> STOP;

STATE USEFIRST ARG1502 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (95);} GOTO ARG1503;
    TRUE -> STOP;

STATE USEFIRST ARG1503 :
    MATCH "flag++ < 100" -> ASSUME {flag == (96);} GOTO ARG1504;
    TRUE -> STOP;

STATE USEFIRST ARG1504 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (95);} GOTO ARG1505;
    TRUE -> STOP;

STATE USEFIRST ARG1505 :
    MATCH "return 5;" -> GOTO ARG1506;
    TRUE -> STOP;

STATE USEFIRST ARG1506 :
    MATCH "" -> GOTO ARG1507;
    TRUE -> STOP;

STATE USEFIRST ARG1507 :
    MATCH "res = res_return() == 0" -> ASSUME {res == (0);} GOTO ARG1508;
    TRUE -> STOP;

STATE USEFIRST ARG1508 :
    MATCH "[!(res = res_return() == 0)]" -> ASSUME {res == (0);} GOTO ARG1509;
    TRUE -> STOP;

STATE USEFIRST ARG1509 :
    MATCH "break;" -> GOTO ARG1510;
    TRUE -> STOP;

STATE USEFIRST ARG1510 :
    MATCH "" -> GOTO ARG1511;
    TRUE -> STOP;

STATE USEFIRST ARG1511 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG1512;
    TRUE -> STOP;

STATE USEFIRST ARG1512 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG1513;
    TRUE -> STOP;

STATE USEFIRST ARG1513 :
    MATCH "switch (id)" -> GOTO ARG1514;
    TRUE -> STOP;

STATE USEFIRST ARG1514 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG1515;
    TRUE -> STOP;

STATE USEFIRST ARG1515 :
    MATCH "res = res_return() < 0" -> GOTO ARG1516;
    TRUE -> STOP;

STATE USEFIRST ARG1516 :
    MATCH "res = res_return() < 0" -> GOTO ARG1517;
    TRUE -> STOP;

STATE USEFIRST ARG1517 :
    MATCH "" -> GOTO ARG1518;
    TRUE -> STOP;

STATE USEFIRST ARG1518 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (96);} GOTO ARG1519;
    TRUE -> STOP;

STATE USEFIRST ARG1519 :
    MATCH "flag++ < 100" -> ASSUME {flag == (97);} GOTO ARG1520;
    TRUE -> STOP;

STATE USEFIRST ARG1520 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (96);} GOTO ARG1521;
    TRUE -> STOP;

STATE USEFIRST ARG1521 :
    MATCH "return 5;" -> GOTO ARG1522;
    TRUE -> STOP;

STATE USEFIRST ARG1522 :
    MATCH "" -> GOTO ARG1523;
    TRUE -> STOP;

STATE USEFIRST ARG1523 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (0);} GOTO ARG1524;
    TRUE -> STOP;

STATE USEFIRST ARG1524 :
    MATCH "[!(res = res_return() < 0)]" -> ASSUME {res == (0);} GOTO ARG1525;
    TRUE -> STOP;

STATE USEFIRST ARG1525 :
    MATCH "res = res_return() == 0" -> GOTO ARG1526;
    TRUE -> STOP;

STATE USEFIRST ARG1526 :
    MATCH "res = res_return() == 0" -> GOTO ARG1527;
    TRUE -> STOP;

STATE USEFIRST ARG1527 :
    MATCH "" -> GOTO ARG1528;
    TRUE -> STOP;

STATE USEFIRST ARG1528 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (97);} GOTO ARG1529;
    TRUE -> STOP;

STATE USEFIRST ARG1529 :
    MATCH "flag++ < 100" -> ASSUME {flag == (98);} GOTO ARG1530;
    TRUE -> STOP;

STATE USEFIRST ARG1530 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (97);} GOTO ARG1531;
    TRUE -> STOP;

STATE USEFIRST ARG1531 :
    MATCH "return 5;" -> GOTO ARG1532;
    TRUE -> STOP;

STATE USEFIRST ARG1532 :
    MATCH "" -> GOTO ARG1533;
    TRUE -> STOP;

STATE USEFIRST ARG1533 :
    MATCH "res = res_return() == 0" -> ASSUME {res == (0);} GOTO ARG1534;
    TRUE -> STOP;

STATE USEFIRST ARG1534 :
    MATCH "[!(res = res_return() == 0)]" -> ASSUME {res == (0);} GOTO ARG1535;
    TRUE -> STOP;

STATE USEFIRST ARG1535 :
    MATCH "break;" -> GOTO ARG1536;
    TRUE -> STOP;

STATE USEFIRST ARG1536 :
    MATCH "" -> GOTO ARG1537;
    TRUE -> STOP;

STATE USEFIRST ARG1537 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG1538;
    TRUE -> STOP;

STATE USEFIRST ARG1538 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG1539;
    TRUE -> STOP;

STATE USEFIRST ARG1539 :
    MATCH "switch (id)" -> GOTO ARG1540;
    TRUE -> STOP;

STATE USEFIRST ARG1540 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG1541;
    TRUE -> STOP;

STATE USEFIRST ARG1541 :
    MATCH "res = res_return() < 0" -> GOTO ARG1542;
    TRUE -> STOP;

STATE USEFIRST ARG1542 :
    MATCH "res = res_return() < 0" -> GOTO ARG1543;
    TRUE -> STOP;

STATE USEFIRST ARG1543 :
    MATCH "" -> GOTO ARG1544;
    TRUE -> STOP;

STATE USEFIRST ARG1544 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (98);} GOTO ARG1545;
    TRUE -> STOP;

STATE USEFIRST ARG1545 :
    MATCH "flag++ < 100" -> ASSUME {flag == (99);} GOTO ARG1546;
    TRUE -> STOP;

STATE USEFIRST ARG1546 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (98);} GOTO ARG1547;
    TRUE -> STOP;

STATE USEFIRST ARG1547 :
    MATCH "return 5;" -> GOTO ARG1548;
    TRUE -> STOP;

STATE USEFIRST ARG1548 :
    MATCH "" -> GOTO ARG1549;
    TRUE -> STOP;

STATE USEFIRST ARG1549 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (0);} GOTO ARG1550;
    TRUE -> STOP;

STATE USEFIRST ARG1550 :
    MATCH "[!(res = res_return() < 0)]" -> ASSUME {res == (0);} GOTO ARG1551;
    TRUE -> STOP;

STATE USEFIRST ARG1551 :
    MATCH "res = res_return() == 0" -> GOTO ARG1552;
    TRUE -> STOP;

STATE USEFIRST ARG1552 :
    MATCH "res = res_return() == 0" -> GOTO ARG1553;
    TRUE -> STOP;

STATE USEFIRST ARG1553 :
    MATCH "" -> GOTO ARG1554;
    TRUE -> STOP;

STATE USEFIRST ARG1554 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (99);} GOTO ARG1555;
    TRUE -> STOP;

STATE USEFIRST ARG1555 :
    MATCH "flag++ < 100" -> ASSUME {flag == (100);} GOTO ARG1556;
    TRUE -> STOP;

STATE USEFIRST ARG1556 :
    MATCH "[flag++ < 100]" -> ASSUME {__CPAchecker_TMP_0 == (99);} GOTO ARG1557;
    TRUE -> STOP;

STATE USEFIRST ARG1557 :
    MATCH "return 5;" -> GOTO ARG1558;
    TRUE -> STOP;

STATE USEFIRST ARG1558 :
    MATCH "" -> GOTO ARG1559;
    TRUE -> STOP;

STATE USEFIRST ARG1559 :
    MATCH "res = res_return() == 0" -> ASSUME {res == (0);} GOTO ARG1560;
    TRUE -> STOP;

STATE USEFIRST ARG1560 :
    MATCH "[!(res = res_return() == 0)]" -> ASSUME {res == (0);} GOTO ARG1561;
    TRUE -> STOP;

STATE USEFIRST ARG1561 :
    MATCH "break;" -> GOTO ARG1562;
    TRUE -> STOP;

STATE USEFIRST ARG1562 :
    MATCH "" -> GOTO ARG1563;
    TRUE -> STOP;

STATE USEFIRST ARG1563 :
    MATCH "[res == 0]" -> ASSUME {res == (0);} GOTO ARG1564;
    TRUE -> STOP;

STATE USEFIRST ARG1564 :
    MATCH "int id = 1;" -> ASSUME {id == (1);} GOTO ARG1565;
    TRUE -> STOP;

STATE USEFIRST ARG1565 :
    MATCH "switch (id)" -> GOTO ARG1566;
    TRUE -> STOP;

STATE USEFIRST ARG1566 :
    MATCH "[id == 1]" -> ASSUME {id == (1);} GOTO ARG1567;
    TRUE -> STOP;

STATE USEFIRST ARG1567 :
    MATCH "res = res_return() < 0" -> GOTO ARG1568;
    TRUE -> STOP;

STATE USEFIRST ARG1568 :
    MATCH "res = res_return() < 0" -> GOTO ARG1569;
    TRUE -> STOP;

STATE USEFIRST ARG1569 :
    MATCH "" -> GOTO ARG1570;
    TRUE -> STOP;

STATE USEFIRST ARG1570 :
    MATCH "flag++ < 100" -> ASSUME {__CPAchecker_TMP_0 == (100);} GOTO ARG1571;
    TRUE -> STOP;

STATE USEFIRST ARG1571 :
    MATCH "flag++ < 100" -> ASSUME {flag == (101);} GOTO ARG1572;
    TRUE -> STOP;

STATE USEFIRST ARG1572 :
    MATCH "[!(flag++ < 100)]" -> ASSUME {__CPAchecker_TMP_0 == (100);} GOTO ARG1573;
    TRUE -> STOP;

STATE USEFIRST ARG1573 :
    MATCH "return -1;" -> GOTO ARG1574;
    TRUE -> STOP;

STATE USEFIRST ARG1574 :
    MATCH "" -> GOTO ARG1575;
    TRUE -> STOP;

STATE USEFIRST ARG1575 :
    MATCH "res = res_return() < 0" -> ASSUME {res == (1);} GOTO ARG1576;
    TRUE -> STOP;

STATE USEFIRST ARG1576 :
    MATCH "[res = res_return() < 0]" -> ASSUME {res == (1);} GOTO ARG1577;
    TRUE -> STOP;

STATE USEFIRST ARG1577 :
    MATCH "break;" -> GOTO ARG1578;
    TRUE -> STOP;

STATE USEFIRST ARG1578 :
    MATCH "" -> GOTO ARG1579;
    TRUE -> STOP;

STATE USEFIRST ARG1579 :
    MATCH "[!(res == 0)]" -> ASSUME {res == (1);} GOTO ARG1580;
    TRUE -> STOP;

STATE USEFIRST ARG1580 :
    MATCH "[!(res == -1)]" -> ASSUME {res == (1);} GOTO ARG1581;
    TRUE -> STOP;

STATE USEFIRST ARG1581 :
    MATCH "" -> GOTO ARG1582;
    TRUE -> STOP;

STATE USEFIRST ARG1582 :
    MATCH "matroska_deliver_packet( matroska)" -> GOTO ARG1583;
    TRUE -> STOP;

STATE USEFIRST ARG1583 :
    MATCH "matroska_deliver_packet( matroska)" -> GOTO ARG1584;
    TRUE -> STOP;

STATE USEFIRST ARG1584 :
    MATCH "" -> ASSUME {q == (2);} GOTO ARG1585;
    TRUE -> STOP;

STATE USEFIRST ARG1585 :
    MATCH "[!(q == 1)]" -> ASSUME {q == (2);} GOTO ARG1586;
    TRUE -> STOP;

STATE USEFIRST ARG1586 :
    MATCH "return 1;" -> GOTO ARG1587;
    TRUE -> STOP;

STATE USEFIRST ARG1587 :
    MATCH "" -> GOTO ARG1588;
    TRUE -> STOP;

STATE USEFIRST ARG1588 :
    MATCH "[matroska_deliver_packet( matroska)]" -> ASSUME {__CPAchecker_TMP_0 == (1);} GOTO ARG1589;
    TRUE -> STOP;

STATE USEFIRST ARG1589 :
    MATCH "" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG1590 :
    TRUE -> STOP;

END AUTOMATON
