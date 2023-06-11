%{
    #include<stdio.h>
    int cc = 0;
%}

%x CMNT

%%
"/*" {BEGIN CMNT;}
<CMNT>. ;
<CMNT>"*/" {BEGIN 0; cc++;}
%%

int yywrap() {}

int main(int argc, char *argv[]){
    if(argc!=3){
        printf("usage: %s <src_file><dest_file>\n",argv[0]);
        return 0;
    }
    yyin = fopen(argv[1],"r");
    yyout = fopen(argv[2],"w");
    yylex();
    printf("\nNumber of multiline comments = %d\n",cc);
    return 0;
}

// if the above doesnt work try the below code

// %{
// #include<stdio.h>
// int cc = 0;
// %}

// %x CMNT

// %%
// "/*" {BEGIN CMNT;}
// <CMNT>. ;
// <CMNT>"*/" {BEGIN 0; cc++;}
// %%

// int yywrap() {}

// int main(int argc, char *argv[]){
//     FILE *yyin;
//     FILE *yyout;

//     if(argc != 3){
//         printf("Usage: %s <src_file> <dest_file>\n", argv[0]);
//         return 0;
//     }

//     yyin = fopen(argv[1], "r");
//     yyout = fopen(argv[2], "w");
//     yylex();

//     fclose(yyin);
//     fclose(yyout);

//     printf("\nNumber of multiline comments = %d\n", cc);
//     return 0;
// }


