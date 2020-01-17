%include "asm_io.inc"
; int asm_float4(FILE*, double*, int)
%define fp  [ebp+8]
%define arr  [ebp+12]
%define maxn  [ebp+16]

%define i [ebp-4]
%define d [ebp-8]

segment .data
    double_format db "%lf", 0
segment .text
    extern fscanf

    global asm_float4:
    asm_float4:
        enter 8, 0

        mov eax, 0
        mov i, eax
        mov ecx, 0
        while:
            mov eax, i
            call print_int
            call print_nl
            
            mov eax, i
            cmp eax, maxn
            je endwhile

            mov edx, arr
            mov eax, i
            lea eax, [edx + 8*eax]
            ;lea eax, arr
            push eax
            push dword double_format
            push dword fp
            call fscanf
            pop edx
            pop edx
            pop edx
            cmp eax, 1
            mov eax, i
            jne endwhile
            
            
            inc dword i
            jmp while
        endwhile:
        leave
        ret
