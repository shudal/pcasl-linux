%include "asm_io.inc"

segment .data
prompt db "enter a number: ", 0
square_msg db "square of input is ", 0
cube_msg db "cube of input is ", 0
cube25_msg db "cube of input times 25 is ", 0
quot_msg db "quotient of cube/100 is ", 0
rem_msg db "Remainder of cube/100 is ", 0
neg_msg db "the negation of the remainder is ", 0

segment .bss
input resd 1

segment .text
    global asm_main
asm_main:
    enter 0, 0 
    pusha

    mov eax, prompt 
    call print_string

    call read_int
    mov [input], eax

    imul eax, eax
    mov edx, eax
    mov eax, square_msg
    call print_string
    mov eax, edx
    call print_int
    call print_nl

    imul eax, [input]
    mov edx, eax
    mov eax, cube_msg
    call print_string
    mov eax, edx
    call print_int
    call print_nl

    ; cube 存于input
    mov [input], eax
    mov eax, cube25_msg
    call print_string
    imul eax, [input], 25
    call print_int
    call print_nl

    mov eax, quot_msg
    call print_string
    mov eax, [input]
    mov ecx, 100
    cdq
    idiv ecx
    call print_int
    call print_nl


    mov eax, rem_msg
    call print_string
    mov eax, edx
    call print_int
    call print_nl

    mov edx, eax
    mov eax, neg_msg
    call print_string
    mov eax, edx
    neg eax
    call print_int
    call print_nl

    popa
    mov eax, 0
    leave
    ret
