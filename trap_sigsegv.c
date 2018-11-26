/* ============================================================================
 * (C) Copyright Martial Bornet, 2018.
 *
 *	@(#)	[Zen] q_trap_sigsegv.c	Version 1.2 du 18/11/26 - 
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
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
