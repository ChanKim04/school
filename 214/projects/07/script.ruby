Script started on Tue 03 Apr 2018 04:28:19 AM EDT
ck45@cs-ssh:~/school/214/projects/07$ cat NameTester.rb
# NameTester.rb tests class Name and its operations
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Chan Kim (ck45)
# Date: 3/29/2018
####################################################

require 'test/unit/assertions'   # needed for assert
include Test::Unit::Assertions

# Replace this line with the declaration of class Name
class Name
    def initialize(first, middle, last)
        @first, @middle, @last = first, middle, last
    end

    attr_accessor :first, :middle, :last

    def fullName
        first + " " + middle + " " + last
    end

    def print
        puts fullName
        return fullName
    end

    #setFirst sets the first name of a name object.;
    #Receive: aFirst, a String.                       
    #Return: the new first name.    
    def setFirst(first)
        @first = first
    end

    #setMiddle sets the middle name of a name object.;
    #Receive: aMiddle, a String.                       
    #Return: the new middle name.     
    def setMiddle(middle)
        @middle = middle
    end

    #setLast sets the last name of a name object.;
    #Receive: aLast, a String.                       
    #Return: the new last name.      
    def setLast(last)
        @last = last
    end

    #lfmi returns a full name in L-F-M(the first letter) order. 
    #Return: myLast, myFirst, myMiddle[0]. 
    def lfmi
        last + ", " + first + " " + middle[0] + "."
    end

    #readName constructs(or reconstructs)            
    #a name from user inputs.               
    #Receive: first, middle and last, three strings. 
    #Return: the triplet (first middle last). 
    def read
        puts "Enter the first name...\n"
        @first = gets.chomp
        puts "Enter the middle name...\n"        
        @middle = gets.chomp
        puts "Enter the last name...\n"        
        @last = gets.chomp
    end

end

def testName
   name = Name.new("John", "Paul", "Jones")
   assert name.first == "John", "first failed"
   assert name.middle == "Paul", "middle failed"
   assert name.last == "Jones", "last failed"
   assert name.fullName == "John Paul Jones", "fullName failed"
   assert name.print == "John Paul Jones", "print failed"
    # test for the result of project 7
    name.setFirst("Dwight")
   assert name.first == "Dwight", "first failed" 
   assert name.fullName == "Dwight Paul Jones", "fullName failed"
    name.setMiddle("David")
   assert name.middle == "David", "middle failed"
   assert name.fullName == "Dwight David Jones", "fullName failed"
    name.setLast("Eisenhower")
   assert name.last == "Eisenhower", "last failed"
   assert name.fullName == "Dwight David Eisenhower", "fullName failed"
   assert name.lfmi == "Eisenhower, Dwight D.", "lfmi failed"    
    print name.lfmi + "\n"
    #  type "first" as the first name, "middle" as the middle name, and "last" as the last name for the test.
    name.read
   assert name.first == "first", "first failed"
   assert name.middle == "middle", "middle failed"
   assert name.last == "last", "last failed"
   assert name.fullName == "first middle last", "fullName failed"
   assert name.print == "first middle last", "print failed"
   print "All tests passed!\n"
end

testName

ck45@cs-ssh:~/school/214/projects/07$ ruby      s ls
Makefile    name_tester      name_tester.ali   nameTester.el   NameTester.java	NameTester.rb  script.elisp  script.ruby
Name.class  name_tester.adb  NameTester.class  nameTester.el~  name_tester.o	script.ada     script.java
ck45@cs-ssh:~/school/214/projects/07$ ruby NameTester.rb
John Paul Jones
Eisenhower, Dwight D.
Enter the first name...
first
Enter the middle name...
middle
Enter the last name...
last
first middle last
All tests passed!
ck45@cs-ssh:~/school/214/projects/07$ exit
exit

Script done on Tue 03 Apr 2018 04:28:47 AM EDT
