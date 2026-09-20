int __VERIFIER_nondet_int();
int main();
extern void __VERIFIER_error(void);
int main_0();
int main_0() {
  int nfds = 7;
  int nr = 1000;
  int NR_OPEN = 300;
  __CPROVER_assume(nfds <= nr);
  nfds = nfds * 2;
  __CPROVER_assume(!(nfds > NR_OPEN));
  __CPROVER_assume(nfds <= nr);
  nfds = nfds * 2;
  __CPROVER_assume(!(nfds > NR_OPEN));
  __CPROVER_assume(nfds <= nr);
  nfds = nfds * 2;
  __CPROVER_assume(!(nfds > NR_OPEN));
  __CPROVER_assume(nfds <= nr);
  nfds = nfds * 2;
  __CPROVER_assume(!(nfds > NR_OPEN));
  __CPROVER_assume(nfds <= nr);
  nfds = nfds * 2;
  __CPROVER_assume(!(nfds > NR_OPEN));
  __CPROVER_assume(nfds <= nr);
  nfds = nfds * 2;
  __CPROVER_assume(nfds > NR_OPEN);
  nfds = NR_OPEN;
  __CPROVER_assume(nfds <= nr);
  nfds = nfds * 2;
  __CPROVER_assume(nfds > NR_OPEN);
  nfds = NR_OPEN;
  __VERIFIER_error(); // target state
}
