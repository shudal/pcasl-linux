%include "asm_io.inc"

segment .data
    arr1 dd 1, 2, 3, 4, 5
    arr2 dd 1, 2, 3, 4, 5
    msg1 db "not euqal", 0
    msg2 db "equal", 0
segment .text
    global asm_main
    asm_main:
        enter 0, 0
        pusha

        mov esi, arr1
        mov edi, arr2
        mov ecx, 5
        repe cmpsd
        if:
            cmp ecx, 0
            je else
            mov eax, msg1
            call print_string
            call print_nl
            jmp endif
        else:
            ; =
            mov eax, msg2
            call print_string
            call print_nl
        endif:
        popa
        leave
        ret
