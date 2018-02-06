/* ListTester.cpp defines the test methods for class List.
 * Joel Adams, for CS 112 at Calvin College.
 * Seth Galyon wrote: testInequality(), testWriteToStream(), testReadFromString(), testGetIndexOf(), testRemove()
 * Chan Kim wrote: testEquality(), testReadFromStream(), testWriteToString(), testPrepend(), testInsert()
 */


#include "ListTester.h" // ListTester
#include "List.h"       // List
#include <iostream>     // cin, cout
#include <cassert>      // assert()
#include <cstdlib>      // exit()
#include <stdexcept>    // underflow_error
using namespace std;

void ListTester::runTests() {
	cout << "Running List tests..." << endl;
	testDefaultConstructor();
	testNodeDefaultConstructor();
	testNodeExplicitConstructor();
	testAppend();
	testDestructor();
	testCopyConstructor();
	testAssignment();
	testEquality();
	testInequality();
	testReadFromStream();
	testWriteToStream();
	testReadFromString();
	testWriteToString();
	testGetIndexOf();
	testPrepend();
	testInsertion();
	testRemove();
	testInsertAfter();
	testInsertBefore();
	testOutputOperator();

	cout << "All tests passed!" << endl;
}

void ListTester::testDefaultConstructor() {
	cout << "Testing List default constructor... " << flush;
	List<double> aList;
	assert( aList.mySize == 0 );
	assert( aList.myFirst == NULL );
	assert( aList.myLast == NULL );
	cout << "Passed!" << endl;
}

void ListTester::testNodeDefaultConstructor() {
	cout << "Testing Node default constructor... " << flush;
	List<double>::Node aNode;
	assert( aNode.myItem == 0 );
	assert( aNode.myNext == NULL );
	cout << "Passed!" << endl;
}

void ListTester::testNodeExplicitConstructor() {
	cout << "Testing Node explicit constructor... " << flush;
	List<double>::Node n1(11, NULL);
	assert( n1.myItem == 11 );
	assert( n1.myNext == NULL );
	cout << " 1 " << flush;

	List<double>::Node *n3 = new List<double>::Node(33, NULL);
	List<double>::Node n2(22, n3);
	assert( n2.myItem == 22 );
	assert( n2.myNext == n3 );
	cout << " 2 " << flush;
	cout << "Passed!" << endl;
}

void ListTester::testAppend() {
	cout << "Testing append()... " << flush;
	// empty List
	List<double> aList;
	assert( aList.getSize() == 0 );
	assert( aList.myFirst == NULL );
	assert( aList.myLast == NULL );
	try {
		aList.getFirst();
		cerr << "getFirst() worked on empty list" << endl;
		exit(1);
	} catch (underflow_error&) {
		cout << " 0a " << flush;
	}
	try {
		aList.getLast();
		cerr << "getLast() worked on empty list" << endl;
		exit(1);
	} catch (underflow_error&) {
		cout << " 0b " << flush;
	}
	// append to empty list
	aList.append(11);
	assert( aList.getSize() == 1 );
	assert( aList.myFirst != NULL );
	assert( aList.myLast == aList.myFirst );
	assert( aList.getFirst() == 11 );
	assert( aList.getLast() == 11 );
	assert( aList.myFirst->myNext == NULL );
	cout << " 1 " << flush;
	// append to a list containing 1 Item
	aList.append(22);
	assert( aList.getSize() == 2 );
	assert( aList.myFirst != NULL );
	assert( aList.myLast != NULL );
	assert( aList.myFirst != aList.myLast );
	assert( aList.getFirst() == 11 );
	assert( aList.getLast() == 22 );
	assert( aList.myFirst->myNext != NULL );
	assert( aList.myLast->myNext == NULL );
	cout << " 2 " << flush;
	// append to a list containing 2 Items
	aList.append(33);
	assert( aList.getSize() == 3 );
	assert( aList.myFirst != NULL );
	assert( aList.myLast != NULL );
	assert( aList.getFirst() == 11 );
	assert( aList.getLast() == 33 );
	assert( aList.myFirst->myNext->myItem == 22 );
	assert( aList.myLast->myNext == NULL );
	cout << " 3 " << flush;
	cout << "Passed!" << endl;
}

