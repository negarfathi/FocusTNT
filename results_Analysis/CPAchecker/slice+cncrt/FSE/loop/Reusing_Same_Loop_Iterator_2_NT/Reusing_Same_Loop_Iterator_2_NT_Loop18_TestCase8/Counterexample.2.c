int __VERIFIER_nondet_int();
void main();
extern void __VERIFIER_error(void);
void main_0();
void main_0() {
  int i;
  int num = 100;
  __CPROVER_assume(!(num > 65534));
  i = 0;
  __CPROVER_assume(i < num);
  i = 0;
  __CPROVER_assume(i < 3);
  const int __CPAchecker_TMP_0 = i;
  i = i + 1;
  __CPAchecker_TMP_0;
  __CPROVER_assume(i < 3);
  i = i + 1;
  __CPAchecker_TMP_0;
  __CPROVER_assume(i < 3);
  i = i + 1;
  __CPAchecker_TMP_0;
  __CPROVER_assume(!(i < 3));
  const int __CPAchecker_TMP_1 = i;
  i = i + 1;
  __CPAchecker_TMP_1;
  __CPROVER_assume(i < num);
  i = 0;
  __VERIFIER_error(); // target state
}
