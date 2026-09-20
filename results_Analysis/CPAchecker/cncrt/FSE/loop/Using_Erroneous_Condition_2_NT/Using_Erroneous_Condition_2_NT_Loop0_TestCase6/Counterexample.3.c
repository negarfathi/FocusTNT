int __VERIFIER_nondet_int();
int main();
extern void __VERIFIER_error(void);
int main_0();
int main_0() {
  int reg_count = 1;
  __CPROVER_assume(!(reg_count > 65534));
  int i = 0;
  __CPROVER_assume(!(reg_count == 0));
  __VERIFIER_error(); // target state
  i = i + 1;
}
