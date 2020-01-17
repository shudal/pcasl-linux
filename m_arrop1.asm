%include "asm_io.inc"

segment .text
    global asm_copy
    asm_copy:
        enter 0, 0
        push esi
        push edi
        ; 复制数组
        ; [ebp + 8] -> source array
        ; [ebp + 12] -> dest array
        ; [ebp + 16] -> 字节数
        
        mov esi, [ebp + 8]
        mov edi, [ebp + 12]
        mov ecx, [ebp + 16]
        rep movsb

        pop edi
        pop esi
        leave
        ret
