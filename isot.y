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
%token MINUS
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
            arithmetic_op end_stmt | 
            comment | end_stmt | 
            while_stmt | for_stmt

// //////////////////
continue_stmt: CONTINUE


///////////////
// Omar's part
///////////////

// 8. Conditional Statements: If-Else
matched_stmt:
            IF LP logic_expr RP LB matched_stmt RB ELSE LB matched_stmt RB
            | non-if_stmt

unmatched_stmt:
            IF LP logic_expr RP LB stmts RB
            | IF LP logic_expr RP LB matched_stmt RB ELSE LB unmatched_stmt RB

// 9. Loops: While and For
while_stmt: WHILE LP logic_expr RP LB stmts RB

for_stmt: FOR LP declare_stmt end_stmt logic_expr end_stmt assign_stmt RP LB stmts RB

// 10. Logic Expressions
logic_expr: bool_value 
            | logic_operation 
            | comparison_operation

logic_operation: logic_value
                | logic_expr OR_OP logic_value

logic_value: bool_factor
            | logic_value AND_OP bool_factor

bool_factor: bool_value
            | bool_var
            | LP comparison_operation RP
            | LP logic_operation RP

comparable: num_var
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