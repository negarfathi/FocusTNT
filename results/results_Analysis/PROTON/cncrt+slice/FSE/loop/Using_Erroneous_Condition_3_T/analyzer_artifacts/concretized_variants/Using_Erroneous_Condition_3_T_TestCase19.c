#include "stdlib.h"
extern int __VERIFIER_nondet_int(void);
/*
Commit Number: 358a11a928cdca474c82472a2ca0d619426439f1
URL: https://github.com/brltty/brltty/commit/358a11a928cdca474c82472a2ca0d619426439f1
Project Name: brltty
License: LGPL-2.1
termination: TRUE
*/
int main()
{
    int i = 0;
    int base = 10;
    int count = 20;
    int old_[10] = {0,0,5,6,7,8,9,10,11,0};
    int new_[10] = {0,0,5,6,7,8,9,10,11,0};
    for( int j = 0 ; j < 9 ; j++ )
    {
        ;
        ;
    }
    old_[9] = 0;
    new_[9] = 0;
    while( base < count )
    {
        int number = base;
        while( old_[i] != new_[i] )
        {
            if( ++number == count )
                break;
        }
        i++;
        base += 8;
    }
    return 0;
}
