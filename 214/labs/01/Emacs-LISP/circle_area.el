;;; circle_area.el computes the area of a circle. 
;;;                                                                     
;;; Input: The radius of the circle.                                    
;;; Precondition: The radius is a positive number.                      
;;; Output: The area of the circle.                                     
;;; 
;;; Begun by: Dr. Adams, for CS 214 at Calvin College.
;;; Completed by: Chan Kim (ck45)
;;; Date: 1/31/2018
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                   

;;; function circleArea computes a circle's area, given its radius.     
;;; Parameters: r, a number.                                            
;;; Precondition: r >= 0.                                               
;;; Returns: the area of the circle whose radius is r.                   
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                  
(defun circleArea (radius)
  "Compute the area of a circle, passed its radius."
  (defconst PI 3.1415927) ;; set the PI value           
  (* PI (* radius radius))) ;; get the area via the expression with PI and radius value         

(defun circle_area(r)
 "Compute the area of a circle, given its radius interactively."
  (interactive "nEnter a circle's radius: ")        
  (setq area (circleArea r)) ;; get the area via circleArea fuction interactively       
  (message "The circle's area is %f." area)) ;; output the message with the area which gets via circleArea

(circleArea 1)
3.1415927
(circleArea 2)
12.5663708
(circleArea 2.5)
19.634954375
(circleArea 4.99999)
78.53950334104417

(circle_area 1)
"The circle’s area is 3.141593."
(circle_area 2)
"The circle’s area is 12.566371."
(circle_area 2.5)
"The circle’s area is 19.634954."
(circle_area 4.99999)
"The circle’s area is 78.539503."


