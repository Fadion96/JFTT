scan: ex4.c
	gcc -o ex4 ex4.c -lm

scan.c: ex4.l
	flex -oex4.c ex4.l

clean:
	rm ex4.c ex4
