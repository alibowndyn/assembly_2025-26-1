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
		cmp		eax, ebx				# a>=b ?
		jl  	NEXT1					# short-circuit evaluation
		mov		eax, DWORD PTR [a]
		mov		ebx, DWORD PTR [c]
		cmp		eax, ebx				# a>=c ?
		jl  	NEXT1

		mov		eax, DWORD PTR [a]
		jmp		OUT						# return a

NEXT1:	mov		eax, DWORD PTR [b]
		mov		ebx, DWORD PTR [c]
		cmp		eax, ebx				# b>=c ?
		jl  	NEXT2
		mov		eax, DWORD PTR [b]
		jmp		OUT						# return b

NEXT2:	mov		eax, DWORD PTR [c]		# return c
OUT:	ret






### C Style ###
#int a =  2;
#int b =  5;
#int c = -1;
#int main()
#{
#	if (a>=b && a>=c) return a;
#	if (b>=c) return b;
#	return c;
#}
