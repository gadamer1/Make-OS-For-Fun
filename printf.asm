printf:
	pusha
	mov ah, 0x0e
	str_loop:
		mov al, [si]
		cmp al,0
		jne printf_char
		popa
		ret

		printf_char:
			int 0x10
			add si,1
			jmp str_loop
