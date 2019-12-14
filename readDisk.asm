readDisk:
	pusha 
	mov ah, 0x02
	mov dl, 0x80
	mov ch, 0
	mov dh, 0

	push bx
	mov bx, 0
	mov es, bx
	pop bx
	mov bx, 0x7c00 + 512

	int 0x13

	jc read_disk_error
	popa
	ret

	read_disk_error:
		mov si, READ_DISK_ERROR_MSG
		call printf
		jmp $
