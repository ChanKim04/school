;;; letterGrade.el is a driver for function letter grade.
;;; : Chan Kim(ck45)
;;; Date: 2/16/2018

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; letterGrade returns the letter grade for a given average.            ;;;
;;; Receive: ave, an integer.                                            ;;;
;;; Return: the string of  corresponding to average.                     ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Replace this line with the definition of function yearCode().
(defun letterGrade (ave)
  (cond ((< (/ ave 10) 6) "F")
	((< (/ ave 10) 7) "D")
	((< (/ ave 10) 8) "C")
	((< (/ ave 10) 9) "B")
	((<= (/ ave 10) 10) "A")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; main function                                   ;;;
;;; input: average                                  ;;;
;;; output: letter grade corresponding to average   ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun main (average)
 (interactive "sEnter your academic year: ")  ; read year
 (message "%s" (letterGrade average)))              ; display its code

;;; Tests...
(letterGrade 100)
"A"
(letterGrade 79)
"C"
(letterGrade 39)
"F"
(letterGrade 250)
nil

(main 100)
"A"
(main 89)
"B"
(main 79)
"C"
(main 69)
"D"
(main 59)
"F"
(main 200)
"nil"








