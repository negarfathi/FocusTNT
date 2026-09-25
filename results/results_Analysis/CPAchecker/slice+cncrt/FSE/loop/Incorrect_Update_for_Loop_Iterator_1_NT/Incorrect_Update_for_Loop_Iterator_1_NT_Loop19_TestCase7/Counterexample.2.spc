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
    MATCH "int max_msg_size = 1024;" -> ASSUME {max_msg_size == (1024);} GOTO ARG12;
    TRUE -> STOP;

STATE USEFIRST ARG12 :
    MATCH "int buffer_read_offset = 900;" -> ASSUME {buffer_read_offset == (900);} GOTO ARG13;
    TRUE -> STOP;

STATE USEFIRST ARG13 :
    MATCH "int buffer_bytes_left = 0;" -> ASSUME {buffer_bytes_left == (0);} GOTO ARG14;
    TRUE -> STOP;

STATE USEFIRST ARG14 :
    MATCH "[!(max_msg_size < -1)]" -> ASSUME {max_msg_size == (1024);} GOTO ARG19;
    TRUE -> STOP;

STATE USEFIRST ARG19 :
    MATCH "[!(buffer_read_offset <= 0)]" -> ASSUME {buffer_read_offset == (900);} GOTO ARG24;
    TRUE -> STOP;

STATE USEFIRST ARG24 :
    MATCH "[!(buffer_bytes_left < 0)]" -> ASSUME {buffer_bytes_left == (0);} GOTO ARG29;
    TRUE -> STOP;

STATE USEFIRST ARG29 :
    MATCH "" -> GOTO ARG30;
    TRUE -> STOP;

STATE USEFIRST ARG30 :
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
    MATCH "[max_msg_size != -1]" -> ASSUME {max_msg_size == (1024);} GOTO ARG39;
    TRUE -> STOP;

STATE USEFIRST ARG39 :
    MATCH "[!(size > max_msg_size)]" -> ASSUME {size == (128);max_msg_size == (1024);} GOTO ARG40;
    TRUE -> STOP;

STATE USEFIRST ARG40 :
    MATCH "" -> GOTO ARG41;
    TRUE -> STOP;

STATE USEFIRST ARG41 :
    MATCH "buffer_bytes_left = size - buffer_read_offset;" -> ASSUME {buffer_bytes_left == (-772);} GOTO ARG42;
    TRUE -> STOP;

STATE USEFIRST ARG42 :
    MATCH "" -> GOTO ARG43;
    TRUE -> STOP;

STATE USEFIRST ARG43 :
    MATCH "[buffer_bytes_left < size / 2]" -> ASSUME {buffer_bytes_left == (-772);} GOTO ARG61;
    TRUE -> STOP;

STATE USEFIRST ARG61 :
    MATCH "size *= 2;" -> ASSUME {size == (256);} GOTO ARG63;
    TRUE -> STOP;

STATE USEFIRST ARG63 :
    MATCH "[max_msg_size != -1]" -> ASSUME {max_msg_size == (1024);} GOTO ARG67;
    TRUE -> STOP;

STATE USEFIRST ARG67 :
    MATCH "[!(size > max_msg_size)]" -> ASSUME {size == (256);max_msg_size == (1024);} GOTO ARG72;
    TRUE -> STOP;

STATE USEFIRST ARG72 :
    MATCH "" -> GOTO ARG73;
    TRUE -> STOP;

STATE USEFIRST ARG73 :
    MATCH "buffer_bytes_left = size - buffer_read_offset;" -> ASSUME {buffer_bytes_left == (-644);} GOTO ARG78;
    TRUE -> STOP;

STATE USEFIRST ARG78 :
    MATCH "" -> GOTO ARG90;
    TRUE -> STOP;

STATE USEFIRST ARG90 :
    MATCH "[buffer_bytes_left < size / 2]" -> ASSUME {buffer_bytes_left == (-644);} GOTO ARG100;
    TRUE -> STOP;

STATE USEFIRST ARG100 :
    MATCH "size *= 2;" -> ASSUME {size == (512);} GOTO ARG102;
    TRUE -> STOP;

STATE USEFIRST ARG102 :
    MATCH "[max_msg_size != -1]" -> ASSUME {max_msg_size == (1024);} GOTO ARG109;
    TRUE -> STOP;

STATE USEFIRST ARG109 :
    MATCH "[!(size > max_msg_size)]" -> ASSUME {size == (512);max_msg_size == (1024);} GOTO ARG113;
    TRUE -> STOP;

STATE USEFIRST ARG113 :
    MATCH "" -> GOTO ARG114;
    TRUE -> STOP;

STATE USEFIRST ARG114 :
    MATCH "buffer_bytes_left = size - buffer_read_offset;" -> ASSUME {buffer_bytes_left == (-388);} GOTO ARG115;
    TRUE -> STOP;

STATE USEFIRST ARG115 :
    MATCH "" -> GOTO ARG116;
    TRUE -> STOP;

STATE USEFIRST ARG116 :
    MATCH "[buffer_bytes_left < size / 2]" -> ASSUME {buffer_bytes_left == (-388);} GOTO ARG117;
    TRUE -> STOP;

STATE USEFIRST ARG117 :
    MATCH "size *= 2;" -> ASSUME {size == (1024);} GOTO ARG118;
    TRUE -> STOP;

STATE USEFIRST ARG118 :
    MATCH "[max_msg_size != -1]" -> ASSUME {max_msg_size == (1024);} GOTO ARG119;
    TRUE -> STOP;

STATE USEFIRST ARG119 :
    MATCH "[!(size > max_msg_size)]" -> ASSUME {size == (1024);max_msg_size == (1024);} GOTO ARG120;
    TRUE -> STOP;

STATE USEFIRST ARG120 :
    MATCH "" -> GOTO ARG126;
    TRUE -> STOP;

STATE USEFIRST ARG126 :
    MATCH "buffer_bytes_left = size - buffer_read_offset;" -> ASSUME {buffer_bytes_left == (124);} GOTO ARG128;
    TRUE -> STOP;

STATE USEFIRST ARG128 :
    MATCH "" -> GOTO ARG130;
    TRUE -> STOP;

STATE USEFIRST ARG130 :
    MATCH "[buffer_bytes_left < size / 2]" -> ASSUME {buffer_bytes_left == (124);} GOTO ARG131;
    TRUE -> STOP;

STATE USEFIRST ARG131 :
    MATCH "size *= 2;" -> ASSUME {size == (2048);} GOTO ARG132;
    TRUE -> STOP;

STATE USEFIRST ARG132 :
    MATCH "[max_msg_size != -1]" -> ASSUME {max_msg_size == (1024);} GOTO ARG133;
    TRUE -> STOP;

STATE USEFIRST ARG133 :
    MATCH "[size > max_msg_size]" -> ASSUME {size == (2048);max_msg_size == (1024);} GOTO ARG134;
    TRUE -> STOP;

STATE USEFIRST ARG134 :
    MATCH "size = max_msg_size;" -> ASSUME {size == (1024);} GOTO ARG135;
    TRUE -> STOP;

STATE USEFIRST ARG135 :
    MATCH "" -> GOTO ARG136;
    TRUE -> STOP;

STATE USEFIRST ARG136 :
    MATCH "buffer_bytes_left = size - buffer_read_offset;" -> ASSUME {buffer_bytes_left == (124);} GOTO ARG137;
    TRUE -> STOP;

STATE USEFIRST ARG137 :
    MATCH "" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG138 :
    TRUE -> STOP;

END AUTOMATON
