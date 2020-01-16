segment .text
    global cal2
    cal2:
        enter 0, 0

        mov eax, [ebp + 8]
        imul eax, eax

        leave
        ret
