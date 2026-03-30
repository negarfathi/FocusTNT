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
    MATCH "int max_msg_size = 500;" -> ASSUME {max_msg_size == (500);} GOTO ARG12;
    TRUE -> STOP;

STATE USEFIRST ARG12 :
    MATCH "int buffer_read_offset = 1000;" -> ASSUME {buffer_read_offset == (1000);} GOTO ARG13;
    TRUE -> STOP;

STATE USEFIRST ARG13 :
    MATCH "int buffer_bytes_left = 0;" -> ASSUME {buffer_bytes_left == (0);} GOTO ARG14;
    TRUE -> STOP;

STATE USEFIRST ARG14 :
    MATCH "[!(max_msg_size < -1)]" -> ASSUME {max_msg_size == (500);} GOTO ARG19;
    TRUE -> STOP;

STATE USEFIRST ARG19 :
    MATCH "[!(buffer_read_offset <= 0)]" -> ASSUME {buffer_read_offset == (1000);} GOTO ARG24;
    TRUE -> STOP;

STATE USEFIRST ARG24 :
    MATCH "[!(buffer_bytes_left < 0)]" -> ASSUME {buffer_bytes_left == (0);} GOTO ARG30;
    TRUE -> STOP;

STATE USEFIRST ARG30 :
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
    MATCH "[max_msg_size != -1]" -> ASSUME {max_msg_size == (500);} GOTO ARG39;
    TRUE -> STOP;

STATE USEFIRST ARG39 :
    MATCH "[!(size > max_msg_size)]" -> ASSUME {size == (128);max_msg_size == (500);} GOTO ARG40;
    TRUE -> STOP;

STATE USEFIRST ARG40 :
    MATCH "" -> GOTO ARG41;
    TRUE -> STOP;

STATE USEFIRST ARG41 :
    MATCH "buffer_bytes_left = size - buffer_read_offset;" -> ASSUME {buffer_bytes_left == (-872);} GOTO ARG42;
    TRUE -> STOP;

STATE USEFIRST ARG42 :
    MATCH "" -> GOTO ARG43;
    TRUE -> STOP;

STATE USEFIRST ARG43 :
    MATCH "[buffer_bytes_left < size / 2]" -> ASSUME {buffer_bytes_left == (-872);} GOTO ARG61;
    TRUE -> STOP;

STATE USEFIRST ARG61 :
    MATCH "size *= 2;" -> ASSUME {size == (256);} GOTO ARG66;
    TRUE -> STOP;

STATE USEFIRST ARG66 :
    MATCH "[max_msg_size != -1]" -> ASSUME {max_msg_size == (500);} GOTO ARG70;
    TRUE -> STOP;

STATE USEFIRST ARG70 :
    MATCH "[!(size > max_msg_size)]" -> ASSUME {size == (256);max_msg_size == (500);} GOTO ARG74;
    TRUE -> STOP;

STATE USEFIRST ARG74 :
    MATCH "" -> GOTO ARG77;
    TRUE -> STOP;

STATE USEFIRST ARG77 :
    MATCH "buffer_bytes_left = size - buffer_read_offset;" -> ASSUME {buffer_bytes_left == (-744);} GOTO ARG86;
    TRUE -> STOP;

STATE USEFIRST ARG86 :
    MATCH "" -> GOTO ARG93;
    TRUE -> STOP;

STATE USEFIRST ARG93 :
    MATCH "[buffer_bytes_left < size / 2]" -> ASSUME {buffer_bytes_left == (-744);} GOTO ARG100;
    TRUE -> STOP;

STATE USEFIRST ARG100 :
    MATCH "size *= 2;" -> ASSUME {size == (512);} GOTO ARG102;
    TRUE -> STOP;

STATE USEFIRST ARG102 :
    MATCH "[max_msg_size != -1]" -> ASSUME {max_msg_size == (500);} GOTO ARG106;
    TRUE -> STOP;

STATE USEFIRST ARG106 :
    MATCH "[size > max_msg_size]" -> ASSUME {size == (512);max_msg_size == (500);} GOTO ARG112;
    TRUE -> STOP;

STATE USEFIRST ARG112 :
    MATCH "size = max_msg_size;" -> ASSUME {size == (500);} GOTO ARG114;
    TRUE -> STOP;

STATE USEFIRST ARG114 :
    MATCH "" -> GOTO ARG115;
    TRUE -> STOP;

STATE USEFIRST ARG115 :
    MATCH "buffer_bytes_left = size - buffer_read_offset;" -> ASSUME {buffer_bytes_left == (-500);} GOTO ARG116;
    TRUE -> STOP;

STATE USEFIRST ARG116 :
    MATCH "" -> GOTO ARG117;
    TRUE -> STOP;

STATE USEFIRST ARG117 :
    MATCH "[buffer_bytes_left < size / 2]" -> ASSUME {buffer_bytes_left == (-500);} GOTO ARG118;
    TRUE -> STOP;

STATE USEFIRST ARG118 :
    MATCH "size *= 2;" -> ASSUME {size == (1000);} GOTO ARG119;
    TRUE -> STOP;

STATE USEFIRST ARG119 :
    MATCH "[max_msg_size != -1]" -> ASSUME {max_msg_size == (500);} GOTO ARG120;
    TRUE -> STOP;

STATE USEFIRST ARG120 :
    MATCH "[size > max_msg_size]" -> ASSUME {size == (1000);max_msg_size == (500);} GOTO ARG121;
    TRUE -> STOP;

STATE USEFIRST ARG121 :
    MATCH "size = max_msg_size;" -> ASSUME {size == (500);} GOTO ARG122;
    TRUE -> STOP;

STATE USEFIRST ARG122 :
    MATCH "" -> GOTO ARG123;
    TRUE -> STOP;

STATE USEFIRST ARG123 :
    MATCH "buffer_bytes_left = size - buffer_read_offset;" -> ASSUME {buffer_bytes_left == (-500);} GOTO ARG130;
    TRUE -> STOP;

STATE USEFIRST ARG130 :
    MATCH "" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG132 :
    TRUE -> STOP;

END AUTOMATON
