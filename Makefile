OBJS   = main.o geometry.o
SOURCE = main.hs geometry.hs
HEADER = 
OUT    = out
CC     = ghc
FLAGS  = -g -c -Wall

all: $(OBJS)
	$(CC) -g $(OBJS) -o $(OUT) $(LFLAGS)

main.o: main.hs
	$(CC) $(FLAGS) main.hs 

geometry.o: geometry.hs
	$(CC) $(FLAGS) geometry.hs 

clean:
	rm -f $(OBJS) $(OUT) *.hi
