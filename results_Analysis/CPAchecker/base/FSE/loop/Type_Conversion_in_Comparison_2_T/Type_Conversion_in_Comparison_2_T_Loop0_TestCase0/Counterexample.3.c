unsigned char __VERIFIER_nondet_uchar();
char __VERIFIER_nondet_char();
int main();
extern void __VERIFIER_error(void);
int main_0();
int main_0() {
  unsigned char c1;
  c1 = __VERIFIER_nondet_uchar();
  char c2;
  c2 = __VERIFIER_nondet_char();
  unsigned char ac;
  ac = (unsigned char)c1;
  __CPROVER_assume(ac != ((unsigned char)c2));
  __VERIFIER_error(); // target state
  ac = ac + 1;
}
