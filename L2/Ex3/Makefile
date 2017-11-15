scan: ex3.c
	gcc -o ex3 ex3.c

scan.c: ex3.l
	flex -oex3.c ex3.l

clean:
	rm ex3.c ex3
