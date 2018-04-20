/* Goose.java provides a Goose subclass of Bird.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: Chan Kim (ck45)
 * Date: 4/20/2018
 ******************************************************/

public class Goose extends Bird{

 /* explicit constructor
  * Receive: name, a String 
  * PostCond: myName == name.
  */
   public Goose()
   {
      super();
   }

   public Goose(String name)
   {     
     super(name);
   } 


 /* A Goose's Call
  * Return: a goose-call ("Honk!").
  */

   public String call()
   {
     return "Honk!";
   } 
} 
