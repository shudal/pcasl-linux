%include "asm_io.inc"
segment .text
    global m_p1_f1:
    m_p1_f1:
        mov eax, 1
        call print_int
        call print_nl
        ret

