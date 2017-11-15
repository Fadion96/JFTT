%{

#include <stdio.h>

#include <math.h>

#define STACK_SIZE  100

int stack[STACK_SIZE];
int stackPtr = -1;
int error = 0;


int push(int number) {
	if(++stackPtr < STACK_SIZE) {
		stack[stackPtr] = number;
    } 
	else {
		printf ("Blad: Przeciazony stos\n"); 
		error = 1;
	}
}

int pop() {
	if(stackPtr >= 0) {
		return stack[stackPtr--];
    } 
	else {
		printf ("Blad: za mala liczba argumentow\n"); 
		error = 1;
	}
}

int yylex();



int countSolution() {
	if(error == 0) {
		if(stackPtr != 1) {
			printf("= %d\n", pop());
		}
		else {
			printf("Blad: za mala liczba operatorow\n");
		}
	} 
	error = 0;
	stackPtr = -1;
}
%}

%option noyywrap

digit (-)?[0-9]+

%%
{digit}		{ 	push(atoi(yytext)); }

"+"			{ 	push(pop() + pop()); }

"-"			{ 	int fNumber = pop();
				push(pop() - fNumber);
			}

"*"			{	push(pop() * pop()); }

"%"			{	int fNumber = pop();
				if (fNumber == 0) {
					printf("Blad: nie mozna wyliczyc modulo z zero!\n");
					error = 1;
				} 
				else {
					push(pop() % fNumber);
				}
			}

"/"			{
				int fNumber = pop();
				if (fNumber == 0) {
					printf("Blad: nie mozna dzielic przez zero!\n");
				error = 1;
				} 
				else {
				push(pop() / fNumber);
				}
			}

"^" 		{   int fNumber = pop(); push(pow(pop(),  fNumber)); }

" "			;

\n			{ countSolution(); }
.			{	printf("Blad: zły symbol \"%s\"\n", yytext);
                error = 1;
            }
%%

int main()
{
    yylex();
}

