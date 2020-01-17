%include "asm_io.inc"

segment .data
n resd 0

segment .text
    global asm_main
asm_main:
    enter 0, 0
    pusha

    push n
    call m_read_int
    add esp, 4
    mov eax, [n]
    call print_int
    call print_nl

    popa
    mov eax, 0
    leave
    ret

    m_read_int:
        push ebp
        mov ebp, esp
        call read_int
        mov edx, eax
        lea eax, [ebp + 8] ; eax为ebp+8这个地址, eax->n的地址
        dump_regs 1
        mov eax, [eax] ; eax = &n
        dump_mem 1, n, 1
        dump_regs 2
        mov [eax], edx
        
        pop ebp
        ret
