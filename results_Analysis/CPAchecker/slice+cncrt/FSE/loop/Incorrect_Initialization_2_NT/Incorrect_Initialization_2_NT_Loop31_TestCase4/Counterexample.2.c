int __VERIFIER_nondet_int();
int matroska_deliver_packet_slice_1(int q);
int flag = 0;
int res_return_slice_1();
void main();
extern void __VERIFIER_error(void);
void main_0();
int matroska_deliver_packet_slice_1_1(int q);
int res_return_slice_1_2();
int res_return_slice_1_3();
int matroska_deliver_packet_slice_1_4(int q);
void main_0() {
  int tmpVar0;
  int matroska = 2;
  int res = 0;
  tmpVar0 = matroska_deliver_packet_slice_1_1(matroska);
  __CPROVER_assume(!(tmpVar0 == 0));
  __CPROVER_assume(res == 0);
  int id = 1;
  __CPROVER_assume(id == 1);
  tmp_1 = res_return_slice_1_2();
  res = tmp_1 < 0;
  __CPROVER_assume(res == 0);
  tmp_2 = res_return_slice_1_3();
  res = tmp_2 == 0;
  __CPROVER_assume(!(res == 0));
  res = 1;
  __CPROVER_assume(!(res == 0));
  __CPROVER_assume(!(res == -1));
  tmpVar0 = matroska_deliver_packet_slice_1_4(matroska);
  __CPROVER_assume(!(tmpVar0 == 0));
  __VERIFIER_error(); // target state
}

int matroska_deliver_packet_slice_1_1(int q) {
  int __retres;
  __CPROVER_assume(!(q == 1));
  __retres = 1;
  return __retres;
}

int res_return_slice_1_2() {
  int __retres;
  int tmp_0;
  tmp_0 = flag;
  const int __CPAchecker_TMP_0 = flag;
  flag = flag + 1;
  __CPAchecker_TMP_0;
  __CPROVER_assume(tmp_0 < 100);
  int tmp;
  tmp = 0;
  __retres = tmp;
  return __retres;
}

int res_return_slice_1_3() {
  int __retres;
  int tmp_0;
  tmp_0 = flag;
  const int __CPAchecker_TMP_0 = flag;
  flag = flag + 1;
  __CPAchecker_TMP_0;
  __CPROVER_assume(tmp_0 < 100);
  int tmp;
  tmp = 0;
  __retres = tmp;
  return __retres;
}

int matroska_deliver_packet_slice_1_4(int q) {
  int __retres;
  __CPROVER_assume(!(q == 1));
  __retres = 1;
  return __retres;
}
