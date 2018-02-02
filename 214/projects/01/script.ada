Script started on 2018-02-01 22:32:27-0500
]0;chan@chan:~/Sources/school/214/projects/01/Ada[chan@chan Ada]$ ls
[0m[01;32mrectangle_area[0m  rectangle_area.adb  rectangle_area.adb~  rectangle_area.ali  rectangle_area.o  script.ada
]0;chan@chan:~/Sources/school/214/projects/01/Ada[chan@chan Ada]$ cat rectangle_area.adb
-- rectangle_area.adb computes the area of a circle.
--
-- Input: The width and height of the rectangle.
-- Precondition: The width and height are positive numbers.
-- Output: The area of the rectangle.
--
-- Begun by: Chan Kim, CS 214 at Calvin College.
-- Completed by: Chan Kim (ck45)
-- Date: 1/31/2018
----------------------------------------------------

with Ada.Text_IO, Ada.Float_Text_IO;
use  Ada.Text_IO, Ada.Float_Text_IO;

procedure rectangle_area is

   Width, height, area : float; 

   -- function recArea computes a rectangle's area, given its width and height
   -- Parameter: w and h, a float
   -- Precondition: w and h >= 0.0
   -- Return: the area of the rectangle whose width and height are w and h
   ----------------------------------------------------
   function recArea(w: in Float; h: in Float) return float is 
   begin
      return w * h; -- return an expression 
   end recArea; --recArea method
   
   -- main program
begin             
   -- prompt for width and height
   Put_Line("To compute the area of a circle,");
   Put("enter its width: ");
   -- get the number from the user
   Get(width);
   
   Put("enter its height: ");
   -- get the number from the user
   Get(height);
   
   -- get the area value from the recArea method
   area := recArea(Width, height);
   
   -- output area
   Put("The rectangle's area is ");
   Put(area);
   New_Line;
end rectangle_area;
]0;chan@chan:~/Sources/school/214/projects/01/Ada[chan@chan Ada]$ gnatmake rectangle_area.adb [K[K[K[K[K
gnatmake: "rectangle_area" up to date.
]0;chan@chan:~/Sources/school/214/projects/01/Ada[chan@chan Ada]$ gnatmake rectangle_area.adb 
gnatmake: "rectangle_area" up to date.
]0;chan@chan:~/Sources/school/214/projects/01/Ada[chan@chan Ada]$ ls
[0m[01;32mrectangle_area[0m  rectangle_area.adb  rectangle_area.adb~  rectangle_area.ali  rectangle_area.o  script.ada
]0;chan@chan:~/Sources/school/214/projects/01/Ada[chan@chan Ada]$ l[K./rectangle_area 
To compute the area of a circle,
enter its width: 1
enter its height: 2
The rectangle's area is  2.00000E+00
]0;chan@chan:~/Sources/school/214/projects/01/Ada[chan@chan Ada]$ ./rectangle_area 
To compute the area of a circle,
enter its width: 2
enter its height: 2
The rectangle's area is  4.00000E+00
]0;chan@chan:~/Sources/school/214/projects/01/Ada[chan@chan Ada]$ ./rectangle_area 
To compute the area of a circle,
enter its width: 2
enter its height: 3
The rectangle's area is  6.00000E+00
]0;chan@chan:~/Sources/school/214/projects/01/Ada[chan@chan Ada]$ exit
exit

Script done on 2018-02-01 22:33:48-0500
