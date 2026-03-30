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
  int dval_mv_size;
  dval_mv_size = __VERIFIER_nondet_int();
  __CPROVER_assume(rc == 0);
  __CPROVER_assume(dval_mv_size <= 0);
  __VERIFIER_error(); // target state
}

int mdb_cursor_get_1() {
  int i;
  i = __VERIFIER_nondet_int();
  const int __CPAchecker_TMP_0 = flag;
  flag = flag + 1;
  __CPAchecker_TMP_0;
  if (flag > 1000) {
    return 1;
    goto label_1695;
  }

  else {
    if (i >= 0) {
      return 0;
      goto label_1695;
    }

    else {
      return 1;
      goto label_1695;
    }

  }

  label_1695: ;
}
