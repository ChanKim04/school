/*
 * CommandLine.h is a class to read a command-line and construct a vector from the arguments
 * Written by Chan Kim and Hamin Hong
 * CS 232 - Project 4
 */

#ifndef COMMANDLINE_H_
#define COMMANDLINE_H_

#include <iostream>
#include <vector>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <sstream>
using namespace std;

class CommandLine {

public:
	CommandLine();
	CommandLine(istream& in);
	char* getCommand() const;
	int getArgCount() const;
	char** getArgVector() const;
	char* getArgVector(int i) const;
	bool noAmpersand() const;
	virtual ~CommandLine();

private:
	int argc;
	char** argv;
	vector<string> myArgv;
};

#endif 
