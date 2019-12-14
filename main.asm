[org 0x7c00]
[bits 16]

section .text

	global main

main:

cli
jmp 0x0000: ZeroSeg

ZeroSeg:
	xor ax, ax
	mov ss, ax
	mov ds, ax
	mov es, ax
	mov fs, ax
	mov gs, ax
	mov sp, main
	cld
sti

push ax
xor ax, ax
mov dl,0x80
int 0x13
pop ax

mov al,1
mov cl,2
call readDisk


mov ax, 0x2400
int 0x15

call testA20

jmp $


%include "./printf.asm"
%include "./readDisk.asm"
%include "./printh.asm"
%include "./testA20.asm"
;STR1: db "Loaded in 16bit Real mode to memory location in 0x7c00",0x0a, 0x0d, 0
;STR2: db "These messages use interrupt 0x10 with the register ah set to 0x0e",0x0a,0x0d,0
;STR3: db "This is the dummy os. power off and load real os.", 0x0a, 0x0d, 0

READ_DISK_ERROR_MSG: db "load disk error!",0x0a,0x0d,0
TEST_MSG: db "you load second sector!",0
; padding and magic number
times 510 - ($-$$) db 0
dw 0xaa55


test:
	mov si,TEST_MSG
	call printf
	ret
