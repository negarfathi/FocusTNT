int __VERIFIER_nondet_int();
int main();
extern void __VERIFIER_error(void);
int main_0();
int main_0() {
  int i;
  int j;
  int num = 50;
  __CPROVER_assume(!(num > 65534));
  i = 0;
  __CPROVER_assume(i < num);
  i = 0;
  __CPROVER_assume(i < 3);
  i = i + 1;
  __CPROVER_assume(i < 3);
  i = i + 1;
  __CPROVER_assume(i < 3);
  i = i + 1;
  __CPROVER_assume(!(i < 3));
  i = i + 1;
  __CPROVER_assume(i < num);
  __VERIFIER_error(); // target state
  i = 0;
}
