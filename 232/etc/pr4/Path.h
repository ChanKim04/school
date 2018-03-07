/*
 * Path.h declares the methods for the class Path
 *
 *
 * by Judy Kwon dk43, DanBe Lee dl38
 * for CS232
 */

#ifndef PATH_H_
#define PATH_H_

#include <iostream>
using namespace std;



class Path {
public:
        Path();
        int find(const string& program) const;
        string getDirectory(int i) const;

};

#endif /*PATH_H_*/
