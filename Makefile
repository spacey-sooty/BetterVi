# change this if you wanna change your C compiler
CC = gcc

# change these if you want to change the way your compiler behaves
CFLAGS = -Wall -Werror -Wextra -std=c89

all: compile run

compile:
	mkdir -p build
	$(CC) -o build/vi.o -c src/vi.c $(CFLAGS)
	$(CC) -o build/raw.o -c src/raw.c $(CFLAGS)
	$(CC) -o build/vi build/vi.o build/raw.o

run: compile
	./build/vi

install: compile
	cp build/vi /usr/bin/vi
