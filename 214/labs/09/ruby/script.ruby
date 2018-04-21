Script started on 2018-04-12 20:27:22-0400
]0;chan@chan:~/Sources/school/214/labs/09/ruby[chan@chan ruby]$ ls
List.rb  max.rb  script.ruby
]0;chan@chan:~/Sources/school/214/labs/09/ruby[chan@chan ruby]$ cat l[KList.rb 
# List.rb implements a linked list structure in Ruby.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Chan Kim (ck45)
# Date: 4/13/2018
#######################################################

require 'test/unit/assertions'
include Test::Unit::Assertions

class List

   # initialize a List to be empty
   # Postcondition: first == nil and last == nil and length == 0

   # Replace this line with a List constructor definition
    def initialize
        @first = nil
        @last = nil
        @length = 0
    end

   # create reader method for length

   # Replace this line with a statement to define a 'length' reader method
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

   # Replace this line with a definition for method 'print'
    def print
        temp = @first
        while !temp.nil?
            printf " #{temp.value}"
            temp = temp.next
        end
    end

   # find my maximum item
   # Return: my maximum item

   # Replace this line with a definition for method 'max'
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

   # Replace this line with a declaration for class Node
   #  (and its methods)
   class Node
        def initialize(item, link)
            @value = item
            @next = link
        end

        attr_reader :value
        attr_accessor :next
    end

end

]0;chan@chan:~/Sources/school/214/labs/09/ruby[chan@chan ruby]$ cat max.rb 
# max.rb tests a Ruby linked list.
#
# Begun by: Dr. Adams for CS 214 at Calvin College.
# Completed by: Chan Kim (ck45)
# Date: 4/13/2018

require './List'

list1 = List.new
list2 = List.new
list3 = List.new

list1.append(99).append(88).append(77).append(66).append(55)
list2.append(55).append(66).append(77).append(88).append(99)
list3.append(55).append(77).append(99).append(88).append(66)

list1.print 
puts
puts "Maximum of list1: #{list1.max}"

list2.print 
puts
puts "Maximum of list2: #{list2.max}"

list3.print 
puts
puts "Maximum of list3: #{list3.max}"

]0;chan@chan:~/Sources/school/214/labs/09/ruby[chan@chan ruby]$ ls
List.rb  max.rb  script.ruby
]0;chan@chan:~/Sources/school/214/labs/09/ruby[chan@chan ruby]$ ruby max.rb 
[1mTraceback [m(most recent call last):
	5: from max.rb:7:in `<main>'
	4: from /usr/lib/ruby/2.5.0/rubygems/core_ext/kernel_require.rb:59:in `require'
	3: from /usr/lib/ruby/2.5.0/rubygems/core_ext/kernel_require.rb:59:in `require'
	2: from /home/chan/Sources/school/214/labs/09/ruby/List.rb:8:in `<top (required)>'
	1: from /usr/lib/ruby/2.5.0/rubygems/core_ext/kernel_require.rb:59:in `require'
/usr/lib/ruby/2.5.0/rubygems/core_ext/kernel_require.rb:59:in `require': [1mcannot load such file -- test/unit/assertions ([4;1mLoadError[m[1m)
[m]0;chan@chan:~/Sources/school/214/labs/09/ruby[chan@chan ruby]$ exit
exit

Script done on 2018-04-12 20:27:43-0400
