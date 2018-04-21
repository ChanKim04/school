Script started on 2018-02-18 21:49:41-0500
]0;chan@chan:~/Sources/school/214/projects/03[chan@chan 03]$ cat[K[K[Kcat LetterGrade.java
/* LetterGrade.java is a driver for function LetterGrade().
 * 
 * Completed by: Chan Kim(ck45)
 * Date: 2/16/2018

 ****************************************************************/

import java.util.Scanner;

public class LetterGrade {

   public static void main(String[] args) {
      Scanner keyboard = new Scanner(System.in);
      System.out.println("\nEnter your an integer average (0 ~ 100): "); // prompt

      int grade = keyboard.nextInt();       // read grade
      System.out.println(letterGrade(grade)); // display its code
   }

   /***************************************************************
    * letterGrade() converts an average into its letter grade.
    *
    * Receive: average, an integer.
    * PRE: an average score.
    * Return: the letter grade corresponding to average.
    */
    
    public static char letterGrade(int average)
    {
        switch (average / 10)
        {
            case 10: case 9:
                return 'A';
            case 8:
                return 'B';
            case 7:
                return 'C';
            case 6:
                return 'D';
            default:
                return 'F';
        }
    }
}
]0;chan@chan:~/Sources/school/214/projects/03[chan@chan 03]$ javac -deprecation LetterGrade.java 
]0;chan@chan:~/Sources/school/214/projects/03[chan@chan 03]$ java LetterGrade 

Enter your an integer average (0 ~ 100): 
100
A
]0;chan@chan:~/Sources/school/214/projects/03[chan@chan 03]$ java LetterGrade 

Enter your an integer average (0 ~ 100): 
89
B
]0;chan@chan:~/Sources/school/214/projects/03[chan@chan 03]$ java LetterGrade 

Enter your an integer average (0 ~ 100): 
79
C
]0;chan@chan:~/Sources/school/214/projects/03[chan@chan 03]$ java LetterGrade 

Enter your an integer average (0 ~ 100): 
69
D
]0;chan@chan:~/Sources/school/214/projects/03[chan@chan 03]$ java LetterGrade 

Enter your an integer average (0 ~ 100): 
59
F
]0;chan@chan:~/Sources/school/214/projects/03[chan@chan 03]$ java LetterGrade 

Enter your an integer average (0 ~ 100): 
0
F
]0;chan@chan:~/Sources/school/214/projects/03[chan@chan 03]$ java LetterGrade 

Enter your an integer average (0 ~ 100): 
200
F
]0;chan@chan:~/Sources/school/214/projects/03[chan@chan 03]$ exit
exit

Script done on 2018-02-18 21:51:04-0500
