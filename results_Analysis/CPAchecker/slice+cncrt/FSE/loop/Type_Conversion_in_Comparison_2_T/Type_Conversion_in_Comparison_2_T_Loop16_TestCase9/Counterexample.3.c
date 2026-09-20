unsigned char __VERIFIER_nondet_uchar();
char __VERIFIER_nondet_char();
void main();
extern void __VERIFIER_error(void);
void main_0();
void main_0() {
  unsigned char ac;
  unsigned char c1 = 100;
  char c2 = -10;
  ac = c1;
  __CPROVER_assume(((int)ac) != ((int)((unsigned char)c2)));
  ac = (unsigned char)(((int)ac) + 1);
  __VERIFIER_error(); // target state
}
