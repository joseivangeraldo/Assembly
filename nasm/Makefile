ASM=nasm
ASMFLAGS=-felf64
LD=ld

all: hello

hello: hello.o
	$(LD) hello.o -o hello

hello.o: hello.asm
	$(ASM) $(ASMFLAGS) hello.asm -o hello.o

clean:
	rm -f hello.o hello
