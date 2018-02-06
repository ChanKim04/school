/* BST.h declares a "classic" binary search tree of linked nodes.
 * Joel Adams, for CS 112 at Calvin College.
 * Student Name: Chan Kim (ck45)
 * Date: 4/18/2017
 * 
 * Class Invariant:
 *   myNumItems == 0 && myRoot == NULL ||
 *   myNumItems > 0 && 
 *     myRoot stores the address of a Node containing an item &&
 *       all items in myRoot->myLeft are less than myRoot->myItem &&
 *       all items in myRoot->myRight are greater than myRoot->myItem.
 */

#ifndef BST_H_
#define BST_H_

#include "Exception.h"
#include <iostream>
using namespace std;

//typedef int Item;
template<class Item>

class BST {
public:
	BST();
	void insert(const Item& it);
	bool contains(const Item& it);
	virtual ~BST();
	bool isEmpty() const;
	unsigned getNumItems() const;
	unsigned getHeight() const;
	void traverseInorder();
	void traversePreorder();
	void traversePostorder();

private:
	struct Node {
	    Node(const Item& it);
	    void insert(const Item& it);
	    bool contains(const Item& it);
	    unsigned getHeight() const;
            virtual ~Node();

            void traverseInorder();
            void traversePreorder();
            void traversePostorder();
            virtual void processItem();
		
            Item myItem;
            Node* myLeft;
            Node* myRight;
	};
	
	Node* myRoot;
	unsigned myNumItems;
	friend class BST_Tester;
};

/* BST default constructor
 * Postcondition: myNumItems == 0
 * 					myRoot == NULL
 */
template<class Item>
BST<Item>::BST() {
	myRoot = NULL;
	myNumItems = 0;
}

/* insert Item
 * Parameter: it, an Item.
 * Postcondition: insert it on the BST
 */
template<class Item>
void BST<Item>::insert(const Item& it){
	if ( isEmpty() ) {
		myRoot = new Node(it);
		myNumItems++;
	} else {
		myRoot -> insert(it);
		myNumItems++;
	}
}

/* Node insert Item
 * Parameter: it, an Item.
 * Postcondition: insert it on the BST
 */
template<class Item>
void BST<Item>::Node::insert(const Item& it) {
	if (it > myItem){
		if( myRight == NULL) {
			myRight = new Node(it);
		} else {
			myRight -> insert(it);
		}
	} else if (it < myItem) {
		if ( myLeft == NULL) {
			myLeft = new Node(it);
		} else {
			myLeft-> insert(it);
		}
	} else {
		throw Exception("insert(it)","Invalid insertion");
	}
}

/* boolean contains
 * Postcondition: true is returned, if and only if
 * 					it is in its BST
 */
template<class Item>
bool BST<Item>::contains(const Item& it){
	if (isEmpty()){
		return false;
	} else {
		myRoot -> contains(it);
	}
}

/* Node boolean contains
 * Postcondition: true is returned, if and only if
 * 					it is in its BST
 */
template<class Item>
bool BST<Item>::Node::contains(const Item& it){
	if (it > myItem){
		if( myRight == NULL){
			return false;
		} else{
			myRight -> contains(it);
		}
	} else if (it < myItem){
		if( myLeft == NULL){
			return false;
		} else{
			myLeft -> contains(it);
		}
	} else {
		return true;
	}
}

/* destructor
 * Postcondition: myRoot == NULL && myNumItems == 0
 *             && myRoot has been deallocated.
 */
template<class Item>
BST<Item>::~BST() {
	delete myRoot;
	myRoot = NULL;
	myNumItems = 0;
}

/* Node constructor
 * Parameter: it, an Item
 * Postcondition: myItem == it
 * 					myLeft and myRight == NULL
 */
template<class Item>
BST<Item>::Node::Node(const Item& it) {
   myItem = it;
   myLeft = NULL;
   myRight = NULL;
}

/* Node destructor
 * Postcondition: myLeft and Right have been deallocated.
 */
template<class Item>
BST<Item>::Node::~Node() {
	delete myLeft;
	delete myRight;
}

/* boolean isEmpty
 * Postcondition: true is returned, if and only if
 * 					myNumItems == 0
 */
template<class Item>
bool BST<Item>::isEmpty() const {
	return myNumItems == 0;
}

/* myNumItems
 * Postcondition: return the number of items
 */
template<class Item>
unsigned BST<Item>::getNumItems() const {
	return myNumItems;
}

/* processItem
 * Postcondition: processing of a node's item
 */
template<class Item>
void BST<Item>::Node::processItem() {
		cout << ' ' << myItem;
}

/* preorder traversal
 * Postcondition: "processes" the item in a node before
 * 					the items in the left and right
 * 					subtrees are (recursively) processed.
 */
template<class Item>
void BST<Item>::traversePreorder() {
	if ( !isEmpty() ) {
		myRoot->traversePreorder();
	}
}

/* Node preorder traversal
 * Postcondition: "processes" the item in a node before
 * 					the items in the left and right
 * 					subtrees are (recursively) processed.
 */
template<class Item>
void BST<Item>::Node::traversePreorder() {
	processItem();
	if (myLeft != NULL) {
		myLeft->traversePreorder();
	}
	if (myRight != NULL) {
		myRight->traversePreorder();
	}
}

/* postorder traversal
 * Postcondition: "processes" the item in a node after
 * 					the items in the left and right
 * 					subtrees are (recursively) processed.
 */
template<class Item>
void BST<Item>::traversePostorder() {
	if (!isEmpty() ) {
		myRoot->traversePostorder();
	}
}

/* Node postorder traversal
 * Postcondition: "processes" the item in a node after
 * 					the items in the left and right
 * 					subtrees are (recursively) processed.
 */
template<class Item>
void BST<Item>::Node::traversePostorder() {
	if (myLeft != NULL) {
		myLeft->traversePostorder();
	}
	if (myRight != NULL) {
		myRight->traversePostorder();
	}
	processItem();
}

/* inorder traversal
 * Postcondition: "processes" the item in a node after
 * 					the items in the left subtrees
 * 					have been processed, but before
 * 					the items in the right subtree
 * 					have been (recursively) processed.
 */
template<class Item>
void BST<Item>::traverseInorder() {
	if (!isEmpty() ) {
		myRoot->traverseInorder();
	}
}

/* Node inorder traversal
 * Postcondition: "processes" the item in a node after
 * 					the items in the left subtrees
 * 					have been processed, but before
 * 					the items in the right subtree
 * 					have been (recursively) processed.
 */
template<class Item>
void BST<Item>::Node::traverseInorder(){
	if (myLeft != NULL) {
		myLeft->traverseInorder();
	}
	processItem();
	if (myRight != NULL) {
		myRight->traverseInorder();
	}
}

/* Get the height of the binary tree
 * Postcondition: return the height of the binary tree.
 */
template<class Item>
unsigned BST<Item>::getHeight() const{
	if (myRoot == NULL){
		return 0;
	} else {
		return myRoot -> getHeight();
	}
}

/* Node Get the height of the binary tree
 * Postcondition: return the height of the binary tree.
 */
template<class Item>
unsigned BST<Item>::Node::getHeight() const{
	unsigned Lcount = 0;
	unsigned Rcount = 0;
	if (myLeft != NULL) {
		Lcount = myLeft->getHeight();
	}
	if (myRight != NULL) {
		Rcount = myRight->getHeight();
	}
	return (max(Lcount,Rcount)+1);
}

#endif /*BST_H_*/

