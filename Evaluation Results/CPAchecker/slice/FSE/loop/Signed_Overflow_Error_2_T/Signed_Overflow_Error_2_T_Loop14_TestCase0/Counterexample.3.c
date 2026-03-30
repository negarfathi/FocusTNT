int __VERIFIER_nondet_int();
void main();
extern void __VERIFIER_error(void);
void main_0();
void main_0() {
  int needed;
  needed = __VERIFIER_nondet_int();
  int smallest = 1;
  __CPROVER_assume(smallest <= needed);
  __CPROVER_assume(!(smallest == 0));
  smallest = smallest << 1;
  __VERIFIER_error(); // target state
}
