CC = clang
CFLAGS = -Wall -std=c17 -pedantic
SRCS = $(wildcard budget/src/*.c)
HEADER = $(SRCS:.c=.h)
OBJS = $(SRCS:.c=.o)

ZIPFILE = budget_wise.zip

TARGET  = project

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^


#depedance 

main.o: main.c option.h budget.h
option.o: option.c option.h categorie.h
budget.o:budget.c budget.h spending.h
spending.o: spending.c spending.h categorie.h

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

zip: clean
	zip -r $(ZIPFILE) $(SRCS) $(HEADER) Makefile 

clean:
	rm -f $(TARGET) $(OBJS)



