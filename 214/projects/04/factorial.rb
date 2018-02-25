#! /usr/bin/ruby
# factorial.rb computes a factorial.
#
# Completed by: Chan Kim(ck45)
#
# Input:  n, one integer.
# Precondition: n >= 0
# Output: A factorial from n inputted value.


if __FILE__ == $0
    print "To compute n!, enter n: "
     n = gets.chomp.to_f
    
    answer = 1.0
    # for loop to compute a factorial
     for i in 2..n
        answer *= i
     end
     # output the result of the factorial
     puts "#{n}! = #{answer}"

 end
 
 