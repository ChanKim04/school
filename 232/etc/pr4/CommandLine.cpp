/* 
 * CommandLine.h
 * Created on: Mar 7, 2017
 * Author: dk43 and dl38
 * 		   Judy Kwon and DanBe Lee
 */

# include "CommandLine.h"

#include <iostream>
#include <vector>
#include <sstream>
#include <stdlib.h>
#include <string.h>
using namespace std;

/* constructs a CommandLine by reading a command-line from in, parsing it, and building instance variables for argc and argv 
 * calloc() and free() system calls
 * 
 */
CommandLine::CommandLine (istream& in){
	char* commandstring = new char[256]; //maximum number of the command
	in.getline (commandstring, 256);

	istringstream iss(commandstring); //using istringstream to get the strings from command string
	string item; 
	
	while (iss >> item)argv.push_back (item);
	argv.resize (argv.size() +1);
	// push back the iss to the item(string)
	
};

/* return a pointer to the command portion of the command-line (i.e., argv[0]).
 * 
 */
char*CommandLine::getCommand() const {
	return (char*) argv[0].c_str(); // return it in the string
}

/* return the number of command-line arguments on the command-line (i.e., argc).
 * 
 */
int CommandLine::getArgCount() const {
	return argv.size(); // return the size of the argv
}


/* return a pointer to a char* array, each entry of which points to one 'word' of the command-line (i.e., argv).
 * 
 */
char** CommandLine::getArgVector() const {

	char** wordArray = new char*[argv.size()]; //declared the wordArray

	for (int i=0; i< argv.size(); i++) {
		wordArray[i] = new char[argv[i].length()]; // wordArray is length of ith argv

		strcpy(wordArray[i], argv[i].c_str());
		}
	wordArray[argv.size()-1]=NULL;
	return wordArray;
}
	



/* return a pointer to the ith (zero-relative) command-line 'word' (i.e., argv[i]).
 * 
 */
char* CommandLine::getArgVector(int i) const {
	return (char*) argv[i].c_str(); // return the ith word in string
}

/*  returns true if and only if no ampersand was given on the command-line
 * the parent should use waitpid() to wait until the child terminates; 
 */
bool CommandLine::noAmpersand() const {
	for (int i=0; i< argv.size(); i++) {
		if (argv[i].find("&") != string::npos) {
			 // npos = static memeber constant value with the greatest possible value for an 					   element of type size_t.
			return false;
			}
		}
		return true;
}


CommandLine::~CommandLine() {
	delete[] commandstring;
	delete[] wordArray;
}

