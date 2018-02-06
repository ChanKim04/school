/*
 * List.h
 * Student: Chan Kim (ck45)
 * Date: March 27, 2017
 *
 * based on proj05 by
 * Seth Galyon wrote: operator!=(), writeTo(ostream), readFrom(string), getIndexOf(Item), remove(index)
 * Chan Kim wrote: operator==(), readFrom(istream), writeTo(string), prepend(item), insert(item, index)
 */

#ifndef LIST_H_
#define LIST_H_
#include <iostream>
#include <stdexcept>
#include <cstdlib>
#include <fstream>
#include <ostream>
#include <cassert>
using namespace std;

template<class Item>


class List {
public:
	List();
	unsigned getSize() const{return mySize;};
	Item getFirst() const;
	Item getLast() const;
	void append(const Item& it);
	virtual ~List();
	List(const List<Item>& original);
	List<Item>& operator=(const List<Item>& original);

	bool operator==(const List<Item>& l2);
	void readFrom(istream& in);
	void writeTo(const string& fileName) const;
	void prepend(const Item& it);
	void insert(const Item& it, unsigned index);

	bool operator!=(const List<Item>& l2);
	void writeTo(ostream& out, const string& separator = "\t") const ;
	void readFrom(const string& fileName);
	int getIndexOf(const Item& it);
	Item remove(double index);
	bool insertAfter(const Item& otherPersonsName, const Item& yourName);
	bool insertBefore(const Item& otherPersonsName, const Item& yourName);

private:
	struct Node {
		Node();
		Node(const Item& item, Node* next);
		virtual ~Node();
		Item myItem;
		Node* myNext;
	};
	unsigned mySize;
	Node* myFirst;
	Node* myLast;
	friend class ListTester;

};

/* List default constructor
 * Postcondition: mySize == 0
 * 					myFirst and myLast == NULL
 */
template<class Item>
List<Item>::List() {
	mySize = 0;
	myFirst = myLast = NULL;
}

/* Node default constructor
 * Postcondition: myItem == Item()
 * 					myNext == NULL
 */
template<class Item>
List<Item>::Node::Node() {
	myItem = Item();
	myNext = NULL;
}

/* Explicit constructor
 * Parameter: item, Item
 * 			  next, Node
 * Postcondition: myItem == item
 * 				  myNext == next
 */
template<class Item>
List<Item>::Node::Node(const Item& item, Node* next) {
	myItem = item;
	myNext = next;
}

/* Get first
 * Postcondition: return the first item
 */
template<class Item>
Item List<Item>::getFirst() const {
	if (mySize < 0 || myFirst == NULL){
		throw underflow_error("invalid list");
	} else {
		return myFirst -> myItem;
	}
}

/* Get last
 * Postcondition: return the last item
 */
template<class Item>
Item List<Item>::getLast() const {
	if (mySize < 0 || myLast == NULL){
		throw underflow_error("invalid list");
	} else {
		return myLast -> myItem;
	}
}

/* Append an item
 * Parameter: it, Item
 * Postcondition: appends an item on the list
 */
template<class Item>
void List<Item>::append(const Item& it){
	Node * nodePtr = new Node(it,NULL);
	if (mySize == 0){
		myFirst = nodePtr;
	} else {
		myLast -> myNext = nodePtr;
	}
	myLast = nodePtr;
	mySize ++;
}

template<class Item>
List<Item>::~List() {
	delete myFirst;          // delete first node, invoking ~Node() (does nothing if myFirst == NULL)
	myFirst = myLast = NULL; // clear myFirst and myLast (optional)
	mySize = 0;
}

template<class Item>
List<Item>::Node::~Node() {
	//cout << "~Node() is deallocating the node containing item "
	//     << myItem << endl;
	delete myNext;       // delete the next node, invoking ~Node() in it
                         // (does nothing if myNext == NULL)
}

template<class Item>
List<Item>::List(const List<Item>& original) {
	myFirst = myLast = NULL;          //  set pointers
    mySize = 0;                       //   and size to 'empty' values
    if (original.getSize() > 0) {     //  if there are nodes to copy:
    	Node* oPtr = original.myFirst; //  start at the first node
        while (oPtr != NULL) {         //  while there are more nodes:
           append(oPtr->myItem);       //   append the item in that node
           oPtr = oPtr->myNext;        //   advance to next node
        }
     }
}

