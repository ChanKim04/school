/* tester.cpp drives the testing of the BST classes.
 * , and running a program to get the height of the tree.
 */
#include "BST_Tester.h"
#include <fstream>
#include <stdlib.h>
int main() {
	BST_Tester bstt;
	bstt.runTests();	

	cout << "\nRunning the program..." << endl;
	for(unsigned i=0; i<10; i++) {
		cout << "Enter the file name: " << flush;
		string name;
		cin >> name;
		//read a file.
		ifstream fin(name.c_str());
		assert( fin.is_open() );

		BST<int> bst;
		string line;
		unsigned count = 0;
		while(!fin.eof()) {
			getline(fin,line);
			//convert a string to an int
			int n = atoi(line.c_str());
			try {
				bst.insert(n);
			} catch (Exception&) {
				//counting the duplication.
				count++;
			}
		}
		cout << "Height of the BST: " << bst.getHeight() << endl;
		cout << "Number of duplicate values: " << count << endl;
	}
	cout << "Closing the program..." << endl;
}
