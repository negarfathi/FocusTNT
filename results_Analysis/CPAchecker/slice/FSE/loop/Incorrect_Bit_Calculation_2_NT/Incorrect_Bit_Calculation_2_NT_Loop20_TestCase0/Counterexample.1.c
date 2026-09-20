int __VERIFIER_nondet_int();
void main();
extern void __VERIFIER_error(void);
void main_0();
void main_0() {
  int a0;
  a0 = __VERIFIER_nondet_int();
  int a1;
  a1 = __VERIFIER_nondet_int();
  __CPROVER_assume((a0 & 1) == 0);
  a0 = (a1 << 31) | (a0 >> 1);
  a1 = a1 >> 1;
  __VERIFIER_error(); // target state
}
