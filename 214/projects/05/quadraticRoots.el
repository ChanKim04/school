;;; quadraticRoots.el is a class and program that computes the quadratic formula
;;; and gives two roots. If the values are invalid, it gives messages.
;;;
;;; Completed by: Chan Kim (ck45), for CS 214 at Calvin College.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;:;
;;; quadraticRoots() computes the quadratic formula.  
;;; Receive: 	a - the first part of equation 
;;;             b - the sum of outer & inner part of equation    
;;;             c - the last part of equation                
;;; PRE: a, b, and c are number.
;;;      a =! 0; (b^2 -4ac) > 0.
;;; Return: an array of numbers in which to place results
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun quadraticRoots(a b c)
    (setq arg (- (* b b) (* 4 a c)))
    (if (/= a 0)
        (if ( >= arg 0)
	    (progn (setq root1 (/ (+ (* -1 b) (sqrt arg)) (* 2 a)))
		   (setq root2 (/ (- (* -1 b) (sqrt arg)) (* 2 a)))
		   (message "The one root of the equation is %d and the other root is %d" root1 root2))
        (message "*** quadraticRoots(): b^2 - 4ac is negative!"))
      (message "*** quadraticRoots(): a is zero!")))

(defun main (a b c)
   "Given an equation of the form: y = ax^2 + bx + c"
  (interactive "\nEnter a(first): \nEnter b(sum of outer & inner): \nEnter c(last): ")
  (quadraticRoots a b c))

;;;Test...

(main 0 0 0)

(main 1 2 100)

(main 1 2 1)

(main 1 7 10)




















    
