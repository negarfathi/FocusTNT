extern char __VERIFIER_nondet_char(void);
/*
Commit Number: 7800003a8fd28c386fcefa652376bbe7e5aa0ddb
URL: https://github.com/ArtifexSoftware/mupdf/commit/7800003a8fd28c386fcefa652376bbe7e5aa0ddb
Project Name: mupdf
License: AGPL-3.0
termination: FALSE
*/
#include "string.h"
void loadpagetree(char* obj, char* kobj) {
    char* type = obj;
    int kids = strlen(obj);
    if (strcmp(type, "Page") == 0) {
    }else if(strcmp(type, "Pages") == 0){
        for(int i =0; i < kids; i++){
            loadpagetree(obj, kobj);
        }
}
    return;
}
int main(){
    char obj[6] = "Pages";
    char kobj[6] = "aaaaa";
    for(int i=0; i<5; i++){
        ;
        ;
    }
    obj[5] = '\0';
    kobj[5] = '\0';

    loadpagetree(obj, kobj);
    return 0;
}
