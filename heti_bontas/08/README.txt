Mivel ennél a feladatnál nincsen visszatérési érték és nem nagyon tudjuk így leellenőrizni,
hogy tényleg fel lett-e töltve a tömbünk a Fibonacci sorozat első 13 elemével, ezért arra
kérlek benneteket, hogy próbáljátok ki a kódot az emulátorral.

Ellenőrízzétek le, hogy a call, ret, pop és push műveletek tényleg azt csinálják-e, amit az
órán tanultunk.

Ahogy néztük is, a fenti műveletek lényegében az alábbiaknak felelnek meg.

push x  ->  sub rsp, 8
            mov QWORD PTR [rsp], x

pop  x  ->  mov x, QWORD PTR [rsp]
            add rsp, 8

call x  ->  push rip ->  sub rsp, 8
            jmp x        mov QWORD PTR [rsp], rip
                         jmp x

ret     ->  pop rip  ->  mov rip, QWORD PTR [rsp]
                         add rsp, 8

Az első kettőnél feltételezzük, hogy 8 bájtos adatokat teszünk be vagy veszünk ki a veremből.

A call és ret az rip-vel dolgozik, ami ugye egy 8 bájtos regiszter az x86-64 architektúrában,
ezért ezeknél adott az rsp +/- 8.
