Script started on 2018-02-24 23:33:45-0500
]0;chan@chan:~/Sources/school/214/projects/04[chan@chan 04]$ cat factoriala[K.a
factorial.adb  factorial.ali  
[chan@chan 04]$ cat factorial.adb 
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

]0;chan@chan:~/Sources/school/214/projects/04[chan@chan 04]$ gnatmake factorial.adb 
gcc -c factorial.adb
gnatbind -x factorial.ali
gnatlink factorial.ali
]0;chan@chan:~/Sources/school/214/projects/04[chan@chan 04]$ ./factorial 
To compute n!, enter n: 1
          1! =           1
]0;chan@chan:~/Sources/school/214/projects/04[chan@chan 04]$ ./factorial 
To compute n!, enter n: 2
          2! =           2
]0;chan@chan:~/Sources/school/214/projects/04[chan@chan 04]$ ./factorial 
To compute n!, enter n: 3
          3! =           6
]0;chan@chan:~/Sources/school/214/projects/04[chan@chan 04]$ ./factorial 
To compute n!, enter n: 4
          4! =          24
]0;chan@chan:~/Sources/school/214/projects/04[chan@chan 04]$ ./factorial 
To compute n!, enter n: 5
          5! =         120
]0;chan@chan:~/Sources/school/214/projects/04[chan@chan 04]$ ./factorial 
To compute n!, enter n: 6
          6! =         720
]0;chan@chan:~/Sources/school/214/projects/04[chan@chan 04]$ ./factorial 
To compute n!, enter n: 7
          7! =        5040
]0;chan@chan:~/Sources/school/214/projects/04[chan@chan 04]$ exit
exit

Script done on 2018-02-24 23:34:21-0500
