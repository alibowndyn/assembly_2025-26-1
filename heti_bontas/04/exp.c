    // Pozitív egész kitevős hatványozás
    //    a^b = ?
    //
    //    2^3 = 8    <=>   2 * 2 * 2 *
    //    0^5 = 0    <=>   0 * 0 * 0 * 0 * 0
    //    3^3 = 27   <=>   3 * 3 * 3
    //    1^5 = 1    <=>   1 * 1 * 1 * 1 * 1
    //    4^1 = 4    <=>   4
    //    4^0 = 1    <=>   ---
    
    // ********************
    // --- while ciklus ---
    //
    // kifejezés_1;
    // while (kifejezés_2)
    //     CIKLUS_MAG
    //     kifejezés_3;
    //
    // ********************

int a = 2;
int b = 3;
int eredmeny = 1;
    
int i;

int main()
{
    i = 0;         // kifejezés_1
    while (i < b)  // kifejezés_2
    {
        eredmeny = eredmeny * a;   // CIKLUS_MAG
        i = i + 1;  // kifejezés_3
    }
    
    return eredmeny;
}
