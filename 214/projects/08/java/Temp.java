/* Temp.java implements class Name.
 * Prof: Dr. Adams, for CS 214 at Calvin College.
 * Student: Chan Kim (ck45)
 * Date: 4/9/2018
 ************************************************************/

import java.io.*;
import java.util.Scanner;

class Temp {
  
    /*
     * Temp(degrees, scale) initializes a Temp variable          
     * Receive: degrees, the degrees ;         
     *          scale, the scale .         
     * Return: set to degrees, and scale if it is valid 
      *        otherwise prints an invalid message.    
     */
    public Temp(double degrees, char scale) {

        char capScale = Character.toUpperCase(scale);

        if (isValid(degrees, capScale))
        {
            myDegrees = degrees;
            myScale = capScale;
        }
        else
        {
            System.out.println("Invalid value");
        }
    }

    /*
     * isValid(degrees, scale) checks the validation.        
     * Receive: degrees, float; scale, a character.                      
     * PRE: degrees and scale have been initialized.            
     * Return: true or false.     
     */

    public boolean isValid(double degrees, char scale)
    {
        if (scale == 'F')
        {
            if (degrees < -459.67)
            {
                return false;
            }
            else
            {
                return true;
            }
        }
        else if (scale == 'C')
        {
            if (degrees < -273.15)
            {
                return false;
            }
            else
            {
                return true;
            }
        }
        else if (scale == 'K')
        {
            if (degrees < 0.0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }
        else
        {
            return false;
        }                 
    }

    // extractor for first name of a Name object
    public  double getDegrees() {
        return myDegrees;
    }

    // extractor for middle name of a Name object
    public  char getScale() {
        return myScale;
    }

    /*
     * isValid(degrees, scale) checks the validation.        
     * Receive: degrees, float; scale, a character.                      
     * PRE: degrees and scale have been initialized.            
     * Return: true or false.
     */

    public void setFahrenheit()
    {
        if (getScale() == 'C')
        {
            myDegrees = ((getDegrees() * 1.8) + 32.0);
            myScale = 'F';
        }
        else if (getScale() == 'K')
        {
            myDegrees = ((getDegrees() * 1.8) - 459.67);
            myScale = 'F';
        }
    }

    public void setCelsius()
    {
        if (getScale() == 'F')
        {
            myDegrees = ((getDegrees() - 32.0) / 1.8);
            myScale = 'C';
        }
        else if (getScale() == 'K')
        {
            myDegrees = (getDegrees() - 273.15);
            myScale = 'C';
        }
    }

    public void setKelvin()
    {
        if (getScale() == 'C')
        {
            myDegrees = (getDegrees() + 273.15);
            myScale = 'K';
        }
        else if (getScale() == 'F')
        {
            myDegrees = ((getDegrees() + 459.67) * (5.0/9.0));
            myScale = 'K';
        }
    }

    /*
     * read(keyboard) reads degrees and scale   
     * Receive: keyboard, Scanner.
     * PRE: keyboard ahs been initialized.                                  
     * Return: sets up degrees and scale if it is valid 
     *          otherwise prints an invalid message.    
    */

    public void read(Scanner keyboard)
    {
        String values = keyboard.nextLine();
        String [] parts = values.split(" ");
        double degrees = Double.parseDouble(parts[0]);
        char scale = parts[1].charAt(0);
        char capScale = Character.toUpperCase(scale);
        if (isValid(degrees, capScale))
        {
            myDegrees = degrees;
            myScale = capScale;
        }
        else
        {
            System.out.println("Invalid value");
        }    
    }

    /*
     * raise(degree) incriments degrees                  
     * Receive: degree, number.                     
     * PRE: degrees has been initialized.             
     * Return: incriments degrees otherwise prints an invalid message.    
    */

    public void raise(double degrees)
    {
        myDegrees = myDegrees + degrees;
    }

    /*
     * lower(degree) decriments degrees                  
     * Receive: degree, number.                     
     * PRE: degrees has been initialized.               
     * Return: decriments degrees otherwise prints an invalid message. 
    */

    public void lower(double degrees)
    {
        double Degrees = myDegrees - degrees;
        if (isValid(Degrees, myScale))
        {
            myDegrees = Degrees;
        }
        else
        {
            System.out.println("Invalid value");
        }          
    }

    /*
     * equals(temp) retrieves baseTemp = limitTemp        
     * Receive: temp, a Temp.                      
     * PRE: baseTemp and limitTemp have been initialized.            
     * Return: true or false. 
    */
    public boolean equals(Temp temp)
    {
        temp.setCelsius();
        setCelsius();
        if (temp.getDegrees() == getDegrees())
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    /*
     * less_than(temp) retrieves baseTemp < limitTemp        
     * Receive: temp, a Temp.                      
     * PRE: baseTemp and limitTemp have been initialized.            
     * Return: true or false.     
    */

    public boolean less_than(Temp temp)
    {
        temp.setCelsius();
        setCelsius();
        if (temp.getDegrees() > getDegrees())
        {
            return true;
        }
        else
        {
            return false;
        }        
    }    

    /*
     * toString() retrieves Temp as a String                                       
     * PRE: temp has been initialized.           
     * Return: a String representation of Temp.      
    */

    public String toString() {
        return Double.toString(myDegrees) + ' ' + Character.toString(myScale);
    }

    // private instance variables
    private double myDegrees;
    private char myScale;  
    }

