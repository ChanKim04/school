Script started on 2018-02-24 23:32:47-0500
]0;chan@chan:~/Sources/school/214/projects/04[chan@chan 04]$ cat factorial.rb 
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
 
 ]0;chan@chan:~/Sources/school/214/projects/04[chan@chan 04]$ ruby factorial.rb 
To compute n!, enter n: 2
2.0! = 2.0
]0;chan@chan:~/Sources/school/214/projects/04[chan@chan 04]$ ruby factorial.rb 
To compute n!, enter n: 3 1
1.0! = 1.0
]0;chan@chan:~/Sources/school/214/projects/04[chan@chan 04]$ ruby factorial.rb 
To compute n!, enter n: 3
3.0! = 6.0
]0;chan@chan:~/Sources/school/214/projects/04[chan@chan 04]$ 
]0;chan@chan:~/Sources/school/214/projects/04[chan@chan 04]$ ruby factorial.rb 
To compute n!, enter n: 44 
4.0! = 24.0
]0;chan@chan:~/Sources/school/214/projects/04[chan@chan 04]$ ruby factorial.rb 
To compute n!, enter n: 5
5.0! = 120.0
]0;chan@chan:~/Sources/school/214/projects/04[chan@chan 04]$ ruby factorial.rb 
To compute n!, enter n: 6
6.0! = 720.0
]0;chan@chan:~/Sources/school/214/projects/04[chan@chan 04]$ ruby factorial.rb 
To compute n!, enter n: 7
7.0! = 5040.0
]0;chan@chan:~/Sources/school/214/projects/04[chan@chan 04]$ exit
exit

Script done on 2018-02-24 23:33:28-0500
