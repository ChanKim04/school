/*
 * Application.cpp
 *
 *  Created on: Feb 27, 2017
 *      Author: mcw33
 */

#include "Application.h"

Application::Application() {}

void Application::run() {
	cout << "Welcome to the Vector Application! \n \n" << endl;
	cout << "Please enter the number of dimensions to work with: " << endl;
	myDimensions = numericInput();
	cout << "Please enter values for the starting vector: " << endl;
	Vec newVec(myDimensions);
	vectorInput(newVec);
	startVec = newVec;

	printMenu();
}

/* Prints the menu
* Return: void.
*/
void Application::printMenu() {
	cout << "Please enter: "
		 << "\n\t 1 - to append a new vector"
		 << "\n\t 2 - to print results"
		 << "\n\t 0 - to quit"
	<< endl;
	handleInput();

	printMenu();
}

/* handles the menu input
* Return: void.
*/
void Application::handleInput() {
	unsigned input;
	input = numericInput();
	if ( input == 1 ) {
		cout << "Enter a new vector: " << endl;
		Vec newVec(myDimensions);
		vectorInput(newVec);
		startVec = startVec + newVec;
	} else if ( input == 2 ) {
		printResults(startVec);
	} else if ( input == 0 ) {
		exit(1);
	}
}

/*
 * handles input for a vector
 * @param: Vec
 * Return: void
 */
void Application::vectorInput(Vec& v) {
	for ( unsigned i = 0; i < v.getSize(); i ++ ){
		cout << "Enter value for index " << i << ": " << endl;
		v[i] = numericInput();
	}
}

/*
 * prints result of the vector additions
 * @param: Vec
 * Return: void
 */
void Application::printResults(const Vec& v) const {
	cout << "The resulting vector is: {" << flush;
	for ( unsigned i = 0; i < v.getSize()-1; i ++ ){
		cout << v[i] << ", " << flush;
	}
	cout << v[v.getSize()-1] << "}" << endl;
}

/*
 * gets only a numeric input
 * Return: double
 */
double Application::numericInput() const {
	double x;
	while(!(cin >> x)){
		cin.clear();
		cin.ignore(numeric_limits<streamsize>::max(), '\n');
		cout << "Invalid input.  Try again: ";
	}
	return x;
}
