%{
#include "y.tab.h"
%}

%%
[aA] { return A; }
[bB] { return B; }
"\n" { return NL; }
. { return yytext[0]; }
%%

int yywrap() { return 1; }

// yacc

%{
#include <stdio.h>
#include <stdlib.h>
%}

%token A B NL

%%
stmt: S NL { printf("Valid string\n"); exit(0); }
    ;

S: A S B
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


