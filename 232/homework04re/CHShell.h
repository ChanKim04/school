/*
  CHShell.h is a shell class that simulates a shell program
 
  CS 232 - Project 4
 */

#ifndef CHSHELL_H_
#define CHSHELL_H_

#include <iostream>
#include <sys/wait.h>
#include "path.h"
#include "prompt.h"
#include "CommandLine.h"
using namespace std;

class CHShell {

public:
	CHShell();
	void run();

private:
	Prompt prompt;
	Path path;
	
};

#endif