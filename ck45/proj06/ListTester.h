/* ListTester.h declares the test-class for class List.
 * Joel Adams, for CS 112 at Calvin College.
 */

#ifndef LISTTESTER_H_
#define LISTTESTER_H_

class ListTester {
public:
	void runTests();
	void testDefaultConstructor();
	void testNodeDefaultConstructor();
	void testNodeExplicitConstructor();
	void testAppend();
	void testDestructor();
	void testCopyConstructor();
	void testAssignment();
	void testEquality();
	void testReadFromStream();
	void testWriteToString();
	void testPrepend();
	void testInsertion();
	void testInequality();
	void testWriteToStream();
	void testReadFromString();
	void testGetIndexOf();
	void testRemove();
	void testInsertAfter();
	void testInsertBefore();
	void testOutputOperator();
};

#endif /*LISTTESTER_H_*/
