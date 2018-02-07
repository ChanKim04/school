/* Matrix.h provides a class for manipulating 2-dimensional vectors.
 * Student Name: Chan Kim (ck45)
 * 				 Thomas Woltier (tw34)
 * Date: 03/06/2017
 * Begun by: Joel Adams, for CS 112 at Calvin College.
 */

#ifndef MATRIX_H_
#define MATRIX_H_

#include "Vec.h"

template<class Item>
class Matrix {
public:
	Matrix();
	Matrix(unsigned rows, unsigned columns);
	unsigned getRows() const { return myRows; }
	unsigned getColumns() const { return myColumns; }
	Vec<Item>& operator[](unsigned index);
	const Vec<Item>& operator[](unsigned index) const;
	bool operator==(const Matrix& m2);
	bool operator!=(const Matrix& m2);
	void readFrom(istream& in);
	void writeTo(ostream& out) const;
	void writeTo(const string& fileName) const;
	void readFrom(const string& fileName);
	Matrix operator+(const Matrix& m2) const;
	Matrix operator-(const Matrix& m2) const;
	Matrix operator*(const Matrix& m2) const;
	Matrix getTranspose() const;
private:
	unsigned myRows;
	unsigned myColumns;
	Vec< Vec<Item> > myVec;
	friend class MatrixTester;
};
/* Matrix default constructor
 * Postcondition: myRows and myColumns == 0
 */
template<class Item>
Matrix<Item>::Matrix() {
	myRows = myColumns = 0;
}
/* Explicit constructor
 * Parameter: rows, unsigned
 * 			  columns, unsigned
 * Postcondition: myRows == rows
 * 				  myColumns == columns
 */
template<class Item>
Matrix<Item>::Matrix(unsigned rows, unsigned columns) {
	myRows = rows;
	myColumns = columns;
	myVec.setSize(rows);
	for (unsigned i = 0; i < rows; i++) {
		myVec[i].setSize(columns);
		for (unsigned j = 0; j < columns; j++) {
			myVec[i][j];
		}
	}
}
/* []operator for set
 * Parameter: index, unsigned
 * Postcondition: sets the index in the vec to new Item
 */
template<class Item>
Vec<Item>& Matrix<Item>::operator[](unsigned index) {
	if (index < 0 || index >= myRows) {
		throw range_error("out of range");
	}
	return myVec[index];
}
/* []operator for get
 * Parameter: index, unsigned
 * Postcondition: returns the Item at the index in the vec
 */
template<class Item>
const Vec<Item>& Matrix<Item>::operator[](unsigned index) const {
	if (index < 0 || index >= myRows) {
		throw range_error("out of range");
	}
	return myVec[index];
}
/* boolean equality
 * Parameter: m2, a Matrix
 * Postcondition: true is returned, if and only if
 * 					myRows == m2.myRows
 * 					myColumns == m2.myColumns
 * 					myVec == m2.myVec
 * 					my values are same to m2's values.
 */
template<class Item>
bool Matrix<Item>::operator==(const Matrix<Item>& m2) {
	if ( myRows != m2.getRows() || myColumns != m2.getColumns() ) {
		return false;
	}
	for (unsigned i = 0; i < myRows; i++) {
		for (unsigned j = 0; j < myColumns; j++) {
			if ( myVec[i][j] != m2.myVec[i][j] ) {
				return false;
			}
		}
	}
	return true;
}
/* boolean inequality
 * Parameter: m2, a Matrix
 * Postcondition: true is returned, if and only if
 * 					myRows != m2.myRows
 * 					myColumns != m2.myColumns
 * 					or myVec != m2.myVec
 * 					my values are different to m2's values.
 */
template<class Item>
bool Matrix<Item>::operator!=(const Matrix<Item>& m2) {
	if ( myRows != m2.getRows() || myColumns != m2.getColumns() ) {
		return true;
	}
	for (unsigned i = 0; i < myRows; i++) {
		for (unsigned j = 0; j < myColumns; j++) {
			if ( myVec[i][j] != m2.myVec[i][j] ) {
				return true;
			}
		}
	}
	return false;
}

/* Matrix input method
 * Parameter: in, an istream
 * Precondition: in contains the rows, columns, and Vec for a Matrix
 * Postcondition: the rows, columns, and Vec have been read from in
 */
