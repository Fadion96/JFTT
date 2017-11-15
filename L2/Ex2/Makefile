scan: ex2.c
	gcc -o ex2 ex2.c

scan.c: ex2.l
	flex -oex2.c ex2.l

clean:
	rm ex2.c ex2
