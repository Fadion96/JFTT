%option noyywrap
%{
#include"calc.tab.h"
%}

%%
^#.*(\\\n)*.*\n	;
[0-9]+  {yylval.ival = atoi(yytext); return NUM;}
[ \t]+	;
\n      return 0;
"+"					{return ADD;}

"-"					{return SUB;}

"*"					{return MULT;}

"/"					{return DIV;}

"%"					{return MOD;}

"("					{return LB;}

")"					{return RB;}

"^"					{return POW;}
(\\\n)		;
%%
