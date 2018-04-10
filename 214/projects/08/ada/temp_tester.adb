-- temp_tester.adb "test-drives" the Temp type.
--
-- Prof: Dr. Adams, for CS 214 at Calvin College.
-- Student: Chan Kim (ck45)
-- Date: 4/9/2018
----------------------------------------------

with Ada.Text_IO, temp_package, Ada.Float_Text_IO; 
use Ada.Text_IO, temp_package, Ada.Float_Text_IO;

procedure temp_tester is

  baseTemp, limitTemp : temp_package.Temp;
  stepValue : float;
  scale : character;

begin
  Put("Enter the baseTemp...");
  New_Line;
  read(baseTemp);
  Put("Enter the limitTemp...");
  New_Line;
  read(limitTemp);
  Put("Enter the stepValue: ");  
  Get(stepValue);
  scale := getScale(baseTemp);   
  while ( equals(baseTemp, limitTemp) or less_than(baseTemp, limitTemp)) loop
    setFahrenheit(baseTemp);
    write(baseTemp);
    Put("     ");

    setCelsius(baseTemp);
    write(baseTemp);
    Put("     ");

    setKelvin(baseTemp);
    write(baseTemp);
    New_Line;

    if scale = 'F' then
      setFahrenheit(baseTemp);
    elsif scale = 'C' then
      setCelsius(baseTemp);
    elsif scale = 'K' then
      setKelvin(baseTemp);
    end if;

    raiseTemp(baseTemp, stepValue);
  end loop;
end temp_tester;

