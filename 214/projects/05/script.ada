Script started on 2018-03-06 02:27:19-0500
]0;chan@chan:~/Sources/school/214/projects/05[chan@chan 05]$ exit./quadraticroots cat quadraticroots.adb[5P.adbgnatmake quadraticroots.adb 
gcc -c quadraticroots.adb
gnatbind -x quadraticroots.ali
gnatlink quadraticroots.ali
]0;chan@chan:~/Sources/school/214/projects/05[chan@chan 05]$ gnatmake quadraticroots.adb [C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[Cexit[K./quadraticroots cat quadraticroots.adb
-- quadraticRoots.adb is a class and program that computes the quadratic formula
-- and gives two roots. If the values are invalid, it gives messages.
--
-- Completed by: Chan Kim (ck45), for CS 214 at Calvin College.
--------------------------------------------------------------

with Ada.Text_IO, Ada.Float_Text_IO, Ada.Strings.Fixed, Ada.Numerics.Elementary_Functions;
use  Ada.Text_IO, Ada.Float_Text_IO, Ada.Strings.Fixed, Ada.Numerics.Elementary_Functions;

procedure quadraticroots is

   a, b, c, root1, root2, arg: float;

   ------------------------------------------------
   -- quadraticroots() computes the quadratic formula
   -- Receive: 	a - the first part of equation 
   --           b - the sum of outer & inner part of equation    
   --           c -  the last part of equation
   -- PRE: a, b, and c are number.
   -- Return: an array of numbers in which to place results
   ------------------------------------------------
procedure QuadraticRoots(a, b, c: in float; root1, root2: out float) is
    begin
    if a /= 0.0 then
        arg := b ** 2.0 - 4.0 * a * c;
        if arg >= 0.0 then
            root1 := (-b + sqrt(arg)) / (2.0 * a);
            root2 := (-b - sqrt(arg)) / (2.0 * a);
        else
            Put_Line("*** quadraticRoots(): b^2 - 4ac is negative!");
            root1 := 0.0;
            root2 := 0.0;
        end if;
    else
        Put_Line("*** quadraticRoots(): a is zero!");
        root1 := 0.0;
        root2 := 0.0;
    end if;

    end QuadraticRoots;

begin                                           -- Prompt for input
   Put_Line("Given an equation of the form: y = ax^2 + bx + c");
   Put("Enter a(first): ");
   Get(a);
   Put("Enter b(sum of outer & inner): ");
   Get(b);
   Put("Enter c(last): ");
   Get(c);

   QuadraticRoots(a, b, c, root1, root2);

   Put("\nThe one root of the equation is ");
   Put(root1);
   Put("\nand the other root is ");
   Put(root2);

end quadraticroots;

]0;chan@chan:~/Sources/school/214/projects/05[chan@chan 05]$ cat quadraticroots.adb[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[Cgnatmake quadraticroots.adb [C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[Cexit[K./quadraticroots 
Given an equation of the form: y = ax^2 + bx + c
Enter a(first): 1 0
Enter b(sum of outer & inner): 0
Enter c(last): 0
*** quadraticRoots(): a is zero!
\nThe one root of the equation is  0.00000E+00\nand the other root is  0.00000E+00
]0;chan@chan:~/Sources/school/214/projects/05[chan@chan 05]$ ./quadraticroots 
Given an equation of the form: y = ax^2 + bx + c
Enter a(first): 1
Enter b(sum of outer & inner): 2
Enter c(last): 100
*** quadraticRoots(): b^2 - 4ac is negative!
\nThe one root of the equation is  0.00000E+00\nand the other root is  0.00000E+00
]0;chan@chan:~/Sources/school/214/projects/05[chan@chan 05]$ ./quadraticroots 
Given an equation of the form: y = ax^2 + bx + c
Enter a(first): 1
Enter b(sum of outer & inner): 2
Enter c(last): 1
\nThe one root of the equation is -1.00000E+00\nand the other root is -1.00000E+00
]0;chan@chan:~/Sources/school/214/projects/05[chan@chan 05]$ ./quadraticroots 
Given an equation of the form: y = ax^2 + bx + c
Enter a(first): 1
Enter b(sum of outer & inner): 7
Enter c(last): 10
\nThe one root of the equation is -2.00000E+00\nand the other root is -5.00000E+00
]0;chan@chan:~/Sources/school/214/projects/05[chan@chan 05]$ exit
exit

Script done on 2018-03-06 02:28:00-0500
                                        c.adbroots.adb[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[5P./quadraticroots exit[Kgnatmake quadraticroots.adb [C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[6Pcat quadraticroots.adb[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[5P./quadraticroots exit[K[Kscript script.ada
Script started, file is script.ada
]0;chan@chan:~/Sources/school/214/projects/05[chan@chan 05]$ exit./quadraticroots cat quadraticroots.adb[5P.adbgnatmake quadraticroots.adb 
gcc -c quadraticroots.adb
gnatbind -x quadraticroots.ali
gnatlink quadraticroots.ali
]0;chan@chan:~/Sources/school/214/projects/05[chan@chan 05]$ gnatmake quadraticroots.adb [C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[Cexit[K./quadraticroots cat quadraticroots.adb
-- quadraticRoots.adb is a class and program that computes the quadratic formula
-- and gives two roots. If the values are invalid, it gives messages.
--
-- Completed by: Chan Kim (ck45), for CS 214 at Calvin College.
--------------------------------------------------------------

with Ada.Text_IO, Ada.Float_Text_IO, Ada.Strings.Fixed, Ada.Numerics.Elementary_Functions;
use  Ada.Text_IO, Ada.Float_Text_IO, Ada.Strings.Fixed, Ada.Numerics.Elementary_Functions;

procedure quadraticroots is

   a, b, c, root1, root2, arg: float;

   ------------------------------------------------
   -- quadraticroots() computes the quadratic formula
   -- Receive: 	a - the first part of equation 
   --           b - the sum of outer & inner part of equation    
   --           c -  the last part of equation
   -- PRE: a, b, and c are number.
   -- Return: an array of numbers in which to place results
   ------------------------------------------------
procedure QuadraticRoots(a, b, c: in float; root1, root2: out float) is
    begin
    if a /= 0.0 then
        arg := b ** 2.0 - 4.0 * a * c;
        if arg >= 0.0 then
            root1 := (-b + sqrt(arg)) / (2.0 * a);
            root2 := (-b - sqrt(arg)) / (2.0 * a);
        else
            Put_Line("*** quadraticRoots(): b^2 - 4ac is negative!");
            root1 := 0.0;
            root2 := 0.0;
        end if;
    else
        Put_Line("*** quadraticRoots(): a is zero!");
        root1 := 0.0;
        root2 := 0.0;
    end if;

    end QuadraticRoots;

begin                                           -- Prompt for input
   Put_Line("Given an equation of the form: y = ax^2 + bx + c");
   Put("Enter a(first): ");
   Get(a);
   Put("Enter b(sum of outer & inner): ");
   Get(b);
   Put("Enter c(last): ");
   Get(c);

   QuadraticRoots(a, b, c, root1, root2);

   Put("\nThe one root of the equation is ");
   Put(root1);
   Put("\nand the other root is ");
   Put(root2);

end quadraticroots;

]0;chan@chan:~/Sources/school/214/projects/05[chan@chan 05]$ cat quadraticroots.adb[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[Cgnatmake quadraticroots.adb [C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[Cexit[K./quadraticroots 
Given an equation of the form: y = ax^2 + bx + c
Enter a(first): 1 0
Enter b(sum of outer & inner): 0
Enter c(last): 0
*** quadraticRoots(): a is zero!
\nThe one root of the equation is  0.00000E+00\nand the other root is  0.00000E+00
]0;chan@chan:~/Sources/school/214/projects/05[chan@chan 05]$ ./quadraticroots 
Given an equation of the form: y = ax^2 + bx + c
Enter a(first): 1
Enter b(sum of outer & inner): 2
Enter c(last): 100
*** quadraticRoots(): b^2 - 4ac is negative!
\nThe one root of the equation is  0.00000E+00\nand the other root is  0.00000E+00
]0;chan@chan:~/Sources/school/214/projects/05[chan@chan 05]$ ./quadraticroots 
Given an equation of the form: y = ax^2 + bx + c
Enter a(first): 1
Enter b(sum of outer & inner): 2
Enter c(last): 1
\nThe one root of the equation is -1.00000E+00\nand the other root is -1.00000E+00
]0;chan@chan:~/Sources/school/214/projects/05[chan@chan 05]$ ./quadraticroots 
Given an equation of the form: y = ax^2 + bx + c
Enter a(first): 1
Enter b(sum of outer & inner): 7
Enter c(last): 10
\nThe one root of the equation is -2.00000E+00\nand the other root is -5.00000E+00
]0;chan@chan:~/Sources/school/214/projects/05[chan@chan 05]$ exit
exit
Script done, file is script.ada
]0;chan@chan:~/Sources/school/214/projects/05[chan@chan 05]$ script script [K.ruby
Script started, file is script.ruby
]0;chan@chan:~/Sources/school/214/projects/05[chan@chan 05]$ cat quadratic.[Kroots.rb
cat: quadraticroots.rb: No such file or directory
]0;chan@chan:~/Sources/school/214/projects/05[chan@chan 05]$ cat quadraticRoots.rb
# quadraticRoots.rb is a class and program that computes the quadratic formula
# and gives two roots. If the values are invalid, it gives messages.
#
# Completed by: Chan Kim (ck45), for CS 214 at Calvin College.
#################################################################


# quadraticRoots() computes the quadratic formula 
# Receive: 	a - the first part of equation 
#           b - the sum of outer & inner part of equation    
#           c -  the last part of equation
# PRE: a, b, and c are number.
# Return: an array of numbers in which to place results
######################################################

def quadraticRoots(a, b, c)
    results = []
    if a != 0

        arg = ((b ** 2) - 4 * a * c)
   
                           if arg >= 0
                                    results[0] = (-b + Math.sqrt(arg)) / (2 * a)
                                    results[1] = (-b - Math.sqrt(arg)) / (2 * a)
                                    results
                           else
                                    $stderr.puts "\n*** quadraticRoots(): b^2 - 4ac is negative!"
                                    results = [0.0, 0.0] 
                           end 
   
      else $stderr.puts "\n*** quadraticRoots(): a is zero!"
        results = [0.0, 0.0] 
      end 
  end
  
  def main
    print "\nGiven an equation of the form: y = ax^2 + bx + c";
    print "\nEnter a(first): "; 
    a = gets.to_f
    print "\nEnter b(sum of outer & inner): "; 
    b = gets.to_f
    print "\nEnter c(last): "
    c = gets.to_f
    results = quadraticRoots(a, b, c)
    print "\nThe one root of the equation is #{results[0]}"
    print "\nand the other root is #{results[1]}\n"
  end
  
  main
  ]0;chan@chan:~/Sources/school/214/projects/05[chan@chan 05]$ ruby quadraticRoots.rb[K[Krb

Given an equation of the form: y = ax^2 + bx + c
Enter a(first): 0

Enter b(sum of outer & inner): 0

Enter c(last): 0

*** quadraticRoots(): a is zero!

The one root of the equation is 0.0
and the other root is 0.0
]0;chan@chan:~/Sources/school/214/projects/05[chan@chan 05]$ ruby quadraticRoots.rb

Given an equation of the form: y = ax^2 + bx + c
Enter a(first): 1

Enter b(sum of outer & inner): 2

Enter c(last): 100

*** quadraticRoots(): b^2 - 4ac is negative!

The one root of the equation is 0.0
and the other root is 0.0
]0;chan@chan:~/Sources/school/214/projects/05[chan@chan 05]$ ruby quadraticRoots.rb

Given an equation of the form: y = ax^2 + bx + c
Enter a(first): 1

Enter b(sum of outer & inner): 2

Enter c(last): 1

The one root of the equation is -1.0
and the other root is -1.0
]0;chan@chan:~/Sources/school/214/projects/05[chan@chan 05]$ ruby quadraticRoots.rb

Given an equation of the form: y = ax^2 + bx + c
Enter a(first): 1

Enter b(sum of outer & inner): 7

Enter c(last): 10

The one root of the equation is -2.0
and the other root is -5.0
]0;chan@chan:~/Sources/school/214/projects/05[chan@chan 05]$ exit
exit
Script done, file is script.ruby
]0;chan@chan:~/Sources/school/214/projects/05[chan@chan 05]$ cat script.java script.ada script.elisp script.ruby > proj05-results
]0;chan@chan:~/Sources/school/214/projects/05[chan@chan 05]$ cd ..
]0;chan@chan:~/Sources/school/214/projects[chan@chan projects]$ ls
[0m[01;34m01[0m  [01;34m02[0m  [01;34m03[0m  [01;34m04[0m  [01;34