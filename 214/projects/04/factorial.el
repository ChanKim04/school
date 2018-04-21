;;; factorial.el computes a factorial.
;;;
;;; Input: n, one integer.
;;; PRE: n >= 0
;;; Output: A factorial from n inputted value.
;;;
;;; Completed by: Chan Kim (ck45)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; factorial() recursively generates the factorial.                  ;;;
;;; Receive: start and stop, the limit values for the table;          ;;;
;;;             increment, the step value for the table;              ;;;
;;;             buf, the buffer in which to display the table.        ;;;
;;; Output: A factorial from the input value.                         ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun factorial (val i answer)
    (if (<= i val)
        (factorial val (+ i 1) (* answer i))
    (if (> i val)
	(progn (princ val)
	       (princ "! = ")
	       (princ answer)
	       (terpri)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; main is a 'driver' for factorial()                         ;;;
;;; Input: named                                               ;;;
;;; Output: The table of logs from start to stop by increment  ;;;
;;;          in a buffer named 'logTable.out'.                 ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun main (n)
  "print a factorial"
   (interactive "nTo compute n!, enter n: \n")
   (factorial n 2 1))

;;; Test...




























