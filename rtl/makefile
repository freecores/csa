PROJ_NAME ?=block_decypher
DEBUG ?=y

ifeq ($(DEBUG),y)
VFLAGS=-DDEBUG
else
VFLAGS=
endif

all:$(PROJ_NAME)

key_perm:
	iverilog -S $(VFLAGS) -tnull $@.v

key_schedule:
	iverilog -S $(VFLAGS) -tnull $@.v key_perm.v

block_decypher:
	iverilog -S $(VFLAGS) -tnull $@.v block_perm.v block_sbox.v

clean:
 	
