/* Vec.cpp defines the methods for Vec, a simple vector class.
 * Student Name: Chan Kim (ck45)
 * Date: 2/21/2017
 * Begun by: Joel C. Adams, for CS 112 at Calvin College.
 */
 
#include "Vec.h"
#include <cstdlib>
#include <stdexcept>
Vec::Vec() {
	mySize = 0;
	myArray = NULL;
}

Vec::Vec(unsigned size) {
	mySize = size;
	myArray = new Item[size]();
	if (size == 0) {
		myArray = NULL;
	}
}

Vec::Vec(const Vec& original) {
	mySize = original.mySize;
	myArray = new Item[original.mySize]();
	for (unsigned i = 0; i < mySize; i++) {
		myArray[i] = original.myArray[i];
	}
	if (original.mySize <= 0) {
		myArray = NULL;
	}
}

Vec& Vec::operator=(const Vec& original) {
	mySize = original.mySize;
	if (this == &original){
	} else if (original.mySize <= 0) {
		myArray = NULL;
	}else if (original.mySize > 0) {
	myArray = new Item[original.mySize]();
	for (unsigned i = 0; i < mySize; i++) {
		myArray[i] = original.myArray[i];
		}
	}
	return *this;
}

unsigned Vec::getSize() const {
	return mySize;
}

void Vec::setItem(unsigned index, const Item& it) {
	if (index >= mySize) {
		throw range_error("index is invalid");
		} else {
			myArray[index] = it;
		}

}
Item Vec::getItem(unsigned index) const {
	if (index >= mySize) {
		throw range_error("index is invalid");
	} else {
		return myArray[index];
	}
}

void Vec::setSize(unsigned newSize) {
	if (mySize != newSize) {
		if (newSize == 0) {
			delete [] myArray;
			mySize = 0;
			myArray = NULL;
		} else {
			Item * newArray = new Item[newSize]();
			if (mySize < newSize) {
				for (unsigned i = 0; i < mySize; i++) {
					newArray[i] = myArray[i];
					}
				for (unsigned i = mySize; i < newSize; i++) {
					newArray[i] = 0;
				}
			}else {
				for (unsigned i = 0; i < newSize; i++) {
					newArray[i] = myArray[i];
					}
			}
				mySize = newSize;
				delete [] myArray;
				myArray = newArray;
	}
	}
}
bool Vec::operator==(const Vec& v2) {
	if (mySize == v2.mySize){
		if ((mySize and v2.mySize) == 0) {
			return true;
		} else {
			for (unsigned i = 0; i < mySize; i++) {
				if (myArray[i] != v2.myArray[i]) {
					return false;
				}
			}
			return true;
		}
	}
	return false;
}
void Vec::writeTo(ostream& out) const {
	for (unsigned i = 0; i < mySize; i++) {
		out << myArray[i] << '\n';
	}
}
void Vec::readFrom(istream& in) {
	for (unsigned i = 0; i < mySize; i++) {
		in >> myArray[i];
	}
}
Vec::~Vec() {
	mySize = 0;
	myArray = NULL;
}
