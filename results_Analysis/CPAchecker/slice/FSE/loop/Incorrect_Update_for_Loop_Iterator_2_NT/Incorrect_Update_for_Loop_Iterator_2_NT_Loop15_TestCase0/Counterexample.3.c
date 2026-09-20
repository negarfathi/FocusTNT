unsigned char __VERIFIER_nondet_uchar();
void main();
extern void __VERIFIER_error(void);
void main_0();
void main_0() {
  unsigned char l;
  l = __VERIFIER_nondet_uchar();
  unsigned char tmp_1;
  tmp_1 = l;
  l = (unsigned char)(((int)l) - 1);
  __CPROVER_assume(!(tmp_1 == 0));
  unsigned char tmp_0;
  tmp_0 = l;
  l = (unsigned char)(((int)l) - 1);
  __VERIFIER_error(); // target state
}
