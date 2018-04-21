Script started on 2018-04-12 20:23:20-0400
]0;chan@chan:~/Sources/school/214/labs/09/java[chan@chan java]$ cat Max.java 
/* Max.java finds the maximum values in Java linked lists.
 *
 * Begun by: Dr. Adams, CS 214 at Calvin College.
 * Completed by: Chan Kim (ck45)
 * Date: 4/13/2018
 */

import java.util.LinkedList;
import java.util.Iterator;
import java.util.Collections;

public class Max {

  public static void main(String [] args) {
    // define list1, list2, list3 here ...
    LinkedList<Integer> list1 = new LinkedList<Integer>();
    LinkedList<Integer> list2 = new LinkedList<Integer>();
    LinkedList<Integer> list3 = new LinkedList<Integer>();

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
  
    print(list1); 
    print(list2); 
    print(list3);

   // display maxima of the 3 lists...
   System.out.println("Max of list1: " + Collections.max(list1));
   System.out.println("Max of list2: " + Collections.max(list2));
   System.out.println("Max of list3: " + Collections.max(list3));
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
}

]0;chan@chan:~/Sources/school/214/labs/09/java[chan@chan java]$ mak[K[K[Kmake
make: 'Max.class' is up to date.
]0;chan@chan:~/Sources/school/214/labs/09/java[chan@chan java]$ java Max 
99 88 77 66 55 
55 66 77 88 99 
55 77 99 88 66 
Max of list1: 99
Max of list2: 99
Max of list3: 99
]0;chan@chan:~/Sources/school/214/labs/09/java[chan@chan java]$ exit
exit

Script done on 2018-04-12 20:23:47-0400
