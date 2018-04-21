Script started on Mon 16 Apr 2018 12:00:03 PM EDT
ck45@cs-ssh:~/school/214/projects/09/ruby$ cat l List.rb 
# List.rb implements a linked list structure in Ruby.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Chan Kim (ck45)
# Date: 4/16/2018
#######################################################

require 'test/unit/assertions'
include Test::Unit::Assertions

class List

   # initialize a List to be empty
   # Postcondition: first == nil and last == nil and length == 0
    def initialize
        @first = nil
        @last = nil
        @length = 0
    end

   # create reader method for length
    attr_reader :length

   # Am I empty?
   # Return: length == 0
    def empty?
        @length == 0
    end
  
   # append a value to me
   # Receive: value, the item to be appended
   # Postcondition: my last item is value and
   #                 my length is one more than it was
   def append(value)
      newNode = Node.new(value, nil)

      if empty?
         @first = newNode
      else
         @last.next = newNode      
      end

      @last = newNode
      @length += 1
      self
   end


   # print my items
   # Postcondition: my items have been displayed to the screen
    def print
        temp = @first
        while !temp.nil?
            printf " #{temp.value}"
            temp = temp.next
        end
    end

   # find my maximum item
   # Return: my maximum item
    def max
        temp = @first
        maxValue = -999999
        while !temp.nil?
            if temp.value > maxValue
                maxValue = temp.value
            end
            temp = temp.next
        end
        return maxValue
    end

   # Receive: aValue, an integer.
   # Return: the position of aValue within aList, if aValue is present in aList;
   #        -1, otherwise.    
    def search(value)
        temp = @first
        count = 0
        while !temp.nil?
            if temp.value == value
                return count
            end
            temp = temp.next
            count += 1
        end
        return -1
    end


   # a declaration for class Node and its methods
   class Node
        def initialize(item, link)
            @value = item
            @next = link
        end
        attr_reader :value
        attr_accessor :next
    end

end

ck45@cs-ssh:~/school/214/projects/09/ruby$ cat max.rb 
# max.rb tests a Ruby linked list.
#
# Begun by: Dr. Adams for CS 214 at Calvin College.
# Completed by: Chan Kim (ck45)
# Date: 4/16/2018

require './List'

list1 = List.new
list2 = List.new
list3 = List.new
list4 = List.new

list1.append(99).append(88).append(77).append(66).append(55)
list2.append(55).append(66).append(77).append(88).append(99)
list3.append(55).append(77).append(99).append(88).append(66)
list4.append(44).append(55).append(66).append(77).append(88)

list1.print 
puts
puts "Maximum of list1: #{list1.max}"
puts
puts "The position of 99 within list1: #{list1.search(99)}"

list2.print 
puts
puts "Maximum of list2: #{list2.max}"
puts
puts "The position of 99 within list2: #{list2.search(99)}"

list3.print 
puts
puts "Maximum of list3: #{list3.max}"
puts
puts "The position of 99 within list3: #{list3.search(99)}"

list4.print 
puts
puts "Maximum of list4: #{list4.max}"
puts
puts "The position of 99 within list4: #{list4.search(99)}"

ck45@cs-ssh:~/school/214/projects/09/ruby$ ruby max.rb 
 99 88 77 66 55
Maximum of list1: 99

The position of 99 within list1: 0
 55 66 77 88 99
Maximum of list2: 99

The position of 99 within list2: 4
 55 77 99 88 66
Maximum of list3: 99

The position of 99 within list3: 2
 44 55 66 77 88
Maximum of list4: 88

The position of 99 within list4: -1
ck45@cs-ssh:~/school/214/projects/09/ruby$ exit
exit

Script done on Mon 16 Apr 2018 12:00:26 PM EDT
