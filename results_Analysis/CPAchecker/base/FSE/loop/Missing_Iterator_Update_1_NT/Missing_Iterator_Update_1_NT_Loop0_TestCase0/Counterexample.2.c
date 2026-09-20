int __VERIFIER_nondet_int();
int errno = 0;
int waitpid();
int main();
extern void __VERIFIER_error(void);
int main_0();
int waitpid_1();
int waitpid_2();
int main_0() {
  int ret;
  ret = waitpid_1();
  __CPROVER_assume(ret == 0);
  ret = waitpid_2();
  __CPROVER_assume(ret < 0);
  __CPROVER_assume(errno == 1);
  __CPROVER_assume(!(ret == 0));
  __CPROVER_assume(ret < 0);
  __CPROVER_assume(errno == 1);
  __VERIFIER_error(); // target state
}

int waitpid_1() {
  int num;
  num = __VERIFIER_nondet_int();
  __CPROVER_assume(!(num < 0));
  return num;
}

int waitpid_2() {
  int num;
  num = __VERIFIER_nondet_int();
  __CPROVER_assume(num < 0);
  int __CPAchecker_TMP_0;
  __CPAchecker_TMP_0 = __VERIFIER_nondet_int();
  __CPROVER_assume(!(__CPAchecker_TMP_0 == 0));
  __CPROVER_assume(errno != 1);
  errno = 1;
  return num;
}
