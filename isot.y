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



/*--------------6-------*/
input_stmt: INPUT LP inbody RP

inbody: var

input_from_connection: connect_var DOT INPUT_FROM_CONNECTION LP inbody RP

output_stmt: PRINT LP outbody RP

output_to_connection: connect_var DOT OUTPUT_TO_CONNECTION LP outbody RP

read_from_sensor: READ_FROM_SENSOR LP sensor_name COMMA inbody RP

sensor_name: IDENTIFIER

time_from_timer: TIME_FROM_TIMER  LP int_var RP

outbody: arithmetic_operation 
    | values 
    | var

url: STRING


/*--------------7----------*/

connect_obj_creation: CONNECT_FUNC space connect_var ASSIGN_OP  NEW_INST space CONNECT_FUNC LP RP

connect_stmt: connect_var DOT CONNECT_FUNC LP url RP

get_connect_status: connect_var DOT GET_STATUS_FUNC LP status_var RP

get_connect_protocol: connect_var DOT GET_PROTOCOL_FUNC LP protocol_var RP

get_connect_URL:  connect_var DOT GET_URL_FUNC LP string_var RP 

connect_var: identifier

status_var: identifier

protocol_var: identifier

status_value: STATUS //connected | connecting | disconnected | host_not_found | connection_timeout 

protocol_value: PROTOCOL_TYPE //http | https | tcp | ftp | tftp
