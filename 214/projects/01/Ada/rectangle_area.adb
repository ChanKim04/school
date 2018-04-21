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
