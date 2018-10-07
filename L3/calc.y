%{
#include<stdio.h>
#include<math.h>

#define P 1234577
#define TRUE 1


int mod(int a){
    while(a < 0) {
        a += P;
    }
    return a % P;
}

unsigned long int powMod(unsigned long int x,  int y)
{
    unsigned long int res = 1;      // Initialize result
	
    while (y > 0)
    {
        // If y is odd, multiply x with result
        if (y % 2 == 1)
            res = (res*x) % P;
 
        // y must be even now
        y = y>>1; // y = y/2
        x = (x*x) % P;  
    }
    return res;
}

// C function for extended Euclidean Algorithm
int gcdExtended(int a, int b, int *x, int *y)
{
    // Base Case
    if (a == 0)
    {
        *x = 0;
        *y = 1;
        return b;
    }
 
    int x1, y1; // To store results of recursive call
    int gcd = gcdExtended(b%a, a, &x1, &y1);
 
    // Update x and y using results of recursive
    // call
    *x = y1 - (b/a) * x1;
    *y = x1;
 
    return gcd;
}

int div(int a, int b){
	int x, y;
	gcdExtended(b, P, &x, &y);
	return (int)(((unsigned long int)a * (unsigned long int)mod(x)) % (unsigned long int)P);
}

%}
%token NUM
%left '+' '-'
%left '*' '/'
%precedence NEG
%right '^'
%%
line:  exp {printf("\nWynik: %ld\n", mod($1));}
	| {printf("\n");}
    ;
exp:  '-' nexp %prec NEG { $$ = -$2;} 
	|	exp '+' exp {printf("+ "); $$ = ($1 + $3); }
	|	exp '-' exp {printf("- "); $$ = ($1 - $3);}
    |   exp '*' exp {printf("* "); $$ = ($1 * $3);}
    |   exp '/' exp {printf("/ "); $$ = div($1, $3);}
    |   exp '^' exp {printf("^ "); $$ = powMod($1, $3);}
    |   '(' exp ')' {$$ = $2; }
    |   NUM     {printf("%ld ", mod(yylval)); $$ = $1;}
    ;
nexp: NUM {printf("%ld ", mod(-1*yylval)); $$ = $1;}
%%

int main(){
	while(TRUE){
    	yyparse();
	}
}

int yyerror (char *msg) {
    return printf ("Blad.\n");
}

