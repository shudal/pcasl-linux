%include "asm_io.inc"

segment .data
msg1 db "Enter a number: ", 0
msg2 db "Enter another number: ", 0
msg3 db "the larger number is: ", 0

segment .bss
n1 resd 1

segment .text
    global asm_main
asm_main:
    enter 0, 0
    pusha

    mov eax, msg1
    call print_string
    call read_int
    mov [n1], eax
    mov eax, msg2
    call print_string
    call read_int
    mov edx, eax

    xor ebx, ebx
    cmp edx, [n1]
    setg bl
    
    neg ebx
    mov ecx, ebx
    and ecx, eax
    
    not ebx
    and ebx, [n1]

    or ecx, ebx

    mov eax, msg3
    call print_string
    mov eax, ecx
    call print_int
    call print_nl

    popa
    mov eax, 0
    leave
    ret
