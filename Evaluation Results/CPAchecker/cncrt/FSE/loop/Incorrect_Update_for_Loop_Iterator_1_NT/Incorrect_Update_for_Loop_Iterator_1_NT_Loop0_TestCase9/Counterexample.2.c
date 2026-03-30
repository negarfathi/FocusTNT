int __VERIFIER_nondet_int();
int main();
extern void __VERIFIER_error(void);
int main_0();
int main_0() {
  int max_msg_size = 200;
  int buffer_read_offset = 500;
  int buffer_bytes_left = 0;
  __CPROVER_assume(!(max_msg_size < -1));
  __CPROVER_assume(!(buffer_read_offset <= 0));
  __CPROVER_assume(!(buffer_bytes_left < 0));
  int size = 64;
  __CPROVER_assume(buffer_bytes_left < (size / 2));
  size = size * 2;
  __CPROVER_assume(max_msg_size != -1);
  __CPROVER_assume(!(size > max_msg_size));
  buffer_bytes_left = size - buffer_read_offset;
  __CPROVER_assume(buffer_bytes_left < (size / 2));
  size = size * 2;
  __CPROVER_assume(max_msg_size != -1);
  __CPROVER_assume(size > max_msg_size);
  size = max_msg_size;
  buffer_bytes_left = size - buffer_read_offset;
  __CPROVER_assume(buffer_bytes_left < (size / 2));
  size = size * 2;
  __CPROVER_assume(max_msg_size != -1);
  __CPROVER_assume(size > max_msg_size);
  size = max_msg_size;
  buffer_bytes_left = size - buffer_read_offset;
  __VERIFIER_error(); // target state
}
