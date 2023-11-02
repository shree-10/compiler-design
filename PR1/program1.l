%{
#include<math.h>
FILE *fp;
%}
digit [0-9]+
header "#include<"[a-z]+".h>"
inbuilt [\t]*"printf(".*")"|[\t]*"scanf(".*")"|[\t]*"clrscr()"|[\t]*"getch()"|[\t]*"exit(.+)"\n
comment [\t ]*"/*".*"*/"[\t]*\n
main_function "void main()"
function [\t]*[a-zA-Z]+"(".*")"[\t]*\n
datatype [\t ]*"int"|[\t ]*"char"|[\t ]*"float"
operator "+"|"-"|"*"|"/"
terminator ";"
bracket1 [\t]*"{"[\t]*
bracket2 [\t]*"}"[\t]*
loop [\t ]*"if(".*")"|[\t ]*"else"|[\t ]*"for"|[\t ]*"while"|[\t ]*"do"
relational [\t]*"<"|">"|"<="|">="|"=="|"="|"!="|"%"
logical [\t]*"&&"|"||"
word [a-z]+[a-z0-9]*
%%
{digit} {printf("\n Numbers :: %s",yytext);}
{header} {printf("\n Header File :: %s",yytext);}
{inbuilt} {printf("\n Function :: %s",yytext);}
{comment} {printf("\n Comment :: %s",yytext);}
{main_function} {printf("\n Main Function :: %s",yytext);}
{function} {printf("\n User function :: %s",yytext);}
{datatype} {printf("\n Datatype :: %s",yytext);}
{operator} {printf("\n Operator :: %s",yytext);}
{terminator} {printf("\n Terminator :: %s",yytext);}
{bracket1} {printf("\n Opening curly bracket:: %s",yytext);}
{bracket2} {printf("\n Closing curly bracket:: %s",yytext);}
{relational} {printf("\n Realtional operator :: %s",yytext);}
{loop} {printf("\n Loop Statement :: %s",yytext);}
{logical} {printf("\n Logical Operator :: %s",yytext);}
{word} {printf("\n Variables :: %s",yytext);}
%%
int main(int argc,char *argv[])
{
fp=fopen(argv[1],"r");
if(fp!=NULL)
{
yyin=fp;
yylex();
}
return(0);
}
