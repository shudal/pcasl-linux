#include "cdecl.h"
#include "stdio.h"

double PRE_CDECL asm_fgreater(double, double) POST_CDECL;
int main() {
    double f1 = 1.1, f2 = 1.2;
    double f3 = asm_fgreater(f1, f2);
    printf("%lf\n", f3);
}
