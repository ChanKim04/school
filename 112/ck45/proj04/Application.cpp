/*
 * Application.cpp
 *
 *  Created on: 2017. 3. 6.
 *      Author: Chan Kim
 */

#include "Application.h"


Application::Application() {

}
/* Run the Application
 */
void Application::run() {
	while(true){
		cout << "Welcome to the Matrix program!\n"
				"Enter name of file containing the first matrix: ";
	    string fileName1;
	    cin >> fileName1;
	    Matrix<double> m1;
	    m1.readFrom(fileName1);
	    m1.writeTo(cout);
	    cout << "Choose one of operations\n"
				"\t 1. addition (+)"
				"\t 2. subtraction (-)"
				"\t 3. transpose"
	    		"\t other keys. exit"<< endl;
	    unsigned input;
	    cin >> input;
	    if (input == 1 or input == 2) {
	    	cout << "Enter name of file containing the second matrix: ";
	    	string fileName2;
	    	cin >> fileName2;
	    	Matrix<double> m2;
	    	m2.readFrom(fileName2);
	    	m2.writeTo(cout);
	    	Matrix<double> m3;
	    	if (input == 1) {
	    		m3 = m1 + m2;
	    		m3.writeTo(cout);
	    	} else {
	    		m3 = m1 - m2;
	    		m3.writeTo(cout);
	    	}
	    } else if (input == 3){
	    	Matrix<double> m4;
	    	m4 = m1.getTranspose();
	    	m4.writeTo(cout);
	    } else {
	    	cout << "End program..." << endl;
	    	break;
	    }
	}
}
