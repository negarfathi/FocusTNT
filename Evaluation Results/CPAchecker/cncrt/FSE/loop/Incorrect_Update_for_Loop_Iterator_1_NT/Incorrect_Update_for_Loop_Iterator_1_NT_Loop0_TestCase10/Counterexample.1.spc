CONTROL AUTOMATON ErrorPath1

INITIAL STATE ARG0;

STATE USEFIRST ARG0 :
    MATCH "" -> GOTO ARG3;
    TRUE -> STOP;

STATE USEFIRST ARG3 :
    MATCH "extern int __VERIFIER_nondet_int(void);" -> GOTO ARG5;
    TRUE -> STOP;

STATE USEFIRST ARG5 :
    MATCH "int main()" -> GOTO ARG7;
    TRUE -> STOP;

STATE USEFIRST ARG7 :
    MATCH "" -> GOTO ARG8;
    TRUE -> STOP;

STATE USEFIRST ARG8 :
    MATCH "int max_msg_size = 128;" -> ASSUME {max_msg_size == (128);} GOTO ARG11;
    TRUE -> STOP;

STATE USEFIRST ARG11 :
    MATCH "int buffer_read_offset = 300;" -> ASSUME {buffer_read_offset == (300);} GOTO ARG12;
    TRUE -> STOP;

STATE USEFIRST ARG12 :
    MATCH "int buffer_bytes_left = 0;" -> ASSUME {buffer_bytes_left == (0);} GOTO ARG13;
    TRUE -> STOP;

STATE USEFIRST ARG13 :
    MATCH "[!(max_msg_size < -1 || buffer_read_offset <= 0 || buffer_bytes_left < 0)]" -> ASSUME {max_msg_size == (128);} GOTO ARG21;
    TRUE -> STOP;

STATE USEFIRST ARG21 :
    MATCH "[!(max_msg_size < -1 || buffer_read_offset <= 0 || buffer_bytes_left < 0)]" -> ASSUME {buffer_read_offset == (300);} GOTO ARG23;
    TRUE -> STOP;

STATE USEFIRST ARG23 :
    MATCH "[!(max_msg_size < -1 || buffer_read_offset <= 0 || buffer_bytes_left < 0)]" -> ASSUME {buffer_bytes_left == (0);} GOTO ARG25;
    TRUE -> STOP;

STATE USEFIRST ARG25 :
    MATCH "int size = 64;" -> ASSUME {size == (64);} GOTO ARG27;
    TRUE -> STOP;

STATE USEFIRST ARG27 :
    MATCH "" -> GOTO ARG34;
    TRUE -> STOP;

STATE USEFIRST ARG34 :
    MATCH "[buffer_bytes_left < size / 2]" -> ASSUME {buffer_bytes_left == (0);} GOTO ARG37;
    TRUE -> STOP;

STATE USEFIRST ARG37 :
    MATCH "size *= 2;" -> ASSUME {size == (128);} GOTO ARG38;
    TRUE -> STOP;

STATE USEFIRST ARG38 :
    MATCH "[max_msg_size != -1 && size > max_msg_size]" -> ASSUME {max_msg_size == (128);} GOTO ARG39;
    TRUE -> STOP;

STATE USEFIRST ARG39 :
    MATCH "[!(max_msg_size != -1 && size > max_msg_size)]" -> ASSUME {size == (128);max_msg_size == (128);} GOTO ARG40;
    TRUE -> STOP;

STATE USEFIRST ARG40 :
    MATCH "buffer_bytes_left = size - buffer_read_offset;" -> ASSUME {buffer_bytes_left == (-172);} GOTO ARG41;
    TRUE -> STOP;

STATE USEFIRST ARG41 :
    MATCH "" -> GOTO ARG42;
    TRUE -> STOP;

STATE USEFIRST ARG42 :
    MATCH "[buffer_bytes_left < size / 2]" -> ASSUME {buffer_bytes_left == (-172);} GOTO ARG60;
    TRUE -> STOP;

STATE USEFIRST ARG60 :
    MATCH "size *= 2;" -> ASSUME {size == (256);} GOTO ARG63;
    TRUE -> STOP;

STATE USEFIRST ARG63 :
    MATCH "[max_msg_size != -1 && size > max_msg_size]" -> ASSUME {max_msg_size == (128);} GOTO ARG66;
    TRUE -> STOP;

STATE USEFIRST ARG66 :
    MATCH "[max_msg_size != -1 && size > max_msg_size]" -> ASSUME {size == (256);max_msg_size == (128);} GOTO ARG71;
    TRUE -> STOP;

STATE USEFIRST ARG71 :
    MATCH "size = max_msg_size;" -> ASSUME {size == (128);} GOTO ARG74;
    TRUE -> STOP;

STATE USEFIRST ARG74 :
    MATCH "" -> GOTO ARG77;
    TRUE -> STOP;

STATE USEFIRST ARG77 :
    MATCH "buffer_bytes_left = size - buffer_read_offset;" -> ASSUME {buffer_bytes_left == (-172);} GOTO ARG83;
    TRUE -> STOP;

STATE USEFIRST ARG83 :
    MATCH "" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG89 :
    TRUE -> STOP;

END AUTOMATON
