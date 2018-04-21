/* ArrayQueue.h declares a Queue class using a dynamic array.
 * Begun by: Joel Adams, for CS 112 at Calvin College.
 * Student name: Chan Kim(ck45)
 * Date: 4/11/2017
 * 
 * Class Invariant: 
 *    mySize == 0 ||
 *    mySize > 0 && myArray[myFirst] == getFirst()
 *               && myArray[myLast-1] == getLast().
 * 
 *  (When I am not empty:
 *     myFirst is the index of my oldest value;
 *     myLast is the index of the spot where the next
 *       item to be appended will be placed.)      
 */

#ifndef ARRAY_QUEUE_H_
#define ARRAY_QUEUE_H_

#include "QueueException.h"
#include <cstring>      // memcpy()
using namespace std;

template<class Item>
class ArrayQueue {
public:
	ArrayQueue(unsigned capacity);
	ArrayQueue(const ArrayQueue<Item>& original);
	virtual ~ArrayQueue();
	ArrayQueue<Item>& operator=(const ArrayQueue<Item>& original);
	unsigned getSize() const;
	unsigned getCapacity() const;
	bool isEmpty() const;
	bool isFull() const;
	void append(const Item& it);
	Item getFirst() const;
	Item getLast() const;
	Item remove();
	void setCapacity(unsigned newCapacity);

protected:
	virtual void makeCopyOf(const ArrayQueue<Item>& original);
private:
	unsigned mySize;       // number of items I contain
	unsigned myCapacity;   // how many items I can store
	unsigned myFirst;      // index of oldest item (if any)
	unsigned myLast;       // index of next available spot for append (if any)
	Item*    myArray;      // dynamic array of items

	friend class ArrayQueueTester;
};

/* explicit-value constructor
 * Parameter: capacity, an unsigned value.
 * Precondition: capacity > 0.
 * Postcondition: mySize == 0 && myCapacity == capacity
 * 				&& myFirst == 0 && myLast == myCapacity-1
 *              && myArray contains the address of a dynamic array of 'capacity' entries.
 */
template<class Item>
ArrayQueue<Item>::ArrayQueue(unsigned capacity) {
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
template<class Item>
void ArrayQueue<Item>::append(const Item& it) {
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
template<class Item>
Item ArrayQueue<Item>::getFirst() const {
	if ( isEmpty() ) {
		throw EmptyQueueException("getFirst()");
	}
	return myArray[myFirst];
}

/* Get last
 * Postcondition: return the last item
 */
template<class Item>
Item ArrayQueue<Item>::getLast() const {
	if ( isEmpty() ) {
		throw EmptyQueueException("getLast()");
	}
	return myArray[myLast];
}

/* remove
 * Postcondition: removes and returns the top item from the Queue
 */
template<class Item>
Item ArrayQueue<Item>::remove() {
	if ( isEmpty() ) {
		throw EmptyQueueException("remove()");
	}
	unsigned result = myArray[myFirst];
	myFirst = (myFirst+1)%myCapacity;
	mySize--;
	return result;
}

/* copy constructor
 * Parameter: original, a Queue (const reference).
 * Postcondition: I am a copy of original.
 */
template<class Item>
ArrayQueue<Item>::ArrayQueue(const ArrayQueue<Item>& original) {
	makeCopyOf(original);
}

/* utility method containing code refactored from
 *  the copy constructor and operator=.
 * Parameter: original, a Queue (const reference).
 * Postcondition: I am a copy of original.
 */
template<class Item>
void ArrayQueue<Item>::makeCopyOf(const ArrayQueue<Item>& original) {
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
template<class Item>
ArrayQueue<Item>::~ArrayQueue() {
	delete [] myArray;
	myArray = NULL;
	mySize = myFirst = myLast = 0;
}

/* assignment operator
 * Parameter: aQueue, a Queue (const reference).
 * Postcondition: I am a copy of original
 *              && I have been returned.
 */
template<class Item>
ArrayQueue<Item>& ArrayQueue<Item>::operator=(const ArrayQueue<Item>& aQueue) {
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
template<class Item>
bool ArrayQueue<Item>::isEmpty() const {
	return mySize == 0;
}

/* boolean isFull
 * Postcondition: true is returned, if and only if
 * 					mySize == myCapacity
 */
template<class Item>
bool ArrayQueue<Item>::isFull() const {
	return getSize() == myCapacity;
}

/* Get capacity
 * Postcondition: return the capacity
 */
template<class Item>
unsigned ArrayQueue<Item>::getCapacity() const {
	return myCapacity;
}

/* Get size
 * Postcondition: return the size
 */
template<class Item>
unsigned ArrayQueue<Item>::getSize() const {
	return mySize;
}

/* set capacity
 * Parameter: newCapacity, an unsigned.
 * Postcondition: set the capacity with new value
 */
template<class Item>
void ArrayQueue<Item>::setCapacity(unsigned newCapacity) {
	if (newCapacity == 0 || newCapacity < getSize() ) {
		throw QueueException("setCapacity(newCapacity", "Invalid newCapacity");
	}
	unsigned j = myFirst;
	Item* newArray = new Item[newCapacity];
	for (unsigned i = 0; i < getSize(); i++ ){
		newArray[i] = myArray[j % myCapacity];
		j++;
	}
	myFirst = 0;
	myLast = mySize-1;
	delete [] myArray;
	myCapacity = newCapacity;
	myArray = newArray;
}

#endif /*ARRAY_QUEUE_H_*/