template<class Item>
List<Item>& List<Item>::operator=(const List<Item>& original){
	if (this != &original) {			  //  If original and I are two distinct lists
		this -> ~List();				  //  Deallocate my chain of nodes.
		myFirst = myLast = NULL;          //  set pointers
		mySize = 0;						  //   and size to 'empty' values
		if (original.getSize() > 0) {     //  if there are nodes to copy:
		    	Node* nPtr = original.myFirst; //  start at the first node
		        while (nPtr != NULL) {         //  while there are more nodes:
		           append(nPtr->myItem);       //   append the item in that node
		           nPtr = nPtr->myNext;
		        }
		}
	}
	return *this;
}

/* boolean equality
 * Parameter: l2, a List
 * Postcondition: true is returned, if and only if
 * 					mySize == l2.mySize
 * 					myPtr->myItem == l2Ptr->myItem)
 * 					my values are same to l2's values.
 */
template<class Item>
bool List<Item>::operator==(const List<Item>& l2) {
	if (mySize != l2.mySize) {
		return false;
	}	else if (mySize == l2.mySize) {
		Node* myPtr = myFirst;
		Node* l2Ptr = l2.myFirst;
		for (unsigned i = 0; i < mySize; i++) {
			if ((myPtr->myItem) != (l2Ptr->myItem)) {
			return false;
			}
			myPtr = myPtr->myNext;
			l2Ptr = l2Ptr->myNext;
		}
	}
	return true;
}

/* List input method
 * Parameter: in, an istream
 * Precondition: in contains items for a List
 * Postcondition: Items have been read from in
 */
template<class Item>
void List<Item>::readFrom(istream& in) {
	if (mySize != 0) {
		delete myFirst;
		myFirst = myLast = NULL;
		mySize = 0;
	}
	string line;
	getline(in, line);
	double start;
	start = 0;
	for (unsigned i = 0; i <= line.length(); i++){
		if (line[i]== ' ') {
			Item item = atof(line.substr(start,i).c_str());
			append(item);
			start = i+1;
		}
	}
	Item item = atof(line.substr(start,line.length()).c_str());
	append(item);
}

/* File Output
 * Parameter: fileName, a string
 * Precondition: exports the values of the List
 */
template<class Item>
void List<Item>::writeTo(const string& fileName) const {
	ofstream fout(fileName.c_str());
	assert( fout.is_open() );
	Node* myPtr = myFirst;
	for (unsigned i = 0; i < mySize-1; i++) {
		fout << myPtr->myItem << ' ';
		myPtr = myPtr->myNext;
	}
	fout << myPtr->myItem << '\n';
	fout.close();
}

/* Prepend an item
 * Parameter: it, Item
 * Postcondition: prepends an item on the list
 */
template<class Item>
void List<Item>::prepend(const Item& it) {
	Node * nodePtr = new Node(it, myFirst);
	if (mySize == 0) {
		myLast = nodePtr;
	}
	myFirst = nodePtr;
	mySize++;
}

/* Insert an item
 * Parameter: it, Item
 * 			  index, unsigned
 * Postcondition: inserts an item into the list at index
 */
template<class Item>
void List<Item>::insert(const Item& it, unsigned index) {
	if (mySize == 0) {
		append(it);
	} else if (index == 0) {
		prepend(it);
	} else if (index >= mySize) {
		append(it);
	} else {
		Node * nodePtr1 = new Node(it, NULL);
		Node * nodePtr2 = myFirst;
		for (unsigned i = 0; i < index; i++) {
			if (i == index -1) {
				nodePtr1->myNext = nodePtr2->myNext;
				nodePtr2->myNext = nodePtr1;
			}
		}
		mySize++;
	}
}

/* boolean equality
 * Parameter: l2, a List
 * Postcondition: true is returned, if and only if
 * 					mySize != l2.mySize
 * 					myPtr->myItem != l2Ptr->myItem)
 * 					my values are different than l2's values.
 */
template<class Item>
bool List<Item>::operator!=(const List<Item>& l2) {
	if (mySize == l2.mySize) {
		Node* myPtr = myFirst;
		Node* l2Ptr = l2.myFirst;
		for (unsigned i = 0; i < mySize; i++) {
			if ((myPtr->myItem) != (l2Ptr->myItem)) {return true;}
			myPtr = myPtr->myNext;
			l2Ptr = l2Ptr->myNext;
		}
		return false;
	}
	return true;
}

/* List output method
 * Parameter: out, an ostream, separator, a string
 * Postcondition: Items have been put in ostream
 */
template<class Item>
void List<Item>::writeTo(ostream& out, const string& separator) const {
	for (Node* myPtr = myFirst; myPtr; myPtr = myPtr -> myNext){
		out << myPtr->myItem;
		if (myPtr -> myNext)
			out << separator;
	}
}

