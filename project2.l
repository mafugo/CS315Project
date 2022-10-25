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
status_type "status"
protocol_type "protocol"

prog_start "start"
prog_end "end"

true "true"|"yes"|"on"
false "false"|"off"|"no"

while "while"
for "for"
under_score "_"
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
alphasumeric ({letter}|{digit}|{under_score})
identifier ({letter}|({letter}{alphasumeric}+))
string \".*\"
char \'({letter}|{digit})\'


bool ({true}|{false})

status "connected"|"connecting"|"disconnected"|"host_not_found"|"connection_timeou"
protocol "http"|"https"|"tcp"|"ftp"|"tftp"

end_stmt {semicolon}

comment	{hashtag}([^\n]*)

input "input"
input_from_connection "input_from_connection"
print "print"
output_to_connection "output_to_connection"
read_from_sensor "read_from_sensor"
time_from_timer "time_from_timer"

new_inst "new"
connect_func "connect"
connection_class "Connection"
connection_constructor "Connection()"
get_status_func "getStatus"
get_protocol_func "getProtocol"
getURL_func "getURL"


%%
{int} return INT;
{float} return FLOAT;
{char} return CHAR;
{bool} return BOOL;
{string} return STRING;
{status} return STATUS;
{protocol} return PROTOCOL;
{while} return WHILE;
{if} return IF;
{else} return ELSE;
{break} return BREAK;
{continue} return CONTINUE;
{return} return RETURN;
{for} return FOR;
{LB} return LB;
{RB} return RB;
{LP} return LP;
{RP} return RP;
{end_stmt} return END_STMT;
{colon} return COLON;
{comma} return COMMA;
{assign_op} return ASSIGN_OP;
{not_op} return NOT_OP;
{not_eq_op} return NOT_EQ_OP;
{equivalent_op} return EQUIVALENT_OP;
{less_op} return LESS_OP;
{greater_op} return GREATER_OP;
{less_eq_op} return LESS_EQ_OP;
{greater_eq_op} return GREATER_EQ_OP;
{or_op} return OR_OP;
{and_op} return AND_OP;
{div_op} return DIV_OP;
{mult_op} return MULT_OP;
{plus_op} return PLUS_OP;
{minus_op} return MINUS;
{single_quote} return SINGLE_QUOTE;
{double_quote} return DOUBLE_QUOTE;
{new_line} return NEW_LINE;
{dot} return DOT;
{comment} return COMMENT;
{input} return INPUT;
{input_from_connection} return INPUT_FROM_CONNECTION;
{print} return PRINT;
{output_to_connection} return OUTPUT_TO_CONNECTION;
{read_from_sensor} return READ_FROM_SENSOR;
{time_from_timer} return TIME_FROM_TIMER;
{connect_func} return CONNECT_FUNC;
{func} return FUNC;
{new_inst} return NEW_INST;
{connection_class} return CONNECTION_CLASS;
{connection_constructor} return CONNECTION_CONSTRUCTOR;
{get_status_func} return GET_STATUS_FUNC;
{get_protocol_func} return GET_PROTOCOL_FUNC;
{getURL_func} return GET_URL_FUNC;
{int_type} return INT_TYPE;
{float_type} return FLOAT_TYPE;
{string_type} return STRING_TYPE;
{char_type} return CHAR_TYPE;
{bool_type} return BOOL_TYPE;
{status_type} return STATUS_TYPE;
{protocol_type} return PROTOCOL_TYPE;
{prog_start} return PROG_START;
{prog_end} return PROG_END;
{identifier} return IDENTIFIER;
. ;
%%