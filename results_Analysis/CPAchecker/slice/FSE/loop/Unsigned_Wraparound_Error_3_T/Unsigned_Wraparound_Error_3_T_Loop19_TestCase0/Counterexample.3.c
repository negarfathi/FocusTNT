unsigned int __VERIFIER_nondet_uint();
void main();
extern void __VERIFIER_error(void);
void main_0();
void main_0() {
  int __retres;
  unsigned int pathlen;
  pathlen = __VERIFIER_nondet_uint();
  unsigned int newbufsize;
  newbufsize = __VERIFIER_nondet_uint();
  unsigned int len;
  len = __VERIFIER_nondet_uint();
  __CPROVER_assume(!(((newbufsize + len) + 1U) == 4294967295U));
  __CPROVER_assume(!(newbufsize == 0U));
  __CPROVER_assume(newbufsize < ((pathlen + len) + 1U));
  if (newbufsize >= 2147483648U) {
    newbufsize = 4294967295U;
    goto label_87;
  }

  else {
    newbufsize = newbufsize * 2U;
    goto label_87;
  }

  label_87: ;
  __VERIFIER_error(); // target state
}
