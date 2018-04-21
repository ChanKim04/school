;;; mylist.el is a "module" of list operations.
;;;
;;; Begun by: Dr. Adams, CS 214 at Calvin College.
;;; Completed by: Chan Kim (ck45)
;;; Date: 4/16/2018

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Max2 finds the maximum of two values.       ;;
;;; Receive: val1, val2, two values.            ;;
;;; PRE: val1 and val2 can be compared using <. ;;
;;; Return: the maximum of val1 and val2.       ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun Max2 (val1 val2)
  (if (> val1 val2)
      val1
    val2))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Max finds the maximum value in a list.         ;;
;;; Receive: aList, a list of values.              ;;
;;; PRE: values in aList can be compared using <.  ;;
;;; Return: the maximum value in aList.            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun Max (aList)
  (if (listp aList)
      (progn
        (if (equal (length aList) 0) nil
	(if (equal (length aList) 1)
	  (car aList)
	(Max2 (car aList) (Max (cdr aList))))))
    nil))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Search2 finds the aValue in a list.         ;;
;;; Receive: aList, a list of integers;         ;;
;;;   aValue, an integer; and count, an integer.;;
;;; Return: the position of aValue within aList,;; 
;;;if aValue is present in aList; -1, otherwise.;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun Search2 (aList aValue count)
  (if (equal (car aList) aValue) count
  (if (equal (length aList) 0) -1
    (Search2 (cdr aList) aValue (+ count 1)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Search finds the aValue in a list.             ;;
;;; Receive: aList, a list of integers;            ;;
;;;           and aValue, an integer.              ;;
;;; Return: the position of aValue within aList,   ;; 
;;;   if aValue is present in aList; -1, otherwise.;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun Search (aList aValue)
  (if (listp aList)
    (progn
      (if (equal (length aList) 0) -1
      (Search2 aList aValue 0)))
    nil))