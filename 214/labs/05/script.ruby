Script started on 2018-03-02 09:23:36-0500
]0;chan@chan:~/Sources/school/214/labs/05[chan@chan 05]$ ls
Makefile  [0m[01;34mold[0m  script.elisp  script.ruby  [01;32msplit[0m  split.adb  split.ali  Split.class  split.el  [01;32mSplit.java[0m  split.o  split.rb
]0;chan@chan:~/Sources/school/214/labs/05[chan@chan 05]$ cat scri[K[K[K[Ksplit.rb
# split.rb splits a string into two substrings.
#
# Input: A string and an integer string position to split the string by.
# Precondition: The position integer is within the range of the string size.
# Output: The substrings aString(0, position - 1) and
#   aString(pos, length() - 1).
#
# Begun by: Prof. Adams, for CS 214 at Calvin College.
# Completed by: Chan Kim (ck45)
# Date: 3/2/2018
#################################################################


# split() splits a string into its two substrings.
# Receive: aString, the string to be split,       
#        pos, the split position.                  
# PRE: 0 <= pos < the length of aString.
# Return: the substring of aString before pos, and  
#         the substring of aString from pos onwards.
######################################################

# Replace this line with the definition of split()
def split(aString, pos)
  substrings = []
  substrings[0] = aString[0, pos]
  substrings[1] = aString[pos, aString.size]
  substrings
end


def main
  print "To split a string, enter the string: "; 
  the_string = gets
  print "Enter the split position: "; 
  position = gets.to_i
  split_string = split(the_string, position)
  puts "The first part is: " << split_string[0]
  puts "and the second part is: " << split_string[1]
end

main
]0;chan@chan:~/Sources/school/214/labs/05[chan@chan 05]$ ruby split.rb
To split a string, enter the string: helo    hello
Enter the split position: 5
The first part is: hello
and the second part is: 
]0;chan@chan:~/Sources/school/214/labs/05[chan@chan 05]$ ruby split.rb
To split a string, enter the string: hello
Enter the split position: 3
The first part is: hel
and the second part is: lo
]0;chan@chan:~/Sources/school/214/labs/05[chan@chan 05]$ ruby split.rb
To split a string, enter the string: hello
Enter the split position: 0
The first part is: 
and the second part is: hello
]0;chan@chan:~/Sources/school/214/labs/05[chan@chan 05]$ exit
exit

Script done on 2018-03-02 09:24:11-0500
