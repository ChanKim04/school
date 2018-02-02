;;; rectangle_area.el computes the area of a rectangle. 
;;;                                                                     
;;; Input: The width and height of the rectangle.                                    
;;; Precondition: The width and height are positive numbers.                      
;;; Output: The area of the rectangle.                                     
;;; 
;;; Begun by: Chan Kim, for CS 214 at Calvin College.
;;; Completed by: Chan Kim(ck45)
;;; Date: 1/31/2018
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                   

;;; function rectangleArea computes a rectangle's area, given its width and height.     
;;; Parameters: w and h, a number.                                            
;;; Precondition: w and h >= 0.                                               
;;; Returns: the area of the rectangle whose width and height are w and h.                   
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                  
(defun rectangleArea (width height)
  "Compute the area of a rectangle, passed its width and height."         
  (* width height)) ;; get the area         

(defun rectangle_area (w h)
 "Compute the area of a rectangle, given its width and height interactively."
  (interactive "nEnter a circle's radius: ")        
  (setq area (rectangleArea w h)) ;; get the area from rectnagleArea interactively     
  (message "The circle's area is %f." area)) ;; output the message with the area from rectangleArea

(rectangleArea 1 2)
2
(rectangleArea 2 2)
4
(rectangleArea 2 3)
6

(rectangle_area 1 2)
"The circle’s area is 2.000000."
(rectangle_area 2 2)
"The circle’s area is 4.000000."
(rectangle_area 2 3)
"The circle’s area is 6.000000."







