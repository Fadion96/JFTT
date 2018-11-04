%{
#include<stdio.h>

int yywrap();
int yylex();
int nrWords = 0;
int nrLines = 0;
%}
%%

[\n]+				{ printf("\n"); nrLines += yyleng; }
[ \t]+			printf(" ");
[[:space:]{-}[\n]{-}[:blank]]+	;
[[:^space:]]+			{ printf("%s",yytext); nrWords++; }
%%
int yywrap() {
    printf("\n---\nNumber of lines: %d\nNumber of words: %d\n",nrLines,nrWords);
    return 1;
}
int main() {
    return yylex();
}
