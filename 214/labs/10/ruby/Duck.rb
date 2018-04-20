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

end