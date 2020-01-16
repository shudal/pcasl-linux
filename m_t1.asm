%include "asm_io.inc"

segment .data
n dd 2

segment .text
    global asm_main
asm_main:
    enter 8, 0
    pusha



    popa
    mov eax, 0
    leave
    ret
