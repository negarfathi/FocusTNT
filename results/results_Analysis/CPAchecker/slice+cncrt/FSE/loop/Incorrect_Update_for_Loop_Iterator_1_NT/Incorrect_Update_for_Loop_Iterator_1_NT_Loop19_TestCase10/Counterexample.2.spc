CONTROL AUTOMATON ErrorPath2

INITIAL STATE ARG0;

STATE USEFIRST ARG0 :
    MATCH "" -> GOTO ARG3;
    TRUE -> STOP;

STATE USEFIRST ARG3 :
    MATCH "extern int __VERIFIER_nondet_int(void);" -> GOTO ARG5;
    TRUE -> STOP;

STATE USEFIRST ARG5 :
    MATCH "void main(void)" -> GOTO ARG7;
    TRUE -> STOP;

STATE USEFIRST ARG7 :
    MATCH "" -> GOTO ARG8;
    TRUE -> STOP;

STATE USEFIRST ARG8 :
    MATCH "int __retres;" -> GOTO ARG9;
    TRUE -> STOP;

STATE USEFIRST ARG9 :
    MATCH "int max_msg_size = 128;" -> ASSUME {max_msg_size == (128);} GOTO ARG12;
    TRUE -> STOP;

STATE USEFIRST ARG12 :
    MATCH "int buffer_read_offset = 300;" -> ASSUME {buffer_read_offset == (300);} GOTO ARG13;
    TRUE -> STOP;

STATE USEFIRST ARG13 :
    MATCH "int buffer_bytes_left = 0;" -> ASSUME {buffer_bytes_left == (0);} GOTO ARG14;
    TRUE -> STOP;

STATE USEFIRST ARG14 :
    MATCH "[!(max_msg_size < -1)]" -> ASSUME {max_msg_size == (128);} GOTO ARG23;
    TRUE -> STOP;

STATE USEFIRST ARG23 :
    MATCH "[!(buffer_read_offset <= 0)]" -> ASSUME {buffer_read_offset == (300);} GOTO ARG30;
    TRUE -> STOP;

STATE USEFIRST ARG30 :
    MATCH "[!(buffer_bytes_left < 0)]" -> ASSUME {buffer_bytes_left == (0);} GOTO ARG31;
    TRUE -> STOP;

STATE USEFIRST ARG31 :
    MATCH "" -> GOTO ARG32;
    TRUE -> STOP;

STATE USEFIRST ARG32 :
    MATCH "int size = 64;" -> ASSUME {size == (64);} GOTO ARG33;
    TRUE -> STOP;

STATE USEFIRST ARG33 :
    MATCH "" -> GOTO ARG36;
    TRUE -> STOP;

STATE USEFIRST ARG36 :
    MATCH "[buffer_bytes_left < size / 2]" -> ASSUME {buffer_bytes_left == (0);} GOTO ARG37;
    TRUE -> STOP;

STATE USEFIRST ARG37 :
    MATCH "size *= 2;" -> ASSUME {size == (128);} GOTO ARG38;
    TRUE -> STOP;

STATE USEFIRST ARG38 :
    MATCH "[max_msg_size != -1]" -> ASSUME {max_msg_size == (128);} GOTO ARG39;
    TRUE -> STOP;

STATE USEFIRST ARG39 :
    MATCH "[!(size > max_msg_size)]" -> ASSUME {size == (128);max_msg_size == (128);} GOTO ARG40;
    TRUE -> STOP;

STATE USEFIRST ARG40 :
    MATCH "" -> GOTO ARG41;
    TRUE -> STOP;

STATE USEFIRST ARG41 :
    MATCH "buffer_bytes_left = size - buffer_read_offset;" -> ASSUME {buffer_bytes_left == (-172);} GOTO ARG42;
    TRUE -> STOP;

STATE USEFIRST ARG42 :
    MATCH "" -> GOTO ARG43;
    TRUE -> STOP;

STATE USEFIRST ARG43 :
    MATCH "[buffer_bytes_left < size / 2]" -> ASSUME {buffer_bytes_left == (-172);} GOTO ARG61;
    TRUE -> STOP;

STATE USEFIRST ARG61 :
    MATCH "size *= 2;" -> ASSUME {size == (256);} GOTO ARG65;
    TRUE -> STOP;

STATE USEFIRST ARG65 :
    MATCH "[max_msg_size != -1]" -> ASSUME {max_msg_size == (128);} GOTO ARG67;
    TRUE -> STOP;

STATE USEFIRST ARG67 :
    MATCH "[size > max_msg_size]" -> ASSUME {size == (256);max_msg_size == (128);} GOTO ARG72;
    TRUE -> STOP;

STATE USEFIRST ARG72 :
    MATCH "size = max_msg_size;" -> ASSUME {size == (128);} GOTO ARG75;
    TRUE -> STOP;

STATE USEFIRST ARG75 :
    MATCH "" -> GOTO ARG78;
    TRUE -> STOP;

STATE USEFIRST ARG78 :
    MATCH "buffer_bytes_left = size - buffer_read_offset;" -> ASSUME {buffer_bytes_left == (-172);} GOTO ARG83;
    TRUE -> STOP;

STATE USEFIRST ARG83 :
    MATCH "" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG93 :
    TRUE -> STOP;

END AUTOMATON
