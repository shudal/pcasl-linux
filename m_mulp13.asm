%include "asm_io.inc"

segment .text
    global m_p1_f2
    m_p1_f2:
        mov eax, 2
        call print_int
        call print_nl
        ret
