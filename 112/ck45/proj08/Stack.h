/* Stack.h provides a (dynamic-array-based) Stack class.
 * Joel Adams, for CS 112 at Calvin College.
 * Student Name: Chan Kim (ck45)
 * Date: 03/28/2017
 * 
 * Invariant: mySize == 0 && isEmpty() && !isFull()
 *         || mySize == myCapacity && !isEmpty() && isFull()
 *         || mySize > 0 && mySize < myCapacity && !isEmpty() && !isFull().
 * Notes: 
 * 1. Member mySize always contains the index of the next empty space in myArray
 *        (the index of the array element into which the next pushed item will be placed).
 * 2. Sending push() to a full Stack throws the exception Stack::Overflow.
 * 3. Sending pop() or peekTop() to an empty Stack throws the exception Stack::Underflow.
 */

#ifndef STACK_H_
#define STACK_H_

#include "StackException.h"
#include <string>
#include <iostream>
using namespace std;

///typedef int Item;
template<class Item>

class Stack {
public:
	Stack(unsigned capacity);
	Stack(const Stack<Item>& original);
	~Stack();
	Stack<Item>& operator=(const Stack<Item>& original);
	bool isEmpty() const {return mySize == 0;}
	bool isFull() {return mySize >= myCapacity;}
	void push(const Item& it);
	Item peekTop() const ;
	Item pop();
	unsigned getSize() {return mySize;}
	unsigned getCapacity() {return myCapacity;}
	void setCapacity(unsigned newCapacity);
	

protected:
	void makeCopyOf(const Stack<Item>& original);
	
private:
	unsigned myCapacity;
	unsigned mySize;
	Item*    myArray;
	friend class StackTester;
};

/* explicit-value constructor
 * Parameter: capacity, an unsigned value.
 * Precondition: capacity > 0.
 * Postcondition: mySize == 0 && myCapacity == capacity
 *              && myArray contains the address of a dynamic array of 'capacity' entries.
 */
template<class Item>
Stack<Item>::Stack(unsigned capacity) {
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
template<class Item>
Stack<Item>::Stack(const Stack<Item>& original) {
	makeCopyOf(original);
}

/* utility method containing code refactored from
 *  the copy constructor and operator=.
 * Parameter: original, a Stack (const reference).
 * Precondition: original.myCapacity > 0.
 * Postcondition: I am a copy of original.
 */
template<class Item>
void Stack<Item>::makeCopyOf(const Stack<Item>& original) {
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
template<class Item>
Stack<Item>::~Stack() {
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
template<class Item>
Stack<Item>& Stack<Item>::operator=(const Stack<Item>& original) {
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
template<class Item>
void Stack<Item>::push(const Item& it) {
	if (this -> isFull()) {
		throw StackException("push()", "stack is full");
	}
	myArray[mySize++] = it;
}

/* peekTop
 * Postcondition: returns the top item from the Stack (without modifying the Stack)
 */
template<class Item>
Item Stack<Item>::peekTop() const {
	if ( isEmpty() ) {
		throw StackException("peekTop()", "stack is empty");
	}
	return myArray[mySize-1];
}
/* pop
 * Postcondition: removes and returns the top item from the Stack
 */
template<class Item>
Item Stack<Item>::pop(){
	if ( isEmpty() ) {
		throw StackException("peek()", "stack is empty");
	}
	return myArray[--mySize];
}
/* set capacity
 * Parameter: newCapacity, an unsigned.
 * Postcondition: set the capacity with new value
 */
template<class Item>
void Stack<Item>::setCapacity(unsigned newCapacity) {
	if (newCapacity < mySize) {
		throw StackException("setCapacity(newCapacity)", "Capacity must be bigger than size");
	}

	Item* newArray = new Item[newCapacity];

	for (unsigned i = 0; i < myCapacity; i++) {
		newArray[i] = myArray[i];
	}
	delete [] myArray;
	myCapacity = newCapacity;
	myArray = newArray;
}

#endif

