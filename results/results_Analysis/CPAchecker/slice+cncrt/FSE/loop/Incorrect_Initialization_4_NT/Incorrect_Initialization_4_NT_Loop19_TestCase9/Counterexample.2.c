int __VERIFIER_nondet_int();
int main();
extern void __VERIFIER_error(void);
int main_0();
int main_0() {
  int h = 18;
  int hash = 21;
  int rehash = 6;
  __CPROVER_assume(!(h < 0));
  __CPROVER_assume(!(hash <= 0));
  __CPROVER_assume(!(rehash <= 0));
  __CPROVER_assume(!(rehash > hash));
  int i = h % hash;
  int r;
  __CPROVER_assume(i < hash);
  __CPROVER_assume(!(r == 0));
  i = i + r;
  __CPROVER_assume(i < hash);
  __CPROVER_assume(!(r == 0));
  i = i + r;
  __VERIFIER_error(); // target state
}
