all: main.bin


main.bin: main.asm printf.asm readDisk.asm printh.asm testA20.asm
	nasm -fbin main.asm -o main.bin

clean:
	rm main.bin

run:
	qemu-system-x86_64 main.bin
