int __VERIFIER_nondet_int();
void main();
extern void __VERIFIER_error(void);
void main_0();
void main_0() {
  int res = 0;
  int pkt = 0;
  __CPROVER_assume(pkt < 10);
  __CPROVER_assume(res == 0);
  res = 3;
  const int __CPAchecker_TMP_0 = pkt;
  pkt = pkt + 1;
  __CPAchecker_TMP_0;
  __CPROVER_assume(!(res == 0));
  __CPROVER_assume(pkt < 10);
  __VERIFIER_error(); // target state
}
