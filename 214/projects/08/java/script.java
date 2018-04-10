Script started on 2018-04-09 10:20:29-0400
]0;chan@chan:~/Sources/school/214/projects/08/java[chan@chan java]$ make java
make: *** No rule to make target 'java'.  Stop.
]0;chan@chan:~/Sources/school/214/projects/08/java[chan@chan java]$ cat Temp.java 
/* Temp.java implements class Name.
 * Prof: Dr. Adams, for CS 214 at Calvin College.
 * Student: Chan Kim (ck45)
 * Date: 4/9/2018
 ************************************************************/

import java.io.*;
import java.util.Scanner;

class Temp {
  
    /*
     * Temp(degrees, scale) initializes a Temp variable          
     * Receive: degrees, the degrees ;         
     *          scale, the scale .         
     * Return: set to degrees, and scale if it is valid 
      *        otherwise prints an invalid message.    
     */
    public Temp(double degrees, char scale) {

        char capScale = Character.toUpperCase(scale);

        if (isValid(degrees, capScale))
        {
            myDegrees = degrees;
            myScale = capScale;
        }
        else
        {
            System.out.println("Invalid value");
        }
    }

    /*
     * isValid(degrees, scale) checks the validation.        
     * Receive: degrees, float; scale, a character.                      
     * PRE: degrees and scale have been initialized.            
     * Return: true or false.     
     */

