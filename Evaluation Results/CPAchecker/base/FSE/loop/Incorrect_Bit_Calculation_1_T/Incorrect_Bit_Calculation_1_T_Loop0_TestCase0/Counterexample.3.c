int __VERIFIER_nondet_int();
int main();
extern void __VERIFIER_error(void);
int main_0();
int main_0() {
  int mask;
  mask = __VERIFIER_nondet_int();
  __CPROVER_assume(mask > 1);
  mask = mask >> 1;
  __VERIFIER_error(); // target state
}
