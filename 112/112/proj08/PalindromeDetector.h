/*
 * PalindromeDetector.h
 *
 *  Created on: 2017. 4. 16.
 *      Author: Chan Kim
 */

#ifndef PALINDROMEDETECTOR_H_
#define PALINDROMEDETECTOR_H_
#include "ArrayQueue.h"
#include "Stack.h"
#include <iostream>
#include <fstream>
#include <cassert>
#include <cctype>
#include <locale>
using namespace std;

class PalindromeDetector {
public:
	PalindromeDetector();
	bool isPalindrome(const string& line);
	void detectPalindromes();
private:
	string Input;
	string Output;
	friend class PalindromeDetectorTester;
};
#endif /* PALINDROMEDETECTOR_H_ */
