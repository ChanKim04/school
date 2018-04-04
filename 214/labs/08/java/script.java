Script started on 2018-04-03 22:03:31-0400
]0;chan@chan:~/Sources/school/214/labs/08/java[chan@chan java]$ ls
Makefile  Name.class  Name.java  NameTester.class  [0m[01;32mNameTester.java[0m  script.java
]0;chan@chan:~/Sources/school/214/labs/08/java[chan@chan java]$ javac -deprecation NameTester.java 
]0;chan@chan:~/Sources/school/214/labs/08/java[chan@chan java]$ ls
Makefile  Name.class  Name.java  NameTester.class  [0m[01;32mNameTester.java[0m  script.java
]0;chan@chan:~/Sources/school/214/labs/08/java[chan@chan java]$ java N[K[K[K[K[K[Kcat Name.java 
/* Name.java implements class Name.
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Student: Chan Kim (ck45)
 * Date: 4/4/2018
 ************************************************************/

// the Name class appears outside of the rest of the program
class Name {

  // Name object constructor with initialization  
  public Name(final String first, final String middle, final String last) {
      myFirst = first;
      myMiddle = middle;
      myLast = last;
  }
 
  // extractor for first name of a Name object
  public final String getFirst() {
      return myFirst;
  }

  // extractor for middle name of a Name object
  public final String getMiddle() {
      return myMiddle;
  }

  // extractor for last name of a Name object
  public final String getLast() {
      return myLast;
  }
  
  // return string created by piecing together first, middle, and last names
  public final String toString() {
      return myFirst + ' ' + myMiddle + ' ' + myLast;
  }

  private String myFirst, myMiddle, myLast;  // private instance variables
}

]0;chan@chan:~/Sources/school/214/labs/08/java[chan@chan java]$ cat NameTester.java 
/* NameTester.java is a 'driver' to test class Name.
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Student: Chan Kim (ck45)
 * Date: 4/4/2018
 ************************************************************/

public class NameTester  
{
  public static void main(String[] args)
  {
      Name aName = new Name("John", "Paul", "Jones");

      assert aName.getFirst().equals("John") ;
      assert aName.getMiddle().equals("Paul") ;
      assert aName.getLast().equals("Jones") ;

      System.out.println(aName);
      assert aName.toString().equals("John Paul Jones");

      System.out.println("All tests passed!");
  }
}

]0;chan@chan:~/Sources/school/214/labs/08/java[chan@chan java]$ java NameTester 
John Paul Jones
All tests passed!
]0;chan@chan:~/Sources/school/214/labs/08/java[chan@chan java]$ exit
exit

Script done on 2018-04-03 22:04:16-0400
