#include "stdlib.h"
extern int __VERIFIER_nondet_int(void);
/*
Commit Number: 8030f9c0f092170ceb50cedf59b9c330022825b7
URL: https://github.com/aatmdev/glusterfs/commit/8030f9c0f092170ceb50cedf59b9c330022825b7
Project Name: glusterfs
License: GPL2
termination: TRUE
*/
#define EVEBT_EPOLL_SLOTS 2
int main()
{
    int EVENT_EPOLL_TABLES = 10;
    int slots_used[10];
    int ereg[10];
    int table;
    for( int i = 0 ; i < 10 ; i++ )
    {
        slots_used[i] = __VERIFIER_nondet_int();
        ereg[i] = __VERIFIER_nondet_int();
    }
    int i = 0;
    while( i < EVENT_EPOLL_TABLES )
    {
        switch( slots_used[i] )
        {
            case EVEBT_EPOLL_SLOTS:
                /*@ \slicing::slice_preserve_ctrl; */
                break;
            case 0:
                if( !ereg[i] )
                    /*@ \slicing::slice_preserve_ctrl; */
                    return 0;
                else
                    table = ereg[i];
                /*@ \slicing::slice_preserve_ctrl; */
                break;
            default:
                table = ereg[i];
                /*@ \slicing::slice_preserve_ctrl; */
                break;
        }
        if( table )
            /*@ \slicing::slice_preserve_ctrl; */
            break;
        i++;
    }
    return 0;
}
