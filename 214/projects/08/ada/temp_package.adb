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

end temp_package;