        .intel_syntax noprefix
        .globl find_max


# A lokális változóink és címeik a memóriában:
#   rbp-20  =  A
#   rbp-12  =  len
#   rbp- 8  =  max
#   rbp- 4  =  i


find_max:
    push rbp
    mov  rbp, rsp                  #           A[]            len           max           i
    sub  rsp, 20                   # 20 = sizeof(int *) + sizeof(int) + sizeof(int) + sizeof(int)

    mov  QWORD PTR [rbp-20], rdi   # A[]:  first parameter (memory address pointing to first element of A[])
    mov  DWORD PTR [rbp-12], esi   # len:  second parameter (length of A[])

#    mov  rax, QWORD PTR [rbp-20]  # load memory address of A into rax (&A[0])
#    mov  eax, DWORD PTR [rax]     # move A[0] into eax ( basically *(&A[0]) )
    mov  eax, DWORD PTR [rdi]      # this does the same thing as the two commented out lines above
    mov  DWORD PTR [rbp-8], eax    # max = A[0]

    mov  DWORD PTR [rbp-4], 1      # i = 1


    jmp COND
    
BODY:
    movsx rcx, DWORD PTR [rbp- 4]       # move 4 byte i with sign extension into 8 byte rcx
    mov   rax, QWORD PTR [rbp-20]       # rax = A = &A[0]
    mov   eax, DWORD PTR [rax + rcx*4]  # A[i]

    
    mov   ebx, DWORD PTR [rbp-8]        # max

    cmp   eax, ebx
    jle   ELSE                          # jump only if A[i] <= max
    mov   DWORD PTR [rbp-8], eax        # max = A[i]

ELSE:
    inc   DWORD PTR [rbp-4]             # i++

COND:
    mov eax, DWORD PTR [rbp- 4]
    mov ebx, DWORD PTR [rbp-12]
    cmp eax, ebx                  # i < len
    jl  BODY

    mov eax, DWORD PTR [rbp-8]    # move return value into eax

    mov rsp, rbp
    pop rbp
    ret


#int find_max(int A[], int len)
#{
#    int max = A[0];
#    
#    for (int i = 1; i < len; i++)
#    {
#        if (A[i] > max) 
#            max = A[i];
#    }
#    
#    return max;
#}





