int __VERIFIER_nondet_int();
int matroska_deliver_packet_slice_1(int q);
int flag = 0;
int res_return_slice_1();
void main();
extern void __VERIFIER_error(void);
void main_0();
int matroska_deliver_packet_slice_1_1(int q);
int res_return_slice_1_2();
int matroska_deliver_packet_slice_1_3(int q);
void main_0() {
  int tmpVar0;
  int matroska = 5;
  int res = 0;
  tmpVar0 = matroska_deliver_packet_slice_1_1(matroska);
  __CPROVER_assume(!(tmpVar0 == 0));
  __CPROVER_assume(res == 0);
  int id = 2;
  __CPROVER_assume(!(id == 1));
  __CPROVER_assume(id == 2);
  res = res_return_slice_1_2();
  __CPROVER_assume(!(res == 0));
  __CPROVER_assume(!(res == -1));
  tmpVar0 = matroska_deliver_packet_slice_1_3(matroska);
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
  tmp = 10;
  __retres = tmp;
  return __retres;
}

int matroska_deliver_packet_slice_1_3(int q) {
  int __retres;
  __CPROVER_assume(!(q == 1));
  __retres = 1;
  return __retres;
}
