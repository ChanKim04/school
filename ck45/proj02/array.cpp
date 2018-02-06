/* array.cpp defines "C style" array operations
 * Name: Chan Kim (ck45)
 * Date: 2/20/2017
 * Begun by: Joel Adams, for CS 112 at Calvin College.
 */
 
#include "array.h"
#include <fstream>

void initialize(double *a, unsigned size) {
	int val = 0;
	for (unsigned i = 0; i < size; i++) {
		val = i+1;
		a[i] = val;
	}
}
 
void print(double *a, unsigned size) {
	for (unsigned i = 0; i < size; i++) {
		cout << *a << '\t';
		a++;
	}
}		

double average(double *a, unsigned size) {
	double sum = 0;
	for (unsigned i = 0; i < size; i++) {
		sum = sum + *a;
		a++;
	}
	return sum/size;
}

double sum(double *a, int size) {
	double sum = 0;
		for (int i = 0; i < size; i++) {
			sum = sum + *a;
			a++;
		}
		return sum;
}
/* read size values from in and store them in a
 * @param: in, istream, *a, double, size, an integer
 */
void read(istream& in, double *a, int size) {
	for (int i = 0; i < size; i++) {
		in >> *a;
		a++;
	}
}
/* open an ifstream to the file and store the values into the dynamic array
 * @param: fileName, a string, *&a, double, &numValues, an integer
 */
void fill(const string& fileName, double *&a, int &numValues) {
	ifstream fin(fileName.c_str()); //(i) open an ifstream to the file named fileName
	assert (fin.is_open());
	fin >> numValues; //(ii) read an integer from the file into numValues
	double * newArray = new double[numValues]; //(iii) dynamically allocate an array of numValues double values,
	*&a = newArray; //storing its address in a
	for (int i = 0; i < numValues; i++) { // (iv) read numValues values from the file, storing them in the dynamic array
		fin >> *&a[i];
	}
	fin.close(); //(v) close the ifstream
}
/* change the size of the array from oldSize to newSize
 * @param: *&a double, oldSize and newSize, integers
 */
void resize(double *&a, int oldSize, int newSize) {
	double * newArray = new double[newSize];
	if (newSize > oldSize) { //all of the values in the old array are copied into the new array
		for (int i = 0; i < oldSize; i++) {
		newArray[i] = a[i];
		}
	}
	if (newSize < oldSize) {//the end-elements of the array are truncated
		for (int i = 0; i < newSize; i++) {
			newArray[i] = a[i];
		}
	}
	delete [] a;//"dispose of" the old array
	a = newArray;
}
/* pass back array
 * @param: *a1, *a2 and *&a3, double, size1, size2 and &size3, integers
 */
void concat(double *a1, int size1, double *a2, int size2, double *&a3, int &size3) {
	if (a3 != NULL) {//If the initial address in a3 is not NULL
		delete [] a3;//dispose of that old array
	}
	size3 = size1 + size2;//(ii) size3 equal to size1 plus size2
	a3 = new double[size3];
	//(i) array a3 containing the values of a1 followed by those of a2
	for (int i = 0; i < size1; i++) {
		a3[i] = a1[i];
	}
	for (int i = 0; i < size2; i++) {
		a3[i + size1] = a2[i];
	}
}
