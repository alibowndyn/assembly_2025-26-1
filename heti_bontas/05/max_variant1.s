		.intel_syntax noprefix
		.globl main
		.globl a, b, c

	.data
a:		.4byte	2
b:		.4byte  5
c:		.4byte	-1

	.text
main:	mov		eax, DWORD PTR [a]
		mov 	ebx, DWORD PTR [b]
		cmp		eax, ebx
		jle		ELSE1					# a>b ?
# a>b
		mov		eax, DWORD PTR [a]
		mov 	ebx, DWORD PTR [c]
		cmp 	eax, ebx				# a>c ?
		jle     ELSE2
		mov 	eax, DWORD PTR [a]		
		jmp		OUT						# return a
# a<=c
ELSE2:  mov		eax, DWORD PTR [c]
		jmp		OUT						# return c
# a<=b
ELSE1:  mov		eax, DWORD PTR [b]
		mov 	ebx, DWORD PTR [c]
		cmp 	eax, ebx				# b>c ?
		jle		ELSE3
		mov		eax, DWORD PTR [b]		# return b
		jmp 	OUT
ELSE3:	
		mov 	eax, DWORD PTR [c]		# return c
OUT:	ret






### C Style ###
#int a =  2;
#int b =  5;
#int c = -1;
#int main()
#{
#	if (a>b)
#		if (a>c)
#			return a;
#		else
#			return c;
#	else
#		if (b>c)
#			return b;
#		else
#			return c;
#}
