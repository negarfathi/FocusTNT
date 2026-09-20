int __VERIFIER_nondet_int();
void main();
extern void __VERIFIER_error(void);
void main_0();
void main_0() {
  int __retres;
  int reg_count = 65534;
  __CPROVER_assume(!(reg_count > 65534));
  __CPROVER_assume(!(reg_count == 0));
  __VERIFIER_error(); // target state
}
