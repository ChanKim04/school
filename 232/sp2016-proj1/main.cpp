
#include <iostream>
#include <pthread.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include "Timer.h"

using namespace std;

void printUsageAndExit()
{
    cerr << "Usage: callTimer [-p|--process] [-t|--thread] [-r<n>]\n";
    exit(1);
}

void *thread_func(void *junk)
{
    printf("Hello from the child thread (TID = %ld)\n", (long) pthread_self());
    pthread_exit(NULL);
}


int main(int argc, char **argv)
{
    // Process command-line options.
    int i;
    bool timeProcesses = false;
    bool timeThreads = false;
    int reps = 1;

    // argv[0] is the command. 
    for (i = 1; i < argc; i++) {
        // cerr << "DEBUG: " << i << ": " << argv[i] << endl;

        string arg(argv[i]);
        if (arg == "-p" || arg == "--process") {
            timeProcesses = true;
        }
        else if (arg == "-t" || arg == "--thread") {
            timeThreads = true;
        }
        else if (arg.substr(0, 2) == "-r") {
            string val = arg.substr(2);
            reps = atoi(val.c_str());
            // Check for atoi errors: if the result is 0 but val isn't...
            if (reps == 0 && val[0] != '0') {
                printUsageAndExit();
            }
        }
        else {
            printUsageAndExit();
        }
    }
    if (! timeProcesses && ! timeThreads) {
        // No arguments given: display usage message.
        printUsageAndExit();
    }

    // cout << "DEBUG: timeProcesses: " << timeProcesses << " timeThreads: " << timeThreads <<
    //        " repetitions: " << reps << endl;

    int sum = 0;
    Timer t;

    if (timeProcesses) {
        for (int i = 0; i < reps; i++) {
            // fork a process.
            t.start();
            pid_t pid = fork();
            if (pid == 0) {
                // child
                cout << "Hello from the child process (PID = " << getpid() << ")\n";
                exit(0);
            } else {
                // parent
                t.stop();
            }
            sum += t.elapsedTime();
            t.reset();
        }
        printf("Average time to create a process: %f usecs.\n",
               ((float) sum) / reps);
    }

    if (timeThreads) {
        pthread_t thread;
        sum = 0;
        for (int i = 0; i < reps; i++) {
            // fork a thread
            t.start();
            int rc = pthread_create(&thread, NULL, thread_func, NULL);
            if (rc != 0) {
                fprintf(stderr, "pthread_create returned error\n");
                continue;
            }
            t.stop();
            sum += t.elapsedTime();
            t.reset();
        }
        printf("Average time to create a thread: %f usecs.\n",
               ((float) sum) / reps);
    }

    pthread_exit(NULL);

}

