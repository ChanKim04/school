Script started on 2018-04-16 11:51:08-0400
]0;chan@chan:~/Sources/school/214/projects/09/ada[chan@chan ada]$ ls
[0m[01;32madaMax[0m  list_package.adb  list_package.ads  list_package.ali  list_package.o  Makefile  max.adb  max.ali  max.o  script.ada
]0;chan@chan:~/Sources/school/214/projects/09/ada[chan@chan ada]$ cat list_package.ads
-- list_package.ads declares an Ada linked list and its operations.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Chan Kim (ck45)
-- Date: 4/16/2018
------------------------------------------------------------------

package List_Package is

  -- the list-type itself (public)
  type List is private;

  -----------------------------------------------------
  -- Initialize a list                                -
  -- Receive: aList, a List.                          -
  -- Pre: aList is uninitialized.                     -
  -- Post: aList%itsFirst == aList%itsLast == NULL && -
  --        aList%itsLength == 0.                     -
  -----------------------------------------------------
  procedure Init(A_List: out List);


  ------------------------------------------------
  -- Is a list empty?                            -
  -- Receive: aList, a List.                     -
  -- Return: true, iff aList contains no values. -
  ------------------------------------------------
  function Empty(A_List: in List) return Boolean;

  -------------------------------------
  -- How many values are in a list?   -
  -- Receive: aList, a List.          -
  -- Return: aList%itsLength.         -
  -------------------------------------
  function Length(A_List : in List) return Integer;


  ----------------------------------------
  -- Append a value to a list.           -
  -- Receive: aValue, an integer,        -
  -- Passback: aList, containing aValue. -
  ----------------------------------------
  procedure Append(A_Value : in Integer; A_List: in out List);


  -------------------------------------
  -- Display the values in a list.    -
  -- Receive: aList, a List.          -
  -- Output: the values in aList.     -
  -------------------------------------
  procedure Put(A_List : in List);
  ---------------------------------------
  -- Find the maximum value in a list.  -
  -- Receive: aList, a List.            -
  -- Return: the maximum value in aList.-
  ---------------------------------------
  function Max(A_List : List) return Integer;

  ---------------------------------------
  -- Receive: aList, a list of integers; and
  --          aValue, an integer.
  -- Return: the position of aValue within aList, if aValue is present in aList;
  --         -1, otherwise.
  ---------------------------------------
  function search(A_List : List; A_Value : Integer) return Integer;

 private
  type List_Node;
  type Node_Ptr is access List_Node;
  type List_Node is 
    record
      Its_Value : Integer;
      Its_Next : Node_Ptr;
    end record;
  type List is
    record
      Its_First : Node_Ptr;
      Its_Last : Node_Ptr;
      Its_Length : Integer;
    end record;

end List_Package;

]0;chan@chan:~/Sources/school/214/projects/09/ada[chan@chan ada]$ cat list_package.adb
-- list_package.adb defines Ada linked list operations.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Chan Kim (ck45)
-- Date: 4/16/2018
-------------------------------------------------------

with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

package body List_Package is

  -----------------------------------------------------
  -- Initialize a list                                -
  -- Receive: aList, a List.                          -
  -- Pre: aList is uninitialized.                     -
  -- Post: aList%itsFirst == aList%itsLast == NULL && -
  --        aList%itsLength == 0.                     -
  -----------------------------------------------------
  procedure Init(A_List : out List) is
  begin
    A_List.Its_First := null;
    A_List.Its_Last := null;
    A_List.Its_Length := 0;
  end Init;

  ------------------------------------------------
  -- Is a list empty?                            -
  -- Receive: aList, a List.                     -
  -- Return: true, iff aList contains no values. -
  ------------------------------------------------
  function Empty(A_List : in List) return Boolean is
  begin
    return A_List.Its_Length = 0;
  end Empty;

  -------------------------------------
  -- How many values are in a list?   -
  -- Receive: aList, a List.          -
  -- Return: aList%itsLength.         -
  -------------------------------------
  function Length(A_List : in List) return Integer is
  begin
    return A_List.Its_Length;
  end Length;

  ----------------------------------------
  -- Append a value to a list.           -
  -- Receive: aValue, an integer,        -
  -- Passback: aList, containing aValue. -
  ----------------------------------------
  procedure Append(A_Value : in Integer; A_List : in out List) is
    Temp_Ptr : constant Node_Ptr := new List_Node;
  begin
    Temp_Ptr.Its_Value := A_Value;
    Temp_Ptr.Its_Next := null;

    if A_List.Its_Length = 0 then
       A_List.Its_First := Temp_Ptr;
    else
       A_List.Its_Last.Its_Next := Temp_Ptr;
    end if;

    A_List.Its_Last := Temp_Ptr;

    A_List.Its_Length := A_List.Its_Length + 1;
  end Append;

  -------------------------------------
  -- Display the values in a list.    -
  -- Receive: aList, a List.          -
  -- Output: the values in aList.     -
  -------------------------------------

  -- replace this line with the definition of Put()
  procedure Put(A_List : in List) is
    Temp_Ptr : Node_Ptr := A_List.Its_First;
  begin
    while Temp_Ptr /= null loop
      Put(' '); Put(Temp_Ptr.Its_Value);
      Temp_Ptr := Temp_Ptr.Its_Next;
    end loop;
  end Put;
  ---------------------------------------
  -- Find the maximum value in a list.  -
  -- Receive: aList, a List.            -
  -- Return: the maximum value in aList.-
  ---------------------------------------

  -- replace this line with the definition of Max()
  function Max(A_List : List) return Integer is
    Temp_Ptr : Node_Ptr := A_List.Its_First;
    Max_Value : Integer := -999999;
  begin
    while Temp_Ptr /= null loop
      if Temp_Ptr.Its_Value > Max_Value then
        Max_Value := Temp_Ptr.Its_Value;
      end if;
      Temp_Ptr := Temp_Ptr.Its_Next;
    end loop;
    return Max_Value;
  end Max;
  ---------------------------------------
  -- Receive: aList, a list of integers; and
  --          aValue, an integer.
  -- Return: the position of aValue within aList, if aValue is present in aList;
  --         -1, otherwise.
  ---------------------------------------

  function search(A_List : List; A_Value : Integer) return Integer is
    Temp_Ptr : Node_Ptr := A_List.Its_First;
    count : Integer := 0;
  begin
    while Temp_Ptr /= null loop
      if Temp_Ptr.Its_Value = A_Value then
        return count;
      end if;
      Temp_Ptr := Temp_Ptr.Its_Next;
      count := count + 1;
    end loop;
    return -1;
  end search;

end List_Package;

]0;chan@chan:~/Sources/school/214/projects/09/ada[chan@chan ada]$ ls
[0m[01;32madaMax[0m  list_package.adb  list_package.ads  list_package.ali  list_package.o  Makefile  max.adb  max.ali  max.o  script.ada
]0;chan@chan:~/Sources/school/214/projects/09/ada[chan@chan ada]$ cat max.d[Kadb 
-- max.adb finds the max of a list of integers. 
-- 
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Chan Kim (ck45)
-- Date: 4/16/2018
-------------------------------------------------- 
 
with Ada.Text_IO, Ada.Integer_Text_IO, List_Package; 
use Ada.Text_IO, Ada.Integer_Text_IO, List_Package; 
 
procedure Max is 
                              -- define 4 lists 
  List1, List2, List3, List4 : List; 
 
begin 
  Init(List1);                -- initialize them 
  Init(List2); 
  Init(List3); 
  Init(List4);
 
  Append(99, List1);          -- 99, 88, 77, 66, 55 
  Append(88, List1);          -- max is first 
  Append(77, List1); 
  Append(66, List1); 
  Append(55, List1); 
 
  Append(55, List2);          -- 55, 66, 77, 88, 99 
  Append(66, List2);          -- max is last 
  Append(77, List2); 
  Append(88, List2); 
  Append(99, List2); 
 
  Append(55, List3);          -- 55, 77, 99, 88, 66 
  Append(77, List3);          -- max is in the middle 
  Append(99, List3); 
  Append(88, List3); 
  Append(66, List3); 

  Append(44, List4);          -- 44, 55, 66, 77, 88
  Append(55, List4);          -- max is last  
  Append(66, List4);          
  Append(77, List4); 
  Append(88, List4);

  Put(List1); New_Line;       -- output the 4 lists 
  Put(List2); New_Line; 
  Put(list3); New_Line; 
  Put(list4); New_Line; 
                              -- display their maxima 
  Put("The maximum value in list 1 is ");  
  Put( Max(List1) ); 
  New_Line; 
  Put("The maximum value in list 2 is "); 
  Put( Max(List2) );
  New_Line; 
  Put("The maximum value in list 3 is ");
  Put( Max(List3) );
  New_Line; 
  Put("The maximum value in list 4 is ");
  Put( Max(List4) );
  New_Line;   

   Put("The position of 99 within list1: ");  
  Put( search(List1, 99) ); 
  New_Line; 
  Put("The position of 99 within list2: "); 
  Put( search(List2, 99) );
  New_Line; 
  Put("The position of 99 within list3: ");
  Put( search(List3, 99) );
  New_Line; 
  Put("The position of 99 within list4: ");
  Put( search(List4, 99) );
  New_Line;  
 
end Max; 

]0;chan@chan:~/Sources/school/214/projects/09/ada[chan@chan ada]$ ls
[0m[01;32madaMax[0m  list_package.adb  list_package.ads  list_package.ali  list_package.o  Makefile  max.adb  max.ali  max.o  script.ada
]0;chan@chan:~/Sources/school/214/projects/09/ada[chan@chan ada]$ make
gcc -c -Wall max.adb
gcc -c -Wall list_package.adb
gnatbind  max.ali
gnatlink  max.ali -o adaMax
]0;chan@chan:~/Sources/school/214/projects/09/ada[chan@chan ada]$ ./adaMax 
          99          88          77          66          55
          55          66          77          88          99
          55          77          99          88          66
          44          55          66          77          88
The maximum value in list 1 is          99
The maximum value in list 2 is          99
The maximum value in list 3 is          99
The maximum value in list 4 is          88
The position of 99 within list1:           0
The position of 99 within list2:           4
The position of 99 within list3:           2
The position of 99 within list4:          -1
]0;chan@chan:~/Sources/school/214/projects/09/ada[chan@chan ada]$ exit
exit

Script done on 2018-04-16 11:52:27-0400