void ListTester::testDestructor() {
	cout << "Testing destructor... " << flush;
	List<double> aList;
	aList.~List();
	assert( aList.getSize() == 0 );
	assert( aList.myFirst == NULL );
	assert( aList.myLast == NULL );
	cout << " 1 " << flush;

	aList.append(11);
	aList.append(22);
	aList.append(33);
	aList.~List();
	assert( aList.getSize() == 0 );
	assert( aList.myFirst == NULL );
	assert( aList.myLast == NULL );
	cout << " 2 " << flush;
	cout << "Passed!  But double-check for memory leaks!" << endl;
}

void ListTester::testCopyConstructor() {
	cout << "Testing copy constructor... " << flush;
	// copy empty list
	List<double> list1;
	List<double> list2(list1);
	assert( list2.getSize() == 0 );
	assert( list2.myFirst == NULL );
	assert( list2.myLast == NULL );
	cout << " 1 " << flush;

	// copy nonempty list
	List<double> list3;
	list3.append(11);
	list3.append(22);
	list3.append(33);
	List<double> list4(list3);
	assert( list4.getSize() == 3 );
	assert( list4.getFirst() == 11 );
	assert( list4.getLast() == 33 );
	assert( list4.myFirst->myNext->myItem == 22 );
	assert( list4.myFirst != list3.myFirst );
	assert( list4.myLast != list3.myLast );
	cout << " 2 " << flush;
	cout << "Passed!" << endl;
}

void ListTester::testAssignment() {
	cout << "Testing assignment... " << flush;
	// empty to empty assignment
	List<double> list1;
	List<double> list2;
	list2 = list1;
	assert( list2.getSize() == 0 );
	assert( list2.myFirst == NULL );
	assert( list2.myLast == NULL );
	cout << " 1 " << flush;

	// non-empty to empty assignment
	List<double> list3;
	list3.append(11);
	list3.append(22);
	list3.append(33);
	List<double> list4;
	list4 = list3;
	assert( list4.getSize() == 3 );
	assert( list4.getFirst() == 11 );
	assert( list4.getLast() == 33 );
	assert( list4.myFirst->myNext->myItem == 22 );
      // check that nodes are distinct
	assert( list4.myFirst != list3.myFirst );
	assert( list4.myFirst->myNext != list3.myFirst->myNext );
	assert( list4.myLast != list3.myLast );
	cout << " 2 " << flush;

	// equal-sized non-empty to non-empty assignment
	List<double> list5;
	list5.append(44);
	list5.append(55);
	list5.append(66);
	list5 = list3;
	assert( list5.getSize() == 3 );
	assert( list5.getFirst() == 11 );
	assert( list5.getLast() == 33 );
	assert( list5.myFirst->myNext->myItem == 22 );
      // check that nodes are distinct
	assert( list5.myFirst != list3.myFirst );
	assert( list5.myFirst->myNext != list3.myFirst->myNext );
	assert( list5.myLast != list3.myLast );
	cout << " 3 " << flush;

	// empty to non-empty assignment
	List<double> list6;
	list6.append(44);
	list6.append(55);
	list6.append(66);
	List<double> list7;
	list6 = list7;
	assert( list6.getSize() == 0 );
	assert( list6.myFirst == NULL );
	assert( list6.myLast == NULL );
	cout << " 4 " << flush;

	// unequal-sized non-empty to non-empty assignment
	List<double> list8;
	list8.append(44);
	list8.append(55);
	list8.append(66);
	list8.append(77);
	list8 = list3;
	assert( list8.getSize() == 3 );
	assert( list8.getFirst() == 11 );
	assert( list8.getLast() == 33 );
	assert( list8.myFirst->myNext->myItem == 22 );
      // check that nodes are distinct
	assert( list8.myFirst != list3.myFirst );
	assert( list8.myFirst->myNext != list3.myFirst->myNext );
	assert( list8.myLast != list3.myLast );
	cout << " 5 " << flush;

	// assignment chaining
	List<double> list9;
	list9.append(44);
	list9.append(55);
	list9.append(66);
	list9.append(77);
	List<double> list10;
	list10 = list9 = list8;
	assert( list10.getSize() == 3 );
	assert( list10.getFirst() == 11 );
	assert( list10.getLast() == 33 );
	assert( list10.myFirst->myNext->myItem == 22 );
	cout << " 6 " << flush;

	// self-assignment (stupid, but possible)
	List<double> list11;
	list11.append(11);
	list11.append(22);
	list11.append(33);
	list11 = list11;
	assert( list11.getSize() == 3 );
	assert( list11.getFirst() == 11 );
	assert( list11.getLast() == 33 );
	assert( list11.myFirst->myNext->myItem == 22 );
	cout << " 7 " << flush;

	cout << "Passed!  But double-check for memory leaks!" << endl;
}

