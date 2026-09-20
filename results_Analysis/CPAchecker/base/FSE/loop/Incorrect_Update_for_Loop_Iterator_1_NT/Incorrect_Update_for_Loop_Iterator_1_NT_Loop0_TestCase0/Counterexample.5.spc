CONTROL AUTOMATON ErrorPath5

INITIAL STATE ARG2;

STATE USEFIRST ARG2 :
    MATCH "" -> GOTO ARG8;
    TRUE -> STOP;

STATE USEFIRST ARG8 :
    MATCH "extern int __VERIFIER_nondet_int(void);" -> GOTO ARG11_1_1;
STATE USEFIRST ARG11_0_1 :
    MATCH "extern int __VERIFIER_nondet_int(void);" -> GOTO ARG11_1_1;
STATE USEFIRST ARG11_1_1 :
    MATCH "int main()" -> GOTO ARG11_2_1;
STATE USEFIRST ARG11_2_1 :
    MATCH "" -> GOTO ARG11_3_1;
STATE USEFIRST ARG11_3_1 :
    MATCH "int max_msg_size = __VERIFIER_nondet_int();" -> GOTO ARG11_4_1;
STATE USEFIRST ARG11_4_1 :
    MATCH "int max_msg_size = __VERIFIER_nondet_int();" -> GOTO ARG11_5_1;
STATE USEFIRST ARG11_5_1 :
    MATCH "int buffer_read_offset = __VERIFIER_nondet_int();" -> GOTO ARG11_6_1;
STATE USEFIRST ARG11_6_1 :
    MATCH "int buffer_read_offset = __VERIFIER_nondet_int();" -> GOTO ARG11_7_1;
STATE USEFIRST ARG11_7_1 :
    MATCH "int buffer_bytes_left = __VERIFIER_nondet_int();" -> GOTO ARG11_8_1;
STATE USEFIRST ARG11_8_1 :
    MATCH "int buffer_bytes_left = __VERIFIER_nondet_int();" -> GOTO ARG11;
    TRUE -> STOP;

STATE USEFIRST ARG11 :
    MATCH "[[!(max_msg_size < -1 || buffer_read_offset <= 0 || buffer_bytes_left < 0)]]" -> GOTO ARG20;
    TRUE -> STOP;

STATE USEFIRST ARG20 :
    MATCH "[[!(max_msg_size < -1 || buffer_read_offset <= 0 || buffer_bytes_left < 0)]]" -> GOTO ARG27;
    TRUE -> STOP;

STATE USEFIRST ARG27 :
    MATCH "[[!(max_msg_size < -1 || buffer_read_offset <= 0 || buffer_bytes_left < 0)]]" -> GOTO ARG35;
    TRUE -> STOP;

STATE USEFIRST ARG35 :
    MATCH "int size = 64;" -> GOTO ARG40;
    TRUE -> STOP;

STATE USEFIRST ARG40 :
    MATCH "" -> GOTO ARG43;
    TRUE -> STOP;

STATE USEFIRST ARG43 :
    MATCH "[[buffer_bytes_left < size / 2]]" -> GOTO ARG2742;
    TRUE -> STOP;

STATE USEFIRST ARG2742 :
    MATCH "size *= 2;" -> GOTO ARG2753;
    TRUE -> STOP;

STATE USEFIRST ARG2753 :
    MATCH "[[max_msg_size != -1 && size > max_msg_size]]" -> GOTO ARG2758;
    MATCH "[[!(max_msg_size != -1 && size > max_msg_size)]]" -> GOTO ARG2783;
    TRUE -> STOP;

STATE USEFIRST ARG2758 :
    MATCH "[[max_msg_size != -1 && size > max_msg_size]]" -> GOTO ARG2766;
    MATCH "[[!(max_msg_size != -1 && size > max_msg_size)]]" -> GOTO ARG2783;
    TRUE -> STOP;

STATE USEFIRST ARG2766 :
    MATCH "size = max_msg_size;" -> GOTO ARG2778;
    TRUE -> STOP;

STATE USEFIRST ARG2778 :
    MATCH "" -> GOTO ARG2783;
    TRUE -> STOP;

STATE USEFIRST ARG2783 :
    MATCH "buffer_bytes_left = size - buffer_read_offset;" -> GOTO ARG2788;
    TRUE -> STOP;

STATE USEFIRST ARG2788 :
    MATCH "" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG3004 :
    TRUE -> STOP;

END AUTOMATON
