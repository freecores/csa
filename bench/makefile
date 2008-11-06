
PROJ_NAME ?= decrypt
DEBUG     ?= y

MODELSIM_DIR=/opt/modeltech

ifeq ($(DEBUG),y)
CFLAGS=-DDEBUG
else
CFLAGS=
endif

all:csa_pli.vpi $(PROJ_NAME).vvp csa_pli_modelsim

csa_pli.vpi:csa_pli.c
	iverilog-vpi $(CFLAGS) --name=csa_pli  $^ >/dev/null
	rm -fr csa_pli.o

csa_pli_modelsim:csa_pli.sl

%.sl:%.o
	ld -shared -E -o $@ $^
	rm -fr csa_pli.o

%.o:%.c
	gcc -c -g -I$(MODELSIM_DIR)/include $^


%.vvp:%_tb.v ../rtl/%.v
	iverilog $(CFLAGS) -tvvp -o$@ $^

test:csa_pli.vpi $(PROJ_NAME).vvp 
	vvp -M. -mcsa_pli $(PROJ_NAME).vvp

clean:
	rm -fr *.o *.vvp *.vpi *.log *.key *.sl

key_schedule.vvp:key_schedule_tb.v ../rtl/key_schedule.v ../rtl/key_perm.v

block_decypher.vvp:block_decypher_tb.v ../rtl/block_decypher.v ../rtl/block_perm.v ../rtl/block_sbox.v

decrypt.vvp:decrypt_tb.v                             \
                        ../rtl/decrypt.v             \
                        ../rtl/key_schedule.v        \
                        ../rtl/block_perm.v          \
                        ../rtl/key_perm.v            \
                        ../rtl/stream_cypher.v       \
                        ../rtl/sbox1.v               \
                        ../rtl/sbox2.v               \
                        ../rtl/sbox3.v               \
                        ../rtl/sbox4.v               \
                        ../rtl/sbox5.v               \
                        ../rtl/sbox6.v               \
                        ../rtl/sbox7.v               \
                        ../rtl/sboxes.v              \
                        ../rtl/stream_iteration.v    \
                        ../rtl/stream_byte.v         \
                        ../rtl/stream_8bytes.v       

stream_cypher.vvp:stream_cypher_tb.v                 \
                        ../rtl/stream_cypher.v       \
                        ../rtl/sbox1.v               \
                        ../rtl/sbox2.v               \
                        ../rtl/sbox3.v               \
                        ../rtl/sbox4.v               \
                        ../rtl/sbox5.v               \
                        ../rtl/sbox6.v               \
                        ../rtl/sbox7.v               \
                        ../rtl/sboxes.v              \
                        ../rtl/stream_iteration.v    \
                        ../rtl/stream_byte.v         \
                        ../rtl/stream_8bytes.v       
