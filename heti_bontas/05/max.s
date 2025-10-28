        .intel_syntax noprefix
        .globl  a, b, c
        .globl  main

    .data
a:      .4byte  2
b:      .4byte  3
c:      .4byte  5

        .comm   r,  4


    .text
main:
        mov  eax,           DWORD PTR [a]
        mov  ebx,           DWORD PTR [b]
        cmp  eax,           ebx
        jl   ELSE1               # a < b

        mov  ebx,           DWORD PTR [c]
        cmp  eax,           ebx
        jl   ELSE1               # a < c

        mov  DWORD PTR [r], eax
        jmp  END

ELSE1:
        mov  eax,           DWORD PTR [b]
        mov  ebx,           DWORD PTR [c]
        cmp  eax,           ebx
        jl   ELSE2               # b < c

        mov DWORD PTR [r], eax
        jmp END
ELSE2:
        mov DWORD PTR [r], ebx
END:
        mov eax, DWORD PTR [r]
        ret
