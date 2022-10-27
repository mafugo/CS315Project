%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
void yyerror(char* s);
extern int yylineno;
%}

%%

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
%token COLON
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
%token SINGLE_QUOTE
%token DOUBLE_QUOTE
%token NEW_LINE
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
%%

// Start Rule

program: stmts

stmts: stmt | stmt stmts

stmt: if_stmt | non-if_stmt

if_stmt: matched_stmt | unmatched_stmt

non-if_stmt: 
            assign_stmt end_stmt | 
            input_stmt end_stmt |
            output_stmt end_stmt |
            func_define |
            func_call end_stmt |
            read_from_sensor end_stmt |
            time_from_timer end_stmt |
            connect_stmt end_stmt |
            declare_stmt end_stmt |
            break_stmt end_stmt |
            continue_stmt end_stmt |
            return_stmt end_stmt| 
            arithmetic_op end_stmt | 
            comment | end_stmt | 
            while_stmt | for_stmt 

// func definition and func call 
func_define: func space func_var LP parameters RP LB func_body RB

parameters: parameter | parameter parameters

parameter:  // empty
            | int space int_var
            | float space float_var
            | string space string_var
            | bool space bool_var
            | char space char_var
            | status space status_var
            | protocol space protocol_var

func_body: return_stmt | stmts return_stmt

func_call: func_var LP variables RP 

variables: var | var COMMA variables

var_types: int | float | string | char | bool | status | protocol

// continue- break return & end statements 
continue_stmt: CONTINUE

break_stmt: BREAK

return_stmt: RETURN

end_stmt: END_STMT

// comment 
comment: COMMENT

// arithmetic operations
arithmetic_op: 
                numeric_value | 
                arithmetic_op PLUS_OP numeric_value |
                arithmetic_op MINUS_OP numeric_value |

numeric_value:  factor | 
                numeric_value MULT_OP factor |
                numeric_value DIV_OP factor

factor: int | float | int_var | float_var | LP arithmetic_op RP

// data types
int: INT
float: FLOAT
bool: BOOL
char: CHAR
string: STRING

// declaration statements
declare_stmt: int_declare
            | float_declare
            | str_declare
            | char_declare
            | bool_declare
            | status_declare
            | protocol_declare

int_declare: int space int_var | int space int_assign
float_declare: float space float_var | float space float_assign
char_declare: char space char_var | char space char_assign
str_declare: string space str_var | string space str_assign
bool_declare: bool space bool_var | bool space bool_assign
status_declare: status space status_var | status space status_assign
protocol_declare: protocol space protocol_var | protocol space protocol_assign

// assignment statements
assign_stmt: int_assign
            | float_assign
            | str_assign
            | char_assign
            | bool_assign
            | status_assign
            | protocol_assign
            
int_assign: int_var ASSIGN_OP num_var
            | int_var ASSIGN_OP num_value
float_assign: float_var ASSIGN_OP float_var
            | float_var ASSIGN_OP num_value
char_assign: char_var ASSIGN_OP char
str_assign: string_var ASSIGN_OP str_var
bool_assign: bool_var ASSIGN_OP bool_value
            | bool_var ASSIGN_OP logic_expr
status_assign: status_var ASSIGN_OP status_var
            | status_var ASSIGN_OP status_value
protocol_assign: protocol_var ASSIGN_OP protocol_var
            | protocol_var ASSIGN_OP protocol_value

num_var: int_var | float_var
num_value: int | float | arithmetic_op | alphanumeric

bool_value: BOOL

var: str_var | char_var |int_var 
    | float_var | bool_var | 
    | func_var | status_var
    |protocol_var



            