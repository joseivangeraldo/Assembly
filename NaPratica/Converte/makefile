#ld ld -s -o $(NOME) $(NOME).o tira a possibilidade de usar o GDB
#  -s, --strip-all             Strip all symbols
#  -S, --strip-debug           Strip debugging symbols
NOME = converte

all: $(NOME).o
	ld -o $(NOME) $(NOME).o
	rm -rf *.o

%.o: %.asm
	nasm -f elf64 $<