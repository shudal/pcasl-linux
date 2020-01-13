%include "asm_io.inc"

segment .data
prompt1 db "find primes up to : ", 0
prompt2 db "this is in while loop ", 0
i dd 3

segment .bss
maxn resd 1
n resd 1

segment .text
    global asm_main
asm_main:
    enter 0, 0
    pusha

    mov eax, prompt1
    call print_string
    call read_int
    mov [maxn], eax
    
    mov eax, 2;
    call print_int
    call print_nl
    mov eax, 3
    call print_int
    call print_nl

    mov dword [n], 5

    ;mov eax, [maxn]
    ;call print_int
    while:

        ; mov eax, prompt2
        ; call print_string
        ; call print_nl 

        mov eax, [maxn]
        cmp dword [n], eax
        jg endwhile

        mov dword [i], 3
        while2:
            mov eax, [i]
            imul eax,[i]
            cmp eax, [n]
            jge endwhile2

            mov eax, [n]
            cdq
            idiv dword [i]
            cmp edx, 0
            je endwhile2

            add dword [i], 2
            jmp while2
    endwhile2:
        if:
            mov eax, [n]
            cdq
            idiv dword [i]
            cmp edx, 0
            jz endif

            mov eax, [n]
            call print_int
            call print_nl
    endif:
        add dword [n], 2
        jmp while
        ;mov eax, [n]
        ;call print_int
        ;call print_nl
endwhile:
    popa
    mov eax, 0
    leave
    ret
