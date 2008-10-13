
PROJ_NAME ?= decrypt
DEBUG     ?= y

ifeq ($(DEBUG),y)
CFLAGS=-DDEBUG
else
CFLAGS=
endif

all:csa_pli.vpi $(PROJ_NAME).vvp

csa_pli.vpi:csa_pli.c
	iverilog-vpi $(CFLAGS) --name=csa_pli  $^ >/dev/null

%.vvp:%_tb.v ../rtl/%.v
	iverilog $(CFLAGS) -tvvp -o$@ $^

test:csa_pli.vpi $(PROJ_NAME).vvp 
	vvp -M. -mcsa_pli $(PROJ_NAME).vvp

clean:
	rm -fr *.o *.vvp *.vpi *.log *.key

key_schedule.vvp:key_schedule_tb.v ../rtl/key_schedule.v ../rtl/key_perm.v

block_decypher.vvp:block_decypher_tb.v ../rtl/block_decypher.v ../rtl/block_perm.v ../rtl/block_sbox.v

decypht.vvp:decrypt_tb.v ../rtl/decrypt.v
