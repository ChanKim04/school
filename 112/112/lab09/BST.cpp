/* BST.cpp defines binary search tree methods.
 * Joel Adams, for CS 112 at Calvin College.
 * Student Name: Chan Kim (ck45)
 * Date: 4/18/2017
 */
 
#include "BST.h"

/* BST default constructor
 * Postcondition: myNumItems == 0
 * 					myRoot == NULL
 */
BST::BST() {
	myRoot = NULL;
	myNumItems = 0;
}

/* insert Item
 * Parameter: it, an Item.
 * Postcondition: insert it on the BST
 */
void BST::insert(const Item& it){
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
void BST::Node::insert(const Item& it) {
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
bool BST::contains(const Item& it){
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
bool BST::Node::contains(const Item& it){
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
BST::~BST() {
	delete myRoot;
	myRoot = NULL;
	myNumItems = 0;
}

/* Node constructor
 * Parameter: it, an Item
 * Postcondition: myItem == it
 * 					myLeft and myRight == NULL
 */
BST::Node::Node(const Item& it) {
   myItem = it;
   myLeft = NULL;
   myRight = NULL;
}

/* Node destructor
 * Postcondition: myLeft and Right have been deallocated.
 */
BST::Node::~Node() {
	delete myLeft;
	delete myRight;
}

/* boolean isEmpty
 * Postcondition: true is returned, if and only if
 * 					myNumItems == 0
 */
bool BST::isEmpty() const {
	return myNumItems == 0;
}

/* myNumItems
 * Postcondition: return the number of items
 */
unsigned BST::getNumItems() const {
	return myNumItems;
}

/* processItem
 * Postcondition: processing of a node's item
 */
void BST::Node::processItem() {
		cout << ' ' << myItem;
}

/* preorder traversal
 * Postcondition: "processes" the item in a node before
 * 					the items in the left and right
 * 					subtrees are (recursively) processed.
 */
void BST::traversePreorder() {
	if ( !isEmpty() ) {
		myRoot->traversePreorder();
	}
}

/* Node preorder traversal
 * Postcondition: "processes" the item in a node before
 * 					the items in the left and right
 * 					subtrees are (recursively) processed.
 */
void BST::Node::traversePreorder() {
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
void BST::traversePostorder() {
	if (!isEmpty() ) {
		myRoot->traversePostorder();
	}
}

/* Node postorder traversal
 * Postcondition: "processes" the item in a node after
 * 					the items in the left and right
 * 					subtrees are (recursively) processed.
 */
void BST::Node::traversePostorder() {
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
void BST::traverseInorder() {
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
void BST::Node::traverseInorder(){
	if (myLeft != NULL) {
		myLeft->traverseInorder();
	}
	processItem();
	if (myRight != NULL) {
		myRight->traverseInorder();
	}
}
