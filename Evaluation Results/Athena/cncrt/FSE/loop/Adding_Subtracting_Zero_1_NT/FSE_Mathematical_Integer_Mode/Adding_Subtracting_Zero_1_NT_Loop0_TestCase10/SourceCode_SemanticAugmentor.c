extern int __VERIFIER_nondet_int(void);
/*
Commit Number: c3115350eb8bb635d0fdb4dbbb0d0541f38ed19c
URL: https://github.com/Sugon-Beijing/libvncserver/commit/c3115350eb8bb635d0fdb4dbbb0d0541f38ed19c
Project Name: libvncserver
License: GPL-2.0
termination: FALSE
*/
int main()
{

    int linesToRead = 0;
    if( linesToRead < 0 )
        return 0;
    int h = 100;
    while( h > 0 )
    {
        if( linesToRead > h )
            linesToRead = h;
        h -= linesToRead;
    }
    return 0;

}
