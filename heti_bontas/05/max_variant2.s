		.intel_syntax noprefix
		.globl main
		.globl a, b, c

	.data

a:		.4byte	2
b:		.4byte 	5
c:		.4byte	-1

	.text
main:	mov		eax, DWORD PTR [a]
		mov		ebx, DWORD PTR [b]
		cmp		eax, ebx				# a>b ?
		jle 	NEXT1					# short-circuit evaluation
		mov		eax, DWORD PTR [a]
		mov		ebx, DWORD PTR [c]
		cmp		eax, ebx				# a>c ?
		jle 	NEXT1

		mov		eax, DWORD PTR [a]
		jmp		OUT						# return a

NEXT1:	mov		eax, DWORD PTR [b]
		mov		ebx, DWORD PTR [a]
		cmp		eax, ebx				# b>a ?
		jle 	NEXT2					# short-circuit evaluation
		mov		eax, DWORD PTR [b]
		mov		ebx, DWORD PTR [c]
		cmp		eax, ebx				# b>c ?
		jle 	NEXT2

		mov		eax, DWORD PTR [b]
		jmp		OUT						# return b

NEXT2:	mov		eax, DWORD PTR [c]
		mov		ebx, DWORD PTR [a]
		cmp		eax, ebx				# c>a ?
		jle 	OUT						# short-circuit evaluation; technically impossible
		mov		eax, DWORD PTR [c]
		mov		ebx, DWORD PTR [b]
		cmp		eax, ebx				# c>b ?
		jle 	OUT

		mov		eax, DWORD PTR [c]		# return c

OUT:	ret






### C Style ###
#int a =  2;
#int b =  5;
#int c = -1;
#int main()
#{
#	if (a>b && a>c) return a;
#	if (b>a && b>c) return b;
#	if (c>a && c>b) return c;
#}
