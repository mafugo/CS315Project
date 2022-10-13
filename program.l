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
logic_operand ({and_op}|{or_op})
less_op [{]
greater_op [}]
equivalent_op {==}
less_eq_op {{=}
greater_eq_op {}=}
not_eq_op {!=}
comparison_operand [{less_op}{greater_op}{less_eq_op}{greater_eq_op}{equivalent_op}{not_eq_op}]
assign_operand [=]
string_id ["]
char_id [']
space [ ]
true (true)
on (on)
yes (yes)
false (false)
off (off)
no (no)
while (while)
true_val ({true}|{on}|{yes}|1)
false_val ({false}|{off}|{no}|0)

letter [A-Za-z]

int {minus_op}?{digit}+

float {minus_op}?{digit}*(\.){digit}+

char {letter}?{digit}?
char_with_id ({char_id}{char}{char_id})

num_val [{int}{float}{char}]
char_list {char}+

string {char_list}
string_with_id {string_id}{string}{string_id}

bool_value ({true_val}|{false_val})
logic_operation ({bool_value}{logic_operand}{bool_value})
comparison_operation {num_val}{comparison_operand}{num_val}
bool_expr ({logic_operation}|{bool_value}|{comparison_operation})

while_stmt ({while}{LB}{end_stmt}{RB})

end_stmt {semicolon}


declare_stmt 	({int_declare}|{str_declare}|{char_declare}|{float_declare}|{bool_declare})
int_declare (int{space}{int_var}|int{space}{int_assign})
float_declare (float{space}{float_var}|float{space}{float_assign})
str_declare (string{space}{str_var}|string{space}{str_assign})
char_declare (char{space}{char_var}|char{space}{char_assign})
bool_declare (bool{space}{bool_var}|bool{space}{logic_assign})



assign_stmt ({int_assign}|{float_assign}|{str_assign}|{char_assign}|{bool_assign})


int_assign ({int_var}={num_var}|{int_var}={num_val})
float_assign ({float_var}={num_var}|{float_var}={num_val})
str_assign ({str_var}={string_with_id})
char_assign ({char_var}={char_with_id})
bool_assign ({bool_var}={bool_value}|{bool_var}={bool_expr})


char_var ({letter}|{letter}{string})
string_var ({letter}|{letter}{string})
int_var ({letter}|{letter}{string})
float_var ({letter}|{letter}{string})
bool_var ({letter}|{letter}{string})
func_var ({letter}|{letter}{string})

var ({string_var}|{char_var}|{int_var}|{float_var}|{bool_var}| {func_var})

num_var ({int_var}|{float_var})



%%
{}
{bool_value} {printf("BOOL_VALUE");}
{logic_operation} {printf("LOGIC_OPERATION");}
{bool_expr} {printf("BOOL_EXPR");}
{logic_operand} {printf("LOGIC_OPERAND");}
{int} {printf("INT");}
{float} {printf("FLOAT");}
{char} {printf("CHAR");}
{char_with_id} {printf("CHAR_W_ID");}
{while} {printf("WHILE");}
{while_stmt} {printf("WHILE_STMT");}
{string} {printf("STRING");}
{string_with_id} {printf("STRING_W_ID");}
{LB} {printf("LB");}
{RB} {printf("RB");}
{LP} {printf("LP");}
{RP} {printf("RP");}
{end_stmt} {printf("END_STMT");}
{colon} {printf("COLON");}
{comma} {printf("COMMA");}
{comparison_operation} {printf("COMPARISON_OPERTION");}

{int_declare} {printf("INT_DECLARE");}
. ;
%%
