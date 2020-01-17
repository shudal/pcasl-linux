%include "asm_io.inc"

segment .data
    arr1 dd 1, 2, 3, 5, 4
segment .text
    global asm_main
    asm_main:
        enter 0, 0
        pusha
    
        mov ecx, 0
        mov edx, 4 ; cmp 4
        mov edi, arr1
        while:
            cmp ecx, 4
            jg endwhile

            mov eax, edx
            scasd
            if:
                jne endif
                mov eax, ecx
                call print_int
                call print_nl
            endif:
            inc ecx
            jmp while
        endwhile:

        popa
        leave
        ret
