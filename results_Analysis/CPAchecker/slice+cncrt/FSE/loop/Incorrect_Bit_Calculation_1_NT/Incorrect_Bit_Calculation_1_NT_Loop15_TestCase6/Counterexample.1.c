int __VERIFIER_nondet_int();
void main();
extern void __VERIFIER_error(void);
void main_0();
void main_0() {
  int mask = 0;
  __CPROVER_assume((mask & 1) == 0);
  mask = mask >> 1;
  __VERIFIER_error(); // target state
}
