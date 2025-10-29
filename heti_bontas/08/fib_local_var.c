// Feladat:
//      Írjunk egy eljárást, ami feltölt egy lokális tömböt a Fibonacci sorozat
//      első 13 elemével.

void fib()
{
    int F[13];
    F[0] = 0;
    F[1] = 1;
    int len = 13;

    // CIKLUS
    for (int i = 2; i < len; i++)
    {
        F[i] = F[i-1] + F[i-2];
    }
}

int main()
{
    fib();

    return 0;
}


//    goto COND;   // jmp COND
//BODY:
//    F[i] = F[i-1] + F[i-2];
//    i    = i + 1;
//COND:
//    if (i < len) goto BODY;   //  jl BODY
