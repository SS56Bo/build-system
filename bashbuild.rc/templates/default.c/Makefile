flags = -Wall -O2 -std=c2x

.PHONY: all clean

all: clean PROJECTNAME 

PROJECTNAME: PROJECTNAME.o
	gcc $(flags) $^ -o $@ 

PROJECTNAME.o: PROJECTNAME.c PROJECTNAME.h
	gcc $(flags) -c $<

clean:
	rm -f *.o PROJECTNAME 
