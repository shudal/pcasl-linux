%include "asm_io.inc"

segment .text
    global asm_main
asm_main:
    enter 0, 0
    pusha

    mov eax, 3
    and eax, 1

    call print_int
    call print_nl

    MOV eax, 3
    or eax, 1
    call print_int
    call print_nl

    mov eax, 3
    xor eax, 1
    call print_int
    call print_nl

    mov ax, 0FFFEH
    dump_regs 1
    not ax
    dump_regs 2
    cbw
    cwde
    call print_int
    call print_nl


    popa
    mov eax, 0
    leave
    ret
