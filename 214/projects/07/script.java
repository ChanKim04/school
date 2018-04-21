Script started on 2018-04-03 04:25:01-0400
]0;chan@chan:~/Sources/school/214/projects/07[chan@chan 07]$ make ajva[K[K[K[Kjava
javac -deprecation NameTester.java
]0;chan@chan:~/Sources/school/214/projects/07[chan@chan 07]$ java NameTester 
John Paul Jones
Dwight David Eisenhower
Eisenhower, Dwight D.
Enter the first name...
first
Enter the middle name...
middle
Enter the last name...
last
first middle last
All tests passed!
]0;chan@chan:~/Sources/school/214/projects/07[chan@chan 07]$ cat NameTester.java
/* NameTester.java is a 'driver' to test class Name.
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Student: Chan Kim (ck45)
 * Date: 4/3/2018
 ************************************************************/
import java.io.*;
import java.util.Scanner;

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
      // test for the result of project 7
      Scanner keyboard = new Scanner(System.in);
      aName.setFirst("Dwight");
      assert aName.getFirst().equals("Dwight");
      aName.setMiddle("David");
      assert aName.getMiddle().equals("David");    
      aName.setLast("Eisenhower");
      assert aName.getLast().equals("Eisenhower");
      assert aName.lfmi().equals("Eisenhower" + ", " + "Dwight" + " " + "David".charAt(0) + ".");
      System.out.println(aName);
      System.out.println(aName.lfmi());
      //  type "first" as the first name, "middle" as the middle name, and "last" as the last name for the test.
      aName.read(keyboard);
      assert aName.getFirst().equals("first") ;
      assert aName.getMiddle().equals("middle") ;
      assert aName.getLast().equals("last") ;

      System.out.println(aName);
      assert aName.toString().equals("first middle last");    

      System.out.println("All tests passed!");
  }
}

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

  /*
 setFirst sets the first name of a name object.;
 Receive: aFirst, a String.                       
 Return: the new first name.   
  */  
  public void setFirst(String aFirst)
  {
    myFirst = aFirst;
  };

  /*
 setMiddle sets the middle name of a name object.;
 Receive: aMiddle, a String.                       
 Return: the new middle name.   
  */  
   public void setMiddle(String aMiddle)
  {
    myMiddle = aMiddle;
  };

  /*
 setLast sets the last name of a name object.;
 Receive: aLast, a String.                       
 Return: the new last name.   
  */  
  public void setLast(String aLast)
  {
    myLast = aLast;
  };

  /*
 lfmi returns a full name in L-F-M(the first letter) order. 
 Return: myLast, myFirst, myMiddle[0].    
  */
  public String lfmi()
  {
    return myLast + ", " + myFirst + " " + myMiddle.charAt(0) + ".";
  };

  /*
 readName constructs(or reconstructs)            
          a name from user inputs.               
 Receive: first, middle and last, three strings. 
 Return: the triplet (first middle last).          
  */
  public void read(Scanner keyboard)
  {
      System.out.println("Enter the first name...");
      myFirst = keyboard.nextLine();
      System.out.println("Enter the middle name...");      
      myMiddle = keyboard.nextLine();
      System.out.println("Enter the last name...");      
      myLast = keyboard.nextLine();    
  }

};]0;chan@chan:~/Sources/school/214/projects/07[chan@chan 07]$ exit
exit

Script done on 2018-04-03 04:25:40-0400
