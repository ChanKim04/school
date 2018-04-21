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

