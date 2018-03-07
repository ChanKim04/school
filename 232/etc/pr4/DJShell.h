/*
 * DJshell.h
 * Created on: Mar 7, 2017
 * Author: dk43 and dl38
 * 		   Judy Kwon and DanBe Lee
 */

#ifndef DJSHELL_H_
#define DJSHELL_H_

#include <string>
#include "Path.h"
using namespace std;


class DJShell {
public:
	DJShell();
	void run();

private:
	const char* concatFullpath(char* ProgName, Path aPath);

};


/*undefined reference to main: http://stackoverflow.com/questions/14620435/c-error-undefined-reference-to-main */

#endif /* DJSHELL_H_ */

