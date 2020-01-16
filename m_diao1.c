#include "cdecl.h"
#include "stdio.h"

int PRE_CDECL cal2(int) POST_CDECL;

int main() {
    printf("enter a number: ");
    int n;
    scanf("%d", &n);
    int n2 = cal2(n);
    printf("the square of the number is: %d\n", n2);
}
