/* Vec.h provides a simple vector class named Vec.
 * Student Name: Mark Wissink
 * 				 Chan Kim
 * Date: 2/21/17
 * Begun by: Joel C. Adams, for CS 112 at Calvin College.
 */

#ifndef VEC_H_
#define VEC_H_

#include <iostream>
#include <fstream>
#include <stdexcept>    // range_error, ...
#include <cassert>  	// assert, ...
using namespace std;

typedef double Item;

class Vec {
public:
	Vec();
	Vec(unsigned size);
	Vec(const Vec& original);
	virtual ~Vec();
	
	Vec& operator=(const Vec& original);
	bool operator==(const Vec& v2);
	bool operator!=(const Vec& v2);
	Vec operator-(const Vec& v2) const;
	Vec operator+(const Vec& v2) const;
	double operator*(const Vec& v2) const;
	Item& operator[](unsigned index);
	const Item& operator[](unsigned index) const;

	unsigned getSize() const { return mySize; }
	void setSize(unsigned newSize);
	void setItem(unsigned index, const Item& it);
	Item getItem(unsigned index) const;


	void writeTo(ostream& out) const;
	void readFrom(istream& in);
	void writeTo(const string& filename) const;
	void readFrom(const string& fileName);

private:
	unsigned mySize;
	Item *   myArray;

	void makeCopy(const Vec& original);

	friend class VecTester;
};

#endif /*VEC_H_*/
