%include "asm_io.inc"

segment .data
    sum dd 0
segment .bss
    input resd 1
segment .text
    global asm_main
    asm_main:
        enter 0,0
        pusha

        mov edx, 1
        while:
            push input ; 输入
            call m_read_int
            pop eax
            cmp dword [input], 0 ; 输入0则退出
            je endwhile
    
            mov eax, [input]
            add [sum], eax
    
            jmp while
        endwhile:
        call m_print_sum
        popa
        mov eax, 0
        leave
        ret

segment .data
    msg1 db "input a number: ", 0 ; m_read_int的
    i dd 1

    msg2 db "the sum of these is: ", 0 ; m_print_sum
segment .text
    m_read_int:
        push ebp
        mov ebp, esp

        mov eax, [i] ; 输出i
        call print_int
        mov eax, msg1 ; 输出提示
        call print_string

        call read_int ; 读取输入
        mov edx, eax

        mov eax, [ebp + 8] ; 返回值
        mov [eax], edx
    
        add dword [i], 1 ; 自增i

        pop ebp
        ret
    m_print_sum:
        push ebp
        
        mov eax, msg2
        call print_string
        mov eax, [sum]
        call print_int
        call print_nl

        pop ebp
        ret
