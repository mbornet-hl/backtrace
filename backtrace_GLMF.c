//	@(#)	[Zen] q_backtrace_GLMF.c	Version 1.1 du 18/11/26 - 

#include  <stdio.h>
#include  <stdlib.h>
#include  <execinfo.h>

void       fct_alpha(int),
           fct_beta(int),
           fct_gamma(int),
    		 fct_terminal_function(int);

#define   MAX_FUNCTS               (320)
#define   MAX_LEVELS               (5)

#define   FCT(f)                   f "()"
#define   ID(x)                    x
#define   PRINT_FUNCT_ADDR(fct)    printf("Address of %-25s : %p\n", #fct "()", fct)
#define   PRINT_LEVEL()            { char f[64]; \
                                     sprintf(f, "%s%s", __func__, "()"); \
                                     printf("%-25s (%3d) : level = %d\n", f, __LINE__, level); }

/* FCT_PRINT_TRACE */
void fct_print_trace(void)
{
     void            *_array[MAX_FUNCTS];
     size_t           _num_addr, _max_addr;
     char           **_strings;
     int              _i;

     _max_addr      = sizeof(_array)/sizeof(_array[0]);
     printf("Max addresses number = %d\n", _max_addr);

     _num_addr      = backtrace(_array, _max_addr);
     printf("size = %d\n", _num_addr);

     _strings       = backtrace_symbols(_array, _num_addr);
     printf("%d currently active functions :\n", _num_addr);

     for (_i = 0; _i < _num_addr; _i++) {
          printf("===> %s\n", _strings[_i]);
     }

     free(_strings);
}

/* FCT_ALPHA */
void fct_alpha(int level)
{
     PRINT_LEVEL();
     fct_beta(level);
}

/* FCT_BETA */
void fct_beta(int level)
{
     PRINT_LEVEL();
     fct_gamma(level);
}

/* FCT_GAMMA */
void fct_gamma(int level)
{
     PRINT_LEVEL();
     if (level < MAX_LEVELS) {
          fct_beta(level + 1);
     }
     else {
          fct_terminal_function(level);
     }
}

/* FCT_TERMINAL_FUNCTION */
void fct_terminal_function(int level)
{
     PRINT_LEVEL();
     fct_print_trace();
}

/* MAIN */
int main()
{
     PRINT_FUNCT_ADDR(fct_alpha);
     PRINT_FUNCT_ADDR(fct_beta);
     PRINT_FUNCT_ADDR(fct_gamma);
     PRINT_FUNCT_ADDR(fct_terminal_function);
     PRINT_FUNCT_ADDR(fct_print_trace);

     fct_alpha(0);

     return 0;
}
