Script started on 2018-01-30 22:27:32-0500
]0;chan@chan:~/Sources/school/214/labs/01/Ruby[chan@chan Ruby]$ ls
circle_area.rb  circle_area.rb~  script.ruby
]0;chan@chan:~/Sources/school/214/labs/01/Ruby[chan@chan Ruby]$ cat circle_area.rb
#! /usr/bin/ruby
# circle_area.rb computes the area of a circle given its radius
# 
# Input: the radius of a circle
# Precondition: the radius is not negative
# Output: the area of the circle.
#
# Begun by: Prof. Adams, for CS 214 at Calvin College.
# Completed by: Chan Kim (ck45)
# Date: 1/31/2018
###############################################################

# function circleArea returns a circle's area, given its radius
# Parameters: r, a number
# Precondition: r > 0.
# Returns: the area of a circle whose radius is r.
PI = 3.1415927
def circleArea(r)
    PI * r ** 2 # an expression for the circle area
end
# main program
if __FILE__ == $0
  # prompt for radius
   puts "To compute the area of a circle,"
   print " enter its radius: "
   # Get the number form the user
   radius = gets.chomp.to_f
   # output area
   print "The circle's area is: "
   puts circleArea(radius)
end
]0;chan@chan:~/Sources/school/214/labs/01/Ruby[chan@chan Ruby]$ ruby circle_area.rb
To compute the area of a circle,
 enter its radius: 1
The circle's area is: 3.1415927
]0;chan@chan:~/Sources/school/214/labs/01/Ruby[chan@chan Ruby]$ ruby circle_area.rb
To compute the area of a circle,
 enter its radius: 2
The circle's area is: 12.5663708
]0;chan@chan:~/Sources/school/214/labs/01/Ruby[chan@chan Ruby]$ ruby circle_area.rb
To compute the area of a circle,
 enter its radius: 2.5
The circle's area is: 19.634954375
]0;chan@chan:~/Sources/school/214/labs/01/Ruby[chan@chan Ruby]$ ruby circle_area.rb
To compute the area of a circle,
 enter its radius: 4.99999
The circle's area is: 78.53950334104417
]0;chan@chan:~/Sources/school/214/labs/01/Ruby[chan@chan Ruby]$ exit
exit

Script done on 2018-01-30 22:28:16-0500
