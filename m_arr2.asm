%include "asm_io.inc"

segment .text:
    global calASum
    calASum:
        ; [ebp + 8] -> n, [ebp + 12] -> array
        ; 2x4->sum, i
        enter 8, 0

        mov dword [ebp - 4], 0 ; sum = 0
        mov dword [ebp - 8], 0 ; i = 0
        
        while:
            mov edx, [ebp + 8]
            sub edx, 1
            cmp [ebp - 8], edx 
            jg endwhile ; should i <= n - 1

            mov eax, [ebp - 8]
            mov esi, [ebp + 12]
            mov esi, [esi + 4*eax]
            mov edx, [ebp - 4]
            add edx, esi ; edx = [ 元素地址 ] = [ array + 偏移 ] = [ [ebp + 12] + 偏移 ]
            mov [ebp - 4], edx ; sum += [ebp + 12 + i * 4]

            inc dword [ebp - 8] ; ++i
            jmp while
        endwhile:
        mov eax, [ebp - 4]
        leave
        ret
