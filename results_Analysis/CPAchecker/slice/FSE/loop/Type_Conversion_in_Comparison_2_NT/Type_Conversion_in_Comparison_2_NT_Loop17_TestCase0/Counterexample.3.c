unsigned char __VERIFIER_nondet_uchar();
char __VERIFIER_nondet_char();
void main();
extern void __VERIFIER_error(void);
void main_0();
void main_0() {
  unsigned char ac;
  unsigned char c1;
  c1 = __VERIFIER_nondet_uchar();
  char c2;
  c2 = __VERIFIER_nondet_char();
  ac = c1;
  __CPROVER_assume(((int)ac) != ((int)c2));
  ac = (unsigned char)(((int)ac) + 1);
  __VERIFIER_error(); // target state
}
