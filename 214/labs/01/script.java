Script started on 2018-01-30 15:45:39-0500
]0;chan@chan:~/Sources/school/214/labs/01/Java[chan@chan Java]$ cat circle[K[K[K[K[K[KCircleArea.java
/* CircleArea.java computes the area of a circle.
 *
 * Input: The radius of the circle.
 * Precondition: The radius is a positive number.
 * Output: The area of the circle.
 *
 * Begun by: Dr. Adams, for CS 214, at Calvin College.
 * Completed by: Chan Kim (ck45)
 * Date: 1/31/2018
 **********************************************************/


import java.util.Scanner;  // include class for Scanner

public class CircleArea {

     /* function circleArea() computes a circle's area, given its radius.
      * Parameter: r, a double
      * Precondition: r is not negative.
      * Returns: the area of the circle
      */
     public static double circleArea(double r) {
        return Math.PI * r * r;               // return an expression
     } // circleArea method
	
  // main program
  public static void main(String[] args) {
      // prompt for radius
      System.out.println("To compute the area of a circle,");
      System.out.print(" enter its radius: ");
     
      // Create a connection named keyboard to standard in
      Scanner keyboard = new Scanner(System.in); 
  
      //Get the number from the user
      double radius = keyboard.nextDouble();
      
      // output area
      System.out.println("The area is " + circleArea(radius)); 
  } // main method
} // class CircleArea
]0;chan@chan:~/Sources/school/214/labs/01/Java[chan@chan Java]$ javac -deprecation CircleArea.java 
]0;chan@chan:~/Sources/school/214/labs/01/Java[chan@chan Java]$ java ci[K[KCircleArea 
To compute the area of a circle,
 enter its radius: 1
The area is 3.141592653589793
]0;chan@chan:~/Sources/school/214/labs/01/Java[chan@chan Java]$ java CircleArea 
To compute the area of a circle,
 enter its radius: 2
The area is 12.566370614359172
]0;chan@chan:~/Sources/school/214/labs/01/Java[chan@chan Java]$ java CircleArea 
To compute the area of a circle,
 enter its radius: 2.5
The area is 19.634954084936208
]0;chan@chan:~/Sources/school/214/labs/01/Java[chan@chan Java]$ java CircleArea 
To compute the area of a circle,
 enter its radius: 4.99999
The area is 78.53950218079365
]0;chan@chan:~/Sources/school/214/labs/01/Java[chan@chan Java]$ exi[K[K[Kexit
exit

Script done on 2018-01-30 15:46:33-0500
