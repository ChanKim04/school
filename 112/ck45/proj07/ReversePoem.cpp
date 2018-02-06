/*
 * ReversePoem.cpp
 *
 *  Created on: 2017. 3. 30.
 *      Author: Chan Kim
 */

#include "ReversePoem.h"

/* ReversePoem constructor
 * Parameter: fileName, a string
 * Postcondition: read myTitle, myAuthor, myBody from text file
 * 					and reverse myBody and store it into myBodyReversed
 */
ReversePoem::ReversePoem(const string& fileName) {
	ifstream fin(fileName.c_str());
	assert( fin.is_open() );
	string line;
	getline(fin,line);
	myTitle = line;
	getline(fin,line);
	myAuthor = line;
	getline(fin,line);
	Stack<string> Body(1);
	while(!fin.eof()) {
		getline(fin,line);
		try {
			Body.push(line);
		} catch (StackException& se) {
			Body.setCapacity(Body.getCapacity()*2);
			Body.push(line);
		}
		myBody = myBody + line + "\n";
	}
	while(!Body.isEmpty()) {
		myBodyReversed = myBodyReversed + Body.pop() + "\n";
	}
	fin.close();
}

