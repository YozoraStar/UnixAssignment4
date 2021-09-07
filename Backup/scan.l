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
 *	A quick Lex Example Program. 
 */

%option noyywrap
%option nounput
%option noinput

%{
  #include <stdlib.h>
  #include "program4.h"
%}

%%

[ \t\r]+			{ /* eat up whitespace */ }
[A-Z]\.|[A-Z]     { return NAME_INITIAL_TOKEN; }
M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})      { return ROMANTOKEN; }
"Sr."     { return SRTOKEN; }
"Jr."      { return JRTOKEN; }
"#"      { return HASHTOKEN; }
","      { return COMMATOKEN; }
[\n]      { return EOLTOKEN; }
"-"      { return DASHTOKEN; }
[1-9][0-9]*			{ return INTTOKEN; }
[A-Z][a-z|A-Z]*      { return NAMETOKEN; }
[a-z|A-Z|0-9][a-z|A-Z|0-9]*      { return IDENTIFIERTOKEN; }

%%

/* 
 * Main routine in a separate file.
 */
