CONTROL AUTOMATON ErrorPath5

INITIAL STATE ARG2;

STATE USEFIRST ARG2 :
    MATCH "" -> GOTO ARG6;
    TRUE -> STOP;

STATE USEFIRST ARG6 :
    MATCH "extern int __VERIFIER_nondet_int(void);" -> GOTO ARG12_1_1;
STATE USEFIRST ARG12_0_1 :
    MATCH "extern int __VERIFIER_nondet_int(void);" -> GOTO ARG12_1_1;
STATE USEFIRST ARG12_1_1 :
    MATCH "void main(void)" -> GOTO ARG12_2_1;
STATE USEFIRST ARG12_2_1 :
    MATCH "" -> GOTO ARG12_3_1;
STATE USEFIRST ARG12_3_1 :
    MATCH "int __retres;" -> GOTO ARG12_4_1;
STATE USEFIRST ARG12_4_1 :
    MATCH "int max_msg_size = __VERIFIER_nondet_int();" -> GOTO ARG12_5_1;
STATE USEFIRST ARG12_5_1 :
    MATCH "int max_msg_size = __VERIFIER_nondet_int();" -> GOTO ARG12_6_1;
STATE USEFIRST ARG12_6_1 :
    MATCH "int buffer_read_offset = __VERIFIER_nondet_int();" -> GOTO ARG12_7_1;
STATE USEFIRST ARG12_7_1 :
    MATCH "int buffer_read_offset = __VERIFIER_nondet_int();" -> GOTO ARG12_8_1;
STATE USEFIRST ARG12_8_1 :
    MATCH "int buffer_bytes_left = __VERIFIER_nondet_int();" -> GOTO ARG12_9_1;
STATE USEFIRST ARG12_9_1 :
    MATCH "int buffer_bytes_left = __VERIFIER_nondet_int();" -> GOTO ARG12;
    TRUE -> STOP;

STATE USEFIRST ARG12 :
    MATCH "[[!(max_msg_size < -1)]]" -> GOTO ARG21;
    TRUE -> STOP;

STATE USEFIRST ARG21 :
    MATCH "[[!(buffer_read_offset <= 0)]]" -> GOTO ARG27;
    TRUE -> STOP;

STATE USEFIRST ARG27 :
    MATCH "[[!(buffer_bytes_left < 0)]]" -> GOTO ARG31;
    TRUE -> STOP;

STATE USEFIRST ARG31 :
    MATCH "" -> GOTO ARG35_1_2;
STATE USEFIRST ARG35_0_2 :
    MATCH "" -> GOTO ARG35_1_2;
STATE USEFIRST ARG35_1_2 :
    MATCH "int size = 64;" -> GOTO ARG35;
    TRUE -> STOP;

STATE USEFIRST ARG35 :
    MATCH "" -> GOTO ARG41;
    TRUE -> STOP;

STATE USEFIRST ARG41 :
    MATCH "[[buffer_bytes_left < size / 2]]" -> GOTO ARG3153;
    TRUE -> STOP;

STATE USEFIRST ARG3153 :
    MATCH "size *= 2;" -> GOTO ARG3166;
    TRUE -> STOP;

STATE USEFIRST ARG3166 :
    MATCH "[[max_msg_size != -1]]" -> GOTO ARG3171;
    MATCH "[[!(max_msg_size != -1)]]" -> GOTO ARG3198;
    TRUE -> STOP;

STATE USEFIRST ARG3171 :
    MATCH "[[size > max_msg_size]]" -> GOTO ARG3179;
    MATCH "[[!(size > max_msg_size)]]" -> GOTO ARG3180;
    TRUE -> STOP;

STATE USEFIRST ARG3179 :
    MATCH "size = max_msg_size;" -> GOTO ARG3193;
    TRUE -> STOP;

STATE USEFIRST ARG3180 :
    MATCH "" -> GOTO ARG3198;
    TRUE -> STOP;

STATE USEFIRST ARG3193 :
    MATCH "" -> GOTO ARG3198;
    TRUE -> STOP;

STATE USEFIRST ARG3198 :
    MATCH "buffer_bytes_left = size - buffer_read_offset;" -> GOTO ARG3204;
    TRUE -> STOP;

STATE USEFIRST ARG3204 :
    MATCH "" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG3436 :
    TRUE -> STOP;

END AUTOMATON
