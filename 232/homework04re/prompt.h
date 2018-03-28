/*
 * prompt.h provides a class to represent the command-line promp
 * Written by Chan Kim and Hamin HOng
 * CS 232 - Project 4
 */

#ifndef PROMPT_H_
#define PROMPT_H_

#include <string.h>
#include <stdio.h>
#include <iostream>
#include <limits.h>
#include <unistd.h>
using namespace std;

class Prompt {


public:
	Prompt();
	char* get() const;


private:
    char* directory;
    char buf[PATH_MAX + 1];
};

#endif