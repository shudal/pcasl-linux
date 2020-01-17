%include "asm_io.inc"

segment .data
    int_format db "%d", 0

segment .text
    global asm_main
    extern scanf
    extern printf
    asm_main:
        enter 4, 0
        pusha
    
        lea eax, [ebp - 4]
        push eax
        push dword int_format
        call scanf
        pop ecx
        pop ecx
        mov edx, [ebp - 4]

        push edx
        push dword int_format
        call printf
        pop ecx
        pop ecx

        popa
        leave
        ret
