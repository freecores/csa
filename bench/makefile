
PROJ_NAME ?= key_perm

%.vpi:%_pli.c
	iverilog-vpi --name=$(subst .vpi,,$@)  $^

%.vvp:%_tb.v ../rtl/%.v
	iverilog -tvvp -o$@ $^

test:$(PROJ_NAME).vpi $(PROJ_NAME).vvp 
	vvp -M. -m$(PROJ_NAME) $(PROJ_NAME).vvp

clean:
	rm -fr *.o *.vvp *.vpi *.log *.key

