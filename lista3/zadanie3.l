%option noyywrap
%option yylineno
%{
#include "zadanie3.tab.h"
int yylex();
%}
%%
[ \t]+ 	;
\+	{ return PLUS; }
-	{ return MINUS; }
\/	{ return DZIELENIE; }
\*	{ return RAZY; }
and	{ return AND; }
or 	{ return OR; }
not	{ return NOT; }
\(	{ return LNAW; }
\)	{ return PNAW; }
\n	{ return END; }
[0-9]*	{ yylval = atof(yytext); return VAL; }
\#.*	{ return KOMENTARZ; }
[A-Za-z]*	{return ERROR;}
%%
