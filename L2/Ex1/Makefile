scan: ex1.c
	gcc -o ex1 ex1.c

scan.c: ex1.l
	flex -oex1.c ex1.l

clean:
	rm ex1.c ex1
