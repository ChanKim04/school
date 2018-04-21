/* Stack.cpp defines the dynamically allocated (array-based ) Stack operations.
 * Joel Adams, for CS 112 at Calvin College.
 * Student Name: Chan Kim (ck45)
 * Date: 03/28/2017
 */

#include "Stack.h"

/* explicit-value constructor
 * Parameter: capacity, an unsigned value.
 * Precondition: capacity > 0.
 * Postcondition: mySize == 0 && myCapacity == capacity
 *              && myArray contains the address of a dynamic array of 'capacity' entries.
 */
Stack::Stack(unsigned capacity) {
   if (capacity <= 0) {
   		   throw StackException("Stack(size)", "size must be positive!");
   }
   mySize = 0;
   myCapacity = capacity;
   myArray = new Item[capacity];
}

/* copy constructor
 * Parameter: original, a Stack (const reference).
 * Postcondition: I am a copy of original.
 */
Stack::Stack(const Stack& original) {
	makeCopyOf(original);
}

/* utility method containing code refactored from
 *  the copy constructor and operator=.
 * Parameter: original, a Stack (const reference).
 * Precondition: original.myCapacity > 0.
 * Postcondition: I am a copy of original.
 */
void Stack::makeCopyOf(const Stack& original) {
	myCapacity = original.myCapacity;
	myArray = new Item[myCapacity];

	for (unsigned i = 0; i < myCapacity; i++) {
		myArray[i] = original.myArray[i];
	}
	mySize = original.mySize;
}

/* destructor
 * Postcondition: myCapacity == 0 && mySize == 0
 *             && myArray has been deallocated.
 */
Stack::~Stack() {
	delete [] myArray;
	myArray = NULL;
	myCapacity = 0;
	mySize = 0;
}

/* assignment operator
 * Parameter: original, a Stack (const reference).
 * Postcondition: I am a copy of original
 *              && I have been returned.
 */
Stack& Stack::operator=(const Stack& original) {
	if (this != &original) {
		delete [] myArray;
		makeCopyOf(original);
	}
	return *this;
}
/* push Item
 * Parameter: it, an Item.
 * Postcondition: places it on top of the Stack
 */
void Stack::push(const Item& it) {
	myArray[mySize++] = it;
	if (mySize > myCapacity) {
		throw StackException("push()", "stack is full");
	}
}

/* peekTop
 * Postcondition: returns the top item from the Stack (without modifying the Stack)
 */
Item Stack::peekTop() const {
	if ( isEmpty() ) {
		throw StackException("peekTop()", "stack is empty");
	}
	return myArray[mySize-1];
}
/* pop
 * Postcondition: removes and returns the top item from the Stack
 */
Item Stack::pop(){
	if ( isEmpty() ) {
		throw StackException("peek()", "stack is empty");
	}
	return myArray[--mySize];
}
