Script started on 2018-04-09 10:33:38-0400
]0;chan@chan:~/Sources/school/214/projects/08/ada[chan@chan ada]$ ls
Makefile  script.ada        temp_package.ads  temp_package.o  temp_tester.adb  temp_tester.o
[0m[01;34mold[0m       temp_package.adb  temp_package.ali  [01;32mtemp_tester[0m     temp_tester.ali
]0;chan@chan:~/Sources/school/214/projects/08/ada[chan@chan ada]$ lsexitjava TempTester ls[Kcat TempTester.java [6P[C[C[C[C[C[C[5Pmake java[5Pexitcat Temp.java [5Pmake java[5Pexitscript script.javals[Kscript script.javaexit[Kmake javacat Temp.java exit[Kmake javacat Temp.java [6@Tester[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[Cls[Kjava TempTester exit[K[2Pls[Kgcc -c temp_tester.adb
]0;chan@chan:~/Sources/school/214/projects/08/ada[chan@chan ada]$ gcc -c temp_package..adb[K[K[K[Kadb
]0;chan@chan:~/Sources/school/214/projects/08/ada[chan@chan ada]$ gnatbind temp_tester.ali
]0;chan@chan:~/Sources/school/214/projects/08/ada[chan@chan ada]$ gnatlink temp_tester.ali
]0;chan@chan:~/Sources/school/214/projects/08/ada[chan@chan ada]$ ls
Makefile  script.ada        temp_package.ads  temp_package.o  temp_tester.adb  temp_tester.o
[0m[01;34mold[0m       temp_package.adb  temp_package.ali  [01;32mtemp_tester[0m     temp_tester.ali
]0;chan@chan:~/Sources/school/214/projects/08/ada[chan@chan ada]$ ./temp_tester 
Enter the baseTemp...
Enter the degree of temp: 0f 
Enter the scale of temp: f
Enter the limitTemp...
Enter the degree of temp: 100
Enter the scale of temp: c
Enter the stepValue: 2.5
 0.00000E+00 F     -1.77778E+01 C      2.55372E+02 K
 2.49997E+00 F     -1.63889E+01 C      2.56761E+02 K
 4.99991E+00 F     -1.50001E+01 C      2.58150E+02 K
 7.49985E+00 F     -1.36112E+01 C      2.59539E+02 K
 9.99979E+00 F     -1.22223E+01 C      2.60928E+02 K
 1.24997E+01 F     -1.08335E+01 C      2.62316E+02 K
 1.49997E+01 F     -9.44463E+00 C      2.63705E+02 K
 1.74996E+01 F     -8.05578E+00 C      2.65094E+02 K
 1.99995E+01 F     -6.66692E+00 C      2.66483E+02 K
 2.24995E+01 F     -5.27807E+00 C      2.67872E+02 K
 2.49994E+01 F     -3.88921E+00 C      2.69261E+02 K
 2.74994E+01 F     -2.50036E+00 C      2.70650E+02 K
 2.99993E+01 F     -1.11150E+00 C      2.72038E+02 K
 3.24992E+01 F      2.77354E-01 C      2.73427E+02 K
 3.49992E+01 F      1.66621E+00 C      2.74816E+02 K
 3.74991E+01 F      3.05506E+00 C      2.76205E+02 K
 3.99991E+01 F      4.44392E+00 C      2.77594E+02 K
 4.24990E+01 F      5.83277E+00 C      2.78983E+02 K
 4.49989E+01 F      7.22163E+00 C      2.80372E+02 K
 4.74989E+01 F      8.61048E+00 C      2.81760E+02 K
 4.99988E+01 F      9.99934E+00 C      2.83149E+02 K
 5.24987E+01 F      1.13882E+01 C      2.84538E+02 K
 5.49987E+01 F      1.27770E+01 C      2.85927E+02 K
 5.74986E+01 F      1.41659E+01 C      2.87316E+02 K
 5.99986E+01 F      1.55548E+01 C      2.88705E+02 K
 6.24985E+01 F      1.69436E+01 C      2.90094E+02 K
 6.49984E+01 F      1.83325E+01 C      2.91482E+02 K
 6.74984E+01 F      1.97213E+01 C      2.92871E+02 K
 6.99983E+01 F      2.11102E+01 C      2.94260E+02 K
 7.24983E+01 F      2.24990E+01 C      2.95649E+02 K
 7.49982E+01 F      2.38879E+01 C      2.97038E+02 K
 7.74981E+01 F      2.52767E+01 C      2.98427E+02 K
 7.99981E+01 F      2.66656E+01 C      2.99816E+02 K
 8.24980E+01 F      2.80545E+01 C      3.01204E+02 K
 8.49980E+01 F      2.94433E+01 C      3.02593E+02 K
 8.74979E+01 F      3.08322E+01 C      3.03982E+02 K
 8.99978E+01 F      3.22210E+01 C      3.05371E+02 K
 9.24978E+01 F      3.36099E+01 C      3.06760E+02 K
 9.49977E+01 F      3.49987E+01 C      3.08149E+02 K
 9.74977E+01 F      3.63876E+01 C      3.09538E+02 K
 9.99976E+01 F      3.77764E+01 C      3.10926E+02 K
 1.02498E+02 F      3.91653E+01 C      3.12315E+02 K
 1.04997E+02 F      4.05541E+01 C      3.13704E+02 K
 1.07497E+02 F      4.19430E+01 C      3.15093E+02 K
 1.09997E+02 F      4.33319E+01 C      3.16482E+02 K
 1.12497E+02 F      4.47207E+01 C      3.17871E+02 K
 1.14997E+02 F      4.61096E+01 C      3.19260E+02 K
 1.17497E+02 F      4.74984E+01 C      3.20648E+02 K
 1.19997E+02 F      4.88873E+01 C      3.22037E+02 K
 1.22497E+02 F      5.02761E+01 C      3.23426E+02 K
 1.24997E+02 F      5.16650E+01 C      3.24815E+02 K
 1.27497E+02 F      5.30538E+01 C      3.26204E+02 K
 1.29997E+02 F      5.44427E+01 C      3.27593E+02 K
 1.32497E+02 F      5.58316E+01 C      3.28982E+02 K
 1.34997E+02 F      5.72204E+01 C      3.30370E+02 K
 1.37497E+02 F      5.86093E+01 C      3.31759E+02 K
 1.39997E+02 F      5.99981E+01 C      3.33148E+02 K
 1.42497E+02 F      6.13870E+01 C      3.34537E+02 K
 1.44996E+02 F      6.27758E+01 C      3.35926E+02 K
 1.47496E+02 F      6.41647E+01 C      3.37315E+02 K
 1.49996E+02 F      6.55536E+01 C      3.38704E+02 K
 1.52496E+02 F      6.69424E+01 C      3.40092E+02 K
 1.54996E+02 F      6.83313E+01 C      3.41481E+02 K
 1.57496E+02 F      6.97201E+01 C      3.42870E+02 K
 1.59996E+02 F      7.11090E+01 C      3.44259E+02 K
 1.62496E+02 F      7.24978E+01 C      3.45648E+02 K
 1.64996E+02 F      7.38867E+01 C      3.47037E+02 K
 1.67496E+02 F      7.52756E+01 C      3.48426E+02 K
 1.69996E+02 F      7.66644E+01 C      3.49814E+02 K
 1.72496E+02 F      7.80533E+01 C      3.51203E+02 K
 1.74996E+02 F      7.94421E+01 C      3.52592E+02 K
 1.77496E+02 F      8.08310E+01 C      3.53981E+02 K
 1.79996E+02 F      8.22198E+01 C      3.55370E+02 K
 1.82496E+02 F      8.36087E+01 C      3.56759E+02 K
 1.84996E+02 F      8.49975E+01 C      3.58148E+02 K
 1.87496E+02 F      8.63864E+01 C      3.59536E+02 K
 1.89995E+02 F      8.77753E+01 C      3.60925E+02 K
 1.92495E+02 F      8.91641E+01 C      3.62314E+02 K
 1.94995E+02 F      9.05530E+01 C      3.63703E+02 K
 1.97495E+02 F      9.19418E+01 C      3.65092E+02 K
 1.99995E+02 F      9.33307E+01 C      3.66481E+02 K
 2.02495E+02 F      9.47195E+01 C      3.67870E+02 K
 2.04995E+02 F      9.61084E+01 C      3.69258E+02 K
 2.07495E+02 F      9.74972E+01 C      3.70647E+02 K
 2.09995E+02 F      9.88861E+01 C      3.72036E+02 K
]0;chan@chan:~/Sources/school/214/projects/08/ada[chan@chan ada]$ ./temp_tester 
Enter the baseTemp...
Enter the degree of temp: 0
Enter the scale of temp: K
Enter the limitTemp...
Enter the degree of temp: 212
Enter the scale of temp: F
Enter the stepValue: 20.0
-4.59670E+02 F     -2.73150E+02 C     -3.05176E-05 K
-4.23670E+02 F     -2.53150E+02 C      1.99999E+01 K
-3.87670E+02 F     -2.33150E+02 C      3.99999E+01 K
-3.51670E+02 F     -2.13150E+02 C      5.99999E+01 K
-3.15670E+02 F     -1.93150E+02 C      7.99999E+01 K
-2.79670E+02 F     -1.73150E+02 C      9.99998E+01 K
-2.43670E+02 F     -1.53150E+02 C      1.20000E+02 K
-2.07670E+02 F     -1.33150E+02 C      1.40000E+02 K
-1.71670E+02 F     -1.13150E+02 C      1.60000E+02 K
-1.35670E+02 F     -9.31502E+01 C      1.80000E+02 K
-9.96705E+01 F     -7.31503E+01 C      2.00000E+02 K
-6.36705E+01 F     -5.31503E+01 C      2.20000E+02 K
-2.76706E+01 F     -3.31503E+01 C      2.40000E+02 K
 8.32944E+00 F     -1.31503E+01 C      2.60000E+02 K
 4.43294E+01 F      6.84969E+00 C      2.80000E+02 K
 8.03294E+01 F      2.68497E+01 C      3.00000E+02 K
 1.16329E+02 F      4.68497E+01 C      3.20000E+02 K
 1.52329E+02 F      6.68497E+01 C      3.40000E+02 K
 1.88329E+02 F      8.68497E+01 C      3.60000E+02 K
]0;chan@chan:~/Sources/school/214/projects/08/ada[chan@chan ada]$ ex[K[Kls
Makefile  script.ada        temp_package.ads  temp_package.o  temp_tester.adb  temp_tester.o
[0m[01;34mold[0m       temp_package.adb  temp_package.ali  [01;32mtemp_tester[0m     temp_tester.ali
]0;chan@chan:~/Sources/school/214/projects/08/ada[chan@chan ada]$ cat temp_tester.adb
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

]0;chan@chan:~/Sources/school/214/projects/08/ada[chan@chan ada]$ cat temp_package.ads
-- temp_package.ads declares the Temp type and its operations.
--
-- Prof: Dr. Adams, for CS 214 at Calvin College.
-- Student: Chan Kim (ck45)
-- Date: 4/9/2018
--------------------------------------------------------------

package temp_package is

  type Temp is private;
  procedure Init(Tm: out Temp; degrees: in float; scale: in character);
  function isValid(degrees: in float; scale: in character) return boolean;
  function getDegrees( Tm: in Temp) return float;
  function getScale( Tm: in Temp) return character;
  procedure setFahrenheit( Tm: in out Temp);
  procedure setCelsius( Tm: in out Temp);
  procedure setKelvin( Tm: in out Temp);
  procedure read ( Tm: out Temp);
  procedure raiseTemp ( Tm: in out Temp; degrees: in float);
  procedure lower( Tm: in out Temp; degrees: in float);
  function equals( baseTemp: in Temp; limitTemp: in Temp) return boolean;
  function less_than( baseTemp: in Temp; limitTemp: in Temp) return boolean;
  procedure write( Tm: in Temp);

private 

  type Temp is
      record
         myDegrees : float;
         myScale : character;
      end record;

end temp_package;]0;chan@chan:~/Sources/school/214/projects/08/ada[chan@chan ada]$ cat temp_package.adb
-- name_package.adb defines operations for the Name type.
--
-- Prof: Dr. Adams, for CS 214 at Calvin College.
-- Student: Chan Kim (ck45)
-- Date: 4/9/2018
---------------------------------------------------------

with Ada.Text_IO, Ada.Characters.Handling, Ada.Float_Text_IO; 
use Ada.Text_IO, Ada.Characters.Handling, Ada.Float_Text_IO;

package body temp_package is

  ----------------------------------------------
  -- Init initializes a Temp variable          
  -- Receive: Tm, the Temp variable;          
  --          degrees, the degrees ;         
  --          scale, the scale .         
  -- Return: Tm, its fields set to degrees, and scale.     
  ----------------------------------------------

  procedure Init(Tm: out Temp; degrees: in float; scale: in character) is
  capScale : character := To_Upper(scale);
  begin
    if isValid(degrees, capScale) then
      Tm.MyDegrees := degrees;
      Tm.MyScale := capScale;
    else
      Put("Invalid value");
    end if;
  end Init;

  ----------------------------------------------
  -- isValid(degrees, scale) checks the validation.        
  -- Receive: degrees, float; scale, a character.                      
  -- PRE: degrees and scale have been initialized.            
  -- Return: true or false.                     
  ----------------------------------------------

  function isValid(degrees: in float; scale: in character) return boolean is
  begin
    if scale = 'F' then
      if  degrees < -459.67 then
        return false;
      else
        return true;
      end if;
    elsif scale = 'C' then
      if degrees < -273.15 then
        return false;
      else
        return true;
      end if;
    elsif scale = 'K' then
      if degrees < 0.0 then
        return false;
      else
        return true;
      end if;
    else
      return false;
    end if;
  end isValid;
  
  ----------------------------------------------
  -- getDegrees(Temp) retrieves Tm.MyDegrees        
  -- Receive: Tm, a Temp.                      
  -- PRE: Tm has been initialized.            
  -- Return: Tm.MyDegrees.                     
  ----------------------------------------------
  function getDegrees( Tm: in Temp) return float is
  begin
    return Tm.MyDegrees;
  end getDegrees;

  ----------------------------------------------
  -- getScale(Temp) retrieves Tm.MyScale        
  -- Receive: Tm, a Temp.                      
  -- PRE: Tm has been initialized.            
  -- Return: Tm.MyScale.                     
  ----------------------------------------------
  function getScale( Tm: in Temp) return character is
  begin
     return Tm.MyScale;
  end getScale;

  ----------------------------------------------
  -- setFahrenheit(Temp), setCelsius(Temp), setKelvin(Temp)              
  -- Receive: Tm, a Temp.                     
  -- PRE: Tm has been initialized.             
  -- Return: sets to those scales    
  ----------------------------------------------

  procedure setFahrenheit( Tm: in out Temp) is
  begin
    if getScale(Tm) = 'C' then
      Tm.MyDegrees := ((getDegrees(Tm) * 1.8) + 32.0);
      Tm.MyScale := 'F';
    elsif getScale(Tm) = 'K' then
      Tm.MyDegrees := ((getDegrees(Tm) * 1.8) - 459.67);
      Tm.MyScale := 'F';
    end if;
  end setFahrenheit;

  procedure setCelsius( Tm: in out Temp) is
  begin
    if getScale(Tm) = 'F' then
      Tm.MyDegrees := ((getDegrees(Tm) - 32.0) / 1.8);
      Tm.MyScale := 'C';
    elsif getScale(Tm) = 'K' then
      Tm.MyDegrees := (getDegrees(Tm) - 273.15);
      Tm.MyScale := 'C';
    end if;
  end setCelsius;

  procedure setKelvin( Tm: in out Temp) is
  begin
    if getScale(Tm) = 'C' then
      Tm.MyDegrees := (getDegrees(Tm) + 273.15);
      Tm.MyScale := 'K';
    elsif getScale(Tm) = 'F' then
      Tm.MyDegrees := ((getDegrees(Tm) + 459.67) * (5.0/9.0));
      Tm.MyScale := 'K';
    end if;
  end setKelvin;

  ----------------------------------------------
  -- read(Temp) reads Degrees and Scale                
  -- Receive: Tm, a Temp.                     
  -- PRE: Tm has been initialized.             
  -- Return: sets up Degrees and Scale if it is valid 
  --          otherwise prints an invalid message.    
  ----------------------------------------------

  procedure read ( Tm: out Temp) is
  Degrees : float;
  Scale : character;
  capScale : character;
  begin
    Put("Enter the degree of temp: ");
    Get(Degrees);
    Put("Enter the scale of temp: ");
    Get(Scale);
    capScale := To_Upper(Scale);
    if isValid(Degrees, capScale) then
      Tm.MyDegrees := Degrees;
      Tm.MyScale := capScale;
    else
      Put("Invalid value");
    end if;    
  end read;

  ----------------------------------------------
  -- raiseTemp(Temp, degrees) incriments degrees                  
  -- Receive: Tm, a Temp; degrees, float.                     
  -- PRE: Tm and degrees have been initialized.             
  -- Return: incriments degrees otherwise prints an invalid message.    
  ----------------------------------------------

  procedure raiseTemp ( Tm: in out Temp; degrees: in float) is
  begin
    Tm.MyDegrees := Tm.MyDegrees + degrees;
  end raiseTemp;

  ----------------------------------------------
  -- lower(Temp, degrees) decriments degrees                  
  -- Receive: Tm, a Temp; degrees, float.                     
  -- PRE: Tm and degrees have been initialized.             
  -- Return: decriments degrees otherwise prints an invalid message.    
  ----------------------------------------------

  procedure lower( Tm: in out Temp; degrees: in float) is
  begin
    if isValid((Tm.MyDegrees - degrees), Tm.MyScale) then
      Tm.MyDegrees := Tm.MyDegrees - degrees;
    else
      Put("Invalid value");
    end if;
  end lower;

  ----------------------------------------------
  -- equals(Temp, Temp) retrieves baseTemp = limitTemp        
  -- Receive: baseTemp, a Temp; limitTemp, a Temp.                      
  -- PRE: baseTemp and limitTemp have been initialized.            
  -- Return: true or false.                     
  ----------------------------------------------

  function equals( baseTemp: in Temp; limitTemp: in Temp) return boolean is
  newBaseTemp, newLimitTemp : Temp;
  begin
    Init(newBaseTemp, getDegrees(baseTemp), getScale(baseTemp));
    Init(newLimitTemp, getDegrees(limitTemp), getScale(limitTemp));
    setCelsius(newBaseTemp);
    setCelsius(newLimitTemp);
    if getDegrees(newLimitTemp) = getDegrees(newBaseTemp) then
      return true;
    else
      return false;
    end if;
  end equals;

  ----------------------------------------------
  -- less_than(Temp, Temp) retrieves baseTemp < limitTemp        
  -- Receive: baseTemp, a Temp; limitTemp, a Temp.                      
  -- PRE: baseTemp and limitTemp have been initialized.            
  -- Return: true or false.                     
  ----------------------------------------------

  function less_than( baseTemp: in Temp; limitTemp: in Temp) return boolean is
  newBaseTemp, newLimitTemp : Temp;
  begin
    Init(newBaseTemp, getDegrees(baseTemp), getScale(baseTemp));
    Init(newLimitTemp, getDegrees(limitTemp), getScale(limitTemp));
    setCelsius(newBaseTemp);
    setCelsius(newLimitTemp);
    if getDegrees(newLimitTemp) > getDegrees(newBaseTemp) then
      return true;
    else
      return false;
    end if;
  end less_than;  

  ----------------------------------------------
  -- write(Temp) writes Temp                   
  -- Receive: Tm, a Temp.                      
  -- PRE: Tm has been initialized.             
  -- Return: prints Temp.                      
  ----------------------------------------------
  procedure write( Tm: in Temp) is
  begin
    Put(getDegrees(Tm));
    Put(" ");
    Put(getScale(Tm));
  end write;

end temp_package;]0;chan@chan:~/Sources/school/214/projects/08/ada[chan@chan ada]$ exit
exit

Script done on 2018-04-09 10:35:57-0400
