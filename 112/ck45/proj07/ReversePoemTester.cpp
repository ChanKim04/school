/*
 * ReversePoemTester.cpp
 *
 *  Created on: 2017. 3. 30.
 *      Author: Chan Kim
 */

#include "ReversePoemTester.h"
#include "ReversePoem.h"
#include <iostream>  // cout, cerr, ...
#include <cassert>   // assert()
#include <cstdlib>   // exit()
using namespace std;

void ReversePoemTester::runTests() {
	cout << "Testing ReversePoem class..." << endl;
	testMethods();
	cout << "All tests passed!" << endl;
}

void ReversePoemTester::testMethods() {
	cout << "- Testing methods getTitle(), getAuthor(), getBody(), and getBodyReversed()... " << flush;
	// test to read a file, and compare it with the same file.
	ReversePoem rp1("anorexia.txt");
	assert( rp1.getTitle() == "Anorexia");
	assert( rp1.getAuthor() == "Anonymous");
	ReversePoem rp2("anorexia.txt");
	assert( rp1.getBody() == rp2.getBody());
	assert( rp1.getBody() != rp1.getBodyReversed());
	assert( rp2.getBody() != rp2.getBodyReversed());
	assert( rp2.getBodyReversed() == rp2.getBodyReversed());
	cout << " 1 " << flush;
	// test to read a file, and compare it with a different file.
	ReversePoem rp3("love.txt");
	assert( rp3.getTitle() == "Love?");
	assert( rp3.getAuthor() == "Anonymous");
	assert( rp3.getBody() != rp1.getBody());
	cout << " 2 " << flush;
	// test to read a file and check getBody and getBodyReversed methods with expected strings.
	ReversePoem rp4("cats.txt");
	assert( rp4.getTitle() == "Cats");
	assert( rp4.getAuthor() == "Leo J. Smada");
	assert( rp4.getBody() == "I love it when cats rub against me.\nI could never say\nI hate those purring felines.\n\n\n");
	assert( rp4.getBodyReversed() == "\n\nI hate those purring felines.\nI could never say\nI love it when cats rub against me.\n");
	cout << " 3 " << flush;
	cout << " Passed!" << endl;
}
