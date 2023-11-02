%{
/* Definition section */

#include<stdio.h>
int flag=0;
%}
%{ 
int yylex();
void yyerror();
%}
%token ONE ZERO NL
/* Rule Section */
%%
str1: str2 n1 { } ;
str2: ZERO str2 ONE { }
| ZERO ONE { } ; n1 : NL {return(0);} ;
%%
//driver code
void main()
{ printf("\nEnter string (any combination of 0 and 1)\n");
yyparse();
if(flag==0)
printf("\nEntered string is Valid for L=[0^n1^n]\n\n");
}
void yyerror()
{ printf("\nEntered arithmetic is Invalid for L=[0^n1^n]\n\n");
flag=1;
}
