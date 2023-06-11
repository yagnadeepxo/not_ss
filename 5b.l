// lex

%{
#include "y.tab.h"
%}
%%
[0-9]+ { yylval = atoi(yytext); return NUM; }
[\t] ;
\n return 0;
. return yytext[0];
%%

int yywrap() { return 1; }

// yacc
%{
#include <stdio.h>
%}
%token NUM
%left '+' '-'
%left '/' '*'
%%
expr: e { printf("Valid expression\n"); printf("Result: %d\n", $1); return 0; }
    ;
e: e '+' e { $$ = $1 + $3; }
 | e '-' e { $$ = $1 - $3; }
 | e '*' e { $$ = $1 * $3; }
 | e '/' e { $$ = $1 / $3; }
 | '(' e ')' { $$ = $2; }
 | NUM { $$ = $1; }
    ;
%%

int main()
{
    printf("\nEnter an arithmetic expression\n");
    yyparse();
    return 0;
}

int yyerror()
{
    printf("\nInvalid expression\n");
    return 0;
}
