#       @(#)     [Zen] q_Makefile       Version 1.5 du 18/11/26 - 


all		: programs asm dumps

programs	: numbers names segv trap_sigsegv names_segv backtrace_segv

asm		: backtrace.s

dumps		: numbers.dump names.dump

numbers		: backtrace.c
		$(CC) -o $@ $<

names		: backtrace.c
		$(CC) -rdynamic -o $@ $<

names_segv	: backtrace_segv.c
		$(CC) -rdynamic -o $@ $<

backtrace.s	: backtrace.c
		$(CC) -Wa,-adhln backtrace.c  > backtrace.s 

numbers.dump	: numbers
		objdump -S --disassemble $< > $@

names.dump	: names
		objdump -S --disassemble $< > $@

segv		: segv.c
		$(CC) -o $@ $<

gen_segv	: segv
		./segv

gen_core	: segv
		bash -c 'ulimit -c unlimited; ./segv'

trap_sigsegv	: trap_sigsegv.c
		$(CC) -o $@ $<

backtrace_segv	: backtrace_segv.c
		$(CC) -rdynamic -o $@ $<

clean		:
		@ rm -f numbers numbers.dump names names.dump backtrace.s a.out core segv trap_sigsegv
