%option main

digit [0-9]
minus_op [-]
plus_op [+]
mult_op [*]
div_op [/]
LP [(]
RP [)]
LB [{]
RB [}]
LSB [[]
RSB []]
comma [,]
semicolon [;]
colon [:]
and_op [&]
or_op [|]
logic_operand [{and_op}{or_op}]
less_op [<]
greater_op [>]
equivalent_op [==]
less_eq_op [<=]
greater_eq_op [>=]
comparison_operand [{less_op}{greater_op}{less_eq_op}{greater_eq_op}{equivalent_op}]
assign_operand [=]
string_id ["]
char_id [']
space [ ]
true_val [["true"]["on"]["yes"][1]]
false_val [["false"]["off"]["no"][0]]

letter [A-Za-z]

int {minus_op}?{digit}+

float {minus_op}?{digit}*(\.){digit}+

char {letter}?{digit}?
char_with_id ({char_id}{char}{char_id})

char_list {char}+

string {char_list}
string_with_id {string_id}{string}{string_id}

bool_value [{true_val}{false_val}]
logic_operation {bool_value}{logic_operand}{bool_value}
comparison_operation [{int}{float}]{comparison_operand}[{int}{float}]
bool_expr [{logic_operation}{bool_value}{comparison_operation}]

end_stmt {semicolon}
%%
{int} {printf("INT");}
{float} {printf("FLOAT");}
{char} {printf("CHAR");}
{char_with_id} {printf("CHAR_W_ID");}
{string} {printf("STRING");}
{string_with_id} {printf("STRING_W_ID");}
{LP} {printf("LP");}
{RP} {printf("RP");}
{end_stmt} {printf("END_STMT");}
{bool_value} {printf("BOOL_VALUE");}
{colon} {printf("COLON");}
{comma} {printf("COMMA");}
{true_val} {printf("TRUE_VAL");}
{false_val} {printf("FALSE_VAL");}
{bool_expr} {printf("BOOL_EXPR");}
. ;
%%
