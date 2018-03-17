Script started on 2018-03-17 00:27:55-0400
]0;chan@chan:~/Sources/school/214/labs/06[chan@chan 06]$ javac -deprecation Average.java 
]0;chan@chan:~/Sources/school/214/labs/06[chan@chan 06]$ java Average 
The first average is 0.0
The second average is 7.5
]0;chan@chan:~/Sources/school/214/labs/06[chan@chan 06]$ cat Average.J[Kjava 
/* Average.java is a driver for method avg().
 *
 * Started by: Prof. Adams, for CS 214 at Calvin College
 *
 * Student Name: Chan Kim (ck45)
 * Date: 3/14/2018
 *
 * Precondition: theArray, is an array of double values.
 * Output: the average of the numbers in theArray.
 ***************************************************************/

import java.io.*;

public class Average
{
  public static void main(String[] args) {

      // Replace this line with definitions of array0 and array1...
      double[] array0 = null;
      double[] array1 = {9.0, 8.0, 7.0, 6.0};
      // output the average of the values in the arrays
      System.out.println("The first average is " + avg(array0));
      System.out.println("The second average is " + avg(array1));
  }
  

  /* sum() is a method that computes the sum of all the values
   * in an array of doubles.
   * Receive: anArray, an array of doubles.
   * Return: the sum of the values in anArray.
   ************************************************************/

   // Replace this line with the definition of sum()... 
  public static double sum(double[] theArray){ 
    double total = 0.0;
    for (int i = 0; i < theArray.length; i++){
        total += theArray[i];
    }
    return total;
}


  /* avg() is a method that computes the average of the values
   * in an array.
   * Receive: anArray, an array of doubles.
   * Return: the average of the values in anArray.
   **************************************************************/
  
   // Replace this line with the definition of avg()...
  public static double avg(double anArray[])
  {
    if (anArray == null || anArray.length <= 0)
      return 0.0;
    else
      return sum(anArray) / anArray.length;
  }

}

]0;chan@chan:~/Sources/school/214/labs/06[chan@chan 06]$ end
bash: end: command not found
]0;chan@chan:~/Sources/school/214/labs/06[chan@chan 06]$ exit
exit

Script done on 2018-03-17 00:28:52-0400
