%include "asm_io.inc"

segment .text
    global asm_main
asm_main:
    enter 0, 0
    pusha

    mov eax, 2

    cmp eax, 5
    jge trueblock
elseblock:
    mov ebx, 2
    jmp nextblock
trueblock:
    mov ebx, 1
nextblock:
    mov eax, ebx
    call print_int
    call print_nl

    popa
    mov eax, 0
    leave
    ret
