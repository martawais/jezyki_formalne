%{
#define YYSTYPE int
#include<stdio.h>
extern int yylineno;  // z lex-a
%}
%token VAL
%token AND
%token OR
%token NOT
%token LNAW
%token PNAW
%token END
%token ERROR
%token PLUS
%token MINUS
%token RAZY
%token DZIELENIE
%token KOMENTARZ
%%
input:
    | input line
;
line: expe END 	{ printf("Wynik:\t%d\n", $$); }
    | KOMENTARZ END	{  }
	| ERROR END	{ printf("Blad skladni\n", $$); }
;
expe: expt		{ $$ = $1; }
    | expe MINUS expt	{ $$ = $1 - $3; }
;
expt: expf		{ $$ = $1; }
    | expt PLUS expf	{ $$ = $1 + $3; }
;
expf: expm		{ $$ = $1; }
    | expf RAZY expm	{ $$ = $1 * $3; }
;
expm: expd		{ $$ = $1; }
    | expm DZIELENIE expd	{ $$ = $1 / $3; }
;
expd: VAL		
    | NOT expd 		{ $$ = !$2; }
    
;
%%
int yyerror(char *s)
{
    printf("%s\n",s);	
    return 0;
}

int main()
{
    yyparse();
    printf("Przetworzono linii: %d\n",yylineno-1);
    return 0;
}
