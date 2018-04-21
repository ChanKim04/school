Script started on 2018-03-02 09:26:57-0500
]0;chan@chan:~/Sources/school/214/labs/05[chan@chan 05]$ cat Split.java 
/* Split.java is a class and program that splits a string
 * into two substrings.
 * 
 * Begun by: Serita Nelesen
 * Completed by: Chan Kim (ck45)
 ***************************************************************/

import java.util.Scanner;

// java class Split
public class Split
{
  // main program
  public static void main(String[] args)
    {
      Scanner keyboard = new Scanner(System.in);
      // prompt for the string
      System.out.println("\nTo split a string, enter the string: ");
      String theString = keyboard.next();
      
      // prompt for splitting position
      System.out.println("\nEnter the split position: ");
      int position = keyboard.nextInt();

      //Create list, compute results and print
      String [] resultList = new String[2];
      splitter(theString, position, resultList);
      System.out.println("\nThe first part is " + resultList[0] + "\n and the second part is " + resultList[1]);
      
    }
  
  /* splitter() splits a string according to the position specified
   * Receive: 	theString - the string to be split
   * 		pos - the position at which to split
   *            resList - an array of strings in which to place results
   *****************************************************/
  // replace this line with a definition for splitter
  public static void splitter(String theString, int pos, String[] results)
  {
      results[0] = theString.substring(0, pos);
      results[1] = theString.substring(pos, theString.length());
  }
}
]0;chan@chan:~/Sources/school/214/labs/05[chan@chan 05]$ javac -deprecation J[KSplit.java 
]0;chan@chan:~/Sources/school/214/labs/05[chan@chan 05]$ java Split 

To split a string, enter the string: 
hello

Enter the split position: 
5

The first part is hello
 and the second part is 
]0;chan@chan:~/Sources/school/214/labs/05[chan@chan 05]$ java Split 

To split a string, enter the string: 
hello

Enter the split position: 
3

The first part is hel
 and the second part is lo
]0;chan@chan:~/Sources/school/214/labs/05[chan@chan 05]$ java Split 

To split a string, enter the string: 
hello

Enter the split position: 
0

The first part is 
 and the second part is hello
]0;chan@chan:~/Sources/school/214/labs/05[chan@chan 05]$ exit
exit

Script done on 2018-03-02 09:27:33-0500
