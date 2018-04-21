# Temp.rb implements class Temp.
#
# Prof: Dr. Adams, for CS 214 at Calvin College.
# Student: Chan Kim (ck45)
# Date: 4/9/2018
####################################################

module Temps

    class Temp

        ####################################################
        # initialize(degrees, scale) initializes a Temp variable          
        # Receive: degrees, the degrees ;         
        #          scale, the scale .         
        # Return: set to degrees, and scale if it is valid.
        ####################################################

        def initialize(degrees, scale)
            if (isValid(degrees, scale.upcase)) then
                @degrees, @scale = degrees, scale.upcase
            else
                print "Invalid value"
            end
        end

        attr_reader :degrees, :scale

        ####################################################
        # isValid(degrees, scale) checks the validation.        
        # Receive: degrees, float; scale, a character.                      
        # PRE: degrees and scale have been initialized.            
        # Return: true or false.
        ####################################################

        def isValid(degrees, scale)
            if (scale == 'F') then
                if (degrees < -459.67)
                    return false;
                else
                    return true;
                end
            elsif (scale == 'C') then
                if (degrees < -273.15)
                    return false;
                else
                    return true;
                end
            elsif (scale == 'K') then
                if (degrees < 0.0)
                    return false;
                else
                    return true;
                end
            else
                return false;
            end
        end

        ####################################################
        # setFahrenheit(), setCelsius(), setKelvin()                                  
        # PRE: degrees and scale have been initialized.             
        # Return: sets to those scales    
        ####################################################

        def setFahrenheit()
            if (@scale == 'C')
                @degrees = ((@degrees * 1.8) + 32.0)
                @scale = 'F'
            elsif (@scale == 'K')
                @degrees = ((@degrees * 1.8) - 459.67)
                @scale = 'F'
            end
        end

        def setCelsius()
            if (@scale == 'F')
                @degrees = ((@degrees - 32.0) / 1.8)
                @scale = 'C'
            elsif (@scale == 'K')
                @degrees = (@degrees - 273.15)
                @scale = 'C'
            end
        end

        def setKelvin()
            if (@scale == 'C')
                @degrees = (@degrees + 273.15)
                @scale = 'K'
            elsif (@scale == 'F')
                @degrees = ((@degrees + 459.67) * (5.0/9.0))
                @scale = 'K'
            end
        end

        ####################################################
        # read() reads degrees and scale                                     
        # Return: sets up degrees and scale if it is valid 
        #          otherwise prints an invalid message. 
        ####################################################

        def read()
            values = gets
            parts = values.split(" ")
            degrees = parts[0].to_f
            scale = parts[1].to_s
            if (isValid(degrees, scale.upcase)) then
                @degrees, @scale = degrees, scale.upcase
            else
                print "Invalid value"
            end
        end
        
        ####################################################
        # raiseTemp(degree) incriments degrees                  
        # Receive: degree, number.                     
        # PRE: degrees has been initialized.             
        # Return: incriments degrees otherwise prints an invalid message.
        ####################################################
        
        def raise(degree)
            @degrees = @degrees + degree
        end

        ####################################################
        # lower(degree) decriments degrees                  
        # Receive: degree, number.                     
        # PRE: degrees has been initialized.               
        # Return: decriments degrees otherwise prints an invalid message. 
        ####################################################

        def lower(degree)
            if (isValid((@degrees - degree), @scale)) then
                @degrees = @degrees - degree
            else
                print "Invalid value"
            end            
        end

        ####################################################
        # equals(temp) retrieves baseTemp = limitTemp        
        # Receive: temp, a Temp.                      
        # PRE: baseTemp and limitTemp have been initialized.            
        # Return: true or false. 
        ####################################################

        def equals(temp)
            temp.setCelsius
            setCelsius
            if (temp.degrees == @degrees) then
                return false;
            else
                return true;
            end
        end

        ####################################################
        # less_than(temp) retrieves baseTemp < limitTemp        
        # Receive: temp, a Temp.                      
        # PRE: baseTemp and limitTemp have been initialized.            
        # Return: true or false. 
        ####################################################

        def less_than(temp)
            temp.setCelsius
            setCelsius
            if (temp.degrees > @degrees) then
                return true;
            else
                return false;
            end
        end            
        ####################################################
        # write() writes Temp                                       
        # PRE: degrees has been initialized.           
        # Return: prints Temp.                     
        ####################################################

        def write()
            print @degrees.to_s + " " + @scale
        end
    end
end