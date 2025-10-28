        .intel_syntax noprefix
        .globl F, len
        .globl sum, avg, i
        .globl main


    .data
F:      .zero  4
        .4byte 1
        .zero  44

len:    .4byte 13
sum:    .4byte 1

        .comm  avg, 4
        .comm  i,   4

    .text
main:
        # -------------------------------
        #            CIKLUS
        # -------------------------------

            mov DWORD PTR [i], 2
            jmp COND
BODY:
    # FIBONACCI
            mov eax, DWORD PTR [i]
            sub eax, 1                       # i-1
            mov ebx, DWORD PTR [F + eax*4]   # F[i-1]

            mov eax, DWORD PTR [i]
            sub eax, 2                       # i-2
            mov ecx, DWORD PTR [F + eax*4]   # F[i-2]

            add ebx, ecx                     # F[i-1] + F[i-2]

            mov eax, DWORD PTR [i]
            mov DWORD PTR [F + eax*4], ebx   # F[i] =

    # ÖSSZEG KISZÁMÍTÁSA
            mov eax, DWORD PTR [sum]

            mov ecx, DWORD PTR [i]
            mov ebx, DWORD PTR [F + ecx*4]   # F[i]

            add eax, ebx                     # sum + F[i]
            mov DWORD PTR [sum], eax         # sum =

            mov eax, DWORD PTR [i]
            inc eax
            mov DWORD PTR [i], eax

COND:
            mov eax, DWORD PTR [i]
            mov ebx, DWORD PTR [len]
            cmp eax, ebx
            jl  BODY

        # -------------------------------
        #       ÁTLAG KISZÁMÍTÁSA
        # -------------------------------

            mov  eax, DWORD PTR [sum]
            mov  ebx, DWORD PTR [len]

            cdq
            idiv ebx
            mov  DWORD PTR [avg], eax

        # -------------------------------
        #          VISSZATÉRÉS
        # -------------------------------

            mov  eax, DWORD PTR [avg]
            ret

