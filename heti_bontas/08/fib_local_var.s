        .intel_syntax noprefix
        .globl main


        # -------------------------------
        # LOKÁLIS VÁLTOZÓK INICIALIZÁLÁSA
        # -------------------------------
fib:        push rbp
            mov  rbp, rsp
            sub  rsp,  60   # 60 = sizeof(F)+sizeof(len)+sizeof(i) = (13*4)+4+4

            mov  DWORD PTR [rbp-60], 0   # F[0] = 0
            mov  DWORD PTR [rbp-56], 1   # F[1] = 1
            mov  DWORD PTR [rbp- 8], 13  # len  = 13
            mov  DWORD PTR [rbp- 4], 2   # i    = 2

        # -------------------------------
        #            CIKLUS
        # -------------------------------

            jmp COND

BODY:       mov eax, DWORD PTR [rbp-4]  # i

            # Miért kell ez a `cdqe` nekünk? A következő sorban a bázisregiszter az `rbp`, ami 8 bájtos.
            # Ehhez nem adhatom hozzá az `eax`-et, mint indexregisztert, mert az `eax` 4 bájtos.
            # Egy 4 és egy 8 bájtos regisztert nem tudok összeadni x86-ban, ezért az `eax`-et előjelesen
            # ki kell terjesztenem az `rax`-ra.
            cdqe

            mov ebx, DWORD PTR [(rbp-60) + rax*4 - 4]   # F[i-1]

            mov ecx, DWORD PTR [(rbp-60) + rax*4 - 8]   # F[i-2]

            add ebx, ecx                                # F[i-1] + F[i-2]
            mov DWORD PTR [(rbp-60) + rax*4], ebx       # F[i] =

    # CIKLUSVÁLTOZÓ NÖVELÉSE

            mov eax, DWORD PTR [rbp-4]
            inc eax                     # i++
            mov DWORD PTR [rbp-4], eax  # i =

COND:       mov eax, DWORD PTR [rbp-4]  # i
            mov ebx, DWORD PTR [rbp-8]  # len
            cmp eax, ebx
            jl  BODY                    # i < len

        # -------------------------------
        #          TAKARÍTÁS
        # -------------------------------

            mov rsp, rbp
            pop rbp
            ret


main:       call fib
            mov  eax, 0
            ret
