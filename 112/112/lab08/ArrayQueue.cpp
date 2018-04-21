/* ArrayQueue.cpp defines the methods for class ArrayQueue.
 * Joel Adams, for CS 112 at Calvin College.
 * Student name: Chan Kim(ck45)
 * Date: 4/11/2017
 */

#include "ArrayQueue.h"
#include <cstring>      // memcpy()
using namespace std;

/* explicit-value constructor
 * Parameter: capacity, an unsigned value.
 * Precondition: capacity > 0.
 * Postcondition: mySize == 0 && myCapacity == capacity
 * 				&& myFirst == 0 && myLast == myCapacity-1
 *              && myArray contains the address of a dynamic array of 'capacity' entries.
 */
ArrayQueue::ArrayQueue(unsigned capacity) {
	if (capacity <= 0) {
		throw QueueException("ArrayQueue(size)", "size must be positive!");
	}
	myCapacity = capacity;
	myFirst = mySize = 0;
	myLast = myCapacity-1;
	myArray = new Item[myCapacity];
}

/* append Item
 * Parameter: it, an Item.
 * Postcondition: append it on the Queue
 */
void ArrayQueue::append(const Item& it) {
	if ( isFull()) {
		throw FullQueueException("append()");
	}
	myLast = (myLast+1) % myCapacity;
	myArray[myLast] = it;
	mySize++;
}

/* Get first
 * Postcondition: return the first item
 */
Item ArrayQueue::getFirst() const {
	if ( isEmpty() ) {
		throw EmptyQueueException("getFirst()");
	}
	return myArray[myFirst];
}

/* Get last
 * Postcondition: return the last item
 */
Item ArrayQueue::getLast() const {
	if ( isEmpty() ) {
		throw EmptyQueueException("getLast()");
	}
	return myArray[myLast];
}

/* remove
 * Postcondition: removes and returns the top item from the Queue
 */
Item ArrayQueue::remove() {
	if ( isEmpty() ) {
		throw EmptyQueueException("getFirst()");
	}
	unsigned result = myArray[myFirst];
	myFirst = (myFirst+myCapacity+1)%myCapacity;
	mySize--;
	return result;
}

/* copy constructor
 * Parameter: original, a Queue (const reference).
 * Postcondition: I am a copy of original.
 */
ArrayQueue::ArrayQueue(const ArrayQueue& original) {
	makeCopyOf(original);
}

/* utility method containing code refactored from
 *  the copy constructor and operator=.
 * Parameter: original, a Queue (const reference).
 * Postcondition: I am a copy of original.
 */
void ArrayQueue::makeCopyOf(const ArrayQueue& original) {
	mySize = original.mySize;
	myCapacity = original.myCapacity;
	myFirst = original.myFirst;
	myLast = original.myLast;
	myArray = new Item[myCapacity];
	memcpy(myArray, original.myArray, myCapacity*sizeof(Item) );
}

/* destructor
 * Postcondition: myFirst == 0 && myLast == 0 && mySize == 0
 *             && myArray has been deallocated.
 */
ArrayQueue::~ArrayQueue() {
	delete [] myArray;
	myArray = NULL;
	mySize = myFirst = myLast = 0;
}

/* assignment operator
 * Parameter: aQueue, a Queue (const reference).
 * Postcondition: I am a copy of original
 *              && I have been returned.
 */
ArrayQueue& ArrayQueue::operator=(const ArrayQueue& aQueue) {
	if (this != &aQueue) {
		delete [] myArray;
		makeCopyOf(aQueue);
	}
	return *this;
}

/* boolean isEmpty
 * Postcondition: true is returned, if and only if
 * 					mySize == 0
 */
bool ArrayQueue::isEmpty() const {
	return mySize == 0;
}

/* boolean isFull
 * Postcondition: true is returned, if and only if
 * 					mySize == myCapacity
 */
bool ArrayQueue::isFull() const {
	return getSize() == myCapacity;
}

/* Get capacity
 * Postcondition: return the capacity
 */
unsigned ArrayQueue::getCapacity() const {
	return myCapacity;
}

/* Get size
 * Postcondition: return the size
 */
unsigned ArrayQueue::getSize() const {
	return mySize;
}