    public boolean isValid(double degrees, char scale)
    {
        if (scale == 'F')
        {
            if (degrees < -459.67)
            {
                return false;
            }
            else
            {
                return true;
            }
        }
        else if (scale == 'C')
        {
            if (degrees < -273.15)
            {
                return false;
            }
            else
            {
                return true;
            }
        }
        else if (scale == 'K')
        {
            if (degrees < 0.0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }
        else
        {
            return false;
        }                 
    }

    // extractor for first name of a Name object
    public  double getDegrees() {
        return myDegrees;
    }

    // extractor for middle name of a Name object
    public  char getScale() {
        return myScale;
    }

    /*
     * isValid(degrees, scale) checks the validation.        
     * Receive: degrees, float; scale, a character.                      
     * PRE: degrees and scale have been initialized.            
     * Return: true or false.
     */

    public void setFahrenheit()
    {
        if (getScale() == 'C')
        {
            myDegrees = ((getDegrees() * 1.8) + 32.0);
            myScale = 'F';
        }
        else if (getScale() == 'K')
        {
            myDegrees = ((getDegrees() * 1.8) - 459.67);
            myScale = 'F';
        }
    }

    public void setCelsius()
    {
        if (getScale() == 'F')
        {
            myDegrees = ((getDegrees() - 32.0) / 1.8);
            myScale = 'C';
        }
        else if (getScale() == 'K')
        {
            myDegrees = (getDegrees() - 273.15);
            myScale = 'C';
        }
    }

    public void setKelvin()
    {
        if (getScale() == 'C')
        {
            myDegrees = (getDegrees() + 273.15);
            myScale = 'K';
        }
        else if (getScale() == 'F')
        {
            myDegrees = ((getDegrees() + 459.67) * (5.0/9.0));
            myScale = 'K';
        }
    }

    /*
     * read(keyboard) reads degrees and scale   
     * Receive: keyboard, Scanner.
     * PRE: keyboard ahs been initialized.                                  
     * Return: sets up degrees and scale if it is valid 
     *          otherwise prints an invalid message.    
    */

    public void read(Scanner keyboard)
    {
        String values = keyboard.nextLine();
        String [] parts = values.split(" ");
        double degrees = Double.parseDouble(parts[0]);
        char scale = parts[1].charAt(0);
        char capScale = Character.toUpperCase(scale);
        if (isValid(degrees, capScale))
        {
            myDegrees = degrees;
            myScale = capScale;
        }
        else
        {
            System.out.println("Invalid value");
        }    
    }

    /*
     * raise(degree) incriments degrees                  
     * Receive: degree, number.                     
     * PRE: degrees has been initialized.             
     * Return: incriments degrees otherwise prints an invalid message.    
    */

    public void raise(double degrees)
    {
        myDegrees = myDegrees + degrees;
    }

    /*
     * lower(degree) decriments degrees                  
     * Receive: degree, number.                     
     * PRE: degrees has been initialized.               
     * Return: decriments degrees otherwise prints an invalid message. 
    */

    public void lower(double degrees)
    {
        double Degrees = myDegrees - degrees;
        if (isValid(Degrees, myScale))
        {
            myDegrees = Degrees;
        }
        else
        {
            System.out.println("Invalid value");
        }          
    }

    /*
     * equals(temp) retrieves baseTemp = limitTemp        
     * Receive: temp, a Temp.                      
     * PRE: baseTemp and limitTemp have been initialized.            
     * Return: true or false. 
    */
    public boolean equals(Temp temp)
    {
        temp.setCelsius();
        setCelsius();
        if (temp.getDegrees() == getDegrees())
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    /*
     * less_than(temp) retrieves baseTemp < limitTemp        
     * Receive: temp, a Temp.                      
     * PRE: baseTemp and limitTemp have been initialized.            
     * Return: true or false.     
    */

    public boolean less_than(Temp temp)
    {
        temp.setCelsius();
        setCelsius();
        if (temp.getDegrees() > getDegrees())
        {
            return true;
        }
        else
        {
            return false;
        }        
    }    

    /*
     * toString() retrieves Temp as a String                                       
     * PRE: temp has been initialized.           
     * Return: a String representation of Temp.      
    */

    public String toString() {
        return Double.toString(myDegrees) + ' ' + Character.toString(myScale);
    }

    // private instance variables
    private double myDegrees;
    private char myScale;  
    }

]0;chan@chan:~/Sources/school/214/projects/08/java[chan@chan java]$ cat TempTester.java 
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

]0;chan@chan:~/Sources/school/214/projects/08/java[chan@chan java]$ ls
Makefile  script.java  Temp.class  Temp.java  TempTester.class  [0m[01;32mTempTester.java[0m
]0;chan@chan:~/Sources/school/214/projects/08/java[chan@chan java]$ ./TempTester.java [K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[Kjava TempTester 
w 0 F
100 C
2.5
0.0 F	-17.77777777777778 C	255.3722222222222 K
2.4999999999999396 F	-16.38888888888892 C	256.76111111111106 K
4.999999999999886 F	-15.000000000000062 C	258.1499999999999 K
7.4999999999998295 F	-13.611111111111205 C	259.5388888888888 K
9.999999999999773 F	-12.222222222222348 C	260.92777777777764 K
12.499999999999716 F	-10.83333333333349 C	262.3166666666665 K
14.999999999999659 F	-9.444444444444633 C	263.70555555555535 K
17.499999999999602 F	-8.055555555555776 C	265.0944444444442 K
19.999999999999545 F	-6.666666666666919 C	266.48333333333306 K
22.49999999999949 F	-5.277777777778062 C	267.8722222222219 K
24.99999999999943 F	-3.8888888888892046 C	269.2611111111108 K
27.499999999999375 F	-2.5000000000003473 C	270.64999999999964 K
29.999999999999318 F	-1.11111111111149 C	272.0388888888885 K
32.49999999999926 F	0.27777777777736723 C	273.42777777777735 K
34.999999999999204 F	1.6666666666662244 C	274.8166666666662 K
37.49999999999915 F	3.055555555555082 C	276.20555555555507 K
39.99999999999909 F	4.444444444443939 C	277.5944444444439 K
42.499999999999034 F	5.833333333332797 C	278.9833333333328 K
44.99999999999898 F	7.222222222221654 C	280.37222222222164 K
47.49999999999892 F	8.61111111111051 C	281.7611111111105 K
49.99999999999886 F	9.999999999999368 C	283.14999999999935 K
52.499999999998806 F	11.388888888888225 C	284.5388888888882 K
54.999999999998806 F	12.777777777777114 C	285.92777777777707 K
57.49999999999869 F	14.16666666666594 C	287.3166666666659 K
59.99999999999869 F	15.555555555554829 C	288.7055555555548 K
62.49999999999858 F	16.944444444443654 C	290.09444444444364 K
64.99999999999858 F	18.333333333332543 C	291.4833333333325 K
67.49999999999847 F	19.72222222222137 C	292.87222222222135 K
69.99999999999847 F	21.111111111110258 C	294.2611111111102 K
72.49999999999835 F	22.499999999999083 C	295.64999999999907 K
74.99999999999835 F	23.888888888887973 C	297.0388888888879 K
77.49999999999824 F	25.277777777776798 C	298.4277777777768 K
79.99999999999824 F	26.666666666665687 C	299.81666666666564 K
82.49999999999812 F	28.055555555554513 C	301.2055555555545 K
84.99999999999812 F	29.444444444443402 C	302.59444444444335 K
87.49999999999801 F	30.833333333332227 C	303.9833333333322 K
89.99999999999801 F	32.22222222222111 C	305.37222222222107 K
92.4999999999979 F	33.61111111110994 C	306.7611111111099 K
94.9999999999979 F	34.99999999999883 C	308.1499999999988 K
97.49999999999778 F	36.38888888888766 C	309.53888888888764 K
99.99999999999778 F	37.77777777777654 C	310.9277777777765 K
102.49999999999767 F	39.16666666666537 C	312.31666666666536 K
104.99999999999767 F	40.55555555555426 C	313.7055555555542 K
107.49999999999756 F	41.944444444443086 C	315.09444444444307 K
109.99999999999756 F	43.33333333333197 C	316.4833333333319 K
112.49999999999744 F	44.7222222222208 C	317.8722222222208 K
114.99999999999744 F	46.111111111109686 C	319.26111111110964 K
117.49999999999733 F	47.499999999998515 C	320.6499999999985 K
119.99999999999733 F	48.8888888888874 C	322.03888888888736 K
122.49999999999721 F	50.27777777777623 C	323.4277777777762 K
124.99999999999721 F	51.666666666665115 C	324.81666666666507 K
127.4999999999971 F	53.055555555553944 C	326.20555555555393 K
129.9999999999971 F	54.44444444444283 C	327.5944444444428 K
132.499999999997 F	55.83333333333166 C	328.98333333333164 K
134.999999999997 F	57.222222222220545 C	330.3722222222205 K
137.49999999999687 F	58.61111111110937 C	331.76111111110936 K
139.99999999999687 F	59.99999999999826 C	333.1499999999982 K
142.49999999999676 F	61.38888888888709 C	334.5388888888871 K
144.99999999999676 F	62.777777777775974 C	335.92777777777593 K
147.49999999999665 F	64.1666666666648 C	337.3166666666648 K
149.99999999999665 F	65.5555555555537 C	338.7055555555537 K
152.49999999999665 F	66.94444444444258 C	340.09444444444256 K
154.99999999999665 F	68.33333333333147 C	341.4833333333314 K
157.49999999999653 F	69.7222222222203 C	342.8722222222203 K
159.99999999999653 F	71.11111111110918 C	344.26111111110913 K
162.49999999999642 F	72.49999999999801 C	345.649999999998 K
164.99999999999642 F	73.8888888888869 C	347.03888888888685 K
167.4999999999963 F	75.27777777777573 C	348.4277777777757 K
169.9999999999963 F	76.66666666666461 C	349.81666666666456 K
172.4999999999962 F	78.05555555555344 C	351.2055555555534 K
174.9999999999962 F	79.44444444444233 C	352.5944444444423 K
177.49999999999608 F	80.83333333333115 C	353.98333333333113 K
179.99999999999608 F	82.22222222222004 C	355.37222222222 K
182.49999999999596 F	83.61111111110887 C	356.76111111110885 K
184.99999999999596 F	84.99999999999775 C	358.1499999999977 K
187.49999999999585 F	86.38888888888658 C	359.53888888888656 K
189.99999999999585 F	87.77777777777547 C	360.9277777777754 K
192.49999999999574 F	89.1666666666643 C	362.3166666666643 K
194.99999999999574 F	90.55555555555318 C	363.70555555555313 K
197.49999999999562 F	91.94444444444201 C	365.094444444442 K
199.99999999999562 F	93.3333333333309 C	366.48333333333085 K
202.4999999999955 F	94.72222222221973 C	367.8722222222197 K
204.9999999999955 F	96.11111111110861 C	369.26111111110856 K
207.4999999999954 F	97.49999999999744 C	370.6499999999974 K
209.9999999999954 F	98.88888888888633 C	372.0388888888863 K
]0;chan@chan:~/Sources/school/214/projects/08/java[chan@chan java]$ java[K[K[K[Kjava TempTester 
0 K k
212 f
20.0
-459.66999999999996 F	-273.15 C	0.0 K
-423.66999999999996 F	-253.14999999999998 C	20.0 K
-387.66999999999996 F	-233.14999999999998 C	40.0 K
-351.66999999999996 F	-213.14999999999998 C	60.0 K
-315.66999999999996 F	-193.14999999999998 C	80.0 K
-279.66999999999996 F	-173.14999999999998 C	100.0 K
-243.66999999999996 F	-153.14999999999998 C	120.0 K
-207.66999999999996 F	-133.14999999999998 C	140.0 K
-171.66999999999996 F	-113.14999999999998 C	160.0 K
-135.66999999999996 F	-93.14999999999998 C	180.0 K
-99.66999999999996 F	-73.14999999999998 C	200.0 K
-63.66999999999996 F	-53.14999999999998 C	220.0 K
-27.66999999999996 F	-33.14999999999998 C	240.0 K
8.330000000000041 F	-13.149999999999977 C	260.0 K
44.33000000000004 F	6.850000000000023 C	280.0 K
80.33000000000004 F	26.850000000000023 C	300.0 K
116.33000000000004 F	46.85000000000002 C	320.0 K
152.33000000000004 F	66.85000000000002 C	340.0 K
188.33000000000004 F	86.85000000000002 C	360.0 K
]0;chan@chan:~/Sources/school/214/projects/08/java[chan@chan java]$ exit
exit

Script done on 2018-04-09 10:21:50-0400
