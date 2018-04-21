Script started on Wed 04 Apr 2018 12:13:30 AM EDT
ck45@cs-ssh:~/school/214/labs/08/ruby$ exitgit push origin master[1Pcommit -m "hello"add .[K[4Pcd ..[3Plscd school/214/labs/ls[Kcdp -r 08 /home/ck45/school/214/labs/ls[K[18@cd /home/cs/214/labsa2ps proj07-results cd /home/cs/214/labsls[Kcp -r 08 /home/ck45/school/214/labs/d[Klscd school/214/labs/ls[Kcd ..[4@git add .commit -m "hello"push origin masterexit[K[Krby   ruby Name.rb 
ck45@cs-ssh:~/school/214/labs/08/ruby$ ruby nameTester.rb 
John Paul Jones
All tests passed!
ck45@cs-ssh:~/school/214/labs/08/ruby$ cat Name.rb 
# Name.rb implements class Name.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Chan Kim (ck45)
# Date: 4/4/2018
####################################################

module Names

    class Name

        def initialize(first, middle, last)
            @first, @middle, @last = first, middle, last
        end

        attr_reader :first, :middle, :last

        def fullName
            @first + " " + @middle + " " + @last
        end

        def print
            puts fullName
            fullName
        end
    end
endck45@cs-ssh:~/school/214/labs/08/ruby$ cat nameTester.rb 
# nameTester.rb tests class Name and its operations
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Chan Kim (ck45)
# Date: 4/4/2018
####################################################

require './Name.rb'
require 'test/unit/assertions'
include Test::Unit::Assertions

def testName
   name = Names::Name.new("John", "Paul", "Jones")

   assert name.first == "John", 
           "first failed"
   assert name.middle == "Paul",
           "middle failed"
   assert name.last == "Jones",
           "last failed"
   assert name.fullName == "John Paul Jones",
           "fullName failed"
   assert name.print == "John Paul Jones",
           "print failed"
   
   print "All tests passed!\n"
end

testName

ck45@cs-ssh:~/school/214/labs/08/ruby$ exit
exit

Script done on Wed 04 Apr 2018 12:14:02 AM EDT
