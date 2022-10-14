correct: lex.yy.c
	gcc -o correct lex.yy.c
lex.yy.c: correct.l
	lex correct.l
clean:
	rm -f lex.yy.c y.tab.c y.output *~
