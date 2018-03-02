#include <sys/time.h>

class Timer
{
public:
    Timer();

    void start();
    void stop();
    void reset();
    int elapsedTime();

private:
    struct timeval strt;
    struct timeval end;
};
