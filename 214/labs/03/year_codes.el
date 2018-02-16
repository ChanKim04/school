;;; year_codes.el is a driver for function yearCode.
;;; Begun by: Dr. Adams, for CS 214 at Calvin College.
;;; Completed by: Chan Kim(ck45)
;;; Date: 2/16/2018

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; yearCode returns the code for a given academic year.                 ;;;
;;; Receive: year, a string.                                             ;;;
;;; Precondition: year is one of {freshman, sophomore, junior or senior}.;;;
;;; Return: the integer code corresponding to year.                      ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Replace this line with the definition of function yearCode().
(defun yearCode (y)
  (if (equal y "freshman")
      1
      (if (equal y "sophomore")
	  2
	  (if (equal y "junior")
	      3
	      (if (equal y "senior")
		  4)))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; main function                        ;;;
;;; input: year                          ;;;
;;; output: code corresponding to year   ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun main (year)
 (interactive "sEnter your academic year: ")  ; read year
 (message "%d" (yearCode year)))              ; display its code


;;; Tests...
(main "junior")
"3"

(main "freshman")
"1"


(yearCode "junior")
3

(yearCode "freshman")
1




