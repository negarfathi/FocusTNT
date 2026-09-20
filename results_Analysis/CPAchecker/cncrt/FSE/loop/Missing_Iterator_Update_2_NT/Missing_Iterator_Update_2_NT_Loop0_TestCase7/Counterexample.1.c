int __VERIFIER_nondet_int();
int flag = 0;
int mdb_cursor_get();
int main();
extern void __VERIFIER_error(void);
int main_0();
int mdb_cursor_get_1();
int main_0() {
  int rc;
  rc = mdb_cursor_get_1();
  int dval_mv_size = -1;
  __CPROVER_assume(rc == 0);
  __CPROVER_assume(dval_mv_size <= 0);
  __VERIFIER_error(); // target state
}

int mdb_cursor_get_1() {
  int i = 1;
  const int __CPAchecker_TMP_0 = flag;
  flag = flag + 1;
  __CPAchecker_TMP_0;
  __CPROVER_assume(!(flag > 1000));
  __CPROVER_assume(i >= 0);
  return 0;
}
