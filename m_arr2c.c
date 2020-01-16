#include "cdecl.h"
#include "stdio.h"

int PRE_CDECL calASum(int, int*) POST_CDECL;
int main() {
    int n[5] = {1, 2, 3, 4, 5};
    int sum = calASum(5, n);
    printf("sum=%d\n", sum);
}
