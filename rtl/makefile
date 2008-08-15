PROJ_NAME ?=key_perm
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

clean:
 	
