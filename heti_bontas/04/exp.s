    .intel_syntax noprefix
    .globl main
    .globl a, b, m, i
    

    .data
a:      .4byte 4
b:      .4byte 1
m:      .4byte 1

        .comm  i, 4
        
    .text
main:   mov     DWORD PTR [i], 0
        jmp     COND
    
BODY:   mov     eax, DWORD PTR [m]
        mov     ebx, DWORD PTR [a]
        
        imul    eax, ebx
        mov     DWORD PTR [m], eax
        
        mov     ecx, DWORD PTR [i]
        inc     ecx
        mov     DWORD PTR [i], ecx

COND:   mov     eax, DWORD PTR [i]
        mov     ebx, DWORD PTR [b]
        
        cmp     eax, ebx
        jl      BODY
        
        mov     eax, DWORD PTR [m]
        ret

