#include "cdecl.h"
#include "stdio.h"

int PRE_CDECL asm_float4(FILE*, double*, int) POST_CDECL;

#define MAXN 5

int main() {

    freopen("m_in", "r", stdin);
    double a[MAXN];
    int n = asm_float4(stdin, a, MAXN);

    for (int i=0; i<n; ++i)
        printf("%3d %g\n", i, a[i]);

    return 0;
}
