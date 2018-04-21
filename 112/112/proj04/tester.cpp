/* tester.cpp drives the testing of our Vec template and Matrix class.
 * Student Name: Chan Kim (ck45)
 * 				 Thomas Woltier (tw34)
 * Date: 03/06/2017
 * Begun by: Joel C. Adams, for CS 112 at Calvin College.
 */

#include "VecTester.h"
#include "MatrixTester.h"
#include "Application.h"

int main() {
	MatrixTester mt;
	mt.runTests();
	Application app;
	app.run();
}