/* List read method
 * Parameter: filename, a string
 * Precondition: file contains items for a List
 * Postcondition: Items have been read from file
 */
template<class Item>
void List<Item>::readFrom(const string& fileName) {
	if (mySize != 0) {
		delete myFirst;
		myFirst = myLast = NULL;
		mySize = 0;
	}

	ifstream fin(fileName.c_str());
	assert( fin.is_open() );

	Item value;

	while( fin >> value ) {
		append( value );
		if( fin.peek() == '\n' ) {
			break;
		}
	}
}

/* get index of item in list
 * Parameter: index, a unsigned
 * Postcondition: index of item is returned if item is not in list, returns -1
 */
template<class Item>
int List<Item>::getIndexOf(const Item& it) {
	Node* myPtr = myFirst;
	for( unsigned i = 0; i < mySize; i++) {
		if ( myPtr->myItem == it) {
			return i;
		}
		myPtr  = myPtr->myNext;
	}
	return -1;
}

/* remove index of item in list
 * Parameter: index, a double
 * Postcondition: remove an index of item in list, and return an item value
 */
template<class Item>
Item List<Item>::remove(double index) {
	Node* ptr = myFirst;
	Item value;
	if (mySize == 0) {
		return 0;
	}
	if (index <= 0) {
		value = myFirst->myItem;
		myFirst = myFirst->myNext;
		ptr->myNext = NULL;
		delete ptr;
		mySize--;
		return value;
	} else if (index >= mySize - 1) {
		Node* bptr = myFirst;
		for( unsigned i = 0; i < (mySize - 2); i++ ) {
			bptr = bptr->myNext;
		}
		ptr = myLast;
		value = ptr->myItem;
		bptr->myNext = NULL;
		myLast = bptr;
		delete ptr;
		mySize--;
		return value;
	} else {
		Node* bptr = myFirst;
		for( unsigned i = 0; i < (index - 1); i++ ) {
			bptr = bptr->myNext;
		}
		ptr = bptr->myNext;
		value = ptr->myItem;
		bptr->myNext = ptr->myNext;
		ptr->myNext = NULL;
		delete ptr;
		mySize--;
		return value;
	}
}
/* boolean insertAfter
 * Parameter: otherPersonsName and yourName, an Item
 * Postcondition: true is returned, if and only if
 * 					getIndexOf(otherPersonsName) != -1
 * 					otherPersonsName is in the List
 * 					And insert an Item yourName after otherPersonsName
 */
template<class Item>
bool List<Item>::insertAfter(const Item& otherPersonsName, const Item& yourName) {
	int index = getIndexOf(otherPersonsName);
	if (index == -1) {
		return false;
	} else {
		if (otherPersonsName == getLast()) {
			append(yourName);
		} else {
			Node * nodePtr1 = new Node(yourName, NULL);
			Node * nodePtr2 = myFirst;
			for (int i = 0; i < index; i++) {
				nodePtr2 = nodePtr2->myNext;
			}
			nodePtr1->myNext = nodePtr2->myNext;
			nodePtr2->myNext = nodePtr1;
			mySize++;
		}
		return true;
	}
}
/* boolean insertBefore
 * Parameter: otherPersonsName and yourName, an Item
 * Postcondition: true is returned, if and only if
 * 					getIndexOf(otherPersonsName) != -1
 * 					otherPersonsName is in the List
 * 					And insert an Item yourName before otherPersonsName
 */
template<class Item>
bool List<Item>::insertBefore(const Item& otherPersonsName, const Item& yourName) {
	int index = getIndexOf(otherPersonsName);
	if (index == -1) {
		return false;
	} else {
		if (index == 0) {
			prepend(yourName);
		} else {
			Node * nodePtr1 = new Node(yourName, NULL);
			Node * nodePtr2 = myFirst;
			for (int i = 0; i < index-1; i++) {
				nodePtr2 = nodePtr2->myNext;
			}
			nodePtr1->myNext = nodePtr2->myNext;
			nodePtr2->myNext = nodePtr1;
			mySize++;
		}
		return true;
	}
}
/* output operation
 * Parameter: out, ostream, aList, List
 * Postcondition: return a reference to its left operand
 * 				  with each pair of items separated by "=>" characters.
 */
template<class Item>
ostream& operator<<(ostream& out, const List<Item>& aList) {
	aList.writeTo(out, "=>");
	return out;
}
#endif /* LIST_H_ */
