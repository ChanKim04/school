Script started on 2018-02-24 23:31:16-0500
]0;chan@chan:~/Sources/school/214/projects/04[chan@chan 04]$ ca[K[Kls
 [0m[01;32mfactorial[0m       factorial.ali    '#factorial.el#'   factorial.el~    factorial.o    script.java
 factorial.adb   Factorial.class   factorial.el      Factorial.java   factorial.rb
]0;chan@chan:~/Sources/school/214/projects/04[chan@chan 04]$ cat Factorial.java
/* Factorial.java computes a factorial.
 *
 * Input: n, one integer.
 * PRE: n >= 0
 * Output: A factorial from n inputted value.
 * Completed by: Chan Kim (ck45)
 ********************************************************/
import java.util.Scanner; 		// Get input

class Factorial{

  public static void main(String[] args){
    Scanner keyboard = new Scanner(System.in);
    System.out.println("To compute n!, enter n: ");
    double n, answer;
    n = keyboard.nextDouble();

    answer = 1.0;
    // for loop to compute a factorial
  for (int i = 2; i <= n; i++)
  {
    answer *= i;
  }
    // output the result of the factorial
      System.out.println(n + "! = " + answer);
  }
}

]0;chan@chan:~/Sources/school/214/projects/04[chan@chan 04]$ favac -depreca[K[K[K[K[K[K[K[K[K[K[K[K[K[Kjavac -deprecation[Kn Factorial.java 
]0;chan@chan:~/Sources/school/214/projects/04[chan@chan 04]$ java Factorial 
To compute n!, enter n: 
2
2.0! = 2.0
]0;chan@chan:~/Sources/school/214/projects/04[chan@chan 04]$ java Factorial 
To compute n!, enter n: 
3
3.0! = 6.0
]0;chan@chan:~/Sources/school/214/projects/04[chan@chan 04]$ java Factorial 
To compute n!, enter n: 
4
4.0! = 24.0
]0;chan@chan:~/Sources/school/214/projects/04[chan@chan 04]$ java Factorial 
To compute n!, enter n: 
6
6.0! = 720.0
]0;chan@chan:~/Sources/school/214/projects/04[chan@chan 04]$ java Factorial 
To compute n!, enter n: 
7
7.0! = 5040.0
]0;chan@chan:~/Sources/school/214/projects/04[chan@chan 04]$ exit
exit

Script done on 2018-02-24 23:32:29-0500
