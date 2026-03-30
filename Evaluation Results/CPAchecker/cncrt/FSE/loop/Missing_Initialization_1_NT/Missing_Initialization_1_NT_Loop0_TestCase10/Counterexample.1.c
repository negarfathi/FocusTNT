int __VERIFIER_nondet_int();
int main();
extern void __VERIFIER_error(void);
int main_0();
int main_0() {
  int res = 0;
  int pkt = 3;
  __CPROVER_assume(pkt < 10);
  __CPROVER_assume(res == 0);
  res = 9;
  const int __CPAchecker_TMP_0 = pkt;
  pkt = pkt + 1;
  __CPAchecker_TMP_0;
  __CPROVER_assume(!(res == 0));
  __CPROVER_assume(pkt < 10);
  __VERIFIER_error(); // target state
}
