// legnagyobb közös osztó
// 'a' mindig nagyobb, mint 'b'  (itt még nem vettük az 'if'-et)

int a = 299;
int b = 221;

int maradek;

int main() 
{    
    while (b != 0)
    {
        maradek = a % b;
        a = b;
        b = maradek;
    }
    
    return a;
}

