# array.rb is a driver for methods printArray() and readArray().
# Precondition: get the size of the array from user.
# Output: print the result of array.
#
# Author: Chan Kim (ck45) for CS 214 at Calvin College
# Date: 3/26/2018
########################################################

###############################################
# printArray() is a method that prints the resulting array.
# Receive: anArray, an array of numbers; itsSize, number
# Return: print the array.
################################################

def printArray (anArray, itsSize)
    for i in 1..itsSize
        puts anArray[i]
    end
end

###############################################
# readArray() is a method that gets values from user and appends the values into the array. 
# Receive: anArray, an array of numbers; itsSize, number
# Return: return the array.
################################################

def readArray (anArray, itsSize)
    for i in 1..itsSize
        anArray[i] = gets.chomp.to_f
    end
end

def main
    puts "How many values are to be in the array?"
    itsSize = gets.chomp.to_f
    anArray = Array.new(itsSize)
    puts "Enter values into the array...\n"
    readArray(anArray, itsSize)
    puts "Print the resulting array..."
    printArray(anArray, itsSize)
end

main

