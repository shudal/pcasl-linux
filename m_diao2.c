#include "cdecl.h"
#include "stdio.h"

void PRE_CDECL calSum(int, int*) POST_CDECL;
int main() {
    printf("calculate the sum of 1 to n: ");
    int n;
    scanf("%d", &n);
    int sum;
    calSum(n, &sum);
    printf("the sum of 1 to %d is %d\n", n, sum);
}
