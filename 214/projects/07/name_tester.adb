-- namer.adb "test-drives" the Name type.
-- Begun by: Prof. Adams, CS 214 at Calvin College.
-- Completed by: Chan Kim (ck45)
-- Date: 4/3/2018
----------------------------------------------

with Ada.Text_IO; use Ada.Text_IO;

procedure name_tester is

  -- replace this line with the definition of NAME_SIZE
  NAME_SIZE : constant Integer := 10;
  -- replace this line with the definition of Name
  type Name is
    record
      myFirst, myMiddle, myLast : String(1..NAME_SIZE);
    end record;

  aName : Name ;

  ----------------------------------------------
  -- Init initializes a Name variable          -
  -- Receive: theName, the Name variable;      -
  --          First, the first name;           -
  --          Middle, the middle name;         -
  --          Last, the last name.             -
  -- Return: theName, its fields set to First, -
  --               Middle, and Last.           -
  ----------------------------------------------

  -- replace this line with the definition of Init()
  procedure  Init(TheName: out Name; First, Middle, Last : in String) is
  begin
    TheName.myFirst := First;
    TheName.myMiddle := Middle;
    TheName.myLast := Last;
  end Init;

  ----------------------------------------------
  -- getFirst(Name) retrieves Name.myFirst        -
  -- Receive: theName, a Name.                 -
  -- PRE: theName has been initialized.        -
  -- Return: theName.myFirst.                  -
  ----------------------------------------------

  -- replace this line with the definition of getFirst()
  function getFirst (TheName : in Name) return String is
  begin
    return TheName.myFirst;
  end getFirst;

  -- replace this line with the doc and def of getMiddle()
  function getMiddle (TheName : in Name) return String is
  begin
    return TheName.myMiddle;
  end getMiddle;

  -- replace this line with the doc and def of getLast()
  function getLast (TheName : in Name) return String is
  begin
    return TheName.myLast;
  end getLast;

  -----------------------------------------------
  -- getFullName(Name) retrieves Name as a String  -
  -- Receive: theName, a Name.                  -
  -- PRE: theName has been initialized.         -
  -- Return: a String representation of theName -
  -----------------------------------------------

  -- replace this line with the definition of getFullName()
  function getFullName (TheName : in Name) return String is
  begin
    return TheName.myFirst & " " & TheName.myMiddle & " " & TheName.myLast;
  end getFullName;

    ----------------------------------------------
  -- setFirst(Name) sets Name.myFirst        -
  -- Receive: theName, a Name.                 -
  -- PRE: theName has been initialized.        -
  -- Return: theName.myFirst.                  -
  ----------------------------------------------

  procedure setFirst (TheName: out Name; First : in String) is
  begin
    TheName.myFirst := First;
  end setFirst;

    ----------------------------------------------
  -- setMiddle(Name) sets Name.myMiddle        -
  -- Receive: theName, a Name.                 -
  -- PRE: theName has been initialized.        -
  -- Return: theName.myMiddle.                  -
  ----------------------------------------------

  procedure setMiddle (TheName: out Name; Middle : in String) is
  begin
    TheName.myMiddle := Middle;
  end setMiddle;

    ----------------------------------------------
  -- setLast(Name) sets Name.myLast        -
  -- Receive: theName, a Name.                 -
  -- PRE: theName has been initialized.        -
  -- Return: theName.myLast.                  -
  ----------------------------------------------

  procedure setLast (TheName: out Name; Last : in String) is
  begin
    TheName.myLast := Last;
  end setLast;

  -----------------------------------------------
  -- lfmi(Name) returns a full Name as L-F-M[0] order  -
  -- Receive: theName, a Name.                  -
  -- PRE: theName has been initialized.         -
  -- Return: a String representation of L-F-M[0] -
  -----------------------------------------------

  function lfmi (TheName : in Name) return String is
  begin
    return TheName.myLast & ", " & TheName.myFirst & " " & TheName.myMiddle(TheName.myMiddle'First) & ".";
  end lfmi;

  ----------------------------------------------
  -- Put(Name) displays a Name value.          -
  -- PRE: theName has been initialized.        -
  -- Receive: theName, a Name.                 -
  -- Output: theName, to the screen.           -
  ----------------------------------------------

  -- replace this line with the definition of Put()
  procedure Put (TheName : in Name) is
  begin
    Put (getFullName(aName));
  end Put;

  ----------------------------------------------
  -- read(Name) sets a Name variable with user inputs          -
  -- Receive: theName, the Name variable;      -
  -- Return: theName, its fields set to First, -
  --               Middle, and Last.           -
  ----------------------------------------------

  procedure read (TheName : in out Name) is
  First, Middle, Last : String(1..10);
  begin
    Put("Enter the first name...");
    get(First);     
    TheName.myFirst := First;
    Put("Enter the middle name...");
    get(Middle);
    TheName.myMiddle := Middle;
    Put("Enter the last name...");
    get(Last);          
    TheName.myLast := Last; 
  end read;

begin
   Init(aName, "John      ", "Paul      ", "Jones     ");

   pragma Assert( getFirst(aName) = "John      ", "getFirst() failed");
   pragma Assert( getMiddle(aName) = "Paul      ", "getMiddle() failed");
   pragma Assert( getLast(aName) = "Jones     ", "getLast() failed");
   pragma Assert( getFullName(aName) = "John       Paul       Jones     ", 
                    "getFullName() failed");

   Put(aName); New_line;
  -- test for the result of project 7
   setFirst(aName, "Dwight    ");
   pragma Assert( getFirst(aName) = "Dwight    ", "getFirst() failed");  
   setMiddle(aName, "David     ");
   pragma Assert( getMiddle(aName) = "David     ", "getMiddle() failed");   
   setLast(aName, "Eisenhower");
   pragma Assert( getLast(aName) = "Eisenhower", "getLast() failed");
   pragma Assert( getFullName(aName) = "Dwight     David      Eisenhower", 
                    "getFullName() failed");
   pragma Assert( lfmi(aName) = "Eisenhower, Dwight     D.", 
                    "lfmi() failed");
   Put(aName); New_line;
   Put(lfmi(aName)); New_line;
   --  type "first     " as the first name, "middle    " as the middle name, and "last      " as the last name for the test.  
   read(aName);
   pragma Assert( getFirst(aName) = "first     ", "getFirst() failed");
   pragma Assert( getMiddle(aName) = "middle    ", "getMiddle() failed");
   pragma Assert( getLast(aName) = "last      ", "getLast() failed");
   pragma Assert( getFullName(aName) = "first      middle     last      ", 
                    "getFullName() failed");
   Put(aName); New_line;
   Put(lfmi(aName)); New_line;   
   Put("All tests passed!"); New_line;

end name_tester;

