CXX=g++

SRCS=main.cpp Timer.cpp
OBJS=$(subst .cpp,.o,$(SRCS))
LDLIBS=-lpthread

all: callTimer

callTimer: $(OBJS)
	$(CXX) $(LDFLAGS) -o callTimer $(OBJS) $(LDLIBS)

clean:
	rm *.o callTimer
