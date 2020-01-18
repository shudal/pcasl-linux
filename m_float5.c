#include "cdecl.h"
#include "stdio.h"
#include "stdlib.h"
void PRE_CDECL asm_float5(int*, unsigned n) POST_CDECL;


int main() {
    unsigned max;
    scanf("%u", &max);
    int* a = calloc(sizeof(int), max);
    if (a) {
        asm_float5(a, max);
        int i;
        for (i=0; i<max; ++i)
            printf("%3d %d\n", i+1, a[i]);
    }
}
