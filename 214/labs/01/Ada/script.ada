Script started on 2018-01-30 22:28:46-0500
]0;chan@chan:~/Sources/school/214/labs/01/Ada[chan@chan Ada]$ ls
[0m[01;32mcircle_area[0m  circle_area.adb  circle_area.adb~  circle_area.ali  circle_area.o  script.ada  script.adb
]0;chan@chan:~/Sources/school/214/labs/01/Ada[chan@chan Ada]$ cat circle_area.adb
-- circle_area.adb computes the area of a circle.
--
-- Input: The radius of the circle.
-- Precondition: The radius is a positive number.
-- Output: The area of the circle.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Chan Kim (ck45)
-- Date: 1/31/2018
----------------------------------------------------

with Ada.Text_IO, Ada.Float_Text_IO;
use  Ada.Text_IO, Ada.Float_Text_IO;

procedure circle_area is

   radius, area : float; 

   -- function circleArea computes a circle's area, given its radius
   -- Parameter: r, a float
   -- Precondition: r >= 0.0
   -- Return: the area of the circle whose radius is r
   ----------------------------------------------------
   function circleArea(r: in float) return float is 
      PI : constant := 3.1415927;
   begin
      return PI * r ** 2; -- return an expression
   end circleArea; -- circleArea method
   
-- main program
begin                           
   -- prompt for radius
   Put_Line("To compute the area of a circle,");
   Put("enter its radius: ");
   -- Get the number form the user
   Get(radius);
   
   -- Get the area value from circleArea method
   area := circleArea(radius);
   
   -- output area
   Put("The circle's area is ");
   Put(area);
   New_Line;
end circle_area;
]0;chan@chan:~/Sources/school/214/labs/01/Ada[chan@chan Ada]$ f[Kgnatmake circle_area.adb 
gnatmake: "circle_area" up to date.
]0;chan@chan:~/Sources/school/214/labs/01/Ada[chan@chan Ada]$ gnatmake circle_area.adb [K[K[K[K[K
gnatmake: "circle_area" up to date.
]0;chan@chan:~/Sources/school/214/labs/01/Ada[chan@chan Ada]$ ./circle_area 
To compute the area of a circle,
enter its radius: 1
The circle's area is  3.14159E+00
]0;chan@chan:~/Sources/school/214/labs/01/Ada[chan@chan Ada]$ ./circle_area 
To compute the area of a circle,
enter its radius: 2
The circle's area is  1.25664E+01
]0;chan@chan:~/Sources/school/214/labs/01/Ada[chan@chan Ada]$ ./circle_area 
To compute the area of a circle,
enter its radius: 2.5
The circle's area is  1.96350E+01
]0;chan@chan:~/Sources/school/214/labs/01/Ada[chan@chan Ada]$ ./circle_area 
To compute the area of a circle,
enter its radius: 4.99999
The circle's area is  7.85395E+01
]0;chan@chan:~/Sources/school/214/labs/01/Ada[chan@chan Ada]$ exit
exit

Script done on 2018-01-30 22:29:50-0500
