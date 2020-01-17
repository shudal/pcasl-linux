#include "cdecl.h"
#include "stdio.h"

double PRE_CDECL asm_cal2(double, double, double, double*, double *) POST_CDECL;
int main() {
    double a, b, c, x1, x2;
    scanf("%lf %lf %lf", &a, &b, &c);
    // a = 2; b = 3; c = 1;
    printf("a=%lf, b=%lf, c=%lf\n", a, b, c);
    double r = asm_cal2(a, b, c, &x1, &x2);
    printf("\nr=%lf\n", r);
    printf("x1=%lf, x2=%lf\n", x1, x2);
}
