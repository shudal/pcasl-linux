%include "asm_io.inc"

segment .text
    global asm_main
asm_main:
    enter 0, 0
    pusha

    mov eax, 15

    mov edx, 0
    mov ecx, 32

    while:
        shl eax, 1
        if:
            jnc endif
            inc edx
        endif:
        loop while
    endwhile:
    mov eax, edx
    call print_int
    call print_nl

    popa
    mov eax, 0
    leave
    ret
