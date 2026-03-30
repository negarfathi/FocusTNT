unsigned char __VERIFIER_nondet_uchar();
char __VERIFIER_nondet_char();
int main();
extern void __VERIFIER_error(void);
int main_0();
int main_0() {
  unsigned char c1 = 200;
  char c2 = -100;
  unsigned char ac;
  ac = c1;
  __CPROVER_assume(ac != c2);
  __VERIFIER_error(); // target state
  ac = ac + 1;
}
