/*
 * CommandLine.h
 * Created on: Mar 7, 2017
 * Author: dk43 and dl38
 * 		   Judy Kwon and DanBe Lee
 */


#include <iostream>
#include <vector>
#include <sstream>
#include <stdlib.h>
#include <string.h>

using namespace std;



class CommandLine{
	vector<string> argv; //declare the Vector called argv

 public: 
	CommandLine (istream& in);  // it initialize the class
	char* getCommand() const;  // return a pointer the command portion of the command-line
	int getArgCount() const; // return the number of command-line arguments on the command-line
	char** getArgVector() const; // return a pointer to a char* array, each entry of which points to one"word" of the command Line
	char* getArgVector(int i) const; // return a pointer to the ith command-line "word"
	bool noAmpersand() const; // returns true if and only if no ampersand was given on the command-line.
	virtual ~CommandLine();

 private:
	char* commandstring;
	char** wordArray;

};


