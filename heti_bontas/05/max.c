// három érték közül visszaadni a legnagyobb értékét
// a három érték nem lehet egyenlő

int a = 5;
int b = 3;
int c = 7;

int r;

int main()
{
    // return (a > b) ? ( (a > c) ? a : ( (b > c) ? b : c ) ) : ( (b > c) ? b : c );


    // if (a > b && a > c)
    //     r = a;
    // else
    //     if (b > c)
    //         r = b;
    //     else
    //         r = c;
    // return r;


    if (a < b) goto ELSE1;
    if (a < c) goto ELSE1;
    r = a;
    goto END;
ELSE1:
    if (b < c) goto ELSE2;
    r = b;
    goto END;
ELSE2:
    r = c;
END:
    return r;
}
