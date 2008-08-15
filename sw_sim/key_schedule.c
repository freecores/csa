/* this file simulates the key_schedule funtion */

#include <stdio.h>
#include <string.h>

extern void key_schedule(unsigned char *CK, int *kk) ;

int main()
{
        unsigned char CK[8];
        int           kk[57];
        int           i;
        int           c;

        memset(CK,0,sizeof CK);
        for (i=63;i>=0;i--)
        {
             c=getchar();   
#ifdef DEBUG
             printf("%c",c);
#endif
             if(c=='1')
             {
                     CK[i/8]|=(1<<(i%8));
             }
        }
#ifdef DEBUG
             printf("\n");
#endif
        memset(kk,0,sizeof kk);
        key_schedule(CK,kk);
        for(i=57*8-1;i>=8;i--)
        {
                if(kk[i/8]&(1<<(i%8)))
                        printf("1");
                else
                        printf("0");
        }
        printf("\n");
        return 0;
}
