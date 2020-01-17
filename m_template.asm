%include "asm_io.inc"

; 这个段定义有初始值的，如字符串常量
segment .data

; 这个段定义未初始化的数据，如变量
segment .bss

segment .text
    global asm_main
asm_main:
    enter 0, 0 ; 开始运行
    pusha

    ; 这里放代码;勿改前后

    popa
    mov eax, 0 
    leave
    ret
