

/*  this file simulates the decrypt function */
#include <stdio.h>
#include <string.h>
#include "misc.h"
#include "csa.h"

int main()
{
        struct key key;
        unsigned char cws[16];
        unsigned char encrypted[188];
        unsigned char decrypted[188];
        READ_DATA(encrypted,188*8);
        READ_DATA(cws,8*16);
        set_cws(cws,&key);
        decrypt(&key,encrypted,decrypted);
        WRITE_DATA(decrypted,188*8);
        return 0;
}
