
PROJ_NAME ?= key_schedule

all:test

csa_pli.vpi:csa_pli.c
	iverilog-vpi --name=csa_pli  $^

%.vvp:%_tb.v ../rtl/%.v
	iverilog -tvvp -o$@ $^

test:csa_pli.vpi $(PROJ_NAME).vvp 
	vvp -M. -mcsa_pli $(PROJ_NAME).vvp

clean:
	rm -fr *.o *.vvp *.vpi *.log *.key

 
key_schedule.vvp:key_schedule_tb.v ../rtl/key_schedule.v ../rtl/key_perm.v