void ListTester::testEquality(){
	cout << "Testing ==... " << flush;
	// empty
	List<double> l1;
	List<double> l2;
	assert(l1 == l2);
	cout << " 1 " << flush;

	// same sized
	List<double> l3;
	List<double> l4a;
	List<double> l4b;
	l3.append(11);
	l4a.append(11);
	l4b.append(22);
	assert (!(l2 == l3));
	assert ((l3 == l4a));
	assert (!(l3 == l4b));
	l3.append(22);
	l4a.append(33);
	assert(!(l3 == l4a));
	cout << " 2 " << flush;

	// different sized
	List<double> l5;
	l5.append(11);
	l5.append(22);
	assert ((l3 == l5));
	l5.append(33);
	assert (!(l3==l5));
	cout << " 3 " << flush;
	cout << "Passed!" << endl;

}

void ListTester::testReadFromStream() {
	cout << "Testing readFrom(istream)... " << flush;
	// an ifstream is-an istream, so use one to automate the test
	ifstream fin("ListTest1.txt");
	assert(fin.is_open());
	// build the List
	List<double> l1;
	l1.readFrom(fin);
	// test readFrom()
	assert( l1.getSize() == 3 );
	assert( l1.getFirst() == 11 );
	assert( l1.getLast() == 33 );
	assert( l1.myFirst->myNext->myItem == 22 );
	cout << "Passed!" << endl;
}

void ListTester::testWriteToString(){
	cout << "Testing writeTo(string)... " << flush;
	List<double> l1;
	// read in a List whose values we know
	ifstream fin("ListTest1.txt");
	assert(fin.is_open());
	l1.readFrom(fin);
	// write it to a file
	l1.writeTo("ListTest2.txt");
	// now, read what we just wrote into a different List
	List<double> l2;
	ifstream fin2("ListTest2.txt");
	assert(fin2.is_open());
	l2.readFrom(fin2);
	// test it
	assert( l2.getSize() == 3 );
	assert( l2.getFirst() == 11 );
	assert( l2.getLast() == 33 );
	assert( l2.myFirst->myNext->myItem == 22 );
	cout << "Passed!" << endl;
}

void ListTester::testPrepend(){
	cout << "Testing prepend()... " << flush;
	// empty List
	List<double> aList;
	assert( aList.getSize() == 0 );
	assert( aList.myFirst == NULL );
	assert( aList.myLast == NULL );
	try {
		aList.getFirst();
		cerr << "getFirst() worked on empty list" << endl;
		exit(1);
	} catch (underflow_error&) {
		cout << " 0a " << flush;
	}
	try {
		aList.getLast();
		cerr << "getLast() worked on empty list" << endl;
		exit(1);
	} catch (underflow_error&) {
		cout << " 0b " << flush;
	}
	// prepend to empty list
	aList.prepend(11);
	assert( aList.getSize() == 1 );
	assert( aList.myFirst != NULL );
	assert( aList.myLast == aList.myFirst );
	assert( aList.getFirst() == 11 );
	assert( aList.getLast() == 11 );
	assert( aList.myFirst->myNext == NULL );
	cout << " 1 " << flush;
	// prepend to a list containing 1 Item
	aList.prepend(22);
	assert( aList.getSize() == 2 );
	assert( aList.myFirst != NULL );
	assert( aList.myLast != NULL );
	assert( aList.myFirst != aList.myLast );
	assert( aList.getFirst() == 22 );
	assert( aList.getLast() == 11 );
	assert( aList.myFirst->myNext != NULL );
	assert( aList.myLast->myNext == NULL );
	cout << " 2 " << flush;
	// prepend to a list containing 2 Items
	aList.prepend(33);
	assert( aList.getSize() == 3 );
	assert( aList.myFirst != NULL );
	assert( aList.myLast != NULL );
	assert( aList.getFirst() == 33 );
	assert( aList.getLast() == 11 );
	assert( aList.myFirst->myNext->myItem == 22 );
	assert( aList.myLast->myNext == NULL );
	cout << " 3 " << flush;
	cout << "Passed!" << endl;

}

