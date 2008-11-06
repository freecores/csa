
PROJ_NAME ?= decrypt
DEBUG ?=y

CFLAGS=-g -ggdb -ansi

ifeq ($(DEBUG),y)
CFLAGS+=-DDEBUG
endif

all:$(PROJ_NAME)

clean:
	rm -fr $(PROJ_NAME)
	rm -fr *.o

test:$(PROJ_NAME)
	./$(PROJ_NAME) <../test_dat/$(PROJ_NAME).in >../test_dat/$(PROJ_NAME).out.sw

debug:$(PROJ_NAME)
	echo "set args <../test_dat/$(PROJ_NAME).in >../test_dat/$(PROJ_NAME).out.sw " >gdb-command
	ddd ./$(PROJ_NAME) -x gdb-command
        

key_perm:csa.o key_perm.o

key_schedule:csa.o key_schedule.o

block_decypher:csa.o block_decypher.o

decrypt:csa.o decrypt.o

stream_cypher:csa.o stream_cypher.o
