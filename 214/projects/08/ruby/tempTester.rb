# tempTester.rb tests class Temp and its operations
#
# Prof: Dr. Adams, for CS 214 at Calvin College.
# Student: Chan Kim (ck45)
# Date: 4/9/2018
####################################################

require './Temp.rb'

def testTemp
        baseTemp = Temps::Temp.new(0.0, 'C')
        baseTemp.read
        limitTemp = Temps::Temp.new(0.0, 'C')
        limitTemp.read
        
        stepValue = gets.to_f

        scale = baseTemp.scale

        while (baseTemp.equals(limitTemp) && baseTemp.less_than(limitTemp)) do
                
                baseTemp.setFahrenheit
                baseTemp.write
                print("\t")
                baseTemp.setCelsius
                baseTemp.write
                print("\t")
                baseTemp.setKelvin
                baseTemp.write
                print("\n")

                if (scale == 'F') then
                        baseTemp.setFahrenheit
                elsif (scale == 'C') then
                        baseTemp.setCelsius
                elsif (scale == 'K') then
                        baseTemp.setKelvin
                end

                baseTemp.raise(stepValue)
        end
end

testTemp