void ListTester::testInsertion(){
	cout << "Testing insert()... " << flush;
	// empty List
	List<double> aList;
	assert( aList.getSize() == 0 );
	assert( aList.myFirst == NULL );
	assert( aList.myLast == NULL );
	try {
		aList.getFirst();
		cerr << "getFirst() worked on empty list" << endl;
		exit(1);
	} catch (underflow_error&) {
		cout << " 0a " << flush;
	}
	try {
		aList.getLast();
		cerr << "getLast() worked on empty list" << endl;
		exit(1);
	} catch (underflow_error&) {
		cout << " 0b " << flush;
	}
	// insert to empty list
	aList.insert(11,0);
	assert( aList.getSize() == 1 );
	assert( aList.myFirst != NULL );
	assert( aList.myLast == aList.myFirst );
	assert( aList.getFirst() == 11 );
	assert( aList.getLast() == 11 );
	assert( aList.myFirst->myNext == NULL );
	cout << " 1 " << flush;
	// insert to a list containing 1 Item at index 2
	aList.insert(33,2);
	assert( aList.getSize() == 2 );
	assert( aList.myFirst != NULL );
	assert( aList.myLast != NULL );
	assert( aList.myFirst != aList.myLast );
	assert( aList.getFirst() == 11 );
	assert( aList.getLast() == 33 );
	assert( aList.myFirst->myNext != NULL );
	assert( aList.myLast->myNext == NULL );
	cout << " 2 " << flush;
	// insert to a list containing 2 Items at index 1
	aList.insert(22,1);
	assert( aList.getSize() == 3 );
	assert( aList.myFirst != NULL );
	assert( aList.myLast != NULL );
	assert( aList.getFirst() == 11 );
	assert( aList.getLast() == 33 );
	assert( aList.myFirst->myNext->myItem == 22 );
	assert( aList.myLast->myNext == NULL );
	cout << " 3 " << flush;
	cout << "Passed!" << endl;
}

void ListTester::testInequality() {
	cout << "Testing operator!=()... " << flush;

	// empty
	List<int> l1;
	List<int> l2;
	assert( !(l1 != l2) );
	cout << " 0 " << flush;

	// nonempty, same values and same size
	List<int> l3;
	l3.append(11);
	l3.append(22);
	l3.append(33);
	List<int> l4;
	l4.append(11);
	l4.append(22);
	l4.append(33);
	assert( !(l3 != l4) );
	cout << " 1 " << flush;

	// nonempty, different values and same size
	List<int> l5;
	l5.append(11);
	l5.append(22);
	l5.append(33);
	List<int> l6;
	l6.append(12);
	l6.append(22);
	l6.append(33);
	assert( l5 != l6 );
	cout << " 2 " << flush;

	// nonempty, same values(more or less) and different size
	List<int> l7;
	l7.append(11);
	l7.append(22);
	l7.append(33);
	List<int> l8;
	l8.append(11);
	l8.append(22);
	assert( l5 != l6 );
	cout << " 3 " << flush;

	//empty and nonempty
	List<int> l9;
	List<int> l10;
	l10.append(11);
	l10.append(22);
	assert( l9 != l10 );
	cout << " 4 " << flush;

	cout << "Passed!" << endl;
}

void ListTester::testWriteToStream() {
	cout << "Testing writeTo(ostream)... " << flush;
	List<unsigned> l;
	// read a Matrix whose values we know
	l.readFrom("ListTest1.txt");
	ofstream fout("ListTest1Copy.txt");
	assert( fout.is_open() );
	// now write it to a file via a stream
	l.writeTo(fout);
	fout.close();
	// now, read what we just wrote into a different Matrix
	List<int> l1;
	l1.readFrom("ListTest1Copy.txt");
	// and test it
	assert( l1.getSize() == 3 );
	assert( l1.myFirst->myItem == 11 );
	assert( l1.myFirst->myNext->myItem == 22 );
	assert( l1.myFirst->myNext->myNext->myItem == 33 );

	cout << "Passed!" << endl;
}

void ListTester::testReadFromString() {
	cout << "Testing readFrom(string)... " << flush;
	// build the List
	List<double> l1;
	l1.readFrom("ListTest1.txt");
	// test readFrom(string)
	assert( l1.getSize() == 3 );
	assert( l1.getFirst() == 11 );
	assert( l1.getLast() == 33 );
	assert( l1.myFirst->myNext->myItem == 22 );
	cout << "Passed!" << endl;
}

