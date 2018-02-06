/*
 * PalindromeDetector.cpp
 *
 *  Created on: 2017. 4. 16.
 *      Author: Chan Kim
 */

#include "PalindromeDetector.h"

/* class constructor
 * Postcondition: accept and save the names of the input and output files.
 */
PalindromeDetector::PalindromeDetector() {
	cout << "\nEnter the input file name: " << flush;
	cin >> Input;
	cout << "Enter the output file name: "<< flush;
	cin >> Output;
}
/* boolean isPalindrome
 * Parameter: line, an string.
 * Postcondition: true is returned, if and only if
 * 					the line is a palindrome.
 */
bool PalindromeDetector::isPalindrome(const string& line) {
	Stack<char> st(1);
	ArrayQueue<char> aq(1);
	char ch1;
	char ch2;
	for (unsigned i = 0; i < line.length(); i++) {
		if (isalpha (line[i]) )  {
			char c = tolower(line[i]);
			try {
				st.push(c);
			}
			catch (StackException&) {
				st.setCapacity (st.getCapacity()* 2 );
				st.push(c);
			}
			try{
				aq.append(c);
			}
			catch (FullQueueException&)  {
				aq.setCapacity (aq.getCapacity() * 2);
				aq.append(c);
			}
		}
	}
	if ((st.isEmpty()) && (aq.isEmpty())) {
		return false;
	}
	while (! (st.isEmpty()) && !(aq.isEmpty())) {
		ch1 = st.pop();
		ch2 = aq.remove();
		if (ch1 != ch2) {
			return false;
		}
	}
	return true;
}
/* detectPalindromes
 * Postcondition: opens streams to the input and output files,
 * 					processes the input file line-by-line,
 * 					and produces the corresponding output file.
 */
void PalindromeDetector::detectPalindromes(){
	ifstream fin(Input.c_str());
	assert (fin.is_open());
	ofstream fout(Output.c_str());
	string line;
	while (!fin.eof()) {
		getline (fin, line);
		fout << line << flush;
		if ( isPalindrome(line) == true ) {
			fout << " *** " << endl;
		}
		else {
			fout << "" << endl;
		}
	}
	fout.close();
	fin.close();
}
