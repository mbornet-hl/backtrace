//	@(#)	[Zen] q_segv.c	Version 1.1 du 18/11/25 - 

#include <stdio.h>

void beta(void)
{
	char			*_p;

	_p		= NULL;
	*_p		= 'X';
}

void alpha(void)
{
	beta();
}

int main()
{
	alpha();

	return 0;
}
