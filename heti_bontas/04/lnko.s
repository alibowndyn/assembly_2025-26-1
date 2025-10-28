        .intel_syntax noprefix
        .globl  main
        .globl  a, b

    .data    
a:      .4byte  299
b:      .4byte  221

        .comm   m, 4  # inicializálatlan globális változó a .bss-be

    .text
main:   jmp     COND

BODY:   mov     eax, DWORD PTR [a]  #
        cdq                         # osztandó (edx:eax) meghatározása
        idiv    DWORD PTR [b]       # a % b
                                    
        mov     DWORD PTR [m], edx  # maradek = a % b
        
        mov     eax, DWORD PTR [b]  #
        mov     DWORD PTR [a], eax  # a = b
        
        mov     eax, DWORD PTR [m]  #
        mov     DWORD PTR [b], eax  # b = maradek

COND:   mov     eax, DWORD PTR [b]
        cmp     eax, 0
        jne     BODY

        mov     eax, DWORD PTR [a]  #
        ret                         # return a

