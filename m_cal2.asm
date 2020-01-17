%include "asm_io.inc"

segment .bss
n resd 1
segment .text
    global asm_main
asm_main:
    enter 0, 0
    pusha

    call read_int
    mov ecx, 0
    while:
        cmp eax, 0
        je endwhile

        mov edx, eax
        sub edx, 1
        and eax, edx
        
        add ecx, 1

        jmp while
    endwhile:
    mov eax, ecx
    call print_int
    call print_nl

    popa
    mov eax, 0
    leave
    ret
