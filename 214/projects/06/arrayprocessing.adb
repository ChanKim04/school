-- arrayprocessing.adb "test-drives" functions readArray and printArray.
-- Precondition: get the size of the array from user.
-- Output: print the result of array.
--
-- Author: Chan Kim (ck45) for CS 214 at Calvin College
-- Date: 3/26/2018
-----------------------------------------------

with Ada.Text_IO; use Ada.Text_IO;             -- Put(String)
with Ada.Float_Text_IO; use Ada.Float_Text_IO; -- Put(Float)

procedure arrayprocessing is

-- Declare Vector type
   type Vector is array ( Positive range <>) of Float;
   itsSize : Integer;

----------------------------------------------
-- printArray() is a method that prints      -
--              the resulting array.         -
-- Receive: anArray, an array of numbers     -
-- Return: print the array.                  -
----------------------------------------------

procedure printArray(A: Vector) is 
begin 
  for I in A'Range 
  loop 
    put(A(i));
  end loop; 
end printArray; 

----------------------------------------------
-- readArray() is a method that gets values  -
--             from user and appends         -
--             the values into the array.    -
-- Receive: anArray, an array of numbers     -
-- Return: return the array.                 -
----------------------------------------------

procedure readArray(A: in out Vector) is
values : Float;
begin
    for i in A'Range
    loop
        get(values);
        A(i) := values;
    end loop;
end readArray;

begin
   Put("How many values are to be in the array?");
   get( Float(itsSize) );
   declare anArray : Vector(1..itsSize);
   begin
   Put("Enter values into the array...");
   readArray(anArray);
   Put("Print the resulting array...");
   printArray(anArray);
   New_line;
   end;
end arrayprocessing;

