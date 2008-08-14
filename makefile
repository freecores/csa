MODULE=key_schedule
TEST_IN_FILE=test_dat/$(MODULE).in
TEST_TIMES=1

all:rtlm benchm sw_simm

rtlm:
	@make -s -C rtl PROJ_NAME=$(MODULE)

benchm:
	@make -s -C bench PROJ_NAME=$(MODULE)

sw_simm:
	@make -s -C sw_sim PROJ_NAME=$(MODULE)

synthesis:
	@make -s -C rtl $(MODULE)

sw:
	@make -s -C sw_sim $(MODULE)

preare_key_perm:
	@str="";                                                       \
	for ((i=0;i<8;i=i+1));                                         \
        do                                                             \
                n=$$(expr $$RANDOM % 256 );                            \
                binstr=$$(echo "ibase=10;obase=2;$$n"|bc);             \
                binstr=$$(echo "$$binstr" | awk ' { n=8-length($$1);for(i=0;i<n;i=i+1) printf "0"; printf $$1; }' ) ;                                                \
                str=$$(printf "%s%s" $$str $$binstr) ;                 \
        done;                                                          \
        echo $$str >$(TEST_IN_FILE)

preare_key_schedule:
	@str="";                                                       \
	for ((i=0;i<8;i=i+1));                                         \
        do                                                             \
                n=$$(expr $$RANDOM % 256 );                            \
                binstr=$$(echo "ibase=10;obase=2;$$n"|bc);             \
                binstr=$$(echo "$$binstr" | awk ' { n=8-length($$1);for(i=0;i<n;i=i+1) printf "0"; printf $$1; }' ) ;                                                \
                str=$$(printf "%s%s" $$str $$binstr) ;                 \
        done;                                                          \
        echo $$str >$(TEST_IN_FILE)
        


check:
	@(for ((i=0;i<$(TEST_TIMES);i=i+1))                                       \
                do                                                                \
                        make -s preare_$(MODULE);                                 \
                        make -s -C sw_sim test PROJ_NAME=$(MODULE);               \
                        make -s -C bench test PROJ_NAME=$(MODULE);                \
                        diff test_dat/$(MODULE).out.sw test_dat/$(MODULE).out.v ; \
                done)


clean:
	@make -s -C sw_sim clean
	@make -s -C rtl clean
	@make -s -C bench clean
	@rm -fr test_dat/*

cscope:
	@find . -name "*.[ch]" >cscope.files
	@cscope -b


