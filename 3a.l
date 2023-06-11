%{
#include<stdio.h>
int wc = 0, sc = 0, lc = 0, cc = 0;
char infile[25];
%}

word [a-zA-Z0-9]+
eol [\n]+

%%
{word} { wc++; cc += yyleng; }
{eol} { lc++; cc++; }
["\t"] { sc += 8; cc++; }
[" "] { sc++; cc++; }
. { cc++; }
%%

int yywrap() {}

int main() {
    FILE *yyin;
    printf("\nRead the input file\n");
    scanf("%s", infile);
    yyin = fopen(infile, "r");
    yylex();
    fclose(yyin);
    printf("Number of characters = %d\n", cc);
    printf("Number of words = %d\n", wc);
    printf("Number of spaces = %d\n", sc);
    printf("Number of lines = %d\n", lc);
    return 0;
}
