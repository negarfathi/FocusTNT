int __VERIFIER_nondet_int();
void main();
extern void __VERIFIER_error(void);
void main_0();
void main_0() {
  int __retres;
  int val = -10;
  __CPROVER_assume(!(val == 0));
  __CPROVER_assume(val != 0);
  val = val >> 1;
  __CPROVER_assume(val != 0);
  val = val >> 1;
  __CPROVER_assume(val != 0);
  val = val >> 1;
  __CPROVER_assume(val != 0);
  val = val >> 1;
  __CPROVER_assume(val != 0);
  val = val >> 1;
  __VERIFIER_error(); // target state
}
