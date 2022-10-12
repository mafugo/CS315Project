%option main

digit [0-9]

negative_sign [-]
LP [(]
RP [)]
LB [{]
RB [}]
LSB [[]
RSB []]
logic_operand [&|]
comparison_operand [<>(<=)(>=)(==)]
assign_operand [=]
string_id ["]
char_id [']
bool_value [(true)(false)10(on)(off)]

letter [A-Za-z]

int {negative_sign}?{digit}+

float {negative_sign}?{digit}*(\.){digit}+

char {letter}?{digit}?
char_with_id ({char_id}{char}{char_id})

char_list {char}+

string {char_list}
string_with_id {string_id}{string}{string_id}


if if
while while

%%
{int} {printf("INT");}
{float} {printf("FLOAT");}
{char} {printf("CHAR");}
{char_with_id} {printf("CHAR_W_ID");}
{string} {printf("STRING");}
{string_with_id} {printf("STRING_W_ID");}
{LP} {printf("LP");}
. ;
%%
