/* Array.java is a driver for methods printArray() and readArray().
 *
 * Author: Chan Kim (ck45) for CS 214 at Calvin College
 * Date: 3/26/2018
 *
 * Precondition: get the size of the array from user.
 * Output: print the result of array.
 ***************************************************************/

import java.io.*;
import java.util.Scanner;

public class Array
{
  public static void main(String[] args) {

      Scanner keyboard = new Scanner(System.in);
      System.out.println("How many values are to be in the array?");
      int itsSize = keyboard.nextInt();
      
      double[] anArray = new double[itsSize];
      System.out.println("Enter values into the array...\n");
      readArray(anArray, itsSize, keyboard);
      System.out.println("Print the resulting array...");      
      printArray(anArray, itsSize);
  }

  /* printArray() is a method that prints the resulting array.
   * Receive: anArray, an array of doubles; itsSize, int.
   * Return: print the array.
   ************************************************************/

  public static void printArray(double[] anArray, int itsSize)
  { 
    for (int i = 0; i < itsSize; i++) {
      System.out.println(anArray[i]);
    }
  }

  /* readArray() is a method that gets values from user and appends the values into the array.  
   * Receive: anArray, an array of doubles; itsSize, int.
   * Return: return the array.
   **************************************************************/
  
  public static void readArray(double anArray[], int itsSize, Scanner keyboard)
  {
    for (int i = 0; i < itsSize; i++) {
      anArray[i] = keyboard.nextDouble();
    }
  }
}