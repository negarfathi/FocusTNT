int __VERIFIER_nondet_int();
int main();
extern void __VERIFIER_error(void);
int main_0();
int main_0() {
  int a0 = 0L;
  int a1 = 0;
  __CPROVER_assume((a0 & 1) == 0);
  a0 = (a1 << 31) | (a0 >> 1);
  a1 = a1 >> 1;
  __VERIFIER_error(); // target state
}
