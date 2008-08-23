MODULE=block_decypher
TEST_IN_FILE=test_dat/$(MODULE).in
TEST_TIMES=1
DEBUG=y

all:rtlm benchm sw_simm

rtlm:
	@echo compiling rtl ...
	@make -s -C rtl    PROJ_NAME=$(MODULE) DEBUG=$(DEBUG)
 
benchm:
	@echo compiling bench ...
	@make -s -C bench  PROJ_NAME=$(MODULE) DEBUG=$(DEBUG)

sw_simm:
	@echo compiling sw_sim ...
	@make -s -C sw_sim PROJ_NAME=$(MODULE) DEBUG=$(DEBUG)

synthesis:
	@make -s -C rtl $(MODULE)

sw:
	@make -s -C sw_sim $(MODULE)

preare_fn =                                                            \
	str="" ;                                                       \
	for ((i=0;i<$1;i=i+1));                                         \
        do                                                             \
                n=$$(expr $$RANDOM % 256 )    ;                        \
                binstr=$$(echo "ibase=10;obase=2;$$n"|bc) ;           \
                binstr=$$(echo "$$binstr" | awk ' { n=8-length($$1);for(i=0;i<n;i=i+1) printf "0"; printf $$1; }' )             ;                                   \
                str=$$(printf "%s%s" $$str $$binstr) ;                 \
        done          ;                                                \
        echo $$str >$(TEST_IN_FILE)  

preare_block_decypher:
	$(call preare_fn,64)

preare_key_perm:
	$(call preare_fn,8)

preare_key_schedule:
	$(call preare_fn,8)
        
ifeq ($(DEBUG),y)
check:
	@(for ((i=0;i<$(TEST_TIMES);i=i+1))                                       \
                do                                                                \
                        make -s -C sw_sim test PROJ_NAME=$(MODULE);               \
                        make -s -C bench test PROJ_NAME=$(MODULE);                \
                        diff test_dat/$(MODULE).out.sw test_dat/$(MODULE).out.v ; \
                done)

else
check:
	@(for ((i=0;i<$(TEST_TIMES);i=i+1))                                       \
                do                                                                \
                        make -s preare_$(MODULE);                                 \
                        make -s -C sw_sim test PROJ_NAME=$(MODULE);               \
                        make -s -C bench test PROJ_NAME=$(MODULE);                \
                        diff test_dat/$(MODULE).out.sw test_dat/$(MODULE).out.v ; \
                done)
endif


clean:
	@make -s -C sw_sim clean
	@make -s -C rtl clean
	@make -s -C bench clean
	@rm -fr test_dat/*

cscope:
	@find . -name "*.[ch]" >cscope.files
	@cscope -b


