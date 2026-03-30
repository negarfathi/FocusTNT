int __VERIFIER_nondet_int();
void main();
extern void __VERIFIER_error(void);
void main_0();
void main_0() {
  int __retres;
  int max_msg_size;
  max_msg_size = __VERIFIER_nondet_int();
  int buffer_read_offset;
  buffer_read_offset = __VERIFIER_nondet_int();
  int buffer_bytes_left;
  buffer_bytes_left = __VERIFIER_nondet_int();
  __CPROVER_assume(!(max_msg_size < -1));
  __CPROVER_assume(!(buffer_read_offset <= 0));
  __CPROVER_assume(!(buffer_bytes_left < 0));
  int size = 64;
  __CPROVER_assume(buffer_bytes_left < (size / 2));
  size = size * 2;
  if (max_msg_size != -1) {
    if (size > max_msg_size) {
      size = max_msg_size;
      goto label_3198;
    }

    else {
      goto label_3198;
    }

  }

  else {
    goto label_3198;
  }

  label_3198: ;
  buffer_bytes_left = size - buffer_read_offset;
  __VERIFIER_error(); // target state
}
