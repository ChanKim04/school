
#include "Timer.h"

Timer::Timer()
{
    timerclear(&strt);
    timerclear(&end);
}


void Timer::start()
{
    gettimeofday(&strt, NULL);
}

void Timer::stop()
{
    gettimeofday(&end, NULL);
}

int Timer::elapsedTime()
{
    struct timeval diff;
    timersub(&end, &strt, &diff);
    return diff.tv_sec * 1000000 + diff.tv_usec;
}

void Timer::reset()
{
    timerclear(&strt);
    timerclear(&end);
}
