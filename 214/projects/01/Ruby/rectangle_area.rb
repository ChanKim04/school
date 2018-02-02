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
