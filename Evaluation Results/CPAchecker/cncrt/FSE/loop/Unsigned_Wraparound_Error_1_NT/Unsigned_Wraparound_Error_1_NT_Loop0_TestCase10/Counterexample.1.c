unsigned int __VERIFIER_nondet_uint();
int main();
extern void __VERIFIER_error(void);
int main_0();
int main_0() {
  unsigned int best = 2147483648L;
  unsigned int pre;
  unsigned int cur;
  unsigned int st_max = 4294967295L;
  unsigned int it_min = 0;
  __CPROVER_assume(!(st_max <= it_min));
  __CPROVER_assume(!(best == 0));
  cur = best;
  __CPROVER_assume(!(st_max < cur));
  __CPROVER_assume(!(it_min > cur));
  cur = cur + best;
  __CPROVER_assume(!(st_max < cur));
  __CPROVER_assume(!(it_min > cur));
  __VERIFIER_error(); // target state
  cur = cur + best;
}
