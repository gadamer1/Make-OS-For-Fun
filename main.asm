[org 0x7c00]

;mov si, STR1
;call printf

;mov si, STR2
;call printf

;mov si, STR3
;call printf

mov al,1
mov cl,2
call readDisk

jmp test

jmp $


%include "./printf.asm"
%include "./readDisk.asm"

STR1: db "Loaded in 16bit Real mode to memory location in 0x7c00",0x0a, 0x0d, 0
STR2: db "These messages use interrupt 0x10 with the register ah set to 0x0e",0x0a,0x0d,0
STR3: db "This is the dummy os. power off and load real os.", 0x0a, 0x0d, 0

READ_DISK_ERROR_MSG: db "load disk error!",0x0a,0x0d,0
TEST_MSG: db "you load second sector!",0
; padding and magic number
times 510 - ($-$$) db 0
dw 0xaa55


test:
	mov si,TEST_MSG
	call printf
	ret
