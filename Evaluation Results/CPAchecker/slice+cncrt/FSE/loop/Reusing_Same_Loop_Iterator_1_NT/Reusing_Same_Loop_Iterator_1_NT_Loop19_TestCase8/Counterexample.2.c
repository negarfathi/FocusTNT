int __VERIFIER_nondet_int();
void main();
extern void __VERIFIER_error(void);
void main_0();
void main_0() {
  int __retres;
  int i;
  int num_crtc = 500;
  int num_output = 1;
  __CPROVER_assume(!(num_crtc > 65534));
  __CPROVER_assume(!(num_output > 65534));
  i = 0;
  __CPROVER_assume(i < num_crtc);
  i = 0;
  __CPROVER_assume(i < num_output);
  const int __CPAchecker_TMP_0 = i;
  i = i + 1;
  __CPAchecker_TMP_0;
  __CPROVER_assume(!(i < num_output));
  const int __CPAchecker_TMP_1 = i;
  i = i + 1;
  __CPAchecker_TMP_1;
  __CPROVER_assume(i < num_crtc);
  i = 0;
  __VERIFIER_error(); // target state
}
