OBJS   = main.o  geometry.o
SOURCE = main.hs geometry.hs
OUT    = out
CC     = ghc

all: $(OBJS)
	$(CC) -g $(OBJS) -o $(OUT)

main.o: main.hs
	$(CC) $(FLAGS) main.hs 

geometry.o: geometry.hs
	$(CC) $(FLAGS) geometry.hs 

clean:
	rm -f $(OBJS) $(OUT) *.hi
