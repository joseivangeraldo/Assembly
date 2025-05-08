#ld ld -s -o $(NOME) $(NOME).o tira a possibilidade de usar o GDB
NOME = biblioteca

all: $(NOME).o
	ld -o $(NOME) $(NOME).o
	rm -rf *.o:

%.o: %.asm
	nasm -f elf64 $<