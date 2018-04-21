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

