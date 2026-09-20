unsigned int __VERIFIER_nondet_uint();
void main();
extern void __VERIFIER_error(void);
void main_0();
void main_0() {
  unsigned int cur;
  unsigned int best = 2147483648L;
  unsigned int st_max = 4294967295L;
  unsigned int it_min = 0;
  __CPROVER_assume(!(st_max <= it_min));
  __CPROVER_assume(!(best == 0U));
  cur = best;
  __CPROVER_assume(!(st_max < cur));
  cur = cur + best;
  __CPROVER_assume(!(st_max < cur));
  cur = cur + best;
  __VERIFIER_error(); // target state
}
