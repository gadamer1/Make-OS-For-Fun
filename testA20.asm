testA20:
	pusha
	
	mov ax,[0x7dfe]
	mov dx, ax
	call printh

	push bx
	mov bx, 0xffff
	mov es, bx
	pop bx

	mov bx, 0x7e0e

	mov dx, [es:bx]
	call printh

	popa
	ret
