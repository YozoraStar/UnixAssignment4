/*
 * Filename:	scan.l
 * Date:		  02/20/2020
 * Author:		Jerry Huynh
 * Email:		  jsh170830@utdallas.edu
 * Version:		1.0
 * Copyright:	2020, All Rights Reserved
 *
 * Description:
 *
 *	A quick Lex Program. 
 */

%option noyywrap
%option nounput
%option noinput

%{
  #include <stdlib.h>
  #include "y.tab.h"
%}

%%

[ \t\r]+			      { /* eat up whitespace */ }
[A-Z][a-z|A-Z]*     { yylval.str = yytext; return NAMETOKEN; }
[A-Z]\.|[A-Z]       { yylval.str = yytext; return NAME_INITIAL_TOKEN; }
"Jr."               { yylval.str = yytext; return JRTOKEN; }
"Sr."               { yylval.str = yytext; return SRTOKEN; }
M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})      { yylval.str = yytext; return ROMANTOKEN; }
[1-9][0-9]*         { yylval.value = atoi(yytext); return INTTOKEN; }
[a-z|A-Z|0-9][a-z|A-Z|0-9]*      { yylval.str = yytext; return IDENTIFIERTOKEN; }
"#"                 { return HASHTOKEN; }
","                 { return COMMATOKEN; }
[\n]                { return EOLTOKEN; }
"-"                 { return DASHTOKEN; }

%%

/* 
 * Main routine in a separate file.
 */
