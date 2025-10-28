        .intel_syntax noprefix
        .global main
        .globl a
        
    .data
a:      .4byte -20

    .text
main:   
        mov     eax,    DWORD PTR [a]
        cmp     eax,    0
        jge     NEXT
        imul    eax,    -1
NEXT:
        ret
