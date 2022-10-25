correct: lex.yy.c y.tab.c
	gcc -o isot y.tab.c
y.tab.c: isot.y
	yacc isot.y
lex.yy.c: isot.l
	lex correct.l
clean:
	rm -f lex.yy.c y.tab.c y.output *~
