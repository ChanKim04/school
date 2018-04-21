Script started on 2018-02-23 04:41:58-0500
]0;chan@chan:~/Sources/school/214/labs/04[chan@chan 04]$ cat log_table.
log_table.adb  log_table.ali  log_table.o    
[chan@chan 04]$ cat log_table.adb
-- log_table.adb computes a table of logarithms.
--
-- Input: start, stop, increment, three reals.
-- Precondition: increment is positive.
-- Output: A table of logarithms beginning with log(start),
--         ending with log(stop), with intervals of increment.
--
-- Begun by: Prof. Adams, for CS 214 at Calvin College.
-- Completed by: Chan Kim (ck45)
--------------------------------------------------------------

with Ada.Text_IO, Ada.Float_Text_IO, Ada.Numerics.Elementary_Functions;
use  Ada.Text_IO, Ada.Float_Text_IO, Ada.Numerics.Elementary_Functions;

procedure log_table is

   Start, Stop, Increment: Float;

begin                                           -- Prompt for input
   Put_Line("To print a table of logarithms,");
   Put(" enter the start, stop, and increment values: ");
   Get(Start); Get(Stop); Get(Increment);

   -- Replace this line with a loop to generate the table of logs.
while Start<=Stop loop
    Put("The logarithm of ");
    Put(Start);
    Put(" is ");
    Put(Log(Start, Base => 10.0));
    Put_Line("");
    Start := Start + Increment;
end loop;
end log_table;

]0;chan@chan:~/Sources/school/214/labs/04[chan@chan 04]$ cat log_table.adbexit[Kssh2sfile mystery[6@readelf -a[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[Cobjdump -a mystery1[3Pmystery1-a mystery1[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[1Preadelf -a mystery[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[6Pfile[C[C[C[C[C[C[C[C[7Pssh2s[1Pexitcat log_table.adb[Kg[Kgnatmake log_table.adb 
gnatmake: "log_table" up to date.
]0;chan@chan:~/Sources/school/214/labs/04[chan@chan 04]$ ./log_table 
To print a table of logarithms,
 enter the start, stop, and increment values: 1 10 0.5
The logarithm of  1.00000E+00 is  0.00000E+00
The logarithm of  1.50000E+00 is  1.76091E-01
The logarithm of  2.00000E+00 is  3.01030E-01
The logarithm of  2.50000E+00 is  3.97940E-01
The logarithm of  3.00000E+00 is  4.77121E-01
The logarithm of  3.50000E+00 is  5.44068E-01
The logarithm of  4.00000E+00 is  6.02060E-01
The logarithm of  4.50000E+00 is  6.53212E-01
The logarithm of  5.00000E+00 is  6.98970E-01
The logarithm of  5.50000E+00 is  7.40363E-01
The logarithm of  6.00000E+00 is  7.78151E-01
The logarithm of  6.50000E+00 is  8.12913E-01
The logarithm of  7.00000E+00 is  8.45098E-01
The logarithm of  7.50000E+00 is  8.75061E-01
The logarithm of  8.00000E+00 is  9.03090E-01
The logarithm of  8.50000E+00 is  9.29419E-01
The logarithm of  9.00000E+00 is  9.54243E-01
The logarithm of  9.50000E+00 is  9.77724E-01
The logarithm of  1.00000E+01 is  1.00000E+00
]0;chan@chan:~/Sources/school/214/labs/04[chan@chan 04]$ exit
exit

Script done on 2018-02-23 04:43:17-0500
