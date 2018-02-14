/* year_codes.cpp is a driver for function yearCode().
 * Begun by: Dr. Adams, for CS 214 at Calvin College.
 ****************************************************************/

#include <iostream>                      // interactive I/O
#include <string>                        // string class
using namespace std;

// REPLACE THIS LINE WITH THE DECLARATION OF yearCode()

int main() {
  cout << "\nEnter your academic year: "; // prompt
  string year;
  cin >> year;                            // read year
  cout << yearCode(year) << endl;         // display its code
}


/***************************************************************
 * yearCode() converts an academic year into its integer code. *
 * Receive: year, a string.
 * PRE: year is one of {freshman, sophomore, junior, or senior}.
 * Return: the integer code corresponding to year.
 */

// REPLACE THIS LINE WITH THE DEFINITION OF yearCode()

