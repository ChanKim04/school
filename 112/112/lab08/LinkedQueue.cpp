/* LinkedQueue.cpp defines the methods for class LinkedQueue.
 * Joel Adams, for CS 112 at Calvin College.
 * Student name: Chan Kim(ck45)
 * Date: 4/11/2017
 */

#include "LinkedQueue.h"

/* LinkedQueue default constructor
 * Postcondition: mySize == 0
 * 					myFirst and myLast == NULL
 */
LinkedQueue::LinkedQueue() {
	mySize = 0;
	myFirst = myLast = NULL;
}

/* append Item
 * Parameter: it, an Item.
 * Postcondition: append it on the Queue
 */
void LinkedQueue::append(const Item& it) {
	if ( isFull() ){
		throw FullQueueException("append()");
	}
	 Node* nPtr= new Node(it,NULL);
	 if ( isEmpty() ){
		 myFirst = nPtr;
	 } else {
		 myLast->myNext = nPtr;
	 }
	 myLast = nPtr;
	 mySize++;
}

/* remove
 * Postcondition: removes and returns the top item from the Queue
 */
Item LinkedQueue::remove() {
	if ( isEmpty() ) {
		throw EmptyQueueException("getFirst()");
	}
	Item result = myFirst->myItem;
	Node* nPtr = myFirst;
	myFirst = myFirst->myNext;
	nPtr->myNext = NULL;
	delete nPtr;
	mySize--;
	return result;
}

/* Get first
 * Postcondition: return the first item
 */
Item LinkedQueue::getFirst() const {
	if ( isEmpty() ){
		throw EmptyQueueException("getFirst()");
	}
	return myFirst->myItem;
}

/* Get last
 * Postcondition: return the last item
 */
Item LinkedQueue::getLast() const {
	if ( isEmpty() ){
		throw EmptyQueueException("getLast()");
	}
	return myLast -> myItem;
}

/* copy constructor
 * Parameter: original, a Queue (const reference).
 * Postcondition: I am a copy of original.
 */
LinkedQueue::LinkedQueue(const LinkedQueue& original) {
	makeCopyOf(original);
}

/* utility method containing code refactored from
 *  the copy constructor and operator=.
 * Parameter: original, a Queue (const reference).
 * Postcondition: I am a copy of original.
 */
void LinkedQueue::makeCopyOf(const LinkedQueue& original) {
	mySize = original.mySize;
	if ( mySize == 0 ) {
		myFirst = myLast = NULL;
	} else {
		myFirst = new Node(original.getFirst(), NULL);
		Node * temp0 = original.myFirst->myNext;
		Node * temp1 = myFirst;
		while (temp0 != NULL) {
			temp1->myNext = new Node(temp0->myItem, NULL);
			temp1 = temp1->myNext;
			temp0 = temp0->myNext;
		}
		myLast = temp1;
	}
}

/* destructor
 * Postcondition: myFirst == NULL && myLast == NULL && mySize == 0
 *             && myFirst has been deallocated.
 */
LinkedQueue::~LinkedQueue() {
	delete myFirst;
	myFirst = myLast = NULL;
	mySize = 0;
}

/* assignment operator
 * Parameter: aQueue, a Queue (const reference).
 * Postcondition: I am a copy of original
 *              && I have been returned.
 */
LinkedQueue& LinkedQueue::operator=(const LinkedQueue& aQueue) {
	if (this != &aQueue) {
		delete myFirst;    // invokes recursive ~Node()
		makeCopyOf(aQueue);
	}
	return *this;
}
