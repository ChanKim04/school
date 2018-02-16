#! /usr/bin/ruby
# year_codes.rb translates an academic year into a numeric code
# Begun by: Dr. Nelesen, for CS 214 at Calvin College
# Completed by: Chan Kim(ck45)
# Date: 2/16/2018
################################################################

# Input:  The name of an academic year
# Precondition: The academic year is a string with a value of freshman, 
#   sophomore, junior or senior
# Output: The corresponding integer code for the given academic year

#  Replace this line with the definition of function yearCode() 
def yearCode(year)
    if year =~ /freshman/ then
        1
    elsif year =~ /sophomore/ then
        2
    elsif year =~ /junior/ then
        3
    elsif year =~ /senior/ then
        return 4
    end
end

if __FILE__ == $0
   print "Enter the year: "
   year = gets
   print "Numeric code is: "
   puts yearCode(year)
end

