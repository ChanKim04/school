/*
 * Application.h
 *
 *  Created on: Feb 27, 2017
 *      Author: mcw33
 */

#ifndef APPLICATION_H_
#define APPLICATION_H_

#include <iostream>
#include <stdlib.h>		/* exit... */
#include <limits>		/* numeric_limits... */
#include "Vec.h"		/* Vec... */
using namespace std;


class Application {
public:
	Application();
	void run();
	void printMenu();
	void handleInput();
	void vectorInput(Vec& v);
	void printResults(const Vec& v) const;
	double numericInput() const;
private:
	unsigned myDimensions;
	Vec startVec;
};

#endif /* APPLICATION_H_ */
