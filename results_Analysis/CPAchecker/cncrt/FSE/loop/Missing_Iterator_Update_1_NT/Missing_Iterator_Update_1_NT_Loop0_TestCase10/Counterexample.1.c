int __VERIFIER_nondet_int();
int errno = 0;
int waitpid();
int main();
extern void __VERIFIER_error(void);
int main_0();
int waitpid_1();
int main_0() {
  int ret;
  ret = waitpid_1();
  __CPROVER_assume(!(ret == 0));
  __CPROVER_assume(ret < 0);
  __CPROVER_assume(errno == 1);
  __VERIFIER_error(); // target state
}

int waitpid_1() {
  int num = -999;
  __CPROVER_assume(num < 0);
  __CPROVER_assume(errno != 1);
  errno = 1;
  return num;
}
