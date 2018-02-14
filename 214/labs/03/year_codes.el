;;; year_codes.el is a driver for function yearCode.
;;; Begun by: Dr. Adams, for CS 214 at Calvin College.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; yearCode returns the code for a given academic year.                 ;;;
;;; Receive: year, a string.                                             ;;;
;;; Precondition: year is one of {freshman, sophomore, junior or senior}.;;;
;;; Return: the integer code corresponding to year.                      ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Replace this line with the definition of function yearCode().

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

(yearCode "junior")

