segment .text
    global asm_main
    asm_main:
        enter 0, 0
        pusha

        push 5
        call f_rec1
        pop eax

        popa
        leave
        ret

segment .data
    int_format db "%d", 0
segment .text
    extern printf
    f_rec1:
        enter 4, 0

        if:
            mov eax, [ebp + 8]
            cmp eax, 0
            je endif

            sub eax, 1
            push eax
            call f_rec1
            pop ecx

        endif:
        mov eax, [ebp + 8]

        push eax
        push dword int_format
        call printf
        pop ecx
        pop ecx
        
        leave
        ret
