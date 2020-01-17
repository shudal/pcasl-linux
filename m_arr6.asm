%include "asm_io.inc"

segment .data
    arr1 dd 1, 2, 4, 3, 5
segment .text
    global asm_main
    asm_main:
        enter 0, 0
        pusha

        mov ecx, 5
        mov eax, 4
        mov edi, arr1
        repne scasd

        if:
            cmp ecx, 0
            je endif
            
            mov eax, edi
            sub eax, 4
            sub eax, arr1
            mov edx, 0
            mov ecx, 4
            idiv ecx
            call print_int
            call print_nl
        endif:

        popa
        leave
        ret
