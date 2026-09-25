int __VERIFIER_nondet_int();
int flag = 0;
int mdb_cursor_get_slice_1();
void main();
extern void __VERIFIER_error(void);
void main_0();
int mdb_cursor_get_slice_1_1();
void main_0() {
  int rc;
  rc = mdb_cursor_get_slice_1_1();
  int dval_mv_size = -10;
  __CPROVER_assume(rc == 0);
  __CPROVER_assume(dval_mv_size <= 0);
  __VERIFIER_error(); // target state
}

int mdb_cursor_get_slice_1_1() {
  int __retres;
  int i = 100;
  const int __CPAchecker_TMP_0 = flag;
  flag = flag + 1;
  __CPAchecker_TMP_0;
  __CPROVER_assume(!(flag > 1000));
  __CPROVER_assume(i >= 0);
  __retres = 0;
  return __retres;
}
