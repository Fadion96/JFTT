%{
  int yylex();
%}
%option noyywrap

COMMENT <!--.*-->
%%

\".*{COMMENT}.*\" ECHO;
{COMMENT}     ;
.           ECHO;

%%

int main(){
  yylex();
}
