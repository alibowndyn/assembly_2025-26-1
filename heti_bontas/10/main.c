// Feladat: C programból meghívott tetszőleges méretű int tömbben maximumot kereső assembly függvény

// Ezzel kéne tesztelni: 
//     gcc main.c max.s -o run -Wno-implicit-function-declaration && ./run; echo $?

// A `-Wno-implicit-function-declaration` kapcsoló nem kötelező, csupán kikapcsolja a main.c-ben 
// lévő deklarálatlan `find_max` függvényre vonatkozó warning üzenetet.

int main()
{
    int A[10] = { 7, 3, 10, 2, -1, 0, 5, 10, -5, 1 };
    int len = 10;
    
    return find_max(A, len);
}

