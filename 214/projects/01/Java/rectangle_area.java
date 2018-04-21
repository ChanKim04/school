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
