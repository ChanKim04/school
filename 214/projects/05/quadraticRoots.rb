# quadraticRoots.rb is a class and program that computes the quadratic formula
# and gives two roots. If the values are invalid, it gives messages.
#
# Completed by: Chan Kim (ck45), for CS 214 at Calvin College.
#################################################################


# quadraticRoots() computes the quadratic formula 
# Receive: 	a - the first part of equation 
#           b - the sum of outer & inner part of equation    
#           c -  the last part of equation
# PRE: a, b, and c are number.
# Return: an array of numbers in which to place results
######################################################

def quadraticRoots(a, b, c)
    results = []
    if a != 0

        arg = ((b ** 2) - 4 * a * c)
   
                           if arg >= 0
                                    results[0] = (-b + Math.sqrt(arg)) / (2 * a)
                                    results[1] = (-b - Math.sqrt(arg)) / (2 * a)
                                    results
                           else
                                    $stderr.puts "\n*** quadraticRoots(): b^2 - 4ac is negative!"
                                    results = [0.0, 0.0] 
                           end 
   
      else $stderr.puts "\n*** quadraticRoots(): a is zero!"
        results = [0.0, 0.0] 
      end 
  end
  
  def main
    print "\nGiven an equation of the form: y = ax^2 + bx + c";
    print "\nEnter a(first): "; 
    a = gets.to_f
    print "\nEnter b(sum of outer & inner): "; 
    b = gets.to_f
    print "\nEnter c(last): "
    c = gets.to_f
    results = quadraticRoots(a, b, c)
    print "\nThe one root of the equation is #{results[0]}"
    print "\nand the other root is #{results[1]}\n"
  end
  
  main
  