void ListTester::testGetIndexOf() {
	cout << "Testing getIndexOf(item)... " << flush;
	//create a list
	List<double> l1;
	l1.append(11);
	l1.append(22);
	l1.append(33);

	//get index of values in l1
	int index = l1.getIndexOf(22);
	assert( index == 1 );
	cout << " 0 " << flush;
	int index2 = l1.getIndexOf(11);
	assert( index2 == 0 );
	cout << " 1 " << flush;
	int index3 = l1.getIndexOf(33);
	assert( index3 == 2 );
	cout << " 2 " << flush;

	//try to get index of value not in l1
	int index4 = l1.getIndexOf(1);
	assert( index4 == -1 );
	cout << " 3 " << flush;

	//create an empty list
	List<double> l0;

	//try to get an index in the empty list
	int index5 = l0.getIndexOf(22);
	assert( index5 == -1 );
	cout << " 4 " << flush;

	cout << " Passed!" << endl;
}

void ListTester::testRemove() {
	cout << "Testing remove(index)... " << flush;

	//create an empty list
	List<double> l0;

	//try to remove an index
	double it0 = l0.remove(1);
	double it1 = l0.remove(-2);
	assert( it0 == 0 );
	assert( it1 == 0 );
	cout << " 0 " << flush;

	//create a list
	List<double> l1;
	l1.append(11);
	l1.append(22);
	l1.append(33);

	//remove 11 with index zero
	double it;
	it = l1.remove(0);
	assert( it == 11 );
	assert( l1.mySize == 2 );
	assert( l1.myFirst->myItem == 22 );
	assert( l1.myLast->myItem == 33 );
	assert( l1.myFirst != l1.myLast );
	cout << " 1 " << flush;

	//remove 22 (first index) with index less than zero
	double it2;
	it2 = l1.remove(-1);
	assert( it2 == 22 );
	assert( l1.mySize == 1 );
	assert( l1.myFirst->myItem == 33 );
	assert( l1.myFirst == l1.myLast );
	cout << " 2 " << flush;

	//create a new list
	List<double> l2;
	l2.append(11);
	l2.append(22);
	l2.append(33);
	l2.append(44);
	l2.append(55);

	//remove 33 with index 2
	double it3;
	it3 = l2.remove(2);
	assert( it3 == 33 );
	assert( l2.mySize == 4 );
	assert( l2.myFirst->myItem == 11 );
	assert( l2.myFirst->myNext->myItem == 22 );
	assert( l2.myFirst->myNext->myNext->myItem == 44 );
	assert( l2.myLast->myItem == 55 );
	assert( l2.myFirst != l1.myLast );
	cout << " 3 " << flush;

	//remove 44 with index 2
	double it4;
	it4 = l2.remove(2);
	assert( it4 == 44 );
	assert( l2.mySize == 3 );
	assert( l2.myFirst->myItem == 11 );
	assert( l2.myLast->myItem == 55 );
	assert( l2.myFirst != l1.myLast );
	cout << " 4 " << flush;

	//new list
	List<double> l3;
	l3.append(11);
	l3.append(22);
	l3.append(33);

	//remove 33 with index of 2
	double it5;
	it5 = l3.remove(2);
	assert( it5 == 33 );
	assert( l3.mySize == 2 );
	assert( l3.myFirst->myItem == 11 );
	assert( l3.myLast->myItem == 22 );
	assert( l3.myFirst != l3.myLast );
	cout << " 5 " << flush;

	//remove 22 (last index) with index larger than last index
	double it6;
	it6 = l3.remove(3);
	assert( it6 == 22 );
	assert( l3.mySize == 1 );
	assert( l3.myFirst->myItem == 11 );
	assert( l3.myFirst == l3.myLast );
	cout << " 6 " << flush;

	cout << " Passed!" << endl;
}

