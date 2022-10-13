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
less_op [<]
greater_op [>]
equivalent_op (==)
less_eq_op (<=)
greater_eq_op (>=)
not_eq_op (!=)
comparison_operand ({less_op}|{greater_op}|{less_eq_op}|{greater_eq_op}|{equivalent_op}|{not_eq_op})
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
for (for)
func (func)
return (return)
return_stmt ({return}{space}{values}{end_stmt})
continue_stmt (continue)
break_stmt (break)
else (else)
true_val ({true}|{on}|{yes})
false_val ({false}|{off}|{no})

letter [A-Za-z]

int {minus_op}?{digit}+

float {minus_op}?{digit}* {digit}+

char {letter}?{digit}?
char_with_id ({char_id}{char}{char_id})

num_val ({int}|{float}|{char})
char_list {char}+

string {char_list}
string_with_id {string_id}{string}{string_id}

stmts {stmt}+
stmt {{if_stmt}|{non-if_stmt}}
if_stmt ({matched_stmt}|{unmatched_stmt})

matched_stmt (({if}{LP}{bool_expr}{RP}{matched_stmt}{else}{matched_stmt} )|({non-if_stmt}))
unmatched_stmt (({if}{LP}{bool_expr}{RP}{stmt})| ({if}{LP}{bool_expr}{RP}{matched_stmt}{else}{unmatched_stmt}))

non-if_stmt ({declare_stmt}|{assign_stmt}|{func_define}|{break_stmt}{continue_stmt}{while_stmt}{for_stmt}{end_stmt})

bool_value ({true_val}|{false_val})
logic_operation ({bool_value}{logic_operand}{bool_value})
comparison_operation (({int}|{float}|{char}){comparison_operand}({int}|{float}|{char}))
bool_expr ({logic_operation}|{bool_value}|{comparison_operation})

while_stmt ({while}{bool_expr}{LB}{stmts}{RB})
for_stmt ({for}{LP}{declare_stmt}{end_stmt}{bool_expr}{end_stmt}{RP}{LB}{stmts}{RB})

end_stmt {semicolon}

<<<<<<< HEAD
=======
parameters {parameter}+
parameter (({int}{space}{int_var})|({float}{space}{float_var})|({string}{space}{string_var})|({char}{space}{char_var})|({bool}{space}{bool_var}))
func_body ({return_stmt}|{stmts}{return_stmt})
values ({int}|{float}|{bool}|{string}|{char})
func_define ({func}{space}{func_var}{LP}{parameters}{RP}{LB}{func_body}{RB})
>>>>>>> 626467d884d91b3c8a20d579a774ec26c57d20f9

declare_stmt 	({int_declare}|{str_declare}|{char_declare}|{float_declare}|{bool_declare})

int_declare (int{space}{int_var}|int{space}{int_assign})
float_declare (float{space}{float_var}|float{space}{float_assign})
str_declare (string{space}{str_var}|string{space}{str_assign})
char_declare (char{space}{char_var}|char{space}{char_assign})
bool_declare (bool{space}{bool_var}|bool{space}{bool_assign})



assign_stmt ({int_assign}|{float_assign}|{str_assign}|{char_assign}|{bool_assign})

int_assign ({int_var}{assign_operand}{num_var}|{int_var}{assign_operand}{num_val})
float_assign ({float_var}{assign_operand}{num_var}|{float_var}{assign_operand}{num_val})
str_assign ({str_var}{assign_operand}{string_with_id})
char_assign ({char_var}{assign_operand}{char_with_id})
bool_assign ({bool_var}{assign_operand}{bool_value}|{bool_var}{assign_operand}{bool_expr})


char_var ({letter}|{letter}{string})
str_var ({letter}|{letter}{string})
int_var ({letter}|{letter}{string})
float_var ({letter}|{letter}{string})
bool_var ({letter}|{letter}{string})
func_var ({letter}|{letter}{string})

var ({str_var}|{char_var}|{int_var}|{float_var}|{bool_var}| {func_var})

num_var ({int_var}|{float_var})



