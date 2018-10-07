%{
#include"calc.tab.h"
extern int yylval;
%}

%%
^#.*(\\\n)*.*\n	;
[0-9]+  {yylval=atoi(yytext); return NUM;}
[ \t]+	;
\n      return 0;
[()+\-*/%\^]      return *yytext;
(\\\n)		;
%%

int yywrap(){
    return 1;
}
