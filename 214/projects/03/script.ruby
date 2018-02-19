Script started on 2018-02-18 21:53:01-0500
]0;chan@chan:~/Sources/school/214/projects/03[chan@chan 03]$ cat letterGrade.rb
#! /usr/bin/ruby
# letterGrade.rb translates an average score into a letter grade
# Completed by: Chan Kim(ck45)
# Date: 2/16/2018
################################################################

# Input:  average, an integer.
# Precondition: an average score.
# Output: the letter grade(A, B, C, D, F) corresponding to average.

def letterGrade(ave)
    case ave/10
    when 0..5 then
        'F'
    when 6 then
        'D'
    when 7 then
        'C'
    when 8 then
        'B'
    when 9..10 then
        'A'
    else
        'Invalid value'
    end
end

if __FILE__ == $0
   print "Enter the average: "
   year = gets.to_i
   print "Letter grade is: "
   puts letterGrade(year)
end

]0;chan@chan:~/Sources/school/214/projects/03[chan@chan 03]$ ruby letterGrade.rb
Enter the average: 100
Letter grade is: A
]0;chan@chan:~/Sources/school/214/projects/03[chan@chan 03]$ ruby letterGrade.rb
Enter the average: 89
Letter grade is: B
]0;chan@chan:~/Sources/school/214/projects/03[chan@chan 03]$ ruby letterGrade.rb
Enter the average: 79
Letter grade is: C
]0;chan@chan:~/Sources/school/214/projects/03[chan@chan 03]$ ruby letterGrade.rb
Enter the average: 69
Letter grade is: D
]0;chan@chan:~/Sources/school/214/projects/03[chan@chan 03]$ ruby letterGrade.rb
Enter the average: 59
Letter grade is: F
]0;chan@chan:~/Sources/school/214/projects/03[chan@chan 03]$ ruby letterGrade.rb
Enter the average: 0
Letter grade is: F
]0;chan@chan:~/Sources/school/214/projects/03[chan@chan 03]$ ruby letterGrade.rb
Enter the average: 200
Letter grade is: Invalid value
]0;chan@chan:~/Sources/school/214/projects/03[chan@chan 03]$ exit
exit

Script done on 2018-02-18 21:53:40-0500
