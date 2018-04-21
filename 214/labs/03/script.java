Script started on 2018-02-16 09:47:08-0500
]0;chan@chan:~/Sources/school/214/labs/03[chan@chan 03]$ cat y[KYearCodes.
YearCodes.class  YearCodes.java   
[chan@chan 03]$ cat YearCodes.
YearCodes.class  YearCodes.java   
[chan@chan 03]$ cat YearCodes.javaa[K
/* YearCodes.java is a driver for function yearCode().
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: Chan Kim(ck45)
 * Date: 2/16/2018

 ****************************************************************/

import java.util.Scanner;

public class YearCodes {

   public static void main(String[] args) {
      Scanner keyboard = new Scanner(System.in);
      System.out.println("\nEnter your academic year: "); // prompt

      String year = keyboard.next();       // read year
      System.out.println(yearCode(year)); // display its code
   }

   /***************************************************************
    * yearCode() converts an academic year into its integer code.
    *
    * Receive: year, a string.
    * PRE: year is one of {freshman, sophomore, junior, or senior}.
    * Return: the integer code corresponding to year.
    */

   // REPLACE THIS LINE WITH THE DEFINITION OF yearCode()
    public static int yearCode(String year)
    {
        if (year.equals("freshman"))
            return 1;
        else
            if (year.equals("sophomore"))
                return 2;
            else
                if (year.equals("junior"))
                    return 3;
                else
                    if (year.equals("senior"))
                        return 4;
                    else
                        return 0;
    }
}
]0;chan@chan:~/Sources/school/214/labs/03[chan@chan 03]$ javac -
-Akey           -d              -extdirs        -h              -nowarn         -processorpath  -sourcepath     -Werror
-bootclasspath  -deprecation    -g              -help           -parameters     -profile        -target         -X
-classpath      -encoding       -g:             -implicit:      -proc:          -s              -verbose        
-cp             -endorseddirs   -g:none         -J              -processor      -source         -version        
[chan@chan 03]$ javac -deprecation YearCodes.java 
]0;chan@chan:~/Sources/school/214/labs/03[chan@chan 03]$ java YearCodes 

Enter your academic year: 
freshman
1
]0;chan@chan:~/Sources/school/214/labs/03[chan@chan 03]$ java YearCodes 

Enter your academic year: 
sophomore
2
]0;chan@chan:~/Sources/school/214/labs/03[chan@chan 03]$ java YearCodes 

Enter your academic year: 
junior
3
]0;chan@chan:~/Sources/school/214/labs/03[chan@chan 03]$ java YearCodes 

Enter your academic year: 
senior
4
]0;chan@chan:~/Sources/school/214/labs/03[chan@chan 03]$ java YearCodes 

Enter your academic year: 
supersenior
0
]0;chan@chan:~/Sources/school/214/labs/03[chan@chan 03]$ exit
exit

Script done on 2018-02-16 09:48:40-0500
