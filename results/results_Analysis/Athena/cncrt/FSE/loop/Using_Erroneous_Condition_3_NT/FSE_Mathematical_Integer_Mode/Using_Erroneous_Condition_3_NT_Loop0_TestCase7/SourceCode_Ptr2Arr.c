extern int __VERIFIER_nondet_int(void);
/*
Commit Number: 358a11a928cdca474c82472a2ca0d619426439f1
URL: https://github.com/brltty/brltty/commit/358a11a928cdca474c82472a2ca0d619426439f1
Project Name: brltty
License: LGPL-2.1
termination: FALSE
*/
int main()
{
    int i = 0;
    int base = 2;
    int count = 10;
    int old_[10] = {9,0,0,0,0,0,0,0,0,0};
    int new_[10] = {8,0,0,0,0,0,0,0,0,0};
    for( int j = 0 ; j < 9 ; j++ )
    {
        ;
        ;
    }
    old_[9] = 0;
    new_[9] = 0;
    while(1)
    {
        int number = base;
        while( old_[i] != new_[i] )
        {
            if( ++number == count )
                goto done;
        }
        i++;
        base += 8;
    }
done:
    return 0;
}
