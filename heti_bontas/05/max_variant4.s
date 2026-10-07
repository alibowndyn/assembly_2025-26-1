		.intel_syntax noprefix
		.globl main
		.globl a, b, c

	.data
a:		.4byte	2
b:		.4byte 	5
c:		.4byte	-1

	.text
main:	mov		eax, DWORD PTR [b]
		mov		ebx, DWORD PTR [a]
		cmp		eax, ebx				# b>a ?
		jle  	NEXT1
		mov 	DWORD PTR [a], eax		# a=b
NEXT1:	mov		eax, DWORD PTR [c]
		mov		ebx, DWORD PTR [a]
		cmp		eax, ebx				# c>a ?
		jle  	OUT
		mov 	DWORD PTR [a], eax		# a=c
OUT:	mov		eax, DWORD PTR [a]		# return a
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
