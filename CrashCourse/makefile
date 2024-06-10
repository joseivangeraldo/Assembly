debug: test
    gdb -q -x debug.gdb ./test                
test: test.s
    as test.s -o test.o
    ld test.o -o test        
clean:
    rm -rf *.o*        
.PHONY: debug
