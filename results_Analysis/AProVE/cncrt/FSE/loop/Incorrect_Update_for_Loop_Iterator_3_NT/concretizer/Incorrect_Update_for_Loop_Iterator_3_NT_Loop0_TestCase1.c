extern int __VERIFIER_nondet_int(void);
/*
Commit Number: 92eb7a2f28d551acedeb5752263267a64b1f5ddf
URL: https://github.com/cleaton/android_kernel_samsung_smdk4210/commit/92eb7a2f28d551acedeb5752263267a64b1f5ddf
Project Name: android_kernel_samsung_smdk4210
License: GPL2
termination: FALSE
*/



int main()
{
    int nfds = 1;
    int nr = 10;
    int NR_OPEN = 100;
    while( nfds <= nr )
    {
        nfds = nfds * 2;
        if( nfds > NR_OPEN )
            nfds = NR_OPEN;
    }
    return 0;
}
