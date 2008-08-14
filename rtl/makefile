PROJ_NAME ?=key_perm

all:$(PROJ_NAME)

key_perm:
	iverilog -S -tnull $@.v

key_schedule:
	iverilog -S -tnull $@.v key_perm.v

clean:
 	
