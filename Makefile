CC=gcc
CFLAGS = -c -O3 -g
LDFLAGS = -static -lz -lm
SOURCES = baseFAST.c CommandLineParser.c Common.c HashTable.c DrFAST.c Output.c Reads.c RefGenome.c 
OBJECTS = $(SOURCES:.c=.o)
EXECUTABLE = drfast

# Detecting gcc version
GCC_VERSION = $(shell $(CC) -v 2>&1 | grep version | cut -d' ' -f3  | cut -d'.' -f1)

ifeq ($(GCC_VERSION), 3)
	CC = gcc4
endif



all: $(SOURCES) $(EXECUTABLE)
	rm -rf *.o
		
$(EXECUTABLE): $(OBJECTS) 
	$(CC) $(OBJECTS) -o $@ $(LDFLAGS)

.c.o:
	$(CC) $(CFLAGS) $< -o $@
