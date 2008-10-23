
#define READ_DATA(a,n)                      \
do{                                         \
        int i;                              \
        int c;                              \
        memset(a    ,0,sizeof     a);       \
        for (i=n-1 ;i>=0;i--)               \
        {                                   \
             c=getchar();                   \
             if(c=='1')                     \
             {                              \
                     a    [i/8]|=(1<<(i%8));\
             }                              \
        }                                   \
}while(0)

#define WRITE_DATA(a,n)                     \
do {                                        \
        int i;                              \
        for (i= n-1;i>=0;i--)               \
        {                                   \
                if(a    [i/8]&(1<<(i%8)))   \
                        printf("1");        \
                else                        \
                        printf("0");        \
        }                                   \
        printf("\n");                       \
}while(0)

#define DEBUG_OUTPUT_ARR( a , n )                 \
    do{                                      \
        int i;                               \
        for(i=n-1;i>=0;i--)                  \
        {                                    \
                printf("%x ",(a)[i]);          \
        }                                    \
        printf("\n");                        \
    }while(0)

#define DEBUG_OUTPUT_VAL( a )                 \
    do{                                      \
                printf(" %s=%x ",#a,a);          \
        printf("\n");                        \
    }while(0)
