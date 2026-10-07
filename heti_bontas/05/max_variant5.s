		.intel_syntax noprefix
		.globl main
		.globl a, b, c

	.data
a:		.4byte	2
b:		.4byte 	5
c:		.4byte	-1

	.text
main:	mov     eax, DWORD PTR [a]

		mov		ebx, DWORD PTR [b]
		cmp		ebx, DWORD PTR [a]		# b>a ?
		cmovg 	eax, ebx				# a=b

		mov		ebx, DWORD PTR [c]
		cmp		ebx, DWORD PTR [a]		# c>a ?
		cmovg 	eax, ebx				# a=c

		ret






### C Style ###
#int a =  2;
#int b =  5;
#int c = -1;
#int main()
#{
#	if (b>a) a=b;
#	if (c>a) a=c;
#	return a;
#}
