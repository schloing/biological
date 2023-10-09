OBJS   = main.o  geometry.o  value.o
SOURCE = main.hs geometry.hs value.hs
OUT    = out
CC     = ghc

all: $(OBJS)
	$(CC) -g $(OBJS) -o $(OUT)

main.o: main.hs
	$(CC) $(FLAGS) main.hs 

geometry.o: geometry.hs
	$(CC) $(FLAGS) geometry.hs 

value.o: value.hs
	$(CC) $(FLAGS) value.hs 

clean:
	rm -f $(OBJS) $(OUT) *.hi