void ListTester::testInsertAfter(){
	cout << "Testing InsertAfter()... " << flush;
	// insert to an empty List
	List<string> aList;
	aList.insertAfter("Ann","Bob");
	assert( aList.getSize() == 0 );
	assert( aList.myFirst == NULL );
	assert( aList.myLast == NULL );
	try {
		aList.getFirst();
		cerr << "getFirst() worked on empty list" << endl;
		exit(1);
	} catch (underflow_error&) {
		cout << " 0a " << flush;
	}
	try {
		aList.getLast();
		cerr << "getLast() worked on empty list" << endl;
		exit(1);
	} catch (underflow_error&) {
		cout << " 0b " << flush;
	}
	// insert to a list containing 1 Item
	aList.append("Ann");
	aList.insertAfter("Ann","Bob");
	assert( aList.getSize() == 2 );
	assert( aList.myFirst != NULL );
	assert( aList.myLast != NULL );
	assert( aList.myFirst != aList.myLast );
	assert( aList.getFirst() == "Ann" );
	assert( aList.getLast() == "Bob" );
	assert( aList.myFirst->myNext != NULL );
	assert( aList.myLast->myNext == NULL );
	cout << " 1 " << flush;
	// insert to a list containing 2 Items
	aList.insertAfter("Ann","Chris");
	assert( aList.getSize() == 3 );
	assert( aList.myFirst != NULL );
	assert( aList.myLast != NULL );
	assert( aList.getFirst() == "Ann" );
	assert( aList.getLast() == "Bob" );
	assert( aList.myFirst->myNext->myItem == "Chris" );
	assert( aList.myLast->myNext == NULL );
	cout << " 2 " << flush;
	// insert to a list containing 3 Items
	aList.insertAfter("Chris","Don");
	assert( aList.getSize() == 4 );
	assert( aList.myFirst != NULL );
	assert( aList.myLast != NULL );
	assert( aList.getFirst() == "Ann" );
	assert( aList.getLast() == "Bob" );
	assert( aList.myFirst->myNext->myItem == "Chris" );
	assert( aList.myFirst->myNext->myNext->myItem == "Don" );
	assert( aList.myLast->myNext == NULL );
	cout << " 3 " << flush;
	cout << " Passed!" << endl;
}
void ListTester::testInsertBefore(){
	cout << "Testing InsertBefore()... " << flush;
	// insert to an empty List
	List<string> aList;
	aList.insertBefore("Ann","Bob");
	assert( aList.getSize() == 0 );
	assert( aList.myFirst == NULL );
	assert( aList.myLast == NULL );
	try {
		aList.getFirst();
		cerr << "getFirst() worked on empty list" << endl;
		exit(1);
	} catch (underflow_error&) {
		cout << " 0a " << flush;
	}
	try {
		aList.getLast();
		cerr << "getLast() worked on empty list" << endl;
		exit(1);
	} catch (underflow_error&) {
		cout << " 0b " << flush;
	}
	// insert to a list containing 1 Item
	aList.append("Ann");
	aList.insertBefore("Ann","Bob");
	assert( aList.getSize() == 2 );
	assert( aList.myFirst != NULL );
	assert( aList.myLast != NULL );
	assert( aList.myFirst != aList.myLast );
	assert( aList.getFirst() == "Bob" );
	assert( aList.getLast() == "Ann" );
	assert( aList.myFirst->myNext != NULL );
	assert( aList.myLast->myNext == NULL );
	cout << " 1 " << flush;
	// insert to a list containing 2 Items
	aList.insertAfter("Ann","Chris");
	assert( aList.getSize() == 3 );
	assert( aList.myFirst != NULL );
	assert( aList.myLast != NULL );
	assert( aList.getFirst() == "Bob" );
	assert( aList.getLast() == "Chris" );
	assert( aList.myFirst->myNext->myItem == "Ann" );
	assert( aList.myLast->myNext == NULL );
	cout << " 2 " << flush;
	// insert to a list containing 3 Items
	aList.insertAfter("Ann","Don");
	assert( aList.getSize() == 4 );
	assert( aList.myFirst != NULL );
	assert( aList.myLast != NULL );
	assert( aList.getFirst() == "Bob" );
	assert( aList.getLast() == "Chris" );
	assert( aList.myFirst->myNext->myItem == "Ann" );
	assert( aList.myFirst->myNext->myNext->myItem == "Don" );
	assert( aList.myLast->myNext == NULL );
	cout << " 3 " << flush;
	cout << " Passed!" << endl;
}
void ListTester::testOutputOperator(){
	cout << "Testing OutputOperator()... " << flush;
	List<string> aList;
	aList.append("A");
	aList.append("B");
	aList.append("C");
	cout << aList << flush;
	cout << " Passed!" << endl;
}
