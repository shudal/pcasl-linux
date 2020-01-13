%include "asm_io.inc"

segment .text
    global asm_main
asm_main:
    enter 0, 0
    pusha

    mov eax, 1

    cmp eax, 0
    jz trueblock
    ; 为true则else这部分就会被跳过
    ; ---else---开始
elseblock:
    mov ebx, 2 
    jnz nextblock ; 跳过trueblock
    ; ---else---结束
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
