/* Max.java finds the maximum values in Java linked lists.
 *
 * Begun by: Dr. Adams, CS 214 at Calvin College.
 * Completed by: Chan Kim (ck45)
 * Date: 4/16/2018
 */

import java.util.LinkedList;
import java.util.Iterator;
import java.util.Collections;

public class Max {

  public static void main(String [] args) {
    // define list1, list2, list3, list4 here ...
    LinkedList<Integer> list1 = new LinkedList<Integer>();
    LinkedList<Integer> list2 = new LinkedList<Integer>();
    LinkedList<Integer> list3 = new LinkedList<Integer>();
    LinkedList<Integer> list4 = new LinkedList<Integer>();

    list1.add(99);    // 99, 88, 77, 66, 55
    list1.add(88);    // max is first
    list1.add(77);
    list1.add(66);  
    list1.add(55);

    list2.add(55);    // 55, 66, 77, 88, 99
    list2.add(66);    // max is last
    list2.add(77);  
    list2.add(88);  
    list2.add(99);  
  
    list3.add(55);    // 55, 77, 99, 88, 66
    list3.add(77);    // max is in the middle
    list3.add(99);  
    list3.add(88);  
    list3.add(66);  

    list4.add(44);    // 44, 55, 66, 77, 88
    list4.add(55);    // max is last
    list4.add(66);
    list4.add(77);  
    list4.add(88);

    print(list1); 
    print(list2); 
    print(list3);
    print(list4);

   // display maxima of the 4 lists...
   System.out.println("Max of list1: " + Collections.max(list1));
   System.out.println("Max of list2: " + Collections.max(list2));
   System.out.println("Max of list3: " + Collections.max(list3));
   System.out.println("Max of list4: " + Collections.max(list4));
  

   System.out.println("The position of 99 within list1: " + search(list1, 99));
   System.out.println("The position of 99 within list2: " + search(list2, 99));
   System.out.println("The position of 99 within list3: " + search(list3, 99));
   System.out.println("The position of 99 within list4: " + search(list4, 99));
   
  }

  /** print() displays a LinkedList on the console.
   *
   * @param: aList, a LinkedList<Integer>
   * 
   * Postcondition: the Integer values in aList
   *                 have been displayed to System.out,
   *                 separated by spaces.
   */
  // replace this line with the definition of print().
  public static void print(LinkedList<Integer> aList)
  {
    Iterator<Integer> listIterator = aList.iterator();
    while (listIterator.hasNext()){
      System.out.print(listIterator.next() + " ");
    }
    System.out.print('\n');
  }

  /*
   * Receive: aList, a list of integers; and
   *         aValue, an integer.
   * Return: the position of aValue within aList, if aValue is present in aList;
   *        -1, otherwise.
   */

  public static Integer search(LinkedList<Integer> aList, Integer aValue)
  {
    Iterator<Integer> listIterator = aList.iterator();
    Integer count = 0;
    while (listIterator.hasNext())
    {
      if (listIterator.next() == aValue)
      {
        return count;
      }
      else
      {
        count++;
      }
    } 
    return -1;
  }
}

