%include "asm_io.inc"

segment .data
sum dw 0

segment .text
    global asm_main
asm_main:
    enter 0, 0
    pusha

    mov ecx, 10
    mov eax, 0
loopblock:
    add eax, ecx
    loop loopblock
nextblock:
    call print_int
    call print_nl

    popa
    mov eax, 0
    leave
    ret
