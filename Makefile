all: main.bin


main.bin: main.asm
	nasm -fbin main.asm -o main.bin

clean:
	rm main.bin

exec:
	qemu-system-x86_64 main.bin
