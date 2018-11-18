%{
#include<stdio.h>
#include<math.h>
#include<stdlib.h>

#define TRUE 1

int yylex();
void yyerror(char *msg);

long long int mod(long long int a, long long int b) {
	int r = a % b;
	return r < 0 ? r + b : r;
}

long int power(long int x,  int y)
{
    long int res = 1;      // Initialize result

    while (y > 0)
    {
        // If y is odd, multiply x with result
        if (y % 2 == 1)
            res *= x;

        // y must be even now
        y /= 2;
        x *= x;
    }
    return res;
}

long long int div_floor(long long int x, long long int y) {
	double result = (double) x / (double) y;
	result = floor(result);
	return (int) result;
}

%}

%union {
	long long int ival;
}

%token<ival> NUM
%token ADD SUB MULT DIV LB RB POW MOD
%left ADD SUB
%left MULT DIV MOD
%right POW
%precedence NEG

%type<ival> exp

%start line

%%
line:  exp {printf("\nWynik: %ld\n", $1);}
	| {printf("\n");}
    ;
exp: 	NUM     {printf("%ld ", yylval); $$ = $1;}
	|	SUB NUM %prec NEG {printf("-%ld ", yylval); $$ = -$2;}
	|   LB exp RB {$$ = $2; }
	|	exp ADD exp {printf("+ "); $$ = ($1 + $3); }
	|	exp SUB exp {printf("- "); $$ = ($1 - $3);}
    |   exp MULT exp {printf("* "); $$ = ($1 * $3);}
    |   exp DIV exp {printf("/ "); $$ = div_floor($1, $3);}
    |   exp POW exp {printf("^ "); $$ = power($1, $3);}
	|	exp MOD exp {printf(" "); $$ = mod($1, $3);}
    ;
%%

int main(){
	while(TRUE){
    	yyparse();
	}
}

void yyerror (char *msg) {
    printf ("Blad.\n");
}
