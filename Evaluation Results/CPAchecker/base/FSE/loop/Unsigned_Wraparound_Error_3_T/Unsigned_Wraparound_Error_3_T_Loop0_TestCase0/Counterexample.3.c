unsigned int __VERIFIER_nondet_uint();
int main();
extern void __VERIFIER_error(void);
int main_0();
int main_0() {
  unsigned int pathlen;
  pathlen = __VERIFIER_nondet_uint();
  unsigned int newbufsize;
  newbufsize = __VERIFIER_nondet_uint();
  unsigned int len;
  len = __VERIFIER_nondet_uint();
  __CPROVER_assume(!(((newbufsize + len) + 1) == 4294967295U));
  __CPROVER_assume(!(newbufsize == 0));
  __CPROVER_assume(newbufsize < ((pathlen + len) + 1));
  if (newbufsize >= 2147483648U) {
    newbufsize = 4294967295U;
    goto label_79;
  }

  else {
    newbufsize = newbufsize * 2;
    goto label_79;
  }

  label_79: ;
  __VERIFIER_error(); // target state
}