input (input)
print (print)
input_from_connection (input_from_connection)
output_to_connection (output_to_connection)
read_from_sensor_object (read_from_sensor)
time_from_timer_object  (time_from_timer)
timestamp (int)
connect (connect)
URL ({string_id}{string}{string_id})

input_stmt ({input}{LP}{inbody}{RP})
input_from_connection_stmt ({input_from_connection}{LP}{URL}{comma}{inbody}{RP})
output_stmt ({print}{LP}{outbody}{RP})
output_to_connection_stmt ({output_to_connection}{LP}{URL}{comma}{outbody}{RP})
read_from_sensor ({read_from_sensor}{LP}{sensor_name}{comma}{outbody}{RP})
time_from_timer ({time_from_timer}{LP}{timestamp}{RP})
connect_stmt ({connect}{LP}{URL}{RP})

inbody (({bool_exp})|({char})|({int})|({float})|({string}))
outbody (({values}{plus_op}{outbody})|({values})|({var}{plus_op}{outbody})|({var}))







non_if_stmt (({assign_stmt}{end_stmt})|({input_stmt}{end_stmt})|({output_stmt}{end_stmt})|({func_define})|({func_call}{end_stmt})|({read_from_sensor}{end_stmt})|({time_from_timer}{end_stmt})|({connect_stmt}{end_stmt})|({declare_stmt}{end_stmt})|({break_stmt}{end_stmt})|({continue_stmt}{end_stmt})|({arithmetic_op}{end_stmt})|({comment})|({end_stmt})|({while_stmt})|({for_stm}))
matched_stmt (({if}{LP}{bool_expr}{RP}{matched_stmt}{else}{matched_stmt} )|({non-if_stmt}))
unmatched_stmt (({if}{LP}{bool_expr}{RP}{stmt})| ({if}{LP}{logic_expr}{RP}{matched_stmt}{else}{unmatched_stmt}))




%%
{int} {printf("INT");}
{float} {printf("FLOAT");}
{char} {printf("CHAR");}
{bool_value} {printf("BOOL_VALUE");}
{logic_operand} {printf("LOGIC_OPERAND");}
{comparison_operand} {printf("COMPARISON_OPERAND");}
{bool_expr} {printf("BOOL_EXPR");}

{inbody} {printf("INBODY")}
{outbody} {printf()}
{input_stmt} {printf("INPUT_STATEMENT")}
{input_from_connection_stmt} {printf("INPUT_FROM_CONNECTION_STMT")}
{output_stmt} {printf("OUTPUT_STMT")}
{output_to_connection_stmt} {printf("OUTPUT_TO_CONNECTION_STMT")}
{read_from_sensor} {printf("READ_FROM_SENSOR")}
{time_from_timer} {printf("TIME_FROM_TIMER")}
{connect_stmt} {printf("CONNECT_STMT")}
 


{char_with_id} {printf("CHAR_W_ID");}
{while} {printf("WHILE");}
{while_stmt} {printf("WHILE_STMT");}
{for} {printf("FOR");}
{for_stmt} {printf("FOR_STMT");}
{string} {printf("STRING");}
{string_with_id} {printf("STRING_W_ID");}
{LB} {printf("LB");}
{RB} {printf("RB");}
{LP} {printf("LP");}
{RP} {printf("RP");}
{end_stmt} {printf("END_STMT");}
{colon} {printf("COLON");}
{comma} {printf("COMMA");}
{values} {;}
{parameter} {printf("PARAMETER");}
{func_define} {printf("FUNC_DEFINE");}
{int_declare} {printf("INT_DECLARE");}
{str_declare} {printf("STR_DECLARE");}
{char_declare} {printf("CHAR_DECLARE");}
{bool_declare} {printf("BOOL_DECLARE");}
{float_declare} {printf("FLOAT_DECLARE");}

{float_assign} {printf("FLOAT_ASSIGN");}
{int_assign} {printf("INT_ASSIGN");}
{str_assign} {printf("STR_ASSIGN");}
{char_assign} {printf("CHAR_ASSIGN");}
{bool_assign} {printf("BOOL_ASSIGN");}
. ;
%%
