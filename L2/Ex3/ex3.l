%{
#include<stdio.h>
int yylex();
%}
%option noyywrap



%%
^\%[^\n]*\n ;
\%[^\n]*$ ;
\\(\\\\)*\\ ECHO;
(\\\\)*\\\% ECHO;


%%


int main(){

	yylex();
}

