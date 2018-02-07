/* Vec.cpp defines the methods for Vec, a simple vector class.
 * Student Name: Mark Wissink
 * 				 Chan Kim
 * Date: 2/21/17
 * Begun by: Joel C. Adams, for CS 112 at Calvin College.
 */
 
#include "Vec.h"

Vec::Vec() {
	mySize = 0;
	myArray = NULL;
}

Vec::Vec(unsigned size) {
	mySize = size;
	if (size) {
		myArray = new Item[mySize]();
	} else {
		myArray = NULL;
	}

}

void Vec::makeCopy(const Vec& original) {
	mySize = original.mySize;
	if (original.mySize) {
		myArray = new Item[mySize]();
		for (unsigned i = 0; i < original.mySize; i++) {
			myArray[i] = original.myArray[i];
		}
	} else {
		myArray = NULL;
	}
}

Vec::Vec(const Vec& original) {
	makeCopy(original);
}

Vec::~Vec() {
	delete [] myArray;
	myArray = NULL;
	mySize = 0;
}

/* setItem
* @param: index, index of the array
* @param: it, the new value for the index
* Return: sets the index in the array to a new Item
*/
void Vec::setItem(unsigned index, const Item& it) {
	if (index < 0 || index >= mySize) {
	    throw range_error("out of range");
	}
	myArray[index] = it;
}

/* getItem
* @param: index, index of the array
* Return: returns the Item at the index in the array
*/
Item Vec::getItem(unsigned index) const {
	if (index < 0 || index >= mySize) {
		throw range_error("out of range");
	}
	return myArray[index];
}

/* setSize
* @param: newSize, the desired size
* Return: resizes the array to the desired size
*/
void Vec::setSize(unsigned newSize) {
	if ( newSize != mySize ){
		if ( newSize == 0 ){
			myArray = NULL;
		} else {
			Item *newArray = new Item[newSize]();
			for (unsigned i = 0; i < newSize; i++) {
				if ( i < mySize){
					newArray[i] = myArray[i];
				}
			}

			delete [] myArray;
			myArray = newArray;
		}
		mySize = newSize;
	}
}

/* [] operator - set
* @param: index, index of the array
* Return: sets the index in the array to a new Item
*/
Item& Vec::operator[](unsigned index) {
	if (index < 0 || index >= mySize) {
		throw range_error("out of range");
	}
	return myArray[index];
}

/* [] operator - get
* @param: index, index of the array
* Return: returns the Item at the index in the array
*/
const Item& Vec::operator[](unsigned index) const {
	if (index < 0 || index >= mySize) {
		throw range_error("out of range");
	}
	return myArray[index];
}

/* == operator
* @param: v2, the vector for comparison
* Return: compares two vecs and see if they are similar
*/
bool Vec::operator==(const Vec& v2) {
	if (mySize == v2.mySize){
		for( unsigned i = 0; i < mySize; i ++){
			if (myArray[i] != v2.myArray[i]) { return false; }
		}
		return true;
	}
	return false;
}

/* = operator
* @param: original, a vec.
* Return: a vec that has the same properties as original.
*/
Vec& Vec::operator=(const Vec& original) {
	if ( this != &original) {
		delete [] myArray;
		makeCopy(original);
	}
	return *this;
}

/* + operator
* @param: original, a vec.
* Return: a new vec that has stores the sum of two vecs.
*/
Vec Vec::operator+(const Vec& v2) const {
	if (mySize != v2.mySize) {
		throw invalid_argument("not the same size");
	}
	Vec addVec(mySize);
	for( unsigned i = 0; i < mySize; i ++){
		addVec[i] = myArray[i] + v2[i];
	}
	return addVec;
}

/* * operator
* @param: original, a vec.
* Return: a new vec that is the dot product of two vecs.
*/
double Vec::operator*(const Vec& v2) const {
	if (mySize != v2.mySize) {
		throw invalid_argument("not the same size");
	}
	double total = 0;
	for( unsigned i = 0; i < mySize; i ++){
		total += myArray[i] * v2[i];
	}
	return total;
}

/* boolean inequality
 * Parameter: v2, a Vec
 * Postcondition: true is returned, if and only if
 * 					mySize != v2.mySize()
 * 					myArray != v3.myArray()
 * 					my values are different to v2's values.
 */
bool Vec::operator!=(const Vec& v2) {
	if (mySize != v2.mySize){
		return true;
	} else if (mySize == v2.mySize) {
		for (unsigned i = 0; i < mySize; i++) {
			if (myArray[i] != v2.myArray[i]) {
				return true;
			}
		}
		return false;
	}
	return false;
}
/* Vector subtraction
 * Parameter: v2, a Vec
 * Precondition: mySize == v2.mySize()
 * Postcondition: a Vec is returned containing the product of
 * 					my values and v2's values.
 */
Vec Vec::operator-(const Vec& v2) const{
	Vec v3(mySize);
	if (mySize != v2.mySize) {
		throw invalid_argument("Size different");
	} else {
		for (unsigned i = 0; i < mySize; i++ ) {
			v3.myArray[i] = myArray[i]-v2.myArray[i];
		}
		return v3;
	}
}
/* File I/O
 * Parameter: fileName, a string
 * Precondition: fileName is the name of a file,
 * 					the first line of file is mySize,
 * 					and the remainder of which is array values.
 * Postcondition: containing the values from fileName
 */
void Vec::readFrom(const string& fileName) {
	ifstream fin( fileName.c_str() );
	assert ( fin.is_open());
	Vec v1(mySize);
	fin >> mySize;
	myArray = new Item[mySize]();
	for (unsigned i = 0; i < mySize; i++ ) {
		fin >> myArray[i];
	}
	fin.close();
}

/* writeTo
* @param: out, the stream to write
* Return: exports the values of the vec
*/
void Vec::writeTo(ostream& out) const {
	for( unsigned i = 0; i < mySize; i ++){
		out << myArray[i] << endl;
	}
}

/* writeTo
* @param: filename, the name of the file to write to
* Return: exports the values of the vec
*/
void Vec::writeTo(const string& filename) const {
	ofstream fout(filename.c_str());
	assert( fout.is_open() );
	fout << mySize << "\n";
	writeTo(fout);
	fout.close();
}

/* readFrom
* @param: in, the stream from which to read
* Return: reads in values from a stream and sets those values to corresponding index
*/
void Vec::readFrom(istream& in) {
	for( unsigned i = 0; i < mySize; i ++){
		in >> myArray[i];
	}
}
