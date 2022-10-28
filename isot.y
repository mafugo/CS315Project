%token INT
%token FLOAT
%token CHAR
%token BOOL
%token STRING
%token STATUS
%token PROTOCOL
%token SWITCH_NAME
%token WHILE
%token IF
%token ELSE
%token BREAK
%token CONTINUE
%token RETURN
%token FOR
%token LB
%token RB
%token LP
%token RP
%token END_STMT
%token COMMA
%token ASSIGN_OP
%token NOT_OP
%token NOT_EQ_OP
%token EQUIVALENT_OP
%token LESS_OP
%token GREATER_OP
%token LESS_EQ_OP
%token GREATER_EQ_OP
%token OR_OP
%token AND_OP
%token DIV_OP
%token MULT_OP
%token PLUS_OP
%token MINUS_OP
%token DOT
%token COMMENT
%token INPUT
%token INPUT_FROM_CONNECTION
%token PRINT
%token OUTPUT_TO_CONNECTION
%token READ_FROM_SENSOR
%token TIME_FROM_TIMER
%token CONNECT_FUNC
%token FUNC
%token NEW_INST
%token CONNECTION_CLASS
%token CONNECTION_CONSTRUCTOR
%token GET_STATUS_FUNC
%token GET_PROTOCOL_FUNC
%token GET_URL_FUNC
%token TURN_SWITCH_ON_FUNC
%token TURN_SWITCH_OFF_FUNC
%token TOGGLE_SWITCH_FUNC
%token GET_SWITCH_STATE_FUNC
%token INT_TYPE
%token FLOAT_TYPE
%token STRING_TYPE
%token CHAR_TYPE
%token BOOL_TYPE
%token STATUS_TYPE
%token PROTOCOL_TYPE
%token PROG_START
%token PROG_END
%token IDENTIFIER
%token SPACE
%%

// Start Rule

program: PROG_START stmts PROG_END

stmts: stmt | stmt stmts

stmt: matched_stmt | unmatched_stmt

unmatched_stmt:
            IF LP logic_expr RP LB stmts RB
            | IF LP logic_expr RP LB matched_stmt RB ELSE LB unmatched_stmt RB

matched_stmt: IF LP logic_expr RP LB matched_stmt RB ELSE LB matched_stmt RB 
            | assign_stmt END_STMT 
            | input_stmt END_STMT 
            | output_stmt END_STMT 
            | func_define 
            | func_call END_STMT 
            | read_from_sensor END_STMT 
            | time_from_timer END_STMT 
            | connect_stmt END_STMT 
            | declare_stmt END_STMT 
            | BREAK END_STMT 
            | CONTINUE END_STMT 
            | RETURN END_STMT 
            | arithmetic_op END_STMT 
            | COMMENT 
            | END_STMT 
            | while_stmt 
            | for_stmt

// func definition and func call 
func_define: FUNC SPACE IDENTIFIER LP parameters RP LB func_body RB

parameters: parameter | parameter parameters

parameter:  // empty
            | var_type SPACE IDENTIFIER
            

func_body: RETURN END_STMT | stmts


func_call: IDENTIFIER LP variables RP 

variables: IDENTIFIER | IDENTIFIER COMMA variables

var_type: INT_TYPE | FLOAT_TYPE | STRING_TYPE | CHAR_TYPE | BOOL_TYPE | STATUS_TYPE | PROTOCOL_TYPE

// arithmetic operations
arithmetic_op: numeric_value
                | arithmetic_op PLUS_OP numeric_value
                | arithmetic_op MINUS_OP numeric_value

numeric_value:  factor | 
                numeric_value MULT_OP factor |
                numeric_value DIV_OP factor

id: IDENTIFIER

factor: val
        | id
        | LP arithmetic_op RP

// declaration statements
declare_stmt: var_type SPACE IDENTIFIER 
| var_type SPACE assign_stmt

// assignment statements
assign_stmt: IDENTIFIER ASSIGN_OP IDENTIFIER
            | int_assign
            | float_assign
            | str_assign
            | char_assign
            | bool_assign
            | status_assign
            | protocol_assign
            
int_assign: IDENTIFIER ASSIGN_OP num_value
float_assign:IDENTIFIER ASSIGN_OP num_value
char_assign: IDENTIFIER ASSIGN_OP CHAR
str_assign: IDENTIFIER ASSIGN_OP STRING
bool_assign: IDENTIFIER ASSIGN_OP logic_expr
status_assign: IDENTIFIER ASSIGN_OP STATUS
protocol_assign: IDENTIFIER ASSIGN_OP PROTOCOL

num_value:  val 
        | arithmetic_op 
        | CHAR

val: INT | FLOAT
///////////////
// Omar's part
///////////////

// 9. Loops: While and For
while_stmt: WHILE LP logic_expr RP LB stmts RB

for_stmt: FOR LP declare_stmt END_STMT logic_expr END_STMT assign_stmt RP LB stmts RB

// 10. Logic Expressions
logic_expr: bool_factor 
            | logic_operation 
            | comparison_operation
            | NOT_OP logic_expr

logic_operation: logic_value
                | logic_expr OR_OP logic_value

logic_value: bool_factor
            | logic_value AND_OP bool_factor

bool_factor: BOOL
            | id
            | LP comparison_operation RP
            | LP logic_operation RP

comparable: id
            | num_value

comparison_operation: comparable comparision_op comparable

comparision_op: LESS_OP
                | GREATER_OP
                | EQUIVALENT_OP
                | GREATER_EQ_OP
                | LESS_EQ_OP
                | NOT_EQ_OP

// 11. Operators
// nothing to define here

// //////////////
// Ahmet's part
// //////////////
/* --------------6-------*/
input_stmt: INPUT LP IDENTIFIER RP

input_from_connection: IDENTIFIER DOT INPUT_FROM_CONNECTION LP IDENTIFIER RP

output_stmt: PRINT LP IDENTIFIER RP

output_to_connection: IDENTIFIER DOT OUTPUT_TO_CONNECTION LP IDENTIFIER RP

read_from_sensor: READ_FROM_SENSOR LP IDENTIFIER COMMA IDENTIFIER RP

time_from_timer: TIME_FROM_TIMER  LP IDENTIFIER RP

// *--------------7----------*/

connect_obj_creation: CONNECTION_CLASS SPACE IDENTIFIER ASSIGN_OP NEW_INST SPACE CONNECTION_CONSTRUCTOR

connect_stmt: IDENTIFIER DOT CONNECT_FUNC LP url RP
url: STRING

get_connect_status: IDENTIFIER DOT GET_STATUS_FUNC LP IDENTIFIER RP

get_connect_protocol: IDENTIFIER DOT GET_PROTOCOL_FUNC LP IDENTIFIER RP

get_connect_URL:  IDENTIFIER DOT GET_URL_FUNC LP IDENTIFIER RP 

//-----  14------

turn_switch_on: TURN_SWITCH_ON_FUNC LP SWITCH_NAME RP 
turn_switch_off: TURN_SWITCH_OFF_FUNC LP SWITCH_NAME RP
toggle_switch: TOGGLE_SWITCH_FUNC LP SWITCH_NAME RP
get_switch_state: GET_SWITCH_STATE_FUNC LP SWITCH_NAME COMMA IDENTIFIER RP

%%
#include "lex.yy.c"
void yyerror(char *s) { printf("%s", s); } 

int main() {
return yyparse(); }