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

end temp_package;