Script started on Tue 03 Apr 2018 04:12:50 AM EDT
ck45@cs-ssh:~/school/214/labs/07$ ls
Makefile    name_tester      name_tester.ali   #nameTester.el#	NameTester.java  NameTester.rb	script.ada    script.java
Name.class  name_tester.adb  NameTester.class  nameTester.el	name_tester.o	 old		script.elisp  script.ruby
ck45@cs-ssh:~/school/214/labs/07$ cat NameTester.rb
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
end

def testName
   name = Name.new("John", "Paul", "Jones")
   assert name.first == "John", "first failed"
   assert name.middle == "Paul", "middle failed"
   assert name.last == "Jones", "last failed"
   assert name.fullName == "John Paul Jones", "fullName failed"
   assert name.print == "John Paul Jones", "print failed"
   print "All tests passed!\n"
end

testName

ck45@cs-ssh:~/school/214/labs/07$ ruby NameTester.rb
John Paul Jones
All tests passed!
ck45@cs-ssh:~/school/214/labs/07$ exit
exit

Script done on Tue 03 Apr 2018 04:13:12 AM EDT
