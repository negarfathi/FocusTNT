int __VERIFIER_nondet_int();
int main();
extern void __VERIFIER_error(void);
int main_0();
int main_0() {
  int val;
  val = __VERIFIER_nondet_int();
  __CPROVER_assume(!(val == 0));
  int bits;
  bits = 0;
  __CPROVER_assume(val != 0);
  val = val >> 1;
  __VERIFIER_error(); // target state
  bits = bits + 1;
}
