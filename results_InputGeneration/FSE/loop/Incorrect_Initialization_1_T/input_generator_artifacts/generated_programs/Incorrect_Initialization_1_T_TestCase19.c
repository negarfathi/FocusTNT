#include "stdlib.h"
extern char __VERIFIER_nondet_char(void);
/*
Commit Number: cea58cb6d8fe0d27bfcbab57776bd36d5c724ec3
URL: https://github.com/GNOME/evolution-data-server/commit/cea58cb6d8fe0d27bfcbab57776bd36d5c724ec3
Project Name: evolution-data-server
License: GPL2
termination: TRUE

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
    char buf[100] = {'H','e','l','l','o','W','o','r','l','d','0','1','0','2','0','3','0','4','!','!','!','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9','!','@','#','$','%','^','&','*','(','0','-','_','=','+','[',']','Z'};
    for( int i = 0 ; i < 99 ; i++ )
        ;
    buf[99] = '\0';
    char *p = buf;
    while( *p )
    {
        int len = strcspn( p , "\n");
        p += len;
        if( *p )
            p++;
    }
    return 0;

}
