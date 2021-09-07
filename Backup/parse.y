/*
 * Filename:	parse.y
 * Date:		02/20/2020
 * Author:		Jerry Huynh
 * Email:		jsh170830@utdallas.edu
 * Version:		1.0
 * Copyright:	2020, All Rights Reserved
 *
 * Description:
 *
 *	A quick Bison Program. 
 */
%{
    #include <stdio.h>
%}

/* declare tokens */
%token NAME_INITIAL_TOKEN ROMANTOKEN SRTOKEN JRTOKEN HASHTOKEN COMMATOKEN EOLTOKEN DASHTOKEN INTTOKEN NAMETOKEN IDENTIFIERTOKEN

%%

postal_addresses: address_block EOLTOKEN postal_addresses
| address_block
;
address_block: name_part street_address location_part
;
name_part: personal_part last_name suffix_part EOLTOKEN
| personal_part last_name EOLTOKEN
| error
;
personal_part: NAMETOKEN
| NAME_INITIAL_TOKEN
;
last_name: NAMETOKEN
;
suffix_part: SRTOKEN
| JRTOKEN
| ROMANTOKEN
;
street_address: street_number street_name INTTOKEN EOLTOKEN
| street_number street_name HASHTOKEN INTTOKEN EOLTOKEN
| street_number street_name EOLTOKEN
| error
;
street_number: INTTOKEN
| IDENTIFIERTOKEN
;
street_name: NAMETOKEN
;
location_part: town_name COMMATOKEN state_code zip_code EOLTOKEN
| error
;
town_name: NAMETOKEN
;
state_code: NAMETOKEN
;
zip_code: INTTOKEN DASHTOKEN INTTOKEN
| INTTOKEN
;

%%

/* 
 * Empty
 */