#include "stdio.h"
int main() {
    short int s;
    short unsigned u;

    s = 3; u = 1;
    u = u | 3;
    s = s & 1;

    s = 1; u = 1;
    s = s << 3;
    u = u << 2;
    printf("%d\n", s);
    printf("%d\n", u);
}
