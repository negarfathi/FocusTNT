int __VERIFIER_nondet_int();
void main();
extern void __VERIFIER_error(void);
void main_0();
void main_0() {
  int nfds;
  nfds = __VERIFIER_nondet_int();
  int nr;
  nr = __VERIFIER_nondet_int();
  int NR_OPEN;
  NR_OPEN = __VERIFIER_nondet_int();
  __CPROVER_assume(nfds <= nr);
  nfds = nfds * 2;
  __CPROVER_assume(!(nfds > NR_OPEN));
  __VERIFIER_error(); // target state
}
