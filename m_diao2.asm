segment .text
    global calSum
    calSum:
        enter 0, 0

        mov ecx, [ebp + 8] ; n
        mov edx, 0
        while:
            cmp ecx, 0
            je endwhile

            add edx, ecx

            loop while
        endwhile:

        mov eax, [ebp + 12]
        mov [eax], edx


        leave
        ret
