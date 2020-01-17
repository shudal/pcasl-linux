%include "asm_io.inc"

segment .data
    arr1 dd 1, 2 ,3 ,4 ,5
segment .bss
    arr2 times 5 resd 1
    arr3 resd 5
segment .text
    global asm_main
    asm_main:
        enter 0, 0
        pusha
        
        cld
        mov ecx, 5

        mov esi, arr1
        mov edi, arr2

        mov edx, 0
        while:
            lodsd
            stosd

            mov eax, [arr2 + edx * 4]
            call print_int
            call print_nl
            inc edx
            loop while
        endwhile:

        mov ecx, 5
        mov esi, arr1
        mov edi, arr3
        mov edx, 0
        while2:
            movsd
            
            mov eax, [arr3 + 4*edx]
            call print_int
            call print_nl

            inc edx
            loop while2
        endwhile2:
        popa
        mov eax, 0
        leave
        ret
