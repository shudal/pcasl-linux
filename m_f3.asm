; int m_cal2(double a, double b, double c, double *x1, double *x2)
%define a ebp+8
%define b ebp+16
%define c ebp+24
%define x1 ebp+32
%define x2 ebp+36

segment .data
    FOUR dw 4
    TWO  dw 2
segment .text
    global asm_cal2
    asm_cal2:
        enter 0, 0

        fld qword [b]
        fmul st0, st0
        fld qword [a]
        fmul qword [c]
        fild word [FOUR] ; 4, a*c, b^2
        fmulp st1, st0 ; 4ac, b^2
        fsubr st1 ;b^2 - 4ac

        fldz ; 0, b^2-4ac
        
        if:
            fcomi st1
            faddp st0
            ;ffree st0
            ja endif ; 0 > b^2-4ac则else
        
            ; b^2 - 4ac
            fsqrt ; sqrt(deierta)
            fild word [TWO] ; 2, sqrt(deierta)
            fdivp st1
            fld qword [a] 
            fdivp st1 ; sqrt()/2a

            fld qword [b]
            fchs
            fild word [TWO]
            fdivp st1
            fld qword [a]
            fdivp st1 ; c1, c2 ; c1 +- c2

            fld st1 ; c2, c1, c2
            fld st1 ; c1, c2, c1, c2
            
            faddp st1
            mov eax, [x1]
            fstp qword [eax]

            fsubrp st1
            mov eax, [x2]
            fstp qword [eax]

        endif:
        leave
        ret
