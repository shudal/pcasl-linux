%include "asm_io.inc"

segment .text
    global asm_main
    asm_main:
        enter 0, 0
        pusha

        call m_f1
        
        popa
        leave
        ret
    m_f1:
        enter 4, 0
        
        mov eax, 5555
        push eax
        
        lea eax, [ebp - 8]
        mov eax, [eax]
        call print_int
        call print_nl

        leave
        ret
