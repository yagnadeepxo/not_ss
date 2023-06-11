// lex file
%{
#include "y.tab.h"
%}

%%
[aA] { return A; }
[bB] { return B; }
"\\n" { return NL; }
. { return yytext[0]; }
%%

int yywrap() { return 1; }

// yacc file

%{
#include <stdio.h>
#include <stdlib.h>
%}

%token A B NL

%%
stmt: A A A A A A A A A S B NL { printf("Valid string\n"); exit(0); }
    ;

S: S A
  |
  ;
%%

int yyerror(char *msg) {
    printf("Invalid string\n");
    exit(0);
}

int main() {
    printf("Enter the string: ");
    yyparse();
    return 0;
}

