%include "asm_io.inc"

segment .bss
n resd 1

segment .text
    global asm_main
asm_main:
    enter 0, 0
    pusha

    mov ecx, n
    call m_read_int

    mov eax, [n]
    call print_int
    call print_nl

    popa
    mov eax, 0
    leave
    ret

    m_read_int:
        call read_int
        mov [ecx], eax
        ret
