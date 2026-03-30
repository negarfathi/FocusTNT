CONTROL AUTOMATON ErrorPath1

INITIAL STATE ARG0;

STATE USEFIRST ARG0 :
    MATCH "" -> GOTO ARG3;
    TRUE -> STOP;

STATE USEFIRST ARG3 :
    MATCH "extern int __VERIFIER_nondet_int(void);" -> GOTO ARG4;
    TRUE -> STOP;

STATE USEFIRST ARG4 :
    MATCH "int main()" -> GOTO ARG6;
    TRUE -> STOP;

STATE USEFIRST ARG6 :
    MATCH "" -> GOTO ARG8;
    TRUE -> STOP;

STATE USEFIRST ARG8 :
    MATCH "int max_msg_size = 256;" -> ASSUME {max_msg_size == (256);} GOTO ARG11;
    TRUE -> STOP;

STATE USEFIRST ARG11 :
    MATCH "int buffer_read_offset = 600;" -> ASSUME {buffer_read_offset == (600);} GOTO ARG12;
    TRUE -> STOP;

STATE USEFIRST ARG12 :
    MATCH "int buffer_bytes_left = 0;" -> ASSUME {buffer_bytes_left == (0);} GOTO ARG13;
    TRUE -> STOP;

STATE USEFIRST ARG13 :
    MATCH "[!(max_msg_size < -1 || buffer_read_offset <= 0 || buffer_bytes_left < 0)]" -> ASSUME {max_msg_size == (256);} GOTO ARG17;
    TRUE -> STOP;

STATE USEFIRST ARG17 :
    MATCH "[!(max_msg_size < -1 || buffer_read_offset <= 0 || buffer_bytes_left < 0)]" -> ASSUME {buffer_read_offset == (600);} GOTO ARG22;
    TRUE -> STOP;

STATE USEFIRST ARG22 :
    MATCH "[!(max_msg_size < -1 || buffer_read_offset <= 0 || buffer_bytes_left < 0)]" -> ASSUME {buffer_bytes_left == (0);} GOTO ARG24;
    TRUE -> STOP;

STATE USEFIRST ARG24 :
    MATCH "int size = 64;" -> ASSUME {size == (64);} GOTO ARG25;
    TRUE -> STOP;

STATE USEFIRST ARG25 :
    MATCH "" -> GOTO ARG34;
    TRUE -> STOP;

STATE USEFIRST ARG34 :
    MATCH "[buffer_bytes_left < size / 2]" -> ASSUME {buffer_bytes_left == (0);} GOTO ARG37;
    TRUE -> STOP;

STATE USEFIRST ARG37 :
    MATCH "size *= 2;" -> ASSUME {size == (128);} GOTO ARG38;
    TRUE -> STOP;

STATE USEFIRST ARG38 :
    MATCH "[max_msg_size != -1 && size > max_msg_size]" -> ASSUME {max_msg_size == (256);} GOTO ARG39;
    TRUE -> STOP;

STATE USEFIRST ARG39 :
    MATCH "[!(max_msg_size != -1 && size > max_msg_size)]" -> ASSUME {size == (128);max_msg_size == (256);} GOTO ARG40;
    TRUE -> STOP;

STATE USEFIRST ARG40 :
    MATCH "buffer_bytes_left = size - buffer_read_offset;" -> ASSUME {buffer_bytes_left == (-472);} GOTO ARG41;
    TRUE -> STOP;

STATE USEFIRST ARG41 :
    MATCH "" -> GOTO ARG42;
    TRUE -> STOP;

STATE USEFIRST ARG42 :
    MATCH "[buffer_bytes_left < size / 2]" -> ASSUME {buffer_bytes_left == (-472);} GOTO ARG64;
    TRUE -> STOP;

STATE USEFIRST ARG64 :
    MATCH "size *= 2;" -> ASSUME {size == (256);} GOTO ARG67;
    TRUE -> STOP;

STATE USEFIRST ARG67 :
    MATCH "[max_msg_size != -1 && size > max_msg_size]" -> ASSUME {max_msg_size == (256);} GOTO ARG73;
    TRUE -> STOP;

STATE USEFIRST ARG73 :
    MATCH "[!(max_msg_size != -1 && size > max_msg_size)]" -> ASSUME {size == (256);max_msg_size == (256);} GOTO ARG75;
    TRUE -> STOP;

STATE USEFIRST ARG75 :
    MATCH "buffer_bytes_left = size - buffer_read_offset;" -> ASSUME {buffer_bytes_left == (-344);} GOTO ARG81;
    TRUE -> STOP;

STATE USEFIRST ARG81 :
    MATCH "" -> GOTO ARG87;
    TRUE -> STOP;

STATE USEFIRST ARG87 :
    MATCH "[buffer_bytes_left < size / 2]" -> ASSUME {buffer_bytes_left == (-344);} GOTO ARG95;
    TRUE -> STOP;

STATE USEFIRST ARG95 :
    MATCH "size *= 2;" -> ASSUME {size == (512);} GOTO ARG98;
    TRUE -> STOP;

STATE USEFIRST ARG98 :
    MATCH "[max_msg_size != -1 && size > max_msg_size]" -> ASSUME {max_msg_size == (256);} GOTO ARG102;
    TRUE -> STOP;

STATE USEFIRST ARG102 :
    MATCH "[max_msg_size != -1 && size > max_msg_size]" -> ASSUME {size == (512);max_msg_size == (256);} GOTO ARG107;
    TRUE -> STOP;

STATE USEFIRST ARG107 :
    MATCH "size = max_msg_size;" -> ASSUME {size == (256);} GOTO ARG108;
    TRUE -> STOP;

STATE USEFIRST ARG108 :
    MATCH "" -> GOTO ARG109;
    TRUE -> STOP;

STATE USEFIRST ARG109 :
    MATCH "buffer_bytes_left = size - buffer_read_offset;" -> ASSUME {buffer_bytes_left == (-344);} GOTO ARG110;
    TRUE -> STOP;

STATE USEFIRST ARG110 :
    MATCH "" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG111 :
    TRUE -> STOP;

END AUTOMATON
