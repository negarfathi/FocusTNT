unsigned char __VERIFIER_nondet_uchar();
int main();
extern void __VERIFIER_error(void);
int main_0();
int main_0() {
  unsigned char l = 1;
  const unsigned char __CPAchecker_TMP_0 = l;
  l = l - 1;
  __CPROVER_assume(!(__CPAchecker_TMP_0 == 0));
  const unsigned char __CPAchecker_TMP_1 = l;
  l = l - 1;
  if (__CPAchecker_TMP_1 == 0) {
    goto label_948;
  }

  else {
    goto label_948;
  }

  label_948: ;
  l = l - 1;
  __CPROVER_assume(!(__CPAchecker_TMP_0 == 0));
  l = l - 1;
  if (__CPAchecker_TMP_1 == 0) {
    goto label_1027;
  }

  else {
    goto label_1027;
  }

  label_1027: ;
  __VERIFIER_error(); // target state
}
