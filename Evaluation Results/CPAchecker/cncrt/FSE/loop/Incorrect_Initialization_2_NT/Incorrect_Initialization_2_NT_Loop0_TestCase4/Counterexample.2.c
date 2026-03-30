int __VERIFIER_nondet_int();
int matroska_deliver_packet(int q);
int flag = 0;
int res_return();
int main();
extern void __VERIFIER_error(void);
int main_0();
int matroska_deliver_packet_1(int q);
int res_return_2();
int res_return_3();
int matroska_deliver_packet_4(int q);
int main_0() {
  int matroska = 2;
  int res = 0;
  int __CPAchecker_TMP_0;
  __CPAchecker_TMP_0 = matroska_deliver_packet_1(matroska);
  __CPROVER_assume(!(__CPAchecker_TMP_0 == 0));
  __CPROVER_assume(res == 0);
  int id = 1;
  __CPROVER_assume(id == 1);
  int __CPAchecker_TMP_1;
  __CPAchecker_TMP_1 = res_return_2();
  res = __CPAchecker_TMP_1 < 0;
  __CPROVER_assume(res == 0);
  int __CPAchecker_TMP_2;
  __CPAchecker_TMP_2 = res_return_3();
  res = __CPAchecker_TMP_2 == 0;
  __CPROVER_assume(!(res == 0));
  res = 1;
  __CPROVER_assume(!(res == 0));
  __CPROVER_assume(!(res == -1));
  __CPAchecker_TMP_0 = matroska_deliver_packet_4(matroska);
  __CPROVER_assume(!(__CPAchecker_TMP_0 == 0));
  __VERIFIER_error(); // target state
}

int matroska_deliver_packet_1(int q) {
  __CPROVER_assume(!(q == 1));
  return 1;
}

int res_return_2() {
  const int __CPAchecker_TMP_0 = flag;
  flag = flag + 1;
  __CPROVER_assume(__CPAchecker_TMP_0 < 100);
  return 0;
}

int res_return_3() {
  const int __CPAchecker_TMP_0 = flag;
  flag = flag + 1;
  __CPROVER_assume(__CPAchecker_TMP_0 < 100);
  return 0;
}

int matroska_deliver_packet_4(int q) {
  __CPROVER_assume(!(q == 1));
  return 1;
}
