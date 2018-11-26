/* ============================================================================
 *	(C) Copyright Martial Bornet, 2018.
 *
 *	Auteur       :     Martial BORNET (MB) - 24 Novembre 2018
 *
 *	Description  :     ________________________________________
 *
 *	Fichier      :     trap.c
 *
 *	@(#)	q_trap_sigsegv.c	1.1	18/11/25	Zen	
 *
 *	Liste des fonctions de ce fichier :
 *	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 *	- 
 * ============================================================================
 */

#define _GNU_SOURCE

#include <stdio.h>
#include <stdlib.h>
#include <signal.h>

void					 my_handler(int);

/* MAIN */
int main(int argc, char *argv[])
{
	sighandler_t		 _previous_handler;
	
	if ((_previous_handler = signal(SIGSEGV, my_handler)) == SIG_ERR) {
		fprintf(stderr, "%s: signal() returned an error !\n", argv[0]);
		exit(1);
	}

	pause();

	return 1;
}

/* MY_HANDLER */
void my_handler(int signum)
{
	printf("%s: received signal %d.\n", __func__, signum);
}
