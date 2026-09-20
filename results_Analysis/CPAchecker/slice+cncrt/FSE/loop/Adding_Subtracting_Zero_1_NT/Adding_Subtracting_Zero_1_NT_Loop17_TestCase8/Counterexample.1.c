int __VERIFIER_nondet_int();
void main();
extern void __VERIFIER_error(void);
void main_0();
void main_0() {
  int linesToRead = 0;
  __CPROVER_assume(!(linesToRead < 0));
  int h = 1;
  __CPROVER_assume(h > 0);
  __CPROVER_assume(!(linesToRead > h));
  h = h - linesToRead;
  __VERIFIER_error(); // target state
}
