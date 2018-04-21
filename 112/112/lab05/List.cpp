/*
 * List.cpp
 *
 *  Created on: 2017. 3. 7.
 *      Author: Chan Kim
 */

#include "List.h"

/* List default constructor
 * Postcondition: mySize == 0
 * 					myFirst and myLast == NULL
 */
List::List() {
	mySize = 0;
	myFirst = myLast = NULL;
}
/* Node default constructor
 * Postcondition: myItem == Item()
 * 					myNext == NULL
 */
List::Node::Node() {
	myItem = Item();
	myNext = NULL;
}
/* Explicit constructor
 * Parameter: item, Item
 * 			  next, Node
 * Postcondition: myItem == item
 * 				  myNext == next
 */
List::Node::Node(const Item& item, Node* next) {
	myItem = item;
	myNext = next;
}
/* Get first
 * Postcondition: return the first item
 */
Item List::getFirst() const {
	if (mySize < 0 || myFirst == NULL){
		throw underflow_error("invalid list");
	} else {
		return myFirst -> myItem;
	}
}
/* Get last
 * Postcondition: return the last item
 */
Item List::getLast() const {
	if (mySize < 0 || myLast == NULL){
		throw underflow_error("invalid list");
	} else {
		return myLast -> myItem;
	}
}
/* Append item
 * Parameter: it, Item
 * Postcondition: append an item on the list
 */
void List::append(const Item& it){
	Node * nodePtr = new Node(it,NULL);
	if (mySize == 0){
		myFirst = nodePtr;
	} else {
		myLast -> myNext = nodePtr;
	}
	myLast = nodePtr;
	mySize ++;
}

List::~List() {
	delete myFirst;          // delete first node, invoking ~Node() (does nothing if myFirst == NULL)
	myFirst = myLast = NULL; // clear myFirst and myLast (optional)
	mySize = 0;
}
List::Node::~Node() {
	cout << "~Node() is deallocating the node containing item "
	     << myItem << endl;
	delete myNext;       // delete the next node, invoking ~Node() in it
                         // (does nothing if myNext == NULL)
}

List::List(const List& original) {
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
List& List::operator=(const List& original){
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

