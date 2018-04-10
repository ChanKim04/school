/* TempTester.java is a 'driver' to test class Temp.
 * Prof: Dr. Adams, for CS 214 at Calvin College.
 * Student: Chan Kim (ck45)
 * Date: 4/9/2018
 ************************************************************/

import java.io.*;
import java.util.Scanner;

public class TempTester  
{
  public static void main(String[] args)
  {
    Scanner keyboard = new Scanner(System.in);
    
    Temp baseTemp = new Temp(0.0, 'C');
    baseTemp.read(keyboard);
    Temp limitTemp = new Temp(0.0, 'C');
    limitTemp.read(keyboard);

    double stepValue = keyboard.nextDouble();
    
    char scale = baseTemp.getScale();

    while (baseTemp.equals(limitTemp) || baseTemp.less_than(limitTemp))
    {
      baseTemp.setFahrenheit();
      System.out.print(baseTemp.toString() + "\t");
      baseTemp.setCelsius();
      System.out.print(baseTemp.toString() + "\t");
      baseTemp.setKelvin();
      System.out.print(baseTemp.toString() + "\n");

      if (scale == 'F')
      {
        baseTemp.setFahrenheit();        
      }
      else if (scale == 'C')
      {
        baseTemp.setCelsius();
      }
      else if (scale == 'K')
      {
        baseTemp.setKelvin();
      }

      baseTemp.raise(stepValue);
    }
  }
}

