; void asm_float5(int*, unsigned n)
%include "asm_io.inc"
%define arr [ebp+8]
%define maxn [ebp+12]

%define m_cw [ebp-2] ; word
%define m_new_cw [ebp-4] ; word
%define pcount [ebp-8] ;已经找到的数量
%define altryn [ebp-12] ; 已经尝试的最大的n
%define i [ebp-16] ; i
%define n2 [ebp-20] ;
%define m_flag [ebp-24];
%define n3 [ebp-28]

segment .text
    global asm_float5:
    asm_float5:
        enter 28, 0
        
        fstcw m_cw
        mov ax, m_cw
        or ax, 0c00h
        mov m_new_cw, ax
        fldcw m_new_cw
        ; fed cba9 8765 4321
        ; 000 0110 0000 0000
        ; 0   6    0    0
        mov dword pcount, 0;
        mov dword altryn, 5 ; 2, 3, 5

        ; 特殊化质数2, 3, 5
        mov eax, arr
        mov dword [eax], 2
        mov dword [eax+4], 3
        mov dword [eax+8], 5
        mov dword pcount, 3

        while:
            mov eax, pcount ; pcount should < maxn, (pcount start from 0)
            cmp eax, maxn
            jge endwhile

            add dword altryn, 2
            mov dword i, 0
            mov dword m_flag, 1
            
            fild dword altryn
            fsqrt
            fistp dword n2 ; n2 = sqrt(now_try_n)
            while2:
                mov eax, i
                cmp eax, pcount
                jnl endwhile2 ; i should < pcount

                mov eax, arr ; eax = arr[i]
                mov edx, i
                mov eax, [eax + 4*edx]
                mov n3, eax ; n3 = arr[i]

                mov eax, n3 ;
                cmp eax, n2 ; arr[i] should <= n2
        
                jg endwhile2

                if:
                    mov eax, altryn
                    cdq
                    idiv dword n3
                    cmp edx, 0
                    jne endif

                    mov dword m_flag, 0
                    mov eax, altryn
                    jmp endwhile2
                endif:

                inc dword i
                jmp while2
            endwhile2:
            if2:
                cmp dword m_flag, 1
                jne endif2

                mov eax, arr
                mov edx, pcount
                lea eax, [eax + 4*edx]
                mov edx, altryn
                mov [eax], edx
                inc dword pcount
            endif2:
            jmp while
        endwhile:

        f_end:
        fldcw m_cw
        mov eax, pcount
        leave
        ret
