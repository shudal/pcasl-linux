; double asm_fgreater(double f1, double f2)
%define f1 ebp+8 ; double f1
%define f2 ebp+16 ; double f2
segment .text
    global asm_fgreater
    asm_fgreater:
        enter 0, 0

        fld qword [f1]
        fld qword [f2]
        if:
            fcomi st1 ; st0->f2, st1->f1
            jae endif ; f2>=f1,则endif
            fld qword [f1]
        endif:
        leave
        ret
