"yearCodes.sm converts year-strings to their numeric codes.
  Author: Prof. Adams
  Date: 
  Purpose: CS 214 at Calvin College."

| year code |
"get a year-string and display the equivalent code"

year := FillInTheBlank request: 'Enter the your academic year: '
                initialAnswer: 'freshman'.

code := year asYearCode.
 
Transcript clear; cr; 
             show: 'The academic code for ',
                        year,
                        ' is ',
                        code;
             cr.

