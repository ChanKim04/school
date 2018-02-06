/*
 * List.h
 *
 *  Created on: 2017. 3. 7.
 *      Author: Chan Kim
 */

#ifndef LIST_H_
#define LIST_H_
#include <iostream>
#include <stdexcept>

typedef double Item;
using namespace std;

class List {
public:
	List();
	unsigned getSize() const{return mySize;};
	Item getFirst() const;
	Item getLast() const;
	void append(const Item& it);
	virtual ~List();
	List(const List& original);
	List& operator=(const List& original);
private:
	struct Node {
		Node();
		Node(const Item& item, Node* next);
		~Node();
		Item myItem;
		Node* myNext;
	};
	unsigned mySize;
	Node* myFirst;
	Node* myLast;
	friend class ListTester;
};


#endif /* LIST_H_ */
