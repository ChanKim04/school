Script started on 2018-03-02 09:24:26-0500
]0;chan@chan:~/Sources/school/214/labs/05[chan@chan 05]$ ca[K[Kls
Makefile  script.ada    script.ruby  split.adb  Split.class  [0m[01;32mSplit.java[0m  split.rb
[01;34mold[0m       script.elisp  [01;32msplit[0m        split.ali  split.el     split.o
]0;chan@chan:~/Sources/school/214/labs/05[chan@chan 05]$ cat split.adb
-- split.adb splits an input string about a specified position.
--
-- Input: Astring, a string,
--        Pos, an integer.
-- Precondition: pos is in Astring'Range.
-- Output: The substrings Astring(Astring'First..Pos-1) and
--                        Astring(Pos..Astring'Last).
--
-- Begun by: Dr. Adams, for CS 214 at Calvin College.
-- Completed by: Chan Kim (ck45)
-- Date: 3/2/2018
--------------------------------------------------------------

with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Strings.Fixed;
use  Ada.Text_IO, Ada.Integer_Text_IO, Ada.Strings.Fixed;

procedure split is

   EMPTY_STRING : String := "                                        ";

   Astring, Part1, Part2 : String  := EMPTY_STRING;
   Pos, Chars_read       : Natural;

   ------------------------------------------------
   --  split() splits a string in two.           
   -- Receive: The_String, the string to be split,
   --          Position, the split index.        
   -- PRE: 0 < Position <= The_String.length(). 
   --     (Ada arrays are 1-relative by default)
   -- Passback: First_Part - the first substring,
   --           Last_Part - the second substring.
   ------------------------------------------------
   -- Replace this line with definition of split() 
procedure Split(The_String: in string; Position: in integer; First_Part: out string; Last_Part: out string) is
    begin
    Move(The_String(The_String'First .. Position), First_Part);
    Move(The_String(Position+1 .. The_String'Last), Last_Part);
    end Split;

begin                                           -- Prompt for input
   Put("To split a string, enter the string: ");
   Get_Line(Astring, Chars_Read);
   Put("Enter the split position: ");
   Get(Pos);

   split(Astring, Pos, Part1, Part2);

   Put("The first part is ");
   Put_Line(Part1);
   Put(" and the second part is ");
   Put_Line(Part2);

end split;

]0;chan@chan:~/Sources/school/214/labs/05[chan@chan 05]$ gnatmake split.adb 
gcc -c split.adb
gnatbind -x split.ali
gnatlink split.ali
]0;chan@chan:~/Sources/school/214/labs/05[chan@chan 05]$ ./split 
To split a string, enter the string: hello
Enter the split position: 5
The first part is hello                                   
 and the second part is                                         
]0;chan@chan:~/Sources/school/214/labs/05[chan@chan 05]$ ./split 
To split a string, enter the string: 3
Enter the split position: ^C
]0;chan@chan:~/Sources/school/214/labs/05[chan@chan 05]$ ./split 
To split a string, enter the string: hello
Enter the split position: 3
The first part is hel                                     
 and the second part is lo                                      
]0;chan@chan:~/Sources/school/214/labs/05[chan@chan 05]$ ./split 
To split a string, enter the string: hello
Enter the split position: 0
The first part is                                         
 and the second part is hello                                   
]0;chan@chan:~/Sources/school/214/labs/05[chan@chan 05]$ exit
exit

Script done on 2018-03-02 09:25:38-0500
