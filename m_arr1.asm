%include "asm_io.inc"
segment .data
    a dw 1, 2, 3, 4, 5
    int_format db "%d", 0

segment .text
    global asm_main
    extern printf
    asm_main:
        enter 0, 0
        pusha

        mov ecx, 0 ; ecx <= 10
        mov edx, 0 ; sum
        while:
            cmp ecx, 8
            jg endwhile

            mov ax, [a + ecx]
            cwde
            call print_int
            call print_nl
            add edx, eax

            add ecx, 2
            jmp while
        endwhile:
        mov eax, edx
        push edx
        push dword int_format
        call printf
        pop ecx
        pop ecx

        popa
        leave
        ret
