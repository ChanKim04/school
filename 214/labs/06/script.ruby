Script started on 2018-03-17 00:30:02-0400
]0;chan@chan:~/Sources/school/214/labs/06[chan@chan 06]$ ca[K[Kruby average.rb
sum 0 is: 0.0
sum 1 is: 30.0
average 0 is: 0.0
average 1 is: 7.5
]0;chan@chan:~/Sources/school/214/labs/06[chan@chan 06]$ cat average.rb
# average.rb averages the values of an array of doubles.
# Precondition: theArray is an array of numbers
# Output: the average of the values in theArray
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Chan Kim (ck45)
# Date: 3/14/2018
########################################################

###############################################
# sum() sums the values in an array
# Receive: anArray, an array of numbers
# Return: the sum of the values in anArray.
################################################

# Define sum() method here
def sum (theArray)
    total = 0.0
    i = 0
    until i >= theArray.size
        total += theArray[i]
        i += 1
    end
    return total
end
# Document and define average() method here
def average (anArray)
    if (anArray.length <= 0)
        return 0.0;
      else
        return sum(anArray) / anArray.length;
    end
end

def main
   # Define array0 as an Array containing no values
   array0 = Array.new []
   array1 = Array.new [9.0, 8.0, 7.0, 6.0]
   # Define array1 as an Array containing 9.0, 8.0, 7.0, 6.0

   puts "sum 0 is: #{ sum(array0) }\n"
   puts "sum 1 is: #{ sum(array1) }\n"

   puts "average 0 is: #{ average(array0) }\n"
   puts "average 1 is: #{ average(array1) }\n"
end

main

]0;chan@chan:~/Sources/school/214/labs/06[chan@chan 06]$ exit
exit

Script done on 2018-03-17 00:30:17-0400
