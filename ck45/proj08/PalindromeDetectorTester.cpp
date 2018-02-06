/*
 * PalindromeDetectorTester.cpp
 *
 *  Created on: 2017. 4. 16.
 *      Author: Chan Kim
 */

#include "PalindromeDetectorTester.h"

void PalindromeDetectorTester::runTests() {
	cout << "Testing class PlaindromeDetector..." << endl;
	testPalindrome();
	cout << "All tests passed!\n" << endl;
}

void PalindromeDetectorTester::testPalindrome() {
	cout <<"- testing isPalindrome and detectPalindromes... " << flush;
	PalindromeDetector pd1;
	cout << " 0 " << flush;
	// test isPalindrome
	assert( pd1.isPalindrome("Madam, I'm Adam")==true);
	assert( pd1.isPalindrome("a phrase to be esteemed")==false);
	cout << " 1 " << flush;
	// read a file, detect Palindromes, and output the file
	pd1.detectPalindromes();
	cout << " 2 " << flush;
	// test the output file
	ifstream fin(pd1.Output.c_str());
	assert (fin.is_open());
	string line;
	getline(fin, line);
	assert( line == "Drawn Onward *** ");
	cout << "Passed!" << endl;
}
