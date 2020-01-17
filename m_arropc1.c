#include "cdecl.h"
#include "stdio.h"

void PRE_CDECL asm_copy(int*, int*, int) POST_CDECL;
#define SIZE 5
int main() {
    int a1[SIZE] = {1, 2, 3, 4, 5}, a2[SIZE];
    asm_copy(a1, a2, SIZE*4);
    for (int i=0; i<SIZE; ++i)
        printf("%d\n", a2[i]);
    return 0;
}
