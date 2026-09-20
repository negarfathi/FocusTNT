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
    MATCH "int max_msg_size = 500;" -> ASSUME {max_msg_size == (500);} GOTO ARG11;
    TRUE -> STOP;

STATE USEFIRST ARG11 :
    MATCH "int buffer_read_offset = 1000;" -> ASSUME {buffer_read_offset == (1000);} GOTO ARG12;
    TRUE -> STOP;

STATE USEFIRST ARG12 :
    MATCH "int buffer_bytes_left = 0;" -> ASSUME {buffer_bytes_left == (0);} GOTO ARG13;
    TRUE -> STOP;

STATE USEFIRST ARG13 :
    MATCH "[!(max_msg_size < -1 || buffer_read_offset <= 0 || buffer_bytes_left < 0)]" -> ASSUME {max_msg_size == (500);} GOTO ARG21;
    TRUE -> STOP;

STATE USEFIRST ARG21 :
    MATCH "[!(max_msg_size < -1 || buffer_read_offset <= 0 || buffer_bytes_left < 0)]" -> ASSUME {buffer_read_offset == (1000);} GOTO ARG23;
    TRUE -> STOP;

STATE USEFIRST ARG23 :
    MATCH "[!(max_msg_size < -1 || buffer_read_offset <= 0 || buffer_bytes_left < 0)]" -> ASSUME {buffer_bytes_left == (0);} GOTO ARG26;
    TRUE -> STOP;

STATE USEFIRST ARG26 :
    MATCH "int size = 64;" -> ASSUME {size == (64);} GOTO ARG31;
    TRUE -> STOP;

STATE USEFIRST ARG31 :
    MATCH "" -> GOTO ARG36;
    TRUE -> STOP;

STATE USEFIRST ARG36 :
    MATCH "[buffer_bytes_left < size / 2]" -> ASSUME {buffer_bytes_left == (0);} GOTO ARG37;
    TRUE -> STOP;

STATE USEFIRST ARG37 :
    MATCH "size *= 2;" -> ASSUME {size == (128);} GOTO ARG38;
    TRUE -> STOP;

STATE USEFIRST ARG38 :
    MATCH "[max_msg_size != -1 && size > max_msg_size]" -> ASSUME {max_msg_size == (500);} GOTO ARG39;
    TRUE -> STOP;

STATE USEFIRST ARG39 :
    MATCH "[!(max_msg_size != -1 && size > max_msg_size)]" -> ASSUME {size == (128);max_msg_size == (500);} GOTO ARG40;
    TRUE -> STOP;

STATE USEFIRST ARG40 :
    MATCH "buffer_bytes_left = size - buffer_read_offset;" -> ASSUME {buffer_bytes_left == (-872);} GOTO ARG41;
    TRUE -> STOP;

STATE USEFIRST ARG41 :
    MATCH "" -> GOTO ARG42;
    TRUE -> STOP;

STATE USEFIRST ARG42 :
    MATCH "[buffer_bytes_left < size / 2]" -> ASSUME {buffer_bytes_left == (-872);} GOTO ARG58;
    TRUE -> STOP;

STATE USEFIRST ARG58 :
    MATCH "size *= 2;" -> ASSUME {size == (256);} GOTO ARG61;
    TRUE -> STOP;

STATE USEFIRST ARG61 :
    MATCH "[max_msg_size != -1 && size > max_msg_size]" -> ASSUME {max_msg_size == (500);} GOTO ARG64;
    TRUE -> STOP;

STATE USEFIRST ARG64 :
    MATCH "[!(max_msg_size != -1 && size > max_msg_size)]" -> ASSUME {size == (256);max_msg_size == (500);} GOTO ARG67;
    TRUE -> STOP;

STATE USEFIRST ARG67 :
    MATCH "buffer_bytes_left = size - buffer_read_offset;" -> ASSUME {buffer_bytes_left == (-744);} GOTO ARG72;
    TRUE -> STOP;

STATE USEFIRST ARG72 :
    MATCH "" -> GOTO ARG77;
    TRUE -> STOP;

STATE USEFIRST ARG77 :
    MATCH "[buffer_bytes_left < size / 2]" -> ASSUME {buffer_bytes_left == (-744);} GOTO ARG87;
    TRUE -> STOP;

STATE USEFIRST ARG87 :
    MATCH "size *= 2;" -> ASSUME {size == (512);} GOTO ARG89;
    TRUE -> STOP;

STATE USEFIRST ARG89 :
    MATCH "[max_msg_size != -1 && size > max_msg_size]" -> ASSUME {max_msg_size == (500);} GOTO ARG92;
    TRUE -> STOP;

STATE USEFIRST ARG92 :
    MATCH "[max_msg_size != -1 && size > max_msg_size]" -> ASSUME {size == (512);max_msg_size == (500);} GOTO ARG97;
    TRUE -> STOP;

STATE USEFIRST ARG97 :
    MATCH "size = max_msg_size;" -> ASSUME {size == (500);} GOTO ARG98;
    TRUE -> STOP;

STATE USEFIRST ARG98 :
    MATCH "" -> GOTO ARG100;
    TRUE -> STOP;

STATE USEFIRST ARG100 :
    MATCH "buffer_bytes_left = size - buffer_read_offset;" -> ASSUME {buffer_bytes_left == (-500);} GOTO ARG104;
    TRUE -> STOP;

STATE USEFIRST ARG104 :
    MATCH "" -> GOTO ARG110;
    TRUE -> STOP;

STATE USEFIRST ARG110 :
    MATCH "[buffer_bytes_left < size / 2]" -> ASSUME {buffer_bytes_left == (-500);} GOTO ARG112;
    TRUE -> STOP;

STATE USEFIRST ARG112 :
    MATCH "size *= 2;" -> ASSUME {size == (1000);} GOTO ARG113;
    TRUE -> STOP;

STATE USEFIRST ARG113 :
    MATCH "[max_msg_size != -1 && size > max_msg_size]" -> ASSUME {max_msg_size == (500);} GOTO ARG114;
    TRUE -> STOP;

STATE USEFIRST ARG114 :
    MATCH "[max_msg_size != -1 && size > max_msg_size]" -> ASSUME {size == (1000);max_msg_size == (500);} GOTO ARG115;
    TRUE -> STOP;

STATE USEFIRST ARG115 :
    MATCH "size = max_msg_size;" -> ASSUME {size == (500);} GOTO ARG116;
    TRUE -> STOP;

STATE USEFIRST ARG116 :
    MATCH "" -> GOTO ARG117;
    TRUE -> STOP;

STATE USEFIRST ARG117 :
    MATCH "buffer_bytes_left = size - buffer_read_offset;" -> ASSUME {buffer_bytes_left == (-500);} GOTO ARG125;
    TRUE -> STOP;

STATE USEFIRST ARG125 :
    MATCH "" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG126 :
    TRUE -> STOP;

END AUTOMATON
