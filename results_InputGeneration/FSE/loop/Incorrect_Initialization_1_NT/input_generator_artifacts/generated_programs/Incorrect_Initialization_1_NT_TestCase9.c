#include "stdlib.h"
extern char __VERIFIER_nondet_char(void);
/*
Commit Number: cea58cb6d8fe0d27bfcbab57776bd36d5c724ec3
URL: https://github.com/GNOME/evolution-data-server/commit/cea58cb6d8fe0d27bfcbab57776bd36d5c724ec3
Project Name: evolution-data-server
License: GPL2
termination: false


*/
int strcspn(const char *strSrc, const char *str)
{
    const char *s;
    const char *t = strSrc;
    while (*t != '\0')
    {
        s = str;
        while (*s != '\0')
        {
            if (*t == *s )
            return t-strSrc;
            ++s;
        }
        ++t;
    }
    return 0;
}
int main()
{
    char buf[100] = {'\'','x','0','1','\'',',','\'','x','0','2','\'',',','\'','x','0','3','\'',',','\'','x','0','4','\'',',','\'','x','0','5','\'',',','\'','x','0','6','\'',',','\'','x','0','7','\'',',','\'','x','0','8','\'',',','\'','x','0','9','\'',',','\'','x','0','a','\'',',','\'','x','0','b','\'',',','\'','x','0','c','\'',',','\'','x','0','d','\'',',','\'','x','0','e','\'',',','\'','x','0','f','\'',',','\'','x','0','1','0','\'',',','\'','x','0'};
    for( int i = 0 ; i < 99 ; i++ )
        ;
    buf[99] = '\0';
    char *p = buf;
    while( *p )
    {
        int len = strcspn( p , "\n");
        p += len;
    }
    return 0;

}
