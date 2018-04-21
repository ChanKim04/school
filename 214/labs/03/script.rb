Script started on 2018-02-16 09:42:53-0500
]0;chan@chan:~/Sources/school/214/labs/03[chan@chan 03]$ cat year_codes.rb
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

]0;chan@chan:~/Sources/school/214/labs/03[chan@chan 03]$ ruby year_codes.rb
Enter the year: freshman
Numeric code is: 1
]0;chan@chan:~/Sources/school/214/labs/03[chan@chan 03]$ ruby year_codes.rb
Enter the year: sophomore
Numeric code is: 2
]0;chan@chan:~/Sources/school/214/labs/03[chan@chan 03]$ ruby year_codes.rb
Enter the year: junior
Numeric code is: 3
]0;chan@chan:~/Sources/school/214/labs/03[chan@chan 03]$ ruby year_codes.rb
Enter the year: senior
Numeric code is: 4
]0;chan@chan:~/Sources/school/214/labs/03[chan@chan 03]$ ruby year_codes.rb
Enter the year: supersenior
Numeric code is: 4
]0;chan@chan:~/Sources/school/214/labs/03[chan@chan 03]$ ruby year_codes.rb
Enter the year: a
Numeric code is: 
]0;chan@chan:~/Sources/school/214/labs/03[chan@chan 03]$ exit
exit

Script done on 2018-02-16 09:43:56-0500