template<class Item>
void Matrix<Item>::readFrom(istream& in) {
	for(unsigned i = 0; i < myRows; i++){
		for(unsigned j =0; j < myColumns; j++){
		in >> myVec[i][j];
		}
	}
}
/* Matrix output
 * Parameter: out, an ostream
 * Postcondition: out Vec
 */
template<class Item>
void Matrix<Item>::writeTo(ostream& out) const {
	for(unsigned i = 0; i < myRows; i++){
		for(unsigned j =0; j < myColumns; j++){
		out << myVec[i][j] << '\t';
		}
		out << '\n';
	}
	out << endl;
}
/* File Input
 * Parameter: fileName, a string
 * Precondition: fileName contain the name of a Matrix file.
 */
template<class Item>
void Matrix<Item>::readFrom(const string& fileName) {
	ifstream fin( fileName.c_str() );
	assert ( fin.is_open());
	fin >> myRows >> myColumns;
	myVec.setSize(myRows);
	for(unsigned i = 0; i < myRows; i++) {
		myVec[i].setSize(myColumns);
	}
	readFrom(fin);
	fin.close();
}
/* File Output
 * Parameter: fileName, a string
 * Precondition: exports the values of the Matrix
 */
template<class Item>
void Matrix<Item>::writeTo(const string& fileName) const{
	ofstream fout(fileName.c_str());
	assert( fout.is_open() );
	fout << myRows << '\t' << myColumns << '\n';
	writeTo(fout);
	fout.close();
}
/* Matrix addition
 * Parameter: m2, a Matrix
 * Precondition: myRows == m2.myRows()
 * 				 myColumns = m2.myColumns()
 * Postcondition: a Matrix is returned containing the product of
 * 					my values and m2's values.
 */
template<class Item>
Matrix<Item> Matrix<Item>::operator+(const Matrix<Item>& m2) const {
	if ((myRows != m2.myRows) or (myColumns != m2.myColumns)) {
		throw invalid_argument("not the same size");
	}
	Matrix<Item> addMax(myRows, myColumns);
	for(unsigned i = 0; i < myRows; i++){
		for(unsigned j =0; j < myColumns; j++){
			addMax[i][j] = myVec[i][j] + m2.myVec[i][j];
		}
	}
	return addMax;
}
/* Matrix subtraction
 * Parameter: m2, a Matrix
 * Precondition: myRows == m2.myRows()
 * 				 myColumns = m2.myColumns()
 * Postcondition: a Matrix is returned containing the product of
 * 					my values and m2's values.
 */
template<class Item>
Matrix<Item> Matrix<Item>::operator-(const Matrix<Item>& m2) const {
	if ((myRows != m2.myRows) or (myColumns != m2.myColumns)) {
		throw invalid_argument("not the same size");
	}
	Matrix<Item> subMax(myRows, myColumns);
	for(unsigned i = 0; i < myRows; i++){
		for(unsigned j =0; j < myColumns; j++){
			subMax[i][j] = myVec[i][j] - m2.myVec[i][j];
		}
	}
	return subMax;
}
/* Matrix multiply
 * Parameter: m2, a Matrix
 * Precondition: myRows == m2.myColumns()
 * Postcondition: a Matrix is returned containing the product of
 * 					my values and m2's values.
 */
template<class Item>
Matrix<Item> Matrix<Item>::operator*(const Matrix<Item>& m2) const {
	if (myColumns != m2.myRows) {
		throw invalid_argument("not the same size");
	}
	Matrix<Item> mulMax(myRows, m2.myColumns);
	for(unsigned i = 0; i < myRows; i++)
		for(unsigned j =0; j < m2.myColumns; j++)
		{
			double sum = 0;
			for(unsigned k =0; k < myColumns; k++)
			sum += myVec[i][k] * m2.myVec[k][j];
			mulMax[i][j] = sum;
		}
	return mulMax;
	}
/* Matrix transpose
 * Postcondition: returns a Matrix whose columns are myRows, and whose rows are myColumns
 */
template<class Item>
Matrix<Item> Matrix<Item>::getTranspose() const{
	Matrix Max(myColumns, myRows);
	for(unsigned i = 0; i < myColumns; i++){
		for(unsigned j =0; j < myRows; j++){
			Max[i][j] = myVec[j][i];
		}
	}
	return Max;
}
#endif
