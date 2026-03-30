int __VERIFIER_nondet_int();
void main();
extern void __VERIFIER_error(void);
void main_0();
void main_0() {
  int wc = -64;
  wc = wc >> 6;
  __CPROVER_assume(!(wc == 0));
  wc = wc >> 6;
  __CPROVER_assume(!(wc == 0));
  __VERIFIER_error(); // target state
}
