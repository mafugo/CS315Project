%option main
start start
end end
LP "("
RP ")"
LB "{"
RB "}"
comma ","
dot "."
semicolon ";"
colon ":"
double_quote \"
single_quote \'
new_line \n
minus_op "-"
plus_op "+"
mult_op "*"
div_op "/"
and_op "&"
or_op "|"
less_op "<"
greater_op ">"
equivalent_op "=="
less_eq_op "<="
greater_eq_op ">="
not_eq_op "!="
not_op "!"
assign_op "="
hashtag "#"
space " "

int_type "int"
float_type "float"
string_type "string"
char_type "char"
bool_type "bool"

true "true"|"yes"|"on"
false "false"|"off"|"no"

while "while"
for "for"
if "if"
else "else"
func "func"
return "return"
continue "continue"
break "break"

digit [0-9]
letter [A-Za-z]

int {minus_op}?{digit}+
float {minus_op}?{digit}*(\.){digit}+


alphanumeric ({letter}|{digit})
identifier ({letter}|({letter}{alphanumeric}+))
string \".*\"
char \'({letter}|{digit})\'


bool ({true}|{false})
end_stmt {semicolon}

comment		{hashtag}([^\n]*)(\n)

input (input)
input_from_connection (input_from_connection)
print (print)
output_to_connection (output_to_connection)
read_from_sensor (read_from_sensor)
time_from_timer (time_from_timer)

new_inst "new"
connect_func "connect"
connection_class "Connect"
get_status_func "getStatus"
get_protocol_func "getProtocol"
getURL_func "getURL"


%%
{int} {printf("INT ");}
{float} {printf("FLOAT ");}
{char} {printf("CHAR ");}
{bool} {printf("BOOL ");}
{string} {printf("STRING ");}
{while} {printf("WHILE ");}
{if} {printf("IF ");}
{else} {printf("ELSE ");}
{break} {printf("BREAK ");}
{continue} {printf("CONTINUE ");}
{return} {printf("RETURN ");}
{func} {printf("FUNC ");}
{for} {printf("FOR ");}
{LB} {printf("LB ");}
{RB} {printf("RB ");}
{LP} {printf("LP ");}
{RP} {printf("RP ");}
{end_stmt} {printf("END_STMT ");}
{colon} {printf("COLON ");}
{comma} {printf("COMMA ");}
{assign_op} {printf("ASSIGN_OP ");}
{not_op} {printf("NOT_OP ");}
{not_eq_op} {printf("NOT_EQ_OP ");}
{equivalent_op} {printf("EQUIVALENT_OP ");}
{less_op} {printf("LESS_OP ");}
{greater_op} {printf("GREATER_OP ");}
{less_eq_op} {printf("LESS_EQ_OP ");}
{greater_eq_op} {printf("GREATER_EQ_OP ");}
{or_op} {printf("OR_OP ");}
{and_op} {printf("AND_OP ");}
{div_op} {printf("DIV_OP ");}
{mult_op} {printf("MULT_OP ");}
{plus_op} {printf("PLUS_OP ");}
{minus_op} {printf("MINUS ");}
{single_quote} {printf("SINGLE_QUOTE ");}
{double_quote} {printf("DOUBLE_QUOTE ");}
{new_line} {printf("NEW_LINE\n");}
{hashtag} {printf("HASHTAG ");}
{dot} {printf("DOT ");}
{comment} {printf("COMMENT");}
{input} {printf("INPUT ");}
{input_from_connection} {printf("INPUT_FROM_CONNECTION ");}
{print} {printf("PRINT ");}
{output_to_connection} {printf("OUTPUT_TO_CONNECTION ");}
{read_from_sensor} {printf("READ_FROM_SENSOR ");}
{time_from_timer} {printf("TIME_FROM_TIMER ");}
{connect_func} {printf("CONNECT_FUNC ");}
{new_inst} {printf("NEW_INST ");}
{connection_class} {printf("CONNECTION_CLASS ");}
{get_status_func} {printf("GET_STATUS_FUNC ");}
{get_protocol_func} {printf("GET_PROTOCOL_FUNC ");}
{getURL_func} {printf("GET_URL_FUNC ");}
{int_type} {printf("INT_TYPE ");}
{float_type} {printf("FLOAT_TYPE ");}
{string_type} {printf("STRING_TYPE ");}
{char_type} {printf("CHAR_TYPE ");}
{bool_type} {printf("BOOL_TYPE ");}
{identifier} {printf("IDENTIFIER ");}
. ;
%%