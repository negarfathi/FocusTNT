int __VERIFIER_nondet_int();
void main();
extern void __VERIFIER_error(void);
void main_0();
void main_0() {
  int __retres;
  int x;
  int mat_colSize;
  mat_colSize = __VERIFIER_nondet_int();
  int mat_rowSize;
  mat_rowSize = __VERIFIER_nondet_int();
  __CPROVER_assume(!(mat_colSize < 0));
  __CPROVER_assume(!(mat_rowSize < 0));
  __CPROVER_assume(!(mat_colSize > 65534));
  __CPROVER_assume(!(mat_rowSize > 65534));
  x = 0;
  __CPROVER_assume(x < mat_colSize);
  __VERIFIER_error(); // target state
}
