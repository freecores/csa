
PROJ_NAME ?= key_perm

CFLAGS=-g -ansi

all:$(PROJ_NAME)

clean:
	rm -fr $(PROJ_NAME)
	rm -fr *.o

test:
	./$(PROJ_NAME) <../test_dat/$(PROJ_NAME).in >../test_dat/$(PROJ_NAME).out.sw

key_perm:csa.o key_perm.o


