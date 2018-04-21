Script started on 2018-04-03 03:08:23-0400
]0;chan@chan:~/Sources/school/214/labs/07[chan@chan 07]$ make java
make: Nothing to be done for 'java'.
]0;chan@chan:~/Sources/school/214/labs/07[chan@chan 07]$ cat nameT[K[K[K[K[KNameTester.java 
/* NameTester.java is a 'driver' to test class Name.
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Student: Chan Kim (ck45)
 * Date: 3/29/2018
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

// Replace this line with the declaration of class Name...
class Name
{
  private String myFirst, myMiddle, myLast;

  public Name(String first, String middle,String last)
  {
    myFirst = first;
    myMiddle = middle;
    myLast = last;
  };

  public String getFirst()
  {
    return myFirst;
  };

  public String getMiddle()
  {
    return myMiddle;
  };

  public String getLast()
  {
    return myLast;
  };  

  public String toString()
  {
    return myFirst + ' ' + myMiddle + ' ' + myLast;
  };

  public void print()
  {
    System.out.println( toString() );
  };
};



]0;chan@chan:~/Sources/school/214/labs/07[chan@chan 07]$ java NameTester 
John Paul Jones
All tests passed!
]0;chan@chan:~/Sources/school/214/labs/07[chan@chan 07]$ exit
exit

Script done on 2018-04-03 03:08:45-0400
