/*
 * ReversePoem.h
 *
 *  Created on: 2017. 3. 30.
 *      Author: Chan Kim
 */

#ifndef REVERSEPOEM_H_
#define REVERSEPOEM_H_
#include "Stack.h"
#include <iostream>
#include <fstream>
#include <cassert>
using namespace std;

class ReversePoem {
public:
	ReversePoem(const string& fileName);
	string getTitle() const{return myTitle;}
	string getAuthor() const{return myAuthor;}
	string getBody() const{return myBody;}
	string getBodyReversed() const{return myBodyReversed;}

private:
	string myTitle;
	string myAuthor;
	string myBody;
	string myBodyReversed;
};

#endif /* REVERSEPOEM_H_ */
