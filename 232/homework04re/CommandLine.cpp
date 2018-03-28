/*
CommandLine.cpp
Created on: Mar 6, 2018

Chan Kim and Hamin Hong
*/

#include "CommandLine.h"
using namespace std;

// Default constructor for the CommandLine()
CommandLine::CommandLine() {

	argc = 0;

}

/*
Explicit constructor for CommandLine()
Parameter: istream& in
*/

CommandLine::CommandLine(istream& in) {

	argc = 0;
	string argS;
	string storage;
	getline(in, argS);
	istringstream Stream(argS); // string buffer pulled out by the stream


	while (Stream >> storage) {

		myArgv.push_back(storage); //store strings into myArgv
		argc++; //increment argc for later usage

	}

	argv = new char*[myArgv.size()];

	for (size_t i = 0; i < myArgv.size(); i++) {
		argv[i] = new char[myArgv[i].size() + 1];
		strcpy(argv[i], myArgv[i].c_str());
	}

}

/*
Returns command portion
*/
char* CommandLine::getCommand() const {

	return argv[0];

}

/*
Returnsnumber of arguments of the commandline
*/
int CommandLine::getArgCount() const {
	return argc;
}

/*
Returns the arguments for the command from the command-line
*/
char** CommandLine::getArgVector() const {
	if (myArgv.size() == 1 || (*argv[1] == '&'))
	{
		return argv+1;
	}
	else
	{
		return argv;
	} //moves the pointer to the next argument in the argv, which is char++

}

/*
Returns the argument from the vector at the given index
*/
char* CommandLine::getArgVector(int i) const {
	return argv[i];
}

/*
Returns true if no ampersand in the command-line
Returns false if there is an ampersand in the command-line
*/
bool CommandLine::noAmpersand() const {

	for (int i = 0; i<argc; i++) {
		if (*argv[i] == '&')
			return false;
	}
	return true;
}

/*
Commandline class destructor.
*/
CommandLine::~CommandLine() {

	for (size_t i = 0; i < myArgv.size(); i++) {
		delete[] argv[i];
	}
	delete[] argv;

}