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

