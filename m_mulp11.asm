segment .text
    global asm_main
    extern m_p1_f1
    extern m_p1_f2
    asm_main:
        enter 0, 0
        pusha
        call m_p1_f1
        call m_p1_f2
        popa
        mov eax, 0
        leave
        ret
