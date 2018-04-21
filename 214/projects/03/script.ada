Script started on 2018-02-18 21:51:15-0500
]0;chan@chan:~/Sources/school/214/projects/03[chan@chan 03]$ cat letterGrade.a
letterGrade.adb  letterGrade.ali  
[chan@chan 03]$ cat letterGrade.adb
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


]0;chan@chan:~/Sources/school/214/projects/03[chan@chan 03]$ gnatmake letterGrade.adb 
gcc -c letterGrade.adb
letterGrade.adb:14:11: warning: file name does not match unit name, should be "lettergrade.adb"
gnatbind -x letterGrade.ali
gnatlink letterGrade.ali
]0;chan@chan:~/Sources/school/214/projects/03[chan@chan 03]$ rm[K[Kls
[0m[01;32mletterGrade[0m      letterGrade.ali    letterGrade.el   LetterGrade.java  letterGrade.rb  script.java
letterGrade.adb  LetterGrade.class  letterGrade.el~  letterGrade.o     script.ada
]0;chan@chan:~/Sources/school/214/projects/03[chan@chan 03]$ l[K./letterGrade 
Enter your an integer average: 100
A
]0;chan@chan:~/Sources/school/214/projects/03[chan@chan 03]$ ./letterGrade 
Enter your an integer average: 89
B
]0;chan@chan:~/Sources/school/214/projects/03[chan@chan 03]$ ./letterGrade 
Enter your an integer average: 79
C
]0;chan@chan:~/Sources/school/214/projects/03[chan@chan 03]$ ./letterGrade 
Enter your an integer average: 69
D
]0;chan@chan:~/Sources/school/214/projects/03[chan@chan 03]$ ./letterGrade 
Enter your an integer average: 59
F
]0;chan@chan:~/Sources/school/214/projects/03[chan@chan 03]$ ./letterGrade 
Enter your an integer average: 0
F
]0;chan@chan:~/Sources/school/214/projects/03[chan@chan 03]$ ./letterGrade 
Enter your an integer average: 200
Invalid_input
]0;chan@chan:~/Sources/school/214/projects/03[chan@chan 03]$ exit
exit

Script done on 2018-02-18 21:52:36-0500
