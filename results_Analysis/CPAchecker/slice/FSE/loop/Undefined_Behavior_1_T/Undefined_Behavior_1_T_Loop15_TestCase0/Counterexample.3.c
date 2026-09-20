unsigned int __VERIFIER_nondet_uint();
void main();
extern void __VERIFIER_error(void);
void main_0();
void main_0() {
  unsigned int num;
  num = __VERIFIER_nondet_uint();
  const unsigned int __CPAchecker_TMP_0 = num;
  num = num + 1;
  __CPAchecker_TMP_0;
  num = num >> 7;
  __CPROVER_assume(!(num == 0));
  __VERIFIER_error(); // target state
}
