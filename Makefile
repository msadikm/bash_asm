test: test.s
	as test.s -o test.o
	ld test.o -o test

debug: test
	gdb -nx -q -x debug.gdb ./test

clean:
	rm test.o test core.*

.PHONY: debug
