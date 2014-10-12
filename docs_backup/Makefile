# the compiler: gcc for C program, g++ for C++
CC=g++


# compiler flags:
#  -g    adds debugging information to the executable file
#  -Wall turns on most, but not all, compiler warnings
CFLAGS= -g -Wall

INCLUDES+= -Iinclude

LIBS= -lcurses -lrt `pkg-config --libs libusb-1.0`

LDFLAGS=-Wl,--no-as-needed -export-dynamic


objects=
ext_obj=


binaries=main


all: $(binaries)


clear:
	@echo "Clean Up *.o"
	rm -f *.o

clean:	clear
	@echo "Clean Up Binaries"
	rm -f $(binaries)

%.o: %.cpp
	$(CC) $(CFLAGS) $(INCLUDES) -o $@ -c $<

%.so:%.o
	@echo "Building Library $<"

$(binaries): %:%.o $(objects)
	@echo "Building Binary $@"
	$(CC) $(LDFLAGS) $^ $(ext_obj)  $(LIBS) -o $@

