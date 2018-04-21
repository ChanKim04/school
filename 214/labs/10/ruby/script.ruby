Script started on 2018-04-20 05:12:15-0400
]0;chan@chan:~/Sources/school/214/labs/10/ruby[chan@chan ruby]$ cat Birds.rb 
# birds.rb | Tests out the menagerie of bird classes.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Chan Kim (ck45)
# Date: 4/20/2018
######################################################

require './Bird.rb'
require './Duck.rb'
require './Goose.rb'
require './Owl.rb'

puts "\nWelcome to the Bird Park!\n\n"

bird0 = Bird.new "Hawkeye"
bird0.print

bird1 = Duck.new "Donald"
bird1.print

bird2 = Goose.new "Mother"
bird2.print

bird3 = Owl.new "Woodsey"
bird3.print

puts "\n\n"]0;chan@chan:~/Sources/school/214/labs/10/ruby[chan@chan ruby]$ cat Bird.rb 
# Bird.rb | Defines a Bird superclass 
#   to be extended by specific bird sub-classes.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Chan Kim (ck45)
# Date: 4/20/2018
####################################################

class Bird

    attr_reader :name
  
    def initialize(name)
      @name = name
    end

    def call
        'Squaaaaaaawk!'
    end
    
    def className
        self.class.to_s
    end
    
    def print
        puts name + className + " says " + call
    end

  end]0;chan@chan:~/Sources/school/214/labs/10/ruby[chan@chan ruby]$ cat Duck.rb 
# Duck.rb | Defines the Duck class which inherits attributes and methods
#   from the Bird superclass.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Chan Kim (ck45)
# Date: 4/20/2018
####################################################

require './Bird.rb'

class Duck < Bird

    def call
        'Quack!'
    end

end]0;chan@chan:~/Sources/school/214/labs/10/ruby[chan@chan ruby]$ cat Goose.rb 
# Goose.rb | Defines the Goose class which inherits attributes and methods
#   from the Bird superclass.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Chan Kim (ck45)
# Date: 4/20/2018
####################################################

require './Bird.rb'

class Goose < Bird

    def call
        'Honk!'
    end

end]0;chan@chan:~/Sources/school/214/labs/10/ruby[chan@chan ruby]$ cat O[K[K Owl.rb 
# Owl.rb | Defines the Owl class which inherits attributes and methods
#   from the Bird superclass.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Chan Kim (ck45)
# Date: 4/20/2018
####################################################

require './Bird.rb'

class Owl < Bird

    def call
        'Whoo-hoo'
    end

end]0;chan@chan:~/Sources/school/214/labs/10/ruby[chan@chan ruby]$ ruby Birds.rb 

Welcome to the Bird Park!

HawkeyeBird says Squaaaaaaawk!
DonaldDuck says Quack!
MotherGoose says Honk!
WoodseyOwl says Whoo-hoo


]0;chan@chan:~/Sources/school/214/labs/10/ruby[chan@chan ruby]$ exit
exit

Script done on 2018-04-20 05:12:50-0400
