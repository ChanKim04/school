Script started on 2018-02-16 09:51:45-0500
]0;chan@chan:~/Sources/school/214/labs/03[chan@chan 03]$ cat year_codes.a
year_codes.adb  year_codes.ali  
[chan@chan 03]$ cat year_codes.adb
-- year_codes.adb converts academic year codes to corresponding years.
--
-- Begun by: Dr. Adams, for CS 214 at Calvin College.
-- Completed by: Chan Kim(ck45)
-- Date: 2/16/2018
--
-- Input: year, a string
-- Precondition: year is one of "freshman", "sophomore", "junior", "senior"
-- Output: The year code (1, 2, 3 or 4) corresponding to year.
----------------------------------------------------

with Ada.Text_IO, Ada.Integer_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO;

procedure year_codes is

   year : String(1..9) := "         ";
   charsRead : Natural;

   -- replace this comment with the definition of yearCode()
function yearCode(year: in String) return String is
begin
   if year = "freshman " then
        return "1";
        elsif year = "sophomore" then
            return "2";
            elsif year = "junior   " then
                return "3";
                elsif year = "senior   " then
                    return "4";
        else
             return "0";
   end if;
end yearCode;

begin                                          
   Put("Enter your academic year: ");           -- Prompt for input
   Get_Line(year, charsRead);                   -- Input
   Put( yearCode(year) );                       -- Convert and output
   New_Line;
end year_codes;


]0;chan@chan:~/Sources/school/214/labs/03[chan@chan 03]$ y[Kgnatmake year_codes.adb 
gnatmake: "year_codes" up to date.
]0;chan@chan:~/Sources/school/214/labs/03[chan@chan 03]$ ./year_codes
Enter your academic year: freshman
1
]0;chan@chan:~/Sources/school/214/labs/03[chan@chan 03]$ ./year_codes
Enter your academic year: sophomore
2
]0;chan@chan:~/Sources/school/214/labs/03[chan@chan 03]$ ./year_codes
Enter your academic year: junior
3
]0;chan@chan:~/Sources/school/214/labs/03[chan@chan 03]$ ./year_codes
Enter your academic year: senior
4
]0;chan@chan:~/Sources/school/214/labs/03[chan@chan 03]$ ./year_codes
Enter your academic year: supersenior
0
]0;chan@chan:~/Sources/school/214/labs/03[chan@chan 03]$ exit
exit

Script done on 2018-02-16 09:53:02-0500
