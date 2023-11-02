digit [0-9]+
string [a-zA-Z]+
%%
{digit} printf("Digit:%s\n",yytext);
{string} printf("String:%s\n",yytext);

%%
int main()
{ 
yylex(); 
}

