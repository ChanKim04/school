/* QuadraticRoots.java is a class and program that computes the quadratic formula
 * and gives two roots. If the values are invalid, it gives messages.
 * 
 * Completed by: Chan Kim (ck45) for CS 214 at Calvin College.
 ***************************************************************/

import java.util.Scanner;
import java.lang.Math;

// java class QuadraticRoots
public class QuadraticRoots
{
  // main program
  public static void main(String[] args)
    {
      Scanner keyboard = new Scanner(System.in);
      
      System.out.println("\nGiven an equation of the form: y = ax^2 + bx + c");
      // prompt for the first
      System.out.println("\nEnter a(first): ");
      double a = keyboard.nextDouble();
      
      // prompt for the sum of outer & inner
      System.out.println("\nEnter b(sum of outer & inner): ");
      double b = keyboard.nextDouble();
      // prompt for the last
      System.out.println("\nEnter c(last): ");
      double c = keyboard.nextDouble();

      //Create list, compute results and print
      double [] resultList = new double[2];
      quadraticRoots(a, b, c, resultList);
      System.out.println("\nThe one root of the equation is " + resultList[0] + "\n and the other root is " + resultList[1]);
      
    }
  
  /* quadraticRoots() computes the quadratic formula 
   * Receive: 	a - the first part of equation
   * 		        b - the sum of outer & inner part of equation
   *            c -  the last part of equation
   *            resList - an array of doubles in which to place results
   *****************************************************/
  public static boolean quadraticRoots(double a, double b, double c, double[] results)
  {
      double root1, root2;
      if (a != 0) {
         double arg = Math.pow(b, 2.0) - 4 * a * c;
         if (arg >= 0) {
            root1 = (-b + Math.sqrt(arg))/(2*a);
            root2 = (-b - Math.sqrt(arg))/(2*a);
            results[0] = root1;
            results[1] = root2;
            return true;
         } else {
            System.out.println("\n*** quadraticRoots(): b^2 - 4ac is negative!");
            root1 = root2 = 0.0;
            return false;
         }
      } else {
         System.out.println("\n*** QuadraticRoots(): a is zero!");
         root1 = root2 = 0.0;
         return false;
      }
  }
}
