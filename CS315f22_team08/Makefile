correct: lex.yy.c y.tab.c
	gcc -o parser y.tab.c
y.tab.c: CS315f22_team08.yacc
	yacc CS315f22_team08.yacc
lex.yy.c: CS315f22_team08.lex
	lex CS315f22_team08.lex
clean:
	rm -f lex.yy.c y.tab.c y.output *~
