int __VERIFIER_nondet_int();
void main();
extern void __VERIFIER_error(void);
void main_0();
void main_0() {
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
