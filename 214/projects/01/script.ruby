Script started on 2018-02-01 22:34:15-0500
]0;chan@chan:~/Sources/school/214/projects/01/Ruby[chan@chan Ruby]$ cat rectangle_area.rb [K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[Kls
rectangle_area.rb  script.ruby
]0;chan@chan:~/Sources/school/214/projects/01/Ruby[chan@chan Ruby]$ cat rectangle_area.rb 
#! /usr/bin/ruby
# rectangle_area.rb computes the area of a rectangle given its width and height
# 
# Input: the width and height of a rectangle
# Precondition: the width and height are not negative
# Output: the area of the rectangle.
#
# Begun by: Chan Kim, for CS 214 at Calvin College.
# Completed by: Chan Kim (ck45)
# Date: 1/31/2018
###############################################################

# function rectangleArea returns a rectangle's area, given its width and height
# Parameters: w and h, a number
# Precondition: w and h > 0.
# Returns: the area of a rectangle whose width and height are w and h.
def rectangleArea(w, h)
    w * h
end

if __FILE__ == $0
   puts "To compute the area of a circle,"
   print " enter its width: "
   width = gets.chomp.to_f
   print " enter its height: "
   height = gets.chomp.to_f
   print "The rectangle's area is: "
   puts rectangleArea(width, height)
end
]0;chan@chan:~/Sources/school/214/projects/01/Ruby[chan@chan Ruby]$ ruby rectangle_area.rb 
To compute the area of a circle,
 enter its width: 1
 enter its height: 2
The rectangle's area is: 2.0
]0;chan@chan:~/Sources/school/214/projects/01/Ruby[chan@chan Ruby]$ ruby rectangle_area.rb 
To compute the area of a circle,
 enter its width: 2
 enter its height: 2
The rectangle's area is: 4.0
]0;chan@chan:~/Sources/school/214/projects/01/Ruby[chan@chan Ruby]$ ruby rectangle_area.rb 
To compute the area of a circle,
 enter its width: 2
 enter its height: 3
The rectangle's area is: 6.0
]0;chan@chan:~/Sources/school/214/projects/01/Ruby[chan@chan Ruby]$ exit
exit

Script done on 2018-02-01 22:35:30-0500
