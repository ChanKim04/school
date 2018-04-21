-- letterGrade.adb converts the letter grade corresponding to average.
--
-- Completed by: Chan Kim(ck45)
-- Date: 2/16/2018
--
-- Input: average, an integer.
-- Precondition: an average score.
-- Output: the letter grade(A, B, C, D, F) corresponding to average.
----------------------------------------------------

with Ada.Text_IO, Ada.Integer_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO;

procedure letterGrade is

   ave : integer;

function letter_grade(ave: in integer) return string is
begin
   case ave/10 is
   when 0..5 => return "F";
   when 6 => return "D";
   when 7 => return "C";
   when 8 => return "B";
   when 9 | 10 => return "A";
   when others => return "Invalid_input";
   end case;
end letter_grade;

begin                                          
   Put("Enter your an integer average: ");           -- Prompt for input    
   Get(ave);                                    -- Input
   Put( letter_grade(ave) );                       -- Convert and output
   New_Line;
end letterGrade;


