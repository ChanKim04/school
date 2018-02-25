-- factorial.adb computes a factorial.
--
-- Input: n, one integer.
-- Precondition: n >= 0
-- Output: A factorial from n inputted value.
--
-- Completed by: Chan Kim (ck45)
--------------------------------------------------------------

with Ada.Text_IO, Ada.Integer_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO;

procedure factorial is

   n, answer: Integer;

begin                                           -- Prompt for input
   Put("To compute n!, enter n: ");
   Get(n);
   answer := 1;
   -- for loop to compute a factorial
for i in 2..n loop
    answer := answer*i;
end loop;
    -- output the result of the factorial
    Put(n);
    Put("! = ");
    Put(answer);
end factorial;

