int F[13] = { 0, 1 };

int len = 13;
int sum = 1;
int avg;

int i;

int main()
{
    // CIKLUS
    for (i = 2; i < len; i++)
    {
        // FIBONACCI SZÁMOLÁS
        F[i] = F[i-1] + F[i-2];

        // ÖSSZEG SZÁMOLÁS
        sum = sum + F[i];
    }

    // ÁTLAG KISZÁMÍTÁSA
    avg = sum / len;
    
    // VISSZATÉRÉS
    return avg;
}


//    goto COND;   // jmp COND
//BODY:
//    F[i] = F[i-1] + F[i-2];
//    sum  = sum + F[i];
//    i    = i + 1;
//COND:
//    if (i < len) goto BODY;   //  jl BODY

