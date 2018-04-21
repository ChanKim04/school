;;; array.el "test-drives" functions readArray() and printArray().
;;; Output: print the result of array.
;;;
;;; Author: Chan Kim (ck45) for CS 214 at Calvin College
;;; Date: 3/26/2018
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; readArray() is a method that gets values;;
;;;              from user and appends       ;;
;;;              the values into the array.  ;;
;;; Receive: array, an array of numbers;     ;;
;;;          itsSize, its size.              ;;
;;; Return: return the array.                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun readArray(array itsSize)
  (if (> itsSize 0)
      (progn (setq value (make-vector 1 (read)))
	     (princ value)
	     (terpri)
	     (setq Array (vconcat array value))
	     (readArray Array (- itsSize 1)))
    nil)
  Array)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; printArray() is a method that prints the resulting array.;;
;;; Receive: array, an array of numbers; itsSize, its size.  ;;
;;; Return: print the array.                                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun printArray(array itsSize)
  (if (> itsSize 0)
      (progn (setq value (aref array (- itsSize 1)))
	     (princ value)
	     (terpri)
	     (printArray array (- itsSize 1)))
    nil))

(defun main ()
  (princ "How many values are to be in the array? ")
  (setq itsSize (read))
  (princ itsSize)
  (terpri)
  (setq array [])
  (princ "Enter values into the array...\n")
  (setq Array (readArray array itsSize))
  (princ "Print the resulting array...\n")
  (printArray Array itsSize))

;;; Test...
(main)
