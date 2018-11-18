.PHONY: clean

all: clean calc

calc:
		bison -d calc.y -o calc.tab.c
		flex -o lex.yy.c calc.l
		gcc calc.tab.c lex.yy.c -o calc -lm

clean:
	rm -f *.o calc calc.tab.c calc.tab.h lex.yy.c
