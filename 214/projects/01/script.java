Script started on 2018-02-01 22:31:15-0500
]0;chan@chan:~/Sources/school/214/projects/01/Java[chan@chan Java]$ ls
rectangle_area.class  rectangle_area.java  rectangle_area.java~  script.java
]0;chan@chan:~/Sources/school/214/projects/01/Java[chan@chan Java]$ cat rectangle_area.java
/* rectangle_area.java computes the area of a rectangle.
 *
 * Input: The width and height of the rectangle.
 * Precondition: The width and height are positive numbers.
 * Output: The area of the rectangle.
 *
 * Begun by: Chan Kim, for CS 214, at Calvin College.
 * Completed by: Chan Kim (ck45)
 * Date: 1/31/2018
 **********************************************************/


import java.util.Scanner;  // include class for Scanner

public class rectangle_area {

     /* function rectangleArea() computes a rectangle's area, given its width and height.
      * Parameter: w and h, a double
      * Precondition: w and h are not negative.
      * Returns: the area of the rectangle
      */
    public static double recArea(double w, double h) {
        return w * h;               // return an expression
     } // recArea method
	
  // main program
  public static void main(String[] args) {
      // prompt for width and height
      System.out.println("To compute the area of a rectangle,");
      System.out.print(" enter its width: ");
     
      // Create a connection named keyboard to standard in
      Scanner keyboard = new Scanner(System.in); 
  
      //Get the number from the user
      double width = keyboard.nextDouble();

      System.out.print(" enter its height: ");
     
      // Create a connection named keyboard to standard in
      Scanner keyboard2 = new Scanner(System.in); 
  
      //Get the number from the user
      double height = keyboard2.nextDouble();
      // output area
      System.out.println("The area is " + recArea(width, height)); 
  } // main method
} // class rectangle_area
]0;chan@chan:~/Sources/school/214/projects/01/Java[chan@chan Java]$ javac -deprecation rectangle_area.java 
]0;chan@chan:~/Sources/school/214/projects/01/Java[chan@chan Java]$ java rectangle_area 
To compute the area of a rectangle,
 enter its width: 1
 enter its height: 2
The area is 2.0
]0;chan@chan:~/Sources/school/214/projects/01/Java[chan@chan Java]$ java rectangle_area 
To compute the area of a rectangle,
 enter its width: 2
 enter its height: 2
The area is 4.0
]0;chan@chan:~/Sources/school/214/projects/01/Java[chan@chan Java]$ java rectangle_area 
To compute the area of a rectangle,
 enter its width: 2
 enter its height: 3
The area is 6.0
]0;chan@chan:~/Sources/school/214/projects/01/Java[chan@chan Java]$ exit
exit

Script done on 2018-02-01 22:32:00-0500